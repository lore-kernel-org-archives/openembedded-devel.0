Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EECED5B176
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:16 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.1001.1730142295972370451
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 12:04:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ga4tKGXE;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e2e41bd08bso55436537b3.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 12:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730142295; x=1730747095; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17i4w6KM5jL8uPqULvrdvWpHaWTeN0QnJi/U4VEVRa4=;
        b=ga4tKGXEG22jzIx6+HtcDqp/cyWPpSf+c6+ME5o/8HCMJZ8xeGZc1vqcgrFTRlzKP7
         eHwJTv8mFh7JYWA2GloVt8owW59iEXEFQ72ifmDNoAlZ1Z8AQQdSCGAQxBbOxJpCKP3A
         RW1TymsA3vxfq9zkUvIFIEP/MbkGR5dr+Rv6j+F3QciGjGhB54x1i8JcwKtC4oERI4ZF
         YkMkBHycP7TeeiXEq5UiavQFDP6LsexB8xaS112Rb1UALdNqi4S+Vtg0pgzJoVd463Sm
         wHnjGgVn/NvYhjdlAFzIS1zQU+Rr6Fmb8nhXMxW7POquIWciggywW9a+Sk/3ufX0RKoQ
         36xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730142295; x=1730747095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=17i4w6KM5jL8uPqULvrdvWpHaWTeN0QnJi/U4VEVRa4=;
        b=kNID4JaH3RZVWWHcZqTrduHrhx313izyF0s5BSKaR82q78aadCq2sd3EndX90ipCup
         +Fj1JfeFyCowWPAZuAqod7MWK0MruCocnYrxbpq2qtngUgYCf4IYlF/830i3B93UqGap
         CNlJTtPW3liwZSSVDAfx3Tmr+cpHgVRH0zXtqzmbciiIemKaGpu6XQQl1wR0QJli+453
         gb/R5Vf2M9GmafYf8z50XpxZ6EiEh2Diwc4ylreMiw+VHtutqOibqeGUh1f53TqiyX93
         jQbvtP6yt3OlkR+5FFt+EmrYCtoEjbSsxzVGXNXVullbtdNO/HOl7TFzEbdoOlwslb3T
         hzBg==
X-Gm-Message-State: AOJu0YxkKbaUias2YsEvefwdngu8pYAWDAUtqIBX82Gw/wcorsHi45ec
	8fc9BIgxY9H0fjCpRL0eWHBkrrwn+scvmURJXO5h3GphgAsivb1VLPZEbA==
X-Google-Smtp-Source: AGHT+IESOIqrtglBKgOxro1Qpzc+D0KZ9fMUAQrTix+ig7sDmq9wr/wDzTsokkgTMTBM8irMCBHwDg==
X-Received: by 2002:a05:690c:6f92:b0:6e3:4512:5d84 with SMTP id 00721157ae682-6e9d8b8beebmr93965197b3.40.1730142294489;
        Mon, 28 Oct 2024 12:04:54 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c187e4sm15557237b3.62.2024.10.28.12.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 12:04:54 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH v2 02/22] libcgi-perl: Use ${CPAN_MIRROR}
Date: Mon, 28 Oct 2024 15:01:38 -0400
Message-ID: <20241028190444.10522-3-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028190444.10522-1-schonm@gmail.com>
References: <20241028190444.10522-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113293

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libcgi/libcgi-perl_4.66.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.66.bb b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.66.bb
index 38c2e0fdd..42100acec 100644
--- a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.66.bb
+++ b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.66.bb
@@ -8,7 +8,7 @@ LICENSE = "Artistic-2.0 | GPL-2.0-only"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=415fc49abed2728f9480cd32c8d67beb"
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/L/LE/LEEJO/CGI-${PV}.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEEJO/CGI-${PV}.tar.gz"
 
 SRC_URI[sha256sum] = "4697437688a193e3f02556e1d223015590c1f2800b40becf83dc12d5cc5ed8e1"
 
-- 
2.43.0


