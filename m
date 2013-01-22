Received: from mail-we0-f176.google.com ([74.125.82.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Txd5l-0002z6-0a
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jan 2013 13:37:00 +0100
Received: by mail-we0-f176.google.com with SMTP id s43so593690wey.35
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jan 2013 04:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=FBQnc3PtE3FZFQ/GCESHGnRLcgwaPmK204ZbD0eFoCs=;
	b=RxQENwdRn30bnHboTVzM7F5rkOfnQBqEYYEzQfaoPtq22ckpWoz/2T1rqWIXDNnHVM
	RtI0ALClJFWnEKtx5/W9hWTdjPjKy1HdnO5ET7q8KAmPu18fz6LrVbdSNqw4HoB5cDFl
	am2hN01O/zCYOudywWqBs+wR9VBlQvXAVatH8CHTcDUx6M7xZ5BuCEXYCCA3uDmV84cb
	x4TKPrlJhGJ8nrX3H4hAVMSnwwYtA2qfzAzLzUO01d+k2MyZGhiGr88UAUp/evRfr4Y3
	+hPwo/zFR+RWEzWhPTo3qmzmxp2Rp+ym+isND3weArHCl1ie4jjhAImj7ypBzst++nuB
	aAHQ==
X-Received: by 10.180.20.109 with SMTP id m13mr20970733wie.16.1358857261083;
	Tue, 22 Jan 2013 04:21:01 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id w5sm21298750wif.11.2013.01.22.04.21.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 22 Jan 2013 04:21:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Jan 2013 13:20:58 +0100
Message-Id: <1358857259-11444-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.1
In-Reply-To: <1358857259-11444-1-git-send-email-Martin.Jansa@gmail.com>
References: <1358857259-11444-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe][meta-networking][meta-xfce 3/4] xfce-icon-theme: fix QA warnings
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Jan 2013 12:37:36 -0000

* xfce4-icon-theme-4.4.3: xfce4-icon-theme: Files/directories were installed but not shipped
  /usr/share/xfce4
  /usr/share/xfce4/mime
  /usr/share/xfce4/mime/Rodent.mime.xml

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-xfce/recipes-art/xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-xfce/recipes-art/xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb b/meta-xfce/recipes-art/xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb
index bc6229a..37f88af 100644
--- a/meta-xfce/recipes-art/xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb
+++ b/meta-xfce/recipes-art/xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb
@@ -9,6 +9,4 @@ SRC_URI = "http://archive.xfce.org/src/art/${PN}/${@'${PV}'[0:3]}/${PN}-${PV}.ta
 SRC_URI[md5sum] = "73ce2977b84f634a6a6c5d9c27e336db"
 SRC_URI[sha256sum] = "d4786692d56b8a563f66a5f260f1f13ade11e86c78cbcb25a9f9a5fc47cf66fa"
 
-#FILES_${PN} += "${datadir}/xfce4"
-
-
+FILES_${PN} += "${datadir}/xfce4/mime"
-- 
1.8.1.1



