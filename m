Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5157D5B85F
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:16 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.109.1730140093266474226
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 11:28:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kG+u62Bu;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e38fa1f82fso41508267b3.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 11:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730140092; x=1730744892; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17i4w6KM5jL8uPqULvrdvWpHaWTeN0QnJi/U4VEVRa4=;
        b=kG+u62BunK9gEO6MDxOd5z+HMDPRJGlRF5ca8bBZekd0s5g/jvdqlIhzUWXaiQlWi5
         nZKMI0LLpDdqTJmOfRZ50IWui9LhXyLLK1fAbLVLEOu0vJe34P0CbsWUG2jGo8CoAGAT
         rIESfDD9XQcV18igkFU2XCW2BnNrOtL4m9sMT4b6efIbJ/5ft13TtMNddaFX/8GcTteT
         pyepVDfvrLmlqCzbHXPCX/ExkSoiRfQ73hS01276tCFfMiKDNtJZEncFtkpYMYR6xTGE
         yCAJ5asXsbitBNvr8/a/LTVgzwd22HaWWJ70bsX9Ojwfk1d5scsfHvnifPtPzSJNCIOV
         IrmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730140092; x=1730744892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=17i4w6KM5jL8uPqULvrdvWpHaWTeN0QnJi/U4VEVRa4=;
        b=aTj0a7hYhw5AewjR3oTAamjc72M2CAAwb79JMmQpE4xAUgevSaojWLcHELjmqm5+gF
         q8x9+SSi8hTi6Lr1dVzwrl7DXeiWd2vZV5NZMkQp+/2mFbdvYm/SuCQJFQ0+RYJVq+xi
         Y11WX8lqoHKAwCv+V0nGPpDFMo9fnRU75Ug6zP8uPxxtCI/+mYr0v4/VkQqGP9EAbfCV
         5QqFURtS++OzniyrnuKguJ7A+QH7nrQzaPt3K0RxkX8zgSDc/CI5dyrvpu8wRDonBQ4w
         V+Mx3sBmq/scLeqI7V2F+jd4yXJL8ZBhK1n/DsLwPMOOxx844R7bCkwvXxsJ+jfumxEM
         6vbg==
X-Gm-Message-State: AOJu0YxWqg0VK0HmY2VwYFnKe8lyPAAWPmGKDl3vW62yeQGOv0J6O8Oe
	h+fQjo+3dkP7AoDEP55WEn/VmL3/yRvGEoPvPHNL4vF4OGnPT2sdBcUdjA==
X-Google-Smtp-Source: AGHT+IHza2lt1QCepvIxikCk4VNIvEsolU4nlbwQgNqxLz2VgF6nZ8QFi4X+n+nCBZ0syCxqQeb2ag==
X-Received: by 2002:a05:690c:dd2:b0:6be:3601:7189 with SMTP id 00721157ae682-6e9d89ae873mr86513927b3.10.1730140091826;
        Mon, 28 Oct 2024 11:28:11 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c770cfsm15493397b3.99.2024.10.28.11.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 11:28:11 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH 02/22] libcgi-perl: Use
Date: Mon, 28 Oct 2024 14:20:18 -0400
Message-ID: <20241028182749.5058-3-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028182749.5058-1-schonm@gmail.com>
References: <20241028182749.5058-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113270

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


