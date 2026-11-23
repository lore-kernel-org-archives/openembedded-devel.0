Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48006.1795411807460340887
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=GRqm3/5M;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36a315ed211so3736263eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411807; x=1796016607; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BTUofXBe3NqArsqFroUqx3dosbj+HTuaSA254JhnSjs=;
        b=GRqm3/5MMYSJhszABElk9/ilpeWRLGG/ib9JlwADOs04Xq4KeuGPRc2lqdSNVplen8
         Aerlx3ssbhebL/eE6CZfXI89fayWxL+c//jBIDB7ps9Oz21PAFC+h7ACbqB7DWDUga7R
         yb2/ySXMdxRX+uFbj+s9pGgKRW84n8urgwCnBl3NjjMvhBdor+mheJTGAMoCla8eKlDx
         BXMuln6juyRDUvRKWh8rbhh1Gp2FhNxzv2N/xnPWAyE9pnCOlTcfxqD+soH2fqJI1i5r
         eyY9jP6GUCtJCE1JHaNK4GtCWxlhQcmxYMvoyOd9rd6fh3ECG9pfPbM/wiUosJq8H989
         Q+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411807; x=1796016607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BTUofXBe3NqArsqFroUqx3dosbj+HTuaSA254JhnSjs=;
        b=O6hCNIW0EJH+H7QClkv/PZp0OZ2FE7aPu1bKsubvcwqNn+jQla3cVNGv5qFP003DEE
         9inJKHdGR2kJuLtg1zX5BuXha6hvMr2S0tVRAqA0BWcb8e/Js+aoyq6xvIukckZdLnye
         HczfZzRikiN/jhvdC2Us01Vo9fEx8cLDwRFy/n5dubw8KXiP+poqs17enBD98pSqh2F7
         Bt7yQ+o1jFcIewEhbGWXOtB3U8f4tenI3MxSZw/RcgswMX0DbgCfb6ddYiznLOjlLTIQ
         /6YBsfBgnq1we+9l6W8nt0DOTSr08kSVt1kpnZQER/VPakPkL+9YGQfhXZ8O2xHd6QVS
         1OFQ==
X-Gm-Message-State: APuU4Z9gW3YZ3zsHYFxGzsmE6zDONiTNfHCqtV72sRF1VQ+wlPfC9Gxf
	L07xe1AruGEf8NXBenq04c+c7QGch42F59DGzSzmFwW4GgBP3i5fjcRS0I6sthsTR+8=
X-Gm-Gg: AZFdTZcaOARL9pxPYO1ip5m7DxlPy28k2+f+2204CWnoNd9hQjjBc1E65WbKY/Aw738
	Vsv6ATli2h8UvoFAge7Dm6S0m6VBNJ+ZXSZhzM2/S2ZuPJ8ZH2LscDBS9bCHqH9eTOo5cfYFmeN
	BGv3FCYCLdmNZjRw4GvP+qD9Q10vShzFt6v73mI0qmcs2B9lpsBmi0JPs5F+POKp8+I6/sWm64k
	jZF0frBmkYUQvsFXswlDSSPaYcrlnmKxOUluO6dRDV0HIvfj8nySobodz97aEtDvPAMNs6w5+z+
	IJwEEQdkqpHcM/ZiKkLUXhJg/ETPymOY4GBajoK+w/O/Tv9XkMwltVl+89NSqpZ1zuTgyjvEfLo
	+Oq+kaxS6tPWWHcnRikWzMQj1YeVabMTC7zyUsqhf1KvNtS4Yo7PxDNjRKjaHwz7sZHukaEQI/t
	7u+LPWmS/nopGZToF2n/j7fAMVmvehzqiCMZwZkxpvqnDUK21fHt3OClBiUJXW6nJ2tFYbwvumr
	zExpBi4Pi/2Q7kTmO2dtmR03aGveLLAN4q132AYcwb8LpfogEbxRlb5lIrnabnBJU0w/PgCkU0J
	va2NLIbarcI+UKUrlQrwiKau/SjdbH7tadd2rqB0H5q0zxV28gDyoTSvgA7G74pGruER9KqpErV
	tltGTxl7tpdUMJxYffQjAh9eiY6azqAmHUzs9C9Y/8fmE7uo1OMHqggCv9/8rRHbXxGruLXzojE
	voXdTglx1EwCHZDIkUTuZsKO6AqeEI/3lewpY0k8vN+HCwh7Wi+7D7nslMeg4dIWQO6I08wHPYn
	HpNKZewUHLBW/Rq61dzcxKG2zOKDGlDL7YyhApvDVGcDb/z1It7ZTytjl92MaEf3WGDZbpljMuR
	wLhL
X-Received: by 2002:a05:7301:d18b:b0:386:b4f1:dab0 with SMTP id 5a478bee46e88-386b4f1e04fmr1207121eec.1.1795411806755;
        Sun, 22 Nov 2026 21:30:06 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 5/5] libgtop: upgrade 2.41.3 -> 2.41.4
Date: Sun, 22 Nov 2026 21:28:25 -0800
Message-ID: <20261123052953.3658549-9-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:30:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132796
Content-Type: text/plain; charset="utf-8"

Bug fix release: ensure null termination of a buffer and skip the
colon when parsing smaps values.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libgtop/{libgtop_2.41.3.bb => libgtop_2.41.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/libgtop/{libgtop_2.41.3.bb => libgtop_2.41.4.bb} (85%)

diff --git a/meta-gnome/recipes-gnome/libgtop/libgtop_2.41.3.bb b/meta-gnome/recipes-gnome/libgtop/libgtop_2.41.4.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/libgtop/libgtop_2.41.3.bb
rename to meta-gnome/recipes-gnome/libgtop/libgtop_2.41.4.bb
index 7131078994..31cd8ccdd1 100644
--- a/meta-gnome/recipes-gnome/libgtop/libgtop_2.41.3.bb
+++ b/meta-gnome/recipes-gnome/libgtop/libgtop_2.41.4.bb
@@ -7,7 +7,7 @@ inherit gnomebase lib_package gtk-doc gobject-introspection gettext upstream-ver
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI[archive.sha256sum] = "775676df958e2ea2452f7568f28b2ea581063d312773dd5c0b7624c1b9b2da8c"
+SRC_URI[archive.sha256sum] = "d3c18158549218835a00517d9c454a2de825ac7808efe84101a8b7e2a8ab6663"
 
 UPSTREAM_CHECK_REGEX = "libgtop-(?P<pver>\d+(\.\d+)+).tar"
 
