Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D48ECA9EDC
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:10:33 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5058.1791839432390328036
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=n2uijwG9;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd3310348d2so1880480a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839432; x=1792444232; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CQ/To9wsn2t3Pxs/kp8y7LosA82+dyROBT2jtGHTIO8=;
        b=n2uijwG92YfeooQ85HrW51NA0nUK4PK7KWWu07trL3Y+AfCdmn0SQ62BxNAK/F8i5t
         tUkSxK8D7m97/HwaqPPDOimrzfyCwWoS+eJQbIQBjCaY4LzXw5aCJk8d+t1wz5/9r3RX
         bPJY9WRVA24jJsgn5zrv0HdK/HEUQrf0Jo5GmuHO4CmqRZNx+2dUytrLyyehUlzO9eza
         pTfQT3O5aaBZRVhWEFa58I1axNLtI8atOaf36kG7n22hakYEFjoJfnSlIzKjhZzFxZzM
         VM8flog1hVu6n5hcBnIOl1HuN98l4bIHK8mlzH5Ji+9CJZPyXVs2sWGsXD8uKwm/wDA2
         8O2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839432; x=1792444232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CQ/To9wsn2t3Pxs/kp8y7LosA82+dyROBT2jtGHTIO8=;
        b=yqOJVMCJGtbfopKnUKuyNLcWFfsxFF313bJsztBBaOSOdEz9PTcAg6VdkHxnWjPJlu
         aMRzSP9FVDmZnuj9y74rDS5M03kAchAj5ss2FI/ETFG4NzTx29fWZ1r6H4F5GBdgiE3d
         H4u4OMJR2DlHA7I0F56gXrx93lBlsZD6UyWcV32JLcdOprZjGJd1O7HnMWlGwze3KlHZ
         ir5Yjz/cbv476UGUkLvdFHWfwvLXbDpGtv03wPbVbEQHrbt2/DP35q4/qfdxF2uZbwbS
         wKlDapL4vOclCHmQx1AvoN3gShvcvnbEuRjmpwsg8WMUqpmMvXc2zMMJfCO5OJFZPUTK
         Q6Lw==
X-Gm-Message-State: AFq9FYJ567c15qfvUAORmlCMMR/C3UJK7ap7d6kZfBDXlwAd5tExn0r9
	fs1bMJ3rxDM5g3yRbr5vi00UYBcxnCASF2eRopuvXNODe0/lGvbkH0EsXArJBiFs
X-Gm-Gg: AYBFou1CaPufL3y/xQR2h7rY19L214wub2qI7vxV9SWR+lHcEgalHB2/7O/2f5zcuc5
	6nijmsaw8IO0I9C9StPp7w19F5KAk4XeHbDPRnwN4Vpxft/IzWBI1QUkHWRKrRYIL/uoduS0HEM
	g+tiL25DkVFmB6D1k2QZ0fIM0/NqzcLg5FJ1bXSxEKdRXDmIANIpF1ecElQsVJcy78cw6nfGWF5
	aZfdj7dHvfrAIj7YyK7KT/fOJxncoi1BwnUiyG0DXnle75u7DXnY6d6/JKWCgVp37wLhkjjHA2o
	Enked6QupSQczPgjMNaumBqX/dZ5asZdwdsrXxUOwxFZvCfabWn7cNzl5H1s+5y4jKNjJbOVaF8
	bjoP/X/Ou7CE+Tuo33jpjPoZTQYYi8EJQFwOmGqTmzKc6CjLTYXuTD3/WcNoGlMjeu132GgTY/G
	9jmvkcpfRPl9+ibRJPiM69YpNGIckpzzdkkzN+IHsqTSwaeDnxmz0PRch6eYdwlMljgP2zos8RT
	WUlAwYRnS4g+1GtUaK+n4lDnIumEimz6yCltQI=
X-Received: by 2002:a17:90b:43:b0:3ab:330d:6e47 with SMTP id 98e67ed59e1d1-3ab3a9528fbmr6123317a91.10.1791839431729;
        Mon, 12 Oct 2026 14:10:31 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32c0f59bsm10962728a91.0.2026.10.12.14.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:10:31 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][blacksail][PATCH 6/43] bcc: correct CVE_PRODUCT mapping
Date: Tue, 13 Oct 2026 10:09:30 +1300
Message-ID: <20261012211009.3352822-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
References: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:10:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130776

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Use "iovisor:bpf_compiler_collection", the exact NVD identity for the
https://github.com/iovisor/bcc source.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../meta-python/recipes-devtools/bcc/bcc_0.37.0.bb              | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.37.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.37.0.bb
index 8caeef90bfb..eec8ef4a32d 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.37.0.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.37.0.bb
@@ -91,3 +91,5 @@ FILES:${PN}-doc += "${datadir}/${PN}/man"
 OEQA_BUILDPATHS_SKIP = "/home/ubuntu"
 
 COMPATIBLE_HOST = "(x86_64.*|aarch64.*|powerpc64.*|riscv64.*)-linux"
+
+CVE_PRODUCT = "iovisor:bpf_compiler_collection"

