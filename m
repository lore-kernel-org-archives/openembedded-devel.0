Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B123FEC1126
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 19:19:03 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2746.1771874341850954078
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Feb 2026 11:19:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VBgJ2zl0;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-483487335c2so43516465e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 11:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771874340; x=1772479140; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UBfr+VRWPnqOZrQXduzW11lGsq5T+0KEo1XlIWe//Yo=;
        b=VBgJ2zl0dyQ5gGgXr/v+JI5Xn+AAlXh9AM9Mq1uCK0zmyHEml83AyVfxSJ3eAemCVw
         o7KyY1yHFGNpXhNusyTlveLuT4ZkTqxcRiLJVYQEIMbVzcmtesHqwmH11EqkeSsbWuPu
         wPqjR5/m1aV259EDoMn8CtDaTsJpKGa0fSr4NdndvI7UvjuTbO5ogCUuf3gbqLyLRFTk
         qvlRZBdMtygc7twdnkvlf4MHG3wkcMdHeZwFgZwXSIOMDGniIBpz+8BwHL417/s33FRt
         bU3rh0TJxBERUq6NT2YTXjZcd4wmwm8MEPV6gChM3ChKlZCMe4e3OgGao8lwSeWbMGXj
         s09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771874340; x=1772479140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UBfr+VRWPnqOZrQXduzW11lGsq5T+0KEo1XlIWe//Yo=;
        b=dCyXjqfw3FLI5+93IlPi9kcDnvpQZvZgup7t9FpbfRvxsil21vF/MnKAs9eS8Ku4/B
         7K2lnV4LFrmuVADGHrLQuCg/TfIZqxGgpcKCbEDue/ixHzUVdfQNwfarhpOjkiQBm/w5
         JPF9wi/DCenz///xP8VOIQSXpfOHCZAZOt5TIMg4L+ofm1lpTRy18kIvzio225ltdDvQ
         41DLxtXfTVJqg12TL4Xu1l8+FiPX0RqZoSV10M7z7CSYmS41cXmQyYMj/zPEDDMx0mbA
         j1iFMqYfCrR0RYim0MKYOoEj4wE+o7Lik9DXOcVSYaRqfq4UNPJPqwb14xUjzrRzQkAr
         kw8A==
X-Gm-Message-State: AOJu0YwkZvry4rrZb7lF49Jvl0sE7sgC9kh+WE5HDvw3mNmq9PLlZBkz
	lILkzZd8dNdr3tRKNFwi7S7/aARy4sYB+O31+pyojg8PBcETdg4JkC9JCjmZNg==
X-Gm-Gg: AZuq6aIQTkitStTR4cJK/BaAFzv6wv2iCpkM8lER34SOiv52ILOXc3c7v6O48qCDsHu
	+rPChTW58kjG68SFnQWOBp6MqLIGv/ESWAsCKMqVp22rWorUZzN0h4ymjnA4+6PB4onCy+uHNNW
	ucJ5eqWHSz47oQltydRy6opcb5im/6zMRY7Upx/cZEz0Tram22PPhsFuEsW6C+bwzberRIDKlKE
	SziumyQ9VL0LaC637wiv92DeeIKvWVXuO1hDymtyKreYcUi5a8+uxGWdo/qazs99wYEa7FN7q4R
	e8fWV7oroVXLwB25om5XTDaJkEVmQqiiodHcGQioBI9gujE4Gza/JEuKKZTYHrz6MWtHc9mWmAo
	Ev13zHEtnfx2gSUFSYUh0O03RRD2s7PYR9SjthAQ6fCccjxLs6LokCzr8CLQoHI+bfOVrmjYJMK
	35gO0C9rznx6rXjQlh/WcU
X-Received: by 2002:a05:600c:46c9:b0:483:6f37:1b51 with SMTP id 5b1f17b1804b1-483a95ea9c9mr140195005e9.23.1771874340103;
        Mon, 23 Feb 2026 11:19:00 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d54760sm21308781f8f.35.2026.02.23.11.18.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 11:18:59 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][PATCH 13/13] webmin: patch CVE-2025-67738
Date: Mon, 23 Feb 2026 20:18:50 +0100
Message-ID: <20260223191850.1049304-13-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260223191850.1049304-1-skandigraun@gmail.com>
References: <20260223191850.1049304-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 19:19:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124567

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-67738

Backport the patch that is referenced by the NVD advisory as the solution.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../webmin/files/CVE-2025-67738.patch         | 37 +++++++++++++++++++
 .../recipes-webadmin/webmin/webmin_2.501.bb   |  3 +-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta-webserver/recipes-webadmin/webmin/files/CVE-2025-67738.patch

diff --git a/meta-webserver/recipes-webadmin/webmin/files/CVE-2025-67738.patch b/meta-webserver/recipes-webadmin/webmin/files/CVE-2025-67738.patch
new file mode 100644
index 0000000000..b29f813e72
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/webmin/files/CVE-2025-67738.patch
@@ -0,0 +1,37 @@
+From 8729e319979290fea6f4bd8a1664fa41fde24d17 Mon Sep 17 00:00:00 2001
+From: Jamie Cameron <jcameron@webmin.com>
+Date: Wed, 29 Oct 2025 22:02:29 -0700
+Subject: [PATCH] Fix quoting of args
+
+CVE: CVE-2025-67738
+Upstream-Status: Backport [https://github.com/webmin/webmin/commit/1a52bf4d72f9da6d79250c66e51f41c6f5b880ee]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ squid/cachemgr.cgi | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/squid/cachemgr.cgi b/squid/cachemgr.cgi
+index 10548b50..59a4009d 100755
+--- a/squid/cachemgr.cgi
++++ b/squid/cachemgr.cgi
+@@ -14,6 +14,7 @@ my ($mgr) = glob($config{'cachemgr_path'});
+ if (&has_command($mgr)) {
+ 	$| = 1;
+ 	my $temp;
++	my $args = join(" ", map { quotemeta($_) } @ARGV);
+ 	if ($ENV{'REQUEST_METHOD'} eq 'POST') {
+ 		# Deal with POST data
+ 		my $post;
+@@ -23,10 +24,10 @@ if (&has_command($mgr)) {
+ 		&open_tempfile($fh, ">$temp", 0, 1);
+ 		&print_tempfile($fh, $post);
+ 		&close_tempfile($fh);
+-		open(MGR, "$mgr ".join(" ", @ARGV)." <$temp |");
++		open(MGR, "$mgr $args <$temp |");
+ 		}
+ 	else {
+-		open(MGR, "$mgr ".join(" ", @ARGV)." |");
++		open(MGR, "$mgr $args |");
+ 		}
+ 	while(<MGR>) {
+ 		print;
diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_2.501.bb b/meta-webserver/recipes-webadmin/webmin/webmin_2.501.bb
index 2c807947e4..7e09ec3664 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_2.501.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_2.501.bb
@@ -18,7 +18,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/webadmin/webmin-${PV}.tar.gz \
            file://media-tomb.patch \
            file://mysql-config-fix.patch \
            file://webmin.service \
-            "
+           file://CVE-2025-67738.patch \
+           "
 SRC_URI[sha256sum] = "0f2772a582d4c4cf24085993729cfc94df2a64d619cefede5400c24b02efb08f"
 UPSTREAM_CHECK_URI = "http://www.webmin.com/download.html"
 UPSTREAM_CHECK_REGEX = "webmin-(?P<pver>\d+(\.\d+)+).tar.gz"

