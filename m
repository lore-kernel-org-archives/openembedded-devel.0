Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 153C4CAC5B8
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 14:22:49 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.13246.1758982961077748076
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Sep 2025 07:22:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IHgcIN6N;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-62fa99bcfcdso5881071a12.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 07:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758982959; x=1759587759; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=l9oSgaw1LMiSOiZlpCyNcaO/3PdUiV7GMEBTlX2ybcw=;
        b=IHgcIN6NwZKtwxsH5ONfRBFtYzA9lNc1/rm7946GLdrnlKTPkGLjiC+ib8eLKYbNuA
         lFg2681xb+gD32RIgDZ6Yyr3ixmX5PVVpw2CCmk88tA4891fTPI33N97L9eLa6MlqwmY
         xKZCYi/Lhf9VfP3KeR/SwQWCoAeSAgRZRIr3MgTUWR3qtN1/OMIGFQ9E77qNpaByGd+a
         OwJssDqXoNRXjyYtvfD0jdF6WL2/CcfBZSLj2cTyx8hr0mKjqv+OiSXseEywCEikC4Fx
         O6oTq1sJ1ua2W/sNr0aO2JVA8jzDD2g08r7H32z2AjDnq9/eeoP5yZZtiupJ1xwuBX2D
         19KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758982959; x=1759587759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l9oSgaw1LMiSOiZlpCyNcaO/3PdUiV7GMEBTlX2ybcw=;
        b=ZwnzkleC2U2uVtfqrSnYI7ZIqU2gW7vjdxkRUDowkhmvFiGXCrgUnqLSg9ge0Ectgz
         XiI/50944QKmFxl/aZyEyEu7XBfitTrqK1J+tecwlv+rEOkSz8wKAzRXNuIYcwiRDn44
         4Vc9Ya4Ew9FiuIvZgQEzLOdSli2tV2SbirWBizVbI0bvhCYwcd3AfpuEEWfhEkWuakrH
         YVwA0q18nZv4kWj5nrOd/JwEnyBvuD1Ed6Jl3GyiQcZpcsvMUscboaEzF5CXxhspxCLm
         WN6GoUz02nbhfbI40mU07hFkrUB2b54E3BGmexAcfjLdlS9LROg/e5jDFrVzajxCkZlZ
         mhKg==
X-Gm-Message-State: AOJu0YxPMl7kFsPW1DyrClpa7Vom+i7BAPPuEbkdWpmT39At0fXkNhtO
	qB/HvY8XqZLF1xZsPMwwebVqXdXzYE8uBMPB9XnnOo4zdY75zgS0245cDaSSEw==
X-Gm-Gg: ASbGncuNCfTIgdQo9kLo+SJR70t8rcfQ0hpnRceFDg2XcbMzMxkKitsG9kaHLVEvMO7
	oVbtDN58LYELny2w4T1cwZMhb0eESYCB8U3DRl2TDEStjSQFthxoD7aJsqwm/B6PHyMuyojsVmA
	rzdYOnEx8YAFcKI05ZeDGKH2/CRIwgymfKTaKJXBpXauhs3lXbNI19rhg1pWaLoLh5MqogVybD+
	O0Kix4+1HfJiMRq9S9XLsiVz9vOkAIsO566MFdB6fsyPMjPyT7/xoDYH5VkKrOTsgUrnaSuML/E
	Fq3EuAuXD+b+zloMGJ70Et15Grzd9vEJNIGIgRoNMS/kQU6MaZ2VIOJfdDzuthbxsWnrdfk1iRH
	w5PbSoTjBnNMfKtwGemGVjtesUzWWgIQ=
X-Google-Smtp-Source: AGHT+IGPTkUi88ALbhskvUzk5DFiV/7OjuslFtg0UIst01HgAx9TyUT9enXkSX3mLhaCQ7JwXPax3g==
X-Received: by 2002:a17:906:c10d:b0:b07:dacd:f981 with SMTP id a640c23a62f3a-b34b899a7c4mr1233540866b.28.1758982959384;
        Sat, 27 Sep 2025 07:22:39 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3ae61b7260sm111557666b.48.2025.09.27.07.22.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 07:22:38 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] collectd: set working SRC_URI
Date: Sat, 27 Sep 2025 16:22:37 +0200
Message-ID: <20250927142237.2718359-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 14:22:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119989

The project started to outsource the source hosting to Google storage
and Github.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/collectd/collectd_5.12.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb b/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
index 02f1fcb420..b826934aa2 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1bd21f19f7f0c61a7be8ecacb0e28854"
 
 DEPENDS = "curl libpcap libxml2 yajl libgcrypt libtool lvm2"
 
-SRC_URI = "https://collectd.org/files/collectd-${PV}.tar.bz2 \
+SRC_URI = "${GITHUB_BASE_URI}download/${BP}/${BP}.tar.bz2 \
            file://collectd.init \
            file://collectd.service \
            file://no-gcrypt-badpath.patch \
@@ -19,7 +19,7 @@ SRC_URI = "https://collectd.org/files/collectd-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "2b23a65960bc323d065234776a542e04"
 SRC_URI[sha256sum] = "5bae043042c19c31f77eb8464e56a01a5454e0b39fa07cf7ad0f1bfc9c3a09d6"
 
-inherit autotools python3native update-rc.d pkgconfig systemd
+inherit autotools python3native update-rc.d pkgconfig systemd github-releases
 
 SYSTEMD_SERVICE:${PN} = "collectd.service"
 

