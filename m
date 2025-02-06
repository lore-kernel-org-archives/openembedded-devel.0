Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77E2EC02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 20:06:37 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.51702.1738872388290779149
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Feb 2025 12:06:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bK9p+QZh;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ab74ecfdae4so198903366b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Feb 2025 12:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738872387; x=1739477187; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j8Zr+Svuh+tvmFKkBp3bnValuSPWzOF1hc/jQdQ8Vk4=;
        b=bK9p+QZhulHdQuApJTsntjkKgFDnXjT/9pM4+3uALcX9BkHiD6/ggx/XA9IalUiCxJ
         BHX7PB1RpH01aGvi9m7/8Hxrvj4qEvG7mWBEBopZnKGaKzWD7w3dJqeYvvo2sk/PLLJA
         V9hL+QuzkG5WUDzDHiu7r6xsiZvjRKBhWFOjtBdhWDZ3hcC3j0qlqTH+bO2KAqj0H24U
         DMIUVNzDT+c7wxH8zGUjDmHOrXK6Nj2WvNn5ED5/isOA936yOtEccm29Qv0Qwwx675yg
         tj0chQ3P8xI9QT7qfzSNs4yaoiRzxPYjqxoXZ+UNuO/plpjlOmui9uFvH1uzciKExwX2
         gX2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738872387; x=1739477187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j8Zr+Svuh+tvmFKkBp3bnValuSPWzOF1hc/jQdQ8Vk4=;
        b=lCOO0P1Xv0kOEt/p6Etb4U3A8/7OBgu9aXt+4X8UPrE0Ivx76Dn3Xzah5XA5hZ5+nu
         vtCULwCMvdmbCT9rFbg26B7kiTUYNAvCeio62HeUgEyD7iucvIcrDNUVFK3izaYvk1Lw
         QlG9QT//OA4lw+PzfZTpQdn59UKpNJTSGHaY+af5z1wSdOA5q2G/MzBxNsJxKu22C4pg
         rEMJza+lTe5a+6VRTcBI50W/1FSF89U8r+YMKg3SKkIwaVr128Ns3p6Ox0YwuEc5Cy1j
         lRPxSwF7B0QHK+Gox+b4V321IN7Yj+tXNx9TyBIgaSuhzW02qBP68Gyg4uUTZ8+ewKlo
         pyBA==
X-Gm-Message-State: AOJu0YxOqmqKhpwWzpiHoDokdRW7mX9lrbLhyHkPqEBkFdUMRXgPfSJq
	VmpJhqJ/XSOpiJXr967aucflHSwKm8DTote7OIIV3kI80EVW4m8p9xdRUA==
X-Gm-Gg: ASbGnct1FwkLIj5LTx3+QoVkqIRCi2zRI3xYy5TenVRwoDg9lLE+a+8k0z5ohfJN7p3
	Kx+2QmZPwEeVEMZBIE5YnUPuVMRgrlZT05sSixwolNiyzw4ruqlxFlu38jE9PtM2yww9DgGJNmR
	WA009i8P7ABwGzzPq/cCmE3Z8LCjvtnV5g6/KW2ULNNifNXmSO7y3SXnrercAeTBl8Wcf1H+UFo
	KyxYCiwkhW8m5izXQSlBxEPdRt95vEuUz6YzSFhgS9lHslmeVQtEOO4tlXpKSLNIIZTbnKBpO45
	0hFHgC+JYS9uGZuJ8g==
X-Google-Smtp-Source: AGHT+IHjOqwvF7e2aNstAV6pWm8VIsObcSf+jtjnVLAetqJEaek+HWthUdtepZ4/LAy2eDXwvfvhDg==
X-Received: by 2002:a17:907:9490:b0:ab6:d575:953c with SMTP id a640c23a62f3a-ab789c2d48dmr24727866b.47.1738872386459;
        Thu, 06 Feb 2025 12:06:26 -0800 (PST)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ab7732e71d4sm142817466b.122.2025.02.06.12.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 12:06:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] spectre-meltdown-checker: fix script name
Date: Thu,  6 Feb 2025 21:06:22 +0100
Message-ID: <20250206200622.508490-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Feb 2025 20:06:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115303

multilib builds fail with:
install: cannot stat 'lib32-spectre-meltdown-checker/0.46/sources-unpack/git/lib32-spectre-meltdown-checker.sh': No such file or directory

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../spectre-meltdown-checker/spectre-meltdown-checker_0.46.bb   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-checker_0.46.bb b/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-checker_0.46.bb
index 19b19419ca..c6593ea742 100644
--- a/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-checker_0.46.bb
+++ b/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-checker_0.46.bb
@@ -31,5 +31,5 @@ inherit allarch
 do_compile[noexec] = "1"
 
 do_install() {
-    install -m 755 -D ${S}/${PN}.sh ${D}${bindir}/${PN}
+    install -m 755 -D ${S}/${BPN}.sh ${D}${bindir}/${BPN}
 }
-- 
2.48.1


