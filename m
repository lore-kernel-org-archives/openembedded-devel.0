Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web12.18129.1590941800187763992
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 May 2020 09:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ODR3X1/W;
 spf=pass (domain: gmail.com, ip: 209.85.214.194, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f194.google.com with SMTP id n9so119474plk.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 May 2020 09:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=L0nK40X/IxBZwCvEUcf2z5EU9LDw6SPFj9LRdA7FD48=;
        b=ODR3X1/WzSM5jpZf/ppOBiuIikw6G+zaF7uCyridy0kaQQG6Kj0lhA52Xdnxl+J8V7
         fyG/gt1oOgr+nT8U/hFN2Gmtg6atnYxmT8K117DuKSF71vfr8lr26ryJ9fT8oskGNzGO
         7wHEZjgfe9U7R0wwsp1U4YCqVZVaL8NXPRlKIeIIj8k1p2gPpGInxOcLBywmEAuTfFxw
         qLxRI4ntKlr7126zg7f3y8aaTI7/1/oVNuB7Ot1JgVAI3PLK6N05Sr3krD6wvN5pWXCc
         YgAwANjS+FnqFWjQVuhSTTWJmkVlWhEjZYXk4BW5ZpXrT+eHb21O6aIVjzg207HRgBD5
         1cqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=L0nK40X/IxBZwCvEUcf2z5EU9LDw6SPFj9LRdA7FD48=;
        b=RlzsHZJU2VV6J4URGH/IquMgFl9pQsG54VC9zpFLD8fHd3Tip8zr+Yg4gPIYnsgsXc
         U78u6cxpkZvQrugBmJ36n+J/4USmRlHTr3hsc15jrQr1FbxxKZXT5hedPPokUHILgSAT
         sbcbssW0BpPFNl599ik4xnDnPLoJK8MFAJ1/XJilW4TGqweZjgaq0nD91ikYYJNWMseE
         4t/MwzaF8SWNRuznMNL48wYO4mlJit0FoLD71oaGajStLgAE+jUrXKgB62e1Pnjrnr0j
         mm3YBD1MHQjuv7vt8my8IutcEzapqZCp6dWg0zcIAsJO/jcWxMIaIz8rkxEpKw8iqzf9
         Dl5A==
X-Gm-Message-State: AOAM531+6ELnZ9+UmHy0b0WZ/2o+fKoMv2eO4BJxsd/fjouuNoW+aMWn
	7v88lJRODDNP0J46xvPm/lk6UYVI
X-Google-Smtp-Source: ABdhPJxtaLDaKliq3/3rug15vbrEtCY1+N9qBxc/JiOklo6FZlsqx7peARmTbmTaQ1Nu78odb+RoEw==
X-Received: by 2002:a17:902:be0e:: with SMTP id r14mr9915159pls.30.1590941799322;
        Sun, 31 May 2020 09:16:39 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:936:376a:3aad:6139])
        by smtp.gmail.com with ESMTPSA id b16sm9188871pfd.111.2020.05.31.09.16.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 09:16:38 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 11/35] postfix: Upgrade to 3.4.10 and compile with -fcommon
Date: Sun, 31 May 2020 09:15:58 -0700
Message-Id: <08a5f058da2c6bf0221d1ee4bc7783270494b21a.1590941674.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590941673.git.akuster808@gmail.com>
References: <cover.1590941673.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

Ensures it can build with gcc10

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d04f3a1be3a6d7f57b3cc26cb3159b1055a5ee22)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-daemons/postfix/postfix.inc           | 2 +-
 .../postfix/{postfix_3.4.8.bb => postfix_3.4.10.bb}           | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.4.8.bb => postfix_3.4.10.bb} (84%)

diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index 4b9940cc7a..a8d55a6c93 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -61,7 +61,7 @@ export CCARGS-sasl_class-native = ""
 export AUXLIBS-sasl_class-native = ""
 
 # PCRE, TLS support default
-export CCARGS  = "${CFLAGS} -DHAS_PCRE -DUSE_TLS -I${STAGING_INCDIR}/openssl ${CCARGS-ldap} ${CCARGS-sasl} ${CCARGS-nonis}"
+export CCARGS  = "${CFLAGS} -fcommon -DHAS_PCRE -DUSE_TLS -I${STAGING_INCDIR}/openssl ${CCARGS-ldap} ${CCARGS-sasl} ${CCARGS-nonis}"
 export AUXLIBS = "-lpcre -lssl -lcrypto ${AUXLIBS-sasl} ${AUXLIBS-ldap}"
 export POSTCONF = "${STAGING_DIR_NATIVE}${sbindir_native}/postconf"
 
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.4.8.bb b/meta-networking/recipes-daemons/postfix/postfix_3.4.10.bb
similarity index 84%
rename from meta-networking/recipes-daemons/postfix/postfix_3.4.8.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.4.10.bb
index 5d7f8bc9f9..d0ef708c50 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.4.8.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.4.10.bb
@@ -15,7 +15,5 @@ SRC_URI += "ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://0001-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
            file://0001-Fixed-build-failure-with-glibc-2.30-due-to-dropped-R.patch \
            "
-SRC_URI[md5sum] = "6944b946887077a28e3dcb375ff53701"
-SRC_URI[sha256sum] = "8d5d429737e0c64514028a82fc006cbb273d2cb98dc40eb1dbbfe102f29a8943"
-
+SRC_URI[sha256sum] = "908a66fc38537a0047e8561e1bc0ef096c53357ffad16d2d728cd4fc8ae56654"
 UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.3(\.\d+)+).tar.gz"
-- 
2.17.1

