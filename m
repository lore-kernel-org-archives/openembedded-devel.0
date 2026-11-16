Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4693.1794866326678190721
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 13:58:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=AsOrJRmK;
 spf=pass (domain: gmail.com, ip: 74.125.82.52, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso4993650c88.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 13:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794866326; x=1795471126; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QVpd1TSClyyQ0fbkCUxu6X1uqUa7ARuFsBCS3rMqI/w=;
        b=AsOrJRmKv4wkZPxlMDRbiLp2SS71rj3pLOuhyowfEyPA4B+bQC6dVJC8xJy1hvNySr
         hncBZrpTjMxJ4+EZ1FTdzuUL4AJW0rwijfz3RdwljYqHdC8wriU2tma2jAT7vvJrxIJP
         9qfz8wpsZXHyW/NU+h+QI5zWsCFlTqaN/q3eaXzHLUpJV8f/u+S0ZKit4zuU5g58qzv+
         3pPpv+OEWy8XyAbd7MapMch5Fkj7Nr2/Va3OpUsWzqYCFAV08+IvZawpqJEwuVad9k07
         Hc0Xtu5eeSoV+LokWTVoGc4clu2wV/2qvw7W6C8pVLJyYezDsHrG58DxPzzMq/yyC0nA
         +shw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794866326; x=1795471126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QVpd1TSClyyQ0fbkCUxu6X1uqUa7ARuFsBCS3rMqI/w=;
        b=fmkoa0SCgAygWiKVYoJV/UXhg2R8fnVYdpJtyKSJ+aeLaOmLk/AlrlltLbIj66rd00
         LkVXjbBRB3YNDDko8a8+Wlx9otdWFdGiYzV7WvWSVn8xz21k+AyKimNl8GErbixq5O7u
         dJaS/1yuiWIeqK1fmbFQD+vY8nilZxHa4/qSit8KFUmFBoP4dw98VcsVDXHX1VtU6xIU
         M8MXWl5ShyEXmxQevy5ETMzJRqQLS3c4ZsFGUxH4urgcI0uNVdNkYNQ9QFL+Nic0BRch
         P5BF8TMgQZDwhKAnqq0FL3Ngd6GUqFU41/Cnwow0cKZmjXrWETmgOZuGQprniNiDgC9c
         0giA==
X-Gm-Message-State: APuU4Z9utgboPLCAXu7HLSQjYYT0U/lEBQRvEsxakhycFbw7dzuFDS8i
	oB6KlTYAuqaoHwQFPVA0q0BAyF3fLxwOj1JYxYHG+qFt2u0yTxRE+xWghsaFUBQZ
X-Gm-Gg: AZFdTZeDX1490HptDROFZeZMNvUOrO2JaR62/8XMBCw9o6Pwxv4D865gZCEcXvaQu3Q
	H2BwboZVLZ2N/LDX8Mwh/NhBF2XcbXtyOm12TSOkFZrHLHQaBL8oPNiFKAfcIaWqxo8FFwj/pcB
	rVV8o8puvRV7+jEK/iiieGFKdgsftfe3uu6fp3dXMhbmzaVTqI7e8pWZB/Lo2eT3nHzCsHWiQgc
	IXAeUIgT14dcMO/lCaJHhYVRMrmxfI9fZ/8HjgBRGkAUmz3px8E3bxeWHPpHUuxjNncWVkdSHWU
	OmKkTBA7FBu1gWqTczIMbyFNShhKMEP7QGZo+n/2ny1pZeCHDZ6zga5qimIq+EwEdC8UqxY9WX1
	v8DPk+Fcs8mUTULZ+YYVGgE+tfkjeF+wPm1+iI4e3H2own5Wd1F6SyqDWX5/UccRxGhbPmWiAQm
	qUIMij/B1owsBlP90gbYNZB9U2dHB5fTpFhIR9OieR9h5g+3B6tPrPsvcacFtq6iNbmBUTvM7+Q
	8wU8VTIk64K/R+FNvcWqr85HK8v1/xylhZj6e4hxN//p/Ci9Q3sTSN75DdzJZib+bLzIB/NGCR2
	XuF4cbvvFYLz9cBz6jSuUWfX8wfhTK0O5asMYSB3Cn25CQy3cgZl7ZeirGcBELxO8i0WiWLg2PA
	1zeMgRaF92m1oYjQ1AYuJwYAOchkMcYkssYhhBArIVDcB1njJEfFk/B+Gzz6rsFgV6c6YxF2uht
	X4Ac9x4HPeF2YouFfPwNpOglMCiDk7F4JOjirBJaB99VAqHEPSM3Qlz5AGLhIfpGvIz3MZShWN0
	GL20qLwU3xl5TZLcbQc8sFXwz4nnxd9sA7gelNhgAOnbE8iYtl17kPKlLaty72vVefFj+yN66l8
	D9Lu
X-Received: by 2002:a05:7301:fa3:b0:376:37a2:87f3 with SMTP id 5a478bee46e88-37967dd733dmr11019970eec.31.1794866325493;
        Mon, 16 Nov 2026 13:58:45 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795533170csm37655458eec.7.2026.11.16.13.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:58:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH v2] python3-soupsieve: upgrade 4.1 -> 4.1.1
Date: Mon, 16 Nov 2026 13:58:42 -0800
Message-ID: <20261116215842.1710864-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 21:58:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132564
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
v2: Fix the SRC_URI checksums conflicts

 .../{python3-soupsieve_4.1.bb => python3-soupsieve_4.1.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-soupsieve_4.1.bb => python3-soupsieve_4.1.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_4.1.bb b/meta-python/recipes-devtools/python/python3-soupsieve_4.1.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-soupsieve_4.1.bb
rename to meta-python/recipes-devtools/python/python3-soupsieve_4.1.1.bb
index bd35cf8e41..c366bf2aec 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_4.1.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/facelessuser/soupsieve"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=74851a2f1e5c07496dcb452af6a6bf54"

-SRC_URI[sha256sum] = "ca9abf7126667010d8f6e9b39bfc1bc3b23c8aed9bcb0f54a754dde969bb8aab"
+SRC_URI[sha256sum] = "b296bd2d2f65b1a78149f3d7bf6736a147d2c9e2dfbde0e4404639d748a02e03"

 inherit pypi python_hatchling ptest-python-pytest

