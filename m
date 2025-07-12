Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B696C83F21
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 20:34:08 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.43998.1752352445893905464
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Jul 2025 13:34:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kARs0zxd;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-74ad4533ac5so3496455b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 13:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752352445; x=1752957245; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y4xm0J5jum7g44fIVJ8elWgetj7z864DuwRfDPzXYWI=;
        b=kARs0zxdP/truDMM/gowxxob6pZMNjQr7c4kcVpdGZTsOQNzfKi+nlEozDaV+0HQiZ
         +hoZE682l58roi6lN23+UiLbBO8AJ6I7eCmWyNQssiJ6hUt4/PPBU9MSZYoGvzAqrc3I
         m8pIhQpLpNQCEOktI7pxgiCzItrI0hDwzl8AJQgmakmNCwTPYWyL22rk6MFp1nU+tGp+
         B9bdxzy/Fid74+06UZnn+qfp2jgNdcsnrB8s50J1RfbGa+N5My/fqT3HON60Wgpy5U9d
         2TGa4pdjHeMWDc4EIXmmMO/AyPVk6hCEQXTJiQ1coqfB3+pzZWRGzYYDHai5DUlvH0fn
         uy4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752352445; x=1752957245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y4xm0J5jum7g44fIVJ8elWgetj7z864DuwRfDPzXYWI=;
        b=tcdyGWZ4U3Ro4k1gaIzefNM8sg3ba1rpQdaIaiOZkJ80ea6pZR1MS3L2ps4wkxsztV
         T+NHkFiIQLxSwPwEG8+fuDXgxUl1YrqMoaXLSa/AwhThTAcPukQX71+eJw80CFGFaNGY
         tQi1CpgJf/fbHgzUkzfNheeaZSUv5uZdU/d7DkA3ZJ+W+52x9su4HNzcipSD7NxvVE0X
         9blavwtC1fPxKhRM+uNg9bxG9uyfomkzUCZGbEPAjfiEpP1zXpxduwmvwlRMrc/eXz3D
         OkYvVQezvZdm9J1cm5gt4JQUJw4eLym313XLLEgbx1funSQkRmIdUmdifAnj1itB9BSF
         OlGQ==
X-Gm-Message-State: AOJu0YxGlCYe0gUEeZ6tLJe2vZTDHT/sVoSafUuuzwhxcoOFTQ6NF/9k
	bu7r44NM/7NED5EnX+gD7KV5pVLM/HoOqwNBj/fcS4oq/CRBvNv7F8eLu8hSgQuv
X-Gm-Gg: ASbGncu//2z//OPS7tIbip14CSCvzoUdTYzT0tU4+uGH5muMluXn7ZxKBhP+CXN2LQe
	gdLktpH3SCxaimKRNU0H2Nz3qOJJPndv4gjOJMaUSde+Rnnb4hLLhShSi9T99BSgVfKHbyBZ2LF
	tDJWVys62TtJ8e8VsORfMmU9cl7GNf4K5nwv0DVOl3t2ARzrSC4kvLR/LE+a2zC9JZhuZD0UZ5o
	KJH8zJYflYXo4D2qnlqpFinXKDe8Je9NTQRdaeu30EFJLBhAdDkCQ7xroF/CGk6z9p1zgVkRSpK
	o+bgaPi9nvqbSaeVMp1CbzhYFF+0aZqcATfsTg2EF4UKKp6yHwTN53rC5ADzUyUXWyj9zKhGYrf
	YJi/98igj0aoCkA==
X-Google-Smtp-Source: AGHT+IFpNRd/r8FX0nSF3mrAGX41BKgPyr+Y/EZtMsni23RrNTF/l9bVjINO71nz4IJkrbzo6aYXaA==
X-Received: by 2002:a05:6a20:431a:b0:220:9512:9213 with SMTP id adf61e73a8af0-231278bf673mr12520585637.15.1752352444722;
        Sat, 12 Jul 2025 13:34:04 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::1c1d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe577e15sm7546218a12.19.2025.07.12.13.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 13:34:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/3] openobex: Fix build with cmake4
Date: Sat, 12 Jul 2025 13:34:00 -0700
Message-ID: <20250712203402.145129-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 20:34:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118488

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb b/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
index be8482ab50..1b8bd47e39 100644
--- a/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
+++ b/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
@@ -21,8 +21,10 @@ S = "${UNPACKDIR}/${BP}-Source"
 
 inherit cmake pkgconfig
 
-EXTRA_OECONF = " -DCMAKE_SKIP_RPATH=ON "
-EXTRA_OECMAKE += "-DBUILD_DOCUMENTATION=OFF"
+EXTRA_OECMAKE += "-DBUILD_DOCUMENTATION=OFF \
+                  -DCMAKE_SKIP_RPATH=ON \
+                  -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
+                  "
 
 ASNEEDED = ""
 

