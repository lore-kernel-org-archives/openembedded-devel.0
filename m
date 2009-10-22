Received: from [209.85.210.175] (helo=mail-yx0-f175.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1N0y2C-0008Sk-5s
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Oct 2009 15:48:59 +0200
Received: by yxe5 with SMTP id 5so3998027yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2009 06:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=89TVEwn+oV0PKZf7DOV7hQr6hixMp4qLlRBH+bJ8IqM=;
	b=pdSjXCzx3bH7+lemBfSjrz8x7gr6HXUtyCsoQV/Nm9XVQxHeJFuyILZXMEwtdzaEGW
	4syx+Jrgx37n+JNiempMaBm+awRO5g857smLB6yZ2MniuIm+FLEH9uC9Cj3jITm1k/Vt
	Hjm76eY8OinkW/WY6orfUqBcHswYaWDt2NVLk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=cnltbZg9O81YF+K0KERXHJkmodtAsrzayhBDoRH35cHiMqqQSdX8FuZhZRVRrwamyt
	rBL+A+tXytnXoaGhCaSxewCzIwJL4hgoVZZU5Zx+gVUZcW3YQvVAmlNtImg+hc6EGQ37
	amJQH0R4LyWrg/69EkMS4v5/XAdhqB+AGM0AY=
Received: by 10.103.125.27 with SMTP id c27mr4090331mun.110.1256219273204;
	Thu, 22 Oct 2009 06:47:53 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id j6sm3018409mue.50.2009.10.22.06.47.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 22 Oct 2009 06:47:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Oct 2009 15:47:41 +0200
Message-Id: <1256219261-29147-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.6.5.1
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] binutils-2.20 is new enough for glibc_2.9, change configure script to accept it
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
X-List-Received-Date: Thu, 22 Oct 2009 13:48:59 -0000

---
 .../glibc-2.9/glibc-2.9-enable-binutils-2.2.patch  |   35 ++++++++++++++++++++
 recipes/glibc/glibc_2.9.bb                         |    1 +
 2 files changed, 36 insertions(+), 0 deletions(-)
 create mode 100644 recipes/glibc/glibc-2.9/glibc-2.9-enable-binutils-2.2.patch

diff --git a/recipes/glibc/glibc-2.9/glibc-2.9-enable-binutils-2.2.patch b/recipes/glibc/glibc-2.9/glibc-2.9-enable-binutils-2.2.patch
new file mode 100644
index 0000000..09200dd
--- /dev/null
+++ b/recipes/glibc/glibc-2.9/glibc-2.9-enable-binutils-2.2.patch
@@ -0,0 +1,35 @@
+--- glibc-2.9.orig/configure.in	2009-10-22 15:38:13.000000000 +0200
++++ glibc-2.9/configure.in	2009-10-22 15:37:33.000000000 +0200
+@@ -844,10 +844,10 @@
+ # Accept binutils 2.13 or newer.
+ AC_CHECK_PROG_VER(AS, $AS, --version,
+ 		  [GNU assembler.* \([0-9]*\.[0-9.]*\)],
+-		  [2.1[3-9]*], AS=: critic_missing="$critic_missing as")
++		  [2.1[3-9]* | 2.2* ], AS=: critic_missing="$critic_missing as")
+ AC_CHECK_PROG_VER(LD, $LD, --version,
+ 		  [GNU ld.* \([0-9][0-9]*\.[0-9.]*\)],
+-		  [2.1[3-9]*], LD=: critic_missing="$critic_missing ld")
++		  [2.1[3-9]* | 2.2* ], LD=: critic_missing="$critic_missing ld")
+ 
+ # We need the physical current working directory.  We cannot use the
+ # "pwd -P" shell builtin since that's not portable.  Instead we try to
+--- glibc-2.9.orig/configure	2009-02-26 22:28:17.000000000 +0100
++++ glibc-2.9/configure	2009-10-22 15:43:11.000000000 +0200
+@@ -4531,7 +4531,7 @@
+   ac_prog_version=`$AS --version 2>&1 | sed -n 's/^.*GNU assembler.* \([0-9]*\.[0-9.]*\).*$/\1/p'`
+   case $ac_prog_version in
+     '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
+-    2.1[3-9]*)
++    2.1[3-9]* | 2.2*)
+        ac_prog_version="$ac_prog_version, ok"; ac_verc_fail=no;;
+     *) ac_prog_version="$ac_prog_version, bad"; ac_verc_fail=yes;;
+ 
+@@ -4594,7 +4594,7 @@
+   ac_prog_version=`$LD --version 2>&1 | sed -n 's/^.*GNU ld.* \([0-9][0-9]*\.[0-9.]*\).*$/\1/p'`
+   case $ac_prog_version in
+     '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
+-    2.1[3-9]*)
++    2.1[3-9]* | 2.2*)
+        ac_prog_version="$ac_prog_version, ok"; ac_verc_fail=no;;
+     *) ac_prog_version="$ac_prog_version, bad"; ac_verc_fail=yes;;
+ 
diff --git a/recipes/glibc/glibc_2.9.bb b/recipes/glibc/glibc_2.9.bb
index 56a6ff8..cddae98 100644
--- a/recipes/glibc/glibc_2.9.bb
+++ b/recipes/glibc/glibc_2.9.bb
@@ -65,6 +65,7 @@ SRC_URI = "ftp://ftp.gnu.org/pub/gnu/glibc/glibc-${PV}.tar.bz2 \
 	   file://tls_i486.patch;patch=1 \
 	   file://glibc-2.9-use-_begin.patch;patch=1 \
            file://arm-lowlevellock-include-tls.patch;patch=1 \
+           file://glibc-2.9-enable-binutils-2.2.patch;patch=1 \
            "
 
 # Build fails on sh3 and sh4 without additional patches
-- 
1.6.5.1



