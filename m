Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2FC1CFD2F5
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 19:31:42 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.967.1763839893285184974
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Nov 2025 11:31:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ie+SkjEQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4779d47be12so24228375e9.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 11:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763839892; x=1764444692; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QwU3mniBQRV5FPt+ktQlQXQmey6s++umDtet6r48n3I=;
        b=ie+SkjEQjhEPNp7D6Hn0hCe45Wq33HzETXndKoT0Gm6Nin1iIbuc8RGHVmqdyryrKv
         5lGFnonqfCx1aG8dh9hdsTpbTX4AXRfiaZShiUJgbwXLmX3Fk528Jz7kzY4CAqGezMtZ
         LIaoE+AEJa8MzMt/WFEREQjUkQY4kcBCYAlQ1wfZJU80wsnFJjNpY593iYHo25UPsDJ0
         jrC8dGSwG1B5SN7rkg7M5Rr8204z8jkBg65WAzk/jCH02K2Lhbe36ssoaLov/7uA1xbu
         KV413Uj6AdkkMMk33xqvi+/myu6tjSIwGgWkGNJtLMmX47vSolKaL4o+1ANj8G+hs9un
         Mj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763839892; x=1764444692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QwU3mniBQRV5FPt+ktQlQXQmey6s++umDtet6r48n3I=;
        b=mquSeE2D0cuJiPVlYNP8d33U8jOm7+RM0/T6ExP/Zv1jRXAjcm3WsDnhIb4LK9+l/X
         4y3TsT7F8Hil6RjhKehv4GtGBXnwUy1zFKLCO6QBeBZ4zSzbqoqRrAyZSl3PIYAbn8js
         Uriiub0Mal/ZDkgUhbt5axxjZB/o/FVoStCZ5+iit+8TilzE4c0KUV6MUTQ5X0ok6tAM
         HRe748bcEy6NjY6FBzi/nEeHqwO8z1L5D/AcplxygiXdq/V/jX0shpPZ2DMNDiRW1Q7n
         wEC+XFUf3XjBKGlZxyZzIdbtoMGyU4cVD4PI0D/PamPKOQJs80G3CA5yOPHPBCr0O/6x
         pqMQ==
X-Gm-Message-State: AOJu0YyUeRYePAX8s+nVTJvlnVmSLAi0hcLPT8G5nNKHBrc8wr69kWQ5
	tuI3cHkrZ8V0TOG4+usO06BTWARsQq+lc5Jqg3e7JbGFcm872IzR52Wq4gf9dmJi
X-Gm-Gg: ASbGncsrNTlBYpqDexfVMLZwW6/1kKmUbpTYsGKKsqO1S1chY5P20CKkRH9dCJikUiP
	ZyYfeTy0jNrmz3jUCa4D7AysLAV/Vv1EA9gz9i9ORMOs88e33l25JS1NuXm6JpCuAc4COCt5r4s
	q+2xp3+ioyqOpgVbtV3WPW70SxTUKe9thq3pGxLkXpH+/AMKOedwNcDvZrnfJIMI9mGwY8Gtrlz
	5g8BhuCln6ys9b0o6Yq2R9aEUFHXE1XD0ce5JEkhdYuN3Sj4UTEIT3WVF6go429ymoAEq/GDRz2
	MRs+uGIult0k9fCcM5TXsdEmwjg0k2DmgUPoK548ccnWmpNSi68Re+28/sVwmr15vpofQqNHYhu
	23LtqOBd3Dk5ClOb0qpEPV8RQ9/fp3J4z954cMnTawwkLkjSkOrQ6Vh1X9+pF0AtSG5f0yjPzui
	I8ny0PAXfw
X-Google-Smtp-Source: AGHT+IHZPfJqsixm6uc/lg6zzYiT2KsF1NW8yxzOJB+8TZcP0UWphjZrw4jjPQBw7Rm3GCZE2RxX9g==
X-Received: by 2002:a05:600c:4e88:b0:46e:7247:cbc0 with SMTP id 5b1f17b1804b1-477c01d4af2mr67366635e9.18.1763839891636;
        Sat, 22 Nov 2025 11:31:31 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fba201sm18314686f8f.32.2025.11.22.11.31.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 11:31:31 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 04/10] libtorrent: ignore CVE-2016-5301
Date: Sat, 22 Nov 2025 20:31:22 +0100
Message-ID: <20251122193128.1703871-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251122193128.1703871-1-skandigraun@gmail.com>
References: <20251122193128.1703871-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 19:31:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121982

Details: https://nvd.nist.gov/vuln/detail/CVE-2016-5301

This vulnerability is for another libtorrent (https://github.com/arvidn/libtorrent)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb b/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
index 28a3e1e77a..3a7eb91f56 100644
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
@@ -13,6 +13,7 @@ SRCREV = "756f70010779927dc0691e1e722ed433d5d295e1"
 
 CVE_CHECK_IGNORE += "\
     CVE-2009-1760 \
+    CVE-2016-5301 \
 "
 
 PV = "0.13.8"

