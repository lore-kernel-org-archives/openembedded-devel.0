Return-Path: <filipe.pires@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B5ECCD5BD5
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 21:16:36 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21083.1780002993717675020
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 May 2026 14:16:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=V91cVOqK;
 spf=pass (domain: konsulko.com, ip: 209.85.128.43, mailfrom: filipe.pires@konsulko.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4908b92904fso15607315e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 May 2026 14:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1780002992; x=1780607792; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=opq7wvcljoN+H79HzjhFKxaoqU+tIkTu9dXcGUt3PPQ=;
        b=V91cVOqK6qLidyQQzGtklRXqYHgEau+f3sSNKu/iVnBe/x5PDQOGZ0HA3tmfxk3bnY
         HD8yNpE6MGRpnlxYYiDpbASeFbjGu19CElX152J6y+Fu7t+uKvHAetp1aXHhHY0M9elT
         +lL+O0sWPqKdwu452Sp9t4r9cBqU6mAXmmGRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780002992; x=1780607792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=opq7wvcljoN+H79HzjhFKxaoqU+tIkTu9dXcGUt3PPQ=;
        b=EGcYOOk2KQE3irB3V07iFoj4oZBzTr2/Eilo+ZUIOWxjl6ZAUI43Z06Vz7mqOJUe7c
         vLiO1M2cZ+sGbDsNkvIQF/+8KuAFAxz+ckQV4Lej1zJXvH8avuBduX8XmpKu1F3ZOyGu
         KKOo5UxUsRVlMAOQOhmsNRtS6LMXPlTEAyqZTzEVVAWQnKCtRJSX92ZkpmvU7b50xNMY
         Pt6oXZwV3dYQ4CldquZIEAsfi2MUa/Yye8vTjqrBYEAamn8+QnoCPrRv1TxR/D7joIAz
         JJvbIQ+L9/HfPOr6QSjsOozJrogAqq3TrL99WN2GPr3ZbiQ7VJH2zL3xHZE5SPYz41b0
         nGgQ==
X-Gm-Message-State: AOJu0YzhGEXFsCJYNZ4xbPbarb7TPpnTzDCxKJOu3pacWfWlsKccMfHb
	vLn38erPX3tdaMc32EM0kqBgKiDNqbyOz9PffTlWMaf2+b+vd+Nz5krIhsQEOfMdqpfNzs2wlYg
	M68INTss=
X-Gm-Gg: Acq92OE5gX57Bm/pPmgkTj7aNWQufrSaBtDqFayTxH7qHYdGqT7e8g7EcCKEzn+9WUf
	fmAf2VFAw36GyxtvuDILlgwl5hs5mxyflaGyvAZIaDxmgibgbD4TaheAnoDqK265sJs6H5DwmXr
	r8kgYo/XGwAJF9s0fCa5Ig7oiSu4x4mra7VgSRDnkzC2e7hMRZ1KKcv2T3D4d2mBtXhnhP2HQj2
	3sorx1/CjvNwIy/SG4zmSd1fkOtxM9YW14npoQ9zNZ1pI6dpRkD3o1Yme52dJc6g4MctPERfCVx
	tG4n3bxITpJka11LsoIDz/44TrOQPTfdeAdu7P5p9ms3PnrVR8jWFCHle/ApmUso78uUCRKFYdk
	4itZXLYlBXMNGc0qRoCgthrY+eK3skg3JqbUBs6gMX5NcqQnuROX7Rb3+MQCUCIJFTpw6D70PW4
	kWdrQKJhtYTjvliPzO2YJfBamTDuIcEYj3/B/zqDP/vj2X
X-Received: by 2002:a05:6000:460b:b0:45e:655d:6f7 with SMTP id ffacd0b85a97d-45ef144a50emr49232f8f.24.1780002991985;
        Thu, 28 May 2026 14:16:31 -0700 (PDT)
Received: from thinkpad.lan ([2001:818:c3da:6c00:a4e3:eb54:80ab:d9ad])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb54903csm16170763f8f.6.2026.05.28.14.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 14:16:30 -0700 (PDT)
From: fpires96 <filipe.pires@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Filipe Pires <filipe.pires@konsulko.com>
Subject: [meta-networking][PATCH v2] radvd: upgrade 2.20 -> 2.21
Date: Thu, 28 May 2026 22:16:26 +0100
Message-ID: <20260528211626.3591278-1-filipe.pires@konsulko.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260528205816.3586664-1-filipe.pires@konsulko.com>
References: <20260528205816.3586664-1-filipe.pires@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 May 2026 21:16:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127276

From: Filipe Pires <filipe.pires@konsulko.com>

The litech.org distribution URL is no longer available for this release,
so switch to fetching directly from the upstream git repository. This
also fixes the src-uri-bad QA warning for using GitHub archive URLs.

radvd 2.21 hardens radvdump against malformed input (CVE-2026-48715).
---
 .../radvd/{radvd_2.20.bb => radvd_2.21.bb}                | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-daemons/radvd/{radvd_2.20.bb => radvd_2.21.bb} (93%)

diff --git a/meta-networking/recipes-daemons/radvd/radvd_2.20.bb b/meta-networking/recipes-daemons/radvd/radvd_2.21.bb
similarity index 93%
rename from meta-networking/recipes-daemons/radvd/radvd_2.20.bb
rename to meta-networking/recipes-daemons/radvd/radvd_2.21.bb
index d02433c5ec..b10a96f945 100644
--- a/meta-networking/recipes-daemons/radvd/radvd_2.20.bb
+++ b/meta-networking/recipes-daemons/radvd/radvd_2.21.bb
@@ -6,7 +6,7 @@ Discovery for IP Version 6 (IPv6). With these \
 advertisements hosts can automatically configure their \
 addresses and some other parameters. They also can \
 choose a default router based on these advertisements."
-HOMEPAGE = "http://www.litech.org/radvd/"
+HOMEPAGE = "https://github.com/radvd-project/radvd"
 SECTION = "net"
 DEPENDS = "flex-native bison-native libdaemon libbsd"
 
@@ -14,14 +14,16 @@ DEPENDS = "flex-native bison-native libdaemon libbsd"
 LICENSE = "radvd"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=73ebbf7182ae996e65e8fadc9a8c45db"
 
-SRC_URI = "http://v6web.litech.org/radvd/dist/radvd-${PV}.tar.gz \
+SRCREV = "a8500f4035b52028c90b0a938dfe8cd65e38fb50"
+SRC_URI = "git://github.com/radvd-project/radvd.git;branch=master;protocol=https \
            file://radvd.init \
            file://radvd.service \
            file://volatiles.03_radvd \
            file://radvd.default \
            file://radvd.conf \
            "
-SRC_URI[sha256sum] = "af37c5a81d59f3bdc00d83056606ffa1810d4550beed6caa4f81181246494220"
+
+S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_URI = "https://github.com/radvd-project/radvd/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
-- 
2.49.0


