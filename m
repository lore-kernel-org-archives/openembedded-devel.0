Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9F60F7822B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Mar 2018 00:42:10 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id z81so173813wmb.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Mar 2018 16:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Q1h9IJ+JoVdUCJksnKPbgAUNhc7M8a2vw8Sb8MwdXFs=;
	b=TOTWIEB8Htx7uL3OIQs+QrlOoCZQfeZAoQF/LS3ffbM0UNon2T6YcpV3zj6F0ZJeCC
	MBX4svFFScEPD6M+L6IanDKh1iwSOTGpR9FWlIx/OJAYFhHPmHWSkw84EkNaeXwGIShP
	6VTNMSIXdyHtEXFU9qtgsmsuPufQgzSlUwCQ6jGncdiobMttdDAMNVCJmrvkEB6GxtJU
	YFT+rLIwz3MqbDbgg1XnYEN6jBSAIaosjBYcM2gTwlHCbcpuYsPoScfJ3KXPxliHztXt
	xj9928XYBnRbdgtBMZIcJ/u9ZdJASxn8Pfy+IW7xcOotI05BvdmBaEW+FHp3Gioihozp
	kHyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Q1h9IJ+JoVdUCJksnKPbgAUNhc7M8a2vw8Sb8MwdXFs=;
	b=bc5RVb79S4O7tcYWRzYpgDFMpnEmMBTKol5BMpk0v/t9FS8BFPMALcqtkhEZAti0Ex
	xbDiWo5MIUai9XkT4jiClCDTVhc3fXhO1z5mWduGnWkmX8UhXmgBCOEGPZ5YZVR2J+CK
	QsWhwcpGX0KS/U14hS18sG4zoajxOv9VfMe0SdsoL/ojF2DmsR4IiAuBh5zoOKyz8LqG
	7bcgr7umoHHL5IEu6vOECFG/KlBPbu7SBzOFvki7ksfHgiAXo1DbGgajzBeKLdA2QIkk
	8F0mgW0MzIbzZkl3K6G7XJRgdoH8q1COHRdF1YUZCb35GP0+A3maJcZ4Tgfu7x5vsrlu
	SJcA==
X-Gm-Message-State: AElRT7G6sTxUAqBYFIbgyuRkgXAAk60Uq5ZontHrf+spPzRca8vAzyng
	61165ajWNDvfOZeMh8hmm2/PtQ==
X-Google-Smtp-Source: AG47ELuJO62NBWNZ5TFGI+YgflPAyAtIL3sKex4josr+/NNdQoY5PTdjColKAwsO0HGdDns7B1q1yg==
X-Received: by 10.28.175.139 with SMTP id y133mr84670wme.98.1519951331144;
	Thu, 01 Mar 2018 16:42:11 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	i44sm3902662wri.23.2018.03.01.16.42.09
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Mar 2018 16:42:10 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Mar 2018 00:42:08 +0000
Message-Id: <20180302004208.1841-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180224105155.14511-1-Martin.Jansa@gmail.com>
References: <20180224105155.14511-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCHv3] vboxguestdrivers: upgrade to 5.2.8
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
X-List-Received-Date: Fri, 02 Mar 2018 00:42:11 -0000

* 5.1.26 doesn't build with 4.15 kernel

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../linux-4.15.0-rc8-VBoxGuestAdditions-amd64.diff | 90 ----------------------
 ...tdrivers_5.2.6.bb => vboxguestdrivers_5.2.8.bb} |  7 +-
 2 files changed, 2 insertions(+), 95 deletions(-)
 delete mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/linux-4.15.0-rc8-VBoxGuestAdditions-amd64.diff
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_5.2.6.bb => vboxguestdrivers_5.2.8.bb} (91%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/linux-4.15.0-rc8-VBoxGuestAdditions-amd64.diff b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/linux-4.15.0-rc8-VBoxGuestAdditions-amd64.diff
deleted file mode 100644
index 23a9021f04..0000000000
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/linux-4.15.0-rc8-VBoxGuestAdditions-amd64.diff
+++ /dev/null
@@ -1,90 +0,0 @@
-Based on:
-https://raw.githubusercontent.com/mjmaravillo/misc/master/linux-4.15.0-rc8-VBoxGuestAdditions-amd64.diff
-
-Upstream-Status: Pending (hopefully new vbox will be released soon with proper 4.15 support, this patch isn't backwards compatible)
-
---- vbox_module.orig/vboxvideo/vbox_mode.c	2018-02-18 16:42:47.000000000 +0000
-+++ vbox_module/vboxvideo/vbox_mode.c	2018-02-18 16:55:14.466029313 +0000
-@@ -396,7 +396,7 @@
- 
- 	/* pick the encoder ids */
- 	if (enc_id)
--		return drm_encoder_find(connector->dev, enc_id);
-+		return drm_encoder_find(connector->dev, NULL, enc_id);
- 
- 	return NULL;
- }
---- vbox_module.orig/vboxguest/VBoxGuest-linux.c	2018-02-18 16:42:28.000000000 +0000
-+++ vbox_module/vboxguest/VBoxGuest-linux.c	2018-02-18 16:54:36.793049118 +0000
-@@ -1058,7 +1058,7 @@
- #if LINUX_VERSION_CODE >= KERNEL_VERSION(2, 6, 0)
- 
- /** log and dbg_log parameter setter. */
--static int vgdrvLinuxParamLogGrpSet(const char *pszValue, struct kernel_param *pParam)
-+static int vgdrvLinuxParamLogGrpSet(const char *pszValue, const struct kernel_param *pParam)
- {
-     if (g_fLoggerCreated)
-     {
-@@ -1073,7 +1073,7 @@
- }
- 
- /** log and dbg_log parameter getter. */
--static int vgdrvLinuxParamLogGrpGet(char *pszBuf, struct kernel_param *pParam)
-+static int vgdrvLinuxParamLogGrpGet(char *pszBuf, const struct kernel_param *pParam)
- {
-     PRTLOGGER pLogger = pParam->name[0] == 'd' ? RTLogDefaultInstance() : RTLogRelGetDefaultInstance();
-     *pszBuf = '\0';
-@@ -1084,7 +1084,7 @@
- 
- 
- /** log and dbg_log_flags parameter setter. */
--static int vgdrvLinuxParamLogFlagsSet(const char *pszValue, struct kernel_param *pParam)
-+static int vgdrvLinuxParamLogFlagsSet(const char *pszValue, const struct kernel_param *pParam)
- {
-     if (g_fLoggerCreated)
-     {
-@@ -1098,7 +1098,7 @@
- }
- 
- /** log and dbg_log_flags parameter getter. */
--static int vgdrvLinuxParamLogFlagsGet(char *pszBuf, struct kernel_param *pParam)
-+static int vgdrvLinuxParamLogFlagsGet(char *pszBuf, const struct kernel_param *pParam)
- {
-     PRTLOGGER pLogger = pParam->name[0] == 'd' ? RTLogDefaultInstance() : RTLogRelGetDefaultInstance();
-     *pszBuf = '\0';
-@@ -1109,7 +1109,7 @@
- 
- 
- /** log and dbg_log_dest parameter setter. */
--static int vgdrvLinuxParamLogDstSet(const char *pszValue, struct kernel_param *pParam)
-+static int vgdrvLinuxParamLogDstSet(const char *pszValue, const struct kernel_param *pParam)
- {
-     if (g_fLoggerCreated)
-     {
-@@ -1123,7 +1123,7 @@
- }
- 
- /** log and dbg_log_dest parameter getter. */
--static int vgdrvLinuxParamLogDstGet(char *pszBuf, struct kernel_param *pParam)
-+static int vgdrvLinuxParamLogDstGet(char *pszBuf, const struct kernel_param *pParam)
- {
-     PRTLOGGER pLogger = pParam->name[0] == 'd' ? RTLogDefaultInstance() : RTLogRelGetDefaultInstance();
-     *pszBuf = '\0';
-@@ -1134,7 +1134,7 @@
- 
- 
- /** r3_log_to_host parameter setter. */
--static int vgdrvLinuxParamR3LogToHostSet(const char *pszValue, struct kernel_param *pParam)
-+static int vgdrvLinuxParamR3LogToHostSet(const char *pszValue, const struct kernel_param *pParam)
- {
-     if (    pszValue == NULL
-         || *pszValue == '\0'
-@@ -1152,7 +1152,7 @@
- }
- 
- /** r3_log_to_host parameter getter. */
--static int vgdrvLinuxParamR3LogToHostGet(char *pszBuf, struct kernel_param *pParam)
-+static int vgdrvLinuxParamR3LogToHostGet(char *pszBuf, const struct kernel_param *pParam)
- {
-     strcpy(pszBuf, g_DevExt.fLoggingEnabled ? "enabled" : "disabled");
-     return strlen(pszBuf);
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.6.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.8.bb
similarity index 91%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.6.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.8.bb
index c018b789f2..e00db4d7e0 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.6.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.8.bb
@@ -15,11 +15,8 @@ SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2
     file://Makefile.utils \
 "
 
-# For default linux-yocto 4.15
-SRC_URI += "file://linux-4.15.0-rc8-VBoxGuestAdditions-amd64.diff"
-
-SRC_URI[md5sum] = "4490d6929dfae41cdf05e34f583318c8"
-SRC_URI[sha256sum] = "fe705288ee50efcce10ff4c80e461a1c7091e461a7b55f98842fa1c9772ca4e7"
+SRC_URI[md5sum] = "e731ea9c5c31096ec4c2a3bfba26665c"
+SRC_URI[sha256sum] = "ee2759d47b0b4ac81b8b671c9485c87fb2db12c097b3e7e69b94c1291a8084e8"
 
 S = "${WORKDIR}/vbox_module"
 
-- 
2.15.1


