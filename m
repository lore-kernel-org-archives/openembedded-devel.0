Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7613C28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 08:13:17 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.31631.1741767193877492215
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Mar 2025 01:13:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QCye6TKq;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-224019ad9edso143016285ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 01:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741767193; x=1742371993; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wvCvm8RIVmd00WkShqkivrz07RORXtPh/3afUahyU9k=;
        b=QCye6TKqiN6w0L3h5Rix2WMVt0t2mDO77vhQ1gYtthib6DNDI4TeX+fx08j78No9V5
         xLASPklHsmBadfoEFcfKMsbWRADeTcDFt1Acrcson7mZuOhkQkDNuxpBM0RSFP4jRAT2
         shJG9njxPOdmf0y6Fh11z6y8LS6ynxI0779ODiM8UrpdtrrwLM0BYPaIVQ+hBWXENr0W
         WKvNLrRSB2l0Z7fHtYb/oDBBbCGklYRnRFpll+E9d503y0OBrfOl5A/NMwOzDjEsCth8
         JJtf03YYTf/hSCRlfLVo0zYXX8ARaZeQHvyVysyvVOeREM0SMD3c+slSbthp0bXeo0sr
         l+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741767193; x=1742371993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wvCvm8RIVmd00WkShqkivrz07RORXtPh/3afUahyU9k=;
        b=UeKTNYU9nBHsQEgkx0KpZjjsd/cTuvR5iCapiD2dqGTQMolw8X8MZpmendIUjMS2i8
         LvKNxPdaRaFsMN45fz16QWgBwWJ8T4kJtJoMHi6SmhdZfdIfadOZNxiPcyMKCNHDNqrk
         Acnn/3pm7vOyFyvuY8R654p0mUz5GDoCyJ+Q5G6h2t0eOkIukfKr8XDUiaBLQX4RwRMU
         WWy7Yzc3+N9/B2GjAlEXArBzhtkjTIxKMUmjzxedV+0Ul5klAkoWZBBjRBtuCRTkaoG1
         QK0ijcdEUs/a+Xx4Tt79FSc1uSOD14xWoTA4ah9+C8CKxije1d3yfb7685J7dnIkNl07
         2t7Q==
X-Gm-Message-State: AOJu0Yy1NbIgjF1F81nOaCeODHTRO2kTdJiV34WGqwSUIuzCgIia9pmH
	fGMyubTgoevzdfTHGps4TjI4GZAOLnlNUKwe2omKFB0I4DhZ3cm6TqAxPsfo
X-Gm-Gg: ASbGncse6nmsT17l0OvvdTOF1SCkGpK0ZNwlzqXXYd4zx+DUnwxtAv7KmA1AkT2wf21
	3oHOtkSo0UV4ekbJENWDO0CTo1odzXG7vcDMk+8ODoZw2XYR+qb6Pn8V5U4tZw+tdtMfTC87voS
	ctfG6JFLARduxS7XT/5Q0zmuQXosbdnNTQjMV9QGXGFq6aiRbSRluNPFDGkRXKfw/b60up5+kht
	XHhI+DU8pD7PvWVl7KgsaAJ7A2oOJW5YalEQiEKzUDhcWEiCTC101jygwXwjr5iFMLudqVkdEhy
	eHR0RVUxBy09xFIwEl6WDmWG+VH0aqZNKpV1AwhvtXJQ/vY=
X-Google-Smtp-Source: AGHT+IGs7qME7/17DwIvrgLGAplFIqAmsLHHBsSLe9qC8VdCBmNcOd+Yq6/2Atf2jWfidHwvrJ/k3A==
X-Received: by 2002:a17:903:283:b0:21f:1bd:efd4 with SMTP id d9443c01a7336-2242888ab0cmr337476145ad.19.1741767192900;
        Wed, 12 Mar 2025 01:13:12 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410a7f5dasm109986665ad.137.2025.03.12.01.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 01:13:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/3] grpc: Upgrade to 1.71.0 Release
Date: Wed, 12 Mar 2025 01:13:04 -0700
Message-ID: <20250312081309.3413533-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 08:13:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115913

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/grpc/{grpc_1.68.0.bb => grpc_1.71.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/grpc/{grpc_1.68.0.bb => grpc_1.71.0.bb} (97%)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.68.0.bb b/meta-oe/recipes-devtools/grpc/grpc_1.71.0.bb
similarity index 97%
rename from meta-oe/recipes-devtools/grpc/grpc_1.68.0.bb
rename to meta-oe/recipes-devtools/grpc/grpc_1.71.0.bb
index f47a933afc..6b1a6e5453 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.68.0.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.71.0.bb
@@ -24,8 +24,8 @@ RDEPENDS:${PN}-dev:append:class-native = " ${PN}-compiler"
 # RDEPENDS:${PN}-dev += "${PN}-compiler"
 
 S = "${WORKDIR}/git"
-SRCREV_grpc = "6b49ae626bc9cd7033e062f89dbe0e0576b1110e"
-BRANCH = "v1.68.x"
+SRCREV_grpc = "4e9357bca1408596663a218c0c608a4c0560a867"
+BRANCH = "v1.71.x"
 SRC_URI = "gitsm://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
            file://0001-cmake-Link-with-libatomic-on-rv32-rv64.patch \
            "

