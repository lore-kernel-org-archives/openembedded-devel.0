Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 70417788F7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 06:03:18 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id n15-v6so1896109plp.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 23:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3+MG1MwSms0eII7124PUAk2gkBc4VbYPtvdjsJ/5j5Q=;
	b=uJ7yMNmhNvOlTWHKml15McyJf1QR6J/vMTCX0tSTGqYDW66VtSyx4M8T7AqXJwVLtJ
	T0fKXPam6xlr8/oqJX4LqvlxummpLPHBXt6UlJt9vwYucpEzTVG+gSMu+2mANoW5cm3r
	L1mJg80e2RSpkZ1Y615NWvatAs6mggM4PpdElQX0w+FwAhw6FkW+NhpCSO6jKIjWB9EY
	NtvnaVZrbY6TQ5YtTkS+CxE3h24ZrQNUL37zxXKrap/uT5dEgnl6GWIkwJx1378a4wMt
	NsTH0kjwMVbFQ4CmbWjRcaLKueV1dBSBYZOexn+2ikxdqpIvNWtCOZeBPG8nw9pwRgPf
	Lvqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3+MG1MwSms0eII7124PUAk2gkBc4VbYPtvdjsJ/5j5Q=;
	b=GIGQ6+eR+hy+9AEQqH1Br8A+gvoGCcNDwOh08eTH+BB8llBuKFPNdqD9rhi7/5lQ/v
	YPx8mnbPJI+c7/G+p0JOol2pk2ZHpSgPvqYBYUrzX6ez0ajpoObLih7P3x0b0VDRUXtL
	1K0KDjfad4qOYYTZIyHumPLOgEq/Wc8tUD3DE5hYlDfVns684hopzjxeik963GrkeKQe
	03ogQa/+W3Odph5lZ98qxlW5rnWQlb10p7Pt8dj2gTGflLVy0U9wRp7OjOPwIxGQYBG6
	ontzVGCTakyEqe8GaerfKJZE1RcWQRxoeyQGzNgxj9PEG/66ts7kYlT1zRH9fmPrN0UV
	N2aw==
X-Gm-Message-State: AElRT7ESzZmsXdRXoiTAh3hS1gda6jyQ0p6DZB4sSziubULwNhSSUUs/
	MOcAUCtIKAvGfqa5WV/AZ8mg1g==
X-Google-Smtp-Source: AG47ELsFiKWhCAyhISBn+H1g2kFsdBl6WPXShWRtmyMLR1RBOZ7ooVHgbAdfpKNv3qZWTf84Z8Hj2Q==
X-Received: by 2002:a17:902:10d:: with SMTP id
	13-v6mr10965326plb.266.1521439399571; 
	Sun, 18 Mar 2018 23:03:19 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	a22sm5047426pgw.10.2018.03.18.23.03.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Mar 2018 23:03:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Mar 2018 23:02:47 -0700
Message-Id: <20180319060300.5366-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180319060300.5366-1-raj.khem@gmail.com>
References: <20180319060300.5366-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 05/18] samba: Refresh musl pam patch
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
X-List-Received-Date: Mon, 19 Mar 2018 06:03:18 -0000

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
index 27918d2a0..a50b24de5 100644
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
2.16.2


