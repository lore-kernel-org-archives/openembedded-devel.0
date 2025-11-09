Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C5D0CCFA1E
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 16:00:57 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27211.1762704047165194270
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Nov 2025 08:00:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=emBfj+Yp;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47774d3536dso7057625e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 08:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762704045; x=1763308845; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ODjJ3g8yirsBzkK/jnqaYLx+c08HsnBR8q05t3giiDc=;
        b=emBfj+YpKnOJnsFNlqOhysb2U8GPpID0rCR2yYYeU+92mkDgkJ40eSCwSZHGv/VhRh
         /uQAVuwbXEU6dl9FAYcUiTFSAzzcOybFWLzSWxC1PWl9JUc888uqEw/iuOZa/sluQzBS
         Zp8XDjZpxFuWW/A8cQjqQtDRwTTbp9RxPFE8VB58QzG/TGYbbJjp+Ug6SYXzukAN3fbO
         dSnqo/fZi7v8i+IQbL28kSa0UgKPtwkqLhxYz97Pu5/+lTHCUbUz61s1iOICcILASj16
         q6TDIs0dIJidNqWoX3kTTFsKWeDQys2eNv8SsEgP6SQg5TxDQuHSlsI1hOycw52xiEoY
         5sUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762704045; x=1763308845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ODjJ3g8yirsBzkK/jnqaYLx+c08HsnBR8q05t3giiDc=;
        b=SGlYqfdrsEWt5rXKbgkoZXzCRNrLpm4fIRxbjC6cunaUlOjTX4twj5kKr0Nv9DzgJo
         ULQPCuBK3fe91R3XjbslNoVGgDRAxT4zLGSmwx4hwT0wQnN2nVw/06HYk2+iajsOzjBS
         tKcw/adK1suKKnH3wfxE55dMNwPwK8frLw9y2dJDYQM7ENFX+RtlhXlWODyZjfMkauAU
         zdGKdmxsQDf+3J90qFyS0qcHUWJjXeH1I4GvLa//0Ri0QpRv6Dw8IYmkwySjG7JjFKcW
         PCjRaA9ZnZ5yX553O2nZBC3f5CSWWEs8wD3zfvuytodU/iVMveJojsb5EyHlI8nSY4IP
         dN3Q==
X-Gm-Message-State: AOJu0Yxgt83Xoq7J66CGmymM86zqFTHi4C09k4Px/xn3AhMBJ7LIBuGk
	sTWc75QYFIVa24Xe5zirvcdNPmKIGBycT9hlh63NuzEH+Vsm/hu8S1EQduv+296Z
X-Gm-Gg: ASbGncsQAH35mWb3yvchWc7n7yxystNRuAvSjHRZKMnuUEMPooMt4IDG1VnCwJHpnfp
	aMb+WxIvXlRZJlcATnyo77tafNC1e3xo1PrKNDH2eMff8tQMKZwH3Bg1DFCEGNgL/M24B5WlwrO
	rgX3K0onD8+frrZ0TIB3UWj+GuZyLmCBFezQqAKJ49hlJ+PNDzBw5UCA0UOrDUxdJzHDwwmbupw
	6gFkH+pqa/klxogo18hAsUURTeycsb5c+1ALQFGSMl7/X+KJIS2ouU6dEgGdPoW62uV+ppt00IC
	5yrb/4jr+SoXFa/wyTJXXQeON6KuFungBxizC+oZiHuKt6igHrLuKml+g5rsfS1r7M4381CjgmL
	gK0Ler7unP2QaUuzFNHsI75VzIHiccAgvXBlg+dzjSNV8E3plsBkTEc8INEWhplmEF2Fn1TxXaP
	lyIdvbXMAV
X-Google-Smtp-Source: AGHT+IG8wt1uXU4SVZWw2+0Dcu/3wrXfTXeqpC2Bj5DnlFkC3q+cLltX7S5K7DzWQx98SWpo+FjXgw==
X-Received: by 2002:a05:600c:3b8e:b0:477:25c0:798c with SMTP id 5b1f17b1804b1-47772e04759mr51874395e9.20.1762704045429;
        Sun, 09 Nov 2025 08:00:45 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63e131sm17406445f8f.20.2025.11.09.08.00.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 08:00:44 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][scarthgap][PATCH 20/27] unbound: fix SRC_URI
Date: Sun,  9 Nov 2025 17:00:12 +0100
Message-ID: <20251109160020.2522353-20-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251109160020.2522353-1-skandigraun@gmail.com>
References: <20251109160020.2522353-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 16:00:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121436

The branch used in the SRC_URI got deleted, and the used revision is
detached from all branches. Use nobranch tag in the SRC_URI to avoid
fetching failures.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-support/unbound/unbound_1.19.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/unbound/unbound_1.19.3.bb b/meta-networking/recipes-support/unbound/unbound_1.19.3.bb
index 6f54038c6c..ee79e39e20 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.19.3.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.19.3.bb
@@ -9,7 +9,7 @@ SECTION = "net"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
 
-SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=branch-1.19.3 \
+SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;nobranch=1 \
            file://CVE-2024-8508.patch \
            "
 SRCREV = "48b6c60a24e9a5d6d369a7a37c9fe2a767f26abd"

