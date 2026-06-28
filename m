Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAF02C44502
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:16 +0000 (UTC)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69138.1782634330927017278
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WuOPeIsT;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-30b9e755555so3464605eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634330; x=1783239130; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zOnya/gA/XgAxoFjL9D911pnX/VSmTG7fsvnKFLCUDI=;
        b=WuOPeIsTsJAdUGZXpw6E9kid2MvOgwOfcr5AO4v3yqUJXvcxehLr6w7PXtO5WcgzT4
         ssD2jevGZ4LfkmqDGyCY/HeZ6uDjRPHvk29CBVNTMwQVxP39zY9YjXdzpbWd4EFzNBRT
         rZDEKBu5QfQjq75Aw+ghMUJ+l4iwzagTwqth9Yn73xbNgrLDPncaW3a9NEsYJeOMTW2C
         TT0SX/dkS8C1hfx9pNMRLbXO+6Auc/x042e6KXhfZ8f4NfRFGKvBFUVUoxCCbUB/csjF
         lIO7MowJs+inSU6z7lQYMr3NjMHSSs73WY+TK7tZsVF5NB3nP8Wz3QG3DND8k7YBchTD
         Z6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634330; x=1783239130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zOnya/gA/XgAxoFjL9D911pnX/VSmTG7fsvnKFLCUDI=;
        b=DjBgjDsQ2gLN89tSRhI9G+WAT9uwnKszdbDmUq//pj24Y+qbCPehAAj21Cr9knLsiz
         qx4NbeM8DThjsZ/aUqqeYHvI5r19s2jlfDCGW7V9Cuhzsx655r1X9U+RA82nIHWFa/Zd
         Of1I0VVcRhM/8p9kRW21sLHF1YXjtlNSwInRABHYxg3AAwgRnTbQQzR5xE9CxQpmAjMe
         b5l7ueBGQ93BaCYUrvXlZwmA6AvBc3Gaw6Ac2Sm9FbIXs5z5GKTmxASLEx1s8pJeRCLu
         1AMngqinec89/vCSEeswqp1YWf9N0EwOrICDS/Eaie84Y27UQQ6/EEH/NelPFGwQwyqi
         MCNw==
X-Gm-Message-State: AOJu0Ywcf6T6oXUqztPBA8W+R4hCMQkCNdyKHqCnC8LZiba0WQzIEQ/o
	BAcgM52U4fHLSUE4T+MjBc2n15oGwtJkJLrRjZpIekMoa0QZ5pUVm5VOEosMomCqM+qW/A==
X-Gm-Gg: AfdE7cnp/GPNNaVQihAtOKh1S/VdtrvpTYXvAZEeFmiyWLns7B1SB97NHctSoL1AfLw
	N9q3prvwQgYqAIp/Z6561F8XZ27Kor8veiBaDPH4tgEUqV+NKLRbI95SFA+34S61p8Pj2TsbaJA
	msJxkhBCbnV67cUmB6UXFCWZ+6DQ8IJL3+76Zygwwk9B49YEPKvPdJeLjXLta31Ejw1Cw3id3yh
	wUsDagAIobMpmBHz+mtkxX/uwElLbWz2PGkvB1EGynwFT9leAfK3Bh5/+aNoq9GJc/VN9U7CNbw
	om14MDpPdANOmyoKze/YfNdStqUpRMPLc1GYb05g58G51nAfsbRlOjt9owBueueCl/peGDIafXw
	UacpKeCiiVBZow546EMfXn64IdRfNrxVY1DWrND6tZuO9NIduoy1YSNEpmWEHHfKyhrjGslhzZG
	BzYklom6V4gn5M7bhMIZy0SPMcWY//V1cRMXXELGX5fey81Cn0cnQuxyPf8S2WknnIqVJSchE+/
	u9PeNdy6ZIQ9FdtNuo67NPX3+lDhI43plKZm+KPnFG435TfOIPy3URrx0mSaoFP8E4aur66Mtyr
	P1/fnzHikbbvjpAOoGPqtSZ1UeDAuDukezm+6ANP
X-Received: by 2002:a05:7300:7fa7:b0:30e:c43e:8c6b with SMTP id 5a478bee46e88-30ec43e97acmr978832eec.40.1782634330209;
        Sun, 28 Jun 2026 01:12:10 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 049/128] hplip: upgrade 3.25.8 -> 3.26.4
Date: Sun, 28 Jun 2026 01:10:00 -0700
Message-ID: <20260628081122.178348-49-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127859

Regenerate configure.patch, which hardcoded version 3.25.8 and had stale
context, so it applies without fuzz.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-extended/hplip/hplip/configure.patch      | 8 ++++----
 .../hplip/{hplip_3.25.8.bb => hplip_3.26.4.bb}            | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-extended/hplip/{hplip_3.25.8.bb => hplip_3.26.4.bb} (97%)

diff --git a/meta-oe/recipes-extended/hplip/hplip/configure.patch b/meta-oe/recipes-extended/hplip/hplip/configure.patch
index 9dad089ff1..85df6aad60 100644
--- a/meta-oe/recipes-extended/hplip/hplip/configure.patch
+++ b/meta-oe/recipes-extended/hplip/hplip/configure.patch
@@ -2,12 +2,12 @@ Upstream-Status: Pending
 
 --- a/configure.in
 +++ b/configure.in
-@@ -30,7 +30,7 @@
- AC_INIT([HP Linux Imaging and Printing], [3.25.8], [3.25.8], [hplip])
- 
+@@ -32,7 +32,7 @@ AC_INIT([HP Linux Imaging and Printing], [3.26.4], [3.26.4], [hplip])
+
+
  #AM_INIT_AUTOMAKE([1.9 foreign])
 -AM_INIT_AUTOMAKE
 +AM_INIT_AUTOMAKE([foreign])
  AC_DISABLE_STATIC
- 
+
  # Checks for programs.
diff --git a/meta-oe/recipes-extended/hplip/hplip_3.25.8.bb b/meta-oe/recipes-extended/hplip/hplip_3.26.4.bb
similarity index 97%
rename from meta-oe/recipes-extended/hplip/hplip_3.25.8.bb
rename to meta-oe/recipes-extended/hplip/hplip_3.26.4.bb
index 3b5f58f320..f383a3f062 100644
--- a/meta-oe/recipes-extended/hplip/hplip_3.25.8.bb
+++ b/meta-oe/recipes-extended/hplip/hplip_3.26.4.bb
@@ -16,7 +16,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
            file://0001-Fix-installing-ipp-usb-quirk.patch \
            file://0001-Drop-using-register-storage-classifier.patch \
            file://0001-Fix-upstream-CFLAGS-override.patch"
-SRC_URI[sha256sum] = "1cf6d6c28735435c8eb6646e83bcfb721e51c4b1f0e8cf9105a6faf96dc9ad25"
+SRC_URI[sha256sum] = "b9c61252754f35b4a237396ca8961e7b3e0c56db76d66a6712b7bf3e30e69463"
 
 CVE_PRODUCT = "hplip linux_imaging_and_printing"
 

