Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8092.1795739738337865535
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:35:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=xIlHn5U1;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-38431138772so9741272eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739738; x=1796344538; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1GAQKUT1wI541MVCudXQzIY9rw6ZcDHh14fQHNTGXUA=;
        b=xIlHn5U1dW3VMOWx0zGajVmFrcYdETAFCklb2FQubhsv0pydRKXQDulSRbB38jAnQa
         uFoVVn7pbATRGQkhAFUNEPqlXPYmTjhEqATWk2O4kTnVUUfrGqv6jXXVUM/cUbpggPlr
         34c8Vib4n36fZXjnW69RiCez2dOZxxb6FLFjP6VFsZI4iYm1KpdI4D1Qjo2usbd7BlDJ
         Iz++9ospexRjKVKC1O7i+H0xboNlUSONXbXPnFn6ZWfzuUrSc/KDpie3Q+5wpyr/dAIa
         a/whYUxh/wJcjB48EL4D691as1HhKtLcgFawD0SMqQLGNYsw/gQF+oBc83q7phAY1cd4
         ihpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739738; x=1796344538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1GAQKUT1wI541MVCudXQzIY9rw6ZcDHh14fQHNTGXUA=;
        b=mp/avTV/BJH7fKYDrVU6INUp91j1AiVggQziKwrluwkRk4W5Y2Fcn7DfuV7UsZN89T
         PIqr15U+YnZbpuSLw+ZzW8jNFiD42kVwYqKes8ODzHfjhkkUns8Rk6sNkCFVjkcOJitr
         2H1hwGkJntBw9zZlthyzE30dcWB8+xdxNBhH+UXupInzBLCIaMlH34vRBOUBts226+qf
         eEMCWIMv8Ztik5fuJQ+7RdcrNXcty9vrM5vOip3VN2Opr39STYxaqD/7LVitTVeEeMVw
         qKgTvOJbSuA6yK4xMaV8PUB87YuLhrTO/924vawFvatuRj4VBpsjANL8A4MyxrIn8AYp
         hxIQ==
X-Gm-Message-State: APuU4Z9SxFXmgamwEzNdefavPUFHtAh1CkVIM5WZscaxIO48UyQ/+cns
	7xmnSpbwG1uq+eYmmswUIY8LqP7DZhPX0Qf2APp8rx4Ikyoe8oEKZl+NFfKbzjXe
X-Gm-Gg: AZFdTZcyDd6gklB7zRrGlX/4P4xv96GC7+EnvnzcECvC9b4Z4EBgR4Av5N+dV5Di/4/
	P4QfT7s2K+DkD244NqWyYeuDXkjaCO/7qQ7ImLSl+7NQ/vvvpCNfUJzFLsZj2e8zzx1Hwybjw1v
	vFRV6IiVLAk2H5V5bXFpibdd6dj9WhdR2xOnAgO+c3HDxDVUOVpOyQ6yd2y+zdpui19yNGZ1Fp0
	5++GEFJzzThXTJOeNtyZgT9/3gJq3LtYv85m83FTqDWgdDOIlTn3+H/l7V6v05YH5c4TZVTtu0Q
	eTOiVOfHGJQ/rD6FEpd0a7Vhj3VxV8S3fiPvrTQ2G1Hdn2cjFhFUDUwc9wL9zszTdq/wpfxM2Ec
	+SPW0aYFCly6DQzZmxzPZXK13XdJokWHKEzkwWx/hm+LVKgGf3JIwrpDalq4dB+ydH2ma9pwxXi
	6da5BTEwgYEAe5QUJROqWZnAQKV/5WMpqKwJzys1P24+ilhjNpU+UDQCOHkf+IFg8xUDjo0snsE
	FchrGPbYmDSIUXfCp4n+njpJm+bJKws+dAvxtF2ACp4mB8EPCOtNmy3zn7hy/OmvTBuY+BK1N54
	4uGK3vJU8l96a1vdDENG8W+zOvCZyhlLTlaHii/c3DU1brCggb18a8jxTbN9ohRoaH8xxDECL0m
	jjVso06jt5jm15dwZRMSMbS/bEv6h5B4CCQNAV69zFVvIM4lbyayKRktuU43bvmE5mHFauWJHil
	W9+GpWdyRUpz7SwGoEV8vHktKR85MOghvJNnL+MzXyMCwchiouibEPBNn6oBplef+O6pGamMJg7
	4VlfQgWA48fEtC/wbERjufQj2dHoL/MfOFbETiPnx4gWsmT7+5euHOU+52ZfdWMnut7mJkwhY6+
	o5q6
X-Received: by 2002:a05:693c:87d8:b0:386:b896:319c with SMTP id 5a478bee46e88-386b8963d3amr12105206eec.35.1795739737682;
        Thu, 26 Nov 2026 16:35:37 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:35:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 64/69] gpsd: Fix upstream version check
Date: Thu, 26 Nov 2026 16:34:20 -0800
Message-ID: <20261127003425.2166632-65-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133164
Content-Type: text/plain; charset="utf-8"

Add UPSTREAM_CHECK_URI/REGEX for the savannah download listing.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.28.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.28.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.28.bb
index 2894ceb72c..376feec5b2 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.28.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.28.bb
@@ -12,6 +12,9 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            "
 SRC_URI[sha256sum] = "72f7937f36d98fb348e9fa044ad1e72955982ec5938609b18e4ee7c9e04f83f2"
 
+UPSTREAM_CHECK_URI = "https://download.savannah.gnu.org/releases/gpsd/"
+UPSTREAM_CHECK_REGEX = "gpsd-(?P<pver>\d+(\.\d+)+)\.tar\.gz"
+
 inherit scons update-rc.d python3-dir python3native systemd update-alternatives pkgconfig
 
 INITSCRIPT_PACKAGES = "gpsd-conf"
