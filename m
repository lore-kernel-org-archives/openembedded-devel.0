Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.682.1630596534838084517
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Sep 2021 08:28:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=i4DKpBNs;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id e21so5271604ejz.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Sep 2021 08:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aQD7DIYvO97qcvYiuqEO0d0cec5qVnxTKdfxlam4guk=;
        b=i4DKpBNs+9dAOq+Z+deru1dao8lnLFskIvZyeFV1dXar3zqtTbafgPNaNsc2o9RmHv
         OVNo5Tcgm5OBcijgpqicy+knFKA4PhGul1jR/ZzmPA6JMFYPAjP2E4XMwP1JalHtTzuJ
         Ph3TTx1mNkpwp8JTV5QH9NEclq0j223fVPnQ3hY3IXUSuSmPXi1RpN8xklNnPQeebCTO
         E9IYEGuepJq8jJiK84Aj/NxNU50nV2KpmzBFnR/vCUDWa8okUuguc8+sM8oJoplUNrE2
         QBVFm8VcDV0VP1JzDoyOTRDNgOftxMouS5dVYdVYG9HpTk4G7+LDNRisGmt+ii9mRnkb
         jSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aQD7DIYvO97qcvYiuqEO0d0cec5qVnxTKdfxlam4guk=;
        b=FpAvCppOMix9QQ1iQWjsqpasOEE64ED1KgmwMkZfFjRteA6nzFZ0rYPWN064sw3n98
         ilO9y3MnKyU7To9CdDXLhrQwxVoR3swnVHvwpzr3F4cZm+4MfPBj3tEDbMU23g+hzPAf
         SXoAwehJYj2QQC5zcoeGIfInr4JwziwFUrq8golccxIFoEeJQnbc5qDMtuCD35C8xjjm
         mu/44gpPZw4lvtkd2xHRUfNV+M+Yn1v5eVh32OCZiCKpvbOdrr70SHPUx/OclpM5VtWX
         +CPJXSF/G1mpHz4pwDOgKm8sV1LP80HF1vrtSPSQvAGx2nna/bP/yhWT1unOdQCOVZJ1
         eQmg==
X-Gm-Message-State: AOAM530YUvSk1lNvwwVbx8JpwjXdN8iUE2a4M9Lprk1VYuctcv0Z6/o+
	/Ds80vA0+AINnvjsH7/+3eB+FWo4Jm0=
X-Google-Smtp-Source: ABdhPJyXXMIc0ayXCeO6rgvOFomO8jdTvRECOTXOq9L8xiasVOFIcX66aReLI2gzrCNxiXlHXkVZ4g==
X-Received: by 2002:a17:906:3146:: with SMTP id e6mr4368412eje.296.1630596532962;
        Thu, 02 Sep 2021 08:28:52 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id p8sm1315336ejo.2.2021.09.02.08.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 08:28:52 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-python][PATCH] python3-regex: upgrade to 2021.8.28
Date: Thu,  2 Sep 2021 17:28:50 +0200
Message-Id: <20210902152850.345481-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* 2021.8.27 causes python3 to segfault in various cases:
  https://bitbucket.org/mrabarnett/mrab-regex/issues/421/2021827-results-in-fatal-python-error
  and was already yanked from pypi:
  https://pypi.org/project/regex/2021.8.27/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../{python3-regex_2021.8.27.bb => python3-regex_2021.8.28.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2021.8.27.bb => python3-regex_2021.8.28.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2021.8.27.bb b/meta-python/recipes-devtools/python/python3-regex_2021.8.28.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-regex_2021.8.27.bb
rename to meta-python/recipes-devtools/python/python3-regex_2021.8.28.bb
index c869003c9f..e375b5b28f 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2021.8.27.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2021.8.28.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=f0a3e4a2554ebb89c0
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "e9700c52749cb3e90c98efd72b730c97b7e4962992fca5fbcaf1363be8e3b849"
+SRC_URI[sha256sum] = "f585cbbeecb35f35609edccb95efd95a3e35824cd7752b586503f7e6087303f1"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.32.0

