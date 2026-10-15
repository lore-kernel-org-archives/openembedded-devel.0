Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D78ACC6B3A
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:44:49 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32846.1792043084032022471
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:44:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=k89P1jjZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e86dce4510so24893445ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043083; x=1792647883; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5NIk/Kgw5xvOD+JQHcmNKy9sbOP7mjMFnU6Y9lu4Afw=;
        b=k89P1jjZ8x1nejgwmULrJJLzVq480ikiDjb19U92Pg3yGtVue+GDGN3YEsjyciQ2Yb
         mpMZcaNDT+3H+eI5tsq1+SX2NXD4nuBVDFepklxcRFx0PddRAytD/VuaClJj7sYZFC89
         DBpfFAIbcQSG0oUt0oPDJ1iODZadUVx5pJRO8ueRTKsj4PZYidB3Mnsp6H3ZYCEvwU0S
         MjezuPOFlFMjVCxtZjWHnY+Z4LmLW4h7etpUUsqfLLYrO0ClN6tIpL0+72WcneLbTut4
         CSCyTTsafGNNDzBb0QChceJcCFI4Hd5wETv0DPBjoCd+0Tcm2RHLUqUFqYlYvhUz+PWb
         I0lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043083; x=1792647883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5NIk/Kgw5xvOD+JQHcmNKy9sbOP7mjMFnU6Y9lu4Afw=;
        b=UBufP2aIjmYkiE4HXMwvx329G5H7lRU7WKAzQ+06sSPk19ItcDyFcT+M0b+4IozwBq
         +IMQvy16ELR/PKf0FqWGgKAhBnU5xbc+aBoMFIAejmUw2+ch7K0PlyNqhNORGmyJkH4T
         4Yv3j3x5yfC3HdGoZFPtuGjZ29CkvD0WqnwVXywMZeM+QYZOc1ciBMV1M6ULGi7PtIU2
         58NCi8z9ujf+qgkfiaviUfb1pB7ZvNQNQ1PaMKo1h3HHDFHD5jlTsiQMgpL9NFpIW/RN
         tKQmW5Uo9vZ3FREvywsVkpY3JT1GpCADNPFbPkmnGS6pnF2qrR5DwBVfSU9AzXBmojFm
         4IaQ==
X-Gm-Message-State: AFq9FYLjcVMuyILlEU+c/NIdqoEV9GtlAUT0yZuujtDMSCXs9q5grwnH
	dRoIZbcFuflDLmWKg57836UkNkCuYXMdetmgJLmqtk7de+9xb+/9LlcdHWxweA==
X-Gm-Gg: AYBFou3RNV+/RDJnV/qUkr5fVocpO+m62m7gp+X510n/98y7I/sRKm/72Fk4VvHVCXJ
	cgIRPS/YO5fGjNUd8L6CT2eZx3U27VLZjjKC9gQ/MlCPlaTFtYy7hbUxe3UVBUYfD3CpZ5EYBTq
	Nf7DRnGau7xrqimOOGcFDZtrRMfhpvU1NzXhrpHTb+4mhIZgd/5uqUXir+OaYIdATJGVkCCponf
	9nBdRO9GfV/mtqMyvQFj5yC6g2iVKwMIAlyFkw5yC/Mfis3cSdV1sI8w7BMnbdE/vvo7yJsnDjM
	I8N4OXRBQPFBj/UbCcc690Pga/3mw/lendz7FvJqx2SpUmZDVIvTGNE6CFJWzygglBRYHZRfS2u
	g8Jt4KjFdK0p57COZsyLSqBPUr5f9cN33Vsl0eonSl5X8ja21z/EtVbNbgvxkOrpnwzvsmPaPWX
	r1xmxGT8OJmqvk5XIQ5S0EczaaXHq+AZG/fSYFk1r8R70w1Vzx0WbASZDmDk3/IbDp/Jauf5B9H
	PJXpZrS+GwJizQzRN6QHzw=
X-Received: by 2002:a17:903:3888:b0:2dd:ad73:c983 with SMTP id d9443c01a7336-2e842bc1478mr139844295ad.27.1792043083369;
        Wed, 14 Oct 2026 22:44:43 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.44.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:44:43 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 53/82] openvpn: ignore CVE-2026-84256
Date: Thu, 15 Oct 2026 18:41:41 +1300
Message-ID: <2f0a62d30c1ec36d867a16785c8859102e416261.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:44:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130973

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-84256

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-support/openvpn/openvpn_2.7.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.7.7.bb b/meta-networking/recipes-support/openvpn/openvpn_2.7.7.bb
index 604162a7f2..9bf699124c 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.7.7.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.7.7.bb
@@ -18,6 +18,7 @@ UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 SRC_URI[sha256sum] = "3ab8f48fd6c26d49ba2333a092433949afdb5c85c0e6a1ff265784fbc04a2463"
 
 CVE_STATUS[CVE-2020-27569] = "not-applicable-config: Applies only Aviatrix OpenVPN client, not openvpn"
+CVE_STATUS[CVE-2026-84256] = "not-applicable-platform: Issue only applies on Windows"
 
 INITSCRIPT_PACKAGES = "${PN}"
 INITSCRIPT_NAME:${PN} = "openvpn"

