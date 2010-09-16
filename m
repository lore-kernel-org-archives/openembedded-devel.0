Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1Ow71r-0007GQ-Ic
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Sep 2010 07:29:05 +0200
Received: by pwj1 with SMTP id 1so349185pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Sep 2010 22:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=8/86fi/jBbeXjLXbxntQxmxlYbDbtKy0ZcLgxCUqNAU=;
	b=Aj0FHcekuNIpuoGxuldC5JScDYpvQXKOHh2J7/3lrgOm0Y/motbcY+YV1dc60WMwTW
	GdCWlNMFt7M+5h83H1vfGUwsOVT7s2Yv0mboWj1x9oWuA0zUA/G2Miuw3NzlhqpnVNgC
	bf9/lenNYF3F0XcfhttYIy9bDhIY+xaUTgXFU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=USNuHx9eUaqiopHiJ29K9RFjWjHUoyV2Z2Ihv3gRI1mVd7twPv0yWB2IPVXS1cWcIY
	UDdo+GdDnc7kPahvduaPP8s3s9+G0XBb30MRM6xbpzR6bqkPUaA0yeNV/+Ji6rggl6on
	xaFRzWlOQ41JVBDhRvmb+490RQnRaC8rzjtfo=
Received: by 10.142.249.19 with SMTP id w19mr431989wfh.189.1284614892580;
	Wed, 15 Sep 2010 22:28:12 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id q23sm2587491wfc.6.2010.09.15.22.28.10
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 15 Sep 2010 22:28:11 -0700 (PDT)
Message-ID: <4C91AAE7.70203@gmail.com>
Date: Thu, 16 Sep 2010 14:58:07 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.12) Gecko/20100909 Thunderbird/3.0.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C919DB6.4010603@gmail.com>
	<AANLkTin8H_Y4LSA82sDGDL7sqFHFhuR7KJJGHK7Tp-26@mail.gmail.com>
In-Reply-To: <AANLkTin8H_Y4LSA82sDGDL7sqFHFhuR7KJJGHK7Tp-26@mail.gmail.com>
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2 v2] zziplib_0.13.59.bb: add new recipe.
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
X-List-Received-Date: Thu, 16 Sep 2010 05:29:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/zziplib/zziplib-0.13.59/configure.ac.patch |   29 ++++++++++++++++++++
 recipes/zziplib/zziplib_0.13.59.bb                 |   27 ++++++++++++++++++
 2 files changed, 56 insertions(+), 0 deletions(-)
 create mode 100644 recipes/zziplib/zziplib-0.13.59/configure.ac.patch
 create mode 100644 recipes/zziplib/zziplib_0.13.59.bb

diff --git a/recipes/zziplib/zziplib-0.13.59/configure.ac.patch b/recipes/zziplib/zziplib-0.13.59/configure.ac.patch
new file mode 100644
index 0000000..9d72296
--- /dev/null
+++ b/recipes/zziplib/zziplib-0.13.59/configure.ac.patch
@@ -0,0 +1,29 @@
+--- zziplib-0.13.59/configure.ac-orig	2010-09-16 14:34:38.000000000 +0930
++++ zziplib-0.13.59/configure.ac	2010-09-16 14:36:35.000000000 +0930
+@@ -1,13 +1,11 @@
+-AC_INIT([zziplib.spec])
+ AC_PREREQ(2.61)
+-AC_COPYRIGHT([Guido Draheim <guido@gmx.de> for ZZipLib.SF.net])
++AC_INIT([zziplib], [0.13.59], [Guido Draheim <guido@gmx.de>])
++AC_CANONICAL_TARGET
++AM_INIT_AUTOMAKE([foreign 1.9 dist-bzip2])
++AC_CONFIG_SRCDIR([zzip/zip.c])
+ AC_REVISION($Revision: 1.15 $)
+-AC_CONFIG_AUX_DIR([uses])
+ AC_CONFIG_MACRO_DIR([m4])
+ # =======================================================================
+-AC_CANONICAL_SYSTEM
+-dnl AM_ENABLE_MULTILIB([Makefile],[$host])
+-AX_ENABLE_BUILDDIR_UNAME
+ AC_SET_DEFAULT_PATHS_SYSTEM
+ # -----------------------------------------------------------------------
+ AC_ARG_ENABLE([thread-safe],
+@@ -62,8 +60,6 @@
+ AC_SUBST(ZLIB_INCL)
+ AC_SUBST(ZLIB_LDIR)
+ # -----------------------------------------------------------------------
+-AX_SPEC_DEFAULTS
+-AM_INIT_AUTOMAKE($PACKAGE,$VERSION)
+ dnl test ".$CFLAGS" = "." && CFLAGS=""
+ AC_PROG_CC
+ dnl test ".$CFLAGS" = "." && test "$GCC" = "yes" && CFLAGS="-O3"
diff --git a/recipes/zziplib/zziplib_0.13.59.bb b/recipes/zziplib/zziplib_0.13.59.bb
new file mode 100644
index 0000000..eac671c
--- /dev/null
+++ b/recipes/zziplib/zziplib_0.13.59.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "Support library for dealing with zip files"
+SECTION = "libs"
+PRIORITY = "optional"
+LICENSE = "LGPL MPL"
+DEPENDS = "zlib python-native"
+
+PR = "r0"
+
+SRC_URI[md5sum] = "14b5a6fc229afe9916d48358479568d3"
+SRC_URI[sha256sum] = "cbc90cef60ee498319258e464895f990bb2e6e08f245264d77e44b309c8c218f"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/zziplib/zziplib-${PV}.tar.bz2 \
+		file://configure.ac.patch"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF += "--srcdir=${S}"
+BBCLASSEXTEND = "native"
+
+do_compile_append() {
+	# Fix QA Issue with staging.
+	for i in ${S}/*/*.pc ; do
+		if [ ! -z "${STAGING_DIR_TARGET}" ]; then
+			sed -i -e s:${STAGING_DIR_TARGET}::g $i
+		fi
+	done
+}
-- 
1.7.1




