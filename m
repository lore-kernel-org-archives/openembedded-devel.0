Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C90EC7EE2D
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 16:33:33 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.69134.1683477204636856567
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 09:33:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=sdrX/dq/;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-55a26b46003so54835587b3.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 09:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683477209; x=1686069209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8eR0WH6DUFZYWqOYUmG60FlDlw11GQUuR2YLaw48M4=;
        b=sdrX/dq/jtBWEXdfZvM0yDWgE/pJrvL9TXoFzWoKeHCIrO38nPalcexyPTfnpDqdC+
         U0nsNlI2uMGdb5ngBc9cq10gsZkSalWLJsaDHLsk13ARxQWja70WuANDVzYQZIo8iSfC
         MMTbQlaPhUMddOxfJg7p6eGdeaQS3SWf0Od33DOlWsKMmRxIAE0kCBRIjnJip2P9hqpv
         RcUjviYki89PhJUNHGp2atYBVmfsB+gckIlB5X2ADuk7ezsTDc5/dLWwK+1Y9VdCIlLe
         6Q/0K1sSWSKQb8FSySM/7mpQSzqI50an07b/nAXHhbmuQ6mLnZSIJD/5v8ScL6LWmd27
         IW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683477209; x=1686069209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/8eR0WH6DUFZYWqOYUmG60FlDlw11GQUuR2YLaw48M4=;
        b=SvoA1648WuN+EU0nj5HxzJ48b9bIG62zbwCQEPXYSHls2ez8m/vZcqZx0gztjRSV8p
         5mqsYP3Q4qqcOan5ERWlHHkRlR4MSsCAzpkGgdq3sRIQNJ3Y7AUlELXHIqeZzj6Zf6nd
         rGgCu0tSqIsygT+8RY/oW655C/asUcUfAw9xKTcBZPCPQuGUtiw047UXGNGmlEuvMGpj
         g5gaL1u8OHRZU7h1MCsuceaLnZTPZy6ls/XXxkPD76cds4vyb0sauMKcRpz0SDq1LeBb
         aznQND0KhWIcO3JzLFU9F5xV0WYbjB19XKRwjn/eKswiXLr2Dcwm0p944KqCmxzCWFiU
         Q0DQ==
X-Gm-Message-State: AC+VfDwpZhMqNXYIHrdyirWHMpA9oupmDMoLmzQ7dh+1XPqwT8fiyfz9
	4Z8B9yzE2FVIMmTCizHbssAygyywpxM=
X-Google-Smtp-Source: ACHHUZ7DhZkhxG4ccqrP/PbM6VjYhpTAwm2X45zboLZuHbjA1+iyOjI8Hr/5T583c8NiCYxONw/97A==
X-Received: by 2002:a0d:cc09:0:b0:55a:5870:3d47 with SMTP id o9-20020a0dcc09000000b0055a58703d47mr7941505ywd.26.1683477209310;
        Sun, 07 May 2023 09:33:29 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:b2f5:e641:5b7c:2972])
        by smtp.gmail.com with ESMTPSA id q82-20020a817555000000b0055dbeb68f7asm1113524ywc.69.2023.05.07.09.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 09:33:28 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 21/29] radiusclient-ng: Point SRC_URI to archive.ubuntu.com
Date: Sun,  7 May 2023 12:32:57 -0400
Message-Id: <20230507163305.3261044-21-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230507163305.3261044-1-akuster808@gmail.com>
References: <20230507163305.3261044-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 16:33:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102351

From: Khem Raj <raj.khem@gmail.com>

This tarball is not available on debian ftp archive anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit fe62e64c973730da0e385ddbbab8cdc3217e0e69)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-protocols/radiusclient-ng/radiusclient-ng_0.5.6.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng_0.5.6.bb b/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng_0.5.6.bb
index 4696c3baeb..6baa83e83e 100644
--- a/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng_0.5.6.bb
+++ b/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng_0.5.6.bb
@@ -5,11 +5,10 @@ protocol (RFCs 2128 and 2139)."
 HOMEPAGE = "http://sourceforge.net/projects/radiusclient-ng.berlios/"
 SECTION = "net"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/r/${BPN}/${BPN}_${PV}.orig.tar.gz \
+SRC_URI = "http://archive.ubuntu.com/ubuntu/pool/universe/r/${BPN}/${BPN}_${PV}.orig.tar.gz \
    file://Modify-configure.in-and-etc-Makefile.am.patch \
    file://config-site.radiusclient-ng-${PV}"
 
-SRC_URI[md5sum] = "6fb7d4d0aefafaee7385831ac46a8e9c"
 SRC_URI[sha256sum] = "282a9f1355f190efbb06c0d7c4e062eaa652caf342ed3ad361ac595f72f09f14"
 
 LICENSE = "BSD-3-Clause & BSD-2-Clause & HPND"
-- 
2.25.1


