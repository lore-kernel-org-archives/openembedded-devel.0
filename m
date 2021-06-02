Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.13607.1622643309513654107
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Jun 2021 07:15:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=ESWxPTMJ;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.50, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f50.google.com with SMTP id t4-20020a1c77040000b029019d22d84ebdso3869653wmi.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Jun 2021 07:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p1JtCfeBz5xgpY4ngMkOy19xKO/rYaKQetjvM4rmsig=;
        b=ESWxPTMJDtuD/TDi8sUC9VSA8KXd4hgwC5tVE7dcIZRAdmst8yHKd34Protfw0koNu
         tlEwQ60FEWKwc5Qiq3/aDPBOTKUcXwoVClj0Ep9UESFr075ovQ+QPjbRYx2Xq5a/vKHp
         6awNdbX8kBsRKMrZ5OLF56fq41RGNTC3HZcr+sSB/eOICHWhnlbJOBMKfArdzY7BrF2g
         ET8dP5o8wApYp2MAHFr/XKkinREaWGMz3uriKtC9bGCAZYf1mO1YaUl90+jFykOuZdeo
         yCC74v2jdzKsub5hEY38GVUd+AvJgN6mbZh7/AYrF9PA3hXrRblrFFQvYFImHP6XkMRI
         xJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p1JtCfeBz5xgpY4ngMkOy19xKO/rYaKQetjvM4rmsig=;
        b=PoqyFKEuaS7hGv7aW12xXOPegbQBoVhnRzMuGoD8ctxiwe3ak1szR6OMfXxoHILZnK
         XMs63srB/wcoCK3IQKxrrxVIkQviCyK8Orx+JHbp7c5BSG+Y6EaMxrGT9Vavmzp5bDSd
         DlFPtn/deVnbR6QaRG7DqI85aqozspplcLxqyPu7THeZ6/OMDCuXJhw8hVN9yS18JspQ
         Gld9UdiZyFP9vYOdWVnwSHIZw9hKKBwMvVHRJSjJUR7Jxv3+6RPUkBX3I5IqwuolZwRc
         sKUjlPeoyZvfOWAbiPIpda5fPdsV147mNZq1E8HcDACbPhjkipXzlh65dqlg5Bmi5gv7
         d7RQ==
X-Gm-Message-State: AOAM5338L7iCZFlrwBZ8Jcbhk7IhgKqRm61+ZhyucplRcbf9n7SpNl6Y
	K9xrbWnucE1BkwNkIywrJ5NSRA==
X-Google-Smtp-Source: ABdhPJzuvbcN+oWP2Ey+UrbG2J7hHPrlRleczB6CMoHmBpclJ4CoMdY6tTERHbHc0fqIOw+YdDXcew==
X-Received: by 2002:a05:600c:154e:: with SMTP id f14mr5574302wmg.36.1622643308096;
        Wed, 02 Jun 2021 07:15:08 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id i12sm2824697wmq.7.2021.06.02.07.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 07:15:07 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-oe][PATCH 5/9] libgpiod: add RDEPENDS for tests
Date: Wed,  2 Jun 2021 16:14:57 +0200
Message-Id: <20210602141501.6174-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210602141501.6174-1-brgl@bgdev.pl>
References: <20210602141501.6174-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The libgpiod-tools test-suite requires bats at run-time. The python
test-suite needs the packaging module. Add both to the RDEPENDS in the
tests PACKAGECONFIG option

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
index 9e4bef7b4..c0ebb8aa5 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
@@ -14,7 +14,7 @@ SRC_URI[sha256sum] = "841be9d788f00bab08ef22c4be5c39866f0e46cb100a3ae49ed816ac9c
 
 inherit autotools pkgconfig python3native ptest
 
-PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev glib-2.0 catch2"
+PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev glib-2.0 catch2,bats python3-packaging"
 PACKAGECONFIG[cxx] = "--enable-bindings-cxx,--disable-bindings-cxx"
 PACKAGECONFIG[python3] = "--enable-bindings-python,--disable-bindings-python,python3"
 
-- 
2.30.1

