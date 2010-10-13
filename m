Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1P66iR-0001X7-Hk
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 21:10:20 +0200
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LA800811T7U3534@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	13 Oct 2010 14:09:36 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 186E114AF64; Wed,
	13 Oct 2010 15:09:30 -0400 (EDT)
Date: Wed, 13 Oct 2010 15:09:30 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20101013190930.GH11514@denix.org>
References: <1286988161-20097-1-git-send-email-bengardiner@nanometrics.ca>
	<i94r56$spo$1@dough.gmane.org>
	<AANLkTinY4ObZCkhW_tND0R=p308v6R957YF=7-GTO1=1@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <AANLkTinY4ObZCkhW_tND0R=p308v6R957YF=7-GTO1=1@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.5
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,WEIRD_PORT
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: [PATCH] [PATCH] distro: make TARGET_VENDOR a weak	assignment to enable external-csl
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
X-List-Received-Date: Wed, 13 Oct 2010 19:10:20 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Oct 13, 2010 at 02:37:33PM -0400, Ben Gardiner wrote:
> My apologies, Victor, for duplicating your efforts. I was
> simultaneously preparing this patch on the 8th.
> 
> On Wed, Oct 13, 2010 at 1:44 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > On 13-10-10 18:42, Ben Gardiner wrote:
> >> Trying to use an external toolchain like the 2009q1 toolchain from codesourcery
> >> has some strange results since the toolchain has vendor 'none' but
> >> distributions like angstrom set TARGET_VENDOR unconditionally.
> >>
> >> This changeset makes all assignments of TARGET_VENDOR in distros weak as was
> >> suggested by Denys Dmytriyenko in a recent mailing list discussion [1].
> >
> > Well, not 2 days ago this idea was shot down:
> > http://thread.gmane.org/gmane.comp.handhelds.openembedded/37918
> 
> Thank you, Koen, for pointing me to the recent discussion. I tried to
> modify the toolchain-external.inc -- as you suggested in that thread
> -- so that TARGET_VENDOR could be set by a TOOLCHAIN_VENDOR variable:
> 
> diff --git a/conf/distro/include/toolchain-external.inc
> b/conf/distro/include/toolchain-external.inc
> index ff83f5a..585d50e 100644
> --- a/conf/distro/include/toolchain-external.inc
> +++ b/conf/distro/include/toolchain-external.inc
> @@ -6,3 +6,5 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc =
> "external-toolchain-${TOOLCHAIN
>  PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ =
> "external-toolchain-${TOOLCHAIN_BRAND}"
>  #PREFERRED_PROVIDER_linux-libc-headers =
> "external-toolchain-${TOOLCHAIN_BRAND}"
> 
> +TOOLCHAIN_VENDOR ?= "${TARGET_VENDOR}"
> +TARGET_VENDOR = "${TOOLCHAIN_VENDOR}"
> 
> and added TOOLCHAIN_VENDOR = "-none" in my local conf.
> 
> But it appears that the angstrom-2008.1 distro conf is still
> overriding the TARGET_VENDOR variable:
> $bitbake -i
> /usr/lib/pymodules/python2.6/bb/shell.py:59: DeprecationWarning: The
> popen2 module is deprecated.  Use the subprocess module.
>   import sys, os, readline, socket, httplib, urllib, commands, popen2,
> copy, shlex, Queue, fnmatch
> BitBake Shell Version 0.5.3.1 (C) 2005 Michael 'Mickey' Lauer
> <mickey@Vanille.de>
> Type 'help' for more information, press CTRL-D to exit.
> BB>> parse
> [snip]
> NOTE: Handling BitBake files: | (7131/7131) [100 %]
> NOTE: Parsing finished. 0 cached, 6796 parsed, 335 skipped, 2 masked.
> 
> BB>> getvar TARGET_VENDOR
> -angstrom
> BB>> getvar TOOLCHAIN_VENDOR
> -none
> BB>> getvar TARGET_SYS
> arm-angstrom-linux-gnueabi
> 
> So my initial attempt is not going to cut it. Could you elaborate on
> what you imagine the necessary modifications to toolchain-external.inc
> might be? I'm happy to implement and/or test.

As I mentioned in the previous discussion, since inclusion of 
toolchain-external.inc happens before the inclusion of angstrom.inc, where 
TARGET_VENDOR is set unconditionally, it's not possible to control this 
variable from toolchain-external.inc...

We either need to swap those two lines, so inclusion of toolchain-external.inc 
happens after the angstrom.inc is included (untested):

diff --git a/conf/distro/angstrom-2008.1.conf 
b/conf/distro/angstrom-2008.1.conf
index ec4f21e..1fd5ab6 100644
--- a/conf/distro/angstrom-2008.1.conf
+++ b/conf/distro/angstrom-2008.1.conf
@@ -124,10 +124,6 @@ PREFERRED_VERSION_binutils_avr32 = "2.17"
 PREFERRED_VERSION_binutils-cross_avr32 = "2.17"
 PREFERRED_VERSION_binutils-cross-sdk_avr32 = "2.17"

-# Toolchain virtuals:
-require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}.inc
-require conf/distro/include/arm-thumb.inc
-
 PREFERRED_PROVIDER_dbus-glib             = "dbus-glib"
 PREFERRED_PROVIDER_hotplug               = "udev"
 PREFERRED_PROVIDER_opkg                 ?= "opkg"
@@ -143,6 +139,10 @@ ANGSTROMLIBC ?= "glibc"

 require conf/distro/include/angstrom.inc

+# Toolchain virtuals:
+require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}.inc
+require conf/distro/include/arm-thumb.inc
+
 # Set DISTRO_FEED_CONFIGS to our config var, assigned in the above .inc
 DISTRO_FEED_CONFIGS = "${ANGSTROM_FEED_CONFIGS}"



Or another option is to set TARGET_VENDOR in the glibc-external.inc, which is 
included after TARGET_VENDOR is set. But that is not the right place, because 
there can be external-angstrom toolchain as well, so setting TARGET_VENDOR to 
"-none" in glibc-external.inc is not correct... Or if you define a new 
variable TOOLCHAIN_VENDOR, you can set TARGET_VENDOR = ${TOOLCHAIN_VENDOR} in 
there...

-- 
Denys


