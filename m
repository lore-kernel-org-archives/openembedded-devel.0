Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3873.1794729034086722681
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:50:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Ofnh8EPl;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36f6295304dso1939704eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729033; x=1795333833; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qwhz4PzFzbeNGeLO+Yl7Q9r41xk4QP316akaFO6Z6Pk=;
        b=Ofnh8EPlM+XcObpUr+2EOPNdb5MlHuscArMxGB8rKRai/A1h/5yeqzKxlWUBWdbBUV
         pKlpaWMLxNPsLFO4F+eIZzRhMyiF/w0Fjd3Tb/Fi5NeRZmaWU9w3N/4vHg7uRtTjeb51
         sEsaGtVAkVZSDLFDfz39U9eXW1CV9wwlxV79NloMUdZaFQEkH4HBIxcdduNykNt68HlQ
         jF6lk8a/PD9XPUWtFDvhEeUI/5p4gqSXhaJj+pkFUlycs7Yy8T5gzxPrNDjACuETbi/9
         OVsYfw3YB37qYhWkCiAe/XAMGTMu7mQvbQDkDkm32jPAf4OAuLZ7nnokuSeTqrMj+HXv
         kb0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729033; x=1795333833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qwhz4PzFzbeNGeLO+Yl7Q9r41xk4QP316akaFO6Z6Pk=;
        b=Wo2a7M/Qpk7dhTFyw4Uk689pR37sFOeWDW3xqSpuVPf7i26pZTQa+zThDTpIiL2/Fa
         FcH0VzzVUH9vgIPdTteuAJyjElCuYzGmKATyo8XsyT/Ky1RCCe1zzoLWhUbACuCVSZjE
         jv5NKS6RnNAxERO8oFPoHLXRUVUxAzZisR8FG4fpE/XNfto0Zz1KvyBLaxS5Y6p622IZ
         ECIXKA7dkpdC2yBlitear1bGR/kO+g7v9KJwGszHW3mtV4/RT5GGkAJ8hh5a9WRaYGhc
         81nERi9Y3sBeeAbuWoWDhxIm2awbnjC+H71044Ot/Yauj6EtslP5eGmwHJO7Uz5tCjDS
         pTDA==
X-Gm-Message-State: APuU4Z+zjcahs/6acvb+kzvpdeL59g5IqtmLNW11jLHx422xVCWU9av6
	K5LfgXH2dxfMy5TKP4VqrVvqyPotXBogF1ZyGRr5TuMLgUmasUpba9l7qnVUfMEh
X-Gm-Gg: AYBFou1c+Aosaibo7cJgDIbwgeiEUYClXcPXKdFLQcNyCyIrswT/LfJi6P87DqraqZY
	o1kFZNvNBpcTf1FovM8MoXV0b98H2ZabF6/6q/RWv8K/XX5uI5b7e7GAejxU3gWa0u2a5Q0TR/n
	ki5dxLbTWwQViRYF6AAvpQZSMR7uxjetZGCDrQwZycoPOc9RKtBlscy11ArvyZQfefCoItMZ6V9
	eZElq1skgqojeUgdN68Y90P+gtMdprit8shY/9mipsaw2kB2miEcfuttG8TVAey3eUNKZTSV4Rk
	VVdSj3+UP/4dSbv9zsSuyVP7A3vQTrF33SiOCyt8YrjqIicK4ahL+8GoQfg+Pmum/WmT9ykzsM9
	96Tl6lvWvKuYmxKAct0UDlDOp+Cn4Gql5imSSh/789HoRLh1bqpxxgElKtPnzuArjcC94VcZ57b
	g/whfEb37s3MnnuxtYgDjlLOgLri4QZo5fX2l8yL58D5jj0tfrZYJydK/k2ztbIpNH1OOr4YdTQ
	kD7jgnBtP3ygKJ/hv4DNrbrdkbBWDhtddVGXo12C+CtnJ94oDN18r3Ga8iv7yXeLgUdniQe4m4Q
	L5t0xWAT0ZgSqIqFwIw3Rkt5pbbby62zg35lqTRUnGoc8BMXsviR/naexNHs1Vl4e0++Tso34fl
	BE8Fl+yLX5CPMGWL4XCV5yCDcerRCFE+zT6sa6j0YDbdaMdSiU3/toc95L105LROytxia3hl/m7
	Il/Y/KJiuwIOkG6mosGmDgL/ux7ksf4ZxD/dPpn/mQXKCbOKLN+/8PlljQM46mV24ermNXve0k5
	jqK+M8503TzxiUnghB8xPHG8zQB5iP5hIt3BqsVk8f/TJrM4ecZ8GpMK5FScE76N5aePM5u8g5p
	w5I9Nw==
X-Received: by 2002:a05:7301:5f0b:b0:378:7434:a526 with SMTP id 5a478bee46e88-3796628f413mr6964672eec.14.1794729033310;
        Sat, 14 Nov 2026 23:50:33 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:50:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 45/96] python3-apscheduler: upgrade 3.10.4 -> 3.11.3
Date: Sat, 14 Nov 2026 23:48:23 -0800
Message-ID: <20261115074918.2932593-45-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:50:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132315
Content-Type: text/plain; charset="utf-8"

The sdist is now named apscheduler-<version>.tar.gz.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...n3-apscheduler_3.10.4.bb => python3-apscheduler_3.11.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/python/{python3-apscheduler_3.10.4.bb => python3-apscheduler_3.11.3.bb} (76%)

diff --git a/meta-oe/recipes-devtools/python/python3-apscheduler_3.10.4.bb b/meta-oe/recipes-devtools/python/python3-apscheduler_3.11.3.bb
similarity index 76%
rename from meta-oe/recipes-devtools/python/python3-apscheduler_3.10.4.bb
rename to meta-oe/recipes-devtools/python/python3-apscheduler_3.11.3.bb
index 45950a4f77..9facd84b6a 100644
--- a/meta-oe/recipes-devtools/python/python3-apscheduler_3.10.4.bb
+++ b/meta-oe/recipes-devtools/python/python3-apscheduler_3.11.3.bb
@@ -4,9 +4,9 @@ HOMEPAGE = "https://github.com/agronholm/apscheduler"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f0e423eea5c91e7aa21bdb70184b3e53"
 
-SRC_URI[sha256sum] = "e6df071b27d9be898e486bc7940a7be50b4af2e9da7c08f0744a96d4bd4cef4a"
+SRC_URI[sha256sum] = "cd2fcc9330039a81a5893472ad49facf23a6d5604cbe1d918c835c6de7834d5a"
 
-PYPI_PACKAGE_SDIST = "APScheduler"
+PYPI_PACKAGE_SDIST = "apscheduler"
 
 inherit pypi python_setuptools_build_meta
 
