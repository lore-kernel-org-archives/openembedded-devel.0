Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10209C369CB
	for <webhook@archiver.kernel.org>; Sun, 20 Apr 2025 02:51:08 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.2200.1745117465695591247
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Apr 2025 19:51:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DkHvoDZD;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-736ab1c43c4so3037381b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Apr 2025 19:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745117465; x=1745722265; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IsgyHjN+urxWQ4R+tCdNXs9KojpXFfpYrqTBg1O86xM=;
        b=DkHvoDZDQDimXQQvgHdeexdSK+UqFsZasDgvCJmxDn66qmbwZMknqcAuW5hUsZtcRz
         6cyVdWA2/OmbLAbuwOnNx67CB+r9TK2wtFjuAjOBTtrOfuEZL3VG35NEoZXsnpwJQokK
         gOopTfosEpRiMKtDQ20PZ5CcPBZ2qDPtSL1NecPeGz9msRBPU6GFHNBxOeyGLgptFeHI
         lEgoyIXPycTYds2D/8crHGLeYiANPvsYRvm0xIJIjK1o4Zk0QZfMh415JrZ/nvM/roZn
         QgyIwNWQMsKdRxTKHPNIBApez/iQYD8ZgKQZs7oh4g1tT+/zHr5EpZDYwVCvflS0GUjL
         +tSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745117465; x=1745722265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IsgyHjN+urxWQ4R+tCdNXs9KojpXFfpYrqTBg1O86xM=;
        b=madkH+T2+LPO0WE252oHLWk60nKDNiOU7uC1cbAgreuVpzo2aHUmYY9e++EoPC/741
         sL03pu7ekLHtkwkhY69pRSLtthyiszAOW7GyhVnfF9wynwYSR7FckLcdMKLaMoapJqS7
         LfoCH/M4u6fr3ocekxnCb+GM7RWDIShnHnmwNmuvjFCBhw+oGi5Vx18yRqUe8zbFAWBs
         B9uUb6R09xYiGpT/dtLcbdndYBIF3NSEAB25ROzm5BBBOHoV0YGDKLeNHyF1Pwvin6D5
         Jszcbzq3apxLURigjgOoy25J24dAlwPERy/FrvXTebVYxSo4yZWM609AxIHMez9h3YcV
         elvQ==
X-Gm-Message-State: AOJu0YyujJfmJvw1b2Ov+IzfHdIrpv9R5DsXbwniKNV7pNjGA8NFW2t0
	ecHhehDDsBlXVlB++SRuSaOxV9cwPczhmNERgCbXB662m66RAr3FKNFi+m5q
X-Gm-Gg: ASbGnctj16zRo7fFPfgdk3VRqAgzOSJNLkegRC7F0Gi2c75do6QGhpjseNjrA8pnhgl
	ZkQ8Bv/V4R1GTELN2uitMDrFTTprcI4RmNYSfof6LOhinR6+4GFzqW4rUU6SCGiuzIOZRbjSdpz
	RbOBNuBq775rRhE48PVFD41WFP09JYTJKnOmXmsoO2OxcnZCum+eKOE311FRk72+/wIuH2Mqcum
	WFYlbM9z8w/hTV26lie1NQAONpnkFjDAaG3I7QehTj7ZyIz6eI4QL4F7FCtAsKqFDgct8LXuy4S
	83y39iiFjX8QYGffTufYnmuFa5M5kB5P
X-Google-Smtp-Source: AGHT+IFHN74RpURUwYdSmOjNF3uo4neMqQrKVOXMjO1R5kAV4IfMmYZYZavwPiHEfMmi5T57BOhAcg==
X-Received: by 2002:a05:6a00:2d8a:b0:736:34a2:8a18 with SMTP id d2e1a72fcca58-73dc15d9076mr11059901b3a.24.1745117464669;
        Sat, 19 Apr 2025 19:51:04 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::c043])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8c04afsm3986138b3a.23.2025.04.19.19.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 19:51:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-lief: Upgrade to 0.16.5 + tip of trunk
Date: Sat, 19 Apr 2025 19:51:01 -0700
Message-ID: <20250420025101.3189663-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250420025101.3189663-1-raj.khem@gmail.com>
References: <20250420025101.3189663-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Apr 2025 02:51:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116987

Drop upstreamed patch.
Pydantic-core is now available for riscv32

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Add-cstdio-include.patch             | 134 ------------------
 ...equirements.txt-Allow-newer-versions.patch |  21 ++-
 ...-lief_0.16.4.bb => python3-lief_0.16.5.bb} |   6 +-
 3 files changed, 9 insertions(+), 152 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-lief/0001-Add-cstdio-include.patch
 rename meta-python/recipes-devtools/python/{python3-lief_0.16.4.bb => python3-lief_0.16.5.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-lief/0001-Add-cstdio-include.patch b/meta-python/recipes-devtools/python/python3-lief/0001-Add-cstdio-include.patch
deleted file mode 100644
index 396e935ddd..0000000000
--- a/meta-python/recipes-devtools/python/python3-lief/0001-Add-cstdio-include.patch
+++ /dev/null
@@ -1,134 +0,0 @@
-From a9b7a9f5c5572fc839d05457da073dc817722ace Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 1 Apr 2025 17:27:46 -0700
-Subject: [PATCH] Add cstdio include
-
-This is needed for uintXX_t types, GCC-15 is defauling to C23 and will error
-about it.
-
-e.g.
-
-include/LIEF/PE/LoadConfigurations/VolatileMetadata.hpp:145:3: note: 'uint32_t' is defined in header '<cstdint>'; this is probably fixable by adding '#include <cstdint>'
-
-Upstream-Status: Submitted [https://github.com/lief-project/LIEF/pull/1184]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- include/LIEF/DWARF/Scope.hpp                                     | 1 +
- include/LIEF/ObjC/Method.hpp                                     | 1 +
- include/LIEF/PDB/PublicSymbol.hpp                                | 1 +
- include/LIEF/PDB/types/Attribute.hpp                             | 1 +
- include/LIEF/PE/LoadConfigurations/VolatileMetadata.hpp          | 1 +
- include/LIEF/PE/Relocation.hpp                                   | 1 +
- include/LIEF/PE/signature/attributes/PKCS9AtSequenceNumber.hpp   | 1 +
- include/LIEF/PE/signature/attributes/SpcRelaxedPeMarkerCheck.hpp | 1 +
- src/MachO/TrieNode.hpp                                           | 1 +
- 9 files changed, 9 insertions(+)
-
-diff --git a/include/LIEF/DWARF/Scope.hpp b/include/LIEF/DWARF/Scope.hpp
-index 78752847..61977c21 100644
---- a/include/LIEF/DWARF/Scope.hpp
-+++ b/include/LIEF/DWARF/Scope.hpp
-@@ -15,6 +15,7 @@
- #ifndef LIEF_DWARF_SCOPE_H
- #define LIEF_DWARF_SCOPE_H
- 
-+#include <cstdint>
- #include <memory>
- #include <string>
- 
-diff --git a/include/LIEF/ObjC/Method.hpp b/include/LIEF/ObjC/Method.hpp
-index b4e82c6e..b9f37288 100644
---- a/include/LIEF/ObjC/Method.hpp
-+++ b/include/LIEF/ObjC/Method.hpp
-@@ -16,6 +16,7 @@
- #define LIEF_OBJC_METHOD_H
- #include <LIEF/visibility.h>
- 
-+#include <cstdint>
- #include <memory>
- #include <string>
- 
-diff --git a/include/LIEF/PDB/PublicSymbol.hpp b/include/LIEF/PDB/PublicSymbol.hpp
-index b8904a5b..0e105435 100644
---- a/include/LIEF/PDB/PublicSymbol.hpp
-+++ b/include/LIEF/PDB/PublicSymbol.hpp
-@@ -14,6 +14,7 @@
-  */
- #ifndef LIEF_PDB_PUBLIC_SYMBOL_H
- #define LIEF_PDB_PUBLIC_SYMBOL_H
-+#include <cstdint>
- #include <memory>
- #include <string>
- #include <ostream>
-diff --git a/include/LIEF/PDB/types/Attribute.hpp b/include/LIEF/PDB/types/Attribute.hpp
-index a41270c0..fc961be5 100644
---- a/include/LIEF/PDB/types/Attribute.hpp
-+++ b/include/LIEF/PDB/types/Attribute.hpp
-@@ -17,6 +17,7 @@
- 
- #include "LIEF/visibility.h"
- 
-+#include <cstdint>
- #include <string>
- #include <memory>
- 
-diff --git a/include/LIEF/PE/LoadConfigurations/VolatileMetadata.hpp b/include/LIEF/PE/LoadConfigurations/VolatileMetadata.hpp
-index 41b9e36b..073ccabc 100644
---- a/include/LIEF/PE/LoadConfigurations/VolatileMetadata.hpp
-+++ b/include/LIEF/PE/LoadConfigurations/VolatileMetadata.hpp
-@@ -15,6 +15,7 @@
-  */
- #ifndef LIEF_PE_LOAD_CONFIGURATION_VOLATILE_METADATA_H
- #define LIEF_PE_LOAD_CONFIGURATION_VOLATILE_METADATA_H
-+#include <cstdint>
- #include <memory>
- #include <string>
- #include <vector>
-diff --git a/include/LIEF/PE/Relocation.hpp b/include/LIEF/PE/Relocation.hpp
-index a4cd2e96..cd81bf68 100644
---- a/include/LIEF/PE/Relocation.hpp
-+++ b/include/LIEF/PE/Relocation.hpp
-@@ -15,6 +15,7 @@
-  */
- #ifndef LIEF_PE_RELOCATION_H
- #define LIEF_PE_RELOCATION_H
-+#include <cstdint>
- #include <vector>
- #include <ostream>
- #include <memory>
-diff --git a/include/LIEF/PE/signature/attributes/PKCS9AtSequenceNumber.hpp b/include/LIEF/PE/signature/attributes/PKCS9AtSequenceNumber.hpp
-index a89901fa..32db1470 100644
---- a/include/LIEF/PE/signature/attributes/PKCS9AtSequenceNumber.hpp
-+++ b/include/LIEF/PE/signature/attributes/PKCS9AtSequenceNumber.hpp
-@@ -15,6 +15,7 @@
-  */
- #ifndef LIEF_PE_ATTRIBUTES_PKCS9_AT_SEQUENCE_NUMBER_H
- #define LIEF_PE_ATTRIBUTES_PKCS9_AT_SEQUENCE_NUMBER_H
-+#include <cstdint>
- 
- #include "LIEF/visibility.h"
- #include "LIEF/PE/signature/Attribute.hpp"
-diff --git a/include/LIEF/PE/signature/attributes/SpcRelaxedPeMarkerCheck.hpp b/include/LIEF/PE/signature/attributes/SpcRelaxedPeMarkerCheck.hpp
-index f84fbcbf..5cce98b4 100644
---- a/include/LIEF/PE/signature/attributes/SpcRelaxedPeMarkerCheck.hpp
-+++ b/include/LIEF/PE/signature/attributes/SpcRelaxedPeMarkerCheck.hpp
-@@ -15,6 +15,7 @@
-  */
- #ifndef LIEF_PE_ATTRIBUTES_SPC_RELAXED_PE_MARKER_CHECK_H
- #define LIEF_PE_ATTRIBUTES_SPC_RELAXED_PE_MARKER_CHECK_H
-+#include <cstdint>
- 
- #include "LIEF/visibility.h"
- #include "LIEF/PE/signature/Attribute.hpp"
-diff --git a/src/MachO/TrieNode.hpp b/src/MachO/TrieNode.hpp
-index f6c411b8..6bdde9ec 100644
---- a/src/MachO/TrieNode.hpp
-+++ b/src/MachO/TrieNode.hpp
-@@ -15,6 +15,7 @@
-  */
- #ifndef LIEF_MACHO_TRIE_NODE_H_
- #define LIEF_MACHO_TRIE_NODE_H_
-+#include <cstdint>
- #include <string>
- #include <vector>
- #include <memory>
diff --git a/meta-python/recipes-devtools/python/python3-lief/0001-build-requirements.txt-Allow-newer-versions.patch b/meta-python/recipes-devtools/python/python3-lief/0001-build-requirements.txt-Allow-newer-versions.patch
index e2d041dac7..9c61f0bdee 100644
--- a/meta-python/recipes-devtools/python/python3-lief/0001-build-requirements.txt-Allow-newer-versions.patch
+++ b/meta-python/recipes-devtools/python/python3-lief/0001-build-requirements.txt-Allow-newer-versions.patch
@@ -12,28 +12,23 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
  api/python/build-requirements.txt | 14 +++++++-------
  1 file changed, 7 insertions(+), 7 deletions(-)
 
-diff --git a/api/python/build-requirements.txt b/api/python/build-requirements.txt
-index 4c9004ca..fe0d1055 100644
 --- a/api/python/build-requirements.txt
 +++ b/api/python/build-requirements.txt
 @@ -1,10 +1,10 @@
--tomli==2.0.1
--scikit-build-core==0.9.8
-+tomli>=2.0.1
-+scikit-build-core>=0.9.8
+-tomli==2.2.1
+-scikit-build-core==0.11.1
++tomli>=2.2.1
++scikit-build-core>=0.11.1
  # For Ninja: msvc.msvc14_get_vc_env
 -setuptools==70.2.0
 +setuptools>=70.2.0
  # For the "env" feature
--pydantic==2.8.2
-+pydantic>=2.8.2
+-pydantic==2.11.3
++pydantic>=2.11.3
  # Implicit from scikit-build-core
 -pathspec==0.12.1
 -build==1.2.1
--wheel==0.43.0
+-wheel==0.45.1
 +pathspec>=0.12.1
 +build>=1.2.1
-+wheel>=0.43.0
--- 
-2.39.5
-
++wheel>=0.45.1
diff --git a/meta-python/recipes-devtools/python/python3-lief_0.16.4.bb b/meta-python/recipes-devtools/python/python3-lief_0.16.5.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-lief_0.16.4.bb
rename to meta-python/recipes-devtools/python/python3-lief_0.16.5.bb
index 67bbcbf7b1..2166e3257f 100644
--- a/meta-python/recipes-devtools/python/python3-lief_0.16.4.bb
+++ b/meta-python/recipes-devtools/python/python3-lief_0.16.5.bb
@@ -9,10 +9,8 @@ SRC_URI = " \
     git://github.com/lief-project/LIEF.git;protocol=https;branch=main \
     file://0001-build-requirements.txt-Allow-newer-versions.patch \
     file://0002-api-python-config-default.toml-Debug.patch \
-    file://0001-Add-cstdio-include.patch \
 "
-SRCREV = "1e9b12bd14cbe087d52355b8b9af578f1b04d8ca"
-
+SRCREV = "abcf929efb748c7846dd59007cbb807e108db311"
 PV .= "+git"
 
 S = "${WORKDIR}/git"
@@ -33,7 +31,5 @@ DEPENDS += "\
 "
 # https://github.com/lief-project/LIEF/commit/3def579f75965aa19c021d840a759bce2afc0a31#r152197203
 COMPATIBLE_HOST:x86 = "null"
-# Needs pydantic and pydantic-core
-COMPATIBLE_HOST:riscv32 = "null"
 
 BBCLASSEXTEND = "native nativesdk"

