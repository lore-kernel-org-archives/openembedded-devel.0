Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7989ED3E78D
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:57:59 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.30357.1730838828291239830
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:33:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WUGTIHxY;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e38fa1f82fso10277197b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730838827; x=1731443627; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3qjwDIFkoWG8zeaGcGovEyJSFYq17pk+hyMAoZ1FDA=;
        b=WUGTIHxYJSzzU7jp+1A1VRxlsqaXkTIUy3o8BGj1G5LXSP6tLNPaYB9GGuQaavpcPl
         8+lWo4LmG9EbL4UrdNbapcCnDryFvaPO1IKnQaqUzM1BNdrXYeNwDTVkVeWyqRfZJv62
         xikdDh64xkscITDw3a18n6UIfeG4OKSjTIo15HaH4GkT2N362MBx4TW9RYyc047+LY3m
         F0K+/gvAoDIRQlv3oqDZkjnpPjI2M6V4Xepw2UBphSdHJNo2XImEHZ9/X7kKbzy12Y0u
         QjagorjyV/V9iyCQ4uAhVa5gfZUF7+pF1uxdzovmIN+gl6jxjmy6On0YX0IcUUUJI9VK
         cb3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730838827; x=1731443627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3qjwDIFkoWG8zeaGcGovEyJSFYq17pk+hyMAoZ1FDA=;
        b=tkP1q2xCX9Tn/vOtQYAU8LwZR3rpGir7Xh5a2HoskRxiTrIvFIx/bwEArH94l+5oJM
         ykvYP1akhvRm+VhXy22FJ6fJpvecMOaTD67vQk6qoJy9QyBlSd0W3dXjnoFarlJ0Vfn2
         s19vSOE0csNyzO7fFxxqOZwj62mqD2iDwwo/wtPGnUEOF/vxGRD+RCG4e5KK9WMTeKrq
         BOva4geT7xumPt5q86x0l2FVL+oW/DJvkVbHMEzAzcbslm7GB5sDgbAC0DVgJoj9YIvw
         YvzwiKYu/K5+PlR1MUaDVj2uflaol8fKbaNtWySxS8mDfFw0Go2PJPaVanyrFKJkk8+/
         zxyQ==
X-Gm-Message-State: AOJu0YxxBMVAFexxqJpPULwrqJHnRC5zvGHLgYnfQjap36m0Utxdaplf
	133g9WopTnCSX6GwTlNTy8SqP4ARAQvtH8F0IPBH8JlVkqzWvX9HgXPuVa6e
X-Google-Smtp-Source: AGHT+IE8ymzUK6TqN1eTM7q7E4RmwuQ/btHw5DaIO0Wp+kifJR4dnzBMHUNJ0NC/j9QWUkGSOy4puw==
X-Received: by 2002:a05:690c:102:b0:6e7:e5d6:64cc with SMTP id 00721157ae682-6e9d8a22ae1mr320376177b3.20.1730838826982;
        Tue, 05 Nov 2024 12:33:46 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55ac9d34sm24295827b3.15.2024.11.05.12.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:33:46 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 118/161] grail: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:27:43 -0500
Message-ID: <20241105202827.3104-118-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105202827.3104-108-schonm@gmail.com>
References: <20241105202827.3104-108-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113635

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/canonical-multitouch/grail_3.1.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/canonical-multitouch/grail_3.1.1.bb b/meta-oe/recipes-support/canonical-multitouch/grail_3.1.1.bb
index 067052c03..1a5900b78 100644
--- a/meta-oe/recipes-support/canonical-multitouch/grail_3.1.1.bb
+++ b/meta-oe/recipes-support/canonical-multitouch/grail_3.1.1.bb
@@ -16,7 +16,6 @@ SRC_URI = "https://launchpad.net/${BPN}/trunk/${PV}/+download/${BPN}-${PV}.tar.b
 
 UPSTREAM_CHECK_URI = "https://launchpad.net/grail/trunk"
 
-SRC_URI[md5sum] = "0df1b3ec6167920f310e2effe6e2ad44"
 SRC_URI[sha256sum] = "5eed1f650f042481daa3a2de5e7d43261fe343b2a1b1e240f3b7fc26572c9df3"
 
 REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'opengl', '', d)}"
-- 
2.43.0


