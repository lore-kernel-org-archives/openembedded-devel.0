Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id C3EF86BE87
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:52:08 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id e53so347257eek.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=Y8ETTrbl0cFlNBLQrvezWw2uriEWoSa8DF+HUgDzJIs=;
	b=lmXYqm+NpwoLjkJB40Tqe1cmp2gaB0lAVOwunR6iKr1kg5PHYZuFB2jsFyUNnanRog
	dGQ7TGVJl0BrjsOOcmPVtl/q98QG19N2qn6+e67SNHO+akZo3pUNxQf/Q64Md9vr7qf4
	arHyNpQRA0YHHE5yBgWI+SOxGFhfJOLnn5UoU833Y7Re1HH0qPf38PqDj3Ec04O61mPQ
	9pUqXEPA2CeZvxZAxtjjbWj4L3UIeCnkufr/A6zugQy2PAbmMNvij3XcAxwG1TDPilgK
	Zzavoz2k9XlKVABD4e3A0AWRBmfxGKzz1NJKly4fNAFK5SrNawgOYdnbWsrjiDeb1PxP
	Gx7w==
X-Received: by 10.14.89.72 with SMTP id b48mr5398618eef.43.1377791529241;
	Thu, 29 Aug 2013 08:52:09 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	p5sm47162615eeg.5.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:52:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:53 +0200
Message-Id: <8424302d860fd3961ed478faf77c69501466c9ee.1377791378.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 60/66] xfce4-places-plugin: Add PACKAGECONFIG for notify
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
X-List-Received-Date: Thu, 29 Aug 2013 15:52:09 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.5.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.5.0.bb b/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.5.0.bb
index 2e0b810..f68365c 100644
--- a/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.5.0.bb
+++ b/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.5.0.bb
@@ -7,3 +7,6 @@ inherit xfce-panel-plugin
 
 SRC_URI[md5sum] = "84c39fb123e07e1c7caaf006d9383656"
 SRC_URI[sha256sum] = "6996051669a13d4791a5a453747801dc2f7f6fa5546785622d80b34966283d44"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[notify] = "--enable-notifications,--disable-notifications,libnotify"
-- 
1.8.3.2


