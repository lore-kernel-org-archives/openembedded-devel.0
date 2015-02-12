Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8D75C733B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 21:22:32 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id em10so7665638wid.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 13:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=4EpOSoF9zrRc++l6Abwx3idBLOFWJe+bm/uibCoRbrg=;
	b=CqpKwLrW8hsf/oxNvItLk2haBpYXGQ6ULFN7xy7+ciFmyLrwUjSPYoOu1HtharnsGA
	Tb9nxqrvP0UU4RhyLl8IBOCTLAJ5w/VoD7LblnYRUNYNEK2jyTMSrEw0kmETr4mneM8z
	IeT3Ms8TT66ADwb6NnJe3NZsYiwHxhDYsM+LYkkhfve5bMbbmic4gYOAiOkypnVCiaJH
	AWQBUcd9uoLVdzuhHTSCI/uP8L3TuOGy77JoJgwY6xfWS2kcsmnoaRXsuhorWdbrhr+l
	roLtYzeXvz9d8+7Fom2hLOY6z2dqKLZFqby848Lq9du+LK8Gqj9EpuaZUhw5yA1OFS7V
	qZGg==
X-Received: by 10.180.90.37 with SMTP id bt5mr9978399wib.29.1423776153204;
	Thu, 12 Feb 2015 13:22:33 -0800 (PST)
Received: from localhost.localdomain (p5B0A0430.dip0.t-ipconnect.de.
	[91.10.4.48])
	by mx.google.com with ESMTPSA id fm10sm4136024wib.7.2015.02.12.13.22.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 13:22:32 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Feb 2015 22:21:54 +0100
Message-Id: <1423776119-14981-15-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1423776119-14981-1-git-send-email-schnitzeltony@googlemail.com>
References: <1423776119-14981-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 14/19] xfce4-systemload-plugin: update to 1.1.2
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
X-List-Received-Date: Thu, 12 Feb 2015 21:22:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...e4-systemload-plugin_1.1.1.bb => xfce4-systemload-plugin_1.1.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/systemload/{xfce4-systemload-plugin_1.1.1.bb => xfce4-systemload-plugin_1.1.2.bb} (70%)

diff --git a/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.1.1.bb b/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.1.2.bb
similarity index 70%
rename from meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.1.1.bb
rename to meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.1.2.bb
index 53f6c4a..c212f88 100644
--- a/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.1.1.bb
+++ b/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.1.2.bb
@@ -7,5 +7,5 @@ inherit xfce-panel-plugin
 
 DEPENDS += "upower"
 
-SRC_URI[md5sum] = "22d48c0883f9d598bce24e81d93e692e"
-SRC_URI[sha256sum] = "1ac13efbe9e576c9effd5e0675574a57c8fd44cfee60d6e319eb4d03c1c8d9ae"
+SRC_URI[md5sum] = "68c9d20b352c13f3eb6b39a0d9fe2ba2"
+SRC_URI[sha256sum] = "b469b6b3a08ec29b9061151950d876d36bf25a3106ec77256923fdd6b5d18a7c"
-- 
1.9.3


