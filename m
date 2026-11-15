Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3829.1794729045762578395
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:50:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=mzwu18Ux;
 spf=pass (domain: gmail.com, ip: 74.125.82.54, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15dd124bbe7so2405185c88.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729045; x=1795333845; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XhuaJJckw/CaK3rfMJBSVDSKinF34N6bgV1/3QTYKkc=;
        b=mzwu18UxQYND0vdsQzyFC5Mz3m+L3QSqw+TCOSYqZPnUtifx8PLk+je+TDnL5Lsu4H
         ZVrTrkysPYEQpyxghy68w/kaUDNJDHvO/B5lLTfjzNOHMqx6SHAUy0ERaSTIW+2OfYGz
         A30DEuy048eIRM0qFDKhV7Hn/orUlxk/CIGvKUBuP3asGEq/xEgFqJM9zaMv3XW9wv3Q
         QNE2zQ5Vv4NGHQlmtXP9kMQk/hUNJv1/S/uTfeSbKUJeVdY4oviH647nYqwcbr94V/M4
         6/KCFeIS6uPvhTyQ5/qcf8V3Eq5YufCjJXLnEZTNt2BEtkrBPe/PZBEdERiq93ycnDRT
         pKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729045; x=1795333845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XhuaJJckw/CaK3rfMJBSVDSKinF34N6bgV1/3QTYKkc=;
        b=H/87nFCbfkKA1WGII5sy8h/A1pRa2jilaxGwRQSwYbdb9hv48UM2lJrYPsvrD4o1Va
         pQaSWZCZzHx4qi09murVIXkCX+Hk1ZbHJShoYxgcNSLoiol+Zm+N7+mRfrXVQ5BT4NLU
         prwXUJTSepRstrFHYn3IIPxD0Zv9AOpuoAC8Vu24wVzyixXPfoRd49+YPv3pQM4unOcM
         l6bUVbeUfuoBG061+Cg+VUuPS74a1Jyfd+ulBRPx038qzCZHZdhLvIqlQBMCor78mwRg
         gTB72q0UO5EMERp4Svn52vb2Btq0YSDnK5EtfkoQkeQQhOiEuGhuV9pIS8R43dqFcyqn
         y2kg==
X-Gm-Message-State: APuU4Z81dXiKs1+UoIQWkIvMC+khRC7wQ1tTb91ikh2MnYS5VgxihbAb
	Rzyp0Ztxo7n3XgyyqVOIFyKiQ1rU2zvXGTzFqNnlkWFLQJ2OJe4L+iEE6RKegDnm
X-Gm-Gg: AYBFou2V9B04z6RNxvlDpdon5lWL4wK1o2Z0WT63jaE/O/kPAkSOqtPy852WjCxAxUH
	ht4a+qt/Q1BWqdFGv5IkmYxct6y6lwO+Vrm8gYxmsuAExktsKes0k9b/ohKv8kIMWPL4tFVMLo+
	1/OWiQluc+56Anwqf9ZqI2oiJBppOthPCW4lACs+qylGYQbhu4lyOXC874kXUSQVqzGp/4F93o/
	pKDh9BfgSmPmoaI55sy9m9q/SUIND0Dgh/zd+i+j/nNkHsS/qBFVZwkS02quN8nu+EgT0tk7d1D
	hfxjVKNs2Js2PImYx4XjJRfQEy7gD8sAW+1qy4sZ3ACp1E7MXIxQ+V/pFxUD4quuuUQcW5OLJs1
	ZXaALPgN2vXyspLhZKnvWAwUGTFpEGJmaDfpMmFw7lGJAHSqQoJqPPn1U/QqndmVkn0GgBYldY+
	xm6R+T5+ZtSpwJwbNun4esMSIHz5Bw8UD218h/eBnFsunZD4cUF8UKHogUN8dWjcnyU8EQTHbz8
	03kEcjWYa6trWgS/n9PBCU0rG5h4APK/2SP5v85MOkX0S1t3Tyrxap7C4+8hBOGkeS78Xb8JEKo
	bVRonhlCRYlj51ZeHTMFbFkSS5Ud9BzY5t0PbtdoXFyN+SudIZYv/LqJRXu/3fqoTD+hTpRVCwV
	c7PwdVm+hcbsei5z/iXBy8vJYLFBaY39cHEV9hrrRve2OhnZvLBHB1eW7915iPaL/35Wm5KBUY5
	G7HDWbYK5EjCtYJdBxRtaULRp+FDwSxc7MPRvsQaeTtKsJYsm9B60EsJtGoyXeVA/LKTDzsi2Uz
	Cx44rZLIlRGXBGFtgSqZ44bQzcI6j1fckuTAZLSmuWtAGdxGxuhcfsRun7TuQG1MIJZ4N4vuQ0K
	7Cgs
X-Received: by 2002:a05:7300:478e:b0:378:314:402d with SMTP id 5a478bee46e88-3796666e0bamr11606532eec.14.1794729044986;
        Sat, 14 Nov 2026 23:50:44 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:50:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 53/96] mg: upgrade 20230501 -> 20260719
Date: Sat, 14 Nov 2026 23:48:31 -0800
Message-ID: <20261115074918.2932593-53-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:50:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132323
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/mg/{mg_20230501.bb => mg_20260719.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/mg/{mg_20230501.bb => mg_20260719.bb} (95%)

diff --git a/meta-oe/recipes-support/mg/mg_20230501.bb b/meta-oe/recipes-support/mg/mg_20260719.bb
similarity index 95%
rename from meta-oe/recipes-support/mg/mg_20230501.bb
rename to meta-oe/recipes-support/mg/mg_20260719.bb
index 9816e9d383..d8f1e9095d 100644
--- a/meta-oe/recipes-support/mg/mg_20230501.bb
+++ b/meta-oe/recipes-support/mg/mg_20260719.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://version.c;md5=a8e0b53d89d277bf3b40878ac568bedd"
 DEPENDS = "ncurses libbsd"
 SECTION = "console/editors"
 
-SRCREV = "f21c2ba36772ffa68d9cfa55305e427d37903b4a"
+SRCREV = "42f8b027f6efcff5c15e49bcebd959479e291594"
 SRC_URI = "git://github.com/hboetes/mg;branch=master;protocol=https \
            file://0001-fileio-Include-sys-param.h-for-MAXNAMLEN.patch \
            file://0002-fileio-Define-DEFFILEMODE-if-platform-is-missing.patch \
