Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f42.google.com (mail-pg0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id EBA9677EA1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 20:41:57 +0000 (UTC)
Received: by mail-pg0-f42.google.com with SMTP id 72so27024334pge.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 13:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IjVs9gkx3Ii7dahcvuMpa5PIokVyW9v8e4mSQedtjY8=;
	b=p0sU38TATAZJcj6CJETGznk6rmB9NR3iTi2OB8uFtpetjQcx+52fzMWcAIGlM/dVEN
	IabnfrA5O0GYHum1ahMPaamqtfuMByKoxj0fuS5NsOSzE4N50In8WdmZY0bHuG+RghwY
	6sn1qcJj0nB34XK9msj+UH8icSk9Syrp2dijjAVwRQQRtR+zfSRgpH8Q6iolhWl1RBNo
	kcowuFJLF5QH1h4WOWKF02nYqr+zG7eQtaN9lHvK202t3qXZ0sVo0NGMi6l87O9NWVvO
	jppgxerJKPlFMsanSQvA7CPGindxTm2aoeHTWZTDs1bX8ka4k2oKtEcFHFg0rVbVGMCB
	v87Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=IjVs9gkx3Ii7dahcvuMpa5PIokVyW9v8e4mSQedtjY8=;
	b=kPDE3LMXPkBC2dtc9ayB6IJAkvsieDzFBZ1DSYUDCwdj8soC3fd4m8wTGb0FAlxWYo
	QPRUXF2f5v6vAyWBt16WPY0UjA91QEGg3gYNS8IYgt9YFFCDx736YPcWUR1L/T5qf6hy
	F8YEXdaxElIsESeoS1s80iHmxMTAgN5tUAbXUBJYBbOwutfQJB7BY5JQD2oFEgplTvKU
	Y2NS24bWBMGLhJjPWqmJct+yAJeJvQQt5f3ZpNSGpjlT1buHWbGbAuXhmnkWBoqz24g7
	kavf8nlPjc2qbx5mcYZ+JAbMetpYecVFzp/CikQrDFJ4F61tw9cKl9qEpmfJx8O9ezVm
	XGiA==
X-Gm-Message-State: AN3rC/59erdVIGc3nkSTE0tAXG1uaPNQP5hF/da24TZJDSNAlNxFwefq
	O7JjEU5XU6JfTw==
X-Received: by 10.84.174.131 with SMTP id r3mr5445578plb.136.1492116119161;
	Thu, 13 Apr 2017 13:41:59 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u29sm44033332pfa.123.2017.04.13.13.41.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Apr 2017 13:41:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Apr 2017 13:41:04 -0700
Message-Id: <20170413204106.30679-27-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170413204106.30679-1-raj.khem@gmail.com>
References: <20170413204106.30679-1-raj.khem@gmail.com>
Subject: [meta-oe][ 27/29] dstat: Add missing dep on xmlto-native
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
X-List-Received-Date: Thu, 13 Apr 2017 20:41:58 -0000

Fixes
| make[1]: xmlto: Command not found
| make[1]: *** [dstat.1] Error 127

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/dstat/dstat_0.7.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/dstat/dstat_0.7.3.bb b/meta-oe/recipes-support/dstat/dstat_0.7.3.bb
index 1673b910a..18af738fa 100644
--- a/meta-oe/recipes-support/dstat/dstat_0.7.3.bb
+++ b/meta-oe/recipes-support/dstat/dstat_0.7.3.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://dag.wiee.rs/home-made/dstat"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-DEPENDS += "asciidoc-native"
+DEPENDS += "asciidoc-native xmlto-native"
 
 SRC_URI = "git://github.com/dagwieers/dstat.git"
 
-- 
2.12.2


