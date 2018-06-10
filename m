Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id A30106007A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 15:08:58 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id r15-v6so10493323wmc.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 08:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ljxkXDfzsUg46uofNuTv6m8K6cBmaOqgJzD04vWD+gg=;
	b=sDmn+vxau2Nq6HBIswK7vpb7zSx83HcqTxMbpTf4JYdTwMB+JtizJCIhuTCRjFgHip
	wqi2mc7gHnei8lcw95N49tYWdMqoXvdfNHOITsfb6RPpa0PXrxxN7krOgAds9ivyZX14
	9v2Kj96sEvHteJon/bruKYQ2tVFKDW+zPEoum/MNTqzw7f2PRo64YCvx+7kGBdfXX5uK
	Y4WBbJ37CY647xvPc2TuX6Ac+FLJsvEA4ax2ODc0Nr9iv4D7FUUzcr/POXE1/uM+tOlh
	Ggow/3MB3Ja4dHfIKFZMosn2sOoof84ZgvdTG3MZ14wZCm7npFxH4Q0aiWeltnfFhLeY
	s4Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ljxkXDfzsUg46uofNuTv6m8K6cBmaOqgJzD04vWD+gg=;
	b=WnYy5xVdZqsEiv612Q0iRB9hP67eEoPfUbxPE1x3EYceIFx9Gbc8gPpZPnCCrZp2QJ
	I6QWw9rnw57sZUKvJDdvFEqYHR0z2E7G4LCZxz9bY6U/O+JP0+KpkLdcJqrRXQz83zsD
	MbKi1hYfswon10VNA6uMKiBA4NqAEw8bTIxSFpYI+yMfmazeKm/rZ5F/6CSf4G8Z3Kbw
	zEojAlB3ji7rSwlebR/RXZlav5SckLT78pptXvqVK0raomfauAuocQhkJl5CKv7Hoseo
	Q327y/SLB+F4w6rBsg3toTFDyZaRHeKhRjTfNpTWuecmrZCn5RLHsZDX28oyjJYG/SWd
	r3TQ==
X-Gm-Message-State: APt69E1n5/hrf0UN+SH4dYh3IdLS4GyUAnvS8kx8MiCw7QsT9BGPb/mq
	ak6Hc+VYaJbCKKQnWMrWA0E0VA==
X-Google-Smtp-Source: ADUXVKLzSRz930Q54qa45KIriBpeOJb+x2FCEHnWDEx6GiHSkrZhmIfpDq31nBfOj/gvlhrzNKRI8Q==
X-Received: by 2002:a1c:dc41:: with SMTP id
	t62-v6mr6317944wmg.42.1528643339046; 
	Sun, 10 Jun 2018 08:08:59 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07BC13F69C25723999916AF42.dip0.t-ipconnect.de.
	[2003:f0:7bc1:3f69:c257:2399:9916:af42])
	by smtp.gmail.com with ESMTPSA id
	z16-v6sm43360230wro.41.2018.06.10.08.08.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Jun 2018 08:08:58 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2018 17:08:18 +0200
Message-Id: <20180610150821.9536-17-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180610150821.9536-1-schnitzeltony@gmail.com>
References: <20180610150821.9536-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 16/19] xfce4-cpufreq-plugin: upgrade 1.1.3 -> 1.2.0
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
X-List-Received-Date: Sun, 10 Jun 2018 15:08:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-cpufreq-plugin_1.1.3.bb => xfce4-cpufreq-plugin_1.2.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/cpufreq/{xfce4-cpufreq-plugin_1.1.3.bb => xfce4-cpufreq-plugin_1.2.0.bb} (64%)

diff --git a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.1.3.bb b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.0.bb
similarity index 64%
rename from meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.1.3.bb
rename to meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.0.bb
index d45478709..e8ce6b09d 100644
--- a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.1.3.bb
+++ b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.0.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1f6f1c0be32491a0c8d2915607a28f36"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "859122da0a8cd991ee2fbeee434bc948"
-SRC_URI[sha256sum] = "74a162c7e101db0495d5da147aba1f404c33544f04e8c34d7d1d705668102d33"
+SRC_URI[md5sum] = "152c4c5d9fd926081753d289c18a04c3"
+SRC_URI[sha256sum] = "fec60f14ab02b7079798809c11a79b4930abaeb0e4217068a336cb63cb47970a"
-- 
2.14.3


