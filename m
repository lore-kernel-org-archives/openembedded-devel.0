Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3308C2A08D
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 10:02:59 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61073.1767607370709538792
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jan 2026 02:02:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DBmdp8GY;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4775e891b5eso56156375e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 02:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767607369; x=1768212169; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h8dGKymuSlAUn3t+gk1EZpr3Hqg1Q4Bxq6UorgRRyhY=;
        b=DBmdp8GY/VWq1qYSMjE5FQSJckXs/yfjLK0ptWFcejfO7BwR3hyPnTEiy/lJ+VYO0/
         D7OSN6nLRYP4LDS9gYR4YeuIEX4PB3x6ZvPBt3vseIKZsFduWh7iXzY/mzEbZZObP6+0
         glnuhvqiaMBDhxotm+XADNZPD1xrHfp0bcHwkkmwJ0OCvBwrwDmb7DZ4AmjAEBttBnLO
         +e9rwt84A/RsjB7hqpbh0Y1mgCTdi6pfz+M8yGNrJNqd2RG3fPy/b2Bs1LqNmFjvSGCv
         LIDz97nStyS7e8CNK0UwSO69JcqKw+y8WyLnvPk7Zr4SrHkOxXyZ9+4eYpkOn/xSTvsp
         giQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767607369; x=1768212169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h8dGKymuSlAUn3t+gk1EZpr3Hqg1Q4Bxq6UorgRRyhY=;
        b=Qdhr4uhyN4CqnRoNdtmBI2GFMS4pqOn55V8jW7dPmrR9QTfpu78suOR0UxvRE4jCAt
         jo0G2bPnSsUPo3SC7IRNvQSObplwcOJ/h0otAOnWrNxLGTbhp3YgCz/KRUS5ziHof1Tl
         VbM0NQcfhVhJP0AfiV/MbvgQpo55vVX/oiscIVaMXK/IrKM/VVcmOuauoR89XILl5+WG
         x2VLtfQTl9ZZrJmHAYUphFyWjmenF2pwf50iGzCUVnXd/IzFzH1Gbe1wFi33qAHdk09d
         S3b2+oFojAE96UrxenTmXC4r+Za3mxSfGa61RLmrXzov2lb9M2awaoQ6dH1Rr0DpAAY0
         G0fg==
X-Gm-Message-State: AOJu0YyG5+ah8J+XIjnJkbe6GlLtof0fQL+RaTAAE9dpXcVpt7vGwS4E
	HyG8GotD5NkQjR75RMR9Gio+77WRNU1Eo2/4xFsiPOPh9P2bqaxYZyzUMRoVjQ==
X-Gm-Gg: AY/fxX76UkdbBrbheGtnUfh+DcAV6vbxdg5ghpwXJZW6L9PApe6zn86K683jMvNvKGz
	f0Y/OWAhcswCSf1D8h35TM/p7J1f/nNkos8dM4P58XxsYOgTB5Mv+GNist9hGi182SC8/g+BOFh
	rxBR9zMAPTEvM0Ileds/bN1RPk26C4wP2aToJJGP/Tq4yloitZm8NBbmUyV8N6FH38PBr3p8KfI
	FTmx4pXlIPYeWDauIglGbp+oqDITeDUbuhLk9hT5caUB8D5ev0J05UHQryalsSlYLCt7EDfT7YP
	4i65fch1f0ADJqU5YS3yNHTQUHJj/mP7QjC+8H5zfTjAhghZjVu/NpQRbJPswqwDPdem+Ev0sAi
	HGzL2RHMn5WBe/5LIOx6Dsh49d1G2P63TkzdZCxzUbmog4JdQ1fvyFSxrrBKK/O/J4j+fiEpa5M
	wqQHSuNejb
X-Google-Smtp-Source: AGHT+IH1w4RWjFjoW7azTuBLVJ/+BhTzd9b99Jz3Im7WY8mtSujCBgVb+9VLfPhwZ2d9XATW7gyi2Q==
X-Received: by 2002:a05:600c:154b:b0:477:55c9:c3ea with SMTP id 5b1f17b1804b1-47d1958e7b9mr643886985e9.35.1767607368975;
        Mon, 05 Jan 2026 02:02:48 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d452be4sm144604435e9.10.2026.01.05.02.02.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:02:48 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][whinlatter][PATCH 15/17] python3-configobj: ignore CVE-2023-26112
Date: Mon,  5 Jan 2026 11:02:35 +0100
Message-ID: <20260105100237.3081345-15-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105100237.3081345-1-skandigraun@gmail.com>
References: <20260105100237.3081345-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 10:02:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123146

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-26112

The used version (5.0.9) contains the fix[1] already - ignore the CVE.

[1]: https://github.com/DiffSK/configobj/commit/7c618b0bbaff6ecaca51a6f05b29795d1377a4a5

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-configobj_5.0.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-configobj_5.0.9.bb b/meta-python/recipes-devtools/python/python3-configobj_5.0.9.bb
index bd4764f4de..4b9d4eae6d 100644
--- a/meta-python/recipes-devtools/python/python3-configobj_5.0.9.bb
+++ b/meta-python/recipes-devtools/python/python3-configobj_5.0.9.bb
@@ -13,3 +13,5 @@ RDEPENDS:${PN} += " \
 	python3-pprint \
 	python3-six \
 "
+
+CVE_STATUS[CVE-2023-26112] = "fixed-version: the recipe version (5.0.9) contains the fix already"

