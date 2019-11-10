Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4F0D86BA11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Nov 2019 00:36:29 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id n13so7713419pff.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Nov 2019 16:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=G9JQGp0cu4jB8QiC8m6+gXPzjaqkzfGJWPV9mxEGdxA=;
	b=LqmConr2y56RwubaufmrTngJa3bPMI7i/F3I8YL5PrYPJM/80CcB8/WNEpY4etQRvM
	tp16DrLER8BdklEU0WN4UuYSHEpO25a4gPqsUiSjjNQ7tPnRiIgVAFv+7YDiq9gYVWqb
	auY/65a53osTqGwXuwILno/fk6NJnQlwswuUT0U0wP4aH+Ixgy+kvXfo5j5NwL4J2WCG
	ArIz8vtcLVSd0Hb5JyoSIT16vohJX7Z9UAeqFUmfydW2XCSsHyKAPCoLTM6r3xRv0T6q
	hDTKfcwVEmSmrWxqznu60M4thAuJw/P8OuWDk1KT5No2sCF93wUFpzQVNZsEAMqD7S43
	7hLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=G9JQGp0cu4jB8QiC8m6+gXPzjaqkzfGJWPV9mxEGdxA=;
	b=Z+F81gzqfXV2XXfzKboXl21/P31VQoj7rfuu6v+rBMcpn6IqNPhRA9eyHYVaa2UrMN
	08TJI2ypqAXT9EMxOUDP8+cwqOp7U29TVdHi/3+gG6yXLDCAXEdU8TZW3OmrWII0nNac
	UgCHYMp2bcVzm76SVrvXOXPv/8NxzT+6+Tl5AJpBiLQxYFE4ZJdE6tjE0Qek1fNHGyAu
	DoW0SfD/mrazIc5A3T3DN0109rx4SMHlewcPd993cfdcUMu44df3er4s1RBUEjhnoWHE
	ELiM1qjPM6mYhQ3iJOJr+fWrdYRX9H5+sPz9iU6z0zZbF+fJm6mQ30fpC+NTQMNzIC/g
	qQ3w==
X-Gm-Message-State: APjAAAXa2ro1yoFuMmIVnw7aFfnMLMDuRkHf1UdWScyeoh/TzTWlltuV
	JJTCYf2NHO2QEFOBfJSPwn97jOTx2gM=
X-Google-Smtp-Source: APXvYqyr+vTE1t3seVaAL4WPOseQVFMFEoY/ovHyxmLZjdQoirDJYx6FON+D9O2G9j96JefNoezUJQ==
X-Received: by 2002:a17:90b:300c:: with SMTP id
	hg12mr24897247pjb.75.1573346189591; 
	Sat, 09 Nov 2019 16:36:29 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::a99e])
	by smtp.gmail.com with ESMTPSA id z5sm9663463pgi.19.2019.11.09.16.36.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 09 Nov 2019 16:36:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Nov 2019 16:36:16 -0800
Message-Id: <20191110003616.1710474-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] syslog-ng: Do not install non-existing systemd file
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
X-List-Received-Date: Sun, 10 Nov 2019 00:36:29 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
index 4c22d4b0f0..3aba4473dc 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -92,7 +92,6 @@ do_install_append() {
 
         install -d ${D}${systemd_unitdir}/system/
         install -m 0644 ${S}/contrib/systemd/${BPN}@.service ${D}${systemd_unitdir}/system/${BPN}@.service
-        install -m 0644 ${S}/${BPN}.service ${D}${systemd_unitdir}/system/${BPN}.service
         install -m 0644 ${S}/contrib/systemd/${BPN}@default ${D}${sysconfdir}/default/${BPN}@default
 
         sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/${BPN}@.service ${D}${sysconfdir}/default/${BPN}@default
-- 
2.24.0


