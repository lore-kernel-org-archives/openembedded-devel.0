Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17EA5C5DF6D
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:18 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24364.1786747573807621612
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qtCH0NqE;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c9ef3e1337fso1153411a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747573; x=1787352373; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ks9ZFGcdsXb+4dZs9OZ21Vqj6r/95wyNVTPI4Pji8Rs=;
        b=qtCH0NqESLMpRaUxldQfYRTT+qiM7O6iYsoJXqlrMFq5Z1DueIUgBt6E9rCoxJOb+2
         FOCkX+1GfaF9ed+BZ6/iVsMGQcXDVMU8WqZydC4UfsmBX8znjFOSrq3sui3LGzgZ+DaI
         KQqh3RlRO2GPwCUNLXoK8lazbnOqc2VqpNqgt86uBz9kvKrNKFtnf1HqEAv7h8CGEf6L
         nVeOiNOnwh5S953XpEzu+LMOGcez64yAk7klMHzkK8ce67nSJ/qFOzKqoi7SgeRMhoJb
         LHB45GddGH1R1uY8XvY1uJDvqhk8p4o+EtYK9omlAV6NVc1wye3M2o61NyKHXXgODccJ
         k3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747573; x=1787352373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ks9ZFGcdsXb+4dZs9OZ21Vqj6r/95wyNVTPI4Pji8Rs=;
        b=O5zWQ2hAndRC3ncik1BnlLlapPaJhaB3cYx/upfxPNmskkxq22/6Fpmo2Usa04EtfQ
         mtvH1zANwbNJqkIWQBmleb7i0Ud9RJ8hQF6tWvnN2m1UA1BrKevZn8sYXH4MYe/EDybz
         PkWgALLWsyjDhxKtlSdL0Q2dtK9/xwjUFPNwNpPgoCIo74ncKuPPEn9kZRf9pKF81j2L
         mwcIKUauqaujwYHD9+LTcuvZam2SspvJwoQugJqbp5ofo1OkPN31CYIyp3nNM4GF4gxT
         a+BsKfGFoKgu5WutCqlwiMqDRD/8TjQvhZ6Ju8/x0dOzHbyacRgQTrCcrsVn/2lWE64K
         lgrw==
X-Gm-Message-State: AOJu0YwMFTX3lhrorCxWNfvQ83kjLpox4yBVK6PEignn1+ku48M4VCl+
	zh5itjK0Rc3x5tGvpBgTo98m/I37WSKdtU1YEKQaSQPbCAswNqC8G1iIVNmqiWO/
X-Gm-Gg: AR+sD13urLtczRlFbuXGKi7lUz/1uFdvP6/xuMP4Ye630NpqjYUFX9d3bhor3bJxa9P
	IygBaA8V+3vhiey44muBrDb7qenA2IEnkq0v0ikq/L+TIPFskSNPQrs/8rc6YEfJ60X1Ykn2SRh
	4lv077bPjtJ7JPo0nUrU11eIh1LWtZ/n/WEYq1P4ticgIGVogVsnNXVfS4QR5K6u06E+9beBzRO
	T70jFpqtmcrADal/w1gdnOYsvMCCRHzqkc0fDlFDnlencXyG6wy433mJnf9jByUV3Plggst8Usc
	eCam9+0AMo1ks7hGOhDuqcK5dXHWE3mpOfhpQ0/w8ZwbdjMO4tyfHTYuuOWUVHaCKltZXzDv7fa
	+yi2jeWmYOnPdcaYsVcrh83puUC3KkzdTcz+U3LhpFk5Zs59Rp1K+HF5eb0xPLALMSkilqaut9I
	AZn2ySTojxKx0R9GnJy0k+wibvHU4AxBttpBt0Tz7M6JdY3C1SZ8t1dTYHqoFkayWCBX8ldrquG
	Qx6X04SraKaSz+fOn6Xd/LL7+QudTaW3/dEEfwDV4SNDmjFiSX5oEagmqtdkgow0U6Sx/pG9vp2
	3ZGqYTAWWla5RAL7TDUjafqNjJjqt8GL+LqO8YQ0kr0ZYd5m/ow2PnxJedpakd9YcHvK62a4zNx
	/b3chotgZl0K3Iig9/317SsLeNmmTS6ey8zPZuLYN+IYDxg==
X-Received: by 2002:a05:6a21:7111:b0:3b1:882a:607b with SMTP id adf61e73a8af0-3cc71d24898mr11533543637.22.1786747573108;
        Fri, 14 Aug 2026 15:46:13 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 028/109] ipc-run: upgrade 20231003.0 -> 20260402.0
Date: Fri, 14 Aug 2026 15:44:14 -0700
Message-ID: <20260814224539.1523174-28-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129092

Major release; see upstream release notes for details.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../perl/{ipc-run_20231003.0.bb => ipc-run_20260402.0.bb}   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/perl/{ipc-run_20231003.0.bb => ipc-run_20260402.0.bb} (75%)

diff --git a/meta-oe/recipes-devtools/perl/ipc-run_20231003.0.bb b/meta-oe/recipes-devtools/perl/ipc-run_20260402.0.bb
similarity index 75%
rename from meta-oe/recipes-devtools/perl/ipc-run_20231003.0.bb
rename to meta-oe/recipes-devtools/perl/ipc-run_20260402.0.bb
index 77fcebd846..fa4ffd5907 100644
--- a/meta-oe/recipes-devtools/perl/ipc-run_20231003.0.bb
+++ b/meta-oe/recipes-devtools/perl/ipc-run_20260402.0.bb
@@ -6,11 +6,11 @@ styles are both supported and may be mixed."
 HOMEPAGE = "https://metacpan.org/release/IPC-Run"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0ebd37caf53781e8b7223e6b99b63f4e"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0cec6aceee7559197f14caccd0f4c2f9"
 DEPENDS = "perl"
 
-SRC_URI = "git://github.com/toddr/IPC-Run.git;branch=master;protocol=https"
-SRCREV = "ad56c3b5f5a211d32bbb8ac29f180d707ee58c1b"
+SRC_URI = "git://github.com/toddr/IPC-Run.git;branch=main;protocol=https"
+SRCREV = "a8232b0a3e0e713696bf6bb8f970c561d0fe3d8f"
 
 
 inherit cpan

