Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2444F6FEA7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 10:00:17 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id cc10so2538742wib.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 03:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MxanRSO1xwOXfzsSLgLsGL2Vvco08cqAqkKK2lsgIvw=;
	b=o90a89eFNuNIcHL6Gs2IV81qj1j+66ATtaPfkIRsPydCPZDVkf/7Z08yfm1syvttnV
	cNovJxqLZhSN+xCcI2Gjh/x+GF2fmpHO5aZSeJo1ywc9jSnvYmc7+O0U76aobqGv1YyS
	iitctUBsKLzc57nuSrTKae74kqgCdFCJDOKPy2h5/2S8r9rIdvH9l46QBVNJ6r2dples
	3vEjaWJjPQIw1FfFLEdE3lWHIlg3waIZpqFU7d25K9TLWWrsiDQf32mh/g/k5mPP2r+1
	6mDAc1x22Ghobdw3d95cCYWr0IwU3YiI2FMzd9wLY82lXButW6sQs5gVK9s7ulsjqp6B
	fp6Q==
X-Received: by 10.194.189.81 with SMTP id gg17mr3725482wjc.107.1403172018502; 
	Thu, 19 Jun 2014 03:00:18 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	i8sm31871892wiw.22.2014.06.19.03.00.17 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jun 2014 03:00:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jun 2014 11:59:48 +0200
Message-Id: <1403171993-26208-20-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
References: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 20/25] zenity: Blacklist because of broken with B!=S
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
X-List-Received-Date: Thu, 19 Jun 2014 10:00:19 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb b/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb
index fb15900..3ea179e 100644
--- a/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb
@@ -4,6 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
 PR = "r2"
 
+PNBLACKLIST[zenity] = "BROKEN: doesn't build with B!=S"
+
 DEPENDS = "gtk+ glib-2.0 libnotify gnome-doc-utils"
 
 inherit gnomebase
-- 
2.0.0


