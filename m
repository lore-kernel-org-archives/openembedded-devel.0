Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AC09CCD184
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 17:16:58 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.6122.1760030214472038309
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 10:16:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=agUJYB/n;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-62fc0b7bf62so1782334a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 10:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760030213; x=1760635013; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=YJ5cTjyT2h5PMZX7uYheU+OKyZP35wQk1BT7bpfUnqE=;
        b=agUJYB/nOAZ3LDsmVGRsMHOJvLKjN8zhFD75ozELaAW9BTFo03RK5qKAXs17GSQJK1
         MlQZ3ll8wG6W61XcQLB3TEOLOxXglT6Xoc9DWxBGyFLAwtaow0R26HiMqqVfGUO0dszs
         fGER7vGr19sVXefkioxF+tnhB2ZwVIpaVWNPKvuscUHtBGJh1ZpJHBn+I1BUTqKzUkrp
         KDZavpPmX4FAH/YNwna7Jrp2QtrFvuqAZW1dxFNHNt2Rd1WXp2Hz/obF3Wu9c1QhOcQ9
         wVBQaeTUDFze/MyN7qJYTphGconw4elsOelaX4Gw6yHzTNihs+L63hTg6Y/0/eG+uuoG
         ZwmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760030213; x=1760635013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YJ5cTjyT2h5PMZX7uYheU+OKyZP35wQk1BT7bpfUnqE=;
        b=SmfEv9i0fls1h4sW92J+C+R17xlMyLeBfcWwGvkhxHm0MTXYqvdoub9MHWZRWoQmDi
         QOmgsg3WbhCPDo4aBcglZ5Qfem1koc8mFjCn9xSO6gqsKMOJZvq51Q8rPM+8mFrzSCYE
         5znSszVRxWccV/AomL+uyrqA4dy8zmzqZogFE1u+JDZ9+2mRafALRrMxKBII/+BrgwyB
         lMdg48OEG0DyN+TXz/8wzjcEE+lXQKe4O7PxDbHimIWcnW1thnis1514AUj1uEjzKYw6
         4nuy3FSpX7tcJOdEFs7w0c8lyaPdW1yvbMDO5P6UXbSJG4kDh3CiJSr6bWQJwfDrnzTr
         pgLw==
X-Gm-Message-State: AOJu0Yw+iV72GKS8ga0kNZWwVg0iXEW5PRzCgdP/Af/tibsxuwpxZiJF
	YUzVWeWiJ1yZYymDyeYJRrGOtyG/8vFmQ8wyytnDH5+X91nxp8LlDQSNK+Kx0g==
X-Gm-Gg: ASbGncslSGY2LdyM1bo33TjF+j+wcJ1BB9496+02WTZ0q5Y2a/0GNHa6w8D5hu7UHdM
	lJfuWcG7D+Y9J04FIWv5ehqrsz76ki7u538thjJCEh/zXQgUjU7WMe7QkWsMTlGuGCiwnGSSTF3
	WSoAzE21hdLJ5c5Ujsbaf6WVwNJkyLhVsVj2YLErJg0n6YQXK4/kago2rt+w7ptelj88AQ1clIx
	1DGw9TGgBa/Kb7GUmKTLHQ8Ru2gVNN4mr+VRHhyV2ja2yJLs7JEjsNsePFMiSkB8OimGhIsmmgn
	zn+88KYQ6ckYuPRgvP/Cfknq+7r4pzSwAO0hbe0SySZHhJcC0aYomXE1u9v848HLn3fnVa4VHkP
	ss3kaQkrgSpWTeittiQUHycvCP282zhtdBP3+tcXB+pWu2z1lTXv0/Vw=
X-Google-Smtp-Source: AGHT+IGX2d5xLNK1MmJceFgT1bS8diF+y//cXUXyu746LFP7FPaDLZjx9xlgcW/KpS4pQI5cMNFDCQ==
X-Received: by 2002:a05:6402:d0d:b0:633:7017:fcc1 with SMTP id 4fb4d7f45d1cf-639d5b8c2e9mr8041004a12.14.1760030212763;
        Thu, 09 Oct 2025 10:16:52 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a52b10072sm230176a12.16.2025.10.09.10.16.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 10:16:52 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] iperf2: ignore irrelevant CVEs
Date: Thu,  9 Oct 2025 19:16:51 +0200
Message-ID: <20251009171651.6677-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 17:16:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120436

These CVEs are for iperf3 - which is a similar application in its goals (and name),
but an independent project from this, and the projects are independent implementations
also, they share no common code.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit aedf74e08230f60c270032e8b937d1ab9bd2fc9c)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-benchmark/iperf2/iperf2_2.0.13.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-benchmark/iperf2/iperf2_2.0.13.bb b/meta-oe/recipes-benchmark/iperf2/iperf2_2.0.13.bb
index 86e5fef530..05a905b98f 100644
--- a/meta-oe/recipes-benchmark/iperf2/iperf2_2.0.13.bb
+++ b/meta-oe/recipes-benchmark/iperf2/iperf2_2.0.13.bb
@@ -21,3 +21,6 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 
 CVE_PRODUCT = "iperf_project:iperf"
+CVE_STATUS[CVE-2025-54349] = "cpe-incorrect: the vulnerability is in iperf3, which is a different project"
+CVE_STATUS[CVE-2025-54350] = "cpe-incorrect: the vulnerability is in iperf3, which is a different project"
+CVE_STATUS[CVE-2025-54351] = "cpe-incorrect: the vulnerability is in iperf3, which is a different project"

