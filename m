Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web11.7943.1589646395344710035
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 May 2020 09:26:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IekLvVEW;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id s69so2395647pjb.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 16 May 2020 09:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xJ/cpGb/rnGugRMjzLbPus4JlduM+ZeaBxVYbVgJdjQ=;
        b=IekLvVEW6LKLCAddb87keA6HiFE8R9dUCSocpNZmxInaz9vuJdZWGWRNm39PHxQpr1
         YDhY8hUUdDJu7ENEttxoxgM6LzeauzcRWjuFNVDjhMDo/aKmY/wQ0ceh9Y71dsJ4LaQz
         PY359IHuLjdJenkGksnlGtJQ6/i0XGoQJlE7Fflkg3N7/nZPSucQaI4ZQitcvLd2+ot+
         lcu30eSqdN+aI5wepQbTANzjFJ/Ne/fPBSyA87SvfAuL4pCv7K0XdYIDsuCJ+PTQ7oEP
         dxCk1RYwPEiRyfkM41I/RQmeRda6m4lUg1q+XSQ+s4ae5p3OCjbGf/08qYhPQsIi9iEo
         c0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xJ/cpGb/rnGugRMjzLbPus4JlduM+ZeaBxVYbVgJdjQ=;
        b=olGW8PSPoXDdqUC357KRIrUVmLvXOTW2zB2JOmnIqwDKZAQzeemjzVSWwkEcZSOEbX
         AEbe5A+AxRle4dPBtors2xLV5apgENDx1geRLALfeMWJU+O8VPI4nFay4KSJjWoWI6LL
         1Vi7xmHxfKaMk1OsnRumHQPvZSDY9TIa1BPsnQVZWgkfV1w7roYcZieLAnq+7EUxpCiM
         3nA827wyBIEjuXZqt9WGdcCtDhOIULN4erSemwgniCbsqMEFHm+aXmdmeA8iVZ9Ol/o9
         pcroOa7xX1zgZT6ig6uz5l/cKkuMiN59gfDeg6Fxy+kTRjO8VIBIx+VfkNPF1wqyk0re
         KFnA==
X-Gm-Message-State: AOAM530pffWo8v5gFMf4qp9fzEDI99J+hvkyZYAjzDAegJBu7fsqWpqE
	Z/WCeMkszWa5/EWl3rxpJa+QkiwxyNo=
X-Google-Smtp-Source: ABdhPJzW+CtSbWCwf6M5IzxbdwkTge+ejhUYZK49Ij91XflTHJGflA1zPGGjyxTkjbhKiLzYapmyjQ==
X-Received: by 2002:a17:902:8697:: with SMTP id g23mr8559222plo.306.1589646394439;
        Sat, 16 May 2020 09:26:34 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e62a])
        by smtp.gmail.com with ESMTPSA id t20sm4206084pjo.13.2020.05.16.09.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2020 09:26:34 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/3] postfix: Upgrade to 3.4.10 and compile with -fcommon
Date: Sat, 16 May 2020 09:26:30 -0700
Message-Id: <20200516162631.1862339-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200516162631.1862339-1-raj.khem@gmail.com>
References: <20200516162631.1862339-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensures it can build with gcc10

Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
2.26.2

