Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5742.1794975202713735289
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 20:13:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=UJ97PgUo;
 spf=pass (domain: gmail.com, ip: 74.125.82.51, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b3acec6677so876313c88.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 20:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794975202; x=1795580002; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rDzJpKp7c4WpXkbD2wuOMixg9BwagXGoZLdMBuFQK4w=;
        b=UJ97PgUoBX9FWpf1kkgwBP6E/sV49km7T1AK39szMVkEkc/YyRDf9ohVcBBY7L62oG
         TeR/777fV24GOVwbiMrY0yA8IubUvGXfdlxQgUyqzz/s93/uSSuZqSnUAHXBaMCPN3+y
         uEM4DsgElf4T7JKXicM5jC7FB0iw/kW0WnsfiFIVgtXSoXi03Sv7nTsnz4fyy0IcChKw
         9t5EmtquTFViLOjYyaVcs145H+fvptReuZYsZwiLmTjkIUPaTOUjGGSUlRi3iPob/CR/
         lhpBZiI6KnHpZEshJnGQDilpD1om8SdcVZrZt11ll8cddNz2i208rtPoPhRbY+TGqZkA
         rUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975202; x=1795580002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rDzJpKp7c4WpXkbD2wuOMixg9BwagXGoZLdMBuFQK4w=;
        b=Xu3b3sDsBb8dq0KLaP4f4lkbtfv+89dmpHYd3qPjj39/+FODhMOU235DaFbddze1zU
         UxZ9H3LOrT51Y4bKp8Gi8QWt5WEhKiew273vywQiq3G4ZaZKbedHzPdGCRkBe8L6s60W
         fyjr3VSTZkx5zFrxtlWesh9i4Z3inBThZDfnuJciIs4dnPiKi726t7aGpl7QVaed8dWw
         xfoy8ACMSNq8r+LttzB7QbR8ThoKKHdUQeJxl3qr9uAjy+xbNabTBc4jhdt25VOEe3QM
         1BIN8aNk03U3GEG/BorXD6nt713EMhJwhaBywuCwX9CLsGT7xlrIKgX213PaSEqUrQ/L
         t7Xw==
X-Gm-Message-State: APuU4Z+N+3kA4cGNbpXtKKwN6Vs/LtI/8ocWeZzIF11JwJwZ8P0YRXMA
	G6G/xFVxPuHP/dmvz/LcspySPUPUlkUAglFCki1EYiIkrx+o1nTAtlHI3ZAMI/5f
X-Gm-Gg: AYBFou22ik7SZYIky+zlGiBy3KBR+YsZwjMBtxnGfAsuCE8yLYvqWF9Zw8jMyKcNpms
	mdgk7G2CEC4aEBmyaZhJcLgQ+7+VN/+BpDwEyHniQVzSVWL647kmEyxzzYzJXl7Xi+D9cHTlgfz
	nKYotuy6A+stwketrX9glK8ef135yfVgHYXCBeT3tqUb3wQZ4Ezuz+Ae/Oy8FTziBd+VluN4YcT
	W5s9dcYJ3Ft0jgy4vHPgKQ1Ffb+sxfGLBAqvl97ADNgMHeFoYQ6ukKnljV0Z01wcQpDAmcfJIBV
	o0A3N8WUXRId/Hn9EHdBw3VUaJ+KkfZkKAWV9Jq/jOT65ACzrvRBhWCdXu41cwbzsMFzjTboDwU
	tFoFjbe83jXc+4m68G5Ht0yuWSq8G+0q7Nv4V3riSxsjWcK7agMG0EhTg5jJ1ir/eRfuvN/buG3
	nAuoDS6A+fIpV/4MtxzLvc4Cm8iO2dCO4hM+zy7nZ8NelBDpH5WOQtu6iDPxm6veKJr8iFLXKnG
	UmtBmfQhDyVnZ3YDMybWu1QqPpm77atAy+dwq2j00ERNF2/K0o6jDO8m8+AzAa+kgP99UElc79K
	wLprOpdXc8YK7AwEae7bEh8SpiWXRKWRJaeeG2HLaomZWYjzrUySUhDo2aasoOOG1Mc6me25pQU
	eHVQRphH1otXV3lYeF71KC4raTNB0iBubGBTEpXWSf2AvxyiZSvoGbQRH6tLei/FR2/l2kTfI5P
	j99zzFDuMuq4K73aWOzh9m78OrBE5wMcAg91vasZWBqTFPiRqj3YLmyp37Mko+tWWr7TjBviSNk
	Qz6I0Iv5RaqCnU51m+MjW/LlhofA2lCFJXTJI3PVtOnTqvrhHsDH61reZwr7/hTfHfKPWnMoijZ
	r5eb
X-Received: by 2002:a05:7022:ef06:b0:176:2095:1ac4 with SMTP id a92af1059eb24-1b543d2cad1mr1870878c88.18.1794975201915;
        Tue, 17 Nov 2026 20:13:21 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4eafsm2655742c88.14.2026.11.17.20.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:13:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 02/12] gnome-settings-daemon: Fix LICENSE
Date: Tue, 17 Nov 2026 20:13:07 -0800
Message-ID: <20261118041317.2287415-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118041317.2287415-1-khem.raj@oss.qualcomm.com>
References: <20261118041317.2287415-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 04:13:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132625
Content-Type: text/plain; charset="utf-8"

gnome-settings-daemon is not LGPL-2.0-only. COPYING is the GPL-2.0 text
and most sources are GPL-2.0-or-later; the wwan plugin (enabled by
default) is GPL-3.0-or-later and a few helpers are LGPL-2.0-or-later
and LGPL-2.1-or-later.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../gnome-settings-daemon/gnome-settings-daemon_51.1.bb         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_51.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_51.1.bb
index e687de7783..53a262e8f2 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_51.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_51.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Window navigation construction toolkit"
-LICENSE = "LGPL-2.0-only"
+LICENSE = "GPL-2.0-or-later AND GPL-3.0-or-later AND LGPL-2.0-or-later AND LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 
