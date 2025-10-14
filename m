Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49765CCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 13:28:30 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.16366.1760448508510996735
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 06:28:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RD3vFmVs;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-46e61ebddd6so57686885e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 06:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760448507; x=1761053307; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=nJapQa1jEB8aaVyi29nUVADpCERfvJM1ESpR9qP6kI8=;
        b=RD3vFmVsLSPjJgB9v0qSYMC3/o9ulGv9rl1ZP4CBaSWDC5TGcSg2lIJZOiXo8uw32c
         K0XtUMmu0PgexgYaL6Z+2PA0WmKOk68ihGvq79eiVljd5Qg2Bgpk95FypVkZzL6cDVwl
         KadagBAdgiX+VWgnG3TppvagdEwCKvea8vka3xLLzgodoU9umQ+m0oMe+TlnnMTKFO5f
         EbA0enSXNmUygo8g/DPB/fDFPDPjW52tF10nD6pkPLcqX1MHIE1qC/crtUZzpwdtAhRJ
         zkDCL3HTqyBOdSbTyHVV4Hs66q8IOB9S81tzxr+EG0Kixfewq3KlgMqvUmlQ2Pn1ez3g
         5jFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760448507; x=1761053307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nJapQa1jEB8aaVyi29nUVADpCERfvJM1ESpR9qP6kI8=;
        b=TVdFy2KQTkSKqSwmkkalW4olqOaQzc0U4a65maHK4GXmpOlDbAQ6Cv/Z78pd/rdxyR
         WjJR6UY8gtdcjti+2+WRGxiklZwXw+4ZD0tO7SB255Bqov2P7XieueLo/tMfxqB5IhwI
         AqEm+yuEhp1KY6KiC/xZbV0ST1KsXzpwyrZOQM/g3eEGAHJgBCVacWHHPUQ+T/0b4q0a
         rP9raJNbjhnEt6HaKacFLBXeMj83pqy6CXFzwJ4tMT6nHz7/f3U7b/vR309K8VCuwkui
         wSKa0xvd1U6A2D3kPvuTcZgpSp7v5twauFGovLaVzIU+Cmj+C8cNEZ18Zqgc69yRSqjL
         bQ2w==
X-Gm-Message-State: AOJu0YyALY0XDw7Om1OY8kmaHOH4BEv2choRYcMCpzrHo4YXZJTPXaMq
	2j9qMYaeBr7YBTyvRGSrBqypVmv8cpp/JrcwzwKpz0Rgd5DfcLc2CgWtTKR11g==
X-Gm-Gg: ASbGncu08lz6Gqa1YIrX5UqSXCO0/lQZxSFh2eLD/980qLK/a9SASLDY0/5pvztLwjs
	YaJohdV50i+E7zbGYTZKxkD3BbxqJt+clvHsaBPikoH8P8ahYytXqMs+1S6C5mzZzW6Hn4iRXg3
	C4vR4YQmgvBWsqD5ACtfyYTAR8KeBZ/KmiF9p8yG4VLaQe/eVpZEjlbL5sDQMzSVec2wK958HmL
	PzSH87AkrM858Bu7DiPMeyICsXsnxrq7+Co0lTZ503gBLoRaFLlfAP8FxYcDOmD1H31ETEXi1CC
	5LEAe80G9iUm1sFPFhu8RicShIcbwCtkGTSiQCextniHQ3c+xkE5y6s4ofLIgLGluaVx9rVCxPH
	jw58cqGbJ+4ViFRfGh07ZyCPDSH6E1yyEuWe7kQJBtDfg6O2ZVUpkLeygS9pi
X-Google-Smtp-Source: AGHT+IEzX9PFfxjB63tZ5ivDF7ersfejxkftmwSTlwWeq3XHeB6a5K0KNRP/hLds2aT4kWLkilci/g==
X-Received: by 2002:a05:600c:8718:b0:46e:731b:db0f with SMTP id 5b1f17b1804b1-46fa9b08f09mr191007435e9.28.1760448506516;
        Tue, 14 Oct 2025 06:28:26 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb482b9easm247833025e9.1.2025.10.14.06.28.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 06:28:26 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 1/5] webmin: patch CVE-2017-15644, CVE-2017-15645 and CVE-2017-15646
Date: Tue, 14 Oct 2025 15:28:21 +0200
Message-ID: <20251014132825.1052635-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 13:28:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120604

Details: https://nvd.nist.gov/vuln/detail/CVE-2017-15644
https://nvd.nist.gov/vuln/detail/CVE-2017-15645
https://nvd.nist.gov/vuln/detail/CVE-2017-15646

Pick the patch mentioned in the nvd report (same patch is marked to
fix all three vulnerabilities).

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
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

