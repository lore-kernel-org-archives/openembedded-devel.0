Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id B524171A87
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 Nov 2016 22:07:13 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id a20so2687466wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Nov 2016 14:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=LKOhVvkvk/KEOkakREivp7QbLQLJGHAR8al2TmuvCA8=;
	b=FGFQ27jYlJsUmpszHnaSZBuXJwN4YzYibItjS2VJUl3fku9SPBjU5/5fXnNY1U9gjC
	c8H6Bj0eaxsChyR/BaRJlfMZhpADaluOIPPgQcVhRI0Fur6kqnfvyqlDggMSScD9/Shf
	YhXNUwqGS9DqvnFejs4yXXxLYfAMx37RVTsB0E8QwHEwNGZqHXFMtHv3rr4XaM6BN8W9
	W9zEPnnB4TPGAmMxT/mUixV3934xLUuw2+Rl/WEbz+u1BCMKfsgriU0BEVamS/+gYlXh
	7PtSWxFyeEKiHI4RpzvVgaOCa/BfX1wtvfW8M3HXKkTnrv29753sYU1kkn5wccEcbmvn
	ktcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=LKOhVvkvk/KEOkakREivp7QbLQLJGHAR8al2TmuvCA8=;
	b=ienifC24NiJesyY5EtgTdfsSw+fWwPYJfMLB7rPAuZuvLM/+TDs6nWwkpEb3keeihL
	WuktRgxZuWZs2uMWbQ6UwnfhYkXbTftC6WNOU3FxmIdLwiVvBKOtzzQXfiMFqJuAGuHX
	hIbkeMwdmtszcrGM68Jb5ws4isjnQBIri4KSd+ywQphdsaeGKBhKGzI/4cNrxbqWkOdh
	GVaS21hswA3KakKt55uHDWXfhpdZUWeiHAv7Rtnifg1NOLrk6ean/wazU2uFc+HSgNYD
	bRbyFvawVfKahaZEgxGQqvxOrH2HGF4Ppa8VOmaLeN+wFHP5jCcRGMglfIb9o1IaqV+r
	FIZw==
X-Gm-Message-State: ABUngve31LJIMnEK/SOXUF/gS8RbDqpAVtURRCBhoxGq4IdmSmarHLDuscKBEH4Typ1lNw==
X-Received: by 10.194.243.104 with SMTP id wx8mr2929086wjc.229.1478470034627; 
	Sun, 06 Nov 2016 14:07:14 -0800 (PST)
Received: from localhost.localdomain (p4FDF1D71.dip0.t-ipconnect.de.
	[79.223.29.113]) by smtp.googlemail.com with ESMTPSA id
	k2sm16044363wjv.11.2016.11.06.14.07.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 06 Nov 2016 14:07:14 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Nov 2016 23:06:43 +0100
Message-Id: <1478470013-27247-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1478470013-27247-1-git-send-email-schnitzeltony@googlemail.com>
References: <1478470013-27247-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 05/15] xfce4-fsguard-plugin: update to 1.1.0
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
X-List-Received-Date: Sun, 06 Nov 2016 22:07:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

license has changed from GPLv2 to GPLv3

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...fce4-fsguard-plugin_1.0.2.bb => xfce4-fsguard-plugin_1.1.0.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-xfce/recipes-panel-plugins/fsguard/{xfce4-fsguard-plugin_1.0.2.bb => xfce4-fsguard-plugin_1.1.0.bb} (53%)

diff --git a/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.0.2.bb b/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.0.bb
similarity index 53%
rename from meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.0.2.bb
rename to meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.0.bb
index 0f9199d..8b924ac 100644
--- a/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.0.2.bb
+++ b/meta-xfce/recipes-panel-plugins/fsguard/xfce4-fsguard-plugin_1.1.0.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "The FSGuard panel plugin checks free space on a chosen mount point frequently and displays a message when a limit is reached"
 HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-fsguard-plugin?&#recet_releases"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "db7741d1827e428b005e94d25e2ec00a"
-SRC_URI[sha256sum] = "a2c8d59386ae3d23cf6bdd06a1cdd7a1b9473cf6f38ae106600b194c601040ae"
+SRC_URI[md5sum] = "c9fcc1ff37f38e6ed518eca3b9887aa8"
+SRC_URI[sha256sum] = "6b038322b49d29625219e6a54497085b8f834b9c1fd15282ce286a6529d7c445"
-- 
2.5.5


