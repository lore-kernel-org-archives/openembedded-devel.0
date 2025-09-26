Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D152CCA468
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 14:19:42 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.18534.1758896381346418898
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 07:19:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B9GrgVEa;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-634a4829c81so3312827a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 07:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758896380; x=1759501180; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=al2MGiM+7CANsEBE2WpeLMrqoPUcAo5duyj693lB2FI=;
        b=B9GrgVEaUwpkl6qHT0RAc/W/p4BJrMjt5Edfj26bM5j4BI3zM1ZMpO5smPVKfmvqki
         /Wfqgms1o2LNKlllacvu2Y7F6G9boX/Tv1eHWOpFCIAnRlwcIsN3MXNz+d2KRMoGTI+1
         JlI63IuNYVBegqUUpBv0w9KKNQGynoF8nIqoZIzaD691Q+1NYRZ9gZ9I1QDn5tcyLRsH
         8+JNlMaFtXGZ08m63JlVSuDhQI+5DVK8uyoj4tEdLra44H+LW97VV6p2Gbkxorw0rCwW
         YCDgy4OvK6lSsC3OiICITjfhtuCwpDr6GSR3Lc9hyPudR/oTGbmyqUBp4P3066/PZmGQ
         Odbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758896380; x=1759501180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=al2MGiM+7CANsEBE2WpeLMrqoPUcAo5duyj693lB2FI=;
        b=IZ8N5NB4Zsj//4ZHx8pKWWf3JCbjJfYdZPOiuOuxj5PL0cgfBjsqA2ZS+F93+9T6Ge
         WMsoh4UlAZ/I6jZl/wW6HZKSpQtyZfl2V7423JvlhRfSUcIpNxIgjzkLl9jedCcPowix
         u+3w440YEMfyu6K21iQU+3zu3Sr9tNTXBWUTl4FoWCg3TAIIVkoUrVOz34xdnQB6Gobv
         pE2ZUYHVlUJWD+HUaw3F1VNiUouWC9hEXNX3wDFpJbM7WSEhWbWkvtDV0yNiyBmE4IDx
         8xefQAq6n6EMXfDDiJljxy3LjLwZAbQCMeN1IZUenjIZR4LTTPJoqBzxGxx3cWeSlnjt
         8w7g==
X-Gm-Message-State: AOJu0Yz/HyM4ye962hj1tiQfBgRDChD3NJ39vYdv/i+bqQAJgwnK6MaA
	GE0s37qgXFquGN/hcmvbT2/Ao11/nBcl+GH76TmXK4VFIVQlauAPx85lHMTJuQ==
X-Gm-Gg: ASbGnctViDNooJxTjcznE0tgiPaDyuOF9xFPtoP3u2xa4E/nVdOBmmg9wOp5xPFVgM0
	haTGJo9k9IAyIXWeuZWo5y6UvOCf3svx8Zc+jWvJfnR92Pzh5Kosj3VlEDEfGZFdpTq7afQ988D
	c/2G0wStyPiEzDEkdfQRfMt/2wK24Dbww+UbohmKONj0T7hz3XYdPF12tPP3L9saZyruH1xiw1O
	ONAMraQp8Jc07afcSTs8ZBWJ4vId7VwgzYbjiWuf6suyDcFCuaOCuZF55n/9XXt5dxR7zQ4HAVI
	wr5pRlfJipubben3AcvOdHDSeVjwCQVQQHPrmAE86xqcGGIp3IoAjGjcZE7GyPTdJT2sR1FOWPt
	A2D+IZ+E776HafN4bUgF3
X-Google-Smtp-Source: AGHT+IEBs1UDXvCE1F29d2mGVZ6JcXzGs9foEEoia8P3xLWtNAyxz98YzybfUx0yJtRhDBPmWbZgcw==
X-Received: by 2002:a05:6402:34cf:b0:634:cb54:810e with SMTP id 4fb4d7f45d1cf-634cb548434mr420270a12.31.1758896379426;
        Fri, 26 Sep 2025 07:19:39 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3ae321csm3001028a12.24.2025.09.26.07.19.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 07:19:39 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 18/20] radiusclient-ng: Point SRC_URI to archive.ubuntu.com
Date: Fri, 26 Sep 2025 16:19:17 +0200
Message-ID: <20250926141919.2010846-19-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250926141919.2010846-1-skandigraun@gmail.com>
References: <20250926141919.2010846-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 14:19:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119927

From: Khem Raj <raj.khem@gmail.com>

This tarball is not available on debian ftp archive anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit fe62e64c973730da0e385ddbbab8cdc3217e0e69)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
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

