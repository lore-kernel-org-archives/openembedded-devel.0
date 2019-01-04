Return-Path: <athoik@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 877246BDDC
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Jan 2019 17:13:49 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id p6so32464722eds.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jan 2019 09:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=j5iaol9NmIlj3xw5WBRx4m+XNzDPx5zq8iJjfAn0Ob8=;
	b=liHXxSdCRjeFe64fbEU7NmuS1VEAMB9Y/51WjLZSsZIcgY1cuMFHlC3igkPR7zKw7V
	xLC6xloxex7TLQJRX2y4b1YnbyAhbXcgkzqYE+T0UJvwL9pVCfdEtWCjC3CwfBsnhsWp
	hG0zBZiolTW6rm3PsrnlPDTS69dAu6Sn2bnWDT1jynELtOv6gxyOcP8P1TG5V0umJLl4
	RoiERF25PTpLBWDiaNfvn3P/cde1NRtjVtIJkhLQ9C262EFSU3dFZZtjMxs9vH0ze8bs
	NY84WODWxNAR5LkaMYNI4Xi4WdBUX6bjKoWJpas+BWNrjc6M2njOtZJAaVVJv4lZlV+i
	34Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=j5iaol9NmIlj3xw5WBRx4m+XNzDPx5zq8iJjfAn0Ob8=;
	b=rzQrecRJiMp1NK6P7lZ4VX9RVrx3VLXlyZ53UZQlpCW2GIVNQDGOXY9/jyEcED7o4h
	U9Q0xuFWa9/eS4CwGHNOIv4CxvkHg188auL/YbIKVLAWQpvytqpiZrO6rLMPUXrcXJ4P
	g0iRmXdf2StfHKwwzcKDWxg694c5rZJTdTIEUHwOQWs87s4pm1vslBsz9FNbNaxuYmMy
	RAbVBnom1xKHo0ORJFUpaHeXM0/BiPZ+mM0L33WR/lgNIWbJyNFg2x42cEy5AJOLJKs0
	z/4dFTJHFbo/KoGywAgFuT53Ea/EERop49XU9jRavoKb/B2OxKwTlV6TraYUEUuArz97
	Wcdw==
X-Gm-Message-State: AA+aEWZwBj5RURvC6Ak2P7Na5rMotxyZVnZ+XA/89tk5yPO8aAR6IB4n
	cTg0xkB1SQcbv9Bmy4OfdpEgRIkbjA==
X-Google-Smtp-Source: AFSGD/W0dtuSrJfwrfSMJTbGpzPZOYFebBnDoUEGxXUiy7UgIkPbBfX7Myntu1CoZafW1OkCNCFivA==
X-Received: by 2002:aa7:d7cf:: with SMTP id e15mr45143340eds.69.1546622029657; 
	Fri, 04 Jan 2019 09:13:49 -0800 (PST)
Received: from images.net (ns380618.ip-188-165-252.eu. [188.165.252.42])
	by smtp.gmail.com with ESMTPSA id
	a11sm28522543edc.28.2019.01.04.09.13.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 04 Jan 2019 09:13:48 -0800 (PST)
From: Athanasios Oikonomou <athoik@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Jan 2019 19:10:34 +0200
Message-Id: <1546621834-18222-1-git-send-email-athoik@gmail.com>
X-Mailer: git-send-email 2.1.4
Cc: Athanasios Oikonomou <athoik@gmail.com>
Subject: [meta-filesystems][PATCH v2] fuse-exfat: fix multilib build
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
X-List-Received-Date: Fri, 04 Jan 2019 17:13:50 -0000

Replace the PN with BPN to fix the multilib build.

Signed-off-by: Athanasios Oikonomou <athoik@gmail.com>
---
 meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb
index 99bf2be..ea00222 100644
--- a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb
+++ b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb
@@ -17,5 +17,5 @@ inherit autotools pkgconfig
 SRC_URI[md5sum] = "fca71e6598f79d037a3c7c969cb5710c"
 SRC_URI[sha256sum] = "f2e06eba5a21c621aac1d6da21b12a5a324fdd1e20f9c8acd357dd463c2355d9"
 
-S = "${WORKDIR}/${PN}-${PV}"
+S = "${WORKDIR}/${BPN}-${PV}"
 EXTRA_OECONF += "sbindir=${base_sbindir}"
-- 
2.1.4


