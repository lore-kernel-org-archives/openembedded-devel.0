Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id C46AC6FFD3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jul 2017 17:35:22 +0000 (UTC)
Received: by mail-wr0-f180.google.com with SMTP id c11so148053028wrc.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jul 2017 10:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=RHQ0qPrf06V1K+WC6iP7cHyExjsPNVLIcQQIYrZTB0U=;
	b=M5jukvBaxLaM5Vp8GWWaRrFHrw286PAhZZ6BwP6EY9aEe7axH1lLD9OUw+aUIIBXy/
	+c7ro8LHCEz9ajMhLVfF90K2bKznpRnGTjZdcBumG7p/3MbmHLdC5t30C5lJvutrDzvj
	P4kOOP6FKLqhFCf1AsZ49ONX41JuFDex1kiwjKj2EAlQ3UoCrhms/U/EyNp6uuBS80iC
	GS1zEM/IjmPgNnmM1lJSgbNJV9lPE2PiJ9fVf8WiFHcPVYJO7IBe013sPrEdiY0ce8ok
	h4NzEXi+RH/eIk1ZB2tPhxG5eNArhYCjS9uPCsEyiHc0Ut2+TNtINOvk2sJfCl6tDxBu
	zXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=RHQ0qPrf06V1K+WC6iP7cHyExjsPNVLIcQQIYrZTB0U=;
	b=C+EfKYY9VN5DFTH7bwU8qQoE52nXlXUvUesmwjpl69VJ4C+6BsioIAUTume2ggh0x2
	CPPDpZjATxaSnzkzSa/9THmolBHtzwUbiVvmF25zTMk5ON1XxZulFvICqj+N+HVXe/Vj
	kzOVtyNfwYtSqW88wOYzKaSmdHeUb55pyIDYXQgmSxTY2KUuOYXfZyQG4Ry3vWSGbNwj
	QVC76J/55IbywHyWFmauHpKmx5lKGK2aMxCDE8mXfoq56fM80qrosbLEsJw57sQqJXZO
	H1lNeasf6J5/cO6UvAr9QkgSzGykUu4cP+o26DAXbUFx9129gAChMhJr3aB7c591Jvl8
	+mNw==
X-Gm-Message-State: AIVw111Mi9ClHcNoeZK3CsW0nJ2AK/Vxc2SWuCTon1grnzyeq84fLfmg
	T7pZBXMnsnvw3u9Q
X-Received: by 10.28.18.16 with SMTP id 16mr8840095wms.93.1499708123038;
	Mon, 10 Jul 2017 10:35:23 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E9066A861E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e906:6a86:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	z195sm11980102wmz.28.2017.07.10.10.35.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Jul 2017 10:35:22 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Jul 2017 19:35:07 +0200
Message-Id: <20170710173507.3843-6-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <20170710173507.3843-1-schnitzeltony@googlemail.com>
References: <20170710173507.3843-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] faac: update 1.28 -> 1.29
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Jul 2017 17:35:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Most patches don't apply any more and build succeeds

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-multimedia/faac/faac_1.28.bb           |  26 --
 .../recipes-multimedia/faac/faac_1.29.bb           |  27 ++
 ...frontend-Fix-format-string-security-error.patch |  26 --
 ...efine-__STRING-if-cdefs.h-does-not-exist.patch} |   0
 .../files/address-gcc-6-narrowing-errors.patch     |  47 ---
 .../recipes-multimedia/faac/files/build-fix.patch  | 332 ---------------------
 6 files changed, 27 insertions(+), 431 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/faac/faac_1.28.bb
 create mode 100644 meta-multimedia/recipes-multimedia/faac/faac_1.29.bb
 delete mode 100644 meta-multimedia/recipes-multimedia/faac/files/0001-frontend-Fix-format-string-security-error.patch
 rename meta-multimedia/recipes-multimedia/faac/files/{0002-mp4v2-Define-__STRING-if-cdefs.h-does-not-exist.patch => 0001-mp4v2-Define-__STRING-if-cdefs.h-does-not-exist.patch} (100%)
 delete mode 100644 meta-multimedia/recipes-multimedia/faac/files/address-gcc-6-narrowing-errors.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/faac/files/build-fix.patch

diff --git a/meta-multimedia/recipes-multimedia/faac/faac_1.28.bb b/meta-multimedia/recipes-multimedia/faac/faac_1.28.bb
deleted file mode 100644
index 5c9477f..0000000
--- a/meta-multimedia/recipes-multimedia/faac/faac_1.28.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY = "Freeware Advanced Audio Coder (MPEG2-AAC, MPEG4-AAC)"
-SECTION = "libs"
-LICENSE = "LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
-                    file://libfaac/coder.h;beginline=5;endline=17;md5=fa1fd6a5fa8cdc877d63a12530d273e0"
-
-inherit autotools-brokensep
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/faac/${BP}.tar.gz \
-           file://build-fix.patch \
-           file://address-gcc-6-narrowing-errors.patch \
-           file://0001-frontend-Fix-format-string-security-error.patch \
-           file://0002-mp4v2-Define-__STRING-if-cdefs.h-does-not-exist.patch \
-           "
-
-SRC_URI[md5sum] = "80763728d392c7d789cde25614c878f6"
-SRC_URI[sha256sum] = "c5141199f4cfb17d749c36ba8cfe4b25f838da67c22f0fec40228b6b9c3d19df"
-
-EXTRA_OECONF += "--without-mp4v2"
-
-PACKAGES =+ "lib${BPN} lib${BPN}-dev"
-
-FILES_${PN} = " ${bindir}/faac "
-FILES_lib${PN} = " ${libdir}/libfaac.so.*"
-FILES_lib${PN}-dev = "${includedir}/faac.h ${includedir}/faaccfg.h ${libdir}/libfaac.so ${libdir}/libfaac.la"
-FILES_lib${PN}-staticdev = "${libdir}/libfaac.a"
diff --git a/meta-multimedia/recipes-multimedia/faac/faac_1.29.bb b/meta-multimedia/recipes-multimedia/faac/faac_1.29.bb
new file mode 100644
index 0000000..4765c6c
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/faac/faac_1.29.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Freeware Advanced Audio Coder (MPEG2-AAC, MPEG4-AAC)"
+SECTION = "libs"
+LICENSE = "LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
+                    file://libfaac/coder.h;beginline=5;endline=17;md5=fa1fd6a5fa8cdc877d63a12530d273e0"
+
+inherit autotools
+
+SRC_URI = " \
+    ${SOURCEFORGE_MIRROR}/faac/${BP}.tar.gz \
+    file://0001-mp4v2-Define-__STRING-if-cdefs.h-does-not-exist.patch \
+"
+
+SRC_URI[md5sum] = "78603720f655180059d6970c582a3005"
+SRC_URI[sha256sum] = "8cc7b03ceb2722223a6457e95d4c994731d80214a03ba33d1af76ba53f4b3197"
+
+EXTRA_OECONF += "--without-mp4v2"
+
+PACKAGES =+ "lib${BPN} lib${BPN}-dev"
+
+FILES_${PN} = " ${bindir}/faac "
+FILES_lib${PN} = " ${libdir}/*.so.*"
+FILES_lib${PN}-dev = " \
+    ${includedir} \
+    ${libdir}/*.so \
+    ${libdir}/*.la \
+"
diff --git a/meta-multimedia/recipes-multimedia/faac/files/0001-frontend-Fix-format-string-security-error.patch b/meta-multimedia/recipes-multimedia/faac/files/0001-frontend-Fix-format-string-security-error.patch
deleted file mode 100644
index 75e003e..0000000
--- a/meta-multimedia/recipes-multimedia/faac/files/0001-frontend-Fix-format-string-security-error.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From c1d7a8b992dc36d0012cc3d54b7d3abf4ad4d5d8 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 28 Mar 2017 21:33:01 -0700
-Subject: [PATCH 1/2] frontend: Fix format string security error
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- frontend/main.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/frontend/main.c b/frontend/main.c
-index 02146a8..cb9329c 100644
---- a/frontend/main.c
-+++ b/frontend/main.c
-@@ -715,7 +715,7 @@ int main(int argc, char *argv[])
-         break;
- #endif
-         case 'L':
--        fprintf(stderr, faac_copyright_string);
-+        fprintf(stderr, "%s", faac_copyright_string);
-         dieMessage = license;
-         break;
-     case 'X':
--- 
-2.12.1
-
diff --git a/meta-multimedia/recipes-multimedia/faac/files/0002-mp4v2-Define-__STRING-if-cdefs.h-does-not-exist.patch b/meta-multimedia/recipes-multimedia/faac/files/0001-mp4v2-Define-__STRING-if-cdefs.h-does-not-exist.patch
similarity index 100%
rename from meta-multimedia/recipes-multimedia/faac/files/0002-mp4v2-Define-__STRING-if-cdefs.h-does-not-exist.patch
rename to meta-multimedia/recipes-multimedia/faac/files/0001-mp4v2-Define-__STRING-if-cdefs.h-does-not-exist.patch
diff --git a/meta-multimedia/recipes-multimedia/faac/files/address-gcc-6-narrowing-errors.patch b/meta-multimedia/recipes-multimedia/faac/files/address-gcc-6-narrowing-errors.patch
deleted file mode 100644
index 92fdd9b..0000000
--- a/meta-multimedia/recipes-multimedia/faac/files/address-gcc-6-narrowing-errors.patch
+++ /dev/null
@@ -1,47 +0,0 @@
---- faac-1.28/common/mp4v2/atom_standard.cpp.orig	2016-06-16 07:59:21.657040761 -0400
-+++ faac-1.28/common/mp4v2/atom_standard.cpp	2016-06-16 08:01:50.613036724 -0400
-@@ -22,15 +22,15 @@
- #include "mp4common.h"
- #include "atoms.h"
- 
--static const char name[5]={0251,'n', 'a', 'm', '\0'};
--static const char art[5]={0251,'A', 'R', 'T', '\0'};
--static const char wrt[5]={0251,'w', 'r', 't', '\0'};
--static const char alb[5]={0251,'a', 'l', 'b', '\0'};
--static const char day[5]={0251,'d', 'a', 'y', '\0'};
--static const char too[5]={0251,'t', 'o', 'o', '\0'};
--static const char cmt[5]={0251,'c', 'm', 't', '\0'};
--static const char gen[5]={0251,'g', 'e', 'n', '\0'};
--static const char grp[5]={0251,'g', 'r', 'p', '\0'};
-+static const char name[5]={(char)0251,'n', 'a', 'm', '\0'};
-+static const char art[5]={(char)0251,'A', 'R', 'T', '\0'};
-+static const char wrt[5]={(char)0251,'w', 'r', 't', '\0'};
-+static const char alb[5]={(char)0251,'a', 'l', 'b', '\0'};
-+static const char day[5]={(char)0251,'d', 'a', 'y', '\0'};
-+static const char too[5]={(char)0251,'t', 'o', 'o', '\0'};
-+static const char cmt[5]={(char)0251,'c', 'm', 't', '\0'};
-+static const char gen[5]={(char)0251,'g', 'e', 'n', '\0'};
-+static const char grp[5]={(char)0251,'g', 'r', 'p', '\0'};
- 
- MP4StandardAtom::MP4StandardAtom (const char *type) : MP4Atom(type)
- {
---- faac-1.28/common/mp4v2/mp4atom.cpp.orig	2016-06-16 08:03:07.777034633 -0400
-+++ faac-1.28/common/mp4v2/mp4atom.cpp	2016-06-16 08:03:54.629033363 -0400
-@@ -264,11 +264,11 @@
-       }
-       break;
-     case 0251:
--      static const char name[5]={0251,'n', 'a', 'm', '\0'};
--      static const char cmt[5]={0251,'c', 'm', 't', '\0'};
--      static const char cpy[5]={0251,'c', 'p', 'y', '\0'};
--      static const char des[5]={0251,'d', 'e', 's','\0'};
--      static const char prd[5]={0251, 'p', 'r', 'd', '\0'};
-+      static const char name[5]={(char)0251,'n', 'a', 'm', '\0'};
-+      static const char cmt[5]={(char)0251,'c', 'm', 't', '\0'};
-+      static const char cpy[5]={(char)0251,'c', 'p', 'y', '\0'};
-+      static const char des[5]={(char)0251,'d', 'e', 's','\0'};
-+      static const char prd[5]={(char)0251, 'p', 'r', 'd', '\0'};
-       if (ATOMID(type) == ATOMID(name) ||
- 	  ATOMID(type) == ATOMID(cmt) ||
- 	  ATOMID(type) == ATOMID(cpy) ||
-
diff --git a/meta-multimedia/recipes-multimedia/faac/files/build-fix.patch b/meta-multimedia/recipes-multimedia/faac/files/build-fix.patch
deleted file mode 100644
index 83cff8f..0000000
--- a/meta-multimedia/recipes-multimedia/faac/files/build-fix.patch
+++ /dev/null
@@ -1,332 +0,0 @@
-Patch fixing build error and warnings. Error consisted of redefining
-strcasestr function from string.h. Warnings consisted of deprecated conversions
-of string constants to char*, using '%llu' for type uint64_t (which on 64 bit
-systems, is defined as unsigned long int by stdint.h), and using '==' for
-equality of two strings.
-
-Patch originally from Debian.
-
-Upstream-Status: Pending
-
-==========================================================================
---- a/common/mp4v2/mpeg4ip.h
-+++ b/common/mp4v2/mpeg4ip.h
-@@ -120,14 +120,6 @@
- #endif
- #include <sys/param.h>
- 
--#ifdef __cplusplus
--extern "C" {
--#endif
--char *strcasestr(const char *haystack, const char *needle);
--#ifdef __cplusplus
--}
--#endif
--
- #define OPEN_RDWR O_RDWR
- #define OPEN_CREAT O_CREAT 
- #define OPEN_RDONLY O_RDONLY
-@@ -135,7 +127,6 @@
- #define closesocket close
- #define IOSBINARY ios::bin
- 
--#if SIZEOF_LONG == 8
- #define MAX_UINT64 -1LU
- #define D64F "ld"
- #define U64F  "lu"
-@@ -143,15 +134,6 @@
- 
- #define TO_D64(a) (a##L)
- #define TO_U64(a) (a##LU)
--#else
--#define MAX_UINT64 -1LLU
--#define D64F "lld"
--#define U64F  "llu"
--#define X64F "llx"
--
--#define TO_D64(a) (a##LL)
--#define TO_U64(a) (a##LLU)
--#endif
- 
- #ifdef HAVE_FPOS_T___POS
- #define FPOS_TO_VAR(fpos, typed, var) (var) = (typed)((fpos).__pos)
---- a/configure.in
-+++ b/configure.in
-@@ -4,6 +4,9 @@
- AM_INIT_AUTOMAKE
- 
- AM_CONFIG_HEADER(config.h)
-+AH_TOP([#ifndef CONFIG_H
-+#define CONFIG_H])
-+AH_BOTTOM([#endif /* CONFIG_H */])
- 
- AC_ARG_WITH( mp4v2,  [  --with-mp4v2            compile libmp4v2],WITHMP4V2=$withval, WITHMP4V2=yes)
- AC_ARG_ENABLE( drm,  [  --enable-drm            Digital Radio Mondiale support], enable_drm=$enableval, enable_drm=no)
---- a/common/mp4v2/atom_avcC.cpp
-+++ b/common/mp4v2/atom_avcC.cpp
-@@ -29,7 +29,7 @@
- class SizeTableProperty : public MP4TableProperty 
- {
-  public:
--  SizeTableProperty(char *name, MP4IntegerProperty *pCountProperty) :
-+  SizeTableProperty(const char *name, MP4IntegerProperty *pCountProperty) :
-     MP4TableProperty(name, pCountProperty) {};
-  protected:
-   void ReadEntry(MP4File *pFile, u_int32_t index) {
---- a/common/mp4v2/atom_ohdr.cpp
-+++ b/common/mp4v2/atom_ohdr.cpp
-@@ -21,7 +21,7 @@
-       \param useCountedFormat    counted format flag.
-       \param useUnicode          unicode flag.
-   */
--	OhdrMP4StringProperty(char* name, bool useCountedFormat = false,
-+	OhdrMP4StringProperty(const char* name, bool useCountedFormat = false,
-     bool useUnicode = false): MP4StringProperty(name, useCountedFormat,
-     useUnicode) {
-   }
---- a/common/mp4v2/atom_stz2.cpp
-+++ b/common/mp4v2/atom_stz2.cpp
-@@ -30,7 +30,7 @@
- class MP4HalfSizeTableProperty : public MP4TableProperty
- {
- public:
--  MP4HalfSizeTableProperty(char *name, MP4IntegerProperty *pCountProperty) :
-+  MP4HalfSizeTableProperty(const char *name, MP4IntegerProperty *pCountProperty) :
-     MP4TableProperty(name, pCountProperty) {};
- 
-   // The count is half the actual size
---- a/common/mp4v2/mp4atom.cpp
-+++ b/common/mp4v2/mp4atom.cpp
-@@ -806,7 +806,7 @@
- 	AddProperty(new MP4Integer24Property("flags"));
- }
- 
--void MP4Atom::AddReserved(char* name, u_int32_t size) 
-+void MP4Atom::AddReserved(const char* name, u_int32_t size)
- {
- 	MP4BytesProperty* pReserved = new MP4BytesProperty(name, size); 
- 	pReserved->SetReadOnly();
---- a/common/mp4v2/mp4atom.h
-+++ b/common/mp4v2/mp4atom.h
-@@ -204,7 +204,7 @@
- 
- 	void AddVersionAndFlags();
- 
--	void AddReserved(char* name, u_int32_t size);
-+	void AddReserved(const char* name, u_int32_t size);
- 
- 	void ExpectChildAtom(const char* name, 
- 		bool mandatory, bool onlyOne = true);
---- a/common/mp4v2/mp4file.cpp
-+++ b/common/mp4v2/mp4file.cpp
-@@ -718,7 +718,7 @@
- 	}
- }
- 
--void MP4File::ProtectWriteOperation(char* where)
-+void MP4File::ProtectWriteOperation(const char* where)
- {
- 	if (m_mode == 'r') {
- 		throw new MP4Error("operation not permitted in read mode", where);
-@@ -1274,7 +1274,7 @@
- }
- 
- // NULL terminated list of brands which require the IODS atom
--char *brandsWithIods[] = { "mp42",
-+const char *brandsWithIods[] = { "mp42",
-                            "isom",
-                            NULL};
- 
-@@ -2211,11 +2211,11 @@
- 	for (u_int32_t i = 0; i < m_pTracks.Size(); i++) {
- 		if (!strcmp(normType, m_pTracks[i]->GetType())) {
- 			if (subType) {
--				if (normType == MP4_AUDIO_TRACK_TYPE) {
-+				if (!strcmp(normType,MP4_AUDIO_TRACK_TYPE)) {
- 					if (subType != GetTrackEsdsObjectTypeId(m_pTracks[i]->GetId())) {
- 						continue;
- 					}
--				} else if (normType == MP4_VIDEO_TRACK_TYPE) {
-+				} else if (!strcmp(normType,MP4_VIDEO_TRACK_TYPE)) {
- 					if (subType != GetTrackEsdsObjectTypeId(m_pTracks[i]->GetId())) {
- 						continue;
- 					}
-@@ -2278,11 +2278,11 @@
-   for (u_int32_t i = 0; i < m_pTracks.Size(); i++) {
-     if (!strcmp(normType, m_pTracks[i]->GetType())) {
-       if (subType) {
--	if (normType == MP4_AUDIO_TRACK_TYPE) {
-+	if (!strcmp(normType,MP4_AUDIO_TRACK_TYPE)) {
- 	  if (subType != GetTrackEsdsObjectTypeId(m_pTracks[i]->GetId())) {
- 	    continue;
- 	  }
--	} else if (normType == MP4_VIDEO_TRACK_TYPE) {
-+	} else if (!strcmp(normType,MP4_VIDEO_TRACK_TYPE)) {
- 	  if (subType != GetTrackEsdsObjectTypeId(m_pTracks[i]->GetId())) {
- 	    continue;
- 	  }
---- a/common/mp4v2/mp4file.h
-+++ b/common/mp4v2/mp4file.h
-@@ -700,7 +700,7 @@
- 	const char* TempFileName();
- 	void Rename(const char* existingFileName, const char* newFileName);
- 
--	void ProtectWriteOperation(char* where);
-+	void ProtectWriteOperation(const char* where);
- 
- 	void FindIntegerProperty(const char* name, 
- 		MP4Property** ppProperty, u_int32_t* pIndex = NULL);
---- a/common/mp4v2/mp4property.cpp
-+++ b/common/mp4v2/mp4property.cpp
-@@ -313,7 +313,7 @@
- 
- // MP4StringProperty
- 
--MP4StringProperty::MP4StringProperty(char* name, 
-+MP4StringProperty::MP4StringProperty(const char* name,
- 	bool useCountedFormat, bool useUnicode)
- 	: MP4Property(name)
- {
-@@ -420,7 +420,7 @@
- 
- // MP4BytesProperty
- 
--MP4BytesProperty::MP4BytesProperty(char* name, u_int32_t valueSize,
-+MP4BytesProperty::MP4BytesProperty(const char* name, u_int32_t valueSize,
-                                    u_int32_t defaultValueSize)
- 	: MP4Property(name)
- {
-@@ -549,7 +549,7 @@
- 
- // MP4TableProperty
- 
--MP4TableProperty::MP4TableProperty(char* name, MP4IntegerProperty* pCountProperty)
-+MP4TableProperty::MP4TableProperty(const char* name, MP4IntegerProperty* pCountProperty)
- 	: MP4Property(name) 
- {
- 	m_pCountProperty = pCountProperty;
-@@ -725,7 +725,7 @@
- 
- // MP4DescriptorProperty
-   
--MP4DescriptorProperty::MP4DescriptorProperty(char* name, 
-+MP4DescriptorProperty::MP4DescriptorProperty(const char* name,
- 	u_int8_t tagsStart, u_int8_t tagsEnd, bool mandatory, bool onlyOne)
- 	: MP4Property(name) 
- { 
---- a/common/mp4v2/mp4property.h
-+++ b/common/mp4v2/mp4property.h
-@@ -100,7 +100,7 @@
- 
- class MP4IntegerProperty : public MP4Property {
- protected:
--	MP4IntegerProperty(char* name)
-+	MP4IntegerProperty(const char* name)
- 		: MP4Property(name) { };
- 
- public:
-@@ -118,7 +118,7 @@
- #define MP4INTEGER_PROPERTY_DECL2(isize, xsize) \
- 	class MP4Integer##xsize##Property : public MP4IntegerProperty { \
- 	public: \
--		MP4Integer##xsize##Property(char* name) \
-+		MP4Integer##xsize##Property(const char* name) \
- 			: MP4IntegerProperty(name) { \
- 			SetCount(1); \
- 			m_values[0] = 0; \
-@@ -188,7 +188,7 @@
- 
- class MP4BitfieldProperty : public MP4Integer64Property {
- public:
--	MP4BitfieldProperty(char* name, u_int8_t numBits)
-+	MP4BitfieldProperty(const char* name, u_int8_t numBits)
- 		: MP4Integer64Property(name) {
- 		ASSERT(numBits != 0);
- 		ASSERT(numBits <= 64);
-@@ -213,7 +213,7 @@
- 
- class MP4Float32Property : public MP4Property {
- public:
--	MP4Float32Property(char* name)
-+	MP4Float32Property(const char* name)
- 		: MP4Property(name) {
- 		m_useFixed16Format = false;
- 		m_useFixed32Format = false;
-@@ -280,7 +280,7 @@
- 
- class MP4StringProperty : public MP4Property {
- public:
--	MP4StringProperty(char* name, 
-+	MP4StringProperty(const char* name,
- 	  bool useCountedFormat = false, bool useUnicode = false);
- 
- 	~MP4StringProperty();
-@@ -355,7 +355,7 @@
- 
- class MP4BytesProperty : public MP4Property {
- public:
--	MP4BytesProperty(char* name, u_int32_t valueSize = 0,
-+	MP4BytesProperty(const char* name, u_int32_t valueSize = 0,
-                          u_int32_t defaultValueSize = 0);
- 
- 	~MP4BytesProperty();
-@@ -419,7 +419,7 @@
- 
- class MP4TableProperty : public MP4Property {
- public:
--	MP4TableProperty(char* name, MP4IntegerProperty* pCountProperty);
-+	MP4TableProperty(const char* name, MP4IntegerProperty* pCountProperty);
- 
- 	~MP4TableProperty();
- 
-@@ -469,7 +469,7 @@
- 
- class MP4DescriptorProperty : public MP4Property {
- public:
--	MP4DescriptorProperty(char* name = NULL, 
-+	MP4DescriptorProperty(const char* name = NULL,
- 	  u_int8_t tagsStart = 0, u_int8_t tagsEnd = 0,
- 	  bool mandatory = false, bool onlyOne = false);
- 
-@@ -531,7 +531,7 @@
- 
- class MP4QosQualifierProperty : public MP4DescriptorProperty {
- public:
--	MP4QosQualifierProperty(char* name = NULL, 
-+	MP4QosQualifierProperty(const char* name = NULL,
- 	  u_int8_t tagsStart = 0, u_int8_t tagsEnd = 0,
- 	  bool mandatory = false, bool onlyOne = false) :
- 	MP4DescriptorProperty(name, tagsStart, tagsEnd, mandatory, onlyOne) { }
---- a/common/mp4v2/mp4track.cpp
-+++ b/common/mp4v2/mp4track.cpp
-@@ -1360,7 +1360,7 @@
-   }
- }
- 
--MP4Atom* MP4Track::AddAtom(char* parentName, char* childName)
-+MP4Atom* MP4Track::AddAtom(const char* parentName, const char* childName)
- {
- 	MP4Atom* pChildAtom = MP4Atom::CreateAtom(childName);
- 
---- a/common/mp4v2/mp4track.h
-+++ b/common/mp4v2/mp4track.h
-@@ -168,7 +168,7 @@
- 	void UpdateSyncSamples(MP4SampleId sampleId, 
- 		bool isSyncSample);
- 
--	MP4Atom* AddAtom(char* parentName, char* childName);
-+	MP4Atom* AddAtom(const char* parentName, const char* childName);
- 
- 	void UpdateDurations(MP4Duration duration);
- 	MP4Duration ToMovieDuration(MP4Duration trackDuration);
---- a/common/mp4v2/ocidescriptors.cpp
-+++ b/common/mp4v2/ocidescriptors.cpp
-@@ -171,7 +171,7 @@
- 
- class MP4CreatorTableProperty : public MP4TableProperty {
- public:
--	MP4CreatorTableProperty(char* name, MP4Integer8Property* pCountProperty) :
-+	MP4CreatorTableProperty(const char* name, MP4Integer8Property* pCountProperty) :
- 		MP4TableProperty(name, pCountProperty) {
- 	};
- protected:
-- 
2.9.4


