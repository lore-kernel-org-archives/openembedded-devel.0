Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id 7F1327FA1A
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Dec 2019 06:30:30 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id o11so4476275pjp.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Dec 2019 22:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=V/WuToOlLX/lUON9Jbg26lOAsq4LXpU+TdascMUlQjs=;
	b=dgW2J7dhCPkS2DN9qgExrMmdGehqVNyjFsF8gL4FOAcJ5qxJj/tThAHvBrpyvxq3vH
	qQiryohJZOys6r7U1Bh9IbLxXSCgmsGNHAaoiun2WKKvJym3z9ktG6UzNpcolF4GdjVT
	IfoGehX5lej+Hp8XmSkkvY9iqgmST4u166CIlxSI0z3pfSQnDWrVuWqJyZ1EmRP886Qm
	lfbnt/+c2tSWCgpOZwiq0+Mff7V3T3CL4dcjeNN7nGkXUrZRGYQhIF3DPw4Bh7XhTJt4
	I8g8cjaK8GsuXBcKEhWltjj3ez55FgT+fVyMvzJNUKOz30O/Rf6hC//KGiVPV/P1OLLG
	I+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=V/WuToOlLX/lUON9Jbg26lOAsq4LXpU+TdascMUlQjs=;
	b=j/89zuyyGljKR4nNT7/TaWK0ZI12VUlpfcYuecyb1cftJx47er7qFoaZHcz9H9fkOs
	zyUVwdlmAAOBzAZnhFoW1QUpV6d9vMFtKtHfESq2BymqWylBXxf1NDCooDIwW93eUY5W
	unu/fxJI7HoDy229gM0+Du90xHXDZVMaWbelMky6qVy05O3uUnJQb91GBzJzCi0HGAnK
	1K5XY6fdsxjPwZMDaZCyg8qvBVG9pLTgGqGftvQinBfDG/LdTUl+KDYzss98EQPB0O5E
	C7RM6l+xYk9f3EmlxXVPv5HBj2QFKTyKai+1gkaZpTz7GkhbZ9RPfhvJP0MFZcOMeSp7
	VgXg==
X-Gm-Message-State: APjAAAW5e2Nd/AdXBxNbMGOwLNmfdo6t6rtbi8M8Az2c/BrwQBwPDH3m
	s4NvQxKcWdBueHXm8zZlFKg88PPsouc=
X-Google-Smtp-Source: APXvYqwjq6hZqZOEWAelf35Q47RYBkPyx0/Gv5/jTwJBpb4RowxCURRQf8/XvqVqRSvMp6RgzUlWQg==
X-Received: by 2002:a17:902:7286:: with SMTP id
	d6mr10036268pll.59.1575786630983; 
	Sat, 07 Dec 2019 22:30:30 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::afb7])
	by smtp.gmail.com with ESMTPSA id v16sm8408309pje.1.2019.12.07.22.30.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Dec 2019 22:30:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 Dec 2019 22:30:20 -0800
Message-Id: <20191208063020.3592797-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191208063020.3592797-1-raj.khem@gmail.com>
References: <20191208063020.3592797-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2 3/3] udisks2: Update to 2.8.4
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
X-List-Received-Date: Sun, 08 Dec 2019 06:30:30 -0000
Content-Transfer-Encoding: 8bit

package tmpfiles.d/udisk2.conf, generated with systemd enabled

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Package tmpfiles.d

 meta-oe/recipes-support/udisks/udisks2_git.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/udisks/udisks2_git.bb b/meta-oe/recipes-support/udisks/udisks2_git.bb
index f0aad95384..21851666ee 100644
--- a/meta-oe/recipes-support/udisks/udisks2_git.bb
+++ b/meta-oe/recipes-support/udisks/udisks2_git.bb
@@ -20,8 +20,8 @@ SRC_URI = " \
     git://github.com/storaged-project/udisks.git;branch=master \
     file://non-gnu-libc.patch \
 "
-PV = "2.8.2"
-SRCREV = "7a787aa3b340fc7f1ca72d748635d6c5445edc58"
+PV = "2.8.4"
+SRCREV = "f333e13de8d32f2b82237ccd180c3458d71e78b8"
 S = "${WORKDIR}/git"
 
 CVE_PRODUCT = "udisks"
@@ -50,6 +50,7 @@ FILES_${PN} += " \
 
 PACKAGES =+ "${PN}-libs"
 FILES_${PN}-libs = "${libdir}/lib*${SOLIBS}"
+FILES_${PN} += "${nonarch_libdir}/tmpfiles.d"
 
 SYSTEMD_SERVICE_${PN} = "${BPN}.service"
 SYSTEMD_AUTO_ENABLE = "disable"
-- 
2.24.0


