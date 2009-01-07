Received: from [209.85.218.15] (helo=mail-bw0-f15.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1LKgPL-00077g-BD
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jan 2009 22:57:47 +0100
Received: by bwz8 with SMTP id 8so229851bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jan 2009 13:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=JZck6bgfvLjByYmbf/wKRWBq2plyGWbg+7RElDQcaoA=;
	b=BYcY318ZL2Uoepe1IkhKE3xl2XEWmwdA2vQipcg70llGbhz49kDk6saze/FSLtXa6t
	hZu+bH+YGsQUYfyrxk7Wlz6S0JGam2M+hUwN6I0KY9QstLi/tvRsAb5+viDgWoYr250E
	RSFUs3mTiUJtggzA3agKS7wlxoeJ1pirQ5m6Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=alt556LAddck+G00RVB3gw1fJg+/kt176QFs7Gcnx0SC2fOVg2HKvf6S7RHCifbOVJ
	C8Wt2Ut1L4k3HbaiNLjOdQ6KYKP7ExtHAmFbzJyQrfL/E5tn/b1Z/9Q1zzfpxbW+KVRg
	5oVU8qEKdAFYaiVbepUtF10K/bF2Fob0LK3SM=
Received: by 10.223.110.6 with SMTP id l6mr15764774fap.52.1231365077608;
	Wed, 07 Jan 2009 13:51:17 -0800 (PST)
Received: by 10.223.115.200 with HTTP; Wed, 7 Jan 2009 13:51:17 -0800 (PST)
Message-ID: <c384c5ea0901071351v67639096l65f707a1907247ca@mail.gmail.com>
Date: Wed, 7 Jan 2009 22:51:17 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
In-Reply-To: <17e906380812112142y95e2861t509894029b025b0@mail.gmail.com>
MIME-Version: 1.0
References: <17e906380812112142y95e2861t509894029b025b0@mail.gmail.com>
Subject: [Openocd-development] Angstrom "package binutils-cross-2.17.50.0.5: failed" fixed
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
X-List-Received-Date: Wed, 07 Jan 2009 21:57:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I just came across this email, posted this to the wrong list.

---------- Forwarded message ----------
From: shiyou yu <yushiyou@gmail.com>
Date: Fri, Dec 12, 2008 at 6:42 AM
Subject: [Openocd-development] Angstrom "package
binutils-cross-2.17.50.0.5: failed" fixed
To: openocd-development@lists.berlios.de


Hello all,

I am trying to build the complete Openembedded development platform
along with the Angstrom Linux and the root filesystem for my Atmel
AT91SAM9263EK board on Ubuntu 8.04 using the instructions given in
linux4sam.org and Openembedde website. But every time after giving the
bitbake <recipe> command I am getting the following error:
/////////////////////////////////////////////////////////////////////////////
| make[3]: Leaving directory
`/home/yu/stuff_old/tmp/work/armv5te-angstrom-linux-gnueabi/binutils-cross-2.17.50.0.5-r1/binutils-2.17.50.0.5/build.i686-linux.arm-angstrom-linux-gnueabi/bfd'
| make[2]: *** [info-recursive] Error 1
| make[2]: Leaving directory
`/home/yu/stuff_old/tmp/work/armv5te-angstrom-linux-gnueabi/binutils-cross-2.17.50.0.5-r1/binutils-2.17.50.0.5/build.i686-linux.arm-angstrom-linux-gnueabi/bfd'
| make[1]: *** [all-bfd] Error 2
| make[1]: Leaving directory
`/home/yu/stuff_old/tmp/work/armv5te-angstrom-linux-gnueabi/binutils-cross-2.17.50.0.5-r1/binutils-2.17.50.0.5/build.i686-linux.arm-angstrom-linux-gnueabi'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed:
/home/yu/stuff_old/tmp/work/armv5te-angstrom-linux-gnueabi/binutils-cross-2.17.50.0.5-r1/temp/log.do_compile.21862
NOTE: package binutils-cross-2.17.50.0.5-r1: task do_compile: failed
ERROR: TaskFailed event exception, aborting
NOTE: package binutils-cross-2.17.50.0.5: failed
ERROR: Build of
/home/yu/stuff_old/org.openembedded.dev/packages/binutils/binutils-cross_2.17.50.0.5.bb
do_compile failed
ERROR: Task 265
(/home/yu/stuff_old/org.openembedded.dev/packages/binutils/binutils-cross_2.17.50.0.5.bb,
do_compile) failed
NOTE: Tasks Summary: Attempted 119 tasks of which 0 didn't need to be
rerun and 1 failed.
ERROR: '/home/yu/stuff_old/org.openembedded.dev/packages/binutils/binutils-cross_2.17.50.0.5.bb'
failed
//////////////////////////////////////////////////////////////////////////////////////////////////////
After a long time google, I find the reason.
Here, http://bugs.sourcemage.org/show_bug.cgi?id=14015, you can find a
patch for binutils 2.18, and you can edit your
binutils-cross_2.17.50.0.5 configure file based on it.
Then, it will be OK!

patch for  binutils-2.18:

//////////////////////////////////////////////////

Submitted By: Matt Burgess (matthew at linuxfromscratch dot org)
Date: 2007-11-19
Initial Package Version: 2.18
Origin: Upstream
(http://sourceware.org/cgi-bin/cvsweb.cgi/src/configure.diff?r1=1.268&r2=1.268.2.1&cvsroot=src)

Upstream Status: Applied
Description: Fixes the configure script to correctly dictate Texinfo > 4.9.

diff -Naur binutils-2.18.orig/configure binutils-2.18/configure
--- binutils-2.18.orig/configure	2007-08-06 20:29:40.000000000 +0000

+++ binutils-2.18/configure	2007-11-18 22:37:58.000000000 +0000
@@ -6128,7 +6128,7 @@
     # For an installed makeinfo, we require it to be from texinfo 4.4 or
     # higher, else we use the "missing" dummy.

     if ${MAKEINFO} --version \
-       | egrep 'texinfo[^0-9]*([1-3][0-9]|4\.[4-9]|[5-9])' >/dev/null
2>&1; then
+       | egrep
'texinfo[^0-9]*(4\.([4-9]|[1-9][0-9])|[5-9]|[1-9][0-9])' >/dev/null
2>&1; then

       :
     else
         MAKEINFO="$MISSING makeinfo"

//////////////////////////////////////////////////

Best  regards,
Danny

_______________________________________________
Openocd-development mailing list
Openocd-development@lists.berlios.de
https://lists.berlios.de/mailman/listinfo/openocd-development




-- 
Leon


