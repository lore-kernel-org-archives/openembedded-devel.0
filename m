Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 78C8B7886C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 21:33:47 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 17so5706725pfw.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 13:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=SXlnfArKhiGNFYbZMGRNfwSidOQO0w+nTl5f1C8Va2A=;
	b=d53h+avbTZZ/MGZZL+mhpgc47B7R5lfKc3ikKF2+YxTk6mfvtdh3941rRBZTbDcb2L
	sjEhYZjFxOdKYBbPiOUEcT89yrFL1wb7VWpprKhzvab3jDvJs50nJkZyevU32MWigMnx
	Mj0Gm/coNdcyxTjismKw267S4gQ+XtIPiKU6k+oQOOZVmjOhsH7CbqkmDWj+7U5mJiKO
	keeXmtOnRvrl9k4ppl5QeDRH4e57JwlyYQzeswMJ8SPjTRUw7KshtfC6y+utSa9uK5EL
	NzcHNph0Q2gsaYto9gzC8ycztprE1tjhOCxkfuIKPj9jBAGimALprMUtP3x1a1rjuKqE
	LxlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=SXlnfArKhiGNFYbZMGRNfwSidOQO0w+nTl5f1C8Va2A=;
	b=cHmT50oFeJet3nlRtacLi2n4xhSiCFGYEiKm24h+MqLHbP3EZ4P6Sq1mjumh+OFAMJ
	f+Kr/mu9yRjRby4AHYNH2kfOsqB2vtJfAWNxegJSo7cNIzbmhzzgFjN7ZcckFL+ndNJO
	XKtiJgMUK/YOLwAK1LzGNwYFzjGsuNrDANMvIhumuMzOgrYJbn+uQ41iOgf1BXBTNPl5
	uaGXkuCuF7htZJ7CdBHb7qzPwT1jT8HCdTmjE5h3PYlFlXQ/9FCwjbTQOJ1ZQvmmtM3M
	DtwoB1zuINNxm1JLV/hbs7YljwJfCuLdpsBNmzjcLSAJNBCfxsQxJG+kvdgVXuVi20HF
	r58w==
X-Gm-Message-State: APf1xPBCOuENJqkLdacwqTrbyf6sXcvNCs13ZWSMCXyf6YmJ2gsSLRgW
	I0QfMIy3/0chnQS4q3UM8P0H3g==
X-Google-Smtp-Source: AH8x227p+nDN2taZMsbZpNf7qrCKX8/xScD8XYi3/0JVYrTwuuktuoefY75jQDIRtwWczs66scHb6g==
X-Received: by 10.98.13.24 with SMTP id v24mr8384569pfi.89.1519594428559;
	Sun, 25 Feb 2018 13:33:48 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:ad95:2a34:2e02:2fdf])
	by smtp.gmail.com with ESMTPSA id
	64sm12014600pgj.39.2018.02.25.13.33.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 13:33:48 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 13:33:10 -0800
Message-Id: <1519594406-24490-20-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
References: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 20/36] lm_sensors: move to recipes-bsp
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
X-List-Received-Date: Sun, 25 Feb 2018 21:33:47 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../lm_sensors/lmsensors-config/fancontrol                                | 0
 .../{recipes-support => recipes-bsp}/lm_sensors/lmsensors-config/sensord  | 0
 .../lm_sensors/lmsensors-config/sensord.cgi                               | 0
 .../lm_sensors/lmsensors-config/sensord.conf                              | 0
 .../lm_sensors/lmsensors-config/sensors.conf                              | 0
 .../{recipes-support => recipes-bsp}/lm_sensors/lmsensors-config_1.0.bb   | 0
 .../0001-lmsensors-sensors-detect-print-a-special-message-whe.patch       | 0
 .../0001-prog-Do-not-limit-sys-io.h-header-include-to-just-gl.patch       | 0
 .../{recipes-support => recipes-bsp}/lm_sensors/lmsensors/fancontrol.init | 0
 .../{recipes-support => recipes-bsp}/lm_sensors/lmsensors/sensord.init    | 0
 meta-oe/{recipes-support => recipes-bsp}/lm_sensors/lmsensors_3.4.0.bb    | 0
 11 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-support => recipes-bsp}/lm_sensors/lmsensors-config/fancontrol (100%)
 rename meta-oe/{recipes-support => recipes-bsp}/lm_sensors/lmsensors-config/sensord (100%)
 rename meta-oe/{recipes-support => recipes-bsp}/lm_sensors/lmsensors-config/sensord.cgi (100%)
 rename meta-oe/{recipes-support => recipes-bsp}/lm_sensors/lmsensors-config/sensord.conf (100%)
 rename meta-oe/{recipes-support => recipes-bsp}/lm_sensors/lmsensors-config/sensors.conf (100%)
 rename meta-oe/{recipes-support => recipes-bsp}/lm_sensors/lmsensors-config_1.0.bb (100%)
 rename meta-oe/{recipes-support => recipes-bsp}/lm_sensors/lmsensors/0001-lmsensors-sensors-detect-print-a-special-message-whe.patch (100%)
 rename meta-oe/{recipes-support => recipes-bsp}/lm_sensors/lmsensors/0001-prog-Do-not-limit-sys-io.h-header-include-to-just-gl.patch (100%)
 rename meta-oe/{recipes-support => recipes-bsp}/lm_sensors/lmsensors/fancontrol.init (100%)
 rename meta-oe/{recipes-support => recipes-bsp}/lm_sensors/lmsensors/sensord.init (100%)
 rename meta-oe/{recipes-support => recipes-bsp}/lm_sensors/lmsensors_3.4.0.bb (100%)

diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors-config/fancontrol b/meta-oe/recipes-bsp/lm_sensors/lmsensors-config/fancontrol
similarity index 100%
rename from meta-oe/recipes-support/lm_sensors/lmsensors-config/fancontrol
rename to meta-oe/recipes-bsp/lm_sensors/lmsensors-config/fancontrol
diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors-config/sensord b/meta-oe/recipes-bsp/lm_sensors/lmsensors-config/sensord
similarity index 100%
rename from meta-oe/recipes-support/lm_sensors/lmsensors-config/sensord
rename to meta-oe/recipes-bsp/lm_sensors/lmsensors-config/sensord
diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors-config/sensord.cgi b/meta-oe/recipes-bsp/lm_sensors/lmsensors-config/sensord.cgi
similarity index 100%
rename from meta-oe/recipes-support/lm_sensors/lmsensors-config/sensord.cgi
rename to meta-oe/recipes-bsp/lm_sensors/lmsensors-config/sensord.cgi
diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors-config/sensord.conf b/meta-oe/recipes-bsp/lm_sensors/lmsensors-config/sensord.conf
similarity index 100%
rename from meta-oe/recipes-support/lm_sensors/lmsensors-config/sensord.conf
rename to meta-oe/recipes-bsp/lm_sensors/lmsensors-config/sensord.conf
diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors-config/sensors.conf b/meta-oe/recipes-bsp/lm_sensors/lmsensors-config/sensors.conf
similarity index 100%
rename from meta-oe/recipes-support/lm_sensors/lmsensors-config/sensors.conf
rename to meta-oe/recipes-bsp/lm_sensors/lmsensors-config/sensors.conf
diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb b/meta-oe/recipes-bsp/lm_sensors/lmsensors-config_1.0.bb
similarity index 100%
rename from meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb
rename to meta-oe/recipes-bsp/lm_sensors/lmsensors-config_1.0.bb
diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors/0001-lmsensors-sensors-detect-print-a-special-message-whe.patch b/meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-lmsensors-sensors-detect-print-a-special-message-whe.patch
similarity index 100%
rename from meta-oe/recipes-support/lm_sensors/lmsensors/0001-lmsensors-sensors-detect-print-a-special-message-whe.patch
rename to meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-lmsensors-sensors-detect-print-a-special-message-whe.patch
diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors/0001-prog-Do-not-limit-sys-io.h-header-include-to-just-gl.patch b/meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-prog-Do-not-limit-sys-io.h-header-include-to-just-gl.patch
similarity index 100%
rename from meta-oe/recipes-support/lm_sensors/lmsensors/0001-prog-Do-not-limit-sys-io.h-header-include-to-just-gl.patch
rename to meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-prog-Do-not-limit-sys-io.h-header-include-to-just-gl.patch
diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors/fancontrol.init b/meta-oe/recipes-bsp/lm_sensors/lmsensors/fancontrol.init
similarity index 100%
rename from meta-oe/recipes-support/lm_sensors/lmsensors/fancontrol.init
rename to meta-oe/recipes-bsp/lm_sensors/lmsensors/fancontrol.init
diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors/sensord.init b/meta-oe/recipes-bsp/lm_sensors/lmsensors/sensord.init
similarity index 100%
rename from meta-oe/recipes-support/lm_sensors/lmsensors/sensord.init
rename to meta-oe/recipes-bsp/lm_sensors/lmsensors/sensord.init
diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.4.0.bb
similarity index 100%
rename from meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb
rename to meta-oe/recipes-bsp/lm_sensors/lmsensors_3.4.0.bb
-- 
2.7.4


