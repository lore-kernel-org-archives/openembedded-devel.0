Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D14E4F34C7D
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 18:02:35 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.279318.1776103351798665532
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Apr 2026 11:02:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WzieEcxp;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488971db0fdso46841065e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 11:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776103350; x=1776708150; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p1NtRZWv2V60lVoqqkrvRHf7gEgarcsweskfDJGuLeM=;
        b=WzieEcxpDV1+KbIrxyd0Wp6KgTehtgOtYEsyQBhhywOiUO4U8BMPk39PJbkuFOwShP
         MGd2qHWcvxqABrz9M6/hEHZlgBmabTMgtPz3Ro4bNUdzdKKaAlgE+8Q8HZ4vSWuBzt8i
         c7UcdNsGQC9ZNT2p1T7MYBA8+qHK7q0lA2pertFl6yM6K+/l4BL5VMmUYPgQ8MT5IcQn
         CN69NCe+v1S7GRVcDAp89sM80NwU2UdHe8FIHZENq2S/Xlz4nqmjgd4A3e9U1+R0SNmz
         LVsvsyzLZvq+VIDzBZ5JRUCI/G9mJ+3UDY1rsa3P2DIs7hb7rQ0E/Ce8mw/iuoyd7D15
         Fh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776103350; x=1776708150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p1NtRZWv2V60lVoqqkrvRHf7gEgarcsweskfDJGuLeM=;
        b=Y6IwixlezD5q8gv1jIwCnEr/nCdvBVkftXXgJkxDdUQkjUKm6/DEskWB3JfVUex5ud
         5VewuN6A9rVZ1LbyoXINrFGYDnE/3OqFKz8pOhoIj14t6IedXtkGv7E414uZfwXMAB9G
         VFKGk7PN/lKuN+nQrvqajtu25RO9L3xODdfgtg0hCT+xW7N2fSG//PunrprNr9C1tyzb
         qZa+/AN70AFVmBrwfI61RSx/uVK0dBGmw5lkhrCHhF6XQ8o9RqVnq/qCtHN+P5LFy4vk
         xcQGN6MYTsEmxXE7tkmy6A0xTHWiaj9bqzp106F2Wr/WtsKz97Olc6FLo/iWj6dkEOLe
         N4+Q==
X-Gm-Message-State: AOJu0Yxdw0fdo2DJo+ObHwJ1L/t1JnEESmaBsLAmDSTK03QrA+FqDVKd
	HF8SSgLGQ2tSsf8w6XNJuuB8gxUVkoMcZNOJSz3gE1UXmPgxJrThbACFparcfA==
X-Gm-Gg: AeBDiet9fT7I4gqjduUuhSgkZSicUxyCFs7uEqk2WTKi2HcYZhyHJ4tmnoieWrw+6I7
	efWYByyTPVWUka6cs4xdXH1u9KWxCVunM95ASBVetyBqGc9cd5ACgF1HM61r4NAZnV8CfnZS1uM
	O21npy6XzlSq62u6MZ342XCtJrf1QoPdqxoHRjCYDhCqr1RdcRKsP/PBkdxzhza2PyyDyDpvLGl
	GBqEYlB8gpTJaovbVYeWyxLCCwYQwm9di8XKser1lDEN7Y7afYiOO6I1rjXQONfiHx0VK6rMLNv
	OT8oDbDbItQ3wFH9YHbksYpgqVPm1miaFM3s3IyVou3b7emY2bRBP2BLN0i2LCVHbW/EcTziQoZ
	haPh3eLHiX68w0yI70urvPLC5nC5vnZsxtUlAz/3dZoClNkHOSZsjXPFtfXIkQtlFG6KDan37K7
	g7r9QGFncTfcUf7tCUU3aCG1j/vGR2d34=
X-Received: by 2002:a05:600c:4e16:b0:488:966f:70a7 with SMTP id 5b1f17b1804b1-488d67bbc7emr218203035e9.2.1776103350122;
        Mon, 13 Apr 2026 11:02:30 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d762decf6sm20841686f8f.8.2026.04.13.11.02.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 11:02:29 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 3/6] ez-ipupdate: add CVE tag to CVE-fixing patch
Date: Mon, 13 Apr 2026 20:02:22 +0200
Message-ID: <20260413180227.755337-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413180227.755337-1-skandigraun@gmail.com>
References: <20260413180227.755337-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 18:02:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126283

An already existing patch fixes a CVE (CVE-2004-0980), but it
since the patch didn't have the CVE tag, the cve checker did not
pick it up.

Rectify this ommission.

CVE details: https://nvd.nist.gov/vuln/detail/CVE-2004-0980
The same patch is used by Gentoo to mitigate this issue.
Gentoo CVE advisory: https://security.gentoo.org/glsa/200411-20
Linked Gentoo bug, containing this patch: https://bugs.gentoo.org/69658

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-connectivity/ez-ipupdate/files/wformat.patch   | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/ez-ipupdate/files/wformat.patch b/meta-networking/recipes-connectivity/ez-ipupdate/files/wformat.patch
index 3b791559d5..7463e3c535 100644
--- a/meta-networking/recipes-connectivity/ez-ipupdate/files/wformat.patch
+++ b/meta-networking/recipes-connectivity/ez-ipupdate/files/wformat.patch
@@ -1,4 +1,9 @@
-Upstream-Status: Pending
+
+This patch is used by Gentoo to mitigate CVE-2004-0980:
+https://bugs.gentoo.org/69658
+
+CVE: CVE-2004-0980
+Upstream-Status: Inactive-Upstream [last commit: 2002]
 
 Index: ez-ipupdate-3.0.11b7/ez-ipupdate.c
 ===================================================================

