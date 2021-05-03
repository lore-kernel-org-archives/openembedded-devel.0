Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web08.1662.1620069134748857151
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 May 2021 12:12:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Gvr8clgg;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id i26so6429770oii.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 May 2021 12:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=B3PzTUQ3anvQY8v1Cz7ospOv7Uh6g3yB1Y/vBlTBwec=;
        b=Gvr8clgg+KI2UfURlKWLwAkRQzEGcFtIB3ebgGFvK6hMqVu0TKI52iRlbzIFIFi4Nu
         nQNlbV350U7AZZpj73EZetyMOg+jy0M4uTCH5pOg9KOyfogQlBoCTiAWkcRyeTJ51APW
         LgkjFSRH9lD7gD34qGWUSVfwpK5eTcePzWZ3BXwwP5a9HVhmFL9UKhYPi9Tn5bfaptHC
         AyMEFJNE3ck75+m55tkCGAngCiw/+NLsd4jQlJ76eD/5RNJ4Fvkr/5zori6HyreP1hCO
         mdnBT+h24KXZxCJPctwibZ9YyiSU3YFZtR+48FrSc3ohhs1yGeFn8eJEjIknvnAh5j24
         RTxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=B3PzTUQ3anvQY8v1Cz7ospOv7Uh6g3yB1Y/vBlTBwec=;
        b=bTEG7epeA1Mz1xZB506hNLSSFMs28uwARBsECBOqF71sJP1OrKa0LUF6AlRXP32/R1
         afkCCwVpa94L9Zyc7a0tz1F/YZT3VKaPcdg35HyDoZbP/W/4Aj7+qt+Ds9u9AJxUmXAi
         vwn9/Z14n47uwSEd6izoTxFWM36AU9FFAIPRZSBWIb+uDgAfoVlknmgPe+iMVf3fq1hF
         H51o7xchC3LOlc8IP7Uf7yv80JD712dc4k+Tk/+A1zItjXEjLQVZGQbOar2NOnU1fDtO
         bNtPem7s56e0jn/gGBYt7LOKKgwWVAZAisk9u65aNeQBm/e4P+NOl5MsDEmvX5D43hW5
         Ch1Q==
X-Gm-Message-State: AOAM533HgsP0EbzjqRzwG5nYEjiH7d8IhpET8U74KoaUXuW3mW8vVag1
	euuRw/2Adgo7Df94+Q1FePSdjVrnHozIDw==
X-Google-Smtp-Source: ABdhPJyQBgyMbJg8ThrFDv2vMqvE/GrMd6vXAtex5cqLEVPkMY4qopIsRrTi7kdxNP+Ts0iJD/P8Iw==
X-Received: by 2002:a05:6808:51:: with SMTP id v17mr59662oic.132.1620069133954;
        Mon, 03 May 2021 12:12:13 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:dc35:22d6:72af:c1da])
        by smtp.gmail.com with ESMTPSA id s85sm150047oos.4.2021.05.03.12.12.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 12:12:13 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 04/14] python3-asttokens: Upgrade 2.0.4 -> 2.0.5
Date: Mon,  3 May 2021 12:11:57 -0700
Message-Id: <ba22785a42eeb3ecbcb8482329a594a4cc34c2f0.1620069041.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1620069041.git.akuster808@gmail.com>
References: <cover.1620069041.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 2.0.5:

- setup.cfg: remove wheel dependency
- Handle starred expressions in tests
- Make 3.9 support official
- pypy2 instead of pypy2.7
- pypy3 instead of pypy3.5

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 3bef475e7618ab54f5666ccacbdd892b86ce96a0)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-asttokens_2.0.4.bb => python3-asttokens_2.0.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-asttokens_2.0.4.bb => python3-asttokens_2.0.5.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-asttokens_2.0.4.bb b/meta-python/recipes-devtools/python/python3-asttokens_2.0.5.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-asttokens_2.0.4.bb
rename to meta-python/recipes-devtools/python/python3-asttokens_2.0.5.bb
index c2149336fd..429a56bae6 100644
--- a/meta-python/recipes-devtools/python/python3-asttokens_2.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-asttokens_2.0.5.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "asttokens"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "a42e57e28f2ac1c85ed9b1f84109401427e5c63c04f61d15b8842b027eec5128"
+SRC_URI[sha256sum] = "9a54c114f02c7a9480d56550932546a3f1fe71d8a02f1bc7ccd0ee3ee35cf4d5"
 
 DEPENDS += "\
     python3-setuptools-scm-native \
-- 
2.17.1

