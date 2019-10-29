Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id E686E7FA14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 18:35:08 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id g24so3707561wmh.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 11:35:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dN0ZSKnMHPXurDqr8I1B6L0dseTWXO+klkspolo4dRc=;
	b=STD4LKlGFerlgXH1U3fqVLddKG0P4iPAtNzBtgUSx07c/LirP5Wsb3gSm06Ls7DdPl
	MR2aZwyfNREZPUz3D+RFDAPBHlv0b20IOpEnq1iDfssyWJS8n2V4Oo2/pMFUYF8d5bL7
	u6d9233t4xtkatnW+7QtMKWhLrtZPDnn8ZgZcfgpgx8s+tnkfTWue2lkoNf+uBjTuM5d
	CV13FY0c6y3EhJn0+SYrpZPHV/mEwYSaf+E7PuHBkFZi4iAYMpkXnWuZP5zy9Us9W7HA
	j/S3SHx3mwxJVUzblHV9wYahxGk9xUxvzjmZtR4toVS89cluiNSpfO7boPQfYlyyrXmr
	+mKQ==
X-Gm-Message-State: APjAAAUKcqeuaPY1nLQ0ppJRV8g2i/10aOjKLBLqsKZpQ/u6//EUNaef
	dOuutiQPf1kq+6mShjm6g7zun5wv
X-Google-Smtp-Source: APXvYqzXbeQWL8NCnI5leW3bIUfEOiBsdF0/VQV0odkyoirraOnKxE/EKCDyKrjpdkkA2VR41n6TUw==
X-Received: by 2002:a1c:a751:: with SMTP id q78mr5704576wme.129.1572374109448; 
	Tue, 29 Oct 2019 11:35:09 -0700 (PDT)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	q14sm19470655wre.27.2019.10.29.11.35.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 29 Oct 2019 11:35:08 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Oct 2019 18:35:07 +0000
Message-Id: <20191029183508.29985-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] libuv: update to 1.33.1
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
X-List-Received-Date: Tue, 29 Oct 2019 18:35:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: André Draszik <git@andred.net>
---
 .../libuv/{libuv_1.32.0.bb => libuv_1.33.1.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libuv/{libuv_1.32.0.bb => libuv_1.33.1.bb} (90%)

diff --git a/meta-oe/recipes-connectivity/libuv/libuv_1.32.0.bb b/meta-oe/recipes-connectivity/libuv/libuv_1.33.1.bb
similarity index 90%
rename from meta-oe/recipes-connectivity/libuv/libuv_1.32.0.bb
rename to meta-oe/recipes-connectivity/libuv/libuv_1.33.1.bb
index c7fa3c10f..604568e62 100644
--- a/meta-oe/recipes-connectivity/libuv/libuv_1.32.0.bb
+++ b/meta-oe/recipes-connectivity/libuv/libuv_1.33.1.bb
@@ -4,7 +4,7 @@ BUGTRACKER = "https://github.com/libuv/libuv/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a68902a430e32200263d182d44924d47"
 
-SRCREV = "697bea87b3a0b0e9b4e5ff86b39d1dedb70ee46d"
+SRCREV = "07ad32138f4d2285ba2226b5e20462b27b091a59"
 SRC_URI = "git://github.com/libuv/libuv;branch=v1.x"
 
 S = "${WORKDIR}/git"
-- 
2.23.0.rc1


