Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id B681E71A8D
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 Nov 2016 22:07:16 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id u144so13496778wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Nov 2016 14:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=VGI99aLBhXNV3Z1Ad7NWs/kQ11RGEujPLPIVLMkX5gw=;
	b=W3ILuxEYtFWXYtH9QRHYP5+nGzTSQ1GvnuWlBM+T757q5myxHp9PRPRidTM+4DRVMU
	tT0YpXkJvYFazCZS04U3Gt6bpDHc+0Goafj99P87EeDtQiM3no2FA3E9p0jFiiom/8qX
	ZMRPbC0mUn5DlpGPMCnH8fibNEB121Q3yJwHqlrHJW7g5PMIuEm2lGqY0k+mLT9iOb36
	Ygp+aOf6CZgDtsKGk3zMgE82LisLEzVg1gwOAdTikzVoFSwLQ0ijY4op6JbJKOOpF0lU
	bO3B8ifxxqUMaRl1KS380AlAE2WvY4Z7rgMlSmA67AzqedgT9YuW927wJZQUxMwlTfP8
	nCUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VGI99aLBhXNV3Z1Ad7NWs/kQ11RGEujPLPIVLMkX5gw=;
	b=F7lnMxTCT98z4c0PTJmEBp2ymyiA7St8BLRfHxlQumceRFK1Ci0HfbGSF+k46ZPsMK
	k9E2O/c14yMeC6PnH+HPKF1BlouM+xM++D19zs49NTYnkR6VzKIVoiYyvO/knMcXOdWd
	GeSUYDwg0YoR3g4GZPg7TPQRs1NpVhBSrnng67yXIwiD0ltoT3uBODGRUjBq0J3iyUMh
	e3Rovk0/SFK1ZsYieIqqNhJSWmjV1VLyoPkO040hY8FnglBAu+2a0XnzJvlUf2tZxLo8
	DI88pTnQtRNJBJyhSboUR5Xh7pvWNi4WOFsOpB4pNP/g6v0MOZQ+KsAfzV67/zN9G4UM
	3vTg==
X-Gm-Message-State: ABUngvddE89TnvXve4v4YmXIEe7Ai092GN8mKsUUUnLI1A8A6GV8F4HCgcorN7BoBHsNoQ==
X-Received: by 10.28.131.72 with SMTP id f69mr3756965wmd.33.1478470037819;
	Sun, 06 Nov 2016 14:07:17 -0800 (PST)
Received: from localhost.localdomain (p4FDF1D71.dip0.t-ipconnect.de.
	[79.223.29.113]) by smtp.googlemail.com with ESMTPSA id
	k2sm16044363wjv.11.2016.11.06.14.07.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 06 Nov 2016 14:07:17 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Nov 2016 23:06:47 +0100
Message-Id: <1478470013-27247-9-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1478470013-27247-1-git-send-email-schnitzeltony@googlemail.com>
References: <1478470013-27247-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 09/15] xfce4-systemload-plugin: update to 1.2.0
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
X-List-Received-Date: Sun, 06 Nov 2016 22:07:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...e4-systemload-plugin_1.1.2.bb => xfce4-systemload-plugin_1.2.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/systemload/{xfce4-systemload-plugin_1.1.2.bb => xfce4-systemload-plugin_1.2.0.bb} (70%)

diff --git a/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.1.2.bb b/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.2.0.bb
similarity index 70%
rename from meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.1.2.bb
rename to meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.2.0.bb
index c212f88..1da87d2 100644
--- a/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.1.2.bb
+++ b/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.2.0.bb
@@ -7,5 +7,5 @@ inherit xfce-panel-plugin
 
 DEPENDS += "upower"
 
-SRC_URI[md5sum] = "68c9d20b352c13f3eb6b39a0d9fe2ba2"
-SRC_URI[sha256sum] = "b469b6b3a08ec29b9061151950d876d36bf25a3106ec77256923fdd6b5d18a7c"
+SRC_URI[md5sum] = "f2c7e77c8ef7d654c0b429d2e109d4a0"
+SRC_URI[sha256sum] = "4081d2c5ebda1c80d0eed48ae247a483ed4b15c8cb094fe009cb2304dda50cad"
-- 
2.5.5


