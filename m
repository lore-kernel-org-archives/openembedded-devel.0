Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C752CCCA470
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 14:39:14 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.20451.1759847953005923383
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Oct 2025 07:39:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WOP8Vu++;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-637e2b86240so10890591a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 07:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759847951; x=1760452751; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5zlwSFCvMOSn4qzpqFjGDMhiZqAnUtBNwEIOlhgYvqU=;
        b=WOP8Vu++2/VHKRCGYOWzvYcirOfxXlWZHeg/KWNkJZUP7w0qe5YVtP2Nrta92pSkAR
         uezWPRoHcHRmXuvbu31UFAwjV8T8pvf/evsqWvn/axzSW2W+2DawnV4l6rI8tfgJAvWP
         XawH/6L/p2N6edMHTeQaNfkuhGUnN2N7swHWzLJafIrQA7nfGxy7KaO/T/fhxU8JRblu
         PZ2yGpjTVrarZiNKtFwsJagb7Z+JfyCgJc1Set86ZUV3hA8Xy/7DEGIKzPqmQIKuFshe
         xLB08T3p4iZYH/Kj/9HFNxrutoubpcKv0Jeh0QYRo2t35r8TGdxi9PSWza+g45lnOStR
         UjUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759847951; x=1760452751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5zlwSFCvMOSn4qzpqFjGDMhiZqAnUtBNwEIOlhgYvqU=;
        b=jJqpuPbAew720fHcRXGLEsaF9ABKfftbyKkwHYQbcmE5XfnIjtJUrmY6lCWCrBatar
         4pBfWyGXCb+9nthDBd2Ook7M3K/T+dXkg0t8cwRgNyfDaYWtc8wW0RidIvGP+uRVouLY
         d5dUA6TfhCjeovzqPFujXtrnvDaAH+cp6KnrXymvTQWSqY91AqSM4aQJOJE0Fub52kPp
         EFDseHaAkqHiiYgoAdn9W95VevCbx5k0Pu3DgxUUQROOb+EwSoSkCePJwyDs5YnNPCYc
         1X0U5uAD2sTnU25zTzdhBkYGwzny9t0DLgN7wn0rgPnQ0TXfvthsRmLXtA78V7+EZ0Ux
         t0gA==
X-Gm-Message-State: AOJu0YxGBmaDsNs9lJRE+CWwCJx5A0NS3WxDMuexh/yakKqB2Ew7iNhE
	ah5n9ozxdCQTVa/epuIG7LkuiEZQKvkoz8jPGaBOEWRNAztAUxd6PFlFX4UJXQ==
X-Gm-Gg: ASbGnctNH9YJVJXPp/z+hXM/XqoCgD8lF8uCCYPR+5ehqrbQgaHIjUGJMuKQik+doiI
	ZoRxLrvLDp4HPnjn/WkOhysHwfdLFawzYDx/SsIqnsdCZ9nOGNWDI15JJTRR6fkIl5Fze35LHbm
	HHiv42LaHmM2of7ep0xRfJtV54n9gu5oIzIvaHQwJ/+6RHLG4dDlxJk891quVSnfen3P6P5lHq5
	cPxHNNV6b57ehWaY6njZ5PiIfmsWSW8jzKz5CCu0nv8auZtE3Jjad3JYOdRke5Dr7uMJ7M8T5eM
	TJ1RnvuxEQI+gVmB8Y8xTLA84K1n+Sa28XIOrkagi7RcFkMfJS5I4e7JJ7hQNaApnnQAWf0YBYk
	r6r6uZ6NmE0LWNzu/kqwegEuUBB6Idc6dSjzToUApmTri
X-Google-Smtp-Source: AGHT+IEUM2PqnIygdAZaQDit5Z2q+2ynknkblgTmba/5T/v9iKAFbjO+Kk2TrWwYnh16bU93e0M01Q==
X-Received: by 2002:a17:907:2d91:b0:b29:b4ac:d2a8 with SMTP id a640c23a62f3a-b49c4394ec6mr2291349266b.57.1759847950751;
        Tue, 07 Oct 2025 07:39:10 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4c83adec08sm705136666b.56.2025.10.07.07.39.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 07:39:10 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libssh: ignore CVE-2025-5318 and CVE-2025-5987
Date: Tue,  7 Oct 2025 16:39:09 +0200
Message-ID: <20251007143909.4098842-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 14:39:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120337

Both CVEs have been fixed in version 0.11.2.

CVE-2025-5318: https://git.libssh.org/projects/libssh.git/commit/?id=5f4ffda88770f95482fd0e66aa44106614dbf466
CVE-2025-5987: https://git.libssh.org/projects/libssh.git/commit/?id=90b4845e0c98574bbf7bea9e97796695f064bf57

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/libssh/libssh_0.11.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb b/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
index bfeeccdad4..5928581312 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
@@ -47,3 +47,6 @@ do_install_ptest () {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2025-5987] = "fixed-version: The vulnerability was fixed in 0.11.2"
+CVE_STATUS[CVE-2025-5318] = "fixed-version: The vulnerability was fixed in 0.11.2"

