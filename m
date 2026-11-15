Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3833.1794729055755702837
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:50:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ulMMlw3P;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36f8cdd30beso3151398eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729055; x=1795333855; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V3jLlCOWZ8s11N0xYkT6BJNTYLSwzqK0wZ4QHWp1Zis=;
        b=ulMMlw3P62yyNLlZXBbA1BUMYMOsAKWBpf3bevZ5Q1sl6y/inAxEGDwA/yGa6mOsF1
         pfI1nK1uNlAHDxwEC+loFTibKkxPnt6jTZuBNRi6vAGBtwpMiXQuYJwCtbBsGF10d0Kt
         uGP75ZX1jEiBxYCYucThF+KqCYdp85t6ViLl+K8LYKkORF5XN0MtNLW28BaP+UsZbDJA
         C9YDeVLKJhf+qhmyCZO21c9jWV//I4gI43cKNoKIAfssHtpPozFgPdZtQZljJwA/Hz3O
         /qK4cekc3+HzK1kAxxtEBp/b7Nz66jKHEkzS3meUyVa6EPGvjh7WBlsEAci6VGG6BDT9
         vurg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729055; x=1795333855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V3jLlCOWZ8s11N0xYkT6BJNTYLSwzqK0wZ4QHWp1Zis=;
        b=MnRa4fQAbkvqxrLYun5roxmoH4jFAZqdiVWRitcI5MSI/aXvl2/GrRhVGSyEvGN4fI
         c3G+YqEFMKJjjZnMagohY5dOFDShocWHX3KQ5ocoGPPuNBIsM0GaxTZKDMgaK17YDeOS
         cgFP6qRLsF5NYJrUFBgT+P/HMl0Ffz9tBe2xfnrvvfR7H8lPYQhVnq943hk/zg6iLWqX
         eR6pEkrMKv6bRvRPNcaoRSZ4dsG/e4fpdqWEZgUKT7hY3vnQiC3hTmlx9EFG6rFModS4
         mfdkO34YZnf/XiX2sW4dptqeOd+gS/qLcujgdEhZGKfMgxsS7gPGPnV+ciikJzRKtfnN
         MfyA==
X-Gm-Message-State: APuU4Z82NTYPJC/oSawKwpEW7DGd35dQw1uKfMnF5gLYcSiz4XJCnZkt
	m0OJ2il8z5irlcoUlvDy9WgKhlCnPhtXgDLJOlOBmtoF39f2qGynN9AJ5VLhFk1v
X-Gm-Gg: AYBFou0THRn53Va9pUSchs7MNUqgje2pXF5Gdx6BJe/a3IANAByo5KJuAeMSFOZL0XK
	TH7EucJCdoHqTB4RV16ixxqoHwitMZRqBaG7xnndXpShXL87ia5V62EIxv4+L1LBeInxMChSbLW
	tyI6hgjZJOkTK3Pld+8OR/zWS9z0gPb5F9eB/ca8CbmQU4K7vx9p+6ommi5NiDDKan/zzCz3uiO
	u+odB+xnnZH/REqngrzUTR2Z7zQJB46o6W86UytzYl7lzLBfmUzVdZf+75kwH4qkmuzn4dXvK7+
	/vKJ1GdT5C1vaGkTZDjmpAdSlZYrEDY5lX1Yvqk4YQylkjwYwJoB8s/fAYMKE33Ms0rhLMKTxb5
	eC+L4xPcvWY4T6to7CoQqlRAqUfN5To3fHvid7Ug65oZ5tfrnbIIGlbg1DGPQ3oACkDab6Lrceg
	OeInX7pQIAlRt7/6yJPshlqI5QaWmEelfV6nNJvlOuM4B3/5hDFIq0sjC+RpxJfr/dW5ITHlTIB
	t4v8PaLBChbZ+fkL/u7mHa4oVOYaLYx4qab4+AcL62jMPM5UegBo8SAWTD6dECqVn8iE5F9Bg6P
	U+3Fz4jNBCc2kp/bGhcksS1ZYhia626lAZlFFZKWvvZsYi315d+4uwbMQMV816PNfXmNC+xGKiu
	bvOHbIBY2PO7TAVenvSfShbBmXcO6xLwMFV8+myd4uoVXTMzPU3v/XnFMNlJvUh7vXooso2r2Jd
	2O+01V6NqJsnli47o2Zd5mWz9Xz/SHh77oggPCD7CMtVqu1muENHGH9bSsUJPjL48KJmcWmT/oP
	lVZEvFtt+NbvoM7heUp2W4JKpiIWhhHqXN8TG6/DCvx5NkWQz94e/ymlyBqLDNUoZs/BHG7iV+c
	dNnT
X-Received: by 2002:a05:7300:d946:b0:36e:2626:4ace with SMTP id 5a478bee46e88-3796365edc4mr7828871eec.5.1794729054991;
        Sat, 14 Nov 2026 23:50:54 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:50:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 59/96] cfengine, cfengine-masterfiles: upgrade 3.28.0 -> 3.29.0
Date: Sat, 14 Nov 2026 23:48:37 -0800
Message-ID: <20261115074918.2932593-59-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:51:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132329
Content-Type: text/plain; charset="utf-8"

Refresh set-path-of-default-config-file.patch.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...sterfiles_3.28.0.bb => cfengine-masterfiles_3.29.0.bb} | 2 +-
 .../cfengine/set-path-of-default-config-file.patch        | 8 +++-----
 .../cfengine/{cfengine_3.28.0.bb => cfengine_3.29.0.bb}   | 2 +-
 3 files changed, 5 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-extended/cfengine/{cfengine-masterfiles_3.28.0.bb => cfengine-masterfiles_3.29.0.bb} (93%)
 rename meta-oe/recipes-extended/cfengine/{cfengine_3.28.0.bb => cfengine_3.29.0.bb} (97%)

diff --git a/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.28.0.bb b/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.29.0.bb
similarity index 93%
rename from meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.28.0.bb
rename to meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.29.0.bb
index 47922ca64d..5c81c414c4 100644
--- a/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.28.0.bb
+++ b/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.29.0.bb
@@ -22,7 +22,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=22b3189b9b79f1de35860dcc299bb6bc"
 
 SRC_URI = "https://cfengine-package-repos.s3.amazonaws.com/tarballs/${BP}.tar.gz \
            "
-SRC_URI[sha256sum] = "e044ce5926491e649f96c943482bf56bc268389fcb5d2edc4bcc4e94ceff09aa"
+SRC_URI[sha256sum] = "db0a97ae7ee1f46430b5ad79127a7594849a222adc1934eeb3e5aa14843ff47e"
 
 UPSTREAM_CHECK_URI = "https://github.com/cfengine/masterfiles/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
diff --git a/meta-oe/recipes-extended/cfengine/cfengine/set-path-of-default-config-file.patch b/meta-oe/recipes-extended/cfengine/cfengine/set-path-of-default-config-file.patch
index db69f951ca..3a4d2e9a2e 100644
--- a/meta-oe/recipes-extended/cfengine/cfengine/set-path-of-default-config-file.patch
+++ b/meta-oe/recipes-extended/cfengine/cfengine/set-path-of-default-config-file.patch
@@ -10,14 +10,12 @@ Set the path of default configure file.
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 
 ---
- misc/init.d/cfengine3.in | 12 ++++--------
+ misc/init.d/cfengine3.in |   12 ++++--------
  1 file changed, 4 insertions(+), 8 deletions(-)
 
-diff --git a/misc/init.d/cfengine3.in b/misc/init.d/cfengine3.in
-index c584817..12f5803 100644
 --- a/misc/init.d/cfengine3.in
 +++ b/misc/init.d/cfengine3.in
-@@ -101,14 +101,10 @@ if [ -z "$LOCKDIR" ]; then
+@@ -106,14 +106,10 @@
  fi
  
  # default control file
@@ -34,5 +32,5 @@ index c584817..12f5803 100644
 +if [ -e "$INIT_FUNCTIONS" ]; then
 +    . "$INIT_FUNCTIONS"
  fi
+ DEFAULT=${CFTEST_DEFAULT:-$DEFAULT}
  
- if [ -f $DEFAULT ]; then
diff --git a/meta-oe/recipes-extended/cfengine/cfengine_3.28.0.bb b/meta-oe/recipes-extended/cfengine/cfengine_3.29.0.bb
similarity index 97%
rename from meta-oe/recipes-extended/cfengine/cfengine_3.28.0.bb
rename to meta-oe/recipes-extended/cfengine/cfengine_3.29.0.bb
index 77a2e9fbef..bf52e46d7e 100644
--- a/meta-oe/recipes-extended/cfengine/cfengine_3.28.0.bb
+++ b/meta-oe/recipes-extended/cfengine/cfengine_3.29.0.bb
@@ -18,7 +18,7 @@ DEPENDS += "attr tokyocabinet bison-native openssl libpcre2 librsync"
 SRC_URI = "https://cfengine-package-repos.s3.amazonaws.com/tarballs/${BPN}-community-${PV}.tar.gz \
            file://set-path-of-default-config-file.patch \
            "
-SRC_URI[sha256sum] = "03722ab589c00b4e823ee22eb0afef5611b82e4f764fccc37ad3b18a3732c49e"
+SRC_URI[sha256sum] = "83ce77165543884de90a1ee69ae8728fd4a7c6a41e6b470dc5df48b48107d6c7"
 
 # The S3 tarball bucket denies listing, so track the release tags of the
 # upstream git repository instead. Tarballs are published as
