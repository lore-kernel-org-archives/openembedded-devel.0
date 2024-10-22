Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99DC8CDD0F8
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:31 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.21951.1729612094002453410
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:48:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B1yAioV1;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6e2e4237da4so53131737b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612093; x=1730216893; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2fGGPOi2xN3KXFq5dCKIDziyYCE0d/2CWGx9EZubDqU=;
        b=B1yAioV1eDXWSqVwislALW7p0/z0r7iz7Mn9lJFdRnfXQ0mML4NBY6kKANIGp+77zD
         KScxhr157DxXu/1oQYRzHz0qCGpFmVsU3eRX/Bn0OBp0ICcI8OXI0/i+kemjyRgBs5sd
         4jvP9l6WVxj19UmTNRFckirizawmrfMnWTM1RvckdaT1KFAZhSmsevuy2qZC/VenMHyy
         lkuB0IDBCN0y1f3YxohY2Myr8kPWOpkonfueQ4hWr7/PVotHKbMnTu6uzzeCOmzbPfwg
         qx3yT/tjQd9qEPpjK1W/3n7quOvoyC861T5KoN+X5Ov1lVMQwbYjbbJHtfpYVhYelFjw
         CLhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612093; x=1730216893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2fGGPOi2xN3KXFq5dCKIDziyYCE0d/2CWGx9EZubDqU=;
        b=USPkeOsQE/aSHKtXgsVQtnCOrXu2oAOoPrvFTqWtvr+/fwbrqE8ypm3qDhlmeGhctB
         OmLmjY5hNej/22r/wps/pcFt5OHl5d/zI3SmYfMqQ0I+UgWmQprXx/txanSR6uQYOQ2y
         flFvKL3jcBR1jo4FoE+YX8ghukc1j5hf7Fh+4k2VwUAbOU9x43tMeHq6KSmdXuX9irjR
         kSIAqh93ITQhgy8BdtNrSybeeVoGzeGRVrLIecM2Yn68LfjS4MVkjCN5nHJSzrdCzl05
         bpSmUK5H1bPU3Ev23Mm2Z2o+k+eAR+NdogszSjF3DSXbqpGJ70RIce+XUDM5+8oVkwdz
         FBFg==
X-Gm-Message-State: AOJu0YyzvZKhbaId4r83tyNGlWyOY/38vG3pcfHge3RmY7XImgdW2gBX
	m7yWc1YsQfw/oYETjLVGmRLcd068MN/7ZiDhEhriObNJpzIcNV7KqnliFw==
X-Google-Smtp-Source: AGHT+IHHs4+qBBaVi1+cD9LccUjaQ3oKLBAi6NX86u9F0Og2Ij6ycH1gslPNyOUyqlYBIrrnBSwMAQ==
X-Received: by 2002:a05:690c:6312:b0:6b0:70fc:f6e4 with SMTP id 00721157ae682-6e7d3acddf5mr43552687b3.15.1729612092626;
        Tue, 22 Oct 2024 08:48:12 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:48:12 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 28/46] libnet-ldap-perl: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:44:46 -0400
Message-ID: <20241022154729.20331-29-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113119

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb b/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb
index a77381dce..a7793200a 100644
--- a/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM = "file://README;beginline=3;endline=5;md5=4d6588c2fa0d38ae162f
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/M/MA/MARSCHAP/perl-ldap-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "d091ed00302f0276069bca9df9478744"
 SRC_URI[sha256sum] = "e2f389fe3e7a9e4b61488692919ad723b98f3b479b5288f610daa8c27995b351"
 
 S = "${WORKDIR}/perl-ldap-${PV}"
-- 
2.43.0


