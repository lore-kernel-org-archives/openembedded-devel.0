Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81F3ED5B84C
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:16 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web11.130.1730140098035062795
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 11:28:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nJdVwVNo;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e2908e8d45eso4412355276.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 11:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730140097; x=1730744897; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbJ3GiuGoDQFFpbojUMwfYaXcoR2ghjRnnEjfnsy3CE=;
        b=nJdVwVNohdg+3upVCYCKtjQgfBigNd7sYXpppZvvvMsgqVxZoA4LdeXegik//1mAhE
         56Ja1RriWagRio1plsY0Vq+WpFFjgvJCvNHAAQN8BPV8/JVCsUqiy0aL6Tq1CyayLFhZ
         Hby0UL5d7KhTaWmwEh/zpHj/Rd1tLAEtKe9PZlfPxzAXm//qEchjdzPWJTH5+E2tO37S
         m2UZwGkzWNUWNwZ3rLX/rcTxbvv5c6oz8pgISDanmqXIm+IehR1bRWMBocSDMmySs9sH
         XchU/FNI055EAqOJuOLs5XzOMS6n/5UX2H8W7QZmryLwasjnxvQYBhw7Jxg7CpTYoebZ
         CXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730140097; x=1730744897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CbJ3GiuGoDQFFpbojUMwfYaXcoR2ghjRnnEjfnsy3CE=;
        b=A6G9YAtaqhyzQFzYZSGuH4AfL5U7uzgdYOxkCU4JWrK7lbKsuASjNDPtVSM4XRQwtz
         Q5YUbIwef2vaYuMgerkX+AXBPNGNn7jdyYOesGFaC8zd/vwDuYKWKonMVDqs95TxXEYM
         HmFpNuAeqic2OW9EzxxeOeYpLgd12rW1TX1dNKvOWPFEPLGncptpAsfNUSvxekmmQjtv
         vmWk9Tt/ppIH+1gaGvP5HCBzY3qeUUmj9yZi6WdIKuwQ25YRYFTVKj99bx11w/C9kaDH
         tJYpF7RZ4EoUpQDWyx5TZ1zPUC10RsACTM1FU6W01Cuh7VRAkMAOFglEdMfm+MyzJ9Ys
         NLMQ==
X-Gm-Message-State: AOJu0YxxXIb8iCVB/i5tVKZ4cDUSy7Z9mhagCqmdDoA7zGlzc7jCqRM7
	dWMZc+KpY/Lr2UCWXXDIAeakGfXXgcFzWuijhaDAE+jGoLh2y5zNTcVz7Q==
X-Google-Smtp-Source: AGHT+IHgezTDWZCPuVy/A87Jro685QAgzo2ZyaVgNlMjskubpn8IaxLUh1yjjJ52YIT0/cg5+6XNkw==
X-Received: by 2002:a05:690c:6786:b0:6e3:2ea5:729e with SMTP id 00721157ae682-6e9d899d231mr106185407b3.26.1730140096647;
        Mon, 28 Oct 2024 11:28:16 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c770cfsm15493397b3.99.2024.10.28.11.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 11:28:16 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH 09/22] libfile-slurp-perl: Use
Date: Mon, 28 Oct 2024 14:20:25 -0400
Message-ID: <20241028182749.5058-10-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028182749.5058-1-schonm@gmail.com>
References: <20241028182749.5058-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113277

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb b/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb
index b9ef4c8bb..7a6a9aadd 100644
--- a/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb
+++ b/meta-perl/recipes-perl/libfile/libfile-slurp-perl_9999.19.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://metacpan.org/release/URI/File-Slurp-9999.19"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
 LIC_FILES_CHKSUM = "file://README;beginline=37;endline=41;md5=255fbd5f98a90d51d9908d31271ae4d4"
-SRC_URI = "https://cpan.metacpan.org/authors/id/U/UR/URI/File-Slurp-${PV}.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/U/UR/URI/File-Slurp-${PV}.tar.gz"
 
 S = "${WORKDIR}/File-Slurp-${PV}"
 
-- 
2.43.0


