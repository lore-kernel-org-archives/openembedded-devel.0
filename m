Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11789.1795762941388794897
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:02:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=PUfpm64K;
 spf=pass (domain: gmail.com, ip: 74.125.82.45, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1a2761c69fbso10941864c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762941; x=1796367741; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0av3iWVUwecsrGGbzmHbat3yMUaQADKv4olr84OWB/o=;
        b=PUfpm64K9o8AhtLAxSWpJ1g62jWReXAWGrHKIt+8ugrIRoW2sI1/ui42hLUmRnpysR
         VLcDcH03uPQHm+w+kGvdSBGr0vETyp7IYTW524iNxuZf1YS1JQi62DEOBcDAL93oS5f/
         ApwJB4H5mub2j1oroPQNEZPoQ0gsWXKiFIWEL/F4Z4klyLzfKPJE1ludneOw8K/I6KlK
         22qnUN8t+HIHvU3n+VXAdZ6ox2Z5u/Pi/lOartRLZ1+/Xp1oboaY11OagjXTlm1lzN5Z
         FSFYxdTH/OtBqeGP/myWsrfzg7DPrV7igjNoUCw8UicffxJWCanBfz28opy/n+m0SCit
         ssgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762941; x=1796367741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0av3iWVUwecsrGGbzmHbat3yMUaQADKv4olr84OWB/o=;
        b=aBxNH3BelujlkcwvIuGbww1diDIfpHQNFF1P+KrGgWGbuQdkQknG6jQMJCyan5ll4G
         dIwkU4/Px1Zg25cY1LXqy0KqGznn/LleTn+Q2V2Iep0hgXHSrliT09zBvEn+7nKxrJyH
         w5celIjuCfaot3fMu3rWzLHVJbhlvivxp3WSJEohkb0UGchZ9tUryhGcBHAJgRB+HQeR
         r2AaTjkmLOsvJ0tz58I1fGJTelJ26MVPohizflCbWiKVBrVxXWZ5ySnVoK48+TiFdoIn
         jhmwz0DY+5lFqrm485SOfrVMKPrqJux2/vTPspRZUz/QcyIbwMbwoVd2mgQlr2Y92bGd
         0a4w==
X-Gm-Message-State: APuU4Z+tdIJdfs9VhNuiep+RD0IhNOEiKyobUd688/2gk+3h1Hq6GKsF
	JmIV8H1C9K8E8moU8if5T0svAkc0BLpAlDDsv2THVQu266s2NmELrmfK8dL69k/p
X-Gm-Gg: AZFdTZc8n1KlPNGeoyNTdW5lXyT0bUehMk8vN4j64auusy+cXK4UlPUZh9/Q8jUK9CD
	fgKn8BTX8LqcGtG8ksyuOeOebMVoPNGMGZG9tSJQstde8Z6pTwl4wWC+4XvBykgBI6eFx71w+Jy
	xFKHejl7ENT9vK8X5Ib+OXvKqeZy7f7kpqkjsdg9zZ4+LTMHA7+NPP85sSBOQMvNVH2YMRMlPIW
	7NtoId+9My+HSIXFmkSPZT5vRpcepjHBkG4tSp/beBJ/Ixcuw0Lp56KZr+qEoBwJeLEiJfvj7ya
	IzG7KV7YMgkAWt24Y0SNH5v+t1NklKW1Eug2IWb0A22ceH7KR2tH779zm6gJvw1CsbBTRxrDVVu
	8d0Z5bja6BTenYiRh6TIo/5iCDGlubgmNGHwNne9rqh/Z+UVKEtfKBxUA9D4KnStGJAXQui6yhU
	fVkmjnOnqwy85pc428oJ872jTIao7ulzhuyldfdsHSMyFX+SDcoqBn9oI66VDcVqhKcCZzwbW3h
	BzeUVXGOHPGEh695alj5AAqARWUaggTP3HpP9l3Z1NaGWaPVUiWd+oHVFk3+vIvlnaoaZHRyTwg
	djwfAVsiJF4eVOsn161hHfG8hY8tDSTlQUOfF+pCMXOCqTgVApDJ1ptgmfY6pmcNTmiLUiiU2eJ
	y8KeU/fgo3daJyEEcag/KQVVmV2iiNIBcPFtxBHBFp5ZRwL0ZUAzY3aFLB5AjcQnnpfJGHvljtl
	Q+s4JqfZKO7DAXMZ2NJEX6YIdte63BtW9abNbIK0xeLM4s3p8AwPSVTZnKm+BRTq6yG1Hw3fI0H
	nj4Ln+oqj1/OURzIs9Ej37y5HGEPX24Q6TaM0TJOpssRzWb3vaSMWygBNBO4rUZMVqtRaWnva/0
	JM8PvQ==
X-Received: by 2002:a05:701b:4308:b0:15a:9834:73f2 with SMTP id a92af1059eb24-1b55692031cmr23797744c88.38.1795762940496;
        Thu, 26 Nov 2026 23:02:20 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm53911395c88.1.2026.11.26.23.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:02:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 05/21] libgweather4: Fix upstream version check
Date: Thu, 26 Nov 2026 23:01:53 -0800
Message-ID: <20261127070211.2329979-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070211.2329979-1-khem.raj@oss.qualcomm.com>
References: <20261127070211.2329979-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133332
Content-Type: text/plain; charset="utf-8"

The check reported 40.0, an older libgweather-3 release that sorts
above 4.x. Match stable 4.x tarballs only (even minor).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.4.bb b/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.4.bb
index 3d8a5ed33a..57f599211a 100644
--- a/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.4.bb
+++ b/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.4.bb
@@ -13,6 +13,9 @@ REQUIRED_DISTRO_FEATURES = "opengl"
 SRC_URI += "file://0001-Allow-building-gir-in-cross-environments.patch"
 SRC_URI[archive.sha256sum] = "7017677753cdf7d1fdc355e4bfcdb1eba8369793a8df24d241427a939cbf4283"
 
+# 40.0 is an older libgweather-3 release; odd minors are development releases
+UPSTREAM_CHECK_REGEX = "libgweather-(?P<pver>4\.\d*[02468](\.\d+)+)\.tar"
+
 GTKDOC_MESON_OPTION = "gtk_doc"
 VALA_MESON_OPTION = "enable_vala"
 
