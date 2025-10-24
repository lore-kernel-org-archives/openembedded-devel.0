Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E398CCD1AB
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 11:11:40 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.7690.1761304298849277997
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 04:11:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j6KyU7iO;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-475c696ab23so11303235e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 04:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761304297; x=1761909097; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lr3/LskXIDyYZ4oPcLFYKafkdqnKGsg5MngFMWEsuwo=;
        b=j6KyU7iOrtYdE6KtsVGeZN/yu7t7ixoleX5h4POPHeLpMm6fHFJNCcYfu3+96OEr45
         aq3vL3wze59XbG5dV1M9EIWAdFXfzftOVqGHzBOwM5VAiEIoDSe/IR/SKX02nfC58mIz
         yT9vivd6NlkLISDTAB2vcFNRTz3+g7HWJvX0cFQ+Y1+hOXYy3Mrd3zo2xJqXriVMdAZ6
         VMqYFj/EQqwhd3INmOplfg1JiRhYUEpd1ArQTgzCivAo23fCffJR8F8ORb+XId79pP3C
         UdQy1kWgQ3u6R/iFuW7guVF06C/wKKUXUMctDnmnTY7Weue5uhdArnjdAgH/NAILR+VR
         hgRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761304297; x=1761909097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lr3/LskXIDyYZ4oPcLFYKafkdqnKGsg5MngFMWEsuwo=;
        b=YivjROvag2ZPZ9PEowr/yp0TvW5aIikcX4wZxihd1BYtT6JXE8Px79nx3HD+cDaaL8
         LhDQR+7tSn5Cvw8/U0I7k8dLd+RL2+/fXeN6ONY3suvAv4j2I28x4LzrJ7++PdiVGgpT
         yrKwntu4MLvsY3hSN51zC1Pc2nNhoNEtv8AXruIgHD8Vwzj95JMRkAAU11snaQWbzjxF
         shXzakrO6BhYfwquO5uxnr4ipCNwrvy9W6OyzaKw5+B4NHw7Dp7Ga67M6K/mH9z7C6PF
         rRg3I2/2XR05AEH0nmy0lnQM54kBV5NAm/tsx0ct1JmJZozqKZeK1aSRi27btaT4sK4N
         m3+g==
X-Gm-Message-State: AOJu0Yz8kXih2YnF55Y51E/FtB2C8onM8GRSJZ4FTPn2ziZrluQJk+yz
	RY5TThhapl8QOoAmC+N2TjSM7HAaOWQ62zf2KfmvBnCs+2+AVocw8TdN0ie+kA==
X-Gm-Gg: ASbGncuZ7LNMMg7Jr7nh4ExDIjGlU6EiZ4XG+qv22b09ZfOG+2XgiOiaET3jLMuLGw5
	/ZAOJTqU7hwSYrcOjk4F1jmqTBlOAHGHGyvRHZh+GyiOxAUVuNJzxUKLxLrNB9EBvW+XfPiYxL6
	L47IjwhLZEWpIEdxnJoMGAPsGZOba9zCsO6eoG0FLXFVbYxLC424lakSU3VEfwRyX75H0d5HeqX
	t0fniWGkOL6zPk7E118hYjb1xYWFAQB/mcUPV6Zv1w8QsBmHRFlAaMvARPB8hU0l94HU7xUYdAd
	LdyyVyJKVI82EfLWJFxCIhW89CNvtZYJVuxEFXH3fxBt6ZWQJCtyXXKKdN/Qhvh4Ja006thq78c
	E29X+k0jSVg2z6YOBmeLwdidOcxB+nIVZXHHtJZ6fAWH3RmSMJ+jV/0T9lNaHYyMya8Zn5+BP/A
	==
X-Google-Smtp-Source: AGHT+IHABlzVSvo9dkE5IKGlzLVKC7Qyy4mlrrucBEGlOfsofUwGoeruVPO1B+GrRWNWR9/nDsrTtg==
X-Received: by 2002:a05:600c:3f18:b0:46e:6c40:7377 with SMTP id 5b1f17b1804b1-475d2edaddbmr17528085e9.35.1761304297170;
        Fri, 24 Oct 2025 04:11:37 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429898ccd88sm10574669f8f.36.2025.10.24.04.11.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 04:11:36 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH 1/2] libauthen-sasl-perl: fix ptests
Date: Fri, 24 Oct 2025 13:11:35 +0200
Message-ID: <20251024111136.1174582-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 11:11:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120951

Add missing dependencies.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-perl/conf/include/ptest-packagelists-meta-perl.inc      | 2 +-
 .../recipes-perl/libauthen/libauthen-sasl-perl_2.1800.bb     | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
index e0c5707f4b..ab875beafd 100644
--- a/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
+++ b/meta-perl/conf/include/ptest-packagelists-meta-perl.inc
@@ -7,6 +7,7 @@
 #
 # ptests which take less than ~30s each
 PTESTS_FAST_META_PERL = "\
+    libauthen-sasl-perl \
     libcapture-tiny-perl \
     libcrypt-openssl-random-perl \
     libdigest-hmac-perl \
@@ -27,7 +28,6 @@ PTESTS_SLOW_META_PERL = "\
 "
 
 PTESTS_PROBLEMS_META_PERL = "\
-    libauthen-sasl-perl \
     libcgi-perl \
     libconfig-autoconf-perl \
     libcrypt-openssl-guess-perl \
diff --git a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.1800.bb b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.1800.bb
index bcd155ff6f..46a8506f10 100644
--- a/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.1800.bb
+++ b/meta-perl/recipes-perl/libauthen/libauthen-sasl-perl_2.1800.bb
@@ -26,4 +26,9 @@ do_install_ptest () {
     cp -r ${B}/t ${D}${PTEST_PATH}
 }
 
+RDEPENDS:${PN}-ptest += "perl-module-test-more \
+                         perl-module-findbin \
+                         perl-module-test2-api-breakage \
+                         perl-module-tie-handle"
+
 BBCLASSEXTEND = "native"

