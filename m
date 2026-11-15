Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3856.1794728995309808663
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:49:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=JtCOxrFL;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1429245eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794728995; x=1795333795; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x29MVVJDYqYUtw/NCb5eiOblQurM9OLT5/7dF8MkVi8=;
        b=JtCOxrFLTZ7lOzbHE3vSTnftL8ThSc6+ZcSJ3N6h1R30VOisTFBNZJot7Mgo5pL8N4
         +Sxpj96MZWxQQP6zWB6dYfIcxp7mQ2m3rsv52EI8nfbCYtoT1JAbwkVLeLfq470Qne14
         7jLLTFlit55Pwrpys6CNea8jpEN5fhavxvUSn69kVWTupvc+kv5tU8B3YtGkK1KtLNWX
         PGrDzE3gZ7ksGmcpkczpo5fxWyvE70LhvvN8EshHobJSPl3CkFh/olm/815rZoqtdTg9
         rGJ2DpEdAEKwV1q9DraQT4OJFdOfluoYMR4Ue4SxNqDvrOk1d6Jbv0O+rQJyBgS5+DJ+
         DfDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794728995; x=1795333795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x29MVVJDYqYUtw/NCb5eiOblQurM9OLT5/7dF8MkVi8=;
        b=R4duhvfQnnL0GtcLxI77Ivdf6zPbgFa1UDplmJsbpiFaHV3bc/ZuniUg+vOpR74aG5
         v2Cje4bsMaUDuUgWZchLZY3bbwxlDnGdBKnezWjNGNg6iS8+oZW4COeG3ZQjbhYMnhCN
         DaYHOTHWNqxI2wfasDRLLB1uQzHQhTsaJtPTGMFYH2qtXzQhnQrYG7JIHGRt3yt5fYKZ
         ymAnSK/J9Y4mOy4OqIpY0rb6rjcTbDs91cQeUBJi1yKczg1g4VN22CpFAO1vmhGC6fY2
         FuKnd/gW5rqRk+gOioT6JVA3eM+XaBr+uqoKQyKU9Fj0ceeIX0ik2SeyQVQuSm+iW88S
         o95g==
X-Gm-Message-State: APuU4Z+z3aIcT9Mvs3GBwYHsatqUnm4Cixu77NZGgRsWNM35O+opA0Rw
	Z7RXSNZs6AH+cLPzBk+EsNqOLuorxYzyUH/G4SjupX8HS4jgefZZyaSAF/S0GEnh
X-Gm-Gg: AYBFou2Xkis4c9LqzO1xaXf8f9sJNFWS6R8YX4x332D2yvcDGZQoWu5y9K9pNRInzUC
	081xB6A9YOZMBGtWBmNGih9aKAlxm7hRR0H04+pocwMJdKSPs9Ws0iSvjtKE4v3h2IRPf+W7u3Q
	vpdZGyX/RbmNwuVzUC9jW0X+WTGpyD2MgFzzMX3LGra5BZItz52VknbqXj8Vj1BvONiEtJPmptc
	4xatlhd1I53kAzSCDM0KrDHfv8CK/IXnZ1YfqMZAVGVjoXL54ULSKmNFkWSiS0UhgpXzHnfJn2C
	Wfiqm9Hw4RI7WSBzZQwFSg8bXPg8sj1npa5I5ngDKg31kkflSIoangs1UyqvwIQf7Gs8jm3Z30p
	bwiz4uIdp08zc+9KkPekyRAibhaLR8FnNcptpQyS9/ibrTLe6yIvJawNU8qpAcq6CxJuiSWLK66
	J73sgfyLXtspxitWLKi9oS2TXr/HTKpg9Iz/nBmBrZtSRq2gwvPdVMDo0df2mCMQHd1dYAyRS46
	f+oytbPNjZpNMmaAi/dx/7UNZELcYsEjq1idL0UH9LHrb1nyF/l9QTmBUAnbh4HQSy5h9E+NWcN
	IuO2y9zpNE+XDl0lrGH2CcVie4BF3Bj+6rNq5olnGAgnMnJeAZoRFAAReYTmGzYSdNszMsd61JX
	MlW2iSY6X2EixarfUb0Wg6bzjML5R6q6EqVk+sL9gD42/fDVQ/lZkouLcsWXieclnEe41qWQUJP
	3LhrggOFOgWWPHQWt+Q2fBu30hZ4FFhrKq5j826mSUsY4HWdwkgPd395qaKTACrN/aXn2L2MWEn
	Hbct1U7phg7Ex7+sc/D2UgCxTBd0tVUBjsOEjx/DHAb70NAbdU7C802REnrkaNyKbU/OEZ0/WT2
	MfYF
X-Received: by 2002:a05:7301:fc08:b0:36d:3c0f:cc6f with SMTP id 5a478bee46e88-379633768ccmr7002839eec.3.1794728994577;
        Sat, 14 Nov 2026 23:49:54 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:49:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 21/96] lvm2: upgrade 2.03.43 -> 2.03.44
Date: Sat, 14 Nov 2026 23:47:59 -0800
Message-ID: <20261115074918.2932593-21-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:49:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132291
Content-Type: text/plain; charset="utf-8"

Refresh 0001-implement-libc-specific-reopen_stream.patch. This also
upgrades libdevmapper, which shares lvm2.inc.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...mplement-libc-specific-reopen_stream.patch | 22 ++++++++-----------
 meta-oe/recipes-support/lvm2/lvm2.inc         |  4 ++--
 2 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_stream.patch b/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_stream.patch
index e157c5518e..941ce2ee03 100644
--- a/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_stream.patch
+++ b/meta-oe/recipes-support/lvm2/files/0001-implement-libc-specific-reopen_stream.patch
@@ -16,24 +16,22 @@ Signed-off-by: Dengke Du <dengke.du@windriver.com>
 
 Upstream-Status: Pending
 ---
- lib/log/log.c      | 6 ++++++
- tools/lvmcmdline.c | 6 +++---
+ lib/log/log.c      |    6 ++++++
+ tools/lvmcmdline.c |    6 +++---
  2 files changed, 9 insertions(+), 3 deletions(-)
 
-diff --git a/lib/log/log.c b/lib/log/log.c
-index 90905e629..ed69662d0 100644
 --- a/lib/log/log.c
 +++ b/lib/log/log.c
-@@ -165,6 +165,7 @@ static void _check_and_replace_standard_log_streams(FILE *old_stream, FILE *new_
+@@ -165,6 +165,7 @@
   * Close and reopen standard stream on file descriptor fd.
   */
  int reopen_standard_stream(FILE **stream, const char *mode)
 +#ifdef __GLIBC__
  {
- 	int fd, fd_copy, new_fd;
+ 	int fd, fd_copy, new_fd, ret;
  	const char *name;
-@@ -211,6 +212,11 @@ int reopen_standard_stream(FILE **stream, const char *mode)
- 	*stream = new_stream;
+@@ -228,6 +229,11 @@
+ 
  	return 1;
  }
 +#else
@@ -44,11 +42,9 @@ index 90905e629..ed69662d0 100644
  
  void init_log_fn(lvm2_log_fn_t log_fn)
  {
-diff --git a/tools/lvmcmdline.c b/tools/lvmcmdline.c
-index 22ae1e3bb..b0928bc04 100644
 --- a/tools/lvmcmdline.c
 +++ b/tools/lvmcmdline.c
-@@ -3427,7 +3427,7 @@ static int _check_standard_fds(void)
+@@ -3425,7 +3425,7 @@
  	int err = is_valid_fd(STDERR_FILENO);
  
  	if (!is_valid_fd(STDIN_FILENO) &&
@@ -57,7 +53,7 @@ index 22ae1e3bb..b0928bc04 100644
  		if (err)
  			perror("stdin stream open");
  		else
-@@ -3437,7 +3437,7 @@ static int _check_standard_fds(void)
+@@ -3435,7 +3435,7 @@
  	}
  
  	if (!is_valid_fd(STDOUT_FILENO) &&
@@ -66,7 +62,7 @@ index 22ae1e3bb..b0928bc04 100644
  		if (err)
  			perror("stdout stream open");
  		/* else no stdout */
-@@ -3445,7 +3445,7 @@ static int _check_standard_fds(void)
+@@ -3443,7 +3443,7 @@
  	}
  
  	if (!is_valid_fd(STDERR_FILENO) &&
diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 62e0b725c7..6d32f9938b 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -18,8 +18,8 @@ SRC_URI = "git://sourceware.org/git/lvm2.git;branch=main;tag=${PV_TAG} \
            file://0001-include-libgen.h-for-basename.patch \
            "
 
-SRCREV = "7b0bce6909611966bdc1e17c2408e1ec3b0f8c17"
-PV = "2.03.43"
+SRCREV = "78606201edbdb0d1a47d622dd4a58fd52aaae4a1"
+PV = "2.03.44"
 PV_TAG = "v${@d.getVar('PV').replace('.', '_')}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\_\d+)+)"
