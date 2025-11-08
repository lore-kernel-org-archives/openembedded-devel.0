Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BEFACCFA18
	for <webhook@archiver.kernel.org>; Sat,  8 Nov 2025 14:18:28 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6315.1762611500664987714
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Nov 2025 06:18:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N7taNzJT;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-297f35be2ffso1935815ad.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 06:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762611500; x=1763216300; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cZjTO9vPVbHYGWc2hxZF7RTi/gidzw5S7PaTciy8O4Y=;
        b=N7taNzJT+zuY2lLFxBix2UDiu2ZKsULhLafSfvSiXiC0osCXE8pI4zUBZ9ETU4jCUt
         /Y9pza40txHEg8argdM3NnMm0x1Zj4U8UmPSNgBF3zRyBDj7J4kPwBlIStwpVdPs2y68
         g1s+Hw+tAeYcqVy1CgTJyfhNvU1O4gA9jR4qF3LTiBDCVu5AZMQtbyAQMrc6Ot6kxfbH
         hTBwyBCz/7mUE1Kq6CkPXEPaE9DqvaUa+rfvjEbKAS7wPu9rHDx3K4QD/CzyfJjKYltN
         g2hPMVQMd3rThz+PNhh2Z4xk5Dba3Hwg+p/t6r93RaXEwdOtk0X6dHjFhi4iJ9Lz0DAJ
         27RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762611500; x=1763216300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZjTO9vPVbHYGWc2hxZF7RTi/gidzw5S7PaTciy8O4Y=;
        b=SlJxVGTpOre4+hHCd6HD5Af8klcYvIIoLfHtJrlcFW1r3uHWWJ50XRsvuVdVhaC9Qn
         Rf2E/B0itcaDf/kKXZjalm70NtCr8NMOiagIgA0uId9Ib0uRA4jiX8QBfVH4E4ohhCOW
         eriRDP1ounDQ8MnSYH1s6xklHM0mAyC8Yq4Bh0urfZTc2bRmEQHB0/szFI+d83cRWoY1
         4qZnhj2F32/CX5C6FQVR8M4uYlSl0wwjcy5LcPm3qM4N2ycB7JkBUNkeROSmEYqrRO/z
         w7kR0jU9oghJDiJreJEwG378YBSSRxHucxEA9AMoOQeJEcyZWfJ+XkHWQF6Oyr9gxoFf
         rMiA==
X-Gm-Message-State: AOJu0Yz17RQbpLAIkZ+i4oBB19f8nA8Eh4VTH4N8w43VKKfCP3QflfHE
	IxfPVQAtKlEJk9zgRFWbsq6XYlOX4f5tUmGBLXdvdpG/XFDQ4doRURxL60OWX+/3FCY=
X-Gm-Gg: ASbGnct8lnIApqZRys+cF/YfwVZC1SSxHURhCA+nOC/8rqfxjqY0MyvAUpBk6FJzN9E
	EuzoCVjbGQlBAvBzlm12Xz95dmhdEXtAv7snU+i2hxNcRAxoDcIeuVNrA4YdjRI4n9svNKa3knR
	99uGbWR3HlltMYke/JlsEJ6Nxoj96ltnPW3aIEJi3DQFnPvM6SrM3zvdi54ta18dMNVRvtdXuLR
	cYjOUIiQ6lIRwH+2lPC8T5kTvZ3ILGGBjFVxhK7f15TO7czsBKT9H1bnlUIvOTCM8NolYn2WvNF
	26O4dr9Pd/uvR/KMQWq2Uyas8270NBTqHyXMGBsZSJKPyhmgVquPsGhvIkMtQf9PBE8QyVih3ip
	4WMErdi0OtZriySYZ7tfQl9xOv7jU7U0toVHdLEgPlfFZ43Pi8IvW29YwD38DeKYBE7NFZ32JUq
	tfDolbzush/5sj4VVotEIt8HLtPolZ5/gG73o+Xnce/MttwEQI+WTC9cEOQzQznA==
X-Google-Smtp-Source: AGHT+IFMUUfRYxAYuHj9SvuyPCrT3ceeOXt2KHHz0AaLMFZPSSU0Hcakfo1bZqKVYPakf74R+QZSEA==
X-Received: by 2002:a17:902:e950:b0:295:7806:1d73 with SMTP id d9443c01a7336-297e564cc89mr36747865ad.24.1762611499731;
        Sat, 08 Nov 2025 06:18:19 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650c5d506sm91050505ad.32.2025.11.08.06.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 06:18:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] tuna: Switch to PEP-517 build backend
Date: Sat,  8 Nov 2025 06:18:16 -0800
Message-ID: <20251108141816.4124780-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 14:18:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121386

The project has a proper pyproject.toml which declares the
setuptools.build.meta PEP-517 backend.

Fixes
WARNING: tuna-0.20-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-extended/tuna/tuna_0.20.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-extended/tuna/tuna_0.20.bb b/meta-python/recipes-extended/tuna/tuna_0.20.bb
index c647adbd35..044adeac71 100644
--- a/meta-python/recipes-extended/tuna/tuna_0.20.bb
+++ b/meta-python/recipes-extended/tuna/tuna_0.20.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += " \
     python3-six \
     "

-inherit setuptools3
+inherit python_setuptools_build_meta

 do_install:append() {
     install -m 0755 -d ${D}${bindir}

