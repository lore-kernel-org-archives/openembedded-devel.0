Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 371A7CCD195
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 13:28:40 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.16243.1760448509773590396
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 06:28:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EyHkEckM;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46e33b260b9so43163715e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 06:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760448508; x=1761053308; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r4nriA1AqW0guOiLC+keFrKmHLDCEGuYEQdG3753tz4=;
        b=EyHkEckMPFpold4nVSGR2A0US3Z5VrWIztnsmXozJSEA3OM0XsWorMduAsXgDQlbAV
         jTHMkLMPbAMvUBly+zeN6hOfJUjAGh6WA7y5GJhcUhugdls6fiaaFRkLW3Cp3X0Ow7tz
         vJbOSfz26r8ZWxBAr0luYaKWZk/joFuSaHUWNwciUpacqx/+UV6wt6J4NGPnq3CJQqt7
         xBa/YkrS3H2hqo9mz1As6KuG/o37ZzO0eoi3ee0BUJrmmbzMZOrjB6cJ/9F4m6CFXBcm
         iu+AA3ee8aDagfKNE+AZOpBYAGxWYDc4YbvR4XfJXOXm5rz4Pe3OQuyCk/Fo6YI4wf6v
         zQbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760448508; x=1761053308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r4nriA1AqW0guOiLC+keFrKmHLDCEGuYEQdG3753tz4=;
        b=FYZ/wtFfojpPK3SMPSkYZ10XWvrYuKIPAGBDgLEEolKgFrArpdgJ229Wb8igNO2h77
         GfRsgnUIS+1DqA/zUoYOtSlQaXGH+UhaAGXKZL7T8Tyy505RrXhaEpTX5PRq8pjej3yx
         dRGL844DBkfZT2HEDvi6nHEXx7xW0IXFB/8cqNGwNs+636W5WkG8G07+lyPAVCb3Sydc
         s6bRvYMKdkQALaRujlGl8LYLwBUOqGmuCRO4mwBYLK73sq0Esfjxx+ZA11aZKUi6j0QD
         2Sf6HL4/o/Zdh4fEnsKbfpSwRLFaAK/WrafVNMjvSzfhE7zz0EQD/axy+6tGk8MVA3DW
         Dc2Q==
X-Gm-Message-State: AOJu0YxrS/Yl70PVKDJyJId7hMGgrEfXqd25NmBbNQ2f6t/nPs7zOKEZ
	A+2dFGo+/BfCIF0anWfpQTnS9/TNRZr1DhoFq08WLtskwTmIyG+7yZiXE9BiXA==
X-Gm-Gg: ASbGncu4KGCTCCoVNHtArYY8BJ6M7XwoU3qu0aVJx1BSDNxuO/B9rYwkn7vNwmysrIV
	qUbFben6FaBGdlX/YUmKOPH/sR79vRaMSl7oK4Y/QGuq6tCA4+Fn2bgSOfLPV7Zx6j8Tm02ApkT
	pg+Yb2U+cymwyzKKL0OCmZSoZneb5nzNYev+0IsRd9aaxh0jpAfg0U8M6439bBCCaZX43BeD2/m
	Bk4egG3mq9zYmhcW5eSIlW8QsLlbPqZLydZJ+7QlkV7FdJtGmsSiEGtTGgr5Z3b64ldbX3lTDSf
	CxbF+QxWK6lyHqrXni7qAhH2JmHD0rsA3ZqYHALRmPgHXPvK+8KcWrj1PpXOvaDsUhawvToZOUL
	tsvSoz7X3ZifjHnHPIDkZRNRXbVOm2RoK6d5hR7E++ggEPWytNQ==
X-Google-Smtp-Source: AGHT+IHdeQPurC5JjEE1mnZpMOw7Ln1wx+M9e+yVSH+1HRHB5hGbdN8MMjYkUYbosTFf6LOPqp+9Aw==
X-Received: by 2002:a05:600d:420d:b0:45d:cfee:7058 with SMTP id 5b1f17b1804b1-46fa9af9041mr183790895e9.22.1760448507926;
        Tue, 14 Oct 2025 06:28:27 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb482b9easm247833025e9.1.2025.10.14.06.28.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 06:28:27 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 3/5] webmin: patch CVE-2019-15642
Date: Tue, 14 Oct 2025 15:28:23 +0200
Message-ID: <20251014132825.1052635-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014132825.1052635-1-skandigraun@gmail.com>
References: <20251014132825.1052635-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 13:28:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120606

Details: https://nvd.nist.gov/vuln/detail/CVE-2019-15642

Pick the patch mentioned in the nvm report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...es-cannot-contact-special-characters.patch | 26 +++++++++++++++++++
 .../recipes-webadmin/webmin/webmin_1.850.bb   |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta-webserver/recipes-webadmin/webmin/files/0001-Object-names-cannot-contact-special-characters.patch

diff --git a/meta-webserver/recipes-webadmin/webmin/files/0001-Object-names-cannot-contact-special-characters.patch b/meta-webserver/recipes-webadmin/webmin/files/0001-Object-names-cannot-contact-special-characters.patch
new file mode 100644
index 0000000000..9abb02a6ae
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/webmin/files/0001-Object-names-cannot-contact-special-characters.patch
@@ -0,0 +1,26 @@
+From 8470368e42af2b66a31a112299df6239fccf111e Mon Sep 17 00:00:00 2001
+From: Jamie Cameron <jcameron@webmin.com>
+Date: Sat, 3 Aug 2019 22:41:37 -0700
+Subject: [PATCH] Object names cannot contact special characters
+
+CVE: CVE-2019-15642
+Upstream-Status: Backport [https://github.com/webmin/webmin/commit/df8a43fb4bdc9c858874f72773bcba597ae9432c]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ web-lib-funcs.pl | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/web-lib-funcs.pl b/web-lib-funcs.pl
+index df673bb7..bbe154a9 100755
+--- a/web-lib-funcs.pl
++++ b/web-lib-funcs.pl
+@@ -7102,7 +7102,7 @@ elsif ($v[0] eq 'REF') {
+ elsif ($v[0] eq 'UNDEF') {
+ 	$rv = undef;
+ 	}
+-elsif ($v[0] =~ /^OBJECT\s+(.*)$/) {
++elsif ($v[0] =~ /^OBJECT\s+([A-Za-z0-9_:]+)$/) {
+ 	# An object hash that we have to re-bless
+ 	my $cls = $1;
+ 	$rv = { };
diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb b/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb
index 784e3b69b9..cc31ff35a7 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb
@@ -21,6 +21,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/webadmin/webmin-${PV}.tar.gz \
            file://webmin.service \
            file://0001-Escape-potentially-malicious-HTTP-headers.patch \
            file://0001-HTML-escape-command-description.patch \
+           file://0001-Object-names-cannot-contact-special-characters.patch \
            "
 
 SRC_URI[md5sum] = "cd6ee98f73f9418562197675b952d81b"

