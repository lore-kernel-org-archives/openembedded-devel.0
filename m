Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F369CC6B1A
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 10:23:00 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10232.1791973370698175527
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 03:22:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NNLTtZ1s;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so2018569a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 03:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791973370; x=1792578170; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uW6+jhFKFuGqqdAwNAMZNOnSZs2hTU6weL00EO+uQk4=;
        b=NNLTtZ1sYm79MyAbU+fvKv4Th98TjQH0ohAHYdqoGTn0TtVp7KPJ9yKeH375foWG03
         PBcWCY6OB8GvTJZqn0vLOmejX4z2eJDmu2qwkG2RZkpnD0Opr+RBkZsi+dAOzQb5yLMP
         d4TuYxAomQunccgc7XJqgYdLARAjLiBjkv8RZlKURaRa+cTjUeapiQc8pGqk6o1ahLhv
         KGTtYUqbXpv374JG1KftHzQ448RQcNQmkcsRKaX+CY6BQJHUjOJlzB9lDBeHRTThkah0
         BYLOkHdaJj87k7zA/fc9gfZRFjZGg4jCsIq0dFLkQirHoqKRQwa86kM3oEakw4GsruLS
         dWsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791973370; x=1792578170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uW6+jhFKFuGqqdAwNAMZNOnSZs2hTU6weL00EO+uQk4=;
        b=juW0iaOo5b3AxJt+hWU3iP2ke/k3AUiUvgecfmtzk297GvNzmxIGFKtkAdaH4eAIZI
         qOU3DGVI9LTOcg5vWOCqHhX8eIwCMDpEfcMgC7mYReyd98cPU1TaqrH5DjT5moDEun55
         i+8peW7sQJ0md7GVVBgvfbbWBT/ZPy2T7xzJlvOdjqD/XpaEHlZk5+9gJUa3bFcXrAqk
         ZnNU14AVRlsJWhJ2Bx1cBJGdZUVSJ7Bh2LMIU38KSNpIPXIg7PUo5vyn6qM9owoqK41h
         mgammPVzuC8K84P69PaQZKS2Me8E1UYdt7qcb0/hoMS/JDmZI9tgpwumFA2qIvHhBPg8
         S7ng==
X-Gm-Message-State: AFq9FYLAaseH8k3fEbRnsXWxtHsg10aAmAKJW3X59QNFbOR30RxAY3mY
	b517WNXbu2rU9Du+C5Lf1wBiDrc1I5pglkWBKoS29uBihVFaICjydwrPsVsqtA==
X-Gm-Gg: AYBFou3q6t0UHcNBH/dQSI4/h6+Ec14CabLmAp/FlzW+bdgU895lXEPggxkSZd2OnVQ
	pZTdZwYEMX6w8N/gqwgDrOtg/YAwfWKolIY4KxoQDpkOvDcwk1V6WaU6STPyvjgt1015nrm5RUv
	zF1qLjqbhpmRIzv77gU9VGlRQLT/C2z/OVTtDMwXc730XRa+xLmM1fs21dZgEzIisGNMYshtfvk
	sx/bsApLSn6e64vXZZy3Ah53xqAaCnbUiaizTjAYTYvwzR7vek31sMg3eaUbLVKivjl1cRg2ud1
	DAlTt2ZZwcOBGa25YodyBlTzc9S9gDxBVIS3z1BiI9AgHOjnr76axDZmP1vcMNNKhgmzZuQNSZZ
	fqOzWUlQmDm5CZ4DlrlcNdQDQ93kdhkR765BrSgm2fSFOqHpM4YUGqj2qbI6K1x3yMvh2QjEWlA
	aociSrDwxsTly2USkIWgsUrO/G0K/c8O1qj4DerEsEqKQd7EJyQqAJISrWKKsWsVP7iTuXOEnMh
	OewOw/Hki5qw+UDkPY0uFZKvwpCnAOrgy8swo0xTkXthuQjOQ==
X-Received: by 2002:a17:90b:3145:b0:3a0:22bd:6ef6 with SMTP id 98e67ed59e1d1-3ab3a3665f0mr12379562a91.2.1791973369806;
        Wed, 14 Oct 2026 03:22:49 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61170b7bsm4017740a91.16.2026.10.14.03.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:22:49 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 11/11] postfix: upgrade 3.10.13 -> 3.10.14
Date: Wed, 14 Oct 2026 23:22:17 +1300
Message-ID: <20261014102218.880640-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014102218.880640-1-ankur.tyagi85@gmail.com>
References: <20261014102218.880640-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 10:23:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130897

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
http://www.postfix.org/announcements/postfix-3.11.7.html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../postfix/{postfix_3.10.13.bb => postfix_3.10.14.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.10.13.bb => postfix_3.10.14.bb} (99%)

diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.10.13.bb b/meta-networking/recipes-daemons/postfix/postfix_3.10.14.bb
similarity index 99%
rename from meta-networking/recipes-daemons/postfix/postfix_3.10.13.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.10.14.bb
index 8bb7161e98..c9af8d82d7 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.10.13.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.10.14.bb
@@ -29,7 +29,7 @@ SRC_URI = "http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://0001-makedefs-Account-for-linux-7.x-version.patch \
            "
 
-SRC_URI[sha256sum] = "de6526fb11bbf20fcfa5aa4b67e88cc6b246cad614a9bcb4b006f457ba3788bc"
+SRC_URI[sha256sum] = "e378bef3212e0891d896867fc592b5991574bb46e3bfa4f768ab271a9f59695d"
 
 UPSTREAM_CHECK_URI = "https://www.postfix.org/announcements.html"
 UPSTREAM_CHECK_REGEX = "postfix-(?P<pver>\d+(\.\d+)+)"

