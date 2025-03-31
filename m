Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23F2FC36014
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 21:01:17 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.3828.1743454876612034618
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 14:01:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jd90Y96D;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e6194e9d2cso9479148a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 14:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743454875; x=1744059675; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J5vWh+ozDj35zPXkbjq1OwtKeIMVXhIc9Pp9pmsOEsQ=;
        b=jd90Y96DdHoh7W613Sv95e/9eKLfPZpHY+MY0FHc6aq9ix2lEdEY0nwk2T5R4vLPzy
         USkhesDZtcqpIJf0HpH5Gsx9lwI30hjzw0v4ECUhWtYbc5fD+o60RbxObb1P7ai3j0s5
         jOk38yFICP3NRy0MOQVd1rH5zCeyoxMHyZPcHJ4xpMj5bhD5IdNHY8kcJsA+Y0qlM6UZ
         N1QG8ct1PCx3Uh9OiYryvtlBBmOcGBBNiB36ISeA9k/F8844IJKY3Vf+zxlCXWjAoxM2
         rf95xE8Vc5xkTmgmIrNj23sfTH4WxVPpt5XP8r1mt4oIVsWBvgKfRSXwm2G8LBsEsUQo
         ndWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743454875; x=1744059675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J5vWh+ozDj35zPXkbjq1OwtKeIMVXhIc9Pp9pmsOEsQ=;
        b=l9smklYl5iO2GH06ZHE5KE2wWWA3dVEgrJ4nxI/3HMNvqxkGqFRTjVGTPTDBP+3afd
         NecXQ5H2RvaszYIm5iuZDa3iS3UpDKTuxnaVHjZ09JlHkI/+2WvfS1PuM21LUYb93TtW
         3vojJo/I/khK3U/04F8I/kNo1FwPb1BOd4xBIOugr+5CB9VnLO7nS1+PG3vlPeueFdj8
         iF6z1iSrsuRrst9KtTJ7m6nS0ag2IAWh0MuDtWm7htAONQVNuo3tnCLowMMON3cXXcUL
         1daYDZXu6bDDzZIphX56Xm1DJFrKiXsoXXLgSo7hOQKYZU9rkLPJ6x2DfD1C2hyTLAdO
         YVHA==
X-Gm-Message-State: AOJu0YwjaXdEHh/hiXTKNXLNdN/+QXMZPvdQvzifmykGmVofEb21HTtT
	XXHG6yEAILpcCk0hPVBVZMbU//BxfB4G+4R4YthPRO2QNsnjTy+fUia65vez
X-Gm-Gg: ASbGncs0EVrFyoou3JPgsuNswrTleRfsrNuxr4LxlDv2UZP7z+oWIg3wIzlYz+wuQaq
	DHkOJqltnHsEDq/nRgugT19WLsf48g3fwqap/pN1QongUmpz++AJneNUaTEY87TJYtUf/Gjqwfb
	kpgZm7af5YPI4wyqO97Wq1MK8FLdqvx9317AMzndGGEo5eaVjzt7iiLfdy2SNuB0Gs384E6clWl
	hSUWAi0l6c7rSHa/I4Yimq+0nGQ5Wi73m+qkX7DI/GRBWvQLxi8p7XHs3zy4LNlrv/kJPWmRHnk
	DtoKVp+zhy5cnd5oXAJUNpyuFUFYzxzOjMTRVT2c0P5XfNo=
X-Google-Smtp-Source: AGHT+IERCHWNqhykLBemFBzzMc4ESNaMcv4ApWzBhgGaS3EUCMlxQ2ATBoUGsixpynmgWQUD45r8Lw==
X-Received: by 2002:a17:907:1c8b:b0:ac6:b731:965c with SMTP id a640c23a62f3a-ac738ae6ce6mr789237066b.23.1743454874898;
        Mon, 31 Mar 2025 14:01:14 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac7196988edsm682353566b.145.2025.03.31.14.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 14:01:14 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
	alperak <alperyasinak1@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 03/21] rdist: Fix contains reference to TMPDIR [buildpaths] warning
Date: Mon, 31 Mar 2025 23:00:43 +0200
Message-ID: <20250331210101.3460858-3-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331210101.3460858-1-martin.jansa@gmail.com>
References: <20250331210101.3460858-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 21:01:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116439

From: alperak <alperyasinak1@gmail.com>

Pass OE cflags to makefile

WARNING: rdist-6.1.5-r0 do_package_qa: QA Issue: File /usr/bin/.debug/rdistd in package rdist-dbg contains reference to TMPDIR
File /usr/bin/.debug/rdist in package rdist-dbg contains reference to TMPDIR [buildpaths]

Signed-off-by: alperak <alperyasinak1@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb b/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb
index d81cc9a3d1..e6d99431be 100644
--- a/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb
+++ b/meta-networking/recipes-connectivity/rdist/rdist_6.1.5.bb
@@ -38,7 +38,7 @@ DEPENDS = "bison-native"
 
 inherit autotools-brokensep
 
-EXTRA_OEMAKE = "BIN_GROUP=root MAN_GROUP=root RDIST_MODE=755 RDISTD_MODE=755 MAN_MODE=644"
+EXTRA_OEMAKE = "CPPFLAGS='${CFLAGS}' BIN_GROUP=root MAN_GROUP=root RDIST_MODE=755 RDISTD_MODE=755 MAN_MODE=644"
 
 # http://errors.yoctoproject.org/Errors/Details/186972/
 COMPATIBLE_HOST:libc-musl = 'null'

