Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id A16D26E687
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 May 2016 13:24:09 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id 90so57313996qgz.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 May 2016 06:24:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=u3agzSbNhp8/sOnhZ70rs/3bVyFoy+59opxG5BWXaHw=;
	b=m9UOwveP7ZHOY4hOTuyhrzNCl90rbmTazygvaCrT1nHE+8V6eCNkmjzrnX0LxZU3/O
	tA3KM9Ca8KZBjMa/wVYU+oBNjJsJ9toixtogJ2BTd8owP14Ynh2ZyqGjbjwsoPCQI5Gj
	4b6NFO21f3Ejh0sqK+sV/tpN2jVRSMIOBFL3KnnUT1B+wHJRG25H2ibaAvAUCZD8fbpx
	DP/GY+67OuNc9K/NiPX5/DhziG8No+PWOzoKgx6syQHdzptDGYZ6InDkMnr8nKWxTP3l
	ACnrjR59vcRuHKXi9ZA+55p3BRD7QhIUyRgEYjf/0/+AZJfJ6o+785WPngNbF1SNsqvl
	yXlQ==
X-Gm-Message-State: AOPr4FXcL1tZKKcTVvFEwjMC6ajeKbj/N/e+YiSyAHO/lpnx45nnOcCJBsvjIszUo9MVEQ==
X-Received: by 10.140.36.231 with SMTP id p94mr15134057qgp.79.1463145850014;
	Fri, 13 May 2016 06:24:10 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	z189sm8246536qhb.42.2016.05.13.06.24.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 May 2016 06:24:09 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 May 2016 09:23:51 -0400
Message-Id: <1463145831-27570-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1463145831-27570-1-git-send-email-derek@asterius.io>
References: <1463145831-27570-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 2/2] python-flask-login: update to 0.3.2
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
X-List-Received-Date: Fri, 13 May 2016 13:24:09 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-flask-login.inc           | 5 +++--
 .../{python-flask-login_0.2.11.bb => python-flask-login_0.3.2.bb}    | 0
 .../{python3-flask-login_0.2.11.bb => python3-flask-login_0.3.2.bb}  | 0
 3 files changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-flask-login_0.2.11.bb => python-flask-login_0.3.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-flask-login_0.2.11.bb => python3-flask-login_0.3.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-flask-login.inc b/meta-python/recipes-devtools/python/python-flask-login.inc
index 95c4428..f5b111b 100644
--- a/meta-python/recipes-devtools/python/python-flask-login.inc
+++ b/meta-python/recipes-devtools/python/python-flask-login.inc
@@ -6,9 +6,10 @@ HOMEPAGE = " https://github.com/maxcountryman/flask-login"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8aa87a1cd9fa41d969ad32cfdac2c596"
 
-SRC_URI[md5sum] = "c0a7eaf28623f0aeac4929dc05a7a064"
-SRC_URI[sha256sum] = "83d5f10e5c4f214feed6cc41c212db63a58a15ac32e56df81591bfa0a5cee3e5"
+SRC_URI[md5sum] = "d95c2275d3e1c755145910077366dc45"
+SRC_URI[sha256sum] = "e72eff5c35e5a31db1aeca1db5d2501be702674ea88e8f223b5d2b11644beee6"
 
 PYPI_PACKAGE = "Flask-Login"
+PYPI_PACKAGE_HASH = "06e661ed90ed8ce6752b745ed13fac3ba407dc9db95dfa2906edc8dd55dde454"
 
 RDEPENDS_${PN} = "${PYTHON_PN}-flask"
diff --git a/meta-python/recipes-devtools/python/python-flask-login_0.2.11.bb b/meta-python/recipes-devtools/python/python-flask-login_0.3.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-flask-login_0.2.11.bb
rename to meta-python/recipes-devtools/python/python-flask-login_0.3.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-flask-login_0.2.11.bb b/meta-python/recipes-devtools/python/python3-flask-login_0.3.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-flask-login_0.2.11.bb
rename to meta-python/recipes-devtools/python/python3-flask-login_0.3.2.bb
-- 
1.9.1


