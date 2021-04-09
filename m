Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web12.3636.1617934880704485008
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 19:21:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jcp97VUt;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id d3-20020a9d29030000b029027e8019067fso2403948otb.13
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 19:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=mAVtAtCuqHlvbSRE0mOQwWic+A37juHdAK8JMzy5Itg=;
        b=jcp97VUt+VMGN6EbAFATEHlyI0Hq5RQjgSZulPcqMgGbzIhRw+o3lyrfuEbFbGIYkQ
         EuUixUUfK3+bExcJrV9Wzorl7kX4QsR95rrUHDkCvFXlrD6uf1iMADuwAVJdhuLGRFq8
         OXI2lbRpW+tBjfpeN0TAOLeSqqg8dm58ouea/eeRLnzKBXo639pbcXodpEr3CFj/JL3R
         mBM17m1nTuBmtyryzh+nzl5p55Zv4h6xJXQdKaxexzvTaBi6yZ13sLeNjhwiixzplwJq
         XBY1eeBXuv75UH4KONljPDDcyQ+jwF8thu5R3Rp+iNY3XGAjLnCZscK9pEbuXiBIVW0E
         rJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=mAVtAtCuqHlvbSRE0mOQwWic+A37juHdAK8JMzy5Itg=;
        b=lGmhGWWoM9BHOyjoNZB5/6ENmsGV0tw4ukVO1G/21e3wO9OaLvR32MvNWabPK5Y0kr
         EnNAkPT6KDLBn73CVxDcl6rBuWGLNcAuDQWIB79E/7ySao8dfUScsEo3AcMQ5huyWlZ6
         FjoReFh7oe2/FFWi7a/PehUlxEuByPfJ9LQkLexWYc8cnXNYMbdcCt2n6FerOeAUDRRE
         Lbz6gRHUjxO0bcnVLMuRWlEbGFEo4xDQTYGlJtOlV5hxb0+COY+1Fb6c3ZjxFiKSm549
         MWE+nFGUtopxjhibLqESi6Jbxs1z4wnK0e7vhVn+SxNCHu0PhY/elz6Po1CimXVnuMlg
         CSlQ==
X-Gm-Message-State: AOAM531Gz6kEBf8yVGK+MoX5Jnu5W3Uv4bBLynjCoj1ffcbkTibx1vpH
	VumE1xsn15SHNgvWLf9qXdK9aDLCKKY=
X-Google-Smtp-Source: ABdhPJxP5yyCOzrBLklOPT7gimupnSqvnQ6EIylImqqVGZMQpYHz8xlvx4vw41tAZ43xgHD0fEZvgw==
X-Received: by 2002:a9d:4719:: with SMTP id a25mr10813759otf.101.1617934879779;
        Thu, 08 Apr 2021 19:21:19 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id k65sm299815otk.53.2021.04.08.19.21.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 19:21:19 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 30/36] stunnel: upgrade 5.58 -> 5.59
Date: Thu,  8 Apr 2021 19:20:43 -0700
Message-Id: <3fb89db2d82e2030a43edddea345a4d1db23786e.1617934043.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617934043.git.akuster808@gmail.com>
References: <cover.1617934043.git.akuster808@gmail.com>

From: zangrc <zangrc.fnst@fujitsu.com>

Refresh the following patch:
fix-openssl-no-des.patch

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 83c8e6bcc0ad57628baac2ee15fac5f5b48ca7c2)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../stunnel/stunnel/fix-openssl-no-des.patch           | 10 +++++-----
 .../stunnel/{stunnel_5.58.bb => stunnel_5.59.bb}       |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta-networking/recipes-support/stunnel/{stunnel_5.58.bb => stunnel_5.59.bb} (94%)

diff --git a/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch b/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch
index 209b0dd409d..aeb0bece971 100644
--- a/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch
+++ b/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch
@@ -11,7 +11,7 @@ diff --git a/src/common.h b/src/common.h
 index f7d38b0..bf485af 100644
 --- a/src/common.h
 +++ b/src/common.h
-@@ -471,7 +471,9 @@ extern char *sys_errlist[];
+@@ -478,7 +478,9 @@ extern char *sys_errlist[];
  #ifndef OPENSSL_NO_MD4
  #include <openssl/md4.h>
  #endif /* !defined(OPENSSL_NO_MD4) */
@@ -25,8 +25,8 @@ diff --git a/src/protocol.c b/src/protocol.c
 index 587df09..8198eb6 100644
 --- a/src/protocol.c
 +++ b/src/protocol.c
-@@ -66,7 +66,7 @@ NOEXPORT char *imap_server(CLI *, SERVICE_OPTIONS *, const PHASE);
- NOEXPORT char *nntp_client(CLI *, SERVICE_OPTIONS *, const PHASE);
+@@ -67,7 +67,7 @@ NOEXPORT char *imap_server(CLI *, SERVICE_OPTIONS *, const PHASE);
+ NOEXPORT char *ldap_client(CLI *, SERVICE_OPTIONS *, const PHASE);
  NOEXPORT char *connect_server(CLI *, SERVICE_OPTIONS *, const PHASE);
  NOEXPORT char *connect_client(CLI *, SERVICE_OPTIONS *, const PHASE);
 -#ifndef OPENSSL_NO_MD4
@@ -34,7 +34,7 @@ index 587df09..8198eb6 100644
  NOEXPORT void ntlm(CLI *, SERVICE_OPTIONS *);
  NOEXPORT char *ntlm1();
  NOEXPORT char *ntlm3(char *, char *, char *, char *);
-@@ -1175,7 +1175,7 @@ NOEXPORT char *connect_client(CLI *c, SERVICE_OPTIONS *opt, const PHASE phase) {
+@@ -1332,7 +1332,7 @@ NOEXPORT char *connect_client(CLI *c, SERVICE_OPTIONS *opt, const PHASE phase) {
      fd_printf(c, c->remote_fd.fd, "Host: %s", opt->protocol_host);
      if(opt->protocol_username && opt->protocol_password) {
          if(!strcasecmp(opt->protocol_authentication, "ntlm")) {
@@ -43,7 +43,7 @@ index 587df09..8198eb6 100644
              ntlm(c, opt);
  #else
              s_log(LOG_ERR, "NTLM authentication is not available");
-@@ -1216,7 +1216,7 @@ NOEXPORT char *connect_client(CLI *c, SERVICE_OPTIONS *opt, const PHASE phase) {
+@@ -1376,7 +1376,7 @@ NOEXPORT char *connect_client(CLI *c, SERVICE_OPTIONS *opt, const PHASE phase) {
      return NULL;
  }
  
diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.58.bb b/meta-networking/recipes-support/stunnel/stunnel_5.59.bb
similarity index 94%
rename from meta-networking/recipes-support/stunnel/stunnel_5.58.bb
rename to meta-networking/recipes-support/stunnel/stunnel_5.59.bb
index 1f1ca4e6b8b..e3704ae1d0e 100644
--- a/meta-networking/recipes-support/stunnel/stunnel_5.58.bb
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.59.bb
@@ -14,7 +14,7 @@ SRC_URI = "ftp://ftp.stunnel.org/stunnel/archive/5.x/${BP}.tar.gz \
            file://fix-openssl-no-des.patch \
 "
 
-SRC_URI[sha256sum] = "d4c14cc096577edca3f6a2a59c2f51869e35350b3988018ddf808c88e5973b79"
+SRC_URI[sha256sum] = "137776df6be8f1701f1cd590b7779932e123479fb91e5192171c16798815ce9f"
 
 inherit autotools
 
-- 
2.17.1

