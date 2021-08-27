Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.118.1630091826950698938
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Aug 2021 12:17:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=du/aOeAn;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1630091827;
  x=1661627827;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0CBh1g7YkGNc2H3zbmqRBo/YMOnCAwIhawzHCNbO2q4=;
  b=du/aOeAnqEFoH8pPZabsWFTX6b49trdGwbPUIirxEwbukegjB/2hlv9l
   LumfqCfCVD7sHCEx8JChdIP1VYLLyNC5C4+FXoru2nbD9FRT1gAHhJbZg
   pkGZc3P2Ot9xGHXoMiyZvlfgjv5DBJQBNpYZ7y7ByuF3sE4pZTqg/S2gf
   4nyNitH+X86I2kpJt2vE9BpQlTz7klZJXrwt6mlf1jd9Zpw2PiUMk6X0X
   tmFVjIiKbnPlhyL4VaXC6sapEH0J+Md35UVxch5NVVsp1N38MUx4LwOWn
   VVqSTqIQoaLqMUsUbI6VB8PyQVCic6et0mHtLaaaifB2OQKB1ENmUuFH0
   w==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] chrony: Use new override syntax for USERADD_PARAM
Date: Fri, 27 Aug 2021 21:16:53 +0200
Message-ID: <20210827191653.17109-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This was introduced in commit 18306e6f.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-networking/recipes-support/chrony/chrony_4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/chrony/chrony_4.1.bb b/meta-networking/recipes-support/chrony/chrony_4.1.bb
index f009bae75..117451db2 100644
--- a/meta-networking/recipes-support/chrony/chrony_4.1.bb
+++ b/meta-networking/recipes-support/chrony/chrony_4.1.bb
@@ -50,7 +50,7 @@ inherit update-rc.d systemd
 # Add chronyd user if privdrop packageconfig is selected
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'privdrop', 'useradd', '', d)}
 USERADD_PACKAGES = "${@bb.utils.contains('PACKAGECONFIG', 'privdrop', '${PN}', '', d)}"
-USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'privdrop', '--system -d / -M --shell /bin/nologin chronyd;', '', d)}"
+USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'privdrop', '--system -d / -M --shell /bin/nologin chronyd;', '', d)}"
 
 # Configuration options:
 # - For command line editing support in chronyc, you may specify either
