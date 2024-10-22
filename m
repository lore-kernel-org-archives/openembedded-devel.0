Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BDA2CDD0E1
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:31 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.21798.1729612101985029504
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:48:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BPVWUS5D;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6e38fa1f82fso54605467b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612101; x=1730216901; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQc+uellf07l+GiSG2RjY8TiTOPqNpC76avou2lzba8=;
        b=BPVWUS5DdH6/FAlmlVZiWcf1eoxmxABVGrgvJpkNwfnDRApalnnHkUwwX1PpsfB/NN
         1qZ5HqLTZTN0nHmyRDu3IntGlkMzJDsJ6gmlvtoKc4bzGP2uQVSU+ZXcy7LOBzXOPPnq
         BURebWnBq7XD96QvaGK7wm6kdQ4PQq23dKwBxB0BQFrT+z3a6fTBukU13dX9prejPvQk
         Y2SynJA3kHO5iFHLjapqkXi6ZD7jqPi7nT5cLgVqCocsfaD7EvXwL+gkJW5+ATqYy5e2
         T1rO5vrBTxbCn/+ptn5iIpUs85CIgjQ/o9LH/cNl6dmEVxC2xtkmp4OdDcEVlkOq4dI5
         L0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612101; x=1730216901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iQc+uellf07l+GiSG2RjY8TiTOPqNpC76avou2lzba8=;
        b=vparZ8EHOUHzOGiCbzygrVe15BjQMohImn2QQdC4h1EavH02Rv3gV8FpAPwqk7l2qR
         Td5Bslp6uaQDrpv8EtHazPkjGcoTBhADLR99MfSNDdYTsQMIwtljsVViNzbp+GwzGcZi
         ndPYC/uhhFkg2upWa7ZXgSiM3bJ2lzK/m5ct4j3F8+XOmdn0UgEWVshsnP0YHzKXeP3o
         yvRIw1IoduILgzH7PC8IoZFJmcLR17ZThosF21qoA99g47LshKGzMVWvOR2zzM2yR7p6
         kV64HIGJ8tb+UcPQ1Raa3xvt/iuTQ4nCxmtUcumCBDRMRgkPNbFwv30TX9j2j09nr5Vt
         SWdQ==
X-Gm-Message-State: AOJu0Yxxa0rm8TZeoW7EFbnMdW7GFZ8HK00J8e5V/dLrhwQGBLfCWhd/
	xn2Nr3aiii6ND274JWgJGyXbYoH4uzyCZAdquuuBZHZ2ZXlB+0AfHaxXjg==
X-Google-Smtp-Source: AGHT+IGEsr6J6hXWA/GhMT1hmBqLYm5TiF6ThUZ/0bwxbpNtdY0k0STo9v3XykeIGktgbpXzod+p4Q==
X-Received: by 2002:a05:690c:dc8:b0:6e2:f61e:8c9 with SMTP id 00721157ae682-6e5bfd4ca84mr157084447b3.30.1729612100606;
        Tue, 22 Oct 2024 08:48:20 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:48:20 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 40/46] libtext-charwidth-perl: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:44:58 -0400
Message-ID: <20241022154729.20331-41-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113131

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb b/meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb
index 29118129a..e9a2bd474 100644
--- a/meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb
+++ b/meta-perl/recipes-perl/libtext/libtext-charwidth-perl_0.04.bb
@@ -17,7 +17,6 @@ LIC_FILES_CHKSUM = "file://README;md5=d8d54c8c500cbdd57a4c15911d9d96db"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/K/KU/KUBOTA/Text-CharWidth-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "37a723df0580c0758c0ee67b37336c15"
 SRC_URI[sha256sum] = "abded5f4fdd9338e89fd2f1d8271c44989dae5bf50aece41b6179d8e230704f8"
 
 S = "${WORKDIR}/Text-CharWidth-${PV}"
-- 
2.43.0


