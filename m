Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 134467F4F9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 21:37:42 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id q139so6704319pfc.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 14:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=L9LPUrbMPN/HFPIkI/19EpdmOVT/J6xJR2XutFKyhpE=;
	b=n8TlsjAQb8d4U1Gh6Xd0vt72hQS+bvj8Yu3grVfZslBjjPjxwshYbkBGmOtNe0oecc
	NDHwFSPvWNojjs9YU2jyRQyCaSe7LX1c+glfhKjVLWGKiJhWZBCw0ejae4reG7CA+9Op
	wPqB+6qC6i8ISFaceBMbCJyf63ZOfkPIPdzzxDjpgBvDFcs5AtjMSfv01yijCZZQRaGw
	Txr8f6jEEljLqPpNsMaGGanxdLEJlz7ZZX+JOmwvyZL3p/6DobHdJwFIUsF5rcUdf7ij
	npeAjmGM8S9QC0pfus1N1QZz2Krl7+MR0rVi8PUn21FU8JlX5eCu6fxzVm9XR/4YAv2Q
	kRSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=L9LPUrbMPN/HFPIkI/19EpdmOVT/J6xJR2XutFKyhpE=;
	b=Wfd/88a5UVNw4iLC6ykmifulmZHGkrq1Ck1Ph7aQBdfn1afyUOC5whZWLEWYMI5Hy3
	yc+rsLwDDcXaUt/pfBEA9MBYvxHUYsV3oQb6WRizTUidwil+4r8ww/VjdW6O4CqLNiDN
	uJmI872e1iTh50oBwjEU6pI5PybyyoGrkVCRNHIIfk7DVGtsEP9bSKPTpDMSmoAXe+uq
	kEBPheeWahrGqzfkVAjDU7Ur75IiU2L4dakIiG6F7CHeo8C6Mnua+OqAdtGbAfTf6UKj
	SAaj4DbO77m1OT5xWVPB62rTtPKh11a/o9oRIHTht9KSJhLT9pXN2gXEETo9miw0u87q
	Rnag==
X-Gm-Message-State: APjAAAUFiQhD2T4VPMH5fXxeV+kKd9Sz1X/T2SEudzbGDfWL9T/3oECD
	txN+XntH+VYWdbMy+T6W/4ERGlYi
X-Google-Smtp-Source: APXvYqydmkJsdP6i7VDQQ8ARdctIwIOV4T8Q1TuojkUMESVhPWBHBj2y4N6TKkkiSOdLuNMXn3+4xQ==
X-Received: by 2002:a62:15c7:: with SMTP id 190mr2968695pfv.107.1567287464086; 
	Sat, 31 Aug 2019 14:37:44 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:8107:6109:754a:f033])
	by smtp.gmail.com with ESMTPSA id d6sm9443836pgf.55.2019.08.31.14.37.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 31 Aug 2019 14:37:43 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 31 Aug 2019 14:37:37 -0700
Message-Id: <bdc3e00d673dac367f20bcf2a32bfed2f871a2a0.1567287402.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567287402.git.akuster808@gmail.com>
References: <cover.1567287402.git.akuster808@gmail.com>
Subject: [thud 3/4] apache2: Correct appending to SYSROOT_PREPROCESS_FUNCS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 31 Aug 2019 21:37:43 -0000

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

A missing space lead to problems if something else was already added to
SYSROOT_PREPROCESS_FUNCS.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb
index d58ccb8..c6961ef 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb
@@ -147,7 +147,7 @@ do_install_append_class-native() {
     install -m 755 server/gen_test_char ${D}${bindir}
 }
 
-SYSROOT_PREPROCESS_FUNCS_append_class-target = "apache_sysroot_preprocess"
+SYSROOT_PREPROCESS_FUNCS_append_class-target = " apache_sysroot_preprocess"
 
 apache_sysroot_preprocess() {
     install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
-- 
2.7.4


