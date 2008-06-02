Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1K37wv-0007J1-KN
	for openembedded-devel@openembedded.org; Mon, 02 Jun 2008 13:11:37 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m52B7Ptn018860
	for <openembedded-devel@openembedded.org>;
	Mon, 2 Jun 2008 12:07:25 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18650-06 for <openembedded-devel@openembedded.org>;
	Mon,  2 Jun 2008 12:07:20 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m52B7Hk8018854
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Mon, 2 Jun 2008 12:07:17 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <4843CCD6.8070601@vollmann.ch>
References: <g1jlpn$f7f$1@ger.gmane.org>  <4843CCD6.8070601@vollmann.ch>
Date: Mon, 02 Jun 2008 12:07:16 +0100
Message-Id: <1212404836.5008.16.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Mon, 02 Jun 2008 11:11:37 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2008-06-02 at 12:35 +0200, Detlef Vollmann wrote:
> But I've run into a fundamental problem with dependency checking:
> for one of our projects we're changing frequently between NPTL
> and linuxthreads for glibc (we'd like to use NPTL for the features,
> but run again and again into problems with NPTL).
> Normally, this change is just a flip of GLIBC_ADDONS in the distro
> config file.  But of course the value of this specific variable
> is not tracked by the dependency checking (which is IMHO correct).
> So what I did is to split the glibc recipes into a linuxthreads
> one and an NPTL one (which was quite some exercise).
> Now I face the problem to separate glibc between "--with-tls"
> and "--without-tls", which would be a change for
> EXTRA_OECONF_glibc-linuxthreads in my distro conf file, but
> again this defeats dependency tracking.  So I would have to
> split glibc(-linuxthreads) again, but I'm a bit reluctant
> to do so...
> 
> One solution for that would be to introduce something like
> use flags, which could be included into the stamp information
> and used for dependency checking.  But there were a number
> of discussions about use flags on this list and there was
> quite some opposition.
> IIRC, this opposition was mainly against the cross-package
> nature of use flags, but we don't need this for dependency
> checking.  What we need is a naming scheme that the dependency
> checker knows about so that it can include specific variables
> into the stamp information, something like
> USE_glibc_ADDONS = "nptl"
> USE_glibc_EXTRA_OECONF = "--with-tls --with-__thread"
> 
> What do people think about this, or is there a completely
> different way to solve the underlying problem?

The correct solution from a bitbake/OE perspective is to have multiple
providers, one for set of options combination and to switch between them
using PREFERRED_PROVIDER.

The biggest challenge you find when doing this is lots of recipes use
${PN} internally and by creating a new package you then need to hardcode
that variable.

Since thats the main barrier to doing this I'd propose trying to remove
that obstacle. We could do this by having:

bitbake.conf:

PKGPN ?= "${PN}"

and then using PKGPN in recipes instead of PN. If you then create a
glibc-some-extra-option you can just add a line which says:

PKGPN = "glibc"

and it should all work. This would also be useful for -sdk and -native
recipes for example which currently have nastier workarounds for this
problem.

Would this solve the problem? Can anyone see a better name than PKGPN?

Regards,

Richard




