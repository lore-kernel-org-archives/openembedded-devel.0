Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1877FCAC5B8
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 14:25:19 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.13286.1758983117336725089
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Sep 2025 07:25:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V8Oiyi5B;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b00a9989633so609739666b.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 07:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758983116; x=1759587916; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=oRv2MBDBtrboUevneLxLz1k4zttRKd/2sfJXfzbXPWg=;
        b=V8Oiyi5B3JGo6tgDrtfpYPDRh2LnHtwwenn9DXkPHGNsIS6BX5QIEoFL2Hqd/mvFtg
         yoknert0FygKwaKEarhUgTf6D0xHYSWjdR/mzV4T8pevPcS0B+ijdThPo6TVW717WQnU
         F58oFypUFV+7PAIxVB7WHk1i3bVboyfGmIkwQHNBGBzDMN9imOVquclIwha8XOIwRVFq
         aunkpHsA0lXJNshkFoAU+4p0uT9yoR0EKtzbkusiDglUVH88w7X1C3nMOwmIqD0ql+mh
         1UYhNXIjTXVNe9vCLLFe+VWN4bUW06Xy9PSofBNmG/sMPGfYxBAC7PpxnwJjTy3V6wjz
         j+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758983116; x=1759587916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oRv2MBDBtrboUevneLxLz1k4zttRKd/2sfJXfzbXPWg=;
        b=elTQOkOYZ44kNUoUy/9Srhi0z2EkiMzI6irnXupJ5bXkrxKfJEXfR0fcCAaAhsKbvt
         FZp0ufwJPs2wQsZOavSARxFtGn4KGYtGuXAw7XAPsdsTfUOe+wy61E13UeZ2Y/BADuxS
         sjRW6kBXWyixrUhLNkSnW3hb9nLafPK8qvB9cb2qkQuO5HH3UBPlbc1t8omJ1sNGYF2p
         puZSVZClYyer5kMIDSekugtyvVatDW3+39pnME8YdtRR4bICH98tBMvI9WxkN05Z6LZa
         xMfUmpzkFy1dcaVTmkjALHKXUDyl82HDaO5BXPaAPHqsF3D10Z9UQMJGF7ohhATsSjag
         RR1Q==
X-Gm-Message-State: AOJu0YzCnv+B9S+O6nBeGIYaMIxDWEpWB+35/EOm5Fux3XvhrfhkddtL
	gq0YGuVxIVx1sgffhzlkuRPNchlAy3W6/UIMBPg1vn9yOIRoH6MCqnY6L9XadQ==
X-Gm-Gg: ASbGnct83vRMFdTEsBSd/o2tqid8qogBuCBuofE6J1I/1dO7N1Dmt1cH8tgIoChWC0j
	fbH7lcBu1517yLB/O9ceMJOxVz471g2XdCud6ZIXc//66PblccuzmX5nqh6DuIQk5xFYyUk6bwb
	POK6cDmguoAhT4ZhlQSTXJnzopuSWarhj2reSBRFraQyiFscIxI6C8Zg2x3Mya8FDQk0rQ+t2FI
	7n5Uan3XkBhDqqwQCLVElcDgMywQf2x62RrNT7m75GMpPy4J6S847Dk4DVE9kAPEjHfFgArevSO
	y7a00JmFvFTzXzsuZ/oqRj8hCNSrKQv3jzcOqOoDV0LDnF0+Isl5gmg28/gRLob0PwZg0ELPsRx
	1/aRUII8s2wStqTVshVOg
X-Google-Smtp-Source: AGHT+IErVaJnq3UD3TnaHyAc63BhPQ6DCu1tUK7BvZOkp5dwIHTZm79ZxFzV2owh0tR50ZKE8SXMxg==
X-Received: by 2002:a17:907:f1ea:b0:b04:6f77:9cff with SMTP id a640c23a62f3a-b354c83d684mr1029132966b.27.1758983115569;
        Sat, 27 Sep 2025 07:25:15 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3544fcde4asm575640666b.76.2025.09.27.07.25.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 07:25:15 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] collectd: set working SRC_URI
Date: Sat, 27 Sep 2025 16:25:14 +0200
Message-ID: <20250927142514.2719542-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 14:25:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119990

The project started to outsource the source hosting to Google storage
and Github.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/collectd/collectd_5.12.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb b/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
index dd97796f46..77b75204f2 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.12.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1bd21f19f7f0c61a7be8ecacb0e28854"
 
 DEPENDS = "rrdtool curl libpcap libxml2 yajl libgcrypt libtool lvm2"
 
-SRC_URI = "http://collectd.org/files/collectd-${PV}.tar.bz2 \
+SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${BP}/${BP}.tar.bz2 \
            file://collectd.init \
            file://collectd.service \
            file://no-gcrypt-badpath.patch \

