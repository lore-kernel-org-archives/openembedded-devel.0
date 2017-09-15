Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4233C77FE8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 19:24:45 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id i14so2017313qke.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 12:24:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gLvNTCOyJ8Tjo2vXrzQJv6wtUmWrgHYeNMhcuXrUv4Y=;
	b=uV4wXUwXvZhFaGW/duxq0XEfpHYdQ4biufgW9fKz9uF+OpYsPnbTuCJuRZfZwnsCvn
	fpnc9CtZNjhV+FvExxR9hkh6M1IQ9vFjcfT7/EeqiFzzXPBuNhglhpWXwxW1UJaWu/d0
	8yKl3rqWhSJfdOnVS8b333p3UttUEY4ALDlAlE1oOdi0tw6DheMDD+4PqYwSeRaxZM7y
	0O63jkHTO3yY1B/do80XwAsYgweeCRXPxOdiOPuWOIfr/bkqS144XS+z6tt+F4X4Jqqz
	IiPz+nmBEd6pTkz7S59ER8NhuFzGt9izGBvR3FQK/h+FpPujTC9meD/tcVXv8pElIpDW
	SHLg==
X-Gm-Message-State: AHPjjUhfWDoEMmGRJM/HXFMB1PBNolRDaq9nVFuo//bcTIhOMNq7+W8l
	I5iK5jDTJR1iRP6DdJ8=
X-Google-Smtp-Source: AOwi7QBDSG1s5yWrTB2FCAbidWtP8Y/BsU+yuB6p4ZteyBAABVJbCqqBjTBithMMqyzJKdaSrZ2AUQ==
X-Received: by 10.55.195.12 with SMTP id a12mr9377867qkj.157.1505503487013;
	Fri, 15 Sep 2017 12:24:47 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	b202sm998007qkc.65.2017.09.15.12.24.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Sep 2017 12:24:46 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Sep 2017 15:24:39 -0400
Message-Id: <1505503479-24867-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pytest-runner: update to version 2.12.1
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
X-List-Received-Date: Fri, 15 Sep 2017 19:24:46 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pytest-runner.inc         | 5 ++---
 ...python-pytest-runner_2.11.1.bb => python-pytest-runner_2.12.1.bb} | 0
 ...thon3-pytest-runner_2.11.1.bb => python3-pytest-runner_2.12.1.bb} | 0
 3 files changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pytest-runner_2.11.1.bb => python-pytest-runner_2.12.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pytest-runner_2.11.1.bb => python3-pytest-runner_2.12.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pytest-runner.inc b/meta-python/recipes-devtools/python/python-pytest-runner.inc
index 85a8de1..c173a18 100644
--- a/meta-python/recipes-devtools/python/python-pytest-runner.inc
+++ b/meta-python/recipes-devtools/python/python-pytest-runner.inc
@@ -2,9 +2,8 @@ SUMMARY = "Invoke py.test as distutils command with dependency resolution"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e38b971c2b4c33b978d1b9c9ece9ae63"
 
-SRC_URI[md5sum] = "bdb73eb18eca2727944a2dcf963c5a81"
-SRC_URI[sha256sum] = "983a31eab45e375240e250161a556163bc8d250edaba97960909338c273a89b3"
-
+SRC_URI[md5sum] = "a8dd57c80cde37a587dd8c37740c1ab1"
+SRC_URI[sha256sum] = "5c9093e7a18780409d9a389f20366f2fd39acfb1db61545fdb2e90cdbd0bcae4"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-pytest-runner_2.11.1.bb b/meta-python/recipes-devtools/python/python-pytest-runner_2.12.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pytest-runner_2.11.1.bb
rename to meta-python/recipes-devtools/python/python-pytest-runner_2.12.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-pytest-runner_2.11.1.bb b/meta-python/recipes-devtools/python/python3-pytest-runner_2.12.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pytest-runner_2.11.1.bb
rename to meta-python/recipes-devtools/python/python3-pytest-runner_2.12.1.bb
-- 
2.7.4


