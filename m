Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 65E4E605D2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 12:36:26 +0000 (UTC)
Received: by wibdq8 with SMTP id dq8so74555464wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 05:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=MFTB/9TjRNWy81D549gZXd/WalnkVMQcOBscHmOCiqY=;
	b=wpDZ0NSQqLjdMiw3wXqwZ9owmt6cGk184RjXQfIz+iGDUFrq3EZlTQFH3l9fC436gS
	vPjtqYnr2hvnek1wYT2nFTemOSYhdHM7FvCHcXN143niBM4AI6tYEzFzNAk4tWjseV0r
	5HhiIRdPcSKDEgDJj4MuNZBvHD1PiQZoT0vtnrs8bSR1Jgpd0trpxBARzyhqbqKlPa6V
	QvXNbeSRoBmomOq+6rTT4ZlZfXcgN3ln7TuktfxFRi8+7eYfKNjsoeDHZlTkBq5OUP0+
	EdvO0ljMU3Hig+QtkWhqCBYXC+bL+dMcusBKTdeFhYsyIb0Mfcs3JAtKof7TRMeBRt4x
	nkmA==
X-Received: by 10.180.90.11 with SMTP id bs11mr5542618wib.52.1435235787213;
	Thu, 25 Jun 2015 05:36:27 -0700 (PDT)
Received: from localhost.localdomain
	(ip-95-222-156-55.hsi15.unitymediagroup.de. [95.222.156.55])
	by mx.google.com with ESMTPSA id
	pg1sm45655780wjb.39.2015.06.25.05.36.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Jun 2015 05:36:25 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Jun 2015 14:35:48 +0200
Message-Id: <1435235754-7339-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1435235754-7339-1-git-send-email-schnitzeltony@googlemail.com>
References: <1435235754-7339-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 1/7] libndp: initial add 1.5
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
X-List-Received-Date: Thu, 25 Jun 2015 12:36:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

it is required for later networkmanager

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-connectivity/libndp/libndp_1.5.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libndp/libndp_1.5.bb

diff --git a/meta-oe/recipes-connectivity/libndp/libndp_1.5.bb b/meta-oe/recipes-connectivity/libndp/libndp_1.5.bb
new file mode 100644
index 0000000..8f1d1ff
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libndp/libndp_1.5.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Library for IPv6 Neighbor Discovery Protocol"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+SRC_URI = "http://libndp.org/files/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "beb82e8d75d8382d1b7c0bb0f68be429"
+SRC_URI[sha256sum] = "faf116ab70ce9514ec4e8573556025debea08f606e7f38b616de1f26e120c795"
+
+inherit autotools
-- 
1.9.3


