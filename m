Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A87D3C55ABA
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 10:56:40 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37821.1785927394536079677
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Aug 2026 03:56:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FNjgYuGo;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cad8076b01so10034275ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 03:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785927394; x=1786532194; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TJTSvy/SOc0jwy0dQkVUpM4v+mSN8UnxryOrAEUR3Vw=;
        b=FNjgYuGoiravIe2HKCMxlDrwvDc3l3qxab6e8S6u2rN9iSvmg3YJh2SkPKLnFdoi2F
         0Hh58BLdDAV9g9rnRZv02dj8fdOZSI4GlRozcAWd3XUuJNzuUDnhQOWtMGUzwdE+mlwo
         9ZXEE7gRje+pjq7cKyVax4WcatApXiKhjQz1aDVzgtJdMBHmPBdDbqg4NyvXK9tLaEie
         vwc5/6Pc/iMiW0xW6GN97Wi4I5sqxaN018FDUxRhifxzNYv0WccpOOqYHY9nn89NY5EU
         Q2QvNo3pQEvSWlV006+mGKxu/AGDDqNDnlYnvJSlRjfLwWrp2WonM1p5MtpCBPjX/c+N
         UguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785927394; x=1786532194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TJTSvy/SOc0jwy0dQkVUpM4v+mSN8UnxryOrAEUR3Vw=;
        b=KMNF6yJGCf3m+dkHF1PDTIwtsp/Fp0TGybL9Ujys7mzVAw39BIiPN1hijQL5B7DSsP
         qwXrD1DlmmeY6Rr94/BfZ/75yuN05w9tSWLds6tYVLNobMjRnV5HMiUtHFHEZ8AGAG89
         kXK1bPt+RJpqi4j8bSLxLz99sDAPThf0jfVGXukgvkd4XhnEGbeUUBsGPeiG9fON3TIT
         Y9BGRMMzNCiksik7+OF8g+PZXC/JaM43DlxWjGWk426FluSbh8HYHFBP0S7/jfdXJVeh
         +EFyT0LIT8C5vpqfjexCAtL5hZH/ItoyRabS+7LAvkLruTJI3V3pT5XNgp3BCbb0S6p0
         Lp2A==
X-Gm-Message-State: AOJu0YxpjKCmwVMPlV93KijGip25GndqOPFk3J0Zjo8pJ03ePPBBfz2+
	wfsB/v4eS7OFonk+gX8n0Jn2BLytLIPm+fqgnwAZwOPaFN+LA3IIfpPRDAsu2w==
X-Gm-Gg: AR+sD13NnluLO3FDhV8IuDkfIt+DtChKZVibg2V9w+EycdOFc7MGqw0dXisWQl/v300
	zjWkU5ZRSYca/ow0B/9xECdeO7NhlpnvImEpnakWBNaO88Gnk6CUUelUtXVFQLRE83H6grcgVEg
	wWxpo5eVbZGcIhYBGj00Fe2C29ELVtzp8q5+xgdioCEzNIplCyedwG41gXE2nedcR2SdD8IpAP7
	GE7vJYifobSzsGXsK7c2fyJXvoJNLPC0S6EDZcJWndxa5SeIZRE8n8+XB4uTCpTWbrOTrca5gRv
	NA2Umsq4dKxSh7sg1gfXbXa238mxOg6E080GSdCpAYfxTRVvLyUtIXCrtrJD8Jyz3AKNBBYkeBV
	54MasZMk3wy0k+JUVuqZyhWwtIILDDa14shQVwqQYrxh4FXIB43nHTOyKC1unTOK/t9oaXnypva
	+/WNh0QKvJSdFgprqxnPk+nohtPynwi9K8mKdyO2Zab+q7jpiQUNIb/ehvbBnvcJ/dvnfJUFgCE
	w==
X-Received: by 2002:a17:902:d58e:b0:2c9:e835:ac67 with SMTP id d9443c01a7336-2d0caa03d1fmr66691155ad.19.1785927393926;
        Wed, 05 Aug 2026 03:56:33 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586790e21sm16407166eec.24.2026.08.05.03.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 03:56:33 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 7/8] ntpsec: upgrade 1.2.4 -> 1.2.5
Date: Wed,  5 Aug 2026 22:56:10 +1200
Message-ID: <20260805105612.1648951-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805105612.1648951-1-ankur.tyagi85@gmail.com>
References: <20260805105612.1648951-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 10:56:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128816

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also refreshed patch for this version.

Changelog:
https://gitlab.com/NTPsec/ntpsec/-/blob/NTPsec_1_2_5/NEWS.adoc?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../0001-wscript-Add-BISONFLAGS-support.patch       | 13 +++++++------
 .../ntpsec/{ntpsec_1.2.4.bb => ntpsec_1.2.5.bb}     |  4 ++--
 2 files changed, 9 insertions(+), 8 deletions(-)
 rename meta-networking/recipes-support/ntpsec/{ntpsec_1.2.4.bb => ntpsec_1.2.5.bb} (97%)

diff --git a/meta-networking/recipes-support/ntpsec/ntpsec/0001-wscript-Add-BISONFLAGS-support.patch b/meta-networking/recipes-support/ntpsec/ntpsec/0001-wscript-Add-BISONFLAGS-support.patch
index fb29fdc47e..6a569dab13 100644
--- a/meta-networking/recipes-support/ntpsec/ntpsec/0001-wscript-Add-BISONFLAGS-support.patch
+++ b/meta-networking/recipes-support/ntpsec/ntpsec/0001-wscript-Add-BISONFLAGS-support.patch
@@ -1,19 +1,20 @@
-From 792cb4f9d13450251c6344eed2b35f382c98df0d Mon Sep 17 00:00:00 2001
+From f57a965e30deb280894779c177c443302a8439fc Mon Sep 17 00:00:00 2001
 From: Alex Kiernan <alexk@zuma.ai>
 Date: Thu, 19 Jan 2023 13:00:45 +0000
 Subject: [PATCH] wscript: Add BISONFLAGS support
 
----
 Upstream-Status: Pending
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
 
+---
  wscript | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/wscript b/wscript
-index 7329d6e46889..de51f1e9cdd9 100644
+index 65592c9..694869f 100644
 --- a/wscript
 +++ b/wscript
-@@ -140,6 +140,7 @@ def configure(ctx):
+@@ -139,6 +139,7 @@ def configure(ctx):
      # Ensure m4 is present, or bison will fail with SIGPIPE
      ctx.find_program('m4')
      ctx.load('bison')
@@ -21,8 +22,8 @@ index 7329d6e46889..de51f1e9cdd9 100644
  
      for opt in opt_map:
          ctx.env[opt] = opt_map[opt]
-@@ -911,6 +912,7 @@ int main(int argc, char **argv) {
-     msg_setting("CFLAGS", " ".join(ctx.env.CFLAGS))
+@@ -888,6 +889,7 @@ int main(int argc, char **argv) {
+     # print("CFLAGS:", sorted(ctx.env.CFLAGS))
      msg_setting("LDFLAGS", " ".join(ctx.env.LDFLAGS))
      msg_setting("LINKFLAGS_NTPD", " ".join(ctx.env.LINKFLAGS_NTPD))
 +    msg_setting("BISONFLAGS", ctx.env.BISONFLAGS)
diff --git a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.5.bb
similarity index 97%
rename from meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
rename to meta-networking/recipes-support/ntpsec/ntpsec_1.2.5.bb
index 3f78029bb5..26348f7c4b 100644
--- a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
+++ b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.5.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSES/BSD-2-Clause.txt;md5=653830da7b770a32f6f50f6
                     file://LICENSES/CC-BY-4.0.txt;md5=2ab724713fdaf49e4523c4503bfd068d \
                     file://LICENSES/MIT.txt;md5=5a9dfc801af3eb49df2055c9b07918b2 \
                     file://LICENSES/NTP.txt;md5=cb56b7747f86157c78ca81f224806694"
-                    
+
 DEPENDS += "bison-native \
             openssl \
             python3"
@@ -17,7 +17,7 @@ SRC_URI = "https://ftp.ntpsec.org/pub/releases/ntpsec-${PV}.tar.gz \
            file://0001-wscript-Add-BISONFLAGS-support.patch \
            "
 
-SRC_URI[sha256sum] = "443e54a6149d1b0bf08677d17b18fced9028b101fc2ffd2c81e0834f87eebc7d"
+SRC_URI[sha256sum] = "6fb191cddaf607e7754b1f6915a1a61dc4018b3e4eef3d2ffacec961c9682949"
 
 UPSTREAM_CHECK_URI = "ftp://ftp.ntpsec.org/pub/releases/"
 

