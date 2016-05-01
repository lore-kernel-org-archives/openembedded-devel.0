Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 39E2D731D1
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 May 2016 23:18:05 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r12so14896505wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 May 2016 16:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=EmbNLYbW7+j2NGveHRl0G/VFXCrcRxiN6tnkSXGggu0=;
	b=0QXb3H1KqjsdKj/DZF5kSSmhz3K5N7eOupwJqwIl6pQ/K8OYsDk62QmVl18HvtQK0C
	l8EblCDmam8MOISfPPP8tw/p4DebP+3VxC/wJmH82AF+F5Sx5Q97QXRMWAJO0swc9Lus
	6rm7m8u9XhQaaFCWBxFb60FC/p7fuH43aXSAQzhfQJB/CL10vyZIgn+/M8L1icZskCau
	X1Iq6xrGQzV8IPhlqGpOa2I/6OtgN2W+vXue+lZk9J/es9mGgvuRJAp/2Mp2l/VUTr0v
	KSo8o0GhHzcge45fxKWt8ss/VyZcD9+ZEwZ+KspESoxaZs0p35PvwsdD3tIRVLXkmG2O
	Xk8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=EmbNLYbW7+j2NGveHRl0G/VFXCrcRxiN6tnkSXGggu0=;
	b=DRUfN5Gup5XEh4WaITkfxCrdKEdBZ4AX9EKawbvivTUJ+oPLqVcLbpbBkqauKg9Nr/
	TrIonw6iIFCq3iCZ5TOnpKh5WEam/w4IBBqu5rKtK49FdktKSfLzZ4Rnx91V/HfQmO32
	dTwowoCxo506AStehZa3ig1V3Bc18zExlWkSN/eaJfc0bGeMtBG8PQpHQ5pLfXXEabLo
	veY5dhF4BOq/Sr3xwZC8WBJsN5ZyjcpayYAvklrC3PgVPFL0xLwNOUOOZA/CfQzUhs/v
	v0CQXwVwyfEPicCbxHdMgvSDFbKy1yY90g7M4Bn3f/NfNmEz5kWCdMGy98UTRX+pnBAX
	4VFw==
X-Gm-Message-State: AOPr4FVDc6LSIshMFd2X3D3w8V/5OXMCf70E8Klt49vz9hPZUl9ejE6I4/W9XYGQ5xQ+Mg==
X-Received: by 10.194.115.230 with SMTP id jr6mr1073493wjb.125.1462144686360; 
	Sun, 01 May 2016 16:18:06 -0700 (PDT)
Received: from localhost.localdomain (p5B0A03E5.dip0.t-ipconnect.de.
	[91.10.3.229]) by smtp.googlemail.com with ESMTPSA id
	e16sm15572258wmc.3.2016.05.01.16.18.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 01 May 2016 16:18:05 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 May 2016 01:17:47 +0200
Message-Id: <1462144669-18427-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1462144669-18427-1-git-send-email-schnitzeltony@googlemail.com>
References: <1462144669-18427-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] fluidsynth: set correct portaudio packageconfig dependency
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
X-List-Received-Date: Sun, 01 May 2016 23:18:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb
index 66f0201..54e8697 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb
@@ -16,7 +16,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulsea
 PACKAGECONFIG[sndfile] = "--enable-libsndfile-support,--disable-libsndfile-support,libsndfile1"
 PACKAGECONFIG[jack] = "--enable-jack-support,--disable-jack-support,jack"
 PACKAGECONFIG[pulseaudio] = "--enable-pulse-support,--disable-pulse-support,pulseaudio"
-PACKAGECONFIG[portaudio] = "--enable-portaudio-support,--disable-portaudio-support,portaudio"
+PACKAGECONFIG[portaudio] = "--enable-portaudio-support,--disable-portaudio-support,portaudio-v19"
 
 do_configure_prepend () {
     rm -f ${S}/m4/*
-- 
2.5.5


