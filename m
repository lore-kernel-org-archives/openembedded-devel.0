Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id C1186784FE
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Feb 2018 07:46:32 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id 36so756468ple.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Feb 2018 23:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BjrKzEZNc4AjiLAAg2ydaNfG8E2pvQ0GD4b3vCHohfg=;
	b=s4QI3wL+R2tRs8TQLvx8Wp/Iih8zgqy1rVYKUdFMA4a8Np6CM7wSpWJg83YQg6KPdb
	jxH26c1o3D2xvVKSVsmGdxg7Xo0T5wGwjJsXok7CJOMbl60BZwsrJzacJFsoCD7uWwyn
	0FoY1PSiIPdrnjJ8isvcDT//Q8NEwjOtav9azyKDDQyp5ZV2rEo4NFdMjKALBMl3XBj2
	/CDncRf2bbJ2FRuxjaD1UYzvMrl3S2p72v8BfUtMJdveGIsmSk03hjY3HUxt9GsC3o/r
	tGURF2L0XAjasfVit+Qy1nwpVX4FEUx26MgFjUn6wr7dJCX05+7t0QYlKQCjO5i1UKmV
	nf2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BjrKzEZNc4AjiLAAg2ydaNfG8E2pvQ0GD4b3vCHohfg=;
	b=ZHxQ1z7d/X7NFNukXwY9mLGOhH4CJNaCtLBQ1HUsIXhV7rpISoR+IPC7Wb5s8oEvCF
	qk4+re8pDheOT8n/ybMjRphKeoevlm7JcmDJy6e3DXvF8ByiLpN7zudaUp9kMjVk4Oho
	YslldC/esbZvuMqjsUwWU4+x0vhrcTuLPFdQcVgQDOjaceI1/S4PMQVMDldnfjwUxgBN
	ZZeRYoYQB9In86yVY0CO7ezhPuGva5cqeH91xa+O79tp38lwc2Z5A/rFaLpQDr2VMDic
	nGc4TfVWw1ESZJEnI8p/334n4IJfb5Xep7+KlAvRkvgOixlGu+BR9Zy/F6a8L3myx24s
	Wqow==
X-Gm-Message-State: APf1xPBwm0BwKkDYMlvQwf+YWbGvwhcLSRTi47vDTh0XxCqGlckVxwo6
	YdOrXK8GShzAHICgTGXJ8q+DKw==
X-Google-Smtp-Source: AH8x225Ich9OZOvEmzwqHwOh1mYr1hTzixz7QwrdAgFbJPER7/3d77lRNnY6y3LC9XmKO8RMuq6pPw==
X-Received: by 2002:a17:902:223:: with SMTP id
	32-v6mr1572459plc.77.1517903193831; 
	Mon, 05 Feb 2018 23:46:33 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::5590])
	by smtp.gmail.com with ESMTPSA id
	s90sm20976060pfi.139.2018.02.05.23.46.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Feb 2018 23:46:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Feb 2018 23:46:18 -0800
Message-Id: <20180206074619.22165-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180206074619.22165-1-raj.khem@gmail.com>
References: <20180206074619.22165-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 5/6] samba: Refresh musl pam patch
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
X-List-Received-Date: Tue, 06 Feb 2018 07:46:32 -0000

last update left the musl builds broken since the
patch was not forward ported

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{samba-4.2.7-pam.patch => samba-pam.patch}      | 21 +++++++++++----------
 .../recipes-connectivity/samba/samba_4.7.0.bb       |  2 +-
 2 files changed, 12 insertions(+), 11 deletions(-)
 rename meta-networking/recipes-connectivity/samba/samba/{samba-4.2.7-pam.patch => samba-pam.patch} (73%)

diff --git a/meta-networking/recipes-connectivity/samba/samba/samba-4.2.7-pam.patch b/meta-networking/recipes-connectivity/samba/samba/samba-pam.patch
similarity index 73%
rename from meta-networking/recipes-connectivity/samba/samba/samba-4.2.7-pam.patch
rename to meta-networking/recipes-connectivity/samba/samba/samba-pam.patch
index 6b9ade920..0cbacb6c0 100644
--- a/meta-networking/recipes-connectivity/samba/samba/samba-4.2.7-pam.patch
+++ b/meta-networking/recipes-connectivity/samba/samba/samba-pam.patch
@@ -4,12 +4,11 @@ http://data.gpo.zugaina.org/musl/net-fs/samba/files/samba-4.2.7-pam.patch
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-
-Index: samba-4.4.5/source3/wscript
+Index: samba-4.7.0/source3/wscript
 ===================================================================
---- samba-4.4.5.orig/source3/wscript
-+++ samba-4.4.5/source3/wscript
-@@ -873,7 +873,7 @@ msg.msg_accrightslen = sizeof(fd);
+--- samba-4.7.0.orig/source3/wscript
++++ samba-4.7.0/source3/wscript
+@@ -875,7 +875,7 @@ msg.msg_accrightslen = sizeof(fd);
          if conf.env.with_iconv:
              conf.DEFINE('HAVE_ICONV', 1)
  
@@ -18,10 +17,10 @@ Index: samba-4.4.5/source3/wscript
          use_pam=True
          conf.CHECK_HEADERS('security/pam_appl.h pam/pam_appl.h')
          if not conf.CONFIG_SET('HAVE_SECURITY_PAM_APPL_H') and not conf.CONFIG_SET('HAVE_PAM_PAM_APPL_H'):
-@@ -945,6 +945,15 @@ int i; i = PAM_RADIO_TYPE;
-         if use_pam:
-             conf.DEFINE('WITH_PAM', 1)
-             conf.DEFINE('WITH_PAM_MODULES', 1)
+@@ -952,6 +952,17 @@ int i; i = PAM_RADIO_TYPE;
+                        "or headers not found. Use --without-pam to disable "
+                        "PAM support.");
+ 
 +    else:
 +        Logs.warn("PAM disabled")
 +        use_pam=False
@@ -31,6 +30,8 @@ Index: samba-4.4.5/source3/wscript
 +        conf.undefine('PAM_RHOST')
 +        conf.undefine('PAM_TTY')
 +        conf.undefine('HAVE_PAM_PAM_APPL_H')
- 
++
++
      seteuid = False
  
+ #
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.7.0.bb b/meta-networking/recipes-connectivity/samba/samba_4.7.0.bb
index 686998e5e..8a031eb5e 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.7.0.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.7.0.bb
@@ -26,7 +26,7 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://volatiles.03_samba \
           "
 SRC_URI_append_libc-musl = " \
-           file://samba-4.2.7-pam.patch \
+           file://samba-pam.patch \
            file://samba-4.3.9-remove-getpwent_r.patch \
           "
 
-- 
2.16.1


