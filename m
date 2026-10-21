Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7560.1792575025987497547
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:30:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=flrnGkq8;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35c76e9614aso918773eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 02:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792575025; x=1793179825; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3sB+LWFGt8SQCb87LBs5KpkRNkHANTEcZv8PHXnJYeo=;
        b=flrnGkq8spP+iwmXNcn3udN9ZOrHhQsvpUDk9ywwnGqVodV6dD50NeIriek15JAYcf
         +HujPiklrZ6CSc+wcvOwdvPCAlpzPGy/jI37/RRQ8nHI6rzielMTslwo3mBfcE2z0jq9
         MXVhRLtip/Jr9w2fn8sA4qABKsjM33k43TcqKyQ7rHL5vWgTOYR27mH3BfM0nwuvSQVv
         6LuLOM3ZQbwhj71UqsH9yxm555l/pan4CLCF94G9uHJ5OJd8GfQYqYKj3YcrAJH0IHe9
         aoszY5FgNth+xfCdgCK9CNVFO4anzxWloavJNkPG2MJckfkviYuowdF7ECstyOwhu3lN
         ollQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575025; x=1793179825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3sB+LWFGt8SQCb87LBs5KpkRNkHANTEcZv8PHXnJYeo=;
        b=BqKd/CC0ozxDjX1NAxx4jPxD0dOaZu+NgoBmzwlmaXdroPCvt/H844FmuXE4HudJcH
         sqFrS7GcjenDH6xjA/OQtrkTV2KMXNvotBIxxRkJKW75V6QjcJ+7100MswG0lJojPPdZ
         gdlCX4Y7/cf/n9HT3N9cWqgq7iytkxAOkqmjmTKw+P1Miwxl/wIKYvfwqHpoJK1OObyh
         2xMck5HnmyVJTYgh6VIHSikxgh+x5tkYL6rhgo0e8WjGzQvTjnrub3Tw/yVPvN/bhFFx
         28vnu33os6AB1XJZeLfEYrYCSoddDNmEo6bP9fP+DYcsvAT2xWNpcVVKG7wQ6a6/tlBN
         hUGw==
X-Gm-Message-State: AFq9FYL4oR1/lb0x+8w354P1Qj0+IjmK7QhawU1HoYeABSh3iCX8BkJN
	4Od4Rl5Iq5NlzzAGANcU86gBd47xi0f5IIKjkWmJQmCH5p68n27Wvt8ky0PCbQ==
X-Gm-Gg: AYBFou1YiULBWJJnYxP3ls/FHeueKrvVkF1xxkNOD6Q9VGveh01rsM2+sO6cHwp2gO2
	pqsmnNw4D5B/huJBgIxScJD++rLmw5tg8cEcClmNV0ujIwzoRVHd89xMZ6g6or005KMA2BHeugr
	JvNQ+RXPcYI4XXbgjXb6GlZ+gznwUBV/iIQR5dmb8dQ5k7l58JPrvbv/eTg1GD3EUmgGKk9iayA
	7Hq7Cje9qRwou083V9F29pQaAycR5AoU3pXcO2/HL9fhqbRuBTQ50EAg7j3EPtRvWSopGfaB3+z
	GkhqZVmrXYdh4LeK+MpjEz7IwgyB3I3a6NV/hyILDhxbusCIXJ8eg8b1BxMS7omC//Sk1SDioFb
	iX9TDzqiwSgzTOvpPMBhFR60YWSOaG4nZuT1UmShRnRPYjOJJuuWHPPJdd+qnPA9tgokSPXgaR3
	k67PUzRId4h55GaXfuBQZFt79PNxBbn7p5EGhNX1YTAunfzFCK7aGb5gPAWP3lFzXnvzkbBI1Hh
	N1ETJAtrYK+Qi9L0zGPGenPkrd6a6AcH00B9m5Fuv/jfxIqybkhahl/0gL3fgJHYMGtRiWwFtbu
	U4tLAeVj/c2SdFr8/zlqFTEg0KLoBnvcefbSqJRWYZKEQbO06kCh
X-Received: by 2002:a05:7022:28f:b0:18d:5988:8d3 with SMTP id a92af1059eb24-190a109f74amr1927724c88.3.1792575025208;
        Wed, 21 Oct 2026 02:30:25 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm4716458c88.3.2026.10.21.02.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:30:24 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][blacksail][PATCH 35/44] netdata: mark CVE-2026-83602 fixed
Date: Wed, 21 Oct 2026 22:28:48 +1300
Message-ID: <20261021092857.3585453-35-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
References: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 09:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131222
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fix identified by NVD is included in the patch release[1] v2.10.4

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-83602

[1]https://github.com/netdata/netdata/pull/22825

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-webserver/recipes-webadmin/netdata/netdata_2.10.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_2.10.4.bb b/meta-webserver/recipes-webadmin/netdata/netdata_2.10.4.bb
index ed4c54fbe4..9df846cec9 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_2.10.4.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_2.10.4.bb
@@ -167,3 +167,5 @@ FILES:${PN} += "\
     "
 
 RDEPENDS:${PN} = "bash python3-core zlib"
+
+CVE_STATUS[CVE-2026-83602] = "fixed-version: fixed in v2.10.4"
