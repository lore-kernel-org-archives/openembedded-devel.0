Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0C07A65DBA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Apr 2014 22:38:50 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id b57so765392eek.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Apr 2014 15:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=YGN1w7umjxHCbk1RkR7BXXrtcu0wX8f+56AupPNCk2g=;
	b=lQQcGPoETiaRyPEnfETseL52lLsc8Qp06GutaTrdEYhMf8cVIcWLrBzl15eCKp8CUd
	wgS5efp4FD9XTUxIQq8k/qCwOVzTSDG6iZD3CuiIPJH3mLgv8fMYKDBBh1J3rhzS7aWV
	dUAG22eeE4iz0kYCpgQVJU0NkCDbnOwHcy56s69zwGlcPVEzQbxlgZiU6QnppmwxFfGB
	iQhtwh21DfNfu9ke/Si/EKyPq9IWoBqpGbMx7CTCYlxSHqGct4vJxP+HPsAZuGcOIZgA
	+QxjMncfgse7k6Ag27bRRJCu0Et6aCxTaQv8I1P2NFXI49dRPgfxqaya8LzB2s+9XJ4Q
	NZSQ==
X-Received: by 10.15.22.201 with SMTP id f49mr515149eeu.18.1398811130561;
	Tue, 29 Apr 2014 15:38:50 -0700 (PDT)
Received: from mizar.208.67.220.220 ([87.13.50.57])
	by mx.google.com with ESMTPSA id u46sm62706797eel.1.2014.04.29.15.38.49
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 Apr 2014 15:38:49 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Apr 2014 00:38:42 +0200
Message-Id: <1398811123-18572-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-handheld][PATCH] zaurus.inc: add xinput-calibrator to XSERVER
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
X-List-Received-Date: Tue, 29 Apr 2014 22:38:52 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/include/zaurus.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/include/zaurus.inc b/conf/machine/include/zaurus.inc
index 38464d6..719d28f 100644
--- a/conf/machine/include/zaurus.inc
+++ b/conf/machine/include/zaurus.inc
@@ -14,7 +14,7 @@ IMAGE_DEVICE_TABLES = ""
 
 # Zaurus gets preferred providers settings
 # from distro/include/default-providers.inc
-XSERVER = "xserver-xorg xf86-video-fbdev xf86-input-keyboard xf86-input-mouse xf86-input-evdev"
+XSERVER = "xserver-xorg xf86-video-fbdev xf86-input-keyboard xf86-input-mouse xf86-input-evdev xinput-calibrator"
 
 ########
 # kernel
-- 
1.9.1


