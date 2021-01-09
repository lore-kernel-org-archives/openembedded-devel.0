Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web12.10347.1610229430174889664
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Jan 2021 13:57:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.183.199, mailfrom: robert.joslyn@redrectangle.org)
X-Originating-IP: 173.197.191.182
Received: from localhost.localdomain (rrcs-173-197-191-182.west.biz.rr.com [173.197.191.182])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id C650DFF811;
	Sat,  9 Jan 2021 21:56:01 +0000 (UTC)
From: "Robert Joslyn" <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [meta-oe][dunfell][PATCH] postgresql: Update to 12.5
Date: Sat,  9 Jan 2021 13:55:28 -0800
Message-Id: <20210109215528.1653639-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes the following CVEs:

CVE-2020-25694
CVE-2020-25695
CVE-2020-25696

Full release notes at:
https://www.postgresql.org/docs/12/release-12-5.html

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 .../postgresql/{postgresql_12.4.bb => postgresql_12.5.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_12.4.bb => postgresql_12.5.bb} (73%)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_12.4.bb b/meta-oe/recipes-dbs/postgresql/postgresql_12.5.bb
similarity index 73%
rename from meta-oe/recipes-dbs/postgresql/postgresql_12.4.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_12.5.bb
index 6ea9acc00..047509510 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_12.4.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_12.5.bb
@@ -8,4 +8,4 @@ SRC_URI += "\
    file://0001-Improve-reproducibility.patch \
 "
 
-SRC_URI[sha256sum] = "bee93fbe2c32f59419cb162bcc0145c58da9a8644ee154a30b9a5ce47de606cc"
+SRC_URI[sha256sum] = "bd0d25341d9578b5473c9506300022de26370879581f5fddd243a886ce79ff95"
-- 
2.26.2

