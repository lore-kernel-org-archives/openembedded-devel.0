Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6233C36018
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 03:42:56 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.21.1743565374983701161
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Apr 2025 20:42:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M4ke5Smy;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3015001f862so8277096a91.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 20:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743565374; x=1744170174; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i6crgDFBRmTydrOQh+QWv3RV/wcMJLIqIGgPTc5lZlw=;
        b=M4ke5SmyCMnMDjSDr7p8eaDv5go5pztow7pbgRLiffRZD+6RspyqMuvyw8wnxds1Wh
         PivPd2WFKUL6KzzuQPGe5M6Gc9+0F9j52qjwzzL65ZynAGyCY6+yMlPE80hTMOARv18m
         +kG1t5A6BXmWG0pAsYBj+D/rivwNHGOjG7cwxFDAko43JPZPldO/7NmrI+6yGTSOeuEm
         8bgyCrHoZDV6tl45Qp4lMoGLuHnczAfq+Hez7BNO+9Kf7rQXL83uSnp4IHyjCXK/epey
         TaC9ita9wyrvCCj3iQqc2lGc+OjRsydiTR8eNR1BW6zpg4/Z9kg9/pd/MnTB/wQm47g+
         cEKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743565374; x=1744170174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i6crgDFBRmTydrOQh+QWv3RV/wcMJLIqIGgPTc5lZlw=;
        b=CMcRlg1rC6iwkXJMgusWy7cc/4C9r86VKTBUdEURdY2ySzGQ6lGFXRNPpeqIndScUg
         NwENbNnbKSF4nLMKliYxKUtm0Rn7Orzz1I7jmol6dqvgcPyIQmJpsaqTUTm3ZypVQ5Ro
         Kxm6Mfs8QCWbEwa0tfqdus6kYtJVGZPNZD3zeq+MjGNyHL7N+9jRrhpKg6k2X40LS6m4
         b/GsK/CXU3S63bG1YNXzcfKt11YBwx5VlagDnOeBC5dhmHcOC8qbzu14FNDPHY/XIMgO
         B2AaC4wreLOHp5XTQsQqoVMUYdeDfZPnKffaXAuibIWRzD4n1uYs++eIAB/8siUpMBse
         IT4A==
X-Gm-Message-State: AOJu0YxMdXjVp3q9zZPu7oJMJx4zhiym0y8wBh2BraUtAMblWaM2FJcd
	OcaZfI9qslNfG4dHUSZAuWGZj3gZhvxPVgyHeseeOfesNBlaQyd6hYWNdDG/
X-Gm-Gg: ASbGncswVm25TF8Z7FnDeGQDlbWnuLyDQ9BYmt4cjJjhueRyGubkq8LcMl9zyPOfHZP
	6kZIE8NyRwMsXe7JsLp5fgDHbm8eGM6ZspRzL4bmWDGJkCgXsyYNLLUrYziBgM6OOAC5N2HtA60
	kZ03MP11UZ3rvpMY98onYLuuiax6NaeriujG9bJoKnzUcL+5GiaLDo+cy4q2OR1jNgZ7uMwMnF8
	NzUnMYfgfOXDT6+lK1780o6TaaVibmw7tRqlCbf3LvEbmjjoiBxdjU/ggfyh2/0HEjg3AcQ1R/3
	69G6nGVVl9gybOp3bhU7Tck4cRPr+I6xDXLN
X-Google-Smtp-Source: AGHT+IHGYwKw8pebMY8pUymf4DDrrt8C3N8AJmei1sgJRwA+R1y5OKsMCpcOAnXKqLQSiDJqfJSeUg==
X-Received: by 2002:a17:90b:2710:b0:2fe:b77a:2eab with SMTP id 98e67ed59e1d1-3056ef3acf5mr1072175a91.32.1743565373905;
        Tue, 01 Apr 2025 20:42:53 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a85b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3056f93417bsm423010a91.37.2025.04.01.20.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 20:42:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 6/6] python3-lief: Upgrade to latest on tip of trunk
Date: Tue,  1 Apr 2025 20:42:46 -0700
Message-ID: <20250402034246.1488516-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402034246.1488516-1-raj.khem@gmail.com>
References: <20250402034246.1488516-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 03:42:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116497

Adds new dependency on typing-inspection module
Fix build with GCC-15 while here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Add-cstdio-include.patch             | 134 ++++++++++++++++++
 ...-lief_0.16.3.bb => python3-lief_0.16.4.bb} |   5 +-
 2 files changed, 138 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-lief/0001-Add-cstdio-include.patch
 rename meta-python/recipes-devtools/python/{python3-lief_0.16.3.bb => python3-lief_0.16.4.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-lief/0001-Add-cstdio-include.patch b/meta-python/recipes-devtools/python/python3-lief/0001-Add-cstdio-include.patch
new file mode 100644
index 0000000000..396e935ddd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-lief/0001-Add-cstdio-include.patch
@@ -0,0 +1,134 @@
+From a9b7a9f5c5572fc839d05457da073dc817722ace Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 1 Apr 2025 17:27:46 -0700
+Subject: [PATCH] Add cstdio include
+
+This is needed for uintXX_t types, GCC-15 is defauling to C23 and will error
+about it.
+
+e.g.
+
+include/LIEF/PE/LoadConfigurations/VolatileMetadata.hpp:145:3: note: 'uint32_t' is defined in header '<cstdint>'; this is probably fixable by adding '#include <cstdint>'
+
+Upstream-Status: Submitted [https://github.com/lief-project/LIEF/pull/1184]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/LIEF/DWARF/Scope.hpp                                     | 1 +
+ include/LIEF/ObjC/Method.hpp                                     | 1 +
+ include/LIEF/PDB/PublicSymbol.hpp                                | 1 +
+ include/LIEF/PDB/types/Attribute.hpp                             | 1 +
+ include/LIEF/PE/LoadConfigurations/VolatileMetadata.hpp          | 1 +
+ include/LIEF/PE/Relocation.hpp                                   | 1 +
+ include/LIEF/PE/signature/attributes/PKCS9AtSequenceNumber.hpp   | 1 +
+ include/LIEF/PE/signature/attributes/SpcRelaxedPeMarkerCheck.hpp | 1 +
+ src/MachO/TrieNode.hpp                                           | 1 +
+ 9 files changed, 9 insertions(+)
+
+diff --git a/include/LIEF/DWARF/Scope.hpp b/include/LIEF/DWARF/Scope.hpp
+index 78752847..61977c21 100644
+--- a/include/LIEF/DWARF/Scope.hpp
++++ b/include/LIEF/DWARF/Scope.hpp
+@@ -15,6 +15,7 @@
+ #ifndef LIEF_DWARF_SCOPE_H
+ #define LIEF_DWARF_SCOPE_H
+ 
++#include <cstdint>
+ #include <memory>
+ #include <string>
+ 
+diff --git a/include/LIEF/ObjC/Method.hpp b/include/LIEF/ObjC/Method.hpp
+index b4e82c6e..b9f37288 100644
+--- a/include/LIEF/ObjC/Method.hpp
++++ b/include/LIEF/ObjC/Method.hpp
+@@ -16,6 +16,7 @@
+ #define LIEF_OBJC_METHOD_H
+ #include <LIEF/visibility.h>
+ 
++#include <cstdint>
+ #include <memory>
+ #include <string>
+ 
+diff --git a/include/LIEF/PDB/PublicSymbol.hpp b/include/LIEF/PDB/PublicSymbol.hpp
+index b8904a5b..0e105435 100644
+--- a/include/LIEF/PDB/PublicSymbol.hpp
++++ b/include/LIEF/PDB/PublicSymbol.hpp
+@@ -14,6 +14,7 @@
+  */
+ #ifndef LIEF_PDB_PUBLIC_SYMBOL_H
+ #define LIEF_PDB_PUBLIC_SYMBOL_H
++#include <cstdint>
+ #include <memory>
+ #include <string>
+ #include <ostream>
+diff --git a/include/LIEF/PDB/types/Attribute.hpp b/include/LIEF/PDB/types/Attribute.hpp
+index a41270c0..fc961be5 100644
+--- a/include/LIEF/PDB/types/Attribute.hpp
++++ b/include/LIEF/PDB/types/Attribute.hpp
+@@ -17,6 +17,7 @@
+ 
+ #include "LIEF/visibility.h"
+ 
++#include <cstdint>
+ #include <string>
+ #include <memory>
+ 
+diff --git a/include/LIEF/PE/LoadConfigurations/VolatileMetadata.hpp b/include/LIEF/PE/LoadConfigurations/VolatileMetadata.hpp
+index 41b9e36b..073ccabc 100644
+--- a/include/LIEF/PE/LoadConfigurations/VolatileMetadata.hpp
++++ b/include/LIEF/PE/LoadConfigurations/VolatileMetadata.hpp
+@@ -15,6 +15,7 @@
+  */
+ #ifndef LIEF_PE_LOAD_CONFIGURATION_VOLATILE_METADATA_H
+ #define LIEF_PE_LOAD_CONFIGURATION_VOLATILE_METADATA_H
++#include <cstdint>
+ #include <memory>
+ #include <string>
+ #include <vector>
+diff --git a/include/LIEF/PE/Relocation.hpp b/include/LIEF/PE/Relocation.hpp
+index a4cd2e96..cd81bf68 100644
+--- a/include/LIEF/PE/Relocation.hpp
++++ b/include/LIEF/PE/Relocation.hpp
+@@ -15,6 +15,7 @@
+  */
+ #ifndef LIEF_PE_RELOCATION_H
+ #define LIEF_PE_RELOCATION_H
++#include <cstdint>
+ #include <vector>
+ #include <ostream>
+ #include <memory>
+diff --git a/include/LIEF/PE/signature/attributes/PKCS9AtSequenceNumber.hpp b/include/LIEF/PE/signature/attributes/PKCS9AtSequenceNumber.hpp
+index a89901fa..32db1470 100644
+--- a/include/LIEF/PE/signature/attributes/PKCS9AtSequenceNumber.hpp
++++ b/include/LIEF/PE/signature/attributes/PKCS9AtSequenceNumber.hpp
+@@ -15,6 +15,7 @@
+  */
+ #ifndef LIEF_PE_ATTRIBUTES_PKCS9_AT_SEQUENCE_NUMBER_H
+ #define LIEF_PE_ATTRIBUTES_PKCS9_AT_SEQUENCE_NUMBER_H
++#include <cstdint>
+ 
+ #include "LIEF/visibility.h"
+ #include "LIEF/PE/signature/Attribute.hpp"
+diff --git a/include/LIEF/PE/signature/attributes/SpcRelaxedPeMarkerCheck.hpp b/include/LIEF/PE/signature/attributes/SpcRelaxedPeMarkerCheck.hpp
+index f84fbcbf..5cce98b4 100644
+--- a/include/LIEF/PE/signature/attributes/SpcRelaxedPeMarkerCheck.hpp
++++ b/include/LIEF/PE/signature/attributes/SpcRelaxedPeMarkerCheck.hpp
+@@ -15,6 +15,7 @@
+  */
+ #ifndef LIEF_PE_ATTRIBUTES_SPC_RELAXED_PE_MARKER_CHECK_H
+ #define LIEF_PE_ATTRIBUTES_SPC_RELAXED_PE_MARKER_CHECK_H
++#include <cstdint>
+ 
+ #include "LIEF/visibility.h"
+ #include "LIEF/PE/signature/Attribute.hpp"
+diff --git a/src/MachO/TrieNode.hpp b/src/MachO/TrieNode.hpp
+index f6c411b8..6bdde9ec 100644
+--- a/src/MachO/TrieNode.hpp
++++ b/src/MachO/TrieNode.hpp
+@@ -15,6 +15,7 @@
+  */
+ #ifndef LIEF_MACHO_TRIE_NODE_H_
+ #define LIEF_MACHO_TRIE_NODE_H_
++#include <cstdint>
+ #include <string>
+ #include <vector>
+ #include <memory>
diff --git a/meta-python/recipes-devtools/python/python3-lief_0.16.3.bb b/meta-python/recipes-devtools/python/python3-lief_0.16.4.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-lief_0.16.3.bb
rename to meta-python/recipes-devtools/python/python3-lief_0.16.4.bb
index 925baa655c..294f8fd1ad 100644
--- a/meta-python/recipes-devtools/python/python3-lief_0.16.3.bb
+++ b/meta-python/recipes-devtools/python/python3-lief_0.16.4.bb
@@ -9,8 +9,10 @@ SRC_URI = " \
     git://github.com/lief-project/LIEF.git;protocol=https;branch=main \
     file://0001-build-requirements.txt-Allow-newer-versions.patch \
     file://0002-api-python-config-default.toml-Debug.patch \
+    file://0001-Add-cstdio-include.patch \
 "
-SRCREV = "646af9f6ced8e827916648f26617998de834db78"
+SRCREV = "1e9b12bd14cbe087d52355b8b9af578f1b04d8ca"
+
 PV .= "+git"
 
 S = "${WORKDIR}/git"
@@ -27,6 +29,7 @@ DEPENDS += "\
     python3-pydantic-native \
     ninja-native \
     ccache-native \
+    python3-typing-inspection \
 "
 # https://github.com/lief-project/LIEF/commit/3def579f75965aa19c021d840a759bce2afc0a31#r152197203
 COMPATIBLE_HOST:x86 = "null"

