Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19431.1793108991435019910
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 06:49:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=OltJIuux;
 spf=pass (domain: konsulko.com, ip: 209.85.128.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so20043185e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 06:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793108989; x=1793713789; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TOtryDQjzbfEWOE73qFYKHLGhrbcV58aSDjdJy7zPI8=;
        b=OltJIuuxG7pthhB+wfyNq72FRCWpp2GGi+WlqNyxE7VU8Dpj5hLKpbaZozZ2xcejh3
         9/EtPOTVorRVqLFZQ7ieoPR2X9LaHQ3vtAW/oFCg4LV246XFSRzZWKdZz+WcvVE4p5G2
         yrbHWBZXoesAdH1XIYsiDk/1O+ZsyGaTWjG3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793108989; x=1793713789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TOtryDQjzbfEWOE73qFYKHLGhrbcV58aSDjdJy7zPI8=;
        b=wi+mBSokqgmCc2hDTj1IL+kT6gwEbrq3usA9TbKogAlMuOxsVRgVfRbM7/44asPxc3
         IIDBLAD3wbhxFfEzuR2rhE7e0FyQ5mL5lHT/N1U8W5JDf8l+INLMOkwItbA6BK4OMy41
         HSFW3rE5GvjSD6IYBAjsyE933wVS1l0DKfRF5kPBwdEOEfkzHFOrljIDgOfvN7jqHMaw
         439SB0X3JDQ0q15bQp/r8eThO13k0ia3vpyZIaQ0NqVNorsGSR5g3a0JO1lqe4x7rt3D
         uGQyfPq0Gaf4bCOJrOn23DWnaQt+J7gnUFDTOyO2A0Vw3seH6hxVrJ8GdxscLUeNjxSQ
         NuKA==
X-Gm-Message-State: AFq9FYIjksKxlCVu0LSx7rSVzozjRpHA+wiGZcTiUgUpyibRIu4sFZOg
	Nh8CwsvJNeclqYUvbO+EXaUklBgxZD8X/4WzzNwpXlI8+szKAOklrWvKXDniM81+pjFiW6cbhHR
	H8WjY
X-Gm-Gg: AYBFou3TmbO+a2trpZodZv3jahzNWy7iSRdnLJMQRisU1ZG5hgNvEhcW6FEIbhl2CP6
	FL6rgneHnyzdMjFMoLLq0nQiS7Lkqvu2h0idXXYfw3yjkS/KgFZUSjHDjuaYech9MEgY2OVM9fJ
	r6je0Nb3fD4C1RKD+HSeh9iBOoXnUg/RUR2ikzMIfN4yBo6xOVmSHGDQlFnjz6pJ+1vKH97RSid
	D7V7ZmTD6L46ipiwMGQYxdhnLpuwfZFdfd6bqmPTrnxkpivzj0Jhe/lD6aKvrgMvyDU2v5QF8l4
	Gp5UGguWZWy0jql7B8GBqNKQJKUBwnluOMh+uDu3Jb3/BEtG5kundH7AfjZ+/oLPsBCrhPvEFIG
	9qmLWKHOQJnizfNUbwCu2dlKY/FSHhh0J/bvaPwbIWT1B217Bg2E8OPUbJQ5L+xoMFm8LHATPFe
	HnuUx3ZfymWiYK/hZ17NsfupBTm5DgmYWRv0R/CVvBskV5LXQkGrm4JzdY9jx4Je23K2SA1WHXc
	ouaK/yAK5EAd4n/hJj5efsShHFgs+im6RdVksq0M4WPMuacVoi6QpFrqAherY0ruzuxaBwiCiJj
	svcvKJIeGGZdLD/hWzYMoFCY41s4ePtfVbaB70O2nI+RjVHOXbi9vpXmHjfvqZV8qDLHDlI0VhM
	M93IT
X-Received: by 2002:a05:600c:c091:b0:4a2:150f:1605 with SMTP id 5b1f17b1804b1-4a5015ef800mr126997775e9.24.1793108989050;
        Tue, 27 Oct 2026 06:49:49 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0bae01sm330941335e9.7.2026.10.27.06.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:49:48 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-networking][PATCH 3/7] libmaxminddb: Upgrade 1.13.3 -> 1.14.1
Date: Tue, 27 Oct 2026 15:49:39 +0200
Message-ID: <20261027134943.1011404-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027134943.1011404-1-leon.anavi@konsulko.com>
References: <20261027134943.1011404-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 13:49:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131532
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.14.1:

- Fixed a -Wsign-compare warning in MMDB_open() that broke builds
  with -Werror on platforms where ssize_t is 32 bits, such as i686.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{libmaxminddb_1.13.3.bb => libmaxminddb_1.14.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/libmaxminddb/{libmaxminddb_1.13.3.bb => libmaxminddb_1.14.1.bb} (90%)

diff --git a/meta-networking/recipes-support/libmaxminddb/libmaxminddb_1.13.3.bb b/meta-networking/recipes-support/libmaxminddb/libmaxminddb_1.14.1.bb
similarity index 90%
rename from meta-networking/recipes-support/libmaxminddb/libmaxminddb_1.13.3.bb
rename to meta-networking/recipes-support/libmaxminddb/libmaxminddb_1.14.1.bb
index 32b3a941ea..df0eb03820 100644
--- a/meta-networking/recipes-support/libmaxminddb/libmaxminddb_1.13.3.bb
+++ b/meta-networking/recipes-support/libmaxminddb/libmaxminddb_1.14.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
 "
 SRC_URI = "https://github.com/maxmind/libmaxminddb/releases/download/${PV}/${BPN}-${PV}.tar.gz \
 "
-SRC_URI[sha256sum] = "a66502ea76eadbe17f2cd6fd708946777253972d2ae8157dee1b23a2fb528171"
+SRC_URI[sha256sum] = "ca5c87d41339f8bc4daabb53e8a9356b3c995f2d2419b85d7bff823b2ecc252d"
 
 inherit autotools-brokensep
 
-- 
2.47.3

