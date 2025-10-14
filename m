Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A5A0CCD194
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 13:28:30 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.16367.1760448509134584710
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 06:28:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jwobLIci;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3f0308469a4so2928538f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 06:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760448507; x=1761053307; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T0mcQUVw7egCWPdIodM2lj7P56PiztHOdlc/SNUdQJA=;
        b=jwobLIciXiMGkT9d24XrP89TV7CNbqLDbBdtqUD3CAwTLA3Tt6WxC0pWCXLXXspMpA
         kAZKkHrB5AzV/UpxXB5rGinttgz+jCJ6yzlJiQS9l+av93G/pDELy+MYxfPognTonOq3
         K53qOLz/obGpWztSubqeeAAlWapx9MNeuyjl9lPlUcfWXNVOp9gRm92Fid7mglpI86hl
         XWirQRCzKxOtGb47kI6GKqEPYf5qRf+GZictDbGOe45ViYOcZoFGmWtD9qmPsbejqgqo
         /EXNUoQxvFDTj0TDsA06SB/manq6ZjLfBn/Q9gP/zCovxgZ5/ylC0PVqNiiHN4htwRkO
         i8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760448507; x=1761053307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T0mcQUVw7egCWPdIodM2lj7P56PiztHOdlc/SNUdQJA=;
        b=GmUdmr/eM1kmvTYbFpSD3m6WOVAacV7o4pDEqakmnrwwQueES6UGrNQFBsbo3WQPdJ
         n9Kwrtmf4/dgWfmRUX68h9wy32Pooozf6PFyajfmZVLvkX67Wp1Ezad4AKJda5AP5lzH
         6cRC5PEod9oFX5SW2G2+v8y0kqLnPkLB3dfHm5TuPmjD1fFsBpMpPFNsFW9NKsPzTrET
         GJng5vaWrI7TW3tKuvOsdYxduWWt8IiIt29F/gPKZ+pFY7R3m0w8ViMT2LgTtIHK3eiv
         4fsvmPG4j9gpzAm/nvvz7BdhzFx/8TRh0vf0TIHqYpYwYHMRmXLUAbkIQokhYWDRiDOC
         bP1Q==
X-Gm-Message-State: AOJu0YwcvEYxurcesm5YjiLZ4TVOk96A8yLyKEBsLCs4JXJddnDVWmqm
	1D4+Vs+b6FAa7qZ0dkYs/c3A89aO5pX5qsWvWu4XQox7zPQiyP0QZy9n62JSaw==
X-Gm-Gg: ASbGncsoS7moQEXmNg8Le48m6pO05QsoRn+jMcT9f51ptiFrJ3OXCy1KpK9N7OqYLCv
	AKMaVrRruSrpU0vFkzVUVxxUwaoOD8ewKgwwqxWMpIsETaa3mxV2Kqcou7qhVhwcPqzUXCucKWz
	MMeq6Y11EItJjAdr6RlebVOYgB+exBRu0VrALJUYXddivoEIlwFnoGFAdOXAenICYPYUuvyvtlw
	w+2C6XXcb5pDf9j6m1JqB27rCfrEBj/D1np3qwyQigrdHuJqgoOPVrzKdzYzCOwNZr75do1Im+a
	qOkSw7dpZFDif2VfZPkeAkPj0uIALCITHaiTForC7f0MXKo9HGWSkdbqBnQFxUIHhSAFQ+bOjfl
	VxaZU4rHdXmv1Nwjh7/PyxEnSBkNBf47zyyIyuIOoKmyQBRBkVA==
X-Google-Smtp-Source: AGHT+IHazqgg4dZQcvJHMLImsD9fziQZ/vLwOXsCXHlgeSfui8n4CaFyy6uZbwJrPGh7VUeofl1FSw==
X-Received: by 2002:a05:6000:4284:b0:3f9:1571:fe04 with SMTP id ffacd0b85a97d-4266e8de175mr16175088f8f.48.1760448507198;
        Tue, 14 Oct 2025 06:28:27 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb482b9easm247833025e9.1.2025.10.14.06.28.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 06:28:26 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 2/5] webmin: patch CVE-2017-17089
Date: Tue, 14 Oct 2025 15:28:22 +0200
Message-ID: <20251014132825.1052635-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014132825.1052635-1-skandigraun@gmail.com>
References: <20251014132825.1052635-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 13:28:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120605

Details: https://nvd.nist.gov/vuln/detail/CVE-2017-17089

Pick the patch referenced in the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
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

