Return-Path: <nick83ola@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 1E1707D251
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Jun 2019 17:14:26 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id x17so2229871wrl.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Jun 2019 10:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SshZERwgzhtHPmvEzSI0bNfO+4tJogZrVzHHCeDIazM=;
	b=ZqNdigxk+hfYhSy7iaW1hKZz7VcTYmVEQLue3HrPX7vfQc5ytOgZpWI8PnGdY24jtB
	9QAPIJ9ttkLQ3Jd3hTN2PCYRJck+dfdm2yO4707WnWI5TvLbTK9avHNZg6H/iaGnllMV
	xdjZ/TrLxGfZVXQSeAMZXB7+0WmyJl7K3IS1nmEP+dSThDfSReb3QaqEgtII3Hc4XMz9
	zRgVmFj5kg0ukSoAJ9P1i5mEX+OBz6XHeAGXPHYqVDqQBKhXjJGmalKantbABMG28CUj
	KsZiA2b0P9k9zMNEAQg5GyReXSDbPSu7D7jtqeext47Br1M1O44A6f49prRrtd+y80G3
	ApIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SshZERwgzhtHPmvEzSI0bNfO+4tJogZrVzHHCeDIazM=;
	b=DSTqHpOrkcJG9f3SXW6gFd6Mc9o0lkG0dblu+fiU3Rbzh7RuwsQ+vxZzDuZK0WDcqY
	dyIJFpJYpKn4aZVpPSRHFaKrwuNGRdH+ojs5m1p61/AvfWdVhKIhcEc0N2ct/k5kFQt0
	0uiyGsVDTaMWHDm6IvmVID1YkmNzlBULw+XtnRCkUs/n2XWp/qZFPNgqc0IGFArLKBiX
	D9wM0kE58voihxoxC5v+KQraZoIAV/doyjHWuCROUzzoK397RWN+8+61+Wmjac9cBrNC
	iHUPJrpYk22nLlO0tfEHtR+4bdPkoW/ibeM6TOmxfR94yRXdKFWdymj+jH/1tpZ8vneS
	l2DQ==
X-Gm-Message-State: APjAAAUGTFuhvLwuSI7d9+MwdOzBUMS02kvLepbQLaIAhlPqS8HEenG5
	RqRINvDRo5NeamzdtVIIrTSXW9J1
X-Google-Smtp-Source: APXvYqwuG1M85MT0q/vz9aovtknLRNuq5NvRHJyR0dqaC3qIUX/BVOPkKf9nhOrkRV6hbZj/HiiWCw==
X-Received: by 2002:adf:ea44:: with SMTP id j4mr11368218wrn.123.1559754866366; 
	Wed, 05 Jun 2019 10:14:26 -0700 (PDT)
Received: from nick-beastie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id z5sm8443341wmf.48.2019.06.05.10.14.24
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 05 Jun 2019 10:14:24 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Jun 2019 18:12:34 +0100
Message-Id: <20190605171233.15670-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libp11: 0.4.7 -> 0.4.10
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
X-List-Received-Date: Wed, 05 Jun 2019 17:14:26 -0000
Content-Transfer-Encoding: 8bit

Upgrade libp11 from 0.4.7 to 0.4.10.

also remove the following line (not needed anymore):

  rm -rf ${D}${libdir}/*.la

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 .../libp11/{libp11_0.4.7.bb => libp11_0.4.10.bb}               | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-support/libp11/{libp11_0.4.7.bb => libp11_0.4.10.bb} (88%)

diff --git a/meta-oe/recipes-support/libp11/libp11_0.4.7.bb b/meta-oe/recipes-support/libp11/libp11_0.4.10.bb
similarity index 88%
rename from meta-oe/recipes-support/libp11/libp11_0.4.7.bb
rename to meta-oe/recipes-support/libp11/libp11_0.4.10.bb
index 87d99c1a68..2db3310ce9 100644
--- a/meta-oe/recipes-support/libp11/libp11_0.4.7.bb
+++ b/meta-oe/recipes-support/libp11/libp11_0.4.10.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fad9b3332be894bab9bc501572864b29"
 DEPENDS = "libtool openssl"
 
 SRC_URI = "git://github.com/OpenSC/libp11.git"
-SRCREV = "64569a391897bd29c5060b19fa4613e619e59277"
+SRCREV = "973d31f3f58d5549ddd8b1f822ce8f72186f9d68"
 
 S = "${WORKDIR}/git"
 
@@ -18,7 +18,6 @@ inherit autotools pkgconfig
 EXTRA_OECONF = "--disable-static"
 
 do_install_append () {
-    rm -rf ${D}${libdir}/*.la
     rm -rf ${D}${docdir}/${BPN}
 }
 
-- 
2.20.1


