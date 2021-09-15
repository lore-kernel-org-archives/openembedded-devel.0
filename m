Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web09.7798.1631714133924159904
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Sep 2021 06:55:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PbVSzVPN;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id me5-20020a17090b17c500b0019af76b7bb4so4327297pjb.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Sep 2021 06:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=AVWnc7F8BHiUlDLhiMmvm5NRSQltVSIAa8TK/PC3C2E=;
        b=PbVSzVPN5pEJc6PZZGQtcCCdVW9s/iGIdCfFpYou0PXCzxJFdF58eP5bgGLI2DIyWa
         vLoXTnt2ix/rC3lOeq+5NkHnc7okYCDBlpg0762XMqpCjJLfHwkgIJ2gWa4bCdOOVaza
         dFUQQSuf36xaq4MVzxRsLAjkE6NsCfRSio2ERa348MoYpm9XEIwkU/yIsQ9jA8U3aSkl
         9t5Ic3sdcjO4jKwJ9MaszGy0cGNyD7c34CqGQjJBOTywVm74yFwROJxLJHlrDVraHQdn
         AZvM7MKEYVKK+BVFbCGwDSn2vwHZ9ohM454r6clIgPHMrZjZJ0mZXmuopItIHjnMj7KA
         +6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AVWnc7F8BHiUlDLhiMmvm5NRSQltVSIAa8TK/PC3C2E=;
        b=S8j1xtMoQhaAl56QjbAuRiOjzP59UT/MIgGQxIlSGI4WuDwDj9sNIBhdtNVzIYK43z
         AjhnIIrRut/efmdPlAblztYtuYx9p7tpUvgpyJqjPqzZB9Rdzlqg7aQapffPgQqjnf96
         55dW2O4aoL+tRcmpi+iCTyKyz9bGhc+Gj8ZzxDa4Nn7/R+BYowbauHKttTmnZrHmcLCF
         D52cSNm9VarvSvVIvKKDXdKO2qVf7pdjGp2FXbiN7iRB5wIMabBQpQdkHp7RUex+G4J3
         6SuPnKXXibQ+mxdy3F/e/ge9JzwWQr6z0NNou1OBDSCGjdAnRlzuNJYhcaWnlWQcQfaD
         J7bQ==
X-Gm-Message-State: AOAM5326dBXXLeb+ERzS3nVYRcp/ZjNwBNYZ4YaVZPDxf/1Z1LIVgEhq
	m56aw9NV2GAzqjSyfJrin/4qW3n5HIg=
X-Google-Smtp-Source: ABdhPJxJCBZKPK3t87tYk+KB8bIWjI7ovJLgrTAF1QytfRx/XmZSiKa/eon3XcQp51R2fXRbfmQO2A==
X-Received: by 2002:a17:902:c40e:b0:138:e2f9:6c97 with SMTP id k14-20020a170902c40e00b00138e2f96c97mr19579369plk.26.1631714133203;
        Wed, 15 Sep 2021 06:55:33 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:35e:ec78:cef4:300f])
        by smtp.gmail.com with ESMTPSA id v7sm4824941pjk.37.2021.09.15.06.55.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 06:55:32 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 9/9] c-ares: fix CVE-2021-3672
Date: Wed, 15 Sep 2021 06:55:20 -0700
Message-Id: <dc262c52b0b10625bf7a2330e1c4e0fe2d8db6aa.1631713963.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1631713963.git.akuster808@gmail.com>
References: <cover.1631713963.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://c-ares.org/adv_20210810.html
https://github.com/c-ares/c-ares/commit/362f91d807d293791008cdb7616d40f7784ece83
https://github.com/c-ares/c-ares/commit/44c009b8e62ea1929de68e3f438181bea469ec14

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../c-ares/c-ares/0001-CVE-2021-3672.patch    |  91 +++++++++++++++
 .../c-ares/c-ares/0002-CVE-2021-3672.patch    | 104 ++++++++++++++++++
 .../recipes-support/c-ares/c-ares_1.16.1.bb   |   2 +
 3 files changed, 197 insertions(+)
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0001-CVE-2021-3672.patch
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0002-CVE-2021-3672.patch

diff --git a/meta-oe/recipes-support/c-ares/c-ares/0001-CVE-2021-3672.patch b/meta-oe/recipes-support/c-ares/c-ares/0001-CVE-2021-3672.patch
new file mode 100644
index 0000000000..93afb838fb
--- /dev/null
+++ b/meta-oe/recipes-support/c-ares/c-ares/0001-CVE-2021-3672.patch
@@ -0,0 +1,91 @@
+From 13363ab0eb3f5a3223571d073888816bd3e650f9 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 14 Sep 2021 13:49:11 +0800
+Subject: [PATCH 1/2] ares_expand_name() should escape more characters
+
+RFC1035 5.1 specifies some reserved characters and escaping sequences
+that are allowed to be specified.  Expand the list of reserved characters
+and also escape non-printable characters using the \DDD format as
+specified in the RFC.
+
+Bug Reported By: philipp.jeitner@sit.fraunhofer.de
+Fix By: Brad House (@bradh352)
+
+Upstream-Status: Backport [https://github.com/c-ares/c-ares/commit/362f91d807d293791008cdb7616d40f7784ece83]
+CVE: CVE-2021-3672
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ ares_expand_name.c | 41 ++++++++++++++++++++++++++++++++++++++---
+ 1 file changed, 38 insertions(+), 3 deletions(-)
+
+diff --git a/ares_expand_name.c b/ares_expand_name.c
+index 3a38e67..8604543 100644
+--- a/ares_expand_name.c
++++ b/ares_expand_name.c
+@@ -38,6 +38,26 @@
+ static int name_length(const unsigned char *encoded, const unsigned char *abuf,
+                        int alen);
+ 
++/* Reserved characters for names that need to be escaped */
++static int is_reservedch(int ch)
++{
++  switch (ch) {
++    case '"':
++    case '.':
++    case ';':
++    case '\\':
++    case '(':
++    case ')':
++    case '@':
++    case '$':
++      return 1;
++    default:
++      break;
++  }
++
++  return 0;
++}
++
+ /* Expand an RFC1035-encoded domain name given by encoded.  The
+  * containing message is given by abuf and alen.  The result given by
+  * *s, which is set to a NUL-terminated allocated buffer.  *enclen is
+@@ -117,9 +137,18 @@ int ares_expand_name(const unsigned char *encoded, const unsigned char *abuf,
+           p++;
+           while (len--)
+             {
+-              if (*p == '.' || *p == '\\')
++              if (!isprint(*p)) {
++                /* Output as \DDD for consistency with RFC1035 5.1 */
++                *q++ = '\\';
++                *q++ = '0' + *p / 100;
++                *q++ = '0' + (*p % 100) / 10;
++                *q++ = '0' + (*p % 10);
++              } else if (is_reservedch(*p)) {
+                 *q++ = '\\';
+-              *q++ = *p;
++                *q++ = *p;
++              } else {
++                *q++ = *p;
++              }
+               p++;
+             }
+           *q++ = '.';
+@@ -177,7 +206,13 @@ static int name_length(const unsigned char *encoded, const unsigned char *abuf,
+           encoded++;
+           while (offset--)
+             {
+-              n += (*encoded == '.' || *encoded == '\\') ? 2 : 1;
++              if (!isprint(*encoded)) {
++                n += 4;
++              } else if (is_reservedch(*encoded)) {
++                n += 2;
++              } else {
++                n += 1;
++              }
+               encoded++;
+             }
+           n++;
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-support/c-ares/c-ares/0002-CVE-2021-3672.patch b/meta-oe/recipes-support/c-ares/c-ares/0002-CVE-2021-3672.patch
new file mode 100644
index 0000000000..e3b32f5fef
--- /dev/null
+++ b/meta-oe/recipes-support/c-ares/c-ares/0002-CVE-2021-3672.patch
@@ -0,0 +1,104 @@
+From 446225e54b4f23c08a07968433b39d62ed65afd1 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 14 Sep 2021 13:59:28 +0800
+Subject: [PATCH 2/2] ares_expand_name(): fix formatting and handling of root
+ name response
+
+Fixes issue introduced in prior commit with formatting and handling
+of parsing a root name response which should not be escaped.
+
+Fix By: Brad House
+
+Upstream-Status: Backport [https://github.com/c-ares/c-ares/commit/44c009b8e62ea1929de68e3f438181bea469ec14]
+CVE: CVE-2021-3672
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ ares_expand_name.c | 56 +++++++++++++++++++++++++++++-----------------
+ 1 file changed, 35 insertions(+), 21 deletions(-)
+
+diff --git a/ares_expand_name.c b/ares_expand_name.c
+index 8604543..af0c2e8 100644
+--- a/ares_expand_name.c
++++ b/ares_expand_name.c
+@@ -133,22 +133,30 @@ int ares_expand_name(const unsigned char *encoded, const unsigned char *abuf,
+         }
+       else
+         {
+-          len = *p;
++          int name_len = *p;
++          len = name_len;
+           p++;
+           while (len--)
+             {
+-              if (!isprint(*p)) {
+-                /* Output as \DDD for consistency with RFC1035 5.1 */
+-                *q++ = '\\';
+-                *q++ = '0' + *p / 100;
+-                *q++ = '0' + (*p % 100) / 10;
+-                *q++ = '0' + (*p % 10);
+-              } else if (is_reservedch(*p)) {
+-                *q++ = '\\';
+-                *q++ = *p;
+-              } else {
+-                *q++ = *p;
+-              }
++              /* Output as \DDD for consistency with RFC1035 5.1, except
++               * for the special case of a root name response  */
++              if (!isprint(*p) && !(name_len == 1 && *p == 0))
++                {
++
++                  *q++ = '\\';
++                  *q++ = '0' + *p / 100;
++                  *q++ = '0' + (*p % 100) / 10;
++                  *q++ = '0' + (*p % 10);
++                }
++              else if (is_reservedch(*p))
++                {
++                  *q++ = '\\';
++                  *q++ = *p;
++                }
++              else
++                {
++                  *q++ = *p;
++                }
+               p++;
+             }
+           *q++ = '.';
+@@ -200,19 +208,25 @@ static int name_length(const unsigned char *encoded, const unsigned char *abuf,
+         }
+       else if (top == 0x00)
+         {
+-          offset = *encoded;
++          int name_len = *encoded;
++          offset = name_len;
+           if (encoded + offset + 1 >= abuf + alen)
+             return -1;
+           encoded++;
+           while (offset--)
+             {
+-              if (!isprint(*encoded)) {
+-                n += 4;
+-              } else if (is_reservedch(*encoded)) {
+-                n += 2;
+-              } else {
+-                n += 1;
+-              }
++              if (!isprint(*encoded) && !(name_len == 1 && *encoded == 0))
++                {
++                  n += 4;
++                }
++              else if (is_reservedch(*encoded))
++                {
++                  n += 2;
++                }
++              else
++                {
++                  n += 1;
++                }
+               encoded++;
+             }
+           n++;
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb b/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
index 67dd701807..afcc1cc4b8 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
@@ -11,6 +11,8 @@ SRC_URI = "\
     git://github.com/c-ares/c-ares.git \
     file://cmake-install-libcares.pc.patch \
     file://0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch \
+    file://0001-CVE-2021-3672.patch \
+    file://0002-CVE-2021-3672.patch \
 "
 SRCREV = "74a1426ba60e2cd7977e53a22ef839c87415066e"
 
-- 
2.25.1

