Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE50E7E0D1
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 11:39:08 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45580.1770637147301875427
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Feb 2026 03:39:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ejFdiESq;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4834826e555so2550575e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 03:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770637146; x=1771241946; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0hReedumWv9bObsfCo1a115xFMbIDmYnR1idXADXTUc=;
        b=ejFdiESqkOtjMdMa3qmMibN4QoUPgTIdMMmbrxLPrZJ0t5t0sk26N0dUJa2dlplhM6
         RPKbVux1ftAxD4g6D8YBH8FmsribmV1MIjcZyMRBCav9J/xdvd6Lfe7VzePyffr6JpQX
         tqVOBdGppSwtQE5fdaMPODvj7U+6a+4S/r4h747JSiffogNxSX7auusVYxy1O/nXYlTu
         pdS1eQpkmFuSiApXc17eZgPHEI+94/rSH1FBkRRJRBK/A8lVkNLmCdycAE78LoeDZwca
         QVAoyGUPIYUMoVo7GPvafavL549FLTHSDn7bJb6xcsAAbCEPNbPh1m1qxZZfmaeh5tGu
         gIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770637146; x=1771241946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0hReedumWv9bObsfCo1a115xFMbIDmYnR1idXADXTUc=;
        b=f61HEnIYt5DuYaufCmmIXk+rkk7y3U6y09bXZpXGsT45Q9zN6iQb4I1GDb7mfXTIf2
         hmMI+MxqX5fiRhsIFGzokocfS9ixjJHKS82FV15Z9FlDcN7DwgcydCXkpb2+vPg1kel2
         Se1YgfZLnv9gOxUsERiejD8CIQEj0KinqKVLqFmbhBQVvgqnEJiiO2zVXmmX6Hqfylwg
         6Icci3a+0CK3PPu4Dph3bAgppJ64PTQGYrSHWFn41ALbzSCj8gMreKS+NnpNkkqMIqDG
         OJhcZ61FiqxsKd9Dr8I5ujLdyuWFSsuc7fAjeVtHyTwHMeFKwzunQJw8JWXzigUvTtza
         aURw==
X-Gm-Message-State: AOJu0Yx8UQpt15YTTAjg/wHFOPTQAFoEA5j6VboukBf1kfJFqhUmfTvQ
	joRkJpsdu0fcvXZKSh3BUn9vF1p7G2C3IxBVGpIJtEC7JK1DajOsBw5W5bwVYA==
X-Gm-Gg: AZuq6aJtVeQIU7ugCpOclpTu4yQxifbsDEEcKY1+qt7XUVVVQ4QWVcSvXXmgU9/9FAQ
	+hbnl6xt9+3kHNkAKQgGQfKSE6mLfNXhBi9TG38edkL/0rFmW8+cB9dVn4U8bGmchx89CN8NV3a
	o1SeRLKIYRCVjd7vIO4wTMHyX2D+pDSsHNT8RGPIcp6ZHnPuGJbaudDjFBRVp+I+2Hc05Kbad3W
	w7ciuHfNtseeljtTawtwFcnllRL4ANRN7TYteT3h7UHKsO9oe3/B8jAPMOwbv/Ithr7fa9idaAY
	SA2M5lPOuYvet4UNR2wqm7hyQVbl5DkfB/KP6zoFsIzgiH6O96sdtSrJiYwDO2difvTb6pxuqRU
	1pmQnGod6H34ugWC51CGSnCNmQNiejAL9l3t/wzZB/sHQpFDAvWePHAr6Q8vo11R8ywEupahtAJ
	iMD8N9FXgT
X-Received: by 2002:a05:600c:1390:b0:477:5ad9:6df1 with SMTP id 5b1f17b1804b1-483201dc4bamr148234595e9.3.1770637145402;
        Mon, 09 Feb 2026 03:39:05 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834304232bsm56030375e9.2.2026.02.09.03.39.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 03:39:05 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][kirkstone][PATCH 01/16] sox: patch CVE-2017-11332
Date: Mon,  9 Feb 2026 12:38:48 +0100
Message-ID: <20260209113904.3442496-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 11:39:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124296

Details: https://nvd.nist.gov/vuln/detail/CVE-2017-11332

Pick the patch that was identified by Debian[1] as the solution.

[1]: https://security-tracker.debian.org/tracker/CVE-2017-11332

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../sox/sox/CVE-2017-11332.patch              | 28 +++++++++++++++++++
 .../recipes-multimedia/sox/sox_14.4.2.bb      |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-11332.patch

diff --git a/meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-11332.patch b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-11332.patch
new file mode 100644
index 0000000000..383813e469
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-11332.patch
@@ -0,0 +1,28 @@
+From 80479b4978ddeb6fadb75007abc81f1ca2c50abb Mon Sep 17 00:00:00 2001
+From: Mans Rullgard <mans@mansr.com>
+Date: Sun, 5 Nov 2017 16:29:28 +0000
+Subject: [PATCH] wav: fix crash if channel count is zero (CVE-2017-11332)
+
+CVE: CVE-2017-11332
+Upstream-Status: Backport [https://github.com/mansr/sox/commit/7405bcaacb1ded8c595cb751d407cf738cb26571]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/wav.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/wav.c b/src/wav.c
+index 5202556..71fd52a 100644
+--- a/src/wav.c
++++ b/src/wav.c
+@@ -712,6 +712,11 @@ static int startread(sox_format_t * ft)
+     else
+         lsx_report("User options overriding channels read in .wav header");
+ 
++    if (ft->signal.channels == 0) {
++        lsx_fail_errno(ft, SOX_EHDR, "Channel count is zero");
++        return SOX_EOF;
++    }
++
+     if (ft->signal.rate == 0 || ft->signal.rate == dwSamplesPerSecond)
+         ft->signal.rate = dwSamplesPerSecond;
+     else
diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
index 0791c85f74..c8a7a1829d 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
@@ -30,6 +30,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=751419260aa954499f7abaabaa882bbe \
 SRC_URI = "${SOURCEFORGE_MIRROR}/sox/sox-${PV}.tar.gz \
            file://0001-remove-the-error-line-and-live-without-file-type-det.patch \
            file://0001-Update-exported-symbol-list.patch \
+           file://CVE-2017-11332.patch \
            "
 SRC_URI[md5sum] = "d04fba2d9245e661f245de0577f48a33"
 SRC_URI[sha256sum] = "b45f598643ffbd8e363ff24d61166ccec4836fea6d3888881b8df53e3bb55f6c"

