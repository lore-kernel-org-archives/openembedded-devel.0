Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10279.1795753057794165403
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:17:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=AkwwNXuc;
 spf=pass (domain: gmail.com, ip: 74.125.82.42, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-170135e43c7so11893170c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753057; x=1796357857; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o2CWiAZ+DfxAG/5pgszkRyL1g8JNWPgDIXE30Bs/7mw=;
        b=AkwwNXucEiy9QEv5O/My74tlD8ELX1qC1bFmdF27uyxx67FuLDFkGBfTAWyHqRFjhW
         3W7so0VUCq6o1cx/gxB50/Ln+33NpFUXqCEg58PB/V3BevQx2DzzKeOmc097x/LVYq/9
         mc5XpWsx/yVQtOJN4IXyXw78tpzbe4ZG5VH5fwEAdMxZdglCh/L+osdbv4AQOmRwK8kF
         QV/VuTU/h6u3iH0ZdyzjKCBysvd3CTur49fShXnxEyHbx1DFPgd3F/lnKRRg7iOsOYVy
         AyW3fWQm7O0cG8JnaMMLfHGquI/0s4LRWO7X4fv6kmWZiYqcBCZwij5/4Qlpf0sHQR0Y
         GU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753057; x=1796357857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o2CWiAZ+DfxAG/5pgszkRyL1g8JNWPgDIXE30Bs/7mw=;
        b=I8zvurSqO1hrHL17QFtGXm0s6D8Vv6MkWtQ2sjtXJxcdJxiwcw74mpIrumhcCKSyTW
         LGaVXGW3AugVx7lEnIWq41CQI8Z7AJMjL5WkQkqCAKuvCY0E+Ov4XZQyfZK6FlXHp3BS
         6w4hEMkFmOrQkVNKgPe0URL2cTkZaygqbnB6A6Z/EcsQhP4LVA2zGtUr+r31U7VFNnyn
         sKa/qga6EhN0Q4eUR/xtTQuwjgKFOe/94KbVO9wdOMH8UWEGOhbhqTP55qsQ+i8pitPJ
         4yD4YpX7qAJA6Biwctimpod4Onnwmsouzms3Bxx9RGVB5eTB9Dgt0fECnyw5eOiHpMeA
         xAmw==
X-Gm-Message-State: APuU4Z+WwV9zRdl6turUrqbbAtJiuEqebpFNX1JpOy0UIJrJSLY2RIV4
	as5GGtKLWPQfrpfViXmqOb9hlgLIM7Wg6ZM1ffK6ZH/M9lryfLoDJTfYP5RpCGdr
X-Gm-Gg: AZFdTZeWLXMtyyFm7eU/KmDGHpOe4kY34RYQuNBDu0h/cHnkFq6PlKxQaWts4VV2T8m
	XsrXG27VzQvfzOdBAQX63bo7eqNArTgAbM6VblrD0lc2R1gD/nLwJn2eF2KH4pLnVcIfKssSCZO
	m92newt4b/mcFrc78oqKZ9lW04GXjoie4tpp1R/PjIKzozTQ94DSlTcNWXRUw5pMUxxiPGiXwI1
	5qhLWXJ7vAr1QCi7/yD91hFEjk8DyghzH/5BTQSXbfojP4wEbxRlTYOpQOJQ/qYpE6+uXw07Ufj
	nNOSFKTOTrG9skRZ1SZidk5h/s+tfdLT7Zgw62ECuwScBJ0pT3IMZAo4IsA57DMmtjRvnHzFZgd
	liB8kRZlYElVHpIt1r7ZgrOfkF61uzrcqNvwdXtSpAEKpyFBiBbicEgZmJYrkOTaFeyH7PBX0e1
	+/BywGDGtoTQ4o+PcldlAep39QSjimCzvJ88xy/qXsalNMsH/iPZPan9JfewJ4DFPFlhWrMWiAP
	35jwbTI5UgQHglyHdwdF87Vx60xxjHesTZ3b+TtENcsdCfkxHjalBSLoYvPvjoZ9CXkRuqdT8rF
	RVeb/ArqeeuHJMGf0lwSKhLPgs9kfhaNS8AbEkzRH6WilqKOnVK933OtrGtwSUOKG1oVsq4NQw2
	ve+EOI/1yttOiHfCz9Im2tVFdEL+aKEwukwinm13EzvLJc4IjWOTikIqCwINJAz0uZxA/QSrJNg
	eIIyAKMf/9y98SGHeezWbKSyODPA07QqTmUgCe8ZKZaSrHPRzI69AtRJYrVhchAeXm7v/D8YEZB
	Pc37AY8zvy2LZM9fyJSA3yMNbEEZRexICm6Z3Ungom8jhGSZR/JJwS+9tjuNB7ObtII1Siu+RM3
	MJ5j
X-Received: by 2002:a05:701a:ccc8:20b0:196:e254:db24 with SMTP id a92af1059eb24-1b5568d32bdmr23384376c88.21.1795753056927;
        Thu, 26 Nov 2026 20:17:36 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm53880225c88.12.2026.11.26.20.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:17:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 17/35] nopoll: Fix upstream version check
Date: Thu, 26 Nov 2026 20:16:57 -0800
Message-ID: <20261127041715.1776485-18-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
References: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133269
Content-Type: text/plain; charset="utf-8"

The default regex took the build number 462 from nopoll-0.4.9.b462 as
the version. Match the full X.Y.Z.bN version.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-protocols/nopoll/nopoll_0.4.9.b462.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-protocols/nopoll/nopoll_0.4.9.b462.bb b/meta-networking/recipes-protocols/nopoll/nopoll_0.4.9.b462.bb
index dbe8407443..c1a80bff95 100644
--- a/meta-networking/recipes-protocols/nopoll/nopoll_0.4.9.b462.bb
+++ b/meta-networking/recipes-protocols/nopoll/nopoll_0.4.9.b462.bb
@@ -15,6 +15,8 @@ SRC_URI = "http://www.aspl.es/nopoll/downloads/nopoll-${PV}.tar.gz \
           "
 SRC_URI[sha256sum] = "80bfa3e0228e88e290dd23eb94d9bb1f4d726fb117c11cfb048cbdd1d71d379a"
 
+UPSTREAM_CHECK_REGEX = "nopoll-(?P<pver>\d+(\.\d+)+\.b\d+)\.tar\.gz"
+
 inherit autotools pkgconfig
 
 EXTRA_OECONF += "--disable-nopoll-doc"
