Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDym0-0001n9-9m
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 16:27:36 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2999601bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 07:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=ajCeBrNr1AOzaRbpQi+fVp+gebWFgYt5rDPh40vWHSA=;
	b=Q4G/IgKRXoQ4oVL4CHdrDSI6/3enialhoz0OJ+nJlBZpXd0rbqi7mMD6q9WLiy4h50
	74dHZmgx4eOmkP2cwlV8dag/j26UQCcxHMP2E0BfXaGHDYT06tKlzgHzTPMWH37L1L3I
	Q0kUkpY6GDkQO+S+/rcGh9tjKMz3h2eluW/OxmAdSto4Ej73eUHeJ48bsEYVkDx8nuR9
	B3FHJbstLBX5Hb2XWhLco4DlZd2a3bDC343tVo50QE3G4vp+8u8QHffVg6S9UZGVP0gr
	pYM3XFNgUHYByvOtKMxUOA8UABBsf/oIDo4Mgo/B+e00VzYo5fFHoaS+2peWKe0crgVN
	/5WA==
Received: by 10.204.148.12 with SMTP id n12mr28519bkv.6.1347977698561;
	Tue, 18 Sep 2012 07:14:58 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id y20sm8006887bkv.11.2012.09.18.07.14.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 07:14:57 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 16:13:11 +0200
Message-Id: <1347977601-28665-31-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/-oe/-multimedia 30/40] xfce4-systemload-plugin: update to 1.1.1
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
X-List-Received-Date: Tue, 18 Sep 2012 14:27:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...n_1.1.0.bb => xfce4-systemload-plugin_1.1.1.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/systemload/{xfce4-systemload-plugin_1.1.0.bb => xfce4-systemload-plugin_1.1.1.bb} (70%)

diff --git a/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.1.0.bb b/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.1.1.bb
similarity index 70%
rename from meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.1.0.bb
rename to meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.1.1.bb
index 367599e..53f6c4a 100644
--- a/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.1.0.bb
+++ b/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.1.1.bb
@@ -7,5 +7,5 @@ inherit xfce-panel-plugin
 
 DEPENDS += "upower"
 
-SRC_URI[md5sum] = "130ad7befddd8705ca09a98e9cee5c3e"
-SRC_URI[sha256sum] = "bc4ca8a7f66acb598d3f11bf0ee1fa650b869b3483176d708905d4ce9b1889f3"
+SRC_URI[md5sum] = "22d48c0883f9d598bce24e81d93e692e"
+SRC_URI[sha256sum] = "1ac13efbe9e576c9effd5e0675574a57c8fd44cfee60d6e319eb4d03c1c8d9ae"
-- 
1.7.6.5



