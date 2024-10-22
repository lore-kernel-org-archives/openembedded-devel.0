Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81E15CDD0EA
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:31 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web11.21800.1729612103792334972
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:48:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H2Nbx/np;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e290d48d3f7so5198383276.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612103; x=1730216903; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VtNUTvEkNeyc6OkBElsEK0LUrP94RWEC6Ki39aacnJc=;
        b=H2Nbx/np+euyNxZmK33tic4zVeITqPMs4rHEAw2FoqIYZ8+DGcDQXszBbGND99Znk9
         xooXpBrAV5zPFGOcJpxIUvpKmEkFAcUxxPDNGFBsyD4foDdEmfnpbvwbBeYMKxr3aX86
         xRO1E0ru0s0GWyNBrv7SZjljkxRJInYvogdZF4rSUjVXkO+rriU+EpZElLE6Ttz1HOeo
         DL+Ic+EvZoAMmGwvVHpNfj22A9CnN+SxBHaV/t0v1a30alinpsuz3kYiCZFke1fjF+S9
         TYZM7HMzF67sjekX0DaYPpKHzurm7NquNfF4xo4x+uQ68por1+rS0RS7CipGMzR3WpO6
         IpTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612103; x=1730216903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VtNUTvEkNeyc6OkBElsEK0LUrP94RWEC6Ki39aacnJc=;
        b=oiS884np8wtVpLy594Urx56Sjy3V3UlKnTdb+/MR1BwJke9hG8x6EOa5KWImA95JQS
         nUOWj8JOaZBkemuKWfEqO4XiVFQWSQevb7v1K7+NZwmcaMzBgPNrB6QscrnAZdRe8TMY
         CaVqmpkHUDx6/4COmo4H/zlhOonCejQrZukHXs/UL4ESglx3cIujdhsxJ9buvNwzcgW+
         MUO02EHidTuVdLObY90J0eaS5BcvEtHBBQSNk4NsBMOGBcWMlXeppG5FMstIBcGBIUd2
         Umm2AFbj56z9538mSct9732qWCo9YE/nqMCPkf2R0MmBOPB5C4vk1HXYxPrlYDoWBao2
         7x2g==
X-Gm-Message-State: AOJu0YxggPIZ2PEzxeKgiURr5W+sfwMqTeVOJ/SPjZlfm1lmNSMc6Zah
	Phv4d2W7wq652MOkvcwiiXp52guXs6N9wRShIP/bE6uhOghq/DJYdkn02A==
X-Google-Smtp-Source: AGHT+IEc5m8V8JDqNVQUyV34l5NKSH01+tlJus4gnAaruNi2KPyeLI7Ue9EWn3fD3VTO3k9CWlYT5g==
X-Received: by 2002:a05:6902:138d:b0:e2b:d3da:46c8 with SMTP id 3f1490d57ef6-e2bd3da4899mr11290750276.37.1729612102515;
        Tue, 22 Oct 2024 08:48:22 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:48:22 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 43/46] libtext-wrapi18n-perl: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:45:01 -0400
Message-ID: <20241022154729.20331-44-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113134

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb b/meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb
index 017e951d3..0949dbb7a 100644
--- a/meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb
+++ b/meta-perl/recipes-perl/libtext/libtext-wrapi18n-perl_0.06.bb
@@ -18,7 +18,6 @@ LIC_FILES_CHKSUM = "file://README;md5=080862e1e40cdcddef4393e137285858"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/K/KU/KUBOTA/Text-WrapI18N-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "0799c16a00926e6c18d400c2e2861d5f"
 SRC_URI[sha256sum] = "4bd29a17f0c2c792d12c1005b3c276f2ab0fae39c00859ae1741d7941846a488"
 
 S = "${WORKDIR}/Text-WrapI18N-${PV}"
-- 
2.43.0


