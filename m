Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id E981A6D9FF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2013 22:21:15 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id l9so2793317eaj.28
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2013 14:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AaALbKrzQ6gQi+Uv0t0eAyjQVvgH6dDqetidvbJg6HQ=;
	b=JiFZhXDVUo8B0rdcbPi0QBddMbGcD8uBazNetwRUuf2GH37H6nNi96QvWfM99YIdPr
	JRJcVb+7JUht4AUR3CzpyYGmTS6PVlS5wuFFk9GwHYYWlL47EmmO+IX3o16BJLghifaT
	nqoV+zrx04JB586ByByeJMFH6OwEB0COr7Q0XVP6UArVuQ2rUgJjYOmCL6/VRbiy5xy1
	SJMdLn4JJRuezNJtweeRKyRX6Wx1kyoo6bKG92GhRJ063QqLFOAtnCn/UTtnnQbS8MSi
	/JfmazWHKinI/a0+DrSFcN/QK8pyZGfwJHLbWMNyvzo4iD8eqP6algPtt63w7NY68XgR
	9mQA==
X-Received: by 10.14.179.130 with SMTP id h2mr15792727eem.34.1384813277577;
	Mon, 18 Nov 2013 14:21:17 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	o47sm42040486eem.21.2013.11.18.14.21.17 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Nov 2013 14:21:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Nov 2013 23:21:12 +0100
Message-Id: <1384813274-7231-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <1384813274-7231-1-git-send-email-Martin.Jansa@gmail.com>
References: <1384813274-7231-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 4/6] zram: Drop allarch
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
X-List-Received-Date: Mon, 18 Nov 2013 22:21:17 -0000

* runtime dependencies are TUNE_PKGARCH causing do_package_write_*
  task to have different signature for MACHINEs with different
  TUNE_PKGARCH
* kernel-module-zram is even MACHINE_ARCH, but all kernel-module
  dependencies are excluded in signature handler

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/zram/zram_0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/zram/zram_0.1.bb b/meta-oe/recipes-extended/zram/zram_0.1.bb
index fbeb586..5c3425d 100644
--- a/meta-oe/recipes-extended/zram/zram_0.1.bb
+++ b/meta-oe/recipes-extended/zram/zram_0.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Linux zram compressed in-memory swap"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-inherit allarch update-rc.d systemd
+inherit update-rc.d systemd
 
 RDEPENDS_${PN} = "util-linux-swaponoff kmod kernel-module-zram"
 
-- 
1.8.4.3


