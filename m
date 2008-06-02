Received: from [194.158.229.90] (helo=smtp-auth-be-05.sunrise.ch)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dv@vollmann.ch>) id 1K37Rh-0006YD-VF
	for openembedded-devel@openembedded.org; Mon, 02 Jun 2008 12:39:22 +0200
Received: from [192.168.26.12] (212-98-43-140.static.adslpremium.ch
	[212.98.43.140]) (authenticated bits=0)
	by smtp-auth-be-05.sunrise.ch (8.13.1/8.13.5) with ESMTP id
	m52AZDHK008310; Mon, 2 Jun 2008 12:35:14 +0200
Message-ID: <4843CCD6.8070601@vollmann.ch>
Date: Mon, 02 Jun 2008 12:35:02 +0200
From: Detlef Vollmann <dv@vollmann.ch>
User-Agent: Thunderbird 2.0.0.14 (X11/20080502)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <g1jlpn$f7f$1@ger.gmane.org>
In-Reply-To: <g1jlpn$f7f$1@ger.gmane.org>
Subject: Re: BB_STAMP_POLICY
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Jun 2008 10:39:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> 11:37:33 Koen: is BB_STAMP_POLICY documented somewhere?
> 11:37:47 Richard Purdie: Not really
> 11:38:03 Richard Purdie: Takes the values "file" "whitelist" or "full"
> 11:38:35 Richard Purdie: "file" is the traditional behaviour with stamps 
> just checked within a given recipe
> 11:38:46 Richard Purdie: "full" checks all the dependencies are consistent
> 11:39:12 Richard Purdie: "whitelist" allows some packages to be excluded 
> from the stamp checking basically so packages staging can work
Just for info: I've tested "whitelist" pretty extensivly over the past
few weeks and I'm pretty confident that all the bugs are fixed now.

But I've run into a fundamental problem with dependency checking:
for one of our projects we're changing frequently between NPTL
and linuxthreads for glibc (we'd like to use NPTL for the features,
but run again and again into problems with NPTL).
Normally, this change is just a flip of GLIBC_ADDONS in the distro
config file.  But of course the value of this specific variable
is not tracked by the dependency checking (which is IMHO correct).
So what I did is to split the glibc recipes into a linuxthreads
one and an NPTL one (which was quite some exercise).
Now I face the problem to separate glibc between "--with-tls"
and "--without-tls", which would be a change for
EXTRA_OECONF_glibc-linuxthreads in my distro conf file, but
again this defeats dependency tracking.  So I would have to
split glibc(-linuxthreads) again, but I'm a bit reluctant
to do so...

One solution for that would be to introduce something like
use flags, which could be included into the stamp information
and used for dependency checking.  But there were a number
of discussions about use flags on this list and there was
quite some opposition.
IIRC, this opposition was mainly against the cross-package
nature of use flags, but we don't need this for dependency
checking.  What we need is a naming scheme that the dependency
checker knows about so that it can include specific variables
into the stamp information, something like
USE_glibc_ADDONS = "nptl"
USE_glibc_EXTRA_OECONF = "--with-tls --with-__thread"

What do people think about this, or is there a completely
different way to solve the underlying problem?

   Detlef



