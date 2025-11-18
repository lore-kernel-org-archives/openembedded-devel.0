Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61FD0CED243
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 05:50:57 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6154.1763445047468618540
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 21:50:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dRy4SBic;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-297e982506fso61675395ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 21:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763445047; x=1764049847; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kr8d90d+HRMDHJ6SwfJRqax5dzpYNS1TC6kq9it8zsg=;
        b=dRy4SBicWE6ms0rbe7OX3L2FhS+8Htf0acMHdvGtrqBDzqxXREm4mQeXfcJU6z2xTD
         2QR7e1WG1tZ3Raha/dPU4ZyEbT7jJAIZN4yAlGRv6pYl8TpxCu5UPDkpv3MsKs427cqX
         PQQw33LdhRewsTyZuBANWSV1DdIGKyqkcH1SC2g7FqtpdfLvya7OOy/DTBhTf+MNdWiD
         6EFv5aqWvpH4OUuRytCaIaEjyVE769lDJ6RFrqUfI4BjlzTGatQoAjhPsS0+jE4pjHsT
         Rdi3w9PpyBQO9oyJ7aDUDyWZJg9uK9zW3cLrQ9y4piXdoa/OUUpIHk0o3wOooOevxmw9
         5MjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763445047; x=1764049847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kr8d90d+HRMDHJ6SwfJRqax5dzpYNS1TC6kq9it8zsg=;
        b=RQkHBF2u2SK7PnUQCnAdd9OiyXPPdC0f9VGTdfw7h16RSNUGPOLKJsoud8c9jca9HB
         2GR/qvIArVO5aeDo9DqxYMwSwJiB83cogX9Tw5fmYBMJcnmEnVCmG6luoynLEUDFjO8N
         0SNDxKKBx5AQgJYoRSIJ71xtO0ICzbdjeZsaeHdqELXHQ+bnP5bPfyrdIEqIftMzG9hk
         LoW3yr9vSpZ38T/Pa9X9edfPynXqy+QnXp0NWDNLpSXQWp91NPu3zEqOrayyrs4jrDir
         rbXDDwxdbhuhii6RNUClAiqvsNx9OAgIcvHRNdXQD9CCH6zCueiBRLoogOgDGH4PVupe
         La6w==
X-Gm-Message-State: AOJu0YxJNL3MPzKdXoGTYP3cn0sMFORXmB6sEkN0oyx0Nj+QMSkh6uSN
	Xj07s9K5OKnUqQUDYOhbqEs83p9GrMtiQD5xGx5Em6llynEZ6r0nf3qOTBEryQ==
X-Gm-Gg: ASbGncvhb22TBwYrIlPmmEWgi0SLUnn1ISxhiqJviNMicotteBNYchoqH7IvqHfP2Jc
	3OkZ5X9reO7T2ZY8UnQ2XWXgLBx8etdxB7u3t27skLyj42pw07fIeBW3LA8NrbrNp7TSjQjScb5
	INZ2V/DJBE3h5xEIEzQf7V5CgZmKdUXvgnXAqJXQJPr8W4EgY1MTlCvHdg77h35LiyfXuiqbEEW
	KaXJcu0yZ06HKa1O/7l+pQ1MXJvOiQT2CFrHszdY7Ax1Hkj2U+OMrCnXoqt7nMRKuKiCMTKJtRm
	vBfCZFvk58kE4Xmu7AFvCAqgHHtzi974STmpIQK3khe5v9DDwDTHBbiJdhJ/UtDa+jf9LKsguw0
	DaLbiR+zPXt7v49Ol2XgfxrvskHjW5BOExlzCjcR2c4VR26m5Qls/5ond5lrR/gJnpe8bGK/st0
	zFKRkG6IONJZmib+BLrHQJZecJ8uyCl/wIeQs=
X-Google-Smtp-Source: AGHT+IGW0FMs2XwYNOoxmsup3Cw5kzrgjsUYNGGwfxJp7XC9dEo7AFvG2dmlXDMTJkDAjF9Bspn0MQ==
X-Received: by 2002:a17:902:c942:b0:296:ec5:ab3d with SMTP id d9443c01a7336-2986a782c9cmr196988105ad.61.1763445046650;
        Mon, 17 Nov 2025 21:50:46 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.126.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2986a60b116sm126822955ad.79.2025.11.17.21.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 21:50:46 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][scarthgap][PATCH 4/6] webmin: patch CVE-2019-15642
Date: Tue, 18 Nov 2025 18:50:25 +1300
Message-ID: <20251118055027.1334922-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118055027.1334922-1-ankur.tyagi85@gmail.com>
References: <20251118055027.1334922-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 05:50:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121807

From: Gyorgy Sarvari <skandigraun@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2019-15642

Pick the patch mentioned in the nvm report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
(cherry picked from commit 241abdec1282b65eab79923434a059e6d6f869f6)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
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

