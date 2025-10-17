Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10295CCD195
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 18:40:53 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.869.1760726443886210908
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Oct 2025 11:40:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VsMQxj7+;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4711810948aso12636195e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 11:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760726442; x=1761331242; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=UQGxOiz59iQfGNJVe03HFZHOo9wTksbzYWeYQU4o7fs=;
        b=VsMQxj7+qmx3/OSyGL+1M8eQm26lir/59QDpqTHjpoWAYuoQwdk0jE1K4s8qm+D8z/
         IUS6uAn7t5AvjlV73/0ROCjgI0r9/DUl709GykrCmyCfROb65CfAwwuP9LSmiEiALYKG
         TrLB340XA+XBO2glTB0FMr2C6dsK+MKN/ml+sKB/z6mAtwoE8P9oS5xiekFbx0INKCUj
         IVacNQtvnN588Uz86OXgmxA1dPmnDXkMH+5hSium2WEu5wpHBwSCaXrd9JhHQpwpiywo
         YWzhNPw/cyypz2o0d5J1EmJVgXBBXAeilXT20cF7+Epi2NhwG2+4vkBCkFAm7ABK46Hq
         DxvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760726442; x=1761331242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UQGxOiz59iQfGNJVe03HFZHOo9wTksbzYWeYQU4o7fs=;
        b=hNdJgz32dh+MAoyIh4mhmD9Ndvlzsng6YHQ8vLUtP+AmyDvICaPa/OGIvfeSVj7Raq
         OSTGJaVtUCUJq51oa8zvgY4mCYh3zliF/r0Dt9ZyHsqDJjDN3Ge66zZBlbPZPlA1uT/Y
         hUQpCL00CaNUOp5jEpW18MI/132aMuZ8ajPjUbUIOcpPmpcH5j3f9O0e+rLbsXxXd+0Q
         ylIDkPuy8sHUfW9yZcis6J2z6op6Vk5GK2OPAQnDOdnXvqwY+YrxPaRPHcXcO2ZlKMuI
         dNYGUevkby+8No+T82pVfXgH6IIFrJzsn3oms6OxHooHbnBOXW26aTBsWbiSQA6scI8Z
         Ip/w==
X-Gm-Message-State: AOJu0YyUEfurwmicdbYeSfx5Ik2m7Hsd/FpE8eMoJvltMtXRukRcr3yC
	ETYN4q8918pEZxDZwS7gDdQZxjxbsn0xD4nuYj99BDNu9y85X8Gc1Sbszu/dBw==
X-Gm-Gg: ASbGnct4RIZmCMtR68IFHPow1VE+YV6rZBUvdWn3fIBxGtXvGz3gZSiKnzTb16g+0pW
	lXyJ3l+NJf/HM/vziQU0tdVuhhULr+o9JFT67P5TEHiZN0DMPFzoe0WJ8uzP25ZJGEQBbnvgF5p
	MJIp9pLzWUUr3ieIzbJtbbiskoHFL83jUTd7haOIldruP+dz9kdjl9uLD0JueSUaa9/64mXy1Bm
	lCBP1iIlZzCPG3U6roq0Vp9Bpk072r+b36mBXeX1BYwk2WRUqB8TO148qYizrbkLCQqkIXG9VEY
	r1LR1KIkIvwTC51fYCbanMm/HaQmk4QHVZLEAhYWSNfUhI/Nl6PYvlkcXgfjjQb5Bfz2aM+rXmi
	VrbkcG4+yiqTciH55Nw16h1A39ZSJGKIkryNWY/ygcxd30pNe3sNSsE2InohexYjjHEU+H9HROg
	==
X-Google-Smtp-Source: AGHT+IHTlN1cq1ju6u2SzaSkyPE1Jx9PzvIVzfErrYK8vlyGMIKlYVNL1qdB8jsj4E77Tk/yAAxycQ==
X-Received: by 2002:a05:600c:828d:b0:471:11a3:a289 with SMTP id 5b1f17b1804b1-4711791c5f5mr34260405e9.27.1760726441839;
        Fri, 17 Oct 2025 11:40:41 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4715257d916sm7457565e9.4.2025.10.17.11.40.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 11:40:41 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] libdbi-perl: fix ptests
Date: Fri, 17 Oct 2025 20:40:40 +0200
Message-ID: <20251017184040.2726477-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 18:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120774

Add missing runtime dependencies for the ptest package.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb b/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb
index 94f98fe40f..db35e11477 100644
--- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb
@@ -40,8 +40,7 @@ RDEPENDS:${PN}:class-target = " \
     perl-module-universal \
 "
 
-RDEPENDS:${PN}-ptest = " \
-    ${PN} \
+RDEPENDS:${PN}-ptest += " \
     perl-module-b \
     perl-module-benchmark \
     perl-module-cwd \
@@ -53,11 +52,14 @@ RDEPENDS:${PN}-ptest = " \
     perl-module-file-path \
     perl-module-lib \
     perl-module-perlio \
+    perl-module-perlio-encoding \
     perl-module-perlio-scalar \
     perl-module-perlio-via \
     perl-module-sdbm-file \
     perl-module-storable \
     perl-module-test-more \
+    perl-module-test2-ipc-driver \
+    perl-module-threads \
     perl-module-utf8 \
     "
 

