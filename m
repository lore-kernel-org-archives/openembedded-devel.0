Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f47.google.com (unknown [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id AB1D86A499
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 May 2014 23:10:40 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id c13so2483449eek.20
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 May 2014 16:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MLz83jrGSbozNC+mwexaEjMl16ToFKBT/7Sov6UMkAk=;
	b=RJF9Qg0KD1hSjFwmTfwwWcCKK4JVa2cjJU/2OPZmDGyOoZaSNeP2/i0dLVcQS0q2VW
	StbivT1Cs2E+lOCWRgYMJ+E3q0XDKIlQ8l7pDFZGms8pvT8tVSfd617/tvy8lQt1TGvd
	sRmE908rPb1LMH8+vFy1C7zxOslCBGC9cRkvdDtD9JIscik8zmLagWMOJ2SNSE8G4h45
	Ab7FCCD2QPhMwvPXe2sNT+wpfhoTSNgQSZXH8oBRUMOpFcdtDOAPKEpcmzIfyivVe9D7
	mmdWkZ0OTevWuFuLGtUQRWpts3LPiNzyz1IoTlOzU6fK0pWEzJjFtz3fGgakZ963zcE+
	SOxg==
X-Received: by 10.15.21.200 with SMTP id d48mr34201567eeu.25.1400367771661;
	Sat, 17 May 2014 16:02:51 -0700 (PDT)
Received: from mizar.208.67.220.220
	(host88-90-dynamic.180-80-r.retail.telecomitalia.it. [80.180.90.88])
	by mx.google.com with ESMTPSA id
	o49sm11571687eep.33.2014.05.17.16.02.50 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 17 May 2014 16:02:51 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 May 2014 01:02:32 +0200
Message-Id: <1400367752-27224-3-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1400367752-27224-1-git-send-email-andrea.adami@gmail.com>
References: <1400367752-27224-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 3/3] gcw0: initial commit of formfactor machconfig
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
X-List-Received-Date: Sat, 17 May 2014 23:10:42 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-bsp/formfactor/files/gcw0/machconfig | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100755 recipes-bsp/formfactor/files/gcw0/machconfig

diff --git a/recipes-bsp/formfactor/files/gcw0/machconfig b/recipes-bsp/formfactor/files/gcw0/machconfig
new file mode 100755
index 0000000..ca253bf
--- /dev/null
+++ b/recipes-bsp/formfactor/files/gcw0/machconfig
@@ -0,0 +1,15 @@
+HAVE_TOUCHSCREEN=0
+HAVE_KEYBOARD=0
+HAVE_KEYBOARD_PORTRAIT=0
+HAVE_KEYBOARD_LANDSCAPE=0
+
+DISPLAY_CAN_ROTATE=0
+DISPLAY_ORIENTATION=0
+DISPLAY_WIDTH_PIXELS=240
+DISPLAY_WIDTH_MM=53
+DISPLAY_HEIGHT_PIXELS=320
+DISPLAY_HEIGHT_MM=71
+DISPLAY_BPP=16
+# Real DISPLAY_DPI=114
+DISPLAY_DPI=100
+DISPLAY_SUBPIXEL_ORDER=rgb
-- 
1.9.1


