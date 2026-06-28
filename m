Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE98CC44500
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:05 +0000 (UTC)
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69131.1782634323094982632
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HlIjrYTH;
 spf=pass (domain: gmail.com, ip: 74.125.82.45, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-13809223fd4so2845210c88.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634322; x=1783239122; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZcMEWsyzZpHi0P1nNnj/NZcHxDENF3qtWAt7FG1QjU=;
        b=HlIjrYTH6LKCrrfQs92wn6Fy3c/K/ScGRKb8akT5cbk5MT+UDMz69ayJw1KQGnUVXI
         DmbCrmOn6EjT9XXHXQ6fDGEbYaGMhQejeszKLsfRaMH1SQEg21uU8fekF+Mz9+wUaUWo
         bldzNUouW7MN/aKtXJUwuClE6fgGj3sIKdxJdGFNzyf0B8p6m/RA8Zg0py3lWfdNRtBv
         Zu5T7Yj0XyCoY+/6nuavH72CGkW8ebqkYeG9++j5aIevT/xTkwtNhku8naBANZPF2MCy
         OuLQqm84WfSJnRgJWRcY9lL4mB5e1W7A6fCUAQwT+ePF0NoeQxoNE0jzaYHk4/lCBsq2
         znBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634322; x=1783239122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iZcMEWsyzZpHi0P1nNnj/NZcHxDENF3qtWAt7FG1QjU=;
        b=dKNWhr/Vo9sjXnmHB5TZqDryYsxdjRfQZk+sqrsBLPqXFcvO0zpu5j29T6u9iOwL/g
         HULiDbfkTX7rUemmHllKQZYxPwiwMrOQhOZ8x+PfkmPl2fD/4R8cjA25xzzdtenkruT+
         dwbt7GsZwqAEv18/GXfAg+W5iecV8dlsIj0EfoBJyVho6Ys1d8RNnAm6ypq7VxMCJ7oX
         CwKt0FZGBK7iBkGp9C/C/MROCW8bt8kV/LfMdeL/iF/9Z7zmzzVIdaxv0eYlKJjehU5L
         2FYB/xmOKVz6NiBSd493+2KyCCNizGb4iv/QGC/7HABoBF4v21iOhYVRxbpVYPgx3gKO
         NgFg==
X-Gm-Message-State: AOJu0YzaVWpOpVqWXBqPWMx6Od57KJvQEPXGwYvkGc2Mr+aFDdD1nPau
	vHjCWVNaP1GGDTv0eXi8UOVX7Ns+In95qtPDTnNVRCCutf+rH9ZC6p/KB/UZSF57GZpWqg==
X-Gm-Gg: AfdE7cnbM1wVGfx4PWj4fEC7kuTgTOaNDlvVPRRN8rarCEEK7JmDHa8dIWEBtG0blJk
	6qPdlKD8mh/kAAby5UNq8+oEZ3ZAvU8d4lHpcJ6YRiRpOp5nw+tCUri5+2So5U1YQ5NnpGkaZ32
	CpVhJI2AO9BvMlBceIvUBTyLoIV+rp3MfdUagobyfBSCmSB/QniIY/K07xopJnCqYOxw6a0jk2W
	PZApUf76Yojy6SYyBqNeE1gERfly23kor3cGK37VkIfhzSY4EJuALOe37qXV4CmXy9y374ITGMr
	FZB+pay4NsQpA1Dl4xNaLrJ2GieepLu/kjkO5OVlo786SZGo8bWpiZrjoJ2Fu6YWQ+mO/ytshWG
	nBwFAIxPifTRw9qNZJZxmaGwwLW8lPjqM0NVu7DS/0b20p6WEROizdLd/7KkXUMARkCCiHOy1ns
	ID5qO393rjjtKXTFDSyBztzmZr1PqkJDeGPUMKbYO4Jv5NaCIL9/FGeUo4Cj4dUAex0v24/PT8K
	A8EPUi38VDLwAhsdS4K6W94jmtpsAQdG9cZINsegNy7CofLPJ/Lp5Ae7lVwoudSSQxLvSUGVzhh
	ZiaFnQKbGdX/W5ZerqP+l6LGNoFwuw==
X-Received: by 2002:a05:7301:1930:b0:30c:6458:5566 with SMTP id 5a478bee46e88-30c84f59957mr13641401eec.26.1782634322341;
        Sun, 28 Jun 2026 01:12:02 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 040/128] geany: upgrade 2.0 -> 2.1
Date: Sun, 28 Jun 2026 01:09:51 -0700
Message-ID: <20260628081122.178348-40-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127850

Drop the patch that was for geany 2.0 and is now applied upstream in 2.1.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../geany/geany/geany-2.0-gcc15.patch         | 146 ------------------
 .../geany/{geany_2.0.bb => geany_2.1.bb}      |   3 +-
 2 files changed, 1 insertion(+), 148 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/geany/geany/geany-2.0-gcc15.patch
 rename meta-oe/recipes-devtools/geany/{geany_2.0.bb => geany_2.1.bb} (82%)

diff --git a/meta-oe/recipes-devtools/geany/geany/geany-2.0-gcc15.patch b/meta-oe/recipes-devtools/geany/geany/geany-2.0-gcc15.patch
deleted file mode 100644
index 2886b73d22..0000000000
--- a/meta-oe/recipes-devtools/geany/geany/geany-2.0-gcc15.patch
+++ /dev/null
@@ -1,146 +0,0 @@
-Fix build with GCC-15
-
-Upstream-Status: Backport [https://sourceforge.net/p/scintilla/code/ci/c7ffad21b23dfad4e8e9f36bb587acc2f6e84fee/]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- a/scintilla/gtk/PlatGTK.cxx
-+++ b/scintilla/gtk/PlatGTK.cxx
-@@ -5,6 +5,7 @@
- 
- #include <cstddef>
- #include <cstdlib>
-+#include <cstdint>
- #include <cstring>
- #include <cstdio>
- #include <cmath>
---- a/scintilla/src/AutoComplete.cxx
-+++ b/scintilla/src/AutoComplete.cxx
-@@ -7,6 +7,7 @@
- 
- #include <cstddef>
- #include <cstdlib>
-+#include <cstdint>
- #include <cassert>
- #include <cstring>
- #include <cstdio>
---- a/scintilla/src/CallTip.cxx
-+++ b/scintilla/src/CallTip.cxx
-@@ -7,6 +7,7 @@
- 
- #include <cstddef>
- #include <cstdlib>
-+#include <cstdint>
- #include <cassert>
- #include <cstring>
- #include <cstdio>
---- a/scintilla/src/CellBuffer.cxx
-+++ b/scintilla/src/CellBuffer.cxx
-@@ -7,6 +7,7 @@
- 
- #include <cstddef>
- #include <cstdlib>
-+#include <cstdint>
- #include <cassert>
- #include <cstring>
- #include <cstdio>
---- a/scintilla/src/ChangeHistory.cxx
-+++ b/scintilla/src/ChangeHistory.cxx
-@@ -7,6 +7,7 @@
- 
- #include <cstddef>
- #include <cstdlib>
-+#include <cstdint>
- #include <cassert>
- 
- #include <stdexcept>
---- a/scintilla/src/Decoration.cxx
-+++ b/scintilla/src/Decoration.cxx
-@@ -6,6 +6,7 @@
- 
- #include <cstddef>
- #include <cstdlib>
-+#include <cstdint>
- #include <cstring>
- #include <cstdio>
- #include <cstdarg>
---- a/scintilla/src/Document.cxx
-+++ b/scintilla/src/Document.cxx
-@@ -7,6 +7,7 @@
- 
- #include <cstddef>
- #include <cstdlib>
-+#include <cstdint>
- #include <cassert>
- #include <cstring>
- #include <cstdio>
---- a/scintilla/src/Indicator.cxx
-+++ b/scintilla/src/Indicator.cxx
-@@ -5,6 +5,7 @@
- // Copyright 1998-2001 by Neil Hodgson <neilh@scintilla.org>
- // The License.txt file describes the conditions under which this software may be distributed.
- 
-+#include <cstdint>
- #include <cmath>
- 
- #include <stdexcept>
---- a/scintilla/src/KeyMap.cxx
-+++ b/scintilla/src/KeyMap.cxx
-@@ -6,6 +6,7 @@
- // The License.txt file describes the conditions under which this software may be distributed.
- 
- #include <cstdlib>
-+#include <cstdint>
- 
- #include <stdexcept>
- #include <string_view>
---- a/scintilla/src/LineMarker.cxx
-+++ b/scintilla/src/LineMarker.cxx
-@@ -5,6 +5,7 @@
- // Copyright 1998-2011 by Neil Hodgson <neilh@scintilla.org>
- // The License.txt file describes the conditions under which this software may be distributed.
- 
-+#include <cstdint>
- #include <cstring>
- #include <cmath>
- 
---- a/scintilla/src/PerLine.cxx
-+++ b/scintilla/src/PerLine.cxx
-@@ -6,6 +6,7 @@
- // The License.txt file describes the conditions under which this software may be distributed.
- 
- #include <cstddef>
-+#include <cstdint>
- #include <cassert>
- #include <cstring>
- 
---- a/scintilla/src/Style.cxx
-+++ b/scintilla/src/Style.cxx
-@@ -5,6 +5,8 @@
- // Copyright 1998-2001 by Neil Hodgson <neilh@scintilla.org>
- // The License.txt file describes the conditions under which this software may be distributed.
- 
-+#include <cstdint>
-+
- #include <stdexcept>
- #include <string_view>
- #include <vector>
---- a/scintilla/src/ViewStyle.cxx
-+++ b/scintilla/src/ViewStyle.cxx
-@@ -6,6 +6,7 @@
- // The License.txt file describes the conditions under which this software may be distributed.
- 
- #include <cstddef>
-+#include <cstdint>
- #include <cassert>
- #include <cstring>
- #include <cmath>
---- a/scintilla/src/XPM.cxx
-+++ b/scintilla/src/XPM.cxx
-@@ -6,6 +6,7 @@
- // The License.txt file describes the conditions under which this software may be distributed.
- 
- #include <cstdlib>
-+#include <cstdint>
- #include <cstring>
- #include <climits>
- 
diff --git a/meta-oe/recipes-devtools/geany/geany_2.0.bb b/meta-oe/recipes-devtools/geany/geany_2.1.bb
similarity index 82%
rename from meta-oe/recipes-devtools/geany/geany_2.0.bb
rename to meta-oe/recipes-devtools/geany/geany_2.1.bb
index 4b51195e08..2a0c4e5b5b 100644
--- a/meta-oe/recipes-devtools/geany/geany_2.0.bb
+++ b/meta-oe/recipes-devtools/geany/geany_2.1.bb
@@ -11,9 +11,8 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "https://download.geany.org/${BP}.tar.bz2 \
            file://0001-configure-Upgrade-to-a-modern-Gettext.patch \
-           file://geany-2.0-gcc15.patch \
           "
-SRC_URI[sha256sum] = "565b4cd2f0311c1e3a167ec71c4a32dba642e0fe554ae5bb6b8177b7a74ccc92"
+SRC_URI[sha256sum] = "6b96a8844463300c10b9692a0a5edad8236eec9e84342f575f83d4fc89331228"
 
 FILES:${PN} += "${datadir}/icons"
 

