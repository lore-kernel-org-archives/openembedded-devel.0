Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id E27767551B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2018 20:49:18 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id h4-v6so19586451qtj.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2018 13:49:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Klfusa5MgMZUNHS2G9qFWuZSNY50Ow5MrLfaKpDX+YM=;
	b=ijKkWXEsG2kTGELsW95lpAi/KMcKeiD6jVR6KRfKPaxoyU6SGI/wiia9gJNyLZUZ/U
	KSrVnp2iXPRu7CE+AUHPIZWPeKiQdIKS006xNW3mYZuAol8YWDmdlcXYF26otQhQD1KS
	IF3O/QqUe/7eqfxtNk97IyFY/YLcyGC9K0Kh/tKQlfZWMe8/lAHIlnawd+CTI0ICDNsa
	peJ436Qe2SX7a2pxt4Kpu96wh/nhkzOVoTDpqO2qh80q5zZcQVUOH5NFs9eRhhMatXM6
	NAWiOc2rY66EkoE99IMzTXvFAKRILMhXqV1kqgyhy9XWkAgXO3tvkJs20UKqnOKQS1pt
	9t6w==
X-Gm-Message-State: APt69E3UZ7BI0w0o50L8kS936mD69rRZ+S519pxOY1JQHN0hrBxy+YyI
	UfdN11F0kBACgoXZ8RjjRH67cF1i
X-Google-Smtp-Source: AAOMgpdXzEkTOkDrdFYpSepBA5XSRZrid4Lvgbd0K/toBMbdsVfMkAhYQ9Gw0OpjP9ePtD+/7W1Zzg==
X-Received: by 2002:a0c:e703:: with SMTP id
	d3-v6mr23044070qvn.209.1531255759374; 
	Tue, 10 Jul 2018 13:49:19 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	s6-v6sm5076386qkb.26.2018.07.10.13.49.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Jul 2018 13:49:18 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Jul 2018 16:49:13 -0400
Message-Id: <1531255753-26881-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-migrate: update to version 2.2.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Jul 2018 20:49:19 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-flask-migrate.inc          | 4 ++--
 .../{python-flask-migrate_2.1.1.bb => python-flask-migrate_2.2.1.bb}  | 0
 ...{python3-flask-migrate_2.1.1.bb => python3-flask-migrate_2.2.1.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-flask-migrate_2.1.1.bb => python-flask-migrate_2.2.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-flask-migrate_2.1.1.bb => python3-flask-migrate_2.2.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-flask-migrate.inc b/meta-python/recipes-devtools/python/python-flask-migrate.inc
index 7af4fe1..dfb20e9 100644
--- a/meta-python/recipes-devtools/python/python-flask-migrate.inc
+++ b/meta-python/recipes-devtools/python/python-flask-migrate.inc
@@ -2,8 +2,8 @@ DESCRIPTION = "SQLAlchemy database migrations for Flask applications using Alemb
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b69377f79f3f48c661701236d5a6a85"
 
-SRC_URI[md5sum] = "def4106c80897b7fad2afb3bc05360e4"
-SRC_URI[sha256sum] = "b709ca8642559c3c5a81a33ab10839fa052177accd5ba821047a99db635255ed"
+SRC_URI[md5sum] = "aaeee55431d0287063657122ff41a0e6"
+SRC_URI[sha256sum] = "cd1b4e6cb829eeb41c02ad9202d83bef5f4b7a036dd9fad72ce96ad1e22efb07"
 
 PYPI_PACKAGE = "Flask-Migrate"
 
diff --git a/meta-python/recipes-devtools/python/python-flask-migrate_2.1.1.bb b/meta-python/recipes-devtools/python/python-flask-migrate_2.2.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-flask-migrate_2.1.1.bb
rename to meta-python/recipes-devtools/python/python-flask-migrate_2.2.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-flask-migrate_2.1.1.bb b/meta-python/recipes-devtools/python/python3-flask-migrate_2.2.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-flask-migrate_2.1.1.bb
rename to meta-python/recipes-devtools/python/python3-flask-migrate_2.2.1.bb
-- 
2.7.4


