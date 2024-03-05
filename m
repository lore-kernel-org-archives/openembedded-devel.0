Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C0F8C54798
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 19:08:00 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.1474.1709665671400825187
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Mar 2024 11:07:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bqA+/XHv;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1dca3951ad9so1517985ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Mar 2024 11:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709665671; x=1710270471; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJ/MMwO3dtJn6W37dKfV4jwwYJmoR5ugiKiOQSSGpHw=;
        b=bqA+/XHvL5CXpa73c0ENmzBTzuDumJdbNVujuif251ekDZJPTN0WfWfKiy++dq3Z0p
         KBt5gL8TMgZvWktbnOF2rp1DIkfcizMZEyT19EcpMgsxg/xl7/w8Yq2yuAqipfMpfdcD
         p8xaRleKqlE9nnckyyojM7a74wp1kCA2IB263D3K+o7HImAIB/DgtqE4WZW9JWxVwdoA
         s7Esnm3HODwceDodiQ5UAUhGRLDaBDbvvWe/x43wzvklPQwPBpJIMHFxv48X6hzikvQR
         WHNHnlNIZArbWGl7NSIHAzAEvVcazk8eerlAr+ThaZ9XUdBHpwkIwlw0BQqyTzzHuMl5
         VlHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709665671; x=1710270471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zJ/MMwO3dtJn6W37dKfV4jwwYJmoR5ugiKiOQSSGpHw=;
        b=p9a3mnWvyZzrM2Kf18ofKxec0CEYkyP5wgafaeAsMOBrmrEENUfEh+MWL3JQVtbT5k
         69VTZ1LjyPLcjCCIWlKFuslgKRVpswoo0L1pqjr3cpnhem1XdWN5H7Uk60Hjz/dAhicF
         G0Fd+6wtLeXVKiY+PWp3PLHQf5b20iAKinOpFICyoyiTW1EVejx0RR9vA3MvaazHAyOQ
         uERgEPO1ZpcZSm8qCuJI7ekA3S3OX9YMvlEPs0l8IpEQyvuDSsV6Sx3kfjOX15YCRqRW
         TeIDvyjENoSoe9CPpVC/t4oiJ+A20j4khlQuuE/0hqDKsbfJGyDIGn7Alb+WMUntBgBB
         Zj7Q==
X-Gm-Message-State: AOJu0Yz95VsplyuNYvt5Hlx076GBDIkpP+loU13wPhym6/j5V4CNrvB+
	XxiI6KUVedi0WYpJuXmOVoWUEeFnqFenj7XOAHcD/IrK/ucIjV3C8hHbprrx
X-Google-Smtp-Source: AGHT+IESgHdzb2X8/+YGHK/K0hbtIv3bNFTCmoRL8XYDzSzyKGTFGDAeTdG6FrtHj8WQgpmDszOMSg==
X-Received: by 2002:a17:902:d490:b0:1dd:2b94:17d3 with SMTP id c16-20020a170902d49000b001dd2b9417d3mr3610105plg.43.1709665670670;
        Tue, 05 Mar 2024 11:07:50 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::d3a5])
        by smtp.gmail.com with ESMTPSA id q15-20020a170902a3cf00b001db3efca159sm11104411plb.132.2024.03.05.11.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 11:07:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] emacs: Add packageconfig for selinux support
Date: Tue,  5 Mar 2024 11:07:45 -0800
Message-ID: <20240305190745.3586645-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240305190745.3586645-1-raj.khem@gmail.com>
References: <20240305190745.3586645-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Mar 2024 19:08:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109129

Disable it by default, since selinux may not be present on build hosts
and it can result in non-deterministic behavior during build.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/emacs/emacs_29.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/emacs/emacs_29.1.bb b/meta-oe/recipes-support/emacs/emacs_29.1.bb
index ae35367ac4..5cbe4551c0 100644
--- a/meta-oe/recipes-support/emacs/emacs_29.1.bb
+++ b/meta-oe/recipes-support/emacs/emacs_29.1.bb
@@ -18,6 +18,7 @@ CVE_STATUS[CVE-2007-6109] = "fixed-version: The CPE in the NVD database doesn't
 PACKAGECONFIG[gnutls] = "--with-gnutls=yes,--with-gnutls=no,gnutls"
 PACKAGECONFIG[kerberos] = "--with-kerberos=yes,--with-kerberos=no,krb5"
 PACKAGECONFIG[libgmp] = "--with-libgmp=yes,--with-libgmp=no,gmp"
+PACKAGECONFIG[selinux] = "--with-selinux=yes,--with-selinux=no,libselinux"
 
 PACKAGECONFIG ??= "gnutls kerberos libgmp"
 
-- 
2.44.0


