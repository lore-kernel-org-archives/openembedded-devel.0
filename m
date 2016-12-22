Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id D4ED0776A1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 15:49:54 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id p16so235512886qta.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 07:49:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=t92xW5zlWtX5M531bZoLIJ3poIy/s6gf7LK6OFdgBpI=;
	b=Q83CzHXULs5A9I8l8GYzMrKgnAX7Kf89JHsiTYv6UUx3esBtw9NRHgBn+frSPegSHg
	7IfQqCyZQyYnWQ0c9JYdcv8BXxiQsidzq01btZZqisFNdbP9qvb/Q9iRVKpZR9MS80vW
	jK7ciaiHEtHmiij9nNdGc1ZoWhpGzXGjRS02Kd+SBDdARYtgNJ4QPp5jI82bF8nmHpwi
	akt0jli/MnHMCs7ZCqg1VxF4nWBJiu3iX1X7gHv0SN2BEcmQahKK4oDTi1zC8Sx/p14I
	PJ+HayhEd3Zz2inXlNu8OT3KMI8+6JU7HdvSAllcWggNwRtETwN1nnUzHgUc/SYQ5f4B
	x1Mg==
X-Gm-Message-State: AIkVDXJC6A6AlSbsm4X1lesZ9CKupZpoW0TBDufte1UDO/mK7+hC/++C68gMgcGbOWaDnA==
X-Received: by 10.237.38.33 with SMTP id z30mr4434405qtc.285.1482421795983;
	Thu, 22 Dec 2016 07:49:55 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3])
	by smtp.gmail.com with ESMTPSA id o44sm2772703qtc.8.2016.12.22.07.49.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 22 Dec 2016 07:49:55 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Dec 2016 10:49:47 -0500
Message-Id: <1482421787-29905-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-flask-login: update to version 0.4.0
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
X-List-Received-Date: Thu, 22 Dec 2016 15:49:55 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-flask-login.inc          | 6 +++---
 .../{python-flask-login_0.3.2.bb => python-flask-login_0.4.0.bb}    | 0
 .../{python3-flask-login_0.3.2.bb => python3-flask-login_0.4.0.bb}  | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-flask-login_0.3.2.bb => python-flask-login_0.4.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-flask-login_0.3.2.bb => python3-flask-login_0.4.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-flask-login.inc b/meta-python/recipes-devtools/python/python-flask-login.inc
index 6d4db48..7dddba0 100644
--- a/meta-python/recipes-devtools/python/python-flask-login.inc
+++ b/meta-python/recipes-devtools/python/python-flask-login.inc
@@ -6,9 +6,9 @@ HOMEPAGE = " https://github.com/maxcountryman/flask-login"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8aa87a1cd9fa41d969ad32cfdac2c596"
 
-SRC_URI[md5sum] = "d95c2275d3e1c755145910077366dc45"
-SRC_URI[sha256sum] = "e72eff5c35e5a31db1aeca1db5d2501be702674ea88e8f223b5d2b11644beee6"
+SRC_URI[md5sum] = "e050efaa2c4dbc2d97f480a70f4d44aa"
+SRC_URI[sha256sum] = "d25e356b14a59f52da0ab30c31c2ad285fa23a840f0f6971df7ed247c77082a7"
 
 PYPI_PACKAGE = "Flask-Login"
 
-RDEPENDS_${PN} = "${PYTHON_PN}-flask"
+RDEPENDS_${PN}_class-target = "${PYTHON_PN}-flask"
diff --git a/meta-python/recipes-devtools/python/python-flask-login_0.3.2.bb b/meta-python/recipes-devtools/python/python-flask-login_0.4.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-flask-login_0.3.2.bb
rename to meta-python/recipes-devtools/python/python-flask-login_0.4.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-flask-login_0.3.2.bb b/meta-python/recipes-devtools/python/python3-flask-login_0.4.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-flask-login_0.3.2.bb
rename to meta-python/recipes-devtools/python/python3-flask-login_0.4.0.bb
-- 
2.7.4


