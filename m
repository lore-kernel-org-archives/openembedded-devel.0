Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.7134.1631607709736087638
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Sep 2021 01:21:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: changqing.li@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 18E8LmcH021176
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Sep 2021 01:21:48 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 18E8LliX020535
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Sep 2021 01:21:48 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 14 Sep 2021 01:21:47 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 14 Sep 2021 01:21:46 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [hardnott][PATCH] c-ares: fix CVE-2021-3672
Date: Tue, 14 Sep 2021 16:17:21 +0800
Message-ID: <20210914081721.39342-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://c-ares.org/adv_20210810.html
https://github.com/c-ares/c-ares/commit/362f91d807d293791008cdb7616d40f7784ece83
https://github.com/c-ares/c-ares/commit/44c009b8e62ea1929de68e3f438181bea469ec14

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../c-ares/c-ares/0001-CVE-2021-3672.patch    |  91 +++++++++++++++
 .../c-ares/c-ares/0002-CVE-2021-3672.patch    | 104 ++++++++++++++++++
 .../recipes-support/c-ares/c-ares_1.16.1.bb   |   2 +
 3 files changed, 197 insertions(+)
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0001-CVE-2021-3672.patch
 create mode 100644 meta-oe/recipes-support/c-ares/c-ares/0002-CVE-2021-3672.patch

diff --git a/meta-oe/recipes-support/c-ares/c-ares/0001-CVE-2021-3672.patch b/meta-oe/recipes-support/c-ares/c-ares/0001-CVE-2021-3672.patch
new file mode 100644
index 000000000..93afb838f
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
index 000000000..e3b32f5fe
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
index 67dd70180..afcc1cc4b 100644
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
2.17.1

