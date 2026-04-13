Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E4EF34C7E
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 18:02:35 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.279322.1776103354106132759
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Apr 2026 11:02:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CjfFV7sA;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48897fd88ebso50924365e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 11:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776103352; x=1776708152; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/am54Lv5Pyv+kDwO6PtkIN25z3E7LiSfWfsu5C8gMT8=;
        b=CjfFV7sAWcWIhEEFci0QaEgPHs1rxCrhllOHhA85pIBBtaGJtAmfsrI3p+tZrYt/pK
         eJditqmKCAsyuTFpRJBn/PM3BQjkpg+8be4oeRBovSQkXC5Pb1gX99saodE/D2TAzQLA
         janxSe1kaDNMf29ScyDS2TXgWWTWO8o0gPhmS7Lq40Uz4Hm9HR7x9CuWCnBigozvhqaE
         K0WRStMH+vHxkwNn0zSRwZbp6SZxt2YsUBRjo9KFtXV3R9JXLnh24PodOzrIjKlQR0rK
         +xjhcPAmpPhZnCq1iWCNxjmmDEKn8iINtQCllM24AJKVMV6jeRHKbU+FBRj1PbpfqSvq
         HEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776103352; x=1776708152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/am54Lv5Pyv+kDwO6PtkIN25z3E7LiSfWfsu5C8gMT8=;
        b=MOn/Gejy1oRFcBIhtUAp2V83lF5JFnJdZ2XSBRju75tavk8F/nqqSWDmQSczc8PL+3
         srorJw8UNzTnGUC6+7sDSSygaBSGCSeICly/0g2jnzlEgRZGDSeJdkr/+UKESFrXfgBK
         eM31aCRbW0UEjLSk8MBuqwd9xyuE36XZi+LboeY8l2Uvic1WL4JPv3iwGzV/OktlcviN
         51ldgIAwyUwx07gkOk92QvnDDy+gzKms7V3zWCwDvBdj+WB4CnR018pxxdzBoubvNuEQ
         06xBLyT1dRxE7cLy4OBPQP7VW5HBt7keDZkQDGv7WxhyHo9WAwsfLKbL+oXAkk2tUlgr
         ABKw==
X-Gm-Message-State: AOJu0Yx56fgTgLe+sy/8DUHpiJv60GEmSNknyUsoo4FHYdf3yqjeby9G
	jWuvnQQ3lKAq4uq62XBVuaTwr6aNI7+DbcYYdDMuHXsnjUA6BYZGp1uR22Gi/w==
X-Gm-Gg: AeBDievTa7FGRMdRdX+goPBE+crhdWP6NKjpwS1uyq6DVr4p1lvO0NE1CxVu7I/3Aqy
	JyhPsXVwyGXZ7cmDHy4eBFpdWuHVoUAdat894LRL+P0ZNfo+qR7/v2kg6hScoROQdWuu4UtzWSS
	5+zW6/e9DE/ECVH3ga+GOMSzn8ZBvluMxcAC4iydPkFFULnvhfnu/6iu6N0U37kYQrJZqwyMxPr
	cN3B81hIffrQK/Kjgq9eiO+DL8qmHdpy0NEiLeSX+UNrGwtAw+Q7iJZzZRADscpnZq6koZSsGtq
	ayyy96sUgItkvcTVPiJqHlGSbRDmbgFEE93S9qPrCLSqzmnit1okHUjut1gceykJjjG267DwIGB
	leI+ZAZyjNT6lz6F87kuQ2c03ssnj2rzr3A4BC59N9Bk7CZGsd5HRHwXeBo1ftoVYFtquMgISHj
	qXd8nYc2p5U9mZf4+hJft/hVfiNdU9XCo=
X-Received: by 2002:a05:600c:4709:b0:488:caed:5ccf with SMTP id 5b1f17b1804b1-488d68af17bmr162824295e9.16.1776103352355;
        Mon, 13 Apr 2026 11:02:32 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d762decf6sm20841686f8f.8.2026.04.13.11.02.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 11:02:31 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 6/6] minio: ignore irrelevant CVEs
Date: Mon, 13 Apr 2026 20:02:25 +0200
Message-ID: <20260413180227.755337-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413180227.755337-1-skandigraun@gmail.com>
References: <20260413180227.755337-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 18:02:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126286

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-33419
https://nvd.nist.gov/vuln/detail/CVE-2026-34204

These CVEs were filed against minio server, but this recipe is for minio
client tools, which is a related, but different project.

Ignore these CVEs.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/minio/minio_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/minio/minio_git.bb b/meta-oe/recipes-extended/minio/minio_git.bb
index 511dd4d869..d08b5e754d 100644
--- a/meta-oe/recipes-extended/minio/minio_git.bb
+++ b/meta-oe/recipes-extended/minio/minio_git.bb
@@ -169,4 +169,4 @@ CVE_STATUS_GROUPS += "CVE_STATUS_WRONG_CPE"
 CVE_STATUS_WRONG_CPE[status] = "cpe-incorrect: The vulnerability is in minio server, not in minio client-tools"
 CVE_STATUS_WRONG_CPE = "CVE-2018-1000538 CVE-2020-11012 CVE-2021-21287 CVE-2021-21362 \
                         CVE-2021-21390 CVE-2021-43858 CVE-2022-35919 CVE-2023-28433 \
-                        CVE-2023-28434 CVE-2024-36107"
+                        CVE-2023-28434 CVE-2024-36107 CVE-2026-33419 CVE-2026-34204"

