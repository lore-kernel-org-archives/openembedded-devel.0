Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF639D3E760
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 17:49:13 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2018.1765388943887606946
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 09:49:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ehhXXL3l;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3434700be69so158028a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 09:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765388943; x=1765993743; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i5PYu5QCo+5ScANHdiEQP5fPDo0b70UKUhkqKOcbusQ=;
        b=ehhXXL3l4dgU/LqdSQostFWTSGhVUIBDU8ZyV9lX1co97GBPl6c7/QnCfzk2F8c0On
         1v8MTQGIY9aEysJjj2A+HkRLp9dCzZ8UfV/MdZFlS9N5XINZl463lrgLqHKfJAYvFCZL
         JzWzp9DrUSEiABKK8kX3kpsFR6FzM6C7QnyJEqYQiwqt93v1dX0JbQjQMQbathSHwGwq
         04V7qlLj52W7XgqV4AAw3QyghaQCKMjvTj9JwqYnhbfso+ngpySlfu4K0ygAReOeIDD3
         UHuUexzRf0lHHL2vb6TImFYWaaYtpLWL7TetcdBaDiAPsNmbkp/d2T10NbeiFsqtWObc
         wJUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765388943; x=1765993743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i5PYu5QCo+5ScANHdiEQP5fPDo0b70UKUhkqKOcbusQ=;
        b=RZELHZcA3XTohEODlgAhEtwT1y+nBAu5F+ZIkYWo7piv9GUoLz7xuiSTcSEAUc2hNo
         g8sXkDcxKp4joMpaAb9hsnQyeGCCywLWwvae6vQC4Pk99JBeMiOAJ5QB4czLfY6lzNJv
         IrDHQoJNCy5Q8obSP8cyFUrlbmi/7sHuQmvT6FJ5sY9Gv29lqydPLIkl+ZPPGb1lsyCe
         hep+mJzeBMGxZqu825BDX14g9cFAle4jQWJy0NN44rmNcd9cPAAyqxvwY8nBIRwePnCv
         3IoRtLElIq6pCptT/egoKft5qRAa3tqFb0KRRkjXp7FPtaRAQACwI3sdqrTHfHMtI8Po
         yCsw==
X-Gm-Message-State: AOJu0YyHtWF44xmRJq8pWzOkqLQS+z+wz1J+g6E/6EA5tj+nQTDAIMfC
	9R6FAOzxpp8RXi8wTa0rE3mYq1jhyF2Xd+UMNztxtbAL8iow8An38MXTre07eJ30
X-Gm-Gg: AY/fxX47Cc89U/koaicfcUqfIuc86f1AI9J5SPtLwTgzRfklo9Clc9EZHiCPnKwQTni
	OTPUt4JFkKGzIw2QyZo76Om2OHO4W6xhxrspvQymAoIiU5ymPY2baGKYD4twexi5SM0RdvUF7Xl
	vtH3WruFs+Zoj80pdksPKRnYSIY+r9KvgvPZ9qwhx0lcZVEOE5Fjz+9b8E/rdGYfGOz3fxOJbi7
	Fy6vsSZl4/xMzQq9XrgAGNfk5uDyeQZgKp25Gpl0JH5FzCw0Q+yWyNZD4SzT9v9Jb0pWNJCP4IU
	4iLMmMqgsbNOzGJTBK84zF6BrX5mXX50h62am+fE56e0OGrsWLFkLx8kvkpCMcpKmXbVGdPEmri
	PRMmrNpXj9BwRqhKqMgIFF5Wdr7eZE2zMwejDQdzD/PvQcYD0+IGirR5E3mYIBCyGfnvP2a/RZU
	nzwx0bQuCwHx1INCkCjSe76Ic=
X-Google-Smtp-Source: AGHT+IFUb2DBXm8kwgWSy9IqU/FJTbXsx0oP2cA5rONk5aDST9ufeHWChAVvAyAzONzlsz4XQi2/0w==
X-Received: by 2002:a17:90b:1e51:b0:341:8c8b:b8e6 with SMTP id 98e67ed59e1d1-34a72811355mr3404367a91.16.1765388943165;
        Wed, 10 Dec 2025 09:49:03 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0c264211cbsm124658a12.11.2025.12.10.09.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 09:49:02 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Hongxu Jia <hongxu.jia@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][whinlatter][PATCH 03/10] postfix: switch to libpcre2
Date: Wed, 10 Dec 2025 23:18:40 +0530
Message-ID: <20251210174847.2828731-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210174847.2828731-1-ankur.tyagi85@gmail.com>
References: <20251210174847.2828731-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 17:49:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122569

From: Hongxu Jia <hongxu.jia@windriver.com>

Postfix 3.7 and later supports pcre2 library [1]

[1] https://www.postfix.org/PCRE_README.html

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9ec1605567914bba49ac32ba425a55d37a4f1a27)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-daemons/postfix/postfix_3.10.5.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.10.5.bb b/meta-networking/recipes-daemons/postfix/postfix_3.10.5.bb
index 8b3becda9f..02fe9df7ed 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.10.5.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.10.5.bb
@@ -6,7 +6,7 @@ has a definite Sendmail-ish flavor, but the inside is completely different."
 
 HOMEPAGE = "http://www.postfix.org"
 SECTION = "mail"
-DEPENDS = "db icu libpcre libnsl2 m4-native openssl postfix-native \
+DEPENDS = "db icu libpcre2 libnsl2 m4-native openssl postfix-native \
     ${@bb.utils.contains('DISTRO_FEATURES', 'ldap', 'openldap', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'sasl', 'cyrus-sasl', '', d)} \
 "
@@ -80,8 +80,8 @@ export CCARGS-sasl:class-native = ""
 export AUXLIBS-sasl:class-native = ""
 
 # PCRE, TLS support default
-export CCARGS  = "${CFLAGS} -DHAS_PCRE -DUSE_TLS -I${STAGING_INCDIR}/openssl ${CCARGS-ldap} ${CCARGS-sasl} ${CCARGS-nonis}"
-export AUXLIBS = "-lpcre -lssl -lcrypto ${AUXLIBS-sasl} ${AUXLIBS-ldap}"
+export CCARGS  = "${CFLAGS} -DHAS_PCRE=2 -DUSE_TLS -I${STAGING_INCDIR}/openssl ${CCARGS-ldap} ${CCARGS-sasl} ${CCARGS-nonis}"
+export AUXLIBS = "-lpcre2-8 -lssl -lcrypto ${AUXLIBS-sasl} ${AUXLIBS-ldap}"
 export POSTCONF = "${STAGING_DIR_NATIVE}${sbindir_native}/postconf"
 
 # OPT,DEBUG is aready in CFLAGS

