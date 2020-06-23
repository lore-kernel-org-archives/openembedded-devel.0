Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.3646.1592905906412548354
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Jun 2020 02:51:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=35806 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jnfaf-0006Iq-Dp; Tue, 23 Jun 2020 12:51:42 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 01/11] python3-sqlalchemy: Upgrade 1.3.12 -> 1.3.17
Date: Tue, 23 Jun 2020 12:51:26 +0300
Message-Id: <20200623095136.24854-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-0.2
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Upgrade to release 1.3.17:

- orm Bug fixes
- orm Added an accessor ColumnProperty.Comparator.expressions
  which provides access to the group of columns mapped under a
  multi-column ColumnProperty attribute.
- orm Introduce _orm.relationship.sync_backref flag in a
  relationship to control if the synchronization events that
  mutate the in-Python attributes are added. This supersedes the
  previous change #5149, which warned that viewonly=True
  relationship target of a back_populates or backref configuration
  would be disallowed.
- engine Bug fixes
- schema Bug fixes
- schema Add comment attribute to _schema.Column __repr__ method.

The year in LICENSE has been updated so LIC_FILES_CHKSUM was
changed.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n3-sqlalchemy_1.3.12.bb => python3-sqlalchemy_1.3.17.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.3.12.bb => python3-sqlalchemy_1.3.17.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.12.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.17.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.12.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.17.bb
index e29b572cb..b9c58e5b6 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.12.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.17.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "Python SQL toolkit and Object Relational Mapper that gives \
 application developers the full power and flexibility of SQL"
 HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2f5eb030c48975d5294baf0f5d01af1c"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c19467890539ff718c00a019c9c7a7b2"
 
-SRC_URI[md5sum] = "02a46be841903b60c52a83342d3ced8e"
-SRC_URI[sha256sum] = "bfb8f464a5000b567ac1d350b9090cf081180ec1ab4aa87e7bca12dab25320ec"
+SRC_URI[md5sum] = "478214152b9293bf5652815d7312c890"
+SRC_URI[sha256sum] = "156a27548ba4e1fed944ff9fcdc150633e61d350d673ae7baaf6c25c04ac1f71"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.17.1

