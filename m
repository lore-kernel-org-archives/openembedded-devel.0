Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78D48CED243
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 05:50:47 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6151.1763445042610911626
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 21:50:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PgHO++Gg;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-794e300e20dso4229689b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 21:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763445042; x=1764049842; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fZesO0aCBX8rXCqIwc91FCesBMjvQOI0boGa0Z6uccU=;
        b=PgHO++GgIAJHXKrcWgkIxV2RZpyLzJm183euhp2Wi/nVCLLatDHLrcNa58AiMC/Yz3
         9iAWyTFXyc/QfvXvAUylXu1khxzyzvOFHwBKZyUrmAsoHqbOD5F1HshzpRCSUmZGcqPQ
         UmAV309DoXfOAfDUZPPsbYlBlHA+X5HvEUbrudj3ppaZOpg0koI3I9NvBuGEbYvlu/dW
         Z4glqwRq0/GRM8R3vGnVSkiFlXtRhKAjWOQY+XdTIZjd0QAnVDm2rZim6XQshE2kRtEW
         Z8Y0g6s36xKFxXR04LjULU1Lr0NKz4o8PJebIEHt4z088CctWPF7WGiV5ELHeTUM6O2y
         ofJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763445042; x=1764049842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fZesO0aCBX8rXCqIwc91FCesBMjvQOI0boGa0Z6uccU=;
        b=oMP+Q/rXld/CDC2paDP/ZSUOJa72HaiVSVHJCgioueozxrZlk/MJnPx0pMTHpw2aIX
         5SsObUdw6bqIfMsqyj2ysTuPkicXdDeNb1XNANDD1PZzXLGQA9jG9KE90AFnIpgpqQoj
         6iBjy6X5rnv/hP5lpcdxsgBEayqEHG5AF4OyFUMK+nBlmg4BdoZ9VoT5Tr8vQ3P4+ici
         /p2v8x9zW14SgLZcllqLUxAvKZmVx9KRLbfJIHcSm7g19jg15EUoCCsiCEH8xrxyo4Bd
         l1mEDdxj3mq01IwATsslZ5/VEgWTChCRje99Vz91JvcE6WSJwM+oZ8opbwwb8zYC6tqU
         qAxQ==
X-Gm-Message-State: AOJu0YzSA8e7SDa5HqowykBZHOTQ6lLRnnHd30uwqOb9ZjdnPl7Lnjn5
	TTEvcjP5wgxFlayaJLZnpJXyPdTbXBZG9o6n51cRacAvI2u/vFLfQ2u9DNGlxw==
X-Gm-Gg: ASbGncvJf8+w2WcSQMoYdWI79Bo7ZZ92uDJCGSrzQyKRURbd6SS0rJwz7DxaGauzeXY
	M6Ui7ilztHi+KO74WWTAiRgQ2gWcBYsye6Y83onb7qAjq4AtHwdqcWZAhn97ranmZcJE/0XZNdb
	z+Oy3/KuEnYcmPqKXfWY/Ziw3mKu+uwyZlUvXFu4MJGWBylUDD07zGcDfTX4ho5CXIxCmq1aq/d
	kwZSVgYIAhaYpHXBmH+MdaT1i/cdQlbvMHxkfb+HSDStr2h3iv5hxwbj7xRho130+IzYNxXdKwy
	/IZyBJI+4mzysKhIunCDx33wdwLpLU5E8jehR67zujVI/AbSEa+EHVQWazp8zwlpFh8fGpo+ny4
	xiuxd4jhHtWHmHHGubdxA4fYkRFBkX553b7aUuvNTautl9ckZuytAXEsALhSSB1k+m6Na7X/ED/
	D6rDIC3by2OiuDcT3cdmhfrJ2MNeq7YKM7tfyo7iyoFQhpMw==
X-Google-Smtp-Source: AGHT+IH4OQCAfHzfROX26J6qzDcrCx+r4pv27w05v/o8HW9zeZC5AN58nJmD1y7BmAB/ylLCvHyCfw==
X-Received: by 2002:a17:903:19d0:b0:295:557e:7468 with SMTP id d9443c01a7336-299f55b6a2fmr26960605ad.28.1763445041695;
        Mon, 17 Nov 2025 21:50:41 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.126.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2986a60b116sm126822955ad.79.2025.11.17.21.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 21:50:41 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][scarthgap][PATCH 2/6] webmin: patch CVE-2017-15644, CVE-2017-15645 and CVE-2017-15646
Date: Tue, 18 Nov 2025 18:50:23 +1300
Message-ID: <20251118055027.1334922-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118055027.1334922-1-ankur.tyagi85@gmail.com>
References: <20251118055027.1334922-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 05:50:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121805

From: Gyorgy Sarvari <skandigraun@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2017-15644
https://nvd.nist.gov/vuln/detail/CVE-2017-15645
https://nvd.nist.gov/vuln/detail/CVE-2017-15646

Pick the patch mentioned in the nvd report (same patch is marked to
fix all three vulnerabilities).

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
(cherry picked from commit 4c602e88b9b2f4babb367d5b6ae7099933976b15)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...e-potentially-malicious-HTTP-headers.patch | 53 +++++++++++++++++++
 .../recipes-webadmin/webmin/webmin_1.850.bb   |  3 +-
 2 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 meta-webserver/recipes-webadmin/webmin/files/0001-Escape-potentially-malicious-HTTP-headers.patch

diff --git a/meta-webserver/recipes-webadmin/webmin/files/0001-Escape-potentially-malicious-HTTP-headers.patch b/meta-webserver/recipes-webadmin/webmin/files/0001-Escape-potentially-malicious-HTTP-headers.patch
new file mode 100644
index 0000000000..f5d1a7d0e5
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/webmin/files/0001-Escape-potentially-malicious-HTTP-headers.patch
@@ -0,0 +1,53 @@
+From 5a06f972b1fd64f3da46187edf4998af0266a53b Mon Sep 17 00:00:00 2001
+From: Jamie Cameron <jcameron@webmin.com>
+Date: Tue, 5 Sep 2017 10:35:44 -0700
+Subject: [PATCH] Escape potentially malicious HTTP headers
+
+CVE: CVE-2017-15644 CVE-2017-15645 CVE-2017-15646
+Upstream-Status: Backport [https://github.com/webmin/webmin/commit/0c58892732ee7610a7abba5507614366d382c9c9]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ web-lib-funcs.pl | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/web-lib-funcs.pl b/web-lib-funcs.pl
+index 1fcd96ab..df673bb7 100755
+--- a/web-lib-funcs.pl
++++ b/web-lib-funcs.pl
+@@ -2308,7 +2308,7 @@ alarm(0);
+ $h = $main::download_timed_out if ($main::download_timed_out);
+ if (!ref($h)) {
+ 	if ($error) { $$error = $h; return; }
+-	else { &error($h); }
++	else { &error(&html_escape($h)); }
+ 	}
+ &complete_http_download($h, $dest, $error, $cbfunc, $osdn, $host, $port,
+ 			$headers, $ssl, $nocache);
+@@ -2336,7 +2336,7 @@ if ($line !~ /^HTTP\/1\..\s+(200|30[0-9]|400)(\s+|$)/) {
+ 	alarm(0);
+ 	&close_http_connection($_[0]);
+ 	if ($_[2]) { ${$_[2]} = $line; return; }
+-	else { &error("Download failed : $line"); }
++	else { &error("Download failed : ".&html_escape($line)); }
+ 	}
+ my $rcode = $1;
+ &$cbfunc(1, $rcode >= 300 && $rcode < 400 ? 1 : 0)
+@@ -2382,7 +2382,7 @@ if ($rcode >= 300 && $rcode < 400) {
+ 		# Assume relative to same dir .. not handled
+ 		&close_http_connection($_[0]);
+ 		if ($_[2]) { ${$_[2]} = "Invalid Location header $header{'location'}"; return; }
+-		else { &error("Invalid Location header $header{'location'}"); }
++		else { &error("Invalid Location header ".&html_escape($header{'location'})); }
+ 		}
+ 	else {
+ 		&close_http_connection($_[0]);
+@@ -2411,7 +2411,7 @@ else {
+ 		if (!&open_tempfile(PFILE, ">$_[1]", 1)) {
+ 			&close_http_connection($_[0]);
+ 			if ($_[2]) { ${$_[2]} = "Failed to write to $_[1] : $!"; return; }
+-			else { &error("Failed to write to $_[1] : $!"); }
++			else { &error("Failed to write to ".&html_escape($_[1])." : ".&html_escape("$!")); }
+ 			}
+ 		binmode(PFILE);		# For windows
+ 		while(defined($buf = &read_http_connection($_[0], 1024))) {
diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb b/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb
index 35ec09daea..bc71c74474 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb
@@ -19,7 +19,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/webadmin/webmin-${PV}.tar.gz \
            file://remove-python2.3.patch \
            file://mysql-config-fix.patch \
            file://webmin.service \
-            "
+           file://0001-Escape-potentially-malicious-HTTP-headers.patch \
+           "
 
 SRC_URI[md5sum] = "cd6ee98f73f9418562197675b952d81b"
 SRC_URI[sha256sum] = "c66caa9e4cb50d5447bc8aceb7989d2284dde060278f404b13e171c7ce1690e1"

