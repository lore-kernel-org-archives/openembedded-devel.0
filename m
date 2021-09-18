Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.865.1631984261899789348
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Sep 2021 09:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=b97TEFcg;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id w8so12907196pgf.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Sep 2021 09:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2pWP1GUbsFTgUoZyFv98pErgAvy1vMlHu/f4jJyMwQo=;
        b=b97TEFcg+XOQ2L/5HuiZvnVQtT2KbTMSVIteKiBpoMro1bSqIFcxcdTd5hdp84H/n7
         BTaWwfw5OuQeE+ij5QFfp0aMrQSxgcP80OyzkBgU4peYfOpXcMw79zWeux8tWNtqSUNr
         U12vEnwWPiUbniKhRRiDA23PfHFpo9qkMsBHLqIap1+7VGrEIeOJ1rd1xTThVr0Jz24C
         AFaOYslWy78dPUZrtbysv2iofWzEH2o/LD9AIzzb+hji+ak3LXXNSHL8S4ExxA6496+U
         EZXB6qQKQq/1aL4Lg0nebzZV9jrTYJv/A61rwWo3hEkVI3lDc1FYOO3SlqrN6Mk+j5Q7
         E7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2pWP1GUbsFTgUoZyFv98pErgAvy1vMlHu/f4jJyMwQo=;
        b=7twbsHHHij4CSkB/eIis/NhqxqlTG9cLtFEOiq5Tkeat06ic1/aHpkdW5GMd7yJzfZ
         QHFEF+tf93BsOo+2OeEhRxj5TuY+uYLhQCbFFCggjkaPNHtu+d5/AavH9H4pL/JVkjhm
         8F85plGoirE/6NfcF0GODZNMMbCWbBynRaafRgHHiR5UfNVT7hC9ChXrYTtM6LH2jXU7
         X9+Ruv9SEgX3r7VCkejfjeL4WSEorXOItf2KvzqXr1Pf51w4IwFQPQec/SgA0k2WxTdE
         RokIXuoCjKC5KVZzCqim5GlJ3ABG0qgXMz5h1wZrEaXJZXV1pA3gD7cMZrey9AgCELbY
         sJ1w==
X-Gm-Message-State: AOAM531rN5jV1UuVAkgMStAyr4RmUQgDflzHjNRzLW7lJ6NGs1wwSqeb
	X+s3SIAM+Jy/2MZiGGwGUMO0hxDw9pM=
X-Google-Smtp-Source: ABdhPJxPl1YZVsLiaIXYu87epY80uj7JXDho4amOpNK1RDYdb9sya0dx5MDM0kUqrz9i9Y7y7edebA==
X-Received: by 2002:a63:561a:: with SMTP id k26mr15631510pgb.144.1631984261308;
        Sat, 18 Sep 2021 09:57:41 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:f923:d379:e6c9:abf7])
        by smtp.gmail.com with ESMTPSA id ga24sm13485274pjb.41.2021.09.18.09.57.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 09:57:41 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 03/18] python3-ipython-genutils: set precise BSD license
Date: Sat, 18 Sep 2021 09:57:23 -0700
Message-Id: <20210918165738.2581429-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918165738.2581429-1-akuster808@gmail.com>
References: <20210918165738.2581429-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"BSD" is ambiguous, use the precise licenses BSD-3-Clause

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/python/python3-ipython-genutils_0.2.0.bb   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-ipython-genutils_0.2.0.bb b/meta-python/recipes-devtools/python/python3-ipython-genutils_0.2.0.bb
index 587aea1f05..2a28cf9ecb 100644
--- a/meta-python/recipes-devtools/python/python3-ipython-genutils_0.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython-genutils_0.2.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Vestigial utilities from IPython"
 HOMEPAGE = "http://ipython.org"
 AUTHOR = "IPython Development Team <ipython-dev@scipy.org>"
-LICENSE = "BSD"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.md;md5=f7c3032c3ac398265224533a0a333a35"
 
 PYPI_PACKAGE = "ipython_genutils"
-- 
2.25.1

