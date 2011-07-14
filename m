Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QhAlw-00018Z-Ku
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jul 2011 03:31:25 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6E1RP4U019915
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2011 18:27:25 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 13 Jul 2011 18:27:24 -0700
Message-ID: <4E1E45FB.201@windriver.com>
Date: Wed, 13 Jul 2011 20:27:23 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <4E1DD44D.8020307@matrix-vision.de>
In-Reply-To: <4E1DD44D.8020307@matrix-vision.de>
Subject: Re: angstrom: glibc: Using config files in /etc/ld.so.conf.d/
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
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
X-List-Received-Date: Thu, 14 Jul 2011 01:31:25 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 7/13/11 12:22 PM, Howard D. Gray wrote:
> Hi,
> 
> IMHO it would be useful if packages could install their own *.conf files
> in  /etc/ld.so.conf.d/ so that non-standard directories could also be
> used for libraries. Many other distributions allow this by using an
> "include" line in /etc/ld.so.conf.
> 
> Is there any reason for not doing it like this, for example, and then
> letting other packages add *.conf files to the directory as they require ?
> 
> ---
> diff --git a/recipes/glibc/glibc-2.10.1/etc/ld.so.conf
> b/recipes/glibc/glibc-2.10.1/etc/ld.so.conf
> index 46e06d3..c2ae026 100644
> --- a/recipes/glibc/glibc-2.10.1/etc/ld.so.conf
> +++ b/recipes/glibc/glibc-2.10.1/etc/ld.so.conf
> @@ -1,2 +1,3 @@
>  /usr/local/lib
> +include /etc/ld.so.conf.d/*.conf

I agree this is a good idea, however...

If the apps you are creating require ld.so.conf, and thus ldconfig in order to
execute..  then most likely the app in question has a bug..  (I say most likely,
because that is not always true.)

For the systems I work with, my rule of thumb is that everything that goes into
a system directory should never need ldconfig to run...  If it does, it means
there is a broken soname somewhere in the system.

For items that are outside of the standard set of directories, they should have
rpaths embedded (based on the target filesystem) that tell the components how
and where to find their non-standard located components.

(chrpath can do this in many cases..)

Sometimes when using third party binaries that is not possible of course..
However, creating a simple shell wrapper that adds the necessary paths to
LD_LIBRARY_PATH is a good solution.

But, if all else fails, ld.so.conf should work.

IMHO all of the alternatives are better approaches because they ensure the apps
and system components work as intended, and don't rely on the crutch of the
dynamic loader cache to be able to find the intended items.  Speed wise, if the
items are in the standard directories there is no performance penalty (thats
I've been able to determine) to -not- have an ld.so.cache on the system.. for
items outside of the standard directories, the penalty is so minor -- and only
occurs on app startup that it still doesn't make sense to me to have an
ld.so.cache...  (it simply takes a lot of disk space, and requires an ldconfig
operation to occur.)

Long story short, I don't mind the suggestion.. but I will look for alternatives
to someone putting in a .conf file over allowing the .conf file any day.

--Mark


