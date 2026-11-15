Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3831.1794729051116808494
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:50:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=qCFaaXc+;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-37f14feca60so19803eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729050; x=1795333850; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3CWQAL0tpxfRyUvEv8brIadrPAd83w8uiVfGA1fbtdM=;
        b=qCFaaXc+KwOAOEuBlaqXA3tHBXKggeCYLO77MSRV0nKHGDRzmpkWDKREfeOL1TAyWa
         e8Csr2NBAKbCuv0U7lpdBxAEYsdfs8Mk8MA7Dekk+PQJ8yigGvWbmRYT7Pzn1SBX/Y8q
         KGJd1M4Ox6gMWmBwraiZLxNk/SoPzYjh71lMDB1W3PaZQHR2T3VSzrkil9qMF2C75in/
         N9QxjqTSEz7qpbqbUFxIlq4FdU+rYNEsnRFkATqG3S1BSL47SVn7AxILiGRXfa06CWyU
         z0Oydgx2pNOTdutFXtDvR0hodF22wi2ERH/3tuu/KdQsKdvVp2tXWe7WRNdsM6ZxIF0r
         rUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729050; x=1795333850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3CWQAL0tpxfRyUvEv8brIadrPAd83w8uiVfGA1fbtdM=;
        b=pIIYiKrUOl7AvprhFbKhIhTHrf3Pg1dNwmvWk8zO9z2Y1n2WTYsHQBW7Q5x1muVjSK
         jCcEj81gSqAsrEcAUCJiHsmK/4wSTfEdGDatvVJuRoRlGtMK4QqqxQ/WfXVCwLbk4vMv
         xIa8Y45kzo/SGK1jcWsL9eRLwjdk+SnaWzuvdPSjRbmoLujmw1USosKLrl1VcuPkJ5aM
         0CoR5v3SM0Ce7Ih1hM4kV8JWTWCYXoR3DZyZ6PxAEHEyB/3/vMkr/XiSwbuRSWY1zDcm
         AMizGdFceJPA0A64JhyWbMZBbQSWg1uvZdFfXv6dxY/1jsJVl3L9MiLJHN5E5X/N4cpf
         wIiQ==
X-Gm-Message-State: APuU4Z9l33A/2Ih0sp2vOvx7I4N4rlip2yzqESTP1yFxYGZUpLN8Krd7
	/lBAN9os9SO5a84XsmU/FkP+JCwnzOe4UVanmkxKCS8t71qC5wCcnH5vjwGP08z4
X-Gm-Gg: AYBFou0R7+FZQxuH3cco3j7cgl5oPHWLgBtXBLK8zimdCG3/Nb+RIlr2ZRVyvaLiHNK
	bmuOohl7uQxXlNKtlIahvah44EKkAwXYwVChH4G8jlfDAK0l+tFVtFrRgrxxrcv/S2rIUxj7rPa
	ry57j62tI2ta1y1QPUx4IKfkve+kL97iroB0CJrsd0E3sqgE8zvwY0GL0t+tWc1T+6Yuu8pVxv0
	yQKlrtLDnR8bDobT/zOTRAjZ2frnwegKZ3Z3Fxn4MNC7yXmjzmOULG3h58O1Z1Tjxj8yXjDaK3D
	p/sNLrwN1FiNhb+BOrZbgMdDhNGia1MVaYvt+ld2TV9U+nYv2kobWG0D3OoF0scSpL1O0VbDR5x
	HaNKypQLt0prQ6g2OBwkwpvtyIPorvewID4aplpdFBteL1ean7IQwimyIjztaButjXe1KAwWT5S
	41fifno4e9Q2UizYUqJpIJgSnHEyqe2uFhnATN0gdkAm+UcP1opz0HeE7vxXvrDMi+WHFtjcyZQ
	py3FHrs0siDsSh/zC25FFE3fKHtNHLUspSg75XGcZYevCcFBuqn14A53xUk245G1GC1T+EUxQJ4
	G2b8/nTxWz4BtYdY9dyQovQwCXX4PG6dT9xTMfrtISDcigYeRe5qqE9Y8vajA6xpAhyRP3yacUl
	/5WNkTo9gQI2oyHLCI1aXtI2I54ngSOQOlC0SZ8kkb1HO8Vln10ICsIYMxytVb0xxPwChz/LzWL
	yGk3zn248YNWFLxeNiB+OlZ3vavZGHzbR+a0GYU/2B0KNQOZesz2lwRHWlyJAsjsW/1PxOlOj2+
	6agALano/qagtANASpmTIYVBF+rGQ/509zOpA6lKemzsQx/I5yYk44ltzF1V47crYOEjBPBF9q8
	sE8S
X-Received: by 2002:a05:693c:4153:10b0:37b:e40:397e with SMTP id 5a478bee46e88-37b0e403d73mr4531154eec.14.1794729050380;
        Sat, 14 Nov 2026 23:50:50 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:50:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 56/96] libtorrent-rasterbar: upgrade 2.0.12 -> 2.1.2
Date: Sat, 14 Nov 2026 23:48:34 -0800
Message-ID: <20261115074918.2932593-56-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:50:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132326
Content-Type: text/plain; charset="utf-8"

Drop both patches: the Python site-packages path and the OpenSSL 4.0
ASN1_STRING accessors are handled upstream.

2.1 adds WebTorrent support, enabled by default, which needs the
libdatachannel submodule; keep it disabled as before.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-packages-path-to-fix-package-QA-Iss.patch | 27 --------
 .../0001-Add-support-for-OpenSSL-4.0.patch    | 61 -------------------
 ....0.12.bb => libtorrent-rasterbar_2.1.2.bb} |  6 +-
 3 files changed, 2 insertions(+), 92 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent-rasterbar/files/0001-Fix-Python3-site-packages-path-to-fix-package-QA-Iss.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar/0001-Add-support-for-OpenSSL-4.0.patch
 rename meta-oe/recipes-connectivity/libtorrent-rasterbar/{libtorrent-rasterbar_2.0.12.bb => libtorrent-rasterbar_2.1.2.bb} (82%)

diff --git a/meta-oe/recipes-connectivity/libtorrent-rasterbar/files/0001-Fix-Python3-site-packages-path-to-fix-package-QA-Iss.patch b/meta-oe/recipes-connectivity/libtorrent-rasterbar/files/0001-Fix-Python3-site-packages-path-to-fix-package-QA-Iss.patch
deleted file mode 100644
index 2ed6ab8500..0000000000
--- a/meta-oe/recipes-connectivity/libtorrent-rasterbar/files/0001-Fix-Python3-site-packages-path-to-fix-package-QA-Iss.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Subject: [PATCH] Fix Python3 site packages path to fix package QA Issue
-
-libtorrent-rasterbar-2.0.12-r0 do_package: QA Issue: libtorrent-rasterbar: Files/directories were installed but not shipped in any package:
-  /lib/python3.14/site-packages/libtorrent.so
-
-Upstream-Status: Inappropriate [ OE specific ]
-Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
----
- bindings/python/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/bindings/python/CMakeLists.txt b/bindings/python/CMakeLists.txt
-index 4e8ee816b..ee9566afc 100644
---- a/bindings/python/CMakeLists.txt
-+++ b/bindings/python/CMakeLists.txt
-@@ -96,7 +96,7 @@ else()
- 	execute_process(
- 		COMMAND "${Python3_EXECUTABLE}" -c [=[
- import sysconfig
--print(sysconfig.get_path('platlib', vars={'platbase': '', 'base': ''}))
-+print(sysconfig.get_path('platlib', vars={'platbase': '/usr', 'base': ''}))
- ]=]
- 		OUTPUT_VARIABLE _PYTHON3_SITE_ARCH
- 		OUTPUT_STRIP_TRAILING_WHITESPACE
--- 
-2.43.0
-
diff --git a/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar/0001-Add-support-for-OpenSSL-4.0.patch b/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar/0001-Add-support-for-OpenSSL-4.0.patch
deleted file mode 100644
index 5b3407fc52..0000000000
--- a/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar/0001-Add-support-for-OpenSSL-4.0.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 50bd3a46c2c5ccd7298415d1a66ef27c96d0fa2b Mon Sep 17 00:00:00 2001
-From: Chocobo1 <Chocobo1@users.noreply.github.com>
-Date: Sun, 19 Apr 2026 01:01:53 +0800
-Subject: [PATCH] Add support for OpenSSL 4.0
-
-The accessor functions for `ASN1_STRING` are available since OpenSSL 1.0.1 so we are free to use
-them without conditional guards.
-See: https://openssl-library.org/post/2026-04-13-asn1_string/
-
-Closes #8268.
-Upstream-Status: Backport [https://github.com/arvidn/libtorrent/commit/50bd3a46c2c5]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- src/torrent.cpp | 20 ++++++++++++--------
- 1 file changed, 12 insertions(+), 8 deletions(-)
-
-diff --git a/src/torrent.cpp b/src/torrent.cpp
-index c6564b67f82..7fcc75b3ed4 100644
---- a/src/torrent.cpp
-+++ b/src/torrent.cpp
-@@ -1630,9 +1630,9 @@ aux::vector<download_priority_t, piece_index_t> file_to_piece_prio(
- 			GENERAL_NAME* gen = sk_GENERAL_NAME_value(gens, i);
- 			if (gen->type != GEN_DNS) continue;
- 			ASN1_IA5STRING* domain = gen->d.dNSName;
--			if (domain->type != V_ASN1_IA5STRING || !domain->data || !domain->length) continue;
--			auto const* torrent_name = reinterpret_cast<char const*>(domain->data);
--			auto const name_length = aux::numeric_cast<std::size_t>(domain->length);
-+			if (ASN1_STRING_type(domain) != V_ASN1_IA5STRING || !ASN1_STRING_get0_data(domain) || !ASN1_STRING_length(domain)) continue;
-+			auto const* torrent_name = reinterpret_cast<char const*>(ASN1_STRING_get0_data(domain));
-+			auto const name_length = aux::numeric_cast<std::size_t>(ASN1_STRING_length(domain));
- 
- #ifndef TORRENT_DISABLE_LOGGING
- 			if (i > 1) names += " | n: ";
-@@ -1654,18 +1654,22 @@ aux::vector<download_priority_t, piece_index_t> file_to_piece_prio(
- 
- 		// no match in the alternate names, so try the common names. We should only
- 		// use the "most specific" common name, which is the last one in the list.
-+#if OPENSSL_VERSION_NUMBER >= 0x30000000L
-+		X509_NAME const* name = X509_get_subject_name(cert);
-+#else
- 		X509_NAME* name = X509_get_subject_name(cert);
-+#endif
- 		int i = -1;
--		ASN1_STRING* common_name = nullptr;
-+		ASN1_STRING const* common_name = nullptr;
- 		while ((i = X509_NAME_get_index_by_NID(name, NID_commonName, i)) >= 0)
- 		{
--			X509_NAME_ENTRY* name_entry = X509_NAME_get_entry(name, i);
-+			X509_NAME_ENTRY const* name_entry = X509_NAME_get_entry(name, i);
- 			common_name = X509_NAME_ENTRY_get_data(name_entry);
- 		}
--		if (common_name && common_name->data && common_name->length)
-+		if (common_name && ASN1_STRING_get0_data(common_name) && ASN1_STRING_length(common_name))
- 		{
--			auto const* torrent_name = reinterpret_cast<char const*>(common_name->data);
--			auto const name_length = aux::numeric_cast<std::size_t>(common_name->length);
-+			auto const* torrent_name = reinterpret_cast<char const*>(ASN1_STRING_get0_data(common_name));
-+			auto const name_length = aux::numeric_cast<std::size_t>(ASN1_STRING_length(common_name));
- 
- #ifndef TORRENT_DISABLE_LOGGING
- 			if (!names.empty()) names += " | n: ";
diff --git a/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar_2.0.12.bb b/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar_2.1.2.bb
similarity index 82%
rename from meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar_2.0.12.bb
rename to meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar_2.1.2.bb
index 726bb059ef..dac8c6cfc6 100644
--- a/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar_2.0.12.bb
+++ b/meta-oe/recipes-connectivity/libtorrent-rasterbar/libtorrent-rasterbar_2.1.2.bb
@@ -8,11 +8,9 @@ DEPENDS = "boost openssl"
 
 SRC_URI = "git://github.com/arvidn/libtorrent.git;branch=master;protocol=https;tag=v${PV} \
 	git://github.com/arvidn/try_signal.git;branch=master;protocol=https;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/deps/try_signal;name=try_signal \
-           file://0001-Fix-Python3-site-packages-path-to-fix-package-QA-Iss.patch \
-           file://0001-Add-support-for-OpenSSL-4.0.patch \
            "
 
-SRCREV = "740a0b9aeabe00e762cc0efe4a0f27593db2550b"
+SRCREV = "6da363d2994f17c0b3c0450d124cf73a31a73847"
 SRCREV_try_signal = "105cce59972f925a33aa6b1c3109e4cd3caf583d"
 SRCREV_FORMAT .= "_try_signal"
 
@@ -21,7 +19,7 @@ inherit cmake pkgconfig python3targetconfig
 
 CVE_PRODUCT = "libtorrent"
 
-EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release"
+EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release -Dwebtorrent=OFF"
 
 PACKAGECONFIG ??= "python3"
 PACKAGECONFIG[python3] = "-Dpython-bindings=ON,-Dpython-bindings=OFF,python3-distutils-extra-native"
