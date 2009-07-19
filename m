Received: from [209.85.222.199] (helo=mail-pz0-f199.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MSZon-0000d9-32
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 Jul 2009 19:04:57 +0200
Received: by pzk37 with SMTP id 37so1255181pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jul 2009 09:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=zakXCZRxQADOaSBDWNX3Ytxl8KlT+l4WPgTjwq7bLoA=;
	b=iBlXlhTXeXZydnxFPiGCeObJIriqVkr7pjlwFzzKaG2pmK6NEnyIQWWezkNVPAsAF0
	E4P/ALcWzFB9hiU334wc0Bc7US+CRFxem+M7NHOcpEWsAc7GYZAQOIYgstOxPvfDSHse
	f0ja3lQ9lEV2QNt1h0sN1HKE/zPhfUyE5gLOY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=NLyxCldCW5xr6XGH2vIi+e+bu9+YP66AJYerSbPKs+lWpUSTVOXekJXWnh9xxy091+
	AZ4MKrKC+HBS1r8yUhDGdZGWtprsWdd0J+6g4qTaBdTbL9zOPjbWTJzZo9/4cLgcNlgL
	/K6JYIkCFJUarf76VA0FyMmRoCJhVcAWHYh1c=
Received: by 10.114.151.4 with SMTP id y4mr5649872wad.27.1248022263637;
	Sun, 19 Jul 2009 09:51:03 -0700 (PDT)
Received: from gmail.com (adsl-71-146-11-93.dsl.pltn13.sbcglobal.net
	[71.146.11.93])
	by mx.google.com with ESMTPS id g25sm7218166wag.8.2009.07.19.09.51.01
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 19 Jul 2009 09:51:02 -0700 (PDT)
Date: Sun, 19 Jul 2009 09:50:51 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090719165051.GA11850@gmail.com>
References: <1247779880-31274-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1247779880-31274-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] util-linux-ng: Do not provide libblkid.
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
X-List-Received-Date: Sun, 19 Jul 2009 17:04:57 -0000
X-Groupsio-MsgNum: 11994
Content-Type: multipart/mixed; boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline

--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (16/07/09 14:31), Khem Raj wrote:
> 	Currently we let utils-linux-ng provide
> 	libblkid package which then ends up being
> 	provided twice once from e2fsprogs-libs and
> 	once from util-linux-ng. Future versions might
> 	move libblkid and libuuid to utils-linux-ng
> 	till then we will use e2fsprogs-libs provided one
> 	on the system
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes/util-linux-ng/util-linux-ng.inc       |   15 ++-------------
>  recipes/util-linux-ng/util-linux-ng_2.13.1.bb |    1 +
>  recipes/util-linux-ng/util-linux-ng_2.14.bb   |    1 +
>  recipes/util-linux-ng/util-linux-ng_2.15.bb   |    1 +
>  4 files changed, 5 insertions(+), 13 deletions(-)


Here is alternative patch which makes this libs come from utils-linux-ng
as going forward this seems ok on the same hand it breaks the old e2fsprogs-libs
and utils-linux-ng co operations.

I have also added the latest releases of both packages which libblkid and libuuid
have been moved to util-linux-ng and provisions to disable it in e2fsprogs has
been added.

Built and booted console-image on arm works fine. 

OK to install on .dev?

Thanks

-Khem


--fdj2RfSjLxBAspz7
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-e2fsprogs-libs-Add-version-1.41.8-and-dont-provide.patch"

From 69ef2d4fd54b49281c5187be7a98da78c84346f3 Mon Sep 17 00:00:00 2001
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 19 Jul 2009 09:31:34 -0700
Subject: [PATCH] e2fsprogs-libs: Add version 1.41.8 and dont provide libblkid and libuuid.
 util-linux-ng: Add version 2.16 and provide libblkid and libuuid.

Change the provider for libuuid and libblkid from e2fsprogs-libs
to util-linux-ng.
---
 conf/checksums.ini                                 |    8 ++++++++
 recipes/e2fsprogs-libs/e2fsprogs-libs.inc          |   14 +++++---------
 recipes/e2fsprogs-libs/e2fsprogs-libs_1.33.bb      |    1 +
 recipes/e2fsprogs-libs/e2fsprogs-libs_1.34.bb      |    2 +-
 recipes/e2fsprogs-libs/e2fsprogs-libs_1.35.bb      |    4 +++-
 recipes/e2fsprogs-libs/e2fsprogs-libs_1.39.bb      |    2 +-
 recipes/e2fsprogs-libs/e2fsprogs-libs_1.41.2.bb    |    4 ++--
 recipes/e2fsprogs-libs/e2fsprogs-libs_1.41.5.bb    |    6 +++---
 recipes/e2fsprogs-libs/e2fsprogs-libs_1.41.8.bb    |   16 ++++++++++++++++
 .../util-linux-ng-2.16/uclibc-compile.patch        |   13 +++++++++++++
 recipes/util-linux-ng/util-linux-ng.inc            |    4 ++--
 recipes/util-linux-ng/util-linux-ng_2.16.bb        |   11 +++++++++++
 12 files changed, 66 insertions(+), 19 deletions(-)
 create mode 100644 recipes/e2fsprogs-libs/e2fsprogs-libs_1.41.8.bb
 create mode 100644 recipes/util-linux-ng/util-linux-ng-2.16/uclibc-compile.patch
 create mode 100644 recipes/util-linux-ng/util-linux-ng_2.16.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index e19a0ff..ec2f2a4 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -5262,6 +5262,10 @@ sha256=2de57ec75aca127ec70c2797c1a416fca43d78e6cb5c8ee4938864cb8eaafb56
 md5=c75f112d24bdc39c76dbec61d59a4a91
 sha256=dc1eb1b7bbad2edc030e50e7506c79562d98098f99a5d6cb5db5aa5ca92ffe48
 
+[http://downloads.sourceforge.net/e2fsprogs/e2fsprogs-libs-1.41.8.tar.gz]
+md5=bd28f2ccce2c14f06091e04fd1a0c67e
+sha256=90428106333a38b93b6f4a306fff17749243862883a06598ff6e6ea11f8d24d2
+
 [http://www.pobox.com/~sheff/sw/e2tools/e2tools-0.0.16.tar.gz]
 md5=1829b2b261e0e0d07566066769b5b28b
 sha256=4e3c8e17786ccc03fc9fb4145724edf332bb50e1b3c91b6f33e0e3a54861949b
@@ -24250,6 +24254,10 @@ sha256=7736d8d7d3b39654e350416585b3e00af9f55670cce8b3dddd2c2494cbaae81c
 md5=71919b69eeecbba05612224d8f2c450f
 sha256=db4dcbf99d989a8f539d7521e9e64047367fa2ccdcbb91517cdec19693a41ffd
 
+[http://kernel.org/pub/linux/utils/util-linux-ng/v2.16/util-linux-ng-2.16.tar.bz2]
+md5=9623380641b0c2e0449f5b1ecc567663
+sha256=a6365fcb2b34439faa52164e1a018086c2b6818f8a189c487c79e09dc3c62722
+
 [http://xorg.freedesktop.org/releases/individual/util/util-macros-1.1.5.tar.bz2]
 md5=51952682d8b42aeda3af5cee0133ce2c
 sha256=75939790e16b8bcc122e83f3f060d6f000ed1a98e97b4972fac0903142f5651b
diff --git a/recipes/e2fsprogs-libs/e2fsprogs-libs.inc b/recipes/e2fsprogs-libs/e2fsprogs-libs.inc
index 5b82c11..517771c 100644
--- a/recipes/e2fsprogs-libs/e2fsprogs-libs.inc
+++ b/recipes/e2fsprogs-libs/e2fsprogs-libs.inc
@@ -2,8 +2,9 @@ DESCRIPTION = "EXT2 Filesystem Utilities"
 LICENSE = "GPL"
 SECTION = "base"
 PRIORITY = "optional"
+DEPENDS = "util-linux-ng"
 
-inherit autotools pkgconfig
+inherit autotools_stage pkgconfig
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/e2fsprogs/e2fsprogs-libs-${PV}.tar.gz \
            file://configure.patch;patch=1 \
@@ -13,6 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/e2fsprogs/e2fsprogs-libs-${PV}.tar.gz \
 S = "${WORKDIR}/e2fsprogs-libs-${PV}"
 FILES_e2fsprogs-libs-dev_append = " ${datadir}/et ${datadir}/ss"
 FILES_${PN} = "${bindir}"
+EXTRA_OECONF = "--disable-libblkid --disable-libuuid"
 
 python populate_packages_prepend () {
 	e2fs_libdir = bb.data.expand('${libdir}', d)
@@ -24,18 +26,12 @@ python populate_packages_prepend () {
 }
 
 do_stage () {
-        for i in libcom_err libss libuuid libblkid; do
+        for i in libcom_err libss; do
                 oe_libinstall -a -C lib $i ${STAGING_LIBDIR}
         done
         install -d ${STAGING_INCDIR}/et \
-                   ${STAGING_INCDIR}/ss \
-                   ${STAGING_INCDIR}/uuid \
-                   ${STAGING_INCDIR}/blkid
+                   ${STAGING_INCDIR}/ss
         install -m 0644 lib/et/com_err.h ${STAGING_INCDIR}/et/
         install -m 0644 lib/ss/ss.h ${STAGING_INCDIR}/ss/
         install -m 0644 lib/ss/ss_err.h ${STAGING_INCDIR}/ss/
-        install -m 0644 lib/uuid/uuid.h ${STAGING_INCDIR}/uuid/
-        install -m 0644 lib/uuid/uuid_types.h ${STAGING_INCDIR}/uuid/
-        install -m 0644 lib/blkid/blkid.h ${STAGING_INCDIR}/blkid/
-        install -m 0644 lib/blkid/blkid_types.h ${STAGING_INCDIR}/blkid/
 }
diff --git a/recipes/e2fsprogs-libs/e2fsprogs-libs_1.33.bb b/recipes/e2fsprogs-libs/e2fsprogs-libs_1.33.bb
index 3844966..0ac8ac3 100644
--- a/recipes/e2fsprogs-libs/e2fsprogs-libs_1.33.bb
+++ b/recipes/e2fsprogs-libs/e2fsprogs-libs_1.33.bb
@@ -1 +1,2 @@
+PR = "r1"
 require e2fsprogs-libs.inc
diff --git a/recipes/e2fsprogs-libs/e2fsprogs-libs_1.34.bb b/recipes/e2fsprogs-libs/e2fsprogs-libs_1.34.bb
index 738d1ee..6be9289 100644
--- a/recipes/e2fsprogs-libs/e2fsprogs-libs_1.34.bb
+++ b/recipes/e2fsprogs-libs/e2fsprogs-libs_1.34.bb
@@ -1,5 +1,5 @@
 require e2fsprogs-libs.inc
-
+PR = "r1"
 SRC_URI += "file://ldflags.patch;patch=1"
 
 do_compile_prepend () {
diff --git a/recipes/e2fsprogs-libs/e2fsprogs-libs_1.35.bb b/recipes/e2fsprogs-libs/e2fsprogs-libs_1.35.bb
index 0d7d25e..fc3e85f 100644
--- a/recipes/e2fsprogs-libs/e2fsprogs-libs_1.35.bb
+++ b/recipes/e2fsprogs-libs/e2fsprogs-libs_1.35.bb
@@ -1,8 +1,10 @@
 require e2fsprogs-libs.inc
 
+PR = "r1"
+
 SRC_URI += "file://ldflags.patch;patch=1"
 
-EXTRA_OECONF=" --enable-elf-shlibs "
+EXTRA_OECONF += " --enable-elf-shlibs "
 
 do_compile_prepend () {
 	find ./ -print|xargs chmod u=rwX
diff --git a/recipes/e2fsprogs-libs/e2fsprogs-libs_1.39.bb b/recipes/e2fsprogs-libs/e2fsprogs-libs_1.39.bb
index dfd83e3..ccd5a3c 100644
--- a/recipes/e2fsprogs-libs/e2fsprogs-libs_1.39.bb
+++ b/recipes/e2fsprogs-libs/e2fsprogs-libs_1.39.bb
@@ -5,7 +5,7 @@ PR = "r1"
 SRC_URI = "${SOURCEFORGE_MIRROR}/e2fsprogs/e2fsprogs-libs-${PV}.tar.gz \
            file://configure.patch;patch=1"
 
-EXTRA_OECONF=" --enable-elf-shlibs "
+EXTRA_OECONF += " --enable-elf-shlibs "
 
 do_compile_prepend () {
 	find ./ -print|xargs chmod u=rwX
diff --git a/recipes/e2fsprogs-libs/e2fsprogs-libs_1.41.2.bb b/recipes/e2fsprogs-libs/e2fsprogs-libs_1.41.2.bb
index d9447ab..53afbaa 100644
--- a/recipes/e2fsprogs-libs/e2fsprogs-libs_1.41.2.bb
+++ b/recipes/e2fsprogs-libs/e2fsprogs-libs_1.41.2.bb
@@ -1,6 +1,6 @@
 require e2fsprogs-libs.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/e2fsprogs/e2fsprogs-libs-${PV}.tar.gz \
 	   file://mkinstalldirs.patch;patch=1 \
@@ -8,7 +8,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/e2fsprogs/e2fsprogs-libs-${PV}.tar.gz \
 
 DEPENDS = "gettext-native"
 
-EXTRA_OECONF=" --enable-elf-shlibs "
+EXTRA_OECONF += " --enable-elf-shlibs "
 
 do_compile_prepend () {
 	find ./ -print|xargs chmod u=rwX
diff --git a/recipes/e2fsprogs-libs/e2fsprogs-libs_1.41.5.bb b/recipes/e2fsprogs-libs/e2fsprogs-libs_1.41.5.bb
index 25a6490..47e543c 100644
--- a/recipes/e2fsprogs-libs/e2fsprogs-libs_1.41.5.bb
+++ b/recipes/e2fsprogs-libs/e2fsprogs-libs_1.41.5.bb
@@ -1,12 +1,12 @@
 require e2fsprogs-libs.inc
-
+PR = "r1"
 SRC_URI = "${SOURCEFORGE_MIRROR}/e2fsprogs/e2fsprogs-libs-${PV}.tar.gz \
 	   file://mkinstalldirs.patch;patch=1 \
 	  "
 
-DEPENDS = "gettext-native"
+DEPENDS += "gettext-native"
 
-EXTRA_OECONF=" --enable-elf-shlibs "
+EXTRA_OECONF += " --enable-elf-shlibs "
 
 do_compile_prepend () {
 	find ./ -print|xargs chmod u=rwX
diff --git a/recipes/e2fsprogs-libs/e2fsprogs-libs_1.41.8.bb b/recipes/e2fsprogs-libs/e2fsprogs-libs_1.41.8.bb
new file mode 100644
index 0000000..f9a67af
--- /dev/null
+++ b/recipes/e2fsprogs-libs/e2fsprogs-libs_1.41.8.bb
@@ -0,0 +1,16 @@
+require e2fsprogs-libs.inc
+SRC_URI = "${SOURCEFORGE_MIRROR}/e2fsprogs/e2fsprogs-libs-${PV}.tar.gz \
+	  "
+
+DEPENDS += "gettext-native"
+
+EXTRA_OECONF += " --enable-elf-shlibs "
+
+do_configure() {
+        oe_runconf
+}
+
+do_compile_prepend () {
+	find ./ -print|xargs chmod u=rwX
+	( cd util; ${BUILD_CC} subst.c -o subst )
+}
diff --git a/recipes/util-linux-ng/util-linux-ng-2.16/uclibc-compile.patch b/recipes/util-linux-ng/util-linux-ng-2.16/uclibc-compile.patch
new file mode 100644
index 0000000..b2e8a8b
--- /dev/null
+++ b/recipes/util-linux-ng/util-linux-ng-2.16/uclibc-compile.patch
@@ -0,0 +1,13 @@
+Index: util-linux-ng-2.16/misc-utils/cal.c
+===================================================================
+--- util-linux-ng-2.16.orig/misc-utils/cal.c	2009-07-03 16:20:01.000000000 -0700
++++ util-linux-ng-2.16/misc-utils/cal.c	2009-07-18 23:21:37.000000000 -0700
+@@ -407,7 +407,7 @@
+   strcpy(day_headings,"");
+   strcpy(j_day_headings,"");
+ 
+-#ifdef HAVE_LANGINFO_H
++#ifdef HAVE_LANGINFO_H && !defined(__UCLIBC__)
+ # define weekday(wd)	nl_langinfo(ABDAY_1+wd)
+ #else
+ # define weekday(wd)	_time_info->abbrev_wkday[wd]
diff --git a/recipes/util-linux-ng/util-linux-ng.inc b/recipes/util-linux-ng/util-linux-ng.inc
index 59d2f08..837ff70 100644
--- a/recipes/util-linux-ng/util-linux-ng.inc
+++ b/recipes/util-linux-ng/util-linux-ng.inc
@@ -1,14 +1,14 @@
 DESCRIPTION = "Util-linux-ng is a suite of essential utilities for any Linux system."
 SECTION = "base"
 LICENSE = "GPL"
-DEPENDS = "udev zlib ncurses virtual/libintl e2fsprogs-libs"
+DEPENDS = "udev zlib ncurses virtual/libintl"
 
 inherit autotools_stage
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
 DEFAULT_PREFERENCE = "-1"
 
-INC_PR = "r6"
+INC_PR = "r7"
 
 # allows for a release candidate
 RC ?= ""
diff --git a/recipes/util-linux-ng/util-linux-ng_2.16.bb b/recipes/util-linux-ng/util-linux-ng_2.16.bb
new file mode 100644
index 0000000..1cfdc34
--- /dev/null
+++ b/recipes/util-linux-ng/util-linux-ng_2.16.bb
@@ -0,0 +1,11 @@
+require util-linux-ng.inc
+
+PR = "${INC_PR}"
+
+SRC_URI += "file://uclibc-compile.patch;patch=1 \
+"
+
+EXTRA_OECONF += " --enable-libuuid --enable-libblkid \
+		--disable-fsck"
+LDFLAGS_append_libc-uclibc = " -lintl"
+PACKAGES_DYNAMIC += "libuuid*"
-- 
1.6.0.4


--fdj2RfSjLxBAspz7--
