Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11785.1795762940124478397
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:02:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=WwZe8nXk;
 spf=pass (domain: gmail.com, ip: 74.125.82.48, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a2af4c8d00so8173886c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762939; x=1796367739; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0WbMCPyTw8Jh/EoI5DnKMhj3B3k+zeYC3zgwQ807No4=;
        b=WwZe8nXkX1AxF3LKhSLXYPcXvPogM0ziDD+RO4n2BukAWQaz45Zmm1NWRTtDJYlUUq
         ptzXShpuCfGYll1xmCdfPnZ4m3C0GKGe1m0i76SFXhVWcCdSum01SlyDR4iZ+qWFfmvf
         YagEokC03ZPCZ0xCyfxSQP0u/8LB79NusVrj1WwjSMnUc1RVnnjy0HjtjHAfePSpQBRB
         694OUv5FCB21waVZSabgzoeKsk2gH//7F8e+qFXJOsN2n7g/rWqFouYpbJt/brY7GXqS
         pD8f7Pq6Ju+CD8aqwtiduWMp9Z4ZmRuRlDQrFgYbPUZbOH+1n78rV9OQPDvGWwAlqcVL
         bR/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762939; x=1796367739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0WbMCPyTw8Jh/EoI5DnKMhj3B3k+zeYC3zgwQ807No4=;
        b=v5+/62hbOupVcgKTTNTTzfWq2+Vx8wM9m/vhdsQCnBjS5sKGtpX7BpC3UKKl1h5i9T
         T0HLOQS1bJYsyfSIrfET1DiA/qCFWmznFYStKv1amFiWfTadTutkD6fFhm13CIMFKY3w
         9ooQLuyzt8WgNyFOaiqaU4DZEfX86A7f9XKLCmRrONpXe0h7WSTRwhZT9eyf+GHTAWJv
         NNK9udbk4wnI/KsyitQtKy8RjSgW86Hf8Kh41paix6KRXi6FDC+svfNK4KlRsseQXF95
         NOJdFBd7JyfAPZYoYBAktVCdFKIcvLWq1qD1uQVZRT7KVES4GnV7tl1b4AlY7EcdxEYl
         zD+w==
X-Gm-Message-State: APuU4Z+/90ER3G79kIIHmgy62Xjo4Sf+mDR9Rmi56svowHFeZ+mumkdA
	RNJFPXbxPj/oeDNn5PCosh3z3aiSbItXBTV++ypI4b8Se3ctN5SvmeqgJz8Bsm54
X-Gm-Gg: AZFdTZcrM2RN6oO9gJ9WbB+1RnMDHZsy/ptux/Px6tsK4Vrbkn6l6TWLOyWFW1miTWD
	FrZlfBRgU3LyK7LIKixO33COTFosV6qwheKF6KsQsunY5H+nPmy797UfP4fg99JF0LMdd2bBxK6
	b4lKEmG19prllA5CE3q6Y27kwMmhMyUbKanSBcg8WPzYA0e7vYEyCPLdZBUFRBY/AtSPCpCTIYv
	6T+Wpe28B0BCBXDiZE3QYUi14Nv/AKeBzfIm6iEc702CisiOUdjc4eFiO12bim05uS8ZuRSIXRj
	urF1B/7+Cro2vTWb22tdQtkHwKB3NaGu8asAXjkHMxFSX/x3Cl1sbjhZm0IjcBIYVlx2/IVXVUW
	9ZgHgx9mFAoExiCVBKqBUCCaAUQSLTeVCZux1b135UhLKPLr6ze0+mIWeuREjNNemxuCVggA5+F
	P8cn0vD0sJaRJYRxSvBo8dRESqQHAN+LxsRCzvDEC6qEdCHrr4I2SGeF6FJqxUJ1w4FnRJJRd6U
	Z1oiAHLmzZeBTDUQ0WbDzmS8x0o6f8bW6HsJHOi/g6Egv/mI0Onfjn0Uh7/v+4KDombJubLNAlE
	gFUKBfo+am6ViHpZrOf58VrmElsk+rnYRspnKyOkk54Pkbj5QznjWK6CR9gof5pqHDxvBAYbPj+
	EmytIogUJ0luVV85CDkuN2MZYXU/2UtfvkwEQQIpTj1FYeRkDDOM8NJqBwW6nuBBkBzmFn3aDVf
	zDEyrEIzsN1AyorBQWDpd3n/mh3nbHCWjsTxNMgf6japxMoYGhKfTLbLRJWQeiXld5BCs5O50p1
	Any6AUGItgmsFfx2AtYlGOhFxy3WNJt4WKpF+NTjhYgRhTC+lPhv7TwviD5+eTa/aD189CRkGQX
	bH/8iA==
X-Received: by 2002:a05:7023:a41:b0:184:5f2e:aa52 with SMTP id a92af1059eb24-1b556894f1fmr24296547c88.16.1795762939452;
        Thu, 26 Nov 2026 23:02:19 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm53911395c88.1.2026.11.26.23.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:02:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 04/21] gtksourceview4: Restrict upstream check to the 4.x series
Date: Thu, 26 Nov 2026 23:01:52 -0800
Message-ID: <20261127070211.2329979-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070211.2329979-1-khem.raj@oss.qualcomm.com>
References: <20261127070211.2329979-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133331
Content-Type: text/plain; charset="utf-8"

The check reported 5.22.0, which is packaged as gtksourceview5. Match
stable 4.x tarballs only.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb
index a045fbd1a7..7010533512 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.4.bb
@@ -17,6 +17,9 @@ SRC_URI += "file://0001-remove-pointless-check.patch"
 SRC_URI[archive.sha256sum] = "7ec9d18fb283d1f84a3a3eff3b7a72b09a10c9c006597b3fbabbb5958420a87d"
 S = "${UNPACKDIR}/gtksourceview-${PV}"
 
+# 5.x is packaged as gtksourceview5
+UPSTREAM_CHECK_REGEX = "gtksourceview-(?P<pver>4\.\d*[02468](\.\d+)+)\.tar"
+
 GIR_MESON_OPTION = 'gir'
 GTKDOC_MESON_OPTION = "gtk_doc"
 
