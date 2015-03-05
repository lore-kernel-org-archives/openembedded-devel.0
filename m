Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id C563E7388F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2015 16:10:17 +0000 (UTC)
Received: by wghl18 with SMTP id l18so188940wgh.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2015 08:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=OFs0d+iEL/pGbtELsZaNcXX3WE9POEamam8g9w3VAeA=;
	b=jJHDOqQ9iosFKl0KGkjDxKuX/ZqiV4pI7L28LCoJAzPGKmLnLQ3eR5Ira1vRsf1Ku0
	WK5Lcff7gO/+/GMWKrCMau3Qk94lYnBpX8oz+tlfmMSyKya5KIbH7Db1Rg58jZO+xG1P
	L9VT++VpguCQZSRMz0pgp+WnOZC6o7/eG4EvcbehKzpBVlUdJvZhGi4n7qnWM6uJUPU1
	drcKy8JL7kvgsNqFa9nnatqEseBhm/ns1uTTNEY+QV61ZSwEBacSQKNTFXgeetePgPu3
	uk6rm/9lG1ofThpH+WT2iaDtiNHA48mKOJ5Zn9tiR+HRUPxgxsbyA1817ubxC2IwcWyY
	HRvw==
X-Received: by 10.180.90.176 with SMTP id bx16mr67188835wib.14.1425571818170; 
	Thu, 05 Mar 2015 08:10:18 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	17sm11110844wjt.45.2015.03.05.08.10.17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Mar 2015 08:10:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Mar 2015 17:10:20 +0100
Message-Id: <1425571820-25879-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.1
Subject: [meta-oe][PATCH] start-stop-daemon: blacklist
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Mar 2015 16:10:18 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb
index c232474..c8d88b7 100644
--- a/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb
+++ b/meta-oe/recipes-support/start-stop-daemon/start-stop-daemon_1.16.0.2.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://utils/start-stop-daemon.c;md5=a963623e4588f70122865aa
 DEPENDS = "ncurses"
 RCONFLICS_${PN} = "dpkg" 
 
+PNBLACKLIST[start-stop-daemon] ?= "BROKEN: fails because of gettext, partial fix is available here http://patchwork.openembedded.org/patch/89867/"
+
 SRC_URI = "http://sources.openembedded.org/dpkg_${PV}.tar.bz2"
 SRC_URI[md5sum] = "d211a84f38987771a49ad1c0f144334a"
 SRC_URI[sha256sum] = "2a3d4ba83c743b3f004533fdd52372cb7b22f5c1da2042d0a31bbcc2b54c0ea5"
-- 
2.3.1


