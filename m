Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id D806C713B9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 17:22:51 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id w10so14436781pde.25
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 09:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=fI3b/omEk2Yf/U/KGynVimxSBQpNdCSMC1ROU/Q6adU=;
	b=ncpaJn0BXlX30AO1fhsTvX0vPm0ugjfRuKJRSohnUrpVl9SIdwkeCG6ADhGSD26uDL
	ZS/1xqFu+G8Os7XfaDsaF06VvGAo8inlAzz3TJW1WcYJ7VWyCMKXJFiUh9ebjPNifzI0
	INPpJ583DCyk/13e0fS2ZehMmFnPS6qJFm++YbS3r28zL1lVVrKpbP6MIrD48EVYpREq
	GxXjmgA51do/mTRt3FnH1SMYEXBvd7Vg/Z8vjZEe1jptENr8Bt/L0PilvesNNxR/h3wy
	Rhmj0aZJTt+D8ZS+t+gMiTV4ciwiz+Qajrp0ASzwaEcTJh0nRzyrayHYauCoLOvy5Z2i
	uf9g==
X-Received: by 10.70.88.164 with SMTP id bh4mr76364598pdb.96.1419700972076;
	Sat, 27 Dec 2014 09:22:52 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id
	fu1sm31202444pbb.91.2014.12.27.09.22.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 27 Dec 2014 09:22:50 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Sat, 27 Dec 2014 09:22:07 -0800
Message-Id: <06090d792d817261bee3ce453f73d8875e5c7fdb.1419700394.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
Subject: [PATCH 20/27] obexd: conflict with bluez5
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
X-List-Received-Date: Sat, 27 Dec 2014 17:22:51 -0000

From: Peter Bigot <pab@pabigot.com>

obexd was integrated into bluez5 and is no longer a separate package.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-connectivity/obex/obexd_0.48.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb b/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb
index 26869fe..f28f77b 100644
--- a/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb
+++ b/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb
@@ -1,5 +1,7 @@
 SUMMARY = "OBEX Server and Client"
+# obexd was integrated into bluez5
 DEPENDS = "glib-2.0 dbus bluez4 libical"
+RCONFLICTS_${PN} = "bluez5"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
-- 
1.9.1


