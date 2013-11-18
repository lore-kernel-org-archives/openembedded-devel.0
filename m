Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 1CEEF6DB60
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2013 22:21:17 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id t10so1591481eei.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2013 14:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nCAjkwGah0vO/7kwwe8NSIKCFtdvLJ6Edy9a4S9JBrw=;
	b=CS9m+Cb5V6fU9kESCQkRqoNWHVkO15FxnTk2kZdfDx0M0AOLan/QZOqX7gC3PVpUvo
	fWiXA5HF/Pm6rgnj0OkP+5VTMBXhNk3xshzlhWBZqX9SVFFa3EV1HWnLZbI8ZdSdTHzB
	1sUphv3xjHj7Tca1meZ/rN8hTFX3mtrShCLdCcqjQ2o7wndgkKlT212fiLwrWcGc4Vy0
	vLan3EudHF2oWxsD/oA1f72hsc7k4HH/FGrXTiNvFfTnauaCtptvHr39D6thkNZ85JzP
	QypFBY4MoqDAIeHdSwKVdExU3AtSWsm4fAuX1i6HzbTWgj4YbpFu/ZSHVJuHA2DpVRww
	OnaQ==
X-Received: by 10.15.110.75 with SMTP id cg51mr15537319eeb.42.1384813279455;
	Mon, 18 Nov 2013 14:21:19 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id a6sm42073675eei.10.2013.11.18.14.21.18
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Nov 2013 14:21:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Nov 2013 23:21:14 +0100
Message-Id: <1384813274-7231-6-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <1384813274-7231-1-git-send-email-Martin.Jansa@gmail.com>
References: <1384813274-7231-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 6/6] usb-modeswitch-data: Drop allarch
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
X-List-Received-Date: Mon, 18 Nov 2013 22:21:18 -0000

* has runtime dependency on TUNE_PKGARCH usb-modeswitch
  Hash for dependent task usb-modeswitch_1.2.5.bb.do_packagedata changed from 5709ee415d286847b58e7b438b5b9f75 to fbef5eee3bb2bacb805a0bead2095b52

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20130807.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20130807.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20130807.bb
index fc0fbfb..8b71618 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20130807.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20130807.bb
@@ -2,8 +2,6 @@ DESCRIPTION = "Data files for usbmodeswitch"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-inherit allarch
-
 SRC_URI = "http://www.draisberghof.de/usb_modeswitch/usb-modeswitch-data-${PV}.tar.bz2"
 SRC_URI[md5sum] = "91feff51deba6e48e78506b8f4db2274"
 SRC_URI[sha256sum] = "a3114e2c1f38eed3ad0067df30e53a96313908a9539a8ea5d94a4d35651699eb"
-- 
1.8.4.3


