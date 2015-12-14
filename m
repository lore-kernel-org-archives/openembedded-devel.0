Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 2FF5B6FF84
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 18:33:27 +0000 (UTC)
Received: by wmnn186 with SMTP id n186so133386337wmn.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 10:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=04ZSYyAS2dPBr0qGTw7k/8yrZ8rdgHjyuXW/hoHwPO0=;
	b=Ge5Vc71rd6srZAlZr2Mit0nPUW32c9RiXfI4hgK2WNMO7pSJbAgxco0zRBiNHVCLlp
	jh9x1ED1wtgcTXk++2L6nxL1mopbp+MjdqCfJ35Tqk5pBkI6vUPE0X5Pdxk3txdQ8bvw
	7TLJjp5ri8yjm/G63B1veqnlBu606tcpq8bieyrWbRXKolpVo41LX4A/ERREnn+L0vYd
	9PP7ZF81yFqDZIuHVHJHFx4hf2cJSqF4qA0/nHZHOubHMEaNdUKFYdNdXJgBAt74c5Ne
	qbMisFv37UBIjLhnv1yN9ypIzZPRxzo7LYgjx09PEd7tYeh6fOW7q0SI0fVJhrPhf+nO
	tVPA==
X-Received: by 10.28.210.74 with SMTP id j71mr24973574wmg.96.1450118008065;
	Mon, 14 Dec 2015 10:33:28 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	u17sm17405038wmd.8.2015.12.14.10.33.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Dec 2015 10:33:27 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Dec 2015 19:35:26 +0100
Message-Id: <1450118126-19721-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH][meta-oe] lcdproc5: add dependency on lirc
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
X-List-Received-Date: Mon, 14 Dec 2015 18:33:28 -0000

* it's autodetected from sysroot:
  ERROR: lcdproc: lcdd-driver-lirc package isn't created when building with minimal dependencies?

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/lcdproc/lcdproc5.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/lcdproc/lcdproc5.inc b/meta-oe/recipes-extended/lcdproc/lcdproc5.inc
index d7e333a..680f558 100644
--- a/meta-oe/recipes-extended/lcdproc/lcdproc5.inc
+++ b/meta-oe/recipes-extended/lcdproc/lcdproc5.inc
@@ -4,7 +4,7 @@ SUMMARY = "Drivers for character-based LCD displays"
 HOMEPAGE = "http://lcdproc.org"
 SECTION = "utils"
 LICENSE = "GPLv2+"
-DEPENDS = "ncurses"
+DEPENDS = "ncurses lirc"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760 \
                     file://README;beginline=60;md5=637e042cdd3671ba00e78b58ede45d3b"
-- 
2.6.4


