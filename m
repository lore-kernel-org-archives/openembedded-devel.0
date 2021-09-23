Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.483.1632416998316110002
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Sep 2021 10:09:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UdaGWuos;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id lb1-20020a17090b4a4100b001993f863df2so5330201pjb.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Sep 2021 10:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fvGoUWldGjqk2Av7+uTykq9N5estKurMOxCT1Sa5ABo=;
        b=UdaGWuosvyyWNOJoUTKWtZVFX0XhMRms77nVzHAzKoB6u93QAdvWbFazfUZu+ox+5I
         VsC4WPJ7xaw8j7ffZC6aW39xj71TVfcRXVsfvfkwSrcm5FBIG9WcZqpW7LaDH+tH0jeO
         uguEi/oGZIqvEsyMm7etPuZrcLl8suMuGWkYB9yH+FPOwiXor1gV1NOe76p1RxtGos5E
         +zpRcj1iPWRKgPRrZ6MzwioEiQWaG2l3J/XXVocjU1UWiV4WgCd5v51SZ2PVXxB2yRYq
         /b+L414X4AYdDXf+28DBItdkobBdH6KJc2UFNKN2MSCdyf5gHNYR1ZQmbXHZ15rHVo1c
         NOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fvGoUWldGjqk2Av7+uTykq9N5estKurMOxCT1Sa5ABo=;
        b=RWgUJxU0luVAzLNbAjfkQxUa25DnzQIMFJATZtvfubxcHRPaj9iwAC0wcMDGjpeTZU
         n36ZAN5hgVUjYAqz37kml24BMBVwHqYU0MRtwLyVb0k4R+5sRAPZA5q4X0oLDxqwaX8g
         HQsEJhsrYC012ssMvgAUcsFAp7GQtcgndeDd/ZS3yJj7OTia9OOQ+0UsWTeWkN6tZGc+
         f97EBy2ZCeCkKdOf/JImIol7suVyQnY0ESKk6INtIZtFL54s58pCRw71/lha8mFZ3dTR
         nLHDi8Xgd1jbsbo+sas4IQ8viVvQ/41TzI0AIVf/+diYcD1+tOfC267Cpa46YMIdQPvM
         E1pQ==
X-Gm-Message-State: AOAM530LsdM8giNfDzHsdZXdITHOoA/zpveS57DZrE/Mp5O3KjKE9Tt7
	Ojj25Of2tLq4IZfoMxrwPa3oD8mQFK6ecA==
X-Google-Smtp-Source: ABdhPJxk+h+n0nHRo2+E3J0jIvSXsyXGuGz7ckguefgy6XDen6FuRevWNx7jm6T70JPWZUM48PuxLA==
X-Received: by 2002:a17:90b:1212:: with SMTP id gl18mr6563766pjb.146.1632416997520;
        Thu, 23 Sep 2021 10:09:57 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id k127sm6405814pfd.1.2021.09.23.10.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 10:09:57 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] postfix: Add missing dependency on m4
Date: Thu, 23 Sep 2021 10:09:55 -0700
Message-Id: <20210923170955.2596439-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
| extract_cfg.sh: line 42: m4: command not found

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-daemons/postfix/postfix.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index 1ae32af283..8a4428c504 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -6,7 +6,7 @@ has a definite Sendmail-ish flavor, but the inside is completely different."
 
 HOMEPAGE= "http://www.postfix.org"
 SECTION = "mail"
-DEPENDS = "db icu libpcre libnsl2 openssl postfix-native \
+DEPENDS = "db icu libpcre libnsl2 m4-native openssl postfix-native \
     ${@bb.utils.contains('DISTRO_FEATURES', 'ldap', 'openldap', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'sasl', 'cyrus-sasl', '', d)} \
 "
-- 
2.33.0

