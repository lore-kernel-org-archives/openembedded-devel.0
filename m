Return-Path: <dbaryshkov@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 45E5273FF9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 19:38:32 +0000 (UTC)
Received: by wgin8 with SMTP id n8so139450290wgi.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 12:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=ty1aqAZKmlKuB+VWf29Ih0mI8IDPZcpGmIyg8ThM53k=;
	b=shJk1sVnGR8WOG/EEFbIycApzFfnghDM1fmv0OpPJtjVNGH8HFrxvHZKxTiLivCUDc
	Xvzjoc+o4C47XofmgfMOi0i+AtmRpMSddhljZZXLM1OZ8oIl8WHysQ5ei7RNewSqs0x5
	fLIqCxQ9RlX9TXpNjHAsfpqqLAmijM1xRKUBLIavvAR5/pGiCTVibpQtD0qK8R1IhU0m
	0syd8u5ufzUZEOCds5ttnTOZcMYsT9H4SJRGiQNxDN8OwKHhz16nRzGbPG7oNHvaIo28
	+BFjDJNnjfDAeADXGYnyrQLaJNK3XX2CZrPLWAGwuiiZRodltrj7CtOLlmhXRD9zBWgF
	8CuA==
X-Received: by 10.180.82.6 with SMTP id e6mr23716758wiy.84.1431373113124;
	Mon, 11 May 2015 12:38:33 -0700 (PDT)
Received: from fangorn.rup.mentorg.com (nat-min.mentorg.com. [139.181.32.34])
	by mx.google.com with ESMTPSA id
	vz8sm24253522wjc.27.2015.05.11.12.38.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 May 2015 12:38:31 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 May 2015 22:38:24 +0300
Message-Id: <1431373106-7016-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-opie][PATCH 1/3] libopie2: update DEPENDS to properly select bluez5 or bluez4
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
X-List-Received-Date: Mon, 11 May 2015 19:38:37 -0000

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 recipes-opie/libopie/libopie2.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-opie/libopie/libopie2.inc b/recipes-opie/libopie/libopie2.inc
index 955cd60..38d04aa 100644
--- a/recipes-opie/libopie/libopie2.inc
+++ b/recipes-opie/libopie/libopie2.inc
@@ -5,7 +5,8 @@ LICENSE = "LGPLv2"
 # FIXME stopgap until split archives have license files included
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/LGPL-2.0;md5=9427b8ccf5cf3df47c29110424c9641a"
 I18N_FILES = "libopiecore2.ts libopiesecurity2.ts"
-DEPENDS = "libqpe-opie libpcap sqlite3 bluez4"
+DEPENDS = "libqpe-opie libpcap sqlite3"
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES','bluez5','bluez5','bluez4',d)}"
 PROVIDES = "libopiecore2 libopiedb2 libopiemm2 libopiesecurity2 libopienet2 libopiepim2 libopieui2"
 
 INC_PR = "r17"
-- 
2.1.4


