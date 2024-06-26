Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8691C3064D
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 14:42:01 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.28582.1719412917483038979
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jun 2024 07:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=DsVf+FLs;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.214.179, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1fa9ecfb321so3070725ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 07:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1719412917; x=1720017717; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zC0J61VxyuOnSiICVPsgjyk+mU9skK6tR0oJtjNewyI=;
        b=DsVf+FLswTklZ7MZ6j45ntxUXWKKj+DU7boaLcMY1xn6Zbm5SDaFeyVO+WDKvPGx24
         SihjYekFYsAn2RjG/r6tX5r8On0p1HjOoPPmtZgpu7grlCi8LevwgzfExfopJHVF9GhW
         br2pLQnyxNSGLr+FY7FWTstvhaVfsxcegQ7eORpsrJ8YXRy4o1vVkpJRzkYJyB8EmY9l
         yl1pbPnAXhLyqFB2Z6KXUVrf7GcadbCRjYvubeopGrpyjS+DwmIRN9Ne8NM13a+IXj2x
         fJA0j1zvyMmoEOnxazxmUvdVnEO54RSUfj1YQLCqeCL9V5RutmTKkRtVQVtOn2RvCC/T
         NYzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719412917; x=1720017717;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zC0J61VxyuOnSiICVPsgjyk+mU9skK6tR0oJtjNewyI=;
        b=S8YBgGXkxdWKSLAZ65rLLOR9UjeKnxfB2OFzWd6Ln/a+TIgeWNhgctlmKTDyO7MTTq
         MBXJ5Ia+tjGidHus7IfCO480Zt0/cDERR5UaMtCHvAvGQ6Edu7smePE8wNY6eRaIwQx4
         PKSIUyuUzCfUFuVpGKXhHsSvxUKMBzOHxu7Z1tw5KX7uPURcpI46I6jPDgV2cpJg/BGq
         vuFPDeP49RPzW32G+EsJOvy0hEUvZ2p+0rCwz6dRfK6AKSaRcub+nGSiJdBl+FcPmY/7
         C4vJi7R1d6LhCbpGPGMkWR3knK+FkcUCR2qpWaFIJ86gc1j3s18yWEVFLRbrYSN1veXk
         tPhQ==
X-Gm-Message-State: AOJu0YxxHCl/MfBgcFAydcrx3jUpMK3Kn0OunwkWTOGlYNAMk610p99K
	hOeKHPND8wIAR8Qfwv/J2WbnM73l2CSjNsMD7u6xUeJK3ykVQEtBUw1oqbQD7QLzW6n58PQSKn6
	L
X-Google-Smtp-Source: AGHT+IFASrQhTf1uEutByzu4hf4JmH3GXz4YtpPW3+PkEDzb8UbveJ1+NCWKiEzqd1w118aGIGwQDw==
X-Received: by 2002:a17:902:c404:b0:1f4:71ef:98f8 with SMTP id d9443c01a7336-1fa1d3e3b9amr147680085ad.16.1719412916874;
        Wed, 26 Jun 2024 07:41:56 -0700 (PDT)
Received: from localhost.localdomain ([50.54.151.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb328f57sm100373855ad.110.2024.06.26.07.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 07:41:56 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 1/1] usrsctp: CVE status update for CVE-2019-20503
Date: Wed, 26 Jun 2024 07:41:52 -0700
Message-ID: <20240626144152.92432-2-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240626144152.92432-1-ninette@thehoodiefirm.com>
References: <20240626144152.92432-1-ninette@thehoodiefirm.com>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 14:42:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111102

The current version (0.9.5.0) is not affected by the CVE which affects versions at least earlier than 0.9.4.0.

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
---
 meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb b/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
index 4c18c6aff..3769d5cab 100644
--- a/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
+++ b/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
@@ -25,3 +25,4 @@ PACKAGECONFIG[inet6] = "--enable-inet6,--disable-inet6,"
 EXTRA_OECONF += "--disable-debug"
 
 CVE_VERSION = "0.9.5.0"
+CVE_STATUS[CVE-2019-20503] = "cpe-incorrect: The current version (0.9.5.0) is not affected by the CVE which affects versions at least earlier than 0.9.4.0"
-- 
2.44.0


