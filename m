Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7D7D17C141
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Jan 2019 12:22:42 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id v13so18176542wrw.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Jan 2019 04:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=DeesT3v6q1gtOV4vhIBoJZdoW2KeGT+UtUe27dw7GFE=;
	b=vIeq1izqioZxuXYztvG0U5jNSmWskL2QbJdFzKsONGWhwbjBbECurWG3ww2A8aVkdC
	neadp2t7tJvJVJ0AKma6koz9GSGURU1c+LtHE2+19G3uWEdK1n+o3Nub5BQndc9IV9y2
	Lp3OeSNCAHpSzaEqUlV3ABM7G7N37ikQ4yPwaGVuSaQnZC2e/faigqfO7K95T3/Oow3w
	WpRNdldiJgubUkp21TXtz1xq88TxNMWticFw4Q7nE/WsHwAgl7WWpziZGdJWAjKRaU/p
	XzUH4u0Pja7D2NAR4vtXWBqFlEOo4kd5F04ag1HJQwFOW9iD50NDw5evuJyTY9HS5Jqp
	2JRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=DeesT3v6q1gtOV4vhIBoJZdoW2KeGT+UtUe27dw7GFE=;
	b=ak8w+ZJc+a3UwujNKyxCUjUrz4puVfomeL73rKq67dY2DV/PLSK3vA65PTXnFuEG7q
	5/Jw2uk+XRVFJrs4ze+AJ+Pz/pCYvvbB8I3QYRWvtz6KjY0kKCg55R86zngSNTXzHFAc
	Eh9jkeOraMuz0bCEgVwd/mmxsaHTnTNT9/Z9LhjMo8CUk/tQji2yOTF5uKQFT9rRaPO+
	TfXRO+qDH7Tp5f8ETTgMSpmw4qxVLRMBKi86QLdFTnlYId6E+iLi8s3EFA4p1WljpeV2
	ZaeP4ff1goJhEuwoUSP051KzuQyIX8MnfjhTDRSziXdCLLswtnDVZDv6CvF4MJOs2OGj
	5HbA==
X-Gm-Message-State: AJcUukfLocuiozoDPpfFXP2wYCaaH7ju3AGWpIX0gs9Ju7EjSNNyjMtR
	nsYOOoKkwpcKoQkKLM74q0QC/Dnl
X-Google-Smtp-Source: ALg8bN4Yj1lgOD8aO8yhaeW6EgWWAOECvqBHK/RybaynGvKax9rttSNzYZPLPXfEoxtAo06W6YQ9Og==
X-Received: by 2002:adf:fc09:: with SMTP id i9mr18415675wrr.299.1547900562718; 
	Sat, 19 Jan 2019 04:22:42 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F1BE998930CD041FFEA0CD4.dip0.t-ipconnect.de.
	[2003:f0:7f1b:e998:930c:d041:ffea:cd4])
	by smtp.gmail.com with ESMTPSA id
	v6sm52697393wrd.88.2019.01.19.04.22.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 19 Jan 2019 04:22:41 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Jan 2019 13:22:31 +0100
Message-Id: <20190119122233.5388-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/3] libsigc++-2.0: upgrade 2.10.0 -> 2.10.1
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
X-List-Received-Date: Sat, 19 Jan 2019 12:22:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{libsigc++-2.0_2.10.0.bb => libsigc++-2.0_2.10.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-core/libsigc++-2.0/{libsigc++-2.0_2.10.0.bb => libsigc++-2.0_2.10.1.bb} (79%)

diff --git a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.0.bb b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.1.bb
similarity index 79%
rename from meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.0.bb
rename to meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.1.bb
index 53bd5de10..62054a116 100644
--- a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.0.bb
+++ b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.1.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 DEPENDS = "mm-common"
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libsigc++/2.10/libsigc++-${PV}.tar.xz"
-SRC_URI[md5sum] = "70bcbde2c900e4925d6ef4bf50954195"
-SRC_URI[sha256sum] = "f843d6346260bfcb4426259e314512b99e296e8ca241d771d21ac64f28298d81"
+SRC_URI[md5sum] = "549cffbdb72fa105b782756f2713ffc7"
+SRC_URI[sha256sum] = "c9a25f26178c6cbb147f9904d8c533b5a5c5111a41ac2eb781eb734eea446003"
 
 S = "${WORKDIR}/libsigc++-${PV}"
 
-- 
2.20.1


