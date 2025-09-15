Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D49DCCAC592
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 18:18:37 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.71.1757960313873851972
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Sep 2025 11:18:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qy3+kTfj;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-724b9ba6e65so29871927b3.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Sep 2025 11:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757960313; x=1758565113; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2KsqdbS2DJJgaHVtcJCFQ2DG6SWTVjgTcwR4RNqP51M=;
        b=Qy3+kTfjGMGlWqwXq1qLzn1sDui99/BUToso+ntgjdTYFDYoI+CqHwUrlbNRweHxIf
         fget6k+r7E7rj0CZeEbUxN7iT2D4VXEqylLOsUHR4x+dCUjdXJ/h7vnEVyTdKbtuHEMD
         lHVjZ3SSvPkbtPjQt/Y4wDwV1qnNdr9hrRGM/OUSmqDqGnVfgtc4pA/T6ClA4YrtkHDU
         gBLJHJcvQKSnli2LHfWc7RUt7+Bu+W/kgD8QMD48hf4TZpHXUKuQZVRe9BVwaeI4WCPT
         EuXl46siBfmYDoNPl0Qp515oGL1y9tB2Lwy45ZHn47MZIayZG79QZMOjWki65t1DpXlh
         gmmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757960313; x=1758565113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2KsqdbS2DJJgaHVtcJCFQ2DG6SWTVjgTcwR4RNqP51M=;
        b=mZ2NDius60wjGUgBtSP0+7ojFT6YevUzeu7sneJzPWcG7usbgI0N59JosWU0nxMtJC
         FK+Cgc5KpcUE+Ks65mv2Ax//OoOMLpgzibdpIVK784vMwor/1Tr233T981vuGhkpGC93
         k5ZSCZZwDdVV6Dh3vwRyiG4nBG8STvbY8Ial8nSu7JxSFUfOnUoYdzRzMLhc37ob241X
         gotqVwPHncOOiviiPv0aml33IraeMuuG2EAdWVlLxZNVGWszzOlyK6JJypOTdE7VPNnA
         3Dd3Q+cLOSa57VAJ4E+GO5/ykE/iQlsNjaX93WSRGKkrmw5JQPa2pCwuCasyGsoryrR0
         ye7Q==
X-Gm-Message-State: AOJu0YzAreqNkqQmfnFOvfPyhTcT9ZffcPxkIUzt7ZJg46WHeQMFA7q4
	3ebvwb4706Lj+fc2kNK5nYZBcX8bRscOtgZ4uvoQvBdxuWxa23nF5h+9R0TIY+pD
X-Gm-Gg: ASbGncs5Vm+HxZaMU1mE360HILGJZM/p2hfhOutKW2kSAD/PGxXfE+DmnoMqVgpqQY8
	bkMtXAIiuBndBnPdmUESJFj51nETgGkk0vs2I/pbPgYvip89Y8Y+Mh4+SUowCn3axRC1P8yDw/1
	jLTSOhJYhyx1gWPtWIj/AjT8KDfLVHKq82Vr1pwK/QMyiUDF/yy4zu1loT3KBYtaVgLpipTNVLo
	EzJJkRgXMW4T9maaund+l9nxXtBTlECWjMwkn3umCjO3qUhbuVNoz2dx/lgJ4rSYfqexzV2DZ3D
	+wcd3Y17YNPsD9ehqKTgQ3EoLot81+MnbPwZtvpJrsldderQd0XyYWNVlaGRubiBmGaTDyfPhjw
	kEP3B2pGxaSY3Hppi8JTwomBeKmte1g6HJpQWvHU=
X-Google-Smtp-Source: AGHT+IF00Hp2po3CPK6549guSnBxHA0XG1hAEPTIrSzp4xgs9Cv7lnfjo9VKAlvXjXuTrq9+3A+Sig==
X-Received: by 2002:a05:690c:ecb:b0:72a:86fb:b436 with SMTP id 00721157ae682-73064532597mr124745897b3.25.1757960312443;
        Mon, 15 Sep 2025 11:18:32 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-72f76830c73sm33903367b3.16.2025.09.15.11.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 11:18:32 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-networking][PATCH] pgpool2: upgrade 4.5.4 -> 4.5.5
Date: Mon, 15 Sep 2025 14:18:22 -0400
Message-ID: <20250915181823.581985-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Sep 2025 18:18:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119412

Changelog: https://www.pgpool.net/docs/latest/en/html/release-4-5-5.html

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../pgpool2/{pgpool2_4.5.4.bb => pgpool2_4.5.5.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/pgpool2/{pgpool2_4.5.4.bb => pgpool2_4.5.5.bb} (94%)

diff --git a/meta-networking/recipes-support/pgpool2/pgpool2_4.5.4.bb b/meta-networking/recipes-support/pgpool2/pgpool2_4.5.5.bb
similarity index 94%
rename from meta-networking/recipes-support/pgpool2/pgpool2_4.5.4.bb
rename to meta-networking/recipes-support/pgpool2/pgpool2_4.5.5.bb
index 5eb06e0298..5adb8a7bf0 100644
--- a/meta-networking/recipes-support/pgpool2/pgpool2_4.5.4.bb
+++ b/meta-networking/recipes-support/pgpool2/pgpool2_4.5.5.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "Pgpool-II is a middleware that works between PostgreSQL \
                under a license similar to BSD and MIT. It provides the \
                following features."
 
-HOMEPAGE = "http://pgpool.net"
+HOMEPAGE = "https://pgpool.net"
 
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e4b38de086d73e0521de0bbdbaa4a1a9"
@@ -18,7 +18,7 @@ SRC_URI = "https://www.pgpool.net/mediawiki/images/pgpool-II-${PV}.tar.gz \
 	   file://pgpool.sysconfig \
 	   file://pgpool.service \
            "
-SRC_URI[sha256sum] = "d1392e74ce2807f8ae628872cb1ab7914249921180dc99df40a1d602647a10fd"
+SRC_URI[sha256sum] = "95ffeeaeb6b0cebea8034e30fc1933fec7384b227ad511305eaccc5d090ff998"
 
 S = "${UNPACKDIR}/pgpool-II-${PV}"
 
-- 
2.43.0


