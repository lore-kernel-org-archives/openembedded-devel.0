Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35058F36C24
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 06:28:06 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14183.1776666484571843127
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Apr 2026 23:28:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JF2uhTi0;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4891f625344so2897865e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Apr 2026 23:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776666483; x=1777271283; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nxHNoKGDGoAJzZsg6Ja25bgw2mMuAw+KN4DdlDMtrUw=;
        b=JF2uhTi0rCdgeyaxYbog7ifgZrkVhya/IO0EHwAmAANQqhECZ+6GX7IcB+PPtpjkMl
         pI6QWEZIY4wZw51Z9obthGbv1iRlAe9fMI69H3eIwyj6yr1As167abWXSKQwvTNMhJUU
         dOJJqz73dWqzBR/C2F02ExZIjmiWpwcZpMhkpYGTLYZsqoEG7GIBiqMU7Ks4ykUo1tEd
         xCtFK0q6z7WIucYlBGT/o/k9V6k3AKMhLNV9XyNS0RdbGRzIymFSlpVvHGAqlUf63eeI
         7xL33g+j9CYn8wrvmwoOE/MgERZMBh3NsT/3vEobQ3ttsvDUhBvE3QOT9JHUM3Vd1IYm
         eBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776666483; x=1777271283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nxHNoKGDGoAJzZsg6Ja25bgw2mMuAw+KN4DdlDMtrUw=;
        b=hEiEEvHapWc1BhGTAkOfIOB4ouE98jPlWkpSLty1x8BoVlnRVRJCxnX4qFu4d5lSzi
         CSTx4yDmGnCJztQFXeIw1CtM7gFpRQ/+KqJs6M2fBjTACQEtWpxVcZDIpFi/zdtWCypz
         MJyHzAITe67QPYWLIQBgZwaMPcumJlR/snUGGZfKYgddR8UPGqVPajMKdrhbXog9JxuO
         g6PErXCbebJC39hrPY1k8mSZFUsDsxwMVjcLhwDBXmzeuKrxMYl2BB6W3QyLzWoiFJlo
         gpHnVCK7K9I16ip2lmL+XXriel+JBnAUVrUAejJy/jc8BOxybQRpW9uzitq63CqL0Ps3
         H52A==
X-Gm-Message-State: AOJu0Ywi9H2ewpGCq2dw/gBHxum1SLBz/rUI9StmmO8oFoQFgT5GZU2e
	WT4PYlNsVolX2Qq8ch670O3d7eKh26L+FwIVP54ECTVZ3ZXnm3o12JRRmHhWHw==
X-Gm-Gg: AeBDieu5u8i1d6Dx6ctjeaWP33m9c6gMqnzsUv/yu3ePDIlDMwLC4zRvqnEm4Dm+0UL
	3sKGevRQ9RbNYPNDA3Ku2DwJHsBPBls/n2/I3vIx0f/blkvz/spM6XcwA0m8eo3tUfMXV6kIJN0
	eHyqHWGJU/zDH7FpmvteXSpd6A7WVZWJM66XXAviE31fUuQENDhjt9fhaenTg+LGbGSb/LYQLgI
	ljHbXRAb3UTjHeV8njtafbmx0BSR4LB0WHLjCagJAOi+c2lg5dBTWZx8vjJglxrFu9OOLMsD6IK
	ZCM6PMO8iA7tVdDbg0tZ1NjAatTYTIkeKmHjQ7ASZ5a4qWpBJ+2YptTmEzVcdLfcexz889HmbCz
	IF+nLqPFInxf4/ROc264O1czJ/EDS/An692LhFLXuk0tK0aVxigy55oJaj7/M/UkSFquLpYBkLI
	hnh33iiDHnNtTusLOxHnmHRahOpVd6j6ikz+2gQgLoHg==
X-Received: by 2002:a05:600c:870e:b0:488:aa33:dc8f with SMTP id 5b1f17b1804b1-488fb84ffb8mr168560425e9.0.1776666482851;
        Sun, 19 Apr 2026 23:28:02 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc17f642sm238296665e9.5.2026.04.19.23.28.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 23:28:02 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 16/17] libgphoto2: patch CVE-2026-40341
Date: Mon, 20 Apr 2026 08:27:48 +0200
Message-ID: <20260420062750.3795917-16-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420062750.3795917-1-skandigraun@gmail.com>
References: <20260420062750.3795917-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 06:28:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126480

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-40341

Backport the patch referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../gphoto2/libgphoto2/CVE-2026-40341.patch   | 69 +++++++++++++++++++
 .../gphoto2/libgphoto2_2.5.33.bb              |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40341.patch

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40341.patch b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40341.patch
new file mode 100644
index 0000000000..b71792c185
--- /dev/null
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40341.patch
@@ -0,0 +1,69 @@
+From 3674dbeafa5157a264ca5e562ffdbef159a2185f Mon Sep 17 00:00:00 2001
+From: Marcus Meissner <marcus@jet.franken.de>
+Date: Wed, 8 Apr 2026 15:28:52 +0200
+Subject: [PATCH] Fixed OOB read in ptp_unpack_EOS_FocusInfoEx
+
+Do not read out values before checking there is sufficient size
+
+CVE-2026-40341
+
+CVE: CVE-2026-40341
+Upstream-Status: Backport [https://github.com/gphoto/libgphoto2/commit/c385b34af260595dfbb5f9329526be5158985987]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ camlibs/ptp2/ptp-pack.c | 34 +++++++++++++++++++++++++---------
+ 1 file changed, 25 insertions(+), 9 deletions(-)
+
+diff --git a/camlibs/ptp2/ptp-pack.c b/camlibs/ptp2/ptp-pack.c
+index 9eba06f..11428ab 100644
+--- a/camlibs/ptp2/ptp-pack.c
++++ b/camlibs/ptp2/ptp-pack.c
+@@ -1629,23 +1629,39 @@ ptp_pack_EOS_ImageFormat (PTPParams* params, unsigned char* data, uint16_t value
+ static inline char*
+ ptp_unpack_EOS_FocusInfoEx (PTPParams* params, const unsigned char** data, uint32_t datasize)
+ {
+-	uint32_t size 			= dtoh32a( *data );
+-	uint32_t halfsize		= dtoh16a( (*data) + 4);
+-	uint32_t version		= dtoh16a( (*data) + 6);
+-	uint32_t focus_points_in_struct	= dtoh16a( (*data) + 8);
+-	uint32_t focus_points_in_use	= dtoh16a( (*data) + 10);
+-	uint32_t sizeX			= dtoh16a( (*data) + 12);
+-	uint32_t sizeY			= dtoh16a( (*data) + 14);
+-	uint32_t size2X			= dtoh16a( (*data) + 16);
+-	uint32_t size2Y			= dtoh16a( (*data) + 18);
++	uint32_t size;
++	uint32_t halfsize;
++	uint32_t version;
++	uint32_t focus_points_in_struct;
++	uint32_t focus_points_in_use;
++	uint32_t sizeX;
++	uint32_t sizeY;
++	uint32_t size2X;
++	uint32_t size2Y;
+ 	uint32_t i;
+ 	uint32_t maxlen;
+ 	char	*str, *p;
+ 
++	if (datasize<4) {
++		ptp_error(params, "FocusInfoEx has invalid size (%d)", datasize);
++		return strdup("bad size 0");
++	}
++
++	size 			= dtoh32a( *data );
+ 	if ((size > datasize) || (size < 20)) {
+ 		ptp_error(params, "FocusInfoEx has invalid size (%d) vs datasize (%d)", size, datasize);
+ 		return strdup("bad size 1");
+ 	}
++
++	halfsize		= dtoh16a( (*data) + 4);
++	version			= dtoh16a( (*data) + 6);
++	focus_points_in_struct	= dtoh16a( (*data) + 8);
++	focus_points_in_use	= dtoh16a( (*data) + 10);
++	sizeX			= dtoh16a( (*data) + 12);
++	sizeY			= dtoh16a( (*data) + 14);
++	size2X			= dtoh16a( (*data) + 16);
++	size2Y			= dtoh16a( (*data) + 18);
++
+ 	/* If data is zero-filled, then it is just a placeholder, so nothing
+ 	   useful, but also not an error */
+ 	if (!focus_points_in_struct || !focus_points_in_use) {
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
index c82e76a06e..04c4786f84 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
@@ -20,6 +20,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/${BP}.tar.xz;name=libgphoto2 \
            file://CVE-2026-40338.patch \
            file://CVE-2026-40339.patch \
            file://CVE-2026-40340.patch \
+           file://CVE-2026-40341.patch \
            "
 SRC_URI[libgphoto2.sha256sum] = "28825f767a85544cb58f6e15028f8e53a5bb37a62148b3f1708b524781c3bef2"
 

