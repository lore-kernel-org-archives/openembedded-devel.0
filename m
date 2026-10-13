Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 254F4CC6B08
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 09:59:15 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3415.1791885552296354248
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2026 02:59:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=De8GdKg5;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so1263022a91.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 02:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791885551; x=1792490351; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5NIk/Kgw5xvOD+JQHcmNKy9sbOP7mjMFnU6Y9lu4Afw=;
        b=De8GdKg59eVjTOxNYJTMqpTFpW9lhRbq79f/odTvnXzY16YwJUl/6ujrQDZyQ2PWL0
         depXgzQpuRBvuYDYxIyT3D9jYZFGIdIj6SFbKdlf14cW2ucehe2ha9Abx9W71z+AelTb
         +2oMIOiqtaDMpkGJRH1jGlNGZTsP8U8zkVnaUig/VOwUqulNknxQtoNFsm31mqE4WqMJ
         /xE6c69PAlmTZCYCnCHE0jgzdoRVZZ2ruwGxgh4nd8Nh3NVJcwoD3kE7PoD46YO5tCE0
         yWUiG8HEpohu2pNexXpaFDIgGyqaBnhLl70/PR1jdZmSyidWIWXHjyFBUHerHwwlI0Ii
         BY0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885551; x=1792490351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5NIk/Kgw5xvOD+JQHcmNKy9sbOP7mjMFnU6Y9lu4Afw=;
        b=xZDjrbQN85Tsx0S0n1MHWbOjWt5c+zPAUHAN4ZCexVEg7pbPJejsrtNHsgXIRPGcqQ
         68gzxIVxOHS4a8OsjWVr7ma1kKRxipSdby8O3Kki+R7RZkojUGBR8REwMos+uYr9PXe9
         KN4J6mGScZl8XTyG6SDgApLXpyBjprDdI8u3Q8CG/Typ/tjC8PkXOzatYvHjMO7qWUVY
         INRxJZbJr115lNhJmmAsn1jBk9dIDF3ZlYv2Vfq88NOrbALQeOTLZYHAGH4L2FKYkAVs
         kIVf5y8rcLgF8B+uZhcW1mlxEXaVK0RmNuI7+v5MiTK9ssbmvH0wpPvMfl/Bzq5wbqLz
         dHKg==
X-Gm-Message-State: AFq9FYI7uQmVyFI9705a6SJLE39UTgmwWNBJ1ogvTbJdWvT6UPOyIQ6m
	o6rU0VtsNr7pTDGrUhot9mJU1jB7gYxK2MTAMxC+qRz5SAN1GsrNH90VW1W3IA==
X-Gm-Gg: AYBFou1BOdw81PFj57i7gsrLQOCktNKCEJt4aiVIZiH1UOxR7WLUV6KQ3atLQQEjUpA
	siUP6sNnxKYwpDJM3ETLX4Du2cP/yDbicq5ilgjxZqJyEuTdVNZpX5XE4k4m9RmSh/0SCbu5QXM
	fFhuRSPezvTCUXE8hfvbqYirHbbJIB4MWeDew+qJEyek/9a1QPdSgtZoGmoiN2vxWB6XO6OaKNX
	h+/joU+NDFSP5xaypwrGu5Awx3e8jZPmkaHnZxVBinx3DbywQlgreJ79ACoog7rjcsV8NtHIB2V
	imFWkaGUeQ1aLtelYORgYhxIevdkhiAXeI45AL/1/kW+nvHo4CWawnET9tG4wANTQjXCFNrXqNF
	wsO5QPcHzMBX+Y9qrtmYA/7BTD+/HRFWAKWPJPTFv9yC4T7crF31s+7ept5h9gsiX9VMBMdAyMl
	WsfZCCsTPbUVBbQOYGLpoJgTapqfn8t4MjW4dEbH3uwrcHcuzLPkR1UZbmyLtPB7qV0wNtzYH20
	K+Xlnxuqf8AR/wofEZV1fBeZUV6MiboCgWSXqY=
X-Received: by 2002:a17:90b:2d06:b0:3a4:b30b:b501 with SMTP id 98e67ed59e1d1-3ab3a32d491mr9173086a91.9.1791885551521;
        Tue, 13 Oct 2026 02:59:11 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37817414sm21282398a91.2.2026.10.13.02.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:59:11 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][blacksail][PATCH 1/28] openvpn: ignore CVE-2026-84256
Date: Tue, 13 Oct 2026 22:58:36 +1300
Message-ID: <20261013095903.3544906-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 09:59:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130834

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-84256

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-support/openvpn/openvpn_2.7.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.7.7.bb b/meta-networking/recipes-support/openvpn/openvpn_2.7.7.bb
index 604162a7f2..9bf699124c 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.7.7.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.7.7.bb
@@ -18,6 +18,7 @@ UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 SRC_URI[sha256sum] = "3ab8f48fd6c26d49ba2333a092433949afdb5c85c0e6a1ff265784fbc04a2463"
 
 CVE_STATUS[CVE-2020-27569] = "not-applicable-config: Applies only Aviatrix OpenVPN client, not openvpn"
+CVE_STATUS[CVE-2026-84256] = "not-applicable-platform: Issue only applies on Windows"
 
 INITSCRIPT_PACKAGES = "${PN}"
 INITSCRIPT_NAME:${PN} = "openvpn"

