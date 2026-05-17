Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DFA0CD4F25
	for <webhook@archiver.kernel.org>; Sun, 17 May 2026 08:24:30 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20202.1779006267098858457
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2026 01:24:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=aRuEZEZ9;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=NAA7/of0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H2uF5o1325206
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=H4IEWZ+4WUy
	pHznjxShowl19Yi/MvKmCXnVSim/Byxk=; b=aRuEZEZ9XYpTC7vo5SDWrHP6Rwl
	jLJ6gnaWCpkTYulnXhS4cTwHUrtAlz3/H90Y/VyTMiqw0XAERjhA0P2X4zTLeV7k
	Q+7khPv0nSHI2TtmJhrvWGT5lBEOUZ1qDn7zDyS+hc82dFzS1ton5a3VlrbS09vI
	vECFv7287Wp6BRyfoPGsiY4nGvWHbh2YBzg/zbSI7uE55fxNgc1S0EXU9/JNqz7K
	p1TugRZlDMRXE4UX1uRNvoXua+BzN+m218fNzjJei/N1IZqtW14pf9Txr6ipfzn5
	87ztdXFOWVZcn66BLLVW4a8BMgANdpuuJyHdURnkB/lcHjzIu8erdsPFjPA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hv7tctv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:26 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-369467ab5bfso928729a91.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 01:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779006266; x=1779611066; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H4IEWZ+4WUypHznjxShowl19Yi/MvKmCXnVSim/Byxk=;
        b=NAA7/of05XhF2GEgar2GKG81b0K0FXn4Pj+bvZFVOeM1SO6KB3e58Xiz+ch+pK4Ybq
         hoi+gdYsq6c4fFxp/TWx97bAhcuSpt9R4LjDbwhgBM6unaS10gA9fj3yKrEbP8rV0Bg0
         EiTRvHG2tegYfdFzNOV4UoKP3YdCyKRvYCkz+3cDFEy/k2Pj1CO+UQBiPb3onrmkt/F4
         uIglGmWGR2SZAWoFfTfmHh7OEjHHwqMneAjHeq6Oc3l3v2gr7wc1aChrtbmXeCvQiDPj
         nWOdsYOhb3bXwQ1H9bxA+O5icjQ2jHIWzulN8NQ2asX4Vgry+YBM8itVg80yXxvo4chW
         F+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779006266; x=1779611066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H4IEWZ+4WUypHznjxShowl19Yi/MvKmCXnVSim/Byxk=;
        b=pQ7d8g4SJwfYvlPn6eBKvdmGk4WtrE3p8a7NuKuo4VxrVd8/axcd6/sJXVvnkll38b
         //kuAXjb0LzAYii1rW/oUA/PaufcfCi2oL8kQpYyUGjfBdkR5jBHfr6HbmfHrddCh8b3
         vXzDuElfYBXAJgdJ/51IzVIxnKtKWNRNXNvYYUQ1ONSacujV30SbiZqR5+53XPALQivp
         e8stiVS4CRU13uUUPqLFfoKLX6FGC6cmXsutFJ0BtVQzzZZfuWPjbNPfURwgrEXCV7qp
         Fj7Omq0dowOypgu1vPE7lj1h9JKFNzEFaCjpFLEoc2nrM5q+Qr2D92XolXQFPF++sYkd
         TRRg==
X-Gm-Message-State: AOJu0YxLLMQ7EbUwgkxwZ7yuzMjYlTmgvd/UFLVGRCDa6V3Rm60TZ4bR
	YDn53L5HcJDl+m5iA6gXdM5n9jU7jOnU0U8WNlt1rNI/9HWO4YywWw9HsSMFqKpLO6p6Cn4NuJ+
	sleciUdfddo5mSEDPagfU6m2YC/DOX4HZ8WmfHAEE/YHOV4vj7/e35rp1Ue7rUsHItCbrHniOCa
	AdeKXtsSkZcXIA/daU2UxYew==
X-Gm-Gg: Acq92OGa4AduvakSYjDy7JwDRXb/A/9FmAqdS1wh2JxpsfSdWgqhvNCF01lRsxqafqK
	QbpIsRndnIfTrtVWnV1XmbgkofDPO9SiafINtElCFyCtWjrmLXL2KS5szTtoZlNEvpcrs7y+erS
	m6TRxPasbdqcAyburmTwRnUhcEubBPAPjIDDJEp4TYekMNMM9EFHIK4zcFO+0iBLl6TqE65L/G3
	sz6GafZqTE/R7KRqd9ORCRPslbShfaVCCXiWT2n6KmlqgSxQjl90cT2WzLYgZauD/tt3HtBW06u
	mdJLPlzKIbh0mzyOaJcaoBANCqFeUBrLeNqPa/bHZcJ5tvWxfTt98zsoTVgIDRl/8i1BlOSRNsA
	v2TJ8+UQrXjqni7gj53XRLginYtBS/CH+lD4ZkkGnFSgvhRYKbsib
X-Received: by 2002:a17:90b:582d:b0:369:946d:32fc with SMTP id 98e67ed59e1d1-369946d408bmr3233884a91.2.1779006265904;
        Sun, 17 May 2026 01:24:25 -0700 (PDT)
X-Received: by 2002:a17:90b:582d:b0:369:946d:32fc with SMTP id 98e67ed59e1d1-369946d408bmr3233866a91.2.1779006265314;
        Sun, 17 May 2026 01:24:25 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36956f3723bsm2765033a91.1.2026.05.17.01.24.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 01:24:25 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-oe][PATCH 17/29] jsoncpp: Fix C++11 ABI breakage when compiled with C++17
Date: Sun, 17 May 2026 13:49:45 +0530
Message-ID: <30b410cba23eda84a593d9b7819a87c484283f95.1779004358.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
References: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDA4NyBTYWx0ZWRfX4JFlVIiznKe+
 69X8L8TAz3e25RZ6ScWI1192IAh0bHbC9YLnVwXdyuqpvwrBPktCIQ3Kzp/TIS3aWeBAnOSPpnM
 lZIubmCmdCqYWlQXUY4VsLWwN9m3QM5DgMvrc4K1my5p3pl3P1eIyxEvwCztFppiz4e6e09hGO5
 SStG1JdaVJL7KHe7i66A9dfiojCXQFR/vgfkMHi7HEhX3QhcTYTB0nW5PzxqrS/oNfhwyWoYYKV
 1RKJaDdDU3Qr9FmsYtAhCFTABsr8cDXtoLY95Uixkgjjd2G2+zlpiBil9F8F1A9Spv5yu3ag21x
 wK6Y9pLvFggpFbZYOlyeft4EwKKwYoVlRM0MeYNV+msuGw/GPV7YCBloArId27D7GrVHdM+nJWV
 HE4rgAMns+kWyGMCHmdAkyDnG/tdUFC7p2fVNmDOdGzh4a89HN4WaNpquekdmnMmIpgP9PwMZQL
 ETtrgYJvQDsiMDiO7fw==
X-Authority-Analysis: v=2.4 cv=a8oAM0SF c=1 sm=1 tr=0 ts=6a097b3a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=NEAV23lmAAAA:8
 a=m8ToADvmAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=DmCcdNNcHYh1RkFbEZYA:9
 a=rl5im9kqc5Lf4LNbBjHf:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-ORIG-GUID: lpc1Eh_Lcklyx-UZ53NuhVQzkCCEBeCH
X-Proofpoint-GUID: lpc1Eh_Lcklyx-UZ53NuhVQzkCCEBeCH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170087
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127030

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

When jsoncpp is built with C++17, 1.9.7 drops several legacy overloads
that C++11 consumers can still link against.

Backport the upstream fix to restore compatibility.

Fixes errors such as:
|  undefined reference to `Json::Value::operator[](char const*)'

Patch can be dropped when we move to 1.9.8.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 9be9388574bbddcd6f51ffa0f006e42a11ddcf81)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 ...akage-when-compiled-with-C-17-1668-1.patch | 368 ++++++++++++++++++
 .../recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb |   1 +
 2 files changed, 369 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-Fix-C-11-ABI-breakage-when-compiled-with-C-17-1668-1.patch

diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-Fix-C-11-ABI-breakage-when-compiled-with-C-17-1668-1.patch b/meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-Fix-C-11-ABI-breakage-when-compiled-with-C-17-1668-1.patch
new file mode 100644
index 0000000000..887bf14d2a
--- /dev/null
+++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-Fix-C-11-ABI-breakage-when-compiled-with-C-17-1668-1.patch
@@ -0,0 +1,368 @@
+From c67034e4b4c722579ee15fddb8e4af8f04252b08 Mon Sep 17 00:00:00 2001
+From: Jordan Bayles <bayles.jordan@gmail.com>
+Date: Thu, 9 Apr 2026 10:37:08 -0700
+Subject: [PATCH] Fix C++11 ABI breakage when compiled with C++17 #1668 (#1675)
+
+When JSONCPP_HAS_STRING_VIEW was defined, the library dropped the
+`const char*` and `const String&` overloads for `operator[]`, `get`,
+`removeMember`, and `isMember`, breaking ABI compatibility for projects
+consuming the library with C++11.
+
+This change unconditionally declares and defines the legacy overloads
+so they are always exported, restoring compatibility.
+
+This commit completely eliminates the ABI breakage that occurs across
+C++ standard boundaries when using `std::string_view`.
+
+Previously, when the library was built with C++17+, CMake would leak
+`JSONCPP_HAS_STRING_VIEW=1` as a PUBLIC definition. A C++11 consumer
+would receive this definition, attempt to parse the header, and fail
+with compiler errors because `std::string_view` is not available in
+their environment.
+
+Conversely, if the library was built in C++11 (without `string_view`
+symbols), a C++17 consumer would naturally define
+`JSONCPP_HAS_STRING_VIEW` based on `__cplusplus` inside `value.h`. The
+consumer would then call the declared `string_view` methods, resulting
+in linker errors because the methods weren't compiled into the library.
+
+By moving all `std::string_view` overloads directly into `value.h` as
+`inline` methods that delegate to the fundamental
+`const char*, const char*` methods:
+1. The consumer's compiler dictates whether the overloads are visible
+   (via `__cplusplus >= 201703L`).
+2. The consumer compiles the inline wrappers locally, removing any
+   reliance on the library's exported symbols for `std::string_view`.
+3. CMake no longer needs to pollute the consumer's environment with
+   PUBLIC compile definitions.
+
+Backported only the library/header changes. Upstream CI and example
+test additions are omitted.
+
+Upstream-Status: Backport [https://github.com/open-source-parsers/jsoncpp/commit/c67034e4b4c722579ee15fddb8e4af8f04252b08]
+Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
+---
+ include/json/value.h        | 54 ++++++++++++++++++++----------
+ src/lib_json/CMakeLists.txt |  9 -----
+ src/lib_json/json_value.cpp | 66 -------------------------------------
+ 3 files changed, 36 insertions(+), 93 deletions(-)
+
+diff --git a/include/json/value.h b/include/json/value.h
+index f32f45609365..2007e6b4251d 100644
+--- a/include/json/value.h
++++ b/include/json/value.h
+@@ -357,7 +357,8 @@ public:
+   Value(const StaticString& value);
+   Value(const String& value);
+ #ifdef JSONCPP_HAS_STRING_VIEW
+-  Value(std::string_view value);
++  inline Value(std::string_view value)
++      : Value(value.data(), value.data() + value.length()) {}
+ #endif
+   Value(bool value);
+   Value(std::nullptr_t ptr) = delete;
+@@ -405,7 +406,14 @@ public:
+   /** Get string_view of string-value.
+    *  \return false if !string. (Seg-fault if str is NULL.)
+    */
+-  bool getString(std::string_view* str) const;
++  inline bool getString(std::string_view* str) const {
++    char const* begin;
++    char const* end;
++    if (!getString(&begin, &end))
++      return false;
++    *str = std::string_view(begin, static_cast<size_t>(end - begin));
++    return true;
++  }
+ #endif
+   Int asInt() const;
+   UInt asUInt() const;
+@@ -496,12 +504,19 @@ public:
+ #ifdef JSONCPP_HAS_STRING_VIEW
+   /// Access an object value by name, create a null member if it does not exist.
+   /// \param key may contain embedded nulls.
+-  Value& operator[](std::string_view key);
++  inline Value& operator[](std::string_view key) {
++    return resolveReference(key.data(), key.data() + key.length());
++  }
+   /// Access an object value by name, returns null if there is no member with
+   /// that name.
+   /// \param key may contain embedded nulls.
+-  const Value& operator[](std::string_view key) const;
+-#else
++  inline const Value& operator[](std::string_view key) const {
++    Value const* found = find(key.data(), key.data() + key.length());
++    if (!found)
++      return nullSingleton();
++    return *found;
++  }
++#endif
+   /// Access an object value by name, create a null member if it does not exist.
+   /// \note Because of our implementation, keys are limited to 2^30 -1 chars.
+   /// Exceeding that will cause an exception.
+@@ -516,7 +531,6 @@ public:
+   /// that name.
+   /// \param key may contain embedded nulls.
+   const Value& operator[](const String& key) const;
+-#endif
+   /** \brief Access an object value by name, create a null member if it does not
+    * exist.
+    *
+@@ -533,8 +547,10 @@ public:
+ #ifdef JSONCPP_HAS_STRING_VIEW
+   /// Return the member named key if it exist, defaultValue otherwise.
+   /// \note deep copy
+-  Value get(std::string_view key, const Value& defaultValue) const;
+-#else
++  inline Value get(std::string_view key, const Value& defaultValue) const {
++    return get(key.data(), key.data() + key.length(), defaultValue);
++  }
++#endif
+   /// Return the member named key if it exist, defaultValue otherwise.
+   /// \note deep copy
+   Value get(const char* key, const Value& defaultValue) const;
+@@ -542,7 +558,6 @@ public:
+   /// \note deep copy
+   /// \param key may contain embedded nulls.
+   Value get(const String& key, const Value& defaultValue) const;
+-#endif
+   /// Return the member named key if it exist, defaultValue otherwise.
+   /// \note deep copy
+   /// \note key may contain embedded nulls.
+@@ -588,13 +603,14 @@ public:
+   /// \pre type() is objectValue or nullValue
+   /// \post type() is unchanged
+ #if JSONCPP_HAS_STRING_VIEW
+-  void removeMember(std::string_view key);
+-#else
++  inline void removeMember(std::string_view key) {
++    removeMember(key.data(), key.data() + key.length(), nullptr);
++  }
++#endif
+   void removeMember(const char* key);
+   /// Same as removeMember(const char*)
+   /// \param key may contain embedded nulls.
+   void removeMember(const String& key);
+-#endif
+   /** \brief Remove the named map member.
+    *
+    *  Update 'removed' iff removed.
+@@ -602,13 +618,14 @@ public:
+    *  \return true iff removed (no exceptions)
+    */
+ #if JSONCPP_HAS_STRING_VIEW
+-  bool removeMember(std::string_view key, Value* removed);
+-#else
++  inline bool removeMember(std::string_view key, Value* removed) {
++    return removeMember(key.data(), key.data() + key.length(), removed);
++  }
++#endif
+   bool removeMember(String const& key, Value* removed);
+   /// Same as removeMember(const char* begin, const char* end, Value* removed),
+   /// but 'key' is null-terminated.
+   bool removeMember(const char* key, Value* removed);
+-#endif
+   /// Same as removeMember(String const& key, Value* removed)
+   bool removeMember(const char* begin, const char* end, Value* removed);
+   /** \brief Remove the indexed array element.
+@@ -622,15 +639,16 @@ public:
+ #ifdef JSONCPP_HAS_STRING_VIEW
+   /// Return true if the object has a member named key.
+   /// \param key may contain embedded nulls.
+-  bool isMember(std::string_view key) const;
+-#else
++  inline bool isMember(std::string_view key) const {
++    return isMember(key.data(), key.data() + key.length());
++  }
++#endif
+   /// Return true if the object has a member named key.
+   /// \note 'key' must be null-terminated.
+   bool isMember(const char* key) const;
+   /// Return true if the object has a member named key.
+   /// \param key may contain embedded nulls.
+   bool isMember(const String& key) const;
+-#endif
+   /// Same as isMember(String const& key)const
+   bool isMember(const char* begin, const char* end) const;
+
+diff --git a/src/lib_json/CMakeLists.txt b/src/lib_json/CMakeLists.txt
+index 03e9335525ca..a0695e9eba83 100644
+--- a/src/lib_json/CMakeLists.txt
++++ b/src/lib_json/CMakeLists.txt
+@@ -131,9 +131,6 @@ if(BUILD_SHARED_LIBS)
+
+     target_compile_features(${SHARED_LIB} PUBLIC ${REQUIRED_FEATURES})
+
+-    if(JSONCPP_HAS_STRING_VIEW)
+-        target_compile_definitions(${SHARED_LIB} PUBLIC JSONCPP_HAS_STRING_VIEW=1)
+-    endif()
+
+     target_include_directories(${SHARED_LIB} PUBLIC
+         $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
+@@ -168,9 +165,6 @@ if(BUILD_STATIC_LIBS)
+
+     target_compile_features(${STATIC_LIB} PUBLIC ${REQUIRED_FEATURES})
+
+-    if(JSONCPP_HAS_STRING_VIEW)
+-        target_compile_definitions(${STATIC_LIB} PUBLIC JSONCPP_HAS_STRING_VIEW=1)
+-    endif()
+
+     target_include_directories(${STATIC_LIB} PUBLIC
+         $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
+@@ -198,9 +192,6 @@ if(BUILD_OBJECT_LIBS)
+
+     target_compile_features(${OBJECT_LIB} PUBLIC ${REQUIRED_FEATURES})
+
+-    if(JSONCPP_HAS_STRING_VIEW)
+-        target_compile_definitions(${OBJECT_LIB} PUBLIC JSONCPP_HAS_STRING_VIEW=1)
+-    endif()
+
+     target_include_directories(${OBJECT_LIB} PUBLIC
+         $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
+diff --git a/src/lib_json/json_value.cpp b/src/lib_json/json_value.cpp
+index 74f77896fa7b..a8eb72d6b75f 100644
+--- a/src/lib_json/json_value.cpp
++++ b/src/lib_json/json_value.cpp
+@@ -441,14 +441,6 @@ Value::Value(const String& value) {
+       value.data(), static_cast<unsigned>(value.length()));
+ }
+
+-#ifdef JSONCPP_HAS_STRING_VIEW
+-Value::Value(std::string_view value) {
+-  initBasic(stringValue, true);
+-  value_.string_ = duplicateAndPrefixStringValue(
+-      value.data(), static_cast<unsigned>(value.length()));
+-}
+-#endif
+-
+ Value::Value(const StaticString& value) {
+   initBasic(stringValue);
+   value_.string_ = const_cast<char*>(value.c_str());
+@@ -656,21 +648,6 @@ bool Value::getString(char const** begin, char const** end) const {
+   return true;
+ }
+
+-#ifdef JSONCPP_HAS_STRING_VIEW
+-bool Value::getString(std::string_view* str) const {
+-  if (type() != stringValue)
+-    return false;
+-  if (value_.string_ == nullptr)
+-    return false;
+-  const char* begin;
+-  unsigned length;
+-  decodePrefixedString(this->isAllocated(), this->value_.string_, &length,
+-                       &begin);
+-  *str = std::string_view(begin, length);
+-  return true;
+-}
+-#endif
+-
+ String Value::asString() const {
+   switch (type()) {
+   case nullValue:
+@@ -1190,17 +1167,6 @@ Value* Value::demand(char const* begin, char const* end) {
+                       "objectValue or nullValue");
+   return &resolveReference(begin, end);
+ }
+-#ifdef JSONCPP_HAS_STRING_VIEW
+-const Value& Value::operator[](std::string_view key) const {
+-  Value const* found = find(key.data(), key.data() + key.length());
+-  if (!found)
+-    return nullSingleton();
+-  return *found;
+-}
+-Value& Value::operator[](std::string_view key) {
+-  return resolveReference(key.data(), key.data() + key.length());
+-}
+-#else
+ const Value& Value::operator[](const char* key) const {
+   Value const* found = find(key, key + strlen(key));
+   if (!found)
+@@ -1221,7 +1187,6 @@ Value& Value::operator[](const char* key) {
+ Value& Value::operator[](const String& key) {
+   return resolveReference(key.data(), key.data() + key.length());
+ }
+-#endif
+
+ Value& Value::operator[](const StaticString& key) {
+   return resolveReference(key.c_str());
+@@ -1261,18 +1226,12 @@ Value Value::get(char const* begin, char const* end,
+   Value const* found = find(begin, end);
+   return !found ? defaultValue : *found;
+ }
+-#ifdef JSONCPP_HAS_STRING_VIEW
+-Value Value::get(std::string_view key, const Value& defaultValue) const {
+-  return get(key.data(), key.data() + key.length(), defaultValue);
+-}
+-#else
+ Value Value::get(char const* key, Value const& defaultValue) const {
+   return get(key, key + strlen(key), defaultValue);
+ }
+ Value Value::get(String const& key, Value const& defaultValue) const {
+   return get(key.data(), key.data() + key.length(), defaultValue);
+ }
+-#endif
+
+ bool Value::removeMember(const char* begin, const char* end, Value* removed) {
+   if (type() != objectValue) {
+@@ -1288,31 +1247,13 @@ bool Value::removeMember(const char* begin, const char* end, Value* removed) {
+   value_.map_->erase(it);
+   return true;
+ }
+-#ifdef JSONCPP_HAS_STRING_VIEW
+-bool Value::removeMember(std::string_view key, Value* removed) {
+-  return removeMember(key.data(), key.data() + key.length(), removed);
+-}
+-#else
+ bool Value::removeMember(const char* key, Value* removed) {
+   return removeMember(key, key + strlen(key), removed);
+ }
+ bool Value::removeMember(String const& key, Value* removed) {
+   return removeMember(key.data(), key.data() + key.length(), removed);
+ }
+-#endif
+-
+-#ifdef JSONCPP_HAS_STRING_VIEW
+-void Value::removeMember(std::string_view key) {
+-  JSON_ASSERT_MESSAGE(type() == nullValue || type() == objectValue,
+-                      "in Json::Value::removeMember(): requires objectValue");
+-  if (type() == nullValue)
+-    return;
+
+-  CZString actualKey(key.data(), unsigned(key.length()),
+-                     CZString::noDuplication);
+-  value_.map_->erase(actualKey);
+-}
+-#else
+ void Value::removeMember(const char* key) {
+   JSON_ASSERT_MESSAGE(type() == nullValue || type() == objectValue,
+                       "in Json::Value::removeMember(): requires objectValue");
+@@ -1323,7 +1264,6 @@ void Value::removeMember(const char* key) {
+   value_.map_->erase(actualKey);
+ }
+ void Value::removeMember(const String& key) { removeMember(key.c_str()); }
+-#endif
+
+ bool Value::removeIndex(ArrayIndex index, Value* removed) {
+   if (type() != arrayValue) {
+@@ -1353,18 +1293,12 @@ bool Value::isMember(char const* begin, char const* end) const {
+   Value const* value = find(begin, end);
+   return nullptr != value;
+ }
+-#ifdef JSONCPP_HAS_STRING_VIEW
+-bool Value::isMember(std::string_view key) const {
+-  return isMember(key.data(), key.data() + key.length());
+-}
+-#else
+ bool Value::isMember(char const* key) const {
+   return isMember(key, key + strlen(key));
+ }
+ bool Value::isMember(String const& key) const {
+   return isMember(key.data(), key.data() + key.length());
+ }
+-#endif
+
+ Value::Members Value::getMemberNames() const {
+   JSON_ASSERT_MESSAGE(
+--
+2.43.0
diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb
index 797f093f33..354f4e9115 100644
--- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb
+++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb
@@ -15,6 +15,7 @@ PE = "1"
 
 SRCREV = "3455302847cf1e4671f1d8f5fa953fd46a7b1404"
 SRC_URI = "git://github.com/open-source-parsers/jsoncpp;branch=master;protocol=https;tag=${PV} \
+           file://0001-Fix-C-11-ABI-breakage-when-compiled-with-C-17-1668-1.patch \
            file://run-ptest \
            "
 
-- 
2.53.0


