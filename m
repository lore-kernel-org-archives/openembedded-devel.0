Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88930CCD19A
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 05:50:47 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6153.1763445045071360044
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 21:50:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YUye9DMo;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-29845b06dd2so58717205ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 21:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763445044; x=1764049844; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLTc0IQF5TNZkIrjE5bYWapC/+HaYB0v43ExkW/sbHM=;
        b=YUye9DMoNqy0/kUbdsD0rupOftj82OkYHplNghLY3OurK0GBWcJumtPj3+N42zmWhC
         QM4oCAJx5YGci/plX/Nad4w9cYvykhc+JoVt3MGnQz+q1saLCF08jLDWMJbfe30ywUU4
         oi6MIodqrnDJBdn6hcAuAj9YyD7j/VewUqB2UPofM4cRwc6LoEPStN2LF15BL3papV/v
         Yk/p2PvepviSxPdK4XLGBJfSnHm7zYoTgkiyIZaW7AeWm/0gwAbjqr1PFJAWPQE27/eM
         RU/XSd+0+kya1J6XztwnMkRTypQsgtoePfYZNFiV6XX2Ck6Pbl4qxM/LloXCMqLw2myV
         yQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763445044; x=1764049844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fLTc0IQF5TNZkIrjE5bYWapC/+HaYB0v43ExkW/sbHM=;
        b=EG2OzReMigb88opdw6C8p8IJD9n4xOWJ8jDDgG3Oq3iO/X0LXhMHWM1UT6K66+q4kC
         UIUrXraDY3/dL4yCVZZbd/PNYKbsxtoSrx07BHkLYpo8BZihhY6s7MferfSapxCGUujN
         RuLt2JCr3uZ079NOozJJAOzo7JHWNd6f74WkkLpXSGptqGQLghY1YrDP8SzhtKDu1pb3
         0jz3IFjsmzzXFPldIKSKJswQJGi1p+Wso1VlZOZQk2tS2sHoNMLA1UCkfNrNr+VGRFdN
         X76/o5jbCm0YO7I3A/RGObklyN4wmdhJqehoFa7gIUTuYC01XhbZSNwc9z3hir79rvWj
         Fd6g==
X-Gm-Message-State: AOJu0YwKxShe3iRvZ1JxHxtFSDam7D2Z9204HYlVSP7LpMVg7Tc/JHa0
	FTb/iF2aN6emP6kxX0Ps7n7zDRIHiOifucYdkQxToBP0D777WsjrIXNbTePIfQ==
X-Gm-Gg: ASbGncvBpBs2jortkeL4VmeQo2Mxcpox6cVy3zY0bemBJtIUJW3mUYVpNzqyD8khrNl
	isv/YuLe//XE7odFtKBkeBb5ZAlhCBIoPgYK6cohaUx8T9uRxyVYQg0rVtAduzSpHjSaJoq+8Ik
	KYVVELqKc2h8wFQPumxROQdUXcUVdHfMAwdhDLkYLnvwU56sqyLk7Tl22EWLNoLmf7y3ZWK5Qq6
	FZ7q5ooirnA6tO0/6/2qP72ewYdsBlyCnsFTqZWVUDtaxKXRILWYFDCQbEqlpO9nkm2vJAnXtFk
	2HPCfbr5nHoKLYmOewcAyyVgDCOiWZWZ6p3vQoCbVNvmXQZBB1SxUMwY0Nz0226boLWghaym9c7
	WyeM8cZKaR4RG2awkUnVKIIJrA97Z6D3A2PmFgexF0CjiBmYOe07XR+P9VFRtmUiD9l+LMHF96y
	2OluOTV0vtKqyXzgBlFmlS6cdGu1VR8a72taY=
X-Google-Smtp-Source: AGHT+IE9pMCf1Rw7cJZg8RBSK7kOYLirnh0qkmtVE8RmoHQkRf2g6t4ksT4KlNKqj9KjKh8/Eap90w==
X-Received: by 2002:a17:903:fab:b0:298:648a:f96a with SMTP id d9443c01a7336-2986a767da7mr170602185ad.61.1763445044224;
        Mon, 17 Nov 2025 21:50:44 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.126.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2986a60b116sm126822955ad.79.2025.11.17.21.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 21:50:43 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][scarthgap][PATCH 3/6] webmin: patch CVE-2017-17089
Date: Tue, 18 Nov 2025 18:50:24 +1300
Message-ID: <20251118055027.1334922-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118055027.1334922-1-ankur.tyagi85@gmail.com>
References: <20251118055027.1334922-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 05:50:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121806

From: Gyorgy Sarvari <skandigraun@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2017-17089

Pick the patch referenced in the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
(cherry picked from commit 85933945fba1096bfcb1d3e723dc50bac3416867)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...0001-HTML-escape-command-description.patch | 29 +++++++++++++++++++
 .../recipes-webadmin/webmin/webmin_1.850.bb   |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-webserver/recipes-webadmin/webmin/files/0001-HTML-escape-command-description.patch

diff --git a/meta-webserver/recipes-webadmin/webmin/files/0001-HTML-escape-command-description.patch b/meta-webserver/recipes-webadmin/webmin/files/0001-HTML-escape-command-description.patch
new file mode 100644
index 0000000000..f4078c7f4f
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/webmin/files/0001-HTML-escape-command-description.patch
@@ -0,0 +1,29 @@
+From 0d5e731a173767e7e4ea2051a7a33c8e5cc57880 Mon Sep 17 00:00:00 2001
+From: Jamie Cameron <jcameron@webmin.com>
+Date: Mon, 27 Nov 2017 08:50:15 -0800
+Subject: [PATCH] HTML escape command description
+
+CVE: CVE-2017-17089
+Upstream-Status: Backport [https://github.com/webmin/webmin/commit/a9c97eea6c268fb83d93a817d58bac75e0d2599e]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ custom/run.cgi | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/custom/run.cgi b/custom/run.cgi
+index 327de410..375b041b 100755
+--- a/custom/run.cgi
++++ b/custom/run.cgi
+@@ -40,8 +40,9 @@ if ($cmd->{'format'} ne 'redirect' && $cmd->{'format'} ne 'form') {
+ 		print "\n";
+ 		}
+ 	else {
+-		&ui_print_unbuffered_header($cmd->{'desc'}, $text{'run_title'},
+-					    "", -d "help" ? "run" : undef);
++		&ui_print_unbuffered_header(
++			&html_escape($cmd->{'desc'}), $text{'run_title'},
++			"", -d "help" ? "run" : undef);
+ 		}
+ 	}
+ 
diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb b/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb
index bc71c74474..784e3b69b9 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb
@@ -20,6 +20,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/webadmin/webmin-${PV}.tar.gz \
            file://mysql-config-fix.patch \
            file://webmin.service \
            file://0001-Escape-potentially-malicious-HTTP-headers.patch \
+           file://0001-HTML-escape-command-description.patch \
            "
 
 SRC_URI[md5sum] = "cd6ee98f73f9418562197675b952d81b"

