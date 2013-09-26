Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B4F2560A88
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2013 23:58:59 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 26 Sep 2013 16:59:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,989,1371106800"; d="scan'208";a="401691795"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.66])
	by fmsmga001.fm.intel.com with ESMTP; 26 Sep 2013 16:59:00 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Sep 2013 00:58:53 +0100
Message-Id: <4910c25b31ba1d2bd878aca1218b281ef673f6e0.1380239858.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1380239858.git.paul.eggleton@linux.intel.com>
References: <cover.1380239858.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1380239858.git.paul.eggleton@linux.intel.com>
References: <cover.1380239858.git.paul.eggleton@linux.intel.com>
Subject: [meta-multimedia][PATCH 1/2] faac: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Sep 2013 23:58:59 -0000

Originally based on the recipe from OE-Classic. Changes from that
version:

* Update to 1.28
* Add a patch from Debian to fix compilation errors
* Split out staticdev files into their own package
* Set reasonable SUMMARY instead of DESCRIPTION
* Add LIC_FILES_CHKSUM
* Drop PRIORITY and default value of S
* Rearrange recipe into logical order

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-multimedia/faac/faac_1.28.bb           |  21 ++
 .../recipes-multimedia/faac/files/build-fix.patch  | 332 +++++++++++++++++++++
 2 files changed, 353 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/faac/faac_1.28.bb
 create mode 100644 meta-multimedia/recipes-multimedia/faac/files/build-fix.patch

diff --git a/meta-multimedia/recipes-multimedia/faac/faac_1.28.bb b/meta-multimedia/recipes-multimedia/faac/faac_1.28.bb
new file mode 100644
index 0000000..c7dcdb9
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/faac/faac_1.28.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Freeware Advanced Audio Coder (MPEG2-AAC, MPEG4-AAC)"
+SECTION = "libs"
+LICENSE = "LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
+                    file://libfaac/coder.h;beginline=5;endline=17;md5=fa1fd6a5fa8cdc877d63a12530d273e0"
+
+inherit autotools
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/faac/${BPN}-${PV}.tar.gz \
+           file://build-fix.patch"
+
+SRC_URI[md5sum] = "80763728d392c7d789cde25614c878f6"
+SRC_URI[sha256sum] = "c5141199f4cfb17d749c36ba8cfe4b25f838da67c22f0fec40228b6b9c3d19df"
+
+PACKAGES =+ "lib${PN} lib${PN}-dev"
+
+FILES_${PN} = " ${bindir}/faac "
+FILES_lib${PN} = " ${libdir}/libfaac.so.*"
+FILES_lib${PN}-dev = "${includedir}/faac.h ${includedir}/faaccfg.h ${libdir}/libfaac.so ${libdir}/libfaac.la"
+FILES_lib${PN}-staticdev = "${libdir}/libfaac.a"
+
diff --git a/meta-multimedia/recipes-multimedia/faac/files/build-fix.patch b/meta-multimedia/recipes-multimedia/faac/files/build-fix.patch
new file mode 100644
index 0000000..83cff8f
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/faac/files/build-fix.patch
@@ -0,0 +1,332 @@
+Patch fixing build error and warnings. Error consisted of redefining
+strcasestr function from string.h. Warnings consisted of deprecated conversions
+of string constants to char*, using '%llu' for type uint64_t (which on 64 bit
+systems, is defined as unsigned long int by stdint.h), and using '==' for
+equality of two strings.
+
+Patch originally from Debian.
+
+Upstream-Status: Pending
+
+==========================================================================
+--- a/common/mp4v2/mpeg4ip.h
++++ b/common/mp4v2/mpeg4ip.h
+@@ -120,14 +120,6 @@
+ #endif
+ #include <sys/param.h>
+ 
+-#ifdef __cplusplus
+-extern "C" {
+-#endif
+-char *strcasestr(const char *haystack, const char *needle);
+-#ifdef __cplusplus
+-}
+-#endif
+-
+ #define OPEN_RDWR O_RDWR
+ #define OPEN_CREAT O_CREAT 
+ #define OPEN_RDONLY O_RDONLY
+@@ -135,7 +127,6 @@
+ #define closesocket close
+ #define IOSBINARY ios::bin
+ 
+-#if SIZEOF_LONG == 8
+ #define MAX_UINT64 -1LU
+ #define D64F "ld"
+ #define U64F  "lu"
+@@ -143,15 +134,6 @@
+ 
+ #define TO_D64(a) (a##L)
+ #define TO_U64(a) (a##LU)
+-#else
+-#define MAX_UINT64 -1LLU
+-#define D64F "lld"
+-#define U64F  "llu"
+-#define X64F "llx"
+-
+-#define TO_D64(a) (a##LL)
+-#define TO_U64(a) (a##LLU)
+-#endif
+ 
+ #ifdef HAVE_FPOS_T___POS
+ #define FPOS_TO_VAR(fpos, typed, var) (var) = (typed)((fpos).__pos)
+--- a/configure.in
++++ b/configure.in
+@@ -4,6 +4,9 @@
+ AM_INIT_AUTOMAKE
+ 
+ AM_CONFIG_HEADER(config.h)
++AH_TOP([#ifndef CONFIG_H
++#define CONFIG_H])
++AH_BOTTOM([#endif /* CONFIG_H */])
+ 
+ AC_ARG_WITH( mp4v2,  [  --with-mp4v2            compile libmp4v2],WITHMP4V2=$withval, WITHMP4V2=yes)
+ AC_ARG_ENABLE( drm,  [  --enable-drm            Digital Radio Mondiale support], enable_drm=$enableval, enable_drm=no)
+--- a/common/mp4v2/atom_avcC.cpp
++++ b/common/mp4v2/atom_avcC.cpp
+@@ -29,7 +29,7 @@
+ class SizeTableProperty : public MP4TableProperty 
+ {
+  public:
+-  SizeTableProperty(char *name, MP4IntegerProperty *pCountProperty) :
++  SizeTableProperty(const char *name, MP4IntegerProperty *pCountProperty) :
+     MP4TableProperty(name, pCountProperty) {};
+  protected:
+   void ReadEntry(MP4File *pFile, u_int32_t index) {
+--- a/common/mp4v2/atom_ohdr.cpp
++++ b/common/mp4v2/atom_ohdr.cpp
+@@ -21,7 +21,7 @@
+       \param useCountedFormat    counted format flag.
+       \param useUnicode          unicode flag.
+   */
+-	OhdrMP4StringProperty(char* name, bool useCountedFormat = false,
++	OhdrMP4StringProperty(const char* name, bool useCountedFormat = false,
+     bool useUnicode = false): MP4StringProperty(name, useCountedFormat,
+     useUnicode) {
+   }
+--- a/common/mp4v2/atom_stz2.cpp
++++ b/common/mp4v2/atom_stz2.cpp
+@@ -30,7 +30,7 @@
+ class MP4HalfSizeTableProperty : public MP4TableProperty
+ {
+ public:
+-  MP4HalfSizeTableProperty(char *name, MP4IntegerProperty *pCountProperty) :
++  MP4HalfSizeTableProperty(const char *name, MP4IntegerProperty *pCountProperty) :
+     MP4TableProperty(name, pCountProperty) {};
+ 
+   // The count is half the actual size
+--- a/common/mp4v2/mp4atom.cpp
++++ b/common/mp4v2/mp4atom.cpp
+@@ -806,7 +806,7 @@
+ 	AddProperty(new MP4Integer24Property("flags"));
+ }
+ 
+-void MP4Atom::AddReserved(char* name, u_int32_t size) 
++void MP4Atom::AddReserved(const char* name, u_int32_t size)
+ {
+ 	MP4BytesProperty* pReserved = new MP4BytesProperty(name, size); 
+ 	pReserved->SetReadOnly();
+--- a/common/mp4v2/mp4atom.h
++++ b/common/mp4v2/mp4atom.h
+@@ -204,7 +204,7 @@
+ 
+ 	void AddVersionAndFlags();
+ 
+-	void AddReserved(char* name, u_int32_t size);
++	void AddReserved(const char* name, u_int32_t size);
+ 
+ 	void ExpectChildAtom(const char* name, 
+ 		bool mandatory, bool onlyOne = true);
+--- a/common/mp4v2/mp4file.cpp
++++ b/common/mp4v2/mp4file.cpp
+@@ -718,7 +718,7 @@
+ 	}
+ }
+ 
+-void MP4File::ProtectWriteOperation(char* where)
++void MP4File::ProtectWriteOperation(const char* where)
+ {
+ 	if (m_mode == 'r') {
+ 		throw new MP4Error("operation not permitted in read mode", where);
+@@ -1274,7 +1274,7 @@
+ }
+ 
+ // NULL terminated list of brands which require the IODS atom
+-char *brandsWithIods[] = { "mp42",
++const char *brandsWithIods[] = { "mp42",
+                            "isom",
+                            NULL};
+ 
+@@ -2211,11 +2211,11 @@
+ 	for (u_int32_t i = 0; i < m_pTracks.Size(); i++) {
+ 		if (!strcmp(normType, m_pTracks[i]->GetType())) {
+ 			if (subType) {
+-				if (normType == MP4_AUDIO_TRACK_TYPE) {
++				if (!strcmp(normType,MP4_AUDIO_TRACK_TYPE)) {
+ 					if (subType != GetTrackEsdsObjectTypeId(m_pTracks[i]->GetId())) {
+ 						continue;
+ 					}
+-				} else if (normType == MP4_VIDEO_TRACK_TYPE) {
++				} else if (!strcmp(normType,MP4_VIDEO_TRACK_TYPE)) {
+ 					if (subType != GetTrackEsdsObjectTypeId(m_pTracks[i]->GetId())) {
+ 						continue;
+ 					}
+@@ -2278,11 +2278,11 @@
+   for (u_int32_t i = 0; i < m_pTracks.Size(); i++) {
+     if (!strcmp(normType, m_pTracks[i]->GetType())) {
+       if (subType) {
+-	if (normType == MP4_AUDIO_TRACK_TYPE) {
++	if (!strcmp(normType,MP4_AUDIO_TRACK_TYPE)) {
+ 	  if (subType != GetTrackEsdsObjectTypeId(m_pTracks[i]->GetId())) {
+ 	    continue;
+ 	  }
+-	} else if (normType == MP4_VIDEO_TRACK_TYPE) {
++	} else if (!strcmp(normType,MP4_VIDEO_TRACK_TYPE)) {
+ 	  if (subType != GetTrackEsdsObjectTypeId(m_pTracks[i]->GetId())) {
+ 	    continue;
+ 	  }
+--- a/common/mp4v2/mp4file.h
++++ b/common/mp4v2/mp4file.h
+@@ -700,7 +700,7 @@
+ 	const char* TempFileName();
+ 	void Rename(const char* existingFileName, const char* newFileName);
+ 
+-	void ProtectWriteOperation(char* where);
++	void ProtectWriteOperation(const char* where);
+ 
+ 	void FindIntegerProperty(const char* name, 
+ 		MP4Property** ppProperty, u_int32_t* pIndex = NULL);
+--- a/common/mp4v2/mp4property.cpp
++++ b/common/mp4v2/mp4property.cpp
+@@ -313,7 +313,7 @@
+ 
+ // MP4StringProperty
+ 
+-MP4StringProperty::MP4StringProperty(char* name, 
++MP4StringProperty::MP4StringProperty(const char* name,
+ 	bool useCountedFormat, bool useUnicode)
+ 	: MP4Property(name)
+ {
+@@ -420,7 +420,7 @@
+ 
+ // MP4BytesProperty
+ 
+-MP4BytesProperty::MP4BytesProperty(char* name, u_int32_t valueSize,
++MP4BytesProperty::MP4BytesProperty(const char* name, u_int32_t valueSize,
+                                    u_int32_t defaultValueSize)
+ 	: MP4Property(name)
+ {
+@@ -549,7 +549,7 @@
+ 
+ // MP4TableProperty
+ 
+-MP4TableProperty::MP4TableProperty(char* name, MP4IntegerProperty* pCountProperty)
++MP4TableProperty::MP4TableProperty(const char* name, MP4IntegerProperty* pCountProperty)
+ 	: MP4Property(name) 
+ {
+ 	m_pCountProperty = pCountProperty;
+@@ -725,7 +725,7 @@
+ 
+ // MP4DescriptorProperty
+   
+-MP4DescriptorProperty::MP4DescriptorProperty(char* name, 
++MP4DescriptorProperty::MP4DescriptorProperty(const char* name,
+ 	u_int8_t tagsStart, u_int8_t tagsEnd, bool mandatory, bool onlyOne)
+ 	: MP4Property(name) 
+ { 
+--- a/common/mp4v2/mp4property.h
++++ b/common/mp4v2/mp4property.h
+@@ -100,7 +100,7 @@
+ 
+ class MP4IntegerProperty : public MP4Property {
+ protected:
+-	MP4IntegerProperty(char* name)
++	MP4IntegerProperty(const char* name)
+ 		: MP4Property(name) { };
+ 
+ public:
+@@ -118,7 +118,7 @@
+ #define MP4INTEGER_PROPERTY_DECL2(isize, xsize) \
+ 	class MP4Integer##xsize##Property : public MP4IntegerProperty { \
+ 	public: \
+-		MP4Integer##xsize##Property(char* name) \
++		MP4Integer##xsize##Property(const char* name) \
+ 			: MP4IntegerProperty(name) { \
+ 			SetCount(1); \
+ 			m_values[0] = 0; \
+@@ -188,7 +188,7 @@
+ 
+ class MP4BitfieldProperty : public MP4Integer64Property {
+ public:
+-	MP4BitfieldProperty(char* name, u_int8_t numBits)
++	MP4BitfieldProperty(const char* name, u_int8_t numBits)
+ 		: MP4Integer64Property(name) {
+ 		ASSERT(numBits != 0);
+ 		ASSERT(numBits <= 64);
+@@ -213,7 +213,7 @@
+ 
+ class MP4Float32Property : public MP4Property {
+ public:
+-	MP4Float32Property(char* name)
++	MP4Float32Property(const char* name)
+ 		: MP4Property(name) {
+ 		m_useFixed16Format = false;
+ 		m_useFixed32Format = false;
+@@ -280,7 +280,7 @@
+ 
+ class MP4StringProperty : public MP4Property {
+ public:
+-	MP4StringProperty(char* name, 
++	MP4StringProperty(const char* name,
+ 	  bool useCountedFormat = false, bool useUnicode = false);
+ 
+ 	~MP4StringProperty();
+@@ -355,7 +355,7 @@
+ 
+ class MP4BytesProperty : public MP4Property {
+ public:
+-	MP4BytesProperty(char* name, u_int32_t valueSize = 0,
++	MP4BytesProperty(const char* name, u_int32_t valueSize = 0,
+                          u_int32_t defaultValueSize = 0);
+ 
+ 	~MP4BytesProperty();
+@@ -419,7 +419,7 @@
+ 
+ class MP4TableProperty : public MP4Property {
+ public:
+-	MP4TableProperty(char* name, MP4IntegerProperty* pCountProperty);
++	MP4TableProperty(const char* name, MP4IntegerProperty* pCountProperty);
+ 
+ 	~MP4TableProperty();
+ 
+@@ -469,7 +469,7 @@
+ 
+ class MP4DescriptorProperty : public MP4Property {
+ public:
+-	MP4DescriptorProperty(char* name = NULL, 
++	MP4DescriptorProperty(const char* name = NULL,
+ 	  u_int8_t tagsStart = 0, u_int8_t tagsEnd = 0,
+ 	  bool mandatory = false, bool onlyOne = false);
+ 
+@@ -531,7 +531,7 @@
+ 
+ class MP4QosQualifierProperty : public MP4DescriptorProperty {
+ public:
+-	MP4QosQualifierProperty(char* name = NULL, 
++	MP4QosQualifierProperty(const char* name = NULL,
+ 	  u_int8_t tagsStart = 0, u_int8_t tagsEnd = 0,
+ 	  bool mandatory = false, bool onlyOne = false) :
+ 	MP4DescriptorProperty(name, tagsStart, tagsEnd, mandatory, onlyOne) { }
+--- a/common/mp4v2/mp4track.cpp
++++ b/common/mp4v2/mp4track.cpp
+@@ -1360,7 +1360,7 @@
+   }
+ }
+ 
+-MP4Atom* MP4Track::AddAtom(char* parentName, char* childName)
++MP4Atom* MP4Track::AddAtom(const char* parentName, const char* childName)
+ {
+ 	MP4Atom* pChildAtom = MP4Atom::CreateAtom(childName);
+ 
+--- a/common/mp4v2/mp4track.h
++++ b/common/mp4v2/mp4track.h
+@@ -168,7 +168,7 @@
+ 	void UpdateSyncSamples(MP4SampleId sampleId, 
+ 		bool isSyncSample);
+ 
+-	MP4Atom* AddAtom(char* parentName, char* childName);
++	MP4Atom* AddAtom(const char* parentName, const char* childName);
+ 
+ 	void UpdateDurations(MP4Duration duration);
+ 	MP4Duration ToMovieDuration(MP4Duration trackDuration);
+--- a/common/mp4v2/ocidescriptors.cpp
++++ b/common/mp4v2/ocidescriptors.cpp
+@@ -171,7 +171,7 @@
+ 
+ class MP4CreatorTableProperty : public MP4TableProperty {
+ public:
+-	MP4CreatorTableProperty(char* name, MP4Integer8Property* pCountProperty) :
++	MP4CreatorTableProperty(const char* name, MP4Integer8Property* pCountProperty) :
+ 		MP4TableProperty(name, pCountProperty) {
+ 	};
+ protected:
-- 
1.8.1.2


