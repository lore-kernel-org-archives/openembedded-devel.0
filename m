Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 30F767FA78
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 16:53:10 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id o3so4206389qtj.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 09:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version:organization
	:content-transfer-encoding;
	bh=gHTvVdBsxxSidjhI4/WtwczHo1IzQT+2GuAg2GTbo7E=;
	b=dteqancit5/xXugzUfbEHQc/2cn2jqfJnLrC85ZsxGHFOsVKDjXE/FBli4XsG/w5Qt
	lMo3vST21oHfyowylIZuY9C33iCNzz3hmo6BJVXvHsFfAAy62P7pseH/RrqTv+jftxND
	Egy++ME/JFiBlpUkxh7g17fSMBXjNba+UxvYoEIB+OHGRmifkl3NsbHlC2Y9jPV8qBq6
	+2wVe3tAQcHpuFCyQ3Y/ONKf4/GlDj6W29tB9rNNUenjsgLLuSQzXqvwWQ5JBF0Hjf33
	jzli80ceS7Av2AwV1GJh0yJ+21711e4NP4/IH3qcySQmtL9BqDe2SihzoPEP5MJadWhg
	gEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=gHTvVdBsxxSidjhI4/WtwczHo1IzQT+2GuAg2GTbo7E=;
	b=YkTpOlr3nBe/1Lb5AQXw48w4NRvrZ3p1nrHMyJ/WbW9RMLIn5HQmv68lZAa6OxOoA/
	wrm6rm0loKmBnf8k/B3UyqP6GZQoD6gdRI4AT39+TlTIOLidgkXuquY0zOWzjSurfGNs
	rXUJj6o+McFwiQM6qq2lLbdq5zH5vD1PwCjX+k89UxR1z2XGQiRo1APf0L5EnlKM7CsC
	ESmRY3bToz3qXOWBMq7jISIFkQuhuXkoXNVhzHa6HRnDrahtYKgxZGhyUx5HR4M/7Wfr
	WtsQCutzRnj1zU2YnsCFhg56K4Y4IkiYnlszXlHxEtnpwHMNREcwslub2N71Ex7uuL8h
	R5rA==
X-Gm-Message-State: APjAAAVyH+EBnNdQeo5QGyC/loe8Aybi6iJw/01Bv4XRjvUtk7NJDKHf
	kFi6IeudThc9HlWuzbuoz5FZMg+cHmoSsw==
X-Google-Smtp-Source: APXvYqxzeoOaQ361pSUmHfH5vkNrgR044XcSG2jwSq8b9BE80qxmIFvfJR8Belj0GNmarJAycBWWfQ==
X-Received: by 2002:ac8:4241:: with SMTP id r1mr4094696qtm.111.1572022390921; 
	Fri, 25 Oct 2019 09:53:10 -0700 (PDT)
Received: from pikachu.lab.ossystems ([181.220.83.67])
	by smtp.gmail.com with ESMTPSA id j2sm1408469qki.15.2019.10.25.09.53.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 25 Oct 2019 09:53:10 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Oct 2019 13:52:55 -0300
Message-Id: <20191025165255.27837-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH] python*-setuptools-scm: Update to version 3.3.3
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
X-List-Received-Date: Fri, 25 Oct 2019 16:53:11 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-python/recipes-devtools/python/python-setuptools-scm.inc | 4 ++--
 ...setuptools-scm_2.1.0.bb => python-setuptools-scm_3.3.3.bb} | 0
 ...etuptools-scm_2.1.0.bb => python3-setuptools-scm_3.3.3.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-setuptools-scm_2.1.0.bb => python-setuptools-scm_3.3.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-setuptools-scm_2.1.0.bb => python3-setuptools-scm_3.3.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-setuptools-scm.inc b/meta-python/recipes-devtools/python/python-setuptools-scm.inc
index 98883ec39..a7e1bf6ad 100644
--- a/meta-python/recipes-devtools/python/python-setuptools-scm.inc
+++ b/meta-python/recipes-devtools/python/python-setuptools-scm.inc
@@ -2,8 +2,8 @@ SUMMARY = "the blessed package to manage your versions by scm tags"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[md5sum] = "cfec5d2dbbd0a85c40066f79035b5878"
-SRC_URI[sha256sum] = "a767141fecdab1c0b3c8e4c788ac912d7c94a0d6c452d40777ba84f918316379"
+SRC_URI[md5sum] = "50b2199082fe808d032ec1710c9d7415"
+SRC_URI[sha256sum] = "bd25e1fb5e4d603dcf490f1fde40fb4c595b357795674c3e5cb7f6217ab39ea5"
 
 PYPI_PACKAGE = "setuptools_scm"
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-setuptools-scm_2.1.0.bb b/meta-python/recipes-devtools/python/python-setuptools-scm_3.3.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-setuptools-scm_2.1.0.bb
rename to meta-python/recipes-devtools/python/python-setuptools-scm_3.3.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-setuptools-scm_2.1.0.bb b/meta-python/recipes-devtools/python/python3-setuptools-scm_3.3.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-setuptools-scm_2.1.0.bb
rename to meta-python/recipes-devtools/python/python3-setuptools-scm_3.3.3.bb
-- 
2.20.1


