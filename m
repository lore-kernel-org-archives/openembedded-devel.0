Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id ED2647190E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 22:14:46 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id em10so358048wid.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 15:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=crAmMJHNQ047zOJM0JK9CNJ7aSLARKGDxrf45cFeDxg=;
	b=ftZXdA+gi2/g3vqE++hPqgIy/Ur5GPaaNQU0woVjFZ7LHf+imRkVBYxORsKnVKnCBq
	AaWpGHGIbaHqCIe41ngMs54a/lVzmnh5EbnYB4dxdzUL0rAhheQdk8OpvoBJ6rlqoCZk
	Wom88uOpHa5SJuLKy7mLadetPrISG9/WDt31ZjlX3x+zh3aGIeeOEu2iXTRXss+YWpCs
	FgmbrnSuG+WhkbT+X/XFGjvPQAKX9qNTbxmMjkKvopGDfImg6tXML75uGcrSEdGc/9mV
	G+oYuB/PWJAb7+aMNTdTBJOHnP8SPGjO8ELC9TmEW61LFgT+gOBHOsAV2NjEI7DT7Rp9
	wGtw==
X-Received: by 10.194.79.201 with SMTP id l9mr7951822wjx.59.1413324887860;
	Tue, 14 Oct 2014 15:14:47 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-150.hsi05.unitymediagroup.de. [176.198.252.150])
	by mx.google.com with ESMTPSA id
	eg8sm17132892wib.15.2014.10.14.15.14.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Oct 2014 15:14:47 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Oct 2014 00:14:21 +0200
Message-Id: <1413324868-11856-9-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1413324868-11856-1-git-send-email-schnitzeltony@googlemail.com>
References: <1413324868-11856-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 08/15] xfce4-places-plugin: update to 1.6.0
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
X-List-Received-Date: Tue, 14 Oct 2014 22:14:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xfce4-places-plugin_1.5.0.bb => xfce4-places-plugin_1.6.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/places/{xfce4-places-plugin_1.5.0.bb => xfce4-places-plugin_1.6.0.bb} (74%)

diff --git a/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.5.0.bb b/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.6.0.bb
similarity index 74%
rename from meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.5.0.bb
rename to meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.6.0.bb
index f68365c..c76340f 100644
--- a/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.5.0.bb
+++ b/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.6.0.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b6952d9a47fc2ad0f315510e1290455f"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "84c39fb123e07e1c7caaf006d9383656"
-SRC_URI[sha256sum] = "6996051669a13d4791a5a453747801dc2f7f6fa5546785622d80b34966283d44"
+SRC_URI[md5sum] = "8f3ec883efb0775052eeea816bbd8a23"
+SRC_URI[sha256sum] = "07b044025a75f02b84e8848d6f81b0fcbb0cd9b8a4bf919cb7f0777b096b27a4"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[notify] = "--enable-notifications,--disable-notifications,libnotify"
-- 
1.8.3.1


