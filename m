Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.9991.1608632415271660061
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Dec 2020 02:20:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=O/GYy01J;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: ola.x.nilsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1608632415;
  x=1640168415;
  h=from:to:subject:date:message-id:mime-version;
  bh=DFd65LRonzXpUTcG0cseHqZqGyvbOLR2U96mHOLc4HI=;
  b=O/GYy01JXxeRHreZbLmMdBMs8jKhSWPT46pJd3nliLP42VkpsDX9z0/P
   V32uzo01cWUNyZQx0AYb0Dmv0fiCcI+Di3PcUJdGr6CNvFVvYarXHwzmB
   brCWNiNWaMvlQxf8T+XvcRWskL8vY1hTfLWqi6yysueGl9TMz05K85zXQ
   4ILOccigzJEvCfaMseeuB57LwWRGj2dn+tz0+NntUyCqws1DDOMcv3o+b
   zKf1qaI1YkmWWHRKl/YgdoP9A6hAs5GuvDi0y9khj7j+irTSea9QpbrNj
   vhgMmSdhYkMPeV0hQCy1rATHRSedntnyeeM13HZ1OdOmcArU4aZDthuP5
   Q==;
From: "Ola x Nilsson" <ola.x.nilsson@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-idna Remove 2.8
Date: Tue, 22 Dec 2020 11:20:03 +0100
Message-ID: <20201222102003.6708-1-olani@axis.com>
X-Mailer: git-send-email 2.11.0
Return-Path: olani@axis.com
MIME-Version: 1.0
Content-Type: text/plain

Should have been removed when the recipe was upgraded to 2.9.

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 meta-python/recipes-devtools/python/python3-idna_2.8.bb | 2 --
 1 file changed, 2 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-idna_2.8.bb

diff --git a/meta-python/recipes-devtools/python/python3-idna_2.8.bb b/meta-python/recipes-devtools/python/python3-idna_2.8.bb
deleted file mode 100644
index a08ca714a..000000000
--- a/meta-python/recipes-devtools/python/python3-idna_2.8.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools3
-require python-idna.inc
-- 
2.11.0

