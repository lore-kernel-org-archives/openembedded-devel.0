Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web12.284.1632372554871741946
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 21:49:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GyGmsL7F;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id me5-20020a17090b17c500b0019af76b7bb4so6074659pjb.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 21:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5AazS/IQ5sJ3rBN1/sKjZkyNIGCT2a5ghwSPHnCTlbg=;
        b=GyGmsL7FuFxq3U0Ha0xx4Iy+c/uSH4W2414+l1cjhBpQAturcOT5RDQXKMf/eJ+7LS
         p6ES9ClL7NQJU/Z84kQkcOSaOEIGPFxyifDbZOA0qx6z93Ex9EcWZy+zrPyaDuIuBYu0
         rq1cMqpq/H1B3JlLi3HYMOg9iC84P3TMIDJlEFh7tu6QIHLnTBsy9z+Gbc2f5s3rWK3A
         Zi0i6dGZJqRu9iXNg8Q4oxXnHAjZ5hjvO6DKmdNSh14pJx/MZyBSyujZW/uz7Vo1iuFL
         jBG4csuByysaH2flnbTi7e2ioRj4IIv5bIhKwXsXJpXEazNSYEH0waMA5/4pAjlUlknH
         qnwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5AazS/IQ5sJ3rBN1/sKjZkyNIGCT2a5ghwSPHnCTlbg=;
        b=TA04IYTCG3M62y33mS/G3puMR2h7bYm927Y5PZqyKCsVqsX/dqjcv4m0dQrLdJkQk3
         7YE0lBWH2okW5yx6/hOtq2WwmtOtdGOcULiHjFKkKEMKtt45cNX/zyD6h+7A/SCuxaw5
         Al3UritUg6kVqoz0AvAdbJmgAcwVK9rHyy7Bn1LVLRFGbKkNlwBDcuEXI3X52yS3K4h/
         TfDUznIVrH5aml/KkPHIrSu4tFJ2l7xypVWURSAqmhjUjkmgQa3vW5w8qJwkxVuxOR64
         Os5tENcjzReVsG6cttEjNqCkI49KjdRPYZ+VUqZQ9UpBpCOWEj8XMfyC/YqCvf0sEoxs
         ulmQ==
X-Gm-Message-State: AOAM532sYtqM4Xx6PHm7jjsve7IEKLdLtLK1xCKQOvVW/aBOueUrBKws
	cf1o4XgYongVzv9zzMPJVIOijL7nMjyJgg==
X-Google-Smtp-Source: ABdhPJxB+j7lJ0BeKk4UjXs5hvm7chmyw9YvG9PSNTePs1mNvh6zBbdAqT6RsTaxr5css7V0GkVbFQ==
X-Received: by 2002:a17:902:8606:b029:12c:2625:76cf with SMTP id f6-20020a1709028606b029012c262576cfmr2488782plo.17.1632372554139;
        Wed, 22 Sep 2021 21:49:14 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id 207sm4025588pfu.56.2021.09.22.21.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 21:49:13 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/2] samba: Inherit pkgconfig
Date: Wed, 22 Sep 2021 21:49:09 -0700
Message-Id: <20210923044910.1784581-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
Checking for program 'pkg-config'                                                 : not found

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.14.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.7.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.7.bb
index 68a3f97af5..47fcd3a00e 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.7.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.7.bb
@@ -39,7 +39,7 @@ SRC_URI[sha256sum] = "6f50353f9602aa20245eb18ceb00e7e5ec793df0974aebd5254c38f16d
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.14(\.\d+)+).tar.gz"
 
-inherit systemd waf-samba cpan-base perlnative update-rc.d perl-version
+inherit systemd waf-samba cpan-base perlnative update-rc.d perl-version pkgconfig
 
 # CVE-2011-2411 is valnerble only on HP NonStop Servers.
 CVE_CHECK_WHITELIST += "CVE-2011-2411" 
-- 
2.33.0

