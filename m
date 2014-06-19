Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id C41276FEA7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 10:00:02 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id u56so2044093wes.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 03:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XqS7jfKkwxcerOlfK+lGVZn3IApGYmYoCcnwnEfvYSU=;
	b=rl7lxym+WoKUA/N8mk7SE6MqT8zxj3P6PgPRnMYkV56JpPN10oa6WPSkUXSqBrvYxC
	/w1XDnRKNh3JxjH0KaJ9UxNzhtkoDYIalXfi351Ujwstgn0z/KcdBkfjHpGBjd9Aky/l
	K/bno3UxK04frF4jDznTcXjeVB6WAh7J4y3iGSXmqKXK76RR2saGZylHRxa76VY85KSE
	UFIP8sXd/TGE9DKV9bkiIKQDlDowFtwnzYpeQbbWV4Q6P+Sw2p69IDZax6zxx64kc7P9
	6jmEsxVjhPy75CdN/VhzyZyvzQUBvTNZdZKCeqjKSFPVKHaPd1GthET4lYb0lLP6Cgu5
	XO6g==
X-Received: by 10.194.184.116 with SMTP id et20mr3952158wjc.80.1403172003135; 
	Thu, 19 Jun 2014 03:00:03 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	wi9sm7468782wjc.23.2014.06.19.03.00.02 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jun 2014 03:00:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jun 2014 11:59:36 +0200
Message-Id: <1403171993-26208-8-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
References: <1403171993-26208-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 08/25] libwmf: Blacklist because freetype-config was removed
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
X-List-Received-Date: Thu, 19 Jun 2014 10:00:05 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb b/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
index 53ef81a..9f88ded 100644
--- a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
+++ b/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 PR = "r3"
 
+PNBLACKLIST[libwmf] = "BROKEN: needs to be updated to use freetype2 pkg-config instead of freetype-config"
+
 DEPENDS_virtclass-native = "libpng-native jpeg-native"
 DEPENDS = "libpng jpeg expat gtk+"
 
-- 
2.0.0


