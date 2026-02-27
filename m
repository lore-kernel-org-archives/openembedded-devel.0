Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF102FD5323
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 12:03:31 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.94118.1772193806837559680
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 04:03:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BFaskl6Q;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4398ebdf520so1921240f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 04:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772193805; x=1772798605; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BTe8Ire8CFT/w/EU8c4JutNQego3CNpwH8fillQdhAM=;
        b=BFaskl6Q+R3Cuxg6iw9TRChbiZwWoN2sFjqZXW48AVeJp2rDTENnIPDGZsRo1Dqw9q
         Pn11/z7HtlWkwLBp/8WU7ytHux2rB2eS8H4ZPEtFcEIoi6/e4MeAEVJzHHeV/RilmNLt
         /UU69S51AGMfPFrmr8p1ZjQCu2zjrdZlz1M5I5etSjfu4cjGSO08sKxnxue5WeHAVv/n
         Myt1XPxyjf5iU1oq9nCgqbFPKjZUOoJ7oZ6wH9BdwZebgbJMfMNM4hwSEkwxYSoBG5SY
         r0TT/R49p7zGKovo7eeM2O2MUR3L+1o/w/DOLXKQo27xv3DbTgA2LZgK5PkbZw0s1PVI
         d57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772193805; x=1772798605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BTe8Ire8CFT/w/EU8c4JutNQego3CNpwH8fillQdhAM=;
        b=DsGSbfDMKudi/4U9XmHK9AzXKJmxQ2+oThKzFW5Zf8FxeqevN5ki/AvPQCM4yvGC0R
         Ziz03N9x6z2rtEpuZlXZ6Xe4CTkQ7IEkR4iUDkHeOUnwVbXI/a/AiLEXeTIqsrK0nk56
         LCj1KyuWpEVdyryMRgTX8JeHb2QpnTJ7tjw39cdY5Tp5Qgwg5jQSBsB4V7Is+i7TzsSq
         eRf4OHlkv625wiL+kzEha+kRiuOgUd6qAzCuBM3t57UYSPq0snJm7oQMpUtM/SliM8RC
         8TlQZsJNdJtzbgurh560BYb1S7aQ9ux6hec+dvwq5WY+9K29A79dw4jumG1cR0FFogoF
         ZqmA==
X-Gm-Message-State: AOJu0YyzEK93/HcQpN+zfOlHqvieYnhMpdLY0q1mnwb8dIKOJESCc6tq
	hJCI0i8f4K7Nw+31UINcmoizogKG2bk7hgCe0EcMckXv77COedMPs9onSJB/6w==
X-Gm-Gg: ATEYQzwB4Q/EBxcIh29jgHYKLusWVAEJB4JDqJBAJXCR1GJrsnrZI5tEP+Z5WlvUJYI
	TcRF+3BI7Iog0fW6qetTUwe7sYr4j/q9ECOAWOgSxhOlEUuzcAbGBZ0uSs4Fsi9yfvfdE9OS3kc
	bsVoe6ev5/HeloFWRqlL5gqZaBLMIb86F9gkPnxo4zwQ/dlME7zIF4WpICgbd+SvvvnNx4dtn+I
	agFfmiQCkdjzbKzP8XOn+v6+FkGWKZ4jfBqa7GPr8+CsnloN/wOHZeD5FAyqQhVTIg1kLYMMUUk
	Dr2hzNyhdKKfg5guleQwTMLMjD0meHDXaiwohYY43BZBNSVjTERYmqDHXRIjf3Ba0ZhzMRc8MHX
	e9htgFVrNWzTTxJCiL4qWFPOvUF+r/AeC+y/8Bg/0dDvA9cEdLkbE5IWkO2azLzfwZ2TbRsU0sf
	plgvqi13g3MdmXQJTxskWY
X-Received: by 2002:a05:6000:2013:b0:439:8f6f:1b32 with SMTP id ffacd0b85a97d-439971fca67mr12596942f8f.25.1772193804791;
        Fri, 27 Feb 2026 04:03:24 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c70ff6esm9829566f8f.12.2026.02.27.04.03.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 04:03:23 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][kirkstone][PATCH 1/5] webmin: patch CVE-2025-67738
Date: Fri, 27 Feb 2026 13:03:19 +0100
Message-ID: <20260227120323.333696-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 12:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124753

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-67738

Backport the patch referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../webmin/files/CVE-2025-67738.patch         | 37 +++++++++++++++++++
 .../recipes-webadmin/webmin/webmin_1.850.bb   |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-webserver/recipes-webadmin/webmin/files/CVE-2025-67738.patch

diff --git a/meta-webserver/recipes-webadmin/webmin/files/CVE-2025-67738.patch b/meta-webserver/recipes-webadmin/webmin/files/CVE-2025-67738.patch
new file mode 100644
index 0000000000..3fb71fec37
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/webmin/files/CVE-2025-67738.patch
@@ -0,0 +1,37 @@
+From 21d9cbdc2b719e9d1349f14e03b5a041b476cce5 Mon Sep 17 00:00:00 2001
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
+index b75f9427..41386d35 100755
+--- a/squid/cachemgr.cgi
++++ b/squid/cachemgr.cgi
+@@ -12,6 +12,7 @@ my ($mgr) = glob($config{'cachemgr_path'});
+ if (&has_command($mgr)) {
+ 	$| = 1;
+ 	my $temp;
++	my $args = join(" ", map { quotemeta($_) } @ARGV);
+ 	if ($ENV{'REQUEST_METHOD'} eq 'POST') {
+ 		# Deal with POST data
+ 		my $post;
+@@ -21,10 +22,10 @@ if (&has_command($mgr)) {
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
diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb b/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb
index 78ab19601f..a03f44437d 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb
@@ -24,6 +24,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/webadmin/webmin-${PV}.tar.gz \
            file://0001-Object-names-cannot-contact-special-characters.patch \
            file://0001-Foreign-module-may-need-a-check.patch \
            file://0001-Add-missing-permissions-check-when-saving-allowed-cr.patch \
+           file://CVE-2025-67738.patch \
            "
 
 SRC_URI[md5sum] = "cd6ee98f73f9418562197675b952d81b"

