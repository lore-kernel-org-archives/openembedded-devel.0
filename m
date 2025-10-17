Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AD7FCCD1A7
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 10:58:40 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.12276.1760697003634745427
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Oct 2025 03:30:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EUuno1fi;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: ghidoliemanuele@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4710022571cso14583355e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 03:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760697002; x=1761301802; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XRUjkrQOzPQUu/+JuOOI5c7QWQyFUoRL3ceveOzLD7E=;
        b=EUuno1fiK4gvmTAzyzqKLtpt9n+kTHaeSUM57s7Iu3aTy5HifuNw7DA456DBZtEnS6
         4df2G1f1SoxDCtn2wVlwX55ijNQbaLirNVwqxKnwnCzdjJDuWvLIx69yRYVZ4Ao7P0so
         ylDls3WstMG8FLctJTwSntl3JgpG2Du08girRhNOnVGkXTuOPDlG2hWJ0OAXt1ND1aFN
         McAjgIuv/OVE43blO8i1Q25CEAB08Px3aqFQCqQHJQMiF6kaynxBq4TivxjczW9yDWn5
         ErmnILiMby7cZFE1g7Th389opAwSFDRsxP0hlBHGRPVmx1Zsf6tyfUOom5UTBYuJ8eqc
         y3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760697002; x=1761301802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XRUjkrQOzPQUu/+JuOOI5c7QWQyFUoRL3ceveOzLD7E=;
        b=WncQXF6NGP0BcBN15CIcViraPCaDuYngUEBxCO+m0pNRQ6JqJ1DlgF2bxMExrsKGxP
         HIkgwmW9K5HAI8NdZOX0KQBt5gkdDRyzw88zsih/kog8Fa1R/Dvrz9IVmEeJmonx/5T2
         Wt/zyvJB8XaEZrAikPRki98ORuXlvqq8pOtT+/cF/zxgGo6yL3Is8Fi+2+TaVtwKPgR+
         hzX8txHtwYvfv8QNHd7GEGX1U/cVOSo46nn9/IFEo5XbJVToavmIFoDldvQ0GzIuWnW9
         uB2FsrMPczVQzLHebyIN94DCvFUhqXo2zO18Jo8bAlDLNJVST5+luopDjEkLVCABA5YK
         ICcw==
X-Gm-Message-State: AOJu0Yz9NL0WFKQ4sp3KPSJnGEjIQt1Yamr+g5J8kYKal3j2ORNmD5LI
	KQqMYwQYNN3YMRfT5Va5pMCWZre7YF3FkbbFhER4x2Scli0h2ZOTsrxaT2RhZMV4
X-Gm-Gg: ASbGncuxUeoITI29I9LimOvvBAeLLEu5ilrRVfLJPbbvnEgmn+A1ZleoIeEcPVOJiK+
	DjMRQEx5Ahsm2MM0esNAqRiXqKWD+8BGQLm4o2Dx4gXvTyEY8hkYKQ8kxXqg2vJmH9Bfo/XpdMm
	CXeE6grK38UAqEYYOMzEpFRiScnYLbGXzrTLalsHdxTa3uPTC8jbENfWhwyfLM4EFOSbF7V+Ib6
	C+l09MEB8zBu+JwK27jcJF4kCQLVaSDSA6bZCRfv/CX/+DPxtBETpP14v2YWcPR8TmUO6KHdDbI
	CWBtiGtvzMBvhQzOUqlhMyAzSW+qsX5AYBinQ/wbt9E7GS+2SaLm5dHlCTaNceeHmr2plpebwec
	L+1FVgQyRJuBVamkusHWCOF/UJ+x03rXdgJPotzNgZuGeO7L2WR/nZHNqNvjFCFWPzdPbpJHu9+
	ozJY6meODcgSr/Pti5oL8ff+EYVTnMOuM=
X-Google-Smtp-Source: AGHT+IHe0630neYlhg9oZsIs9+w67yKlfRlGJfjdPceUxU6+wMpJwNtF0gbbu29+ToLjxIN+WRWvgg==
X-Received: by 2002:a05:600c:820b:b0:471:1717:40a with SMTP id 5b1f17b1804b1-471178a8245mr22594255e9.18.1760697001499;
        Fri, 17 Oct 2025 03:30:01 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:aac:705d:ae36:2eb:35ce:6a7b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4710e8037aasm45730985e9.2.2025.10.17.03.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 03:30:00 -0700 (PDT)
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Subject: [meta-oe][master][PATCH 0/2] linux-serial-test: fix returned error code and potential hang in while loop
Date: Fri, 17 Oct 2025 12:29:53 +0200
Message-ID: <20251017102958.2982003-1-ghidoliemanuele@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 10:58:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120754

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

This series includes two patches for linux-serial-test to fix two regressions
introduced after commit 392f0f0ea76d ("linux-serial-test: Bump SRCREV to allow CMake 4+ compatibility").

Emanuele

Emanuele Ghidoli (2):
  linux-serial-test: add patch to fix returned error code
  linux-serial-test: add patch to fix potential hang in while loop

 ...erial-test.c-fix-returned-error-code.patch | 62 +++++++++++++++++++
 ...t.c-fix-potential-hang-in-while-loop.patch | 60 ++++++++++++++++++
 .../linux-serial-test_git.bb                  |  5 +-
 3 files changed, 126 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-test/linux-serial-test/files/0001-linux-serial-test.c-fix-returned-error-code.patch
 create mode 100644 meta-oe/recipes-test/linux-serial-test/files/0002-linux-serial-test.c-fix-potential-hang-in-while-loop.patch

-- 
2.43.0


