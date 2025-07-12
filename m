Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 706ECC83F26
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 17:26:57 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.40753.1752341212738169358
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Jul 2025 10:26:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AesbN+ne;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-234fcadde3eso39090455ad.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 10:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752341212; x=1752946012; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fkj79RbIn50Ud6qDdkTn0s0cU8BnMS5KF4/dMEJCU0w=;
        b=AesbN+neOpxcG23ZOGe3neNZPX2+jW31wWsMxVE1YZ8/oV5kxnsxyTYrnLbxs0fs9C
         frjzpIWeEEZ4IWriABV73M5kLavnK2FIKJeKIkFkJPqPV/xv1/dmQey6qbhDfc0cjO3Q
         v2s+XA2gjDalbhWYRZg0S2Nm9YkIR97eKwe6iqweuMsUCz2/0fDhi20DA+JqlK5Jftxc
         nITmPl2KsUEeiz+aDz/Mos7I9pXwciDw1TRnF8L9ww8T54z1jOMgrSt6dW//TY/X5PaP
         oe8+EMqBhf9RFLkoCZhYOS2IV38LaBCdkyp4UjfMcz/o0xkEYItnZXZ360vtCD7WAD38
         YfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752341212; x=1752946012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fkj79RbIn50Ud6qDdkTn0s0cU8BnMS5KF4/dMEJCU0w=;
        b=E/pZs3+Ei0x9ZfLPvT+SJGcXfGQjRLWLK2N+XR8Js43SMrfj8evAHGX+tmg0wQC+4S
         aIJFq/ZAeymXlCUCQJWXCZfE/vau2hDmiwv2LkLiWJ1c5WagB9JY3RHLlDEa7ckSJxm6
         vShx1xiZzPXcSBQ8iA7BL0kRLR/QpTJWL4Cw9pUSgwsQO1UmnEWh6rUVF2sRN9bDNOZs
         hKoAEofKM6Z6TMJKDEXsKkk8q4+EIRImAwPvfxZww1BxO4azmg/LgU1vPbP4GiynjfyG
         25Qu+gdzi+5POX/M0ANz69lE2S92WVnA5VuLr4VfBt2Xyaoe7hPsHq/mAO1TP9PtGmVu
         l5Gw==
X-Gm-Message-State: AOJu0Yx79WRzWr4neTq3Nmw4xoNXXRkvkv/CiUIg/sff7xle3th7fPcQ
	AljBsxZCx5VxMBAzP2FFGFYAY5U3T9iJIWTgXBApbmvvZV71SlZxvFihVULtLqxq
X-Gm-Gg: ASbGnctoMH4JHn22IaapBXPZujN+dXwy56ChidYwXl/VC1kZWRbhEE4vSVm3KnDkE3O
	0aBHIqGJMh3EDhJxNIvIlSaMMb6PKxKaTkJ/J+MqoCesy5lW4R4EEpdfqoMj2HWhm7gXsIllael
	DahYUQNatk9dCIWEIzl0BUb1BeI9s750SXpXizIrhaayTvXjlyrQPP7v1WZdwaaycdq81pimZiR
	nxLJCNJYcWbcxL8zhP3wOPVOtPbtAk62pNdLRitFZtnO5IyzF4iCFJmyjQv/r89ymjxvOUP6nJU
	s4f6WG/wzQOWLSOeePnFEFOyIL1BTdw/T6ThevHbL1ayeSh/Vi3Uwd/UhhspC30Sa9odu/gIz4/
	epsDW58BhZZzUoqbXj+1gDSFR
X-Google-Smtp-Source: AGHT+IGnZUsW37iLfS1cl86qqPZgZeLS/PHnNZ+TTe5cEPqd99Bby2E+pWthyIEzWn5iW3BA1b6ckQ==
X-Received: by 2002:a17:902:fc87:b0:234:b44c:d3c8 with SMTP id d9443c01a7336-23dee263c5emr108383485ad.37.1752341211753;
        Sat, 12 Jul 2025 10:26:51 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::1c1d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de435c2e3sm67021875ad.226.2025.07.12.10.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 10:26:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][PATCH v2 3/6] classed/xfce: Add XFCEBASEBUILDCLASS
Date: Sat, 12 Jul 2025 10:26:43 -0700
Message-ID: <20250712172646.3899204-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250712172646.3899204-1-raj.khem@gmail.com>
References: <20250712172646.3899204-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 17:26:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118481

Default to autotools to keep the present defaults working, it allows
building xfce components with meson, many of newer releases of xfce
components are using meson

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-xfce/classes/xfce.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-xfce/classes/xfce.bbclass b/meta-xfce/classes/xfce.bbclass
index 6b3d0b0d0f..21136742c5 100644
--- a/meta-xfce/classes/xfce.bbclass
+++ b/meta-xfce/classes/xfce.bbclass
@@ -7,7 +7,10 @@ HOMEPAGE = "http://www.xfce.org"
 XFCE_COMPRESS_TYPE ?= "bz2"
 SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.${XFCE_COMPRESS_TYPE}"
 
-inherit autotools gettext gtk-icon-cache pkgconfig
+inherit gettext gtk-icon-cache pkgconfig
+
+XFCEBASEBUILDCLASS ??= "autotools"
+inherit_defer ${XFCEBASEBUILDCLASS}
 
 DEPENDS += "intltool-native"
 

