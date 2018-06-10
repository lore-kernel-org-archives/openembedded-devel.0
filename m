Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8084974BE2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 15:08:57 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id o13-v6so10475362wmf.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 08:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=0OwMOYawl/x7bJ06CcE3OIACywZ/sFMRpfGnUvn25L0=;
	b=UMzkRKgFBoG4pe/KP1U1GJBQvY4fChVTgFYvR4iJw8/Jqxl8ztBtI8NS97Q30jlKY1
	6uc9LmjWRRa7im9bIkIGTopGNx+G8d1NsZ/YSVBL3jpv6gz+BlKIvQrye5epzg4T8Npv
	aGoTPLJggNVgb+Itl2eWPOy/2cTouo0cDMk1vmy+BKMsE1wit7JZE/gBrLhfxNa3f3KI
	zL1lBgBTjrO5ej2vwwqdXmMdNt8Gjg7KXWbf8w9RMmF9EEDismKQyrHNDfgG59TkQpkH
	BQ2v2YFmefm0N3aHkhyWDToYDSYfpUJ9UIz1aVeY0wBAICSpWMg5detyYoRF3CpLvtzk
	CDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0OwMOYawl/x7bJ06CcE3OIACywZ/sFMRpfGnUvn25L0=;
	b=S0tHlkAP20WyYSb6d5JDoP8yZCiTlHgl02J/nXvqDt0C7m/r8+dIqxy3SJhu5JK9vo
	y0b1qoaxOeQ9DobAC306HzhmD1IAdZx1htVhmKkcmM+iJNvXg63SryM8NEk7yUC20H6F
	jHIqjrWChqYVsomHXS39gAVEf2vewvLDo1Pi3YGDcnV/qrS5R6ipFlpdepA1rkeN03ZL
	jDpVuANYyvvTGdAAInD542sL9dYZJcPZS4kQcPnMofv6YCHJV4kIsqX/ATp5BXLsMGln
	uzq2fGBPTfjWV7NuPHx/lAcUJCOU+3dpDNeEqQUAIPJ2XSn/OQqTizmIGyHS5Ya9pzz6
	kfKQ==
X-Gm-Message-State: APt69E2Y4mh5mxMDjfYw0XJG/IedBDQ+QtCJOSZEVGQgOinEsyxxc++H
	0PLZtCC4+s/OblAQLkQxt4UEYA==
X-Google-Smtp-Source: ADUXVKLvAJXhlndrhWHTP4xAzL3YV31fJIHEwOGNChOJfivqsZF33vMqJ+mHHiJyI0mm9xIU1MwqIw==
X-Received: by 2002:a1c:6d02:: with SMTP id i2-v6mr1269009wmc.62.1528643337991;
	Sun, 10 Jun 2018 08:08:57 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07BC13F69C25723999916AF42.dip0.t-ipconnect.de.
	[2003:f0:7bc1:3f69:c257:2399:9916:af42])
	by smtp.gmail.com with ESMTPSA id
	z16-v6sm43360230wro.41.2018.06.10.08.08.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Jun 2018 08:08:57 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2018 17:08:17 +0200
Message-Id: <20180610150821.9536-16-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180610150821.9536-1-schnitzeltony@gmail.com>
References: <20180610150821.9536-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 15/19] xfce4-terminal: upgrade 0.8.7.3 -> 0.8.7.4
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
X-List-Received-Date: Sun, 10 Jun 2018 15:08:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-terminal_0.8.7.3.bb => xfce4-terminal_0.8.7.4.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-terminal/{xfce4-terminal_0.8.7.3.bb => xfce4-terminal_0.8.7.4.bb} (68%)

diff --git a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.7.3.bb b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.7.4.bb
similarity index 68%
rename from meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.7.3.bb
rename to meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.7.4.bb
index 7630abc6b..7fc638e47 100644
--- a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.7.3.bb
+++ b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.7.4.bb
@@ -8,5 +8,5 @@ inherit xfce-app
 FILES_${PN} += "${datadir}/xfce4 \
                 ${datadir}/gnome-control-center"
 
-SRC_URI[md5sum] = "f014d613438848b452f1f9eecbf7027d"
-SRC_URI[sha256sum] = "dafa155177934fc7dce2d4efb33402f74b1a593a17ff17d2187a6429f599dfd6"
+SRC_URI[md5sum] = "c861540dd1dd05f56e62382b3851cf66"
+SRC_URI[sha256sum] = "a88f98af4da72394f2cfbd7f14b0f053ec0a3b58a4f6a577836357c60a6c42ab"
-- 
2.14.3


