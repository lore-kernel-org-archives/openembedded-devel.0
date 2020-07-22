Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.856.1595458578281541164
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2020 15:56:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=D7+/UQP1;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id p1so1697227pls.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2020 15:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UssJ2WTKDlfqi350w9QO+2t6+umAwmCzYgGwu+uTuV4=;
        b=D7+/UQP1rphjK7HZx00Rq9cJ9Yj0dDlGOREB6xUN+TVpTVt1vYpn/UJwh2m0dcG/9Z
         Y96IutWl+MCkqBeVkpJBidFsWxsXHMABUy2/vuCVtLYfRI6RWwhv5A6g+dzJkZO6sxgh
         Go5/BEoqCk1kMzn1EHTaYj4km4g4LZdIFp1rLrixDDTeKSFqenoN8KTSo0XF+tOxWxFA
         63AeaDcDfrZMm8tIPBRO3ipYo7SgkEtueyEcD0P0swijvElw73fPYampPHYOFcjLk2/0
         /C62UwGKEiytqlAF3L9f8n0kM/Hx9HgtNFaOPPiEq3q32b76OtHO70vykFIrSKPogCRj
         4qlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UssJ2WTKDlfqi350w9QO+2t6+umAwmCzYgGwu+uTuV4=;
        b=j/HPmDAI76X5UkZNWJElsUBZ2a5emwljmHLvbpBQNJo56F1k0o4jynDQxEbSdgaaRA
         yzt0DQODReqgZD0QrfR/v3jMF481FB3lHgAQbZ1n3bF6cN7vviMRjvboMtjrPqXBw2f0
         YWi6knlJUugUKqOm/nc2rcCXl2ci8zyZdGfUOI5rwaLWNiszhdrpexGVaBFFapqoreq/
         bbQh0dzGRJgAe41rEOWJY5rnPoZHUaJ5pL/dMJGKmlCkLwbUE60cu9fkztzWEV2Oxllt
         12LHeIr6RDoxBwbbRGk/k2XEp+2ItEGTD0eITEFJaoPWHOCHMSXKbDX34OTGa4hGKHGG
         VSCA==
X-Gm-Message-State: AOAM531xIA8xfGwBIgKAC210DTdAtwLMoJ6/qNW6CnLZt81EkPI31h/v
	6Kdn33wEF/lHy410p8mLaoPRvMKzAdc=
X-Google-Smtp-Source: ABdhPJzTwp6GxLYLhC9/qWUK4y4YscAsgLFgJaBl1kw6CGbHB74s8DvyyJ8XMg7jLxduEJDv3B6ZPw==
X-Received: by 2002:a17:90a:20ad:: with SMTP id f42mr1462279pjg.96.1595458577149;
        Wed, 22 Jul 2020 15:56:17 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::6651])
        by smtp.gmail.com with ESMTPSA id k64sm637357pfd.132.2020.07.22.15.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 15:56:16 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Colin McAllister <colinmca242@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/4] python3-cantools: Added recipe
Date: Wed, 22 Jul 2020 15:56:05 -0700
Message-Id: <20200722225608.3968953-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Colin McAllister <colinmca242@gmail.com>

Created python3 recipe for cantools.

Signed-off-by: Colin McAllister <colinmca242@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-cantools_35.1.0.bb              | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-cantools_35.1.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-cantools_35.1.0.bb b/meta-python/recipes-devtools/python/python3-cantools_35.1.0.bb
new file mode 100644
index 0000000000..a9638fbd2b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cantools_35.1.0.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "CAN BUS tools in Python 3."
+HOMEPAGE = "https://github.com/eerimoq/cantools"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
+
+SRC_URI[md5sum] = "46b71bbfec33146d9dbba708489a8ae2"
+SRC_URI[sha256sum] = "bd0ac5b16bb7fe2ada0c9436c91a0b3795217bed7126296dde1565919a3f44f1"
+
+PYPI_PACKAGE = "cantools"
+
+inherit pypi setuptools3
+
+CLEANBROKEN = "1"
+
-- 
2.27.0

