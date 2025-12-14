Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D51A9D3E787
	for <webhook@archiver.kernel.org>; Sun, 14 Dec 2025 10:44:56 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23497.1765709083601385991
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Dec 2025 02:44:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ir7fgdK1;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so2679623b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 Dec 2025 02:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765709083; x=1766313883; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z+kE4L3353xtpdbHNW0wKIJePGYuPKWc9ZUlG6yruFg=;
        b=ir7fgdK1xEKhljwozQ6rKNA5kbqHX/J1gDWiud4UJesZWWTNYVUEh8A5QJcLE4thn2
         qnpnt4K/OUQtJWB4T9VZa2YYKrNEZlJadHnh9SYqwwB06V41uuwXmP5prHoCP7eergUL
         MvZaeya2C/J43uR/QnfM0Z72/SOBqSL0Zqiu2PNj9xCov6427vkwuTpXLSHbwgczIeRo
         x8b9Jt7IzozRmbbSvCL3BHvWzTW3wOebKDae5KGdnm1zSonDxraw4EXEgKbSH7KEDTqS
         /zPDA/247FRZRBEsIkU1SeBj0wJ+M1PfzYBeBOCTmql4h2+d1xXkT6HE63qfXBz/S6Zk
         WSQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765709083; x=1766313883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z+kE4L3353xtpdbHNW0wKIJePGYuPKWc9ZUlG6yruFg=;
        b=CTPC2VZ7cP7jETIl1f6/069TLzqvAdnyBg77SbnCmSsDO1aPJqP2B1B9otS+Ir6AN1
         F5Q1TF0nRF1C6vTuexlhcv/r7MjMNpRuPtC4z4cqI28cbv2+nj2WPJjZ46oPHfPgESUE
         k4XWZbG1IYH9/UIXSu/fM3iWt3loicmY8A4/YtBlZwK8XfPyH/MIPGQEcS0pz+4jexnL
         WP4ee8+kk2CHWowIvUoUv1Hkiixx2gZiKqt/yYXtDZ8aS/yoyLYhDEkkc/5DTPIR6GEG
         +TXySKxtjxxh3we2wzlolNW1sjl79ktP3tKmhHgANHASvU6WLdhH7lqNDrolAVKvRgHf
         OwHQ==
X-Gm-Message-State: AOJu0YyX1tJZLiCloKjpfC1Y/EbG5k5geXsfI3N5jzSFHx1x4ENFmRJF
	vA8L/wiqYMdVLEw9tvGbOoX/5SfYCF+eGOR7uHV6IXUtGD0Z6EdoHqNnTkwOiHFw
X-Gm-Gg: AY/fxX4G9rEBF7H4qhzXBzLgrca6Goqff2zlvhOo3GBu5W6kh+2F8CRsI/61iLJeMN/
	5/svMm4zxHbP3Sx48NbGyhwBQG7qohUDJ7mcAwhHvFwSZru6tFDyeT5FUggrbWK2C4SWWTYL8N7
	vE/Y6B1JkVDCXym62WN0mrYmRVvRq342tEjZ0SYX89HfnNvH9I0oPzGhmDADdaVFA15Yh/HVV0G
	KvOr4piUhufqzHoMdPOtrjR9YwbwSPTCzGtaC1hHzIGKtwaeQ6P78DNhCozWRoEJADNlNK400Nh
	rEItQOAgu+FzFMfAhhpDeLWSUlaIvhHaNchz/hhVaA1J5QJDTHrKftYBSzYSdrGm+2LPSU7Zg8V
	uPxDV3ugnFmOGLdhFqGgmUt9m+BDTPU/sZ+kuPgov+3eD2OOF+IBWEN45pZPAuLWTvD7tynd7uO
	2Nv8WHSuz5pV9IN3MKT8s6Iak8OE4GKapsurUshvCEZ5JC7RK8oFgBlCArSN0LtuhpQq2tyLHnT
	YQvUEOKypXxpeMErshoCLDVxE8IP0H12swR5HkjQPQ=
X-Google-Smtp-Source: AGHT+IHFVZ47kTea/7zCxFh9NMUiCfakbVCr+C37XLqOm+DrXXrlYB+JDHehfyn3wEVWT5/b5f5uNQ==
X-Received: by 2002:a05:7022:4422:b0:11b:89f3:aaf8 with SMTP id a92af1059eb24-11f35476165mr5523269c88.4.1765709082467;
        Sun, 14 Dec 2025 02:44:42 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::69b8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2b51b2sm33026160c88.8.2025.12.14.02.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 02:44:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/4] openocd: Delete unused patch
Date: Sun, 14 Dec 2025 02:44:37 -0800
Message-ID: <20251214104439.1085235-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251214104439.1085235-1-raj.khem@gmail.com>
References: <20251214104439.1085235-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 Dec 2025 10:44:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122648

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...SOURCE_DATE_EPOCH-environment-variab.patch | 38 -------------------
 1 file changed, 38 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/openocd/openocd/0001-Makefile.am-Use-SOURCE_DATE_EPOCH-environment-variab.patch

diff --git a/meta-oe/recipes-devtools/openocd/openocd/0001-Makefile.am-Use-SOURCE_DATE_EPOCH-environment-variab.patch b/meta-oe/recipes-devtools/openocd/openocd/0001-Makefile.am-Use-SOURCE_DATE_EPOCH-environment-variab.patch
deleted file mode 100644
index a7d7552d5a..0000000000
--- a/meta-oe/recipes-devtools/openocd/openocd/0001-Makefile.am-Use-SOURCE_DATE_EPOCH-environment-variab.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 65969a2b73ce93db4c80f1706677351b0e57fa72 Mon Sep 17 00:00:00 2001
-From: Sofiane HAMAM <sofiane.hamam@smile.fr>
-Date: Fri, 28 Mar 2025 12:31:17 +0100
-Subject: [PATCH] Makefile.am: Use SOURCE_DATE_EPOCH environment variable
-
-This package defines PKGBLDDATE as build timestamp which makes
-it non reproducible. Use SOURCE_DATE_EPOCH if it is found, otherwise
-use build timestamp. Following best practices, see :
-https://reproducible-builds.org/docs/source-date-epoch/
-
-The patch is BSD compatible too.
-
-Change-Id: I26c1a00f2e8059ae31fe72a794b5962af5a84f44
-Co-developed-by: Yoann Congal <yoann.congal@smile.fr>
-Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
-Signed-off-by: Sofiane HAMAM <sofiane.hamam@smile.fr>
-
-Upstream-Status: Backport [https://repo.or.cz/openocd.git?a=commit;h=6834f022b96fb1c7f5829166578e01a0ac223cb0]
----
- src/Makefile.am | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 6d79cd631..9ca697407 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -30,7 +30,10 @@ if RELEASE
- else
- %C%_libopenocd_la_CPPFLAGS += -DRELSTR=\"`$(top_srcdir)/guess-rev.sh $(top_srcdir)`\"
- %C%_libopenocd_la_CPPFLAGS += -DGITVERSION=\"`cd $(top_srcdir) && git describe`\"
--%C%_libopenocd_la_CPPFLAGS += -DPKGBLDDATE=\"`date +%F-%R`\"
-+%C%_libopenocd_la_CPPFLAGS += -DPKGBLDDATE=\"`DATE_FMT=+%F-%R; \
-+	SOURCE_DATE_EPOCH="$${SOURCE_DATE_EPOCH:-$$(date +%s)}"; \
-+	date -u -d "@$$SOURCE_DATE_EPOCH" "$$DATE_FMT" 2>/dev/null || \
-+	date -u -r "$$SOURCE_DATE_EPOCH" "$$DATE_FMT" 2>/dev/null || date -u "$$DATE_FMT"`\"
- endif
-
- # add default CPPFLAGS

