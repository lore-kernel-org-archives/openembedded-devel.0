Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.5618.1593170998703216837
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2020 04:29:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=48362 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jomYO-000568-TN; Fri, 26 Jun 2020 14:29:57 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 06/12] python3-sqlalchemy: Upgrade 1.3.17 -> 1.3.18
Date: Fri, 26 Jun 2020 14:29:38 +0300
Message-Id: <20200626112944.25569-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200626112944.25569-1-leon.anavi@konsulko.com>
References: <20200626112944.25569-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-0.5
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upgrade to release 1.3.18:

- orm: Improve error message when using Query.filter_by() in a
  query where the first entity is not a mapped class.
- orm: Added a new parameter query_expression.default_expr to the
  query_expression() construct, which will be appled to queries
  automatically if the with_expression() option is not used.
- engine: Further refinements to the fixes to the "reset" agent
  fixed in #5326, which now emits a warning when it is not being
  correctly invoked and corrects for the behavior. Additional
  scenarios have been identified and fixed where this warning was
  being emitted.
- engine: Fixed issue in URL object where stringifying the object
  would not URL encode special characters, preventing the URL from
  being re-consumable as a real URL.
- sql: Added a “.schema” parameter to the table() construct,
  allowing ad-hoc table expressions to also include a schema name.
- sql: Introduce IdentityOptions to store common parameters for
  sequences and identity columns.
- schema: Fixed issue where dialect_options were omitted when a
  database object (e.g., Table) was copied using tometadata().

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-sqlalchemy_1.3.17.bb => python3-sqlalchemy_1.3.18.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.3.17.bb => python3-sqlalchemy_1.3.18.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.17.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.18.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.17.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.18.bb
index b9c58e5b6..a5e1737b0 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.17.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.18.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c19467890539ff718c00a019c9c7a7b2"
 
-SRC_URI[md5sum] = "478214152b9293bf5652815d7312c890"
-SRC_URI[sha256sum] = "156a27548ba4e1fed944ff9fcdc150633e61d350d673ae7baaf6c25c04ac1f71"
+SRC_URI[md5sum] = "96e085d318297b1ad36ef2685f54287a"
+SRC_URI[sha256sum] = "da2fb75f64792c1fc64c82313a00c728a7c301efe6a60b7a9fe35b16b4368ce7"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.17.1

