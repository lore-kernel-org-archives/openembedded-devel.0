Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web09.6295.1622029972361624641
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 04:52:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PJL3ee8W;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id a7so489069plh.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 May 2021 04:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=/4ZOeXhaCBwZHVufpjiY8V+p3CMg9Si3EDktSLWB6zQ=;
        b=PJL3ee8Wb/6bqc/dgWPdd17qzI7Dzkf3nC3LooIjjZx90MzZDhqbUdbaLBx8+McLUH
         mTvvfx8DGMRUHpdgWd/N3dQf01gtDOIP+5EKFS3zETyTOio7iZMtZhg7363HU2pC1Nfy
         Zk7UgTvjL9dXJWCk2T8k3dsX8vJKlGD5T5EG3aKxcxD9R2DmUSyyGmBaEjbE6UnWUd/D
         K7SDONOqfsh31GvV294mdVjj8vXH+GYiCndvO+fG1xwJ+foyEkKNIBh6AtcogppYjzgN
         ZLaWL7ZSr1MG7Jt4Soq6ZxcRvUpy1mDUayBOkqezCul6G0uV+o7T9jnpknr3BeIJt6if
         FuFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=/4ZOeXhaCBwZHVufpjiY8V+p3CMg9Si3EDktSLWB6zQ=;
        b=IFhh7ruyh1dGQh4I98dYM3xp0sO92vMK7g17E8pYu38/y9ZJJBfIGunXa8gmJ5iavS
         0w1MnYTfm3yYLaIwANsX7EGz5RcSSvt5QtiO2vibLdONzTiekZ2tkkWh5objlNHN/8C7
         9O7AjAvmTUQPpH/fZNjxfg0q+r7Cka96eniPcncv/GPTnlZ8b3xl1kE5IauLdTM1XCTM
         lEKK0l7XdNghVIsMichrHm1KFtWLQligrsHzWzMp6PoZ6/R5+SZwR8rNQaAdcFRp+aYr
         gbCvXscNTuXcWcHVd/T8h3gr3a6kiy1tjTWLtVJMEdIjEvzxFvqJVi4AUGSemOjwdz9v
         8ZRA==
X-Gm-Message-State: AOAM531jBXGGFLr5iiJDPUv2kKbmVuCQ0pszpATEJKcGKQrrTLXUHC3w
	L0VCKZIBQEf/Ji8N56bTVVq8URoWDeHsKQ==
X-Google-Smtp-Source: ABdhPJwfbEzWj4OTrt+4rQsSvcxhj9ZLWW6Hb+0rJZEuvjd0Ct+kQ7Wc6v3inrfqfg1I/f50wo/7vw==
X-Received: by 2002:a17:90b:1b4c:: with SMTP id nv12mr35473230pjb.55.1622029971835;
        Wed, 26 May 2021 04:52:51 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:68d3:e59c:b64:76e3])
        by smtp.gmail.com with ESMTPSA id h22sm15408818pfn.55.2021.05.26.04.52.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 04:52:51 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [harkknott 02/23] python3-robotframework: Upgrade 4.0.1 -> 4.0.2
Date: Wed, 26 May 2021 04:52:17 -0700
Message-Id: <d555451d1089b81702dedb920fd982697571b46c.1622029873.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1622029873.git.akuster808@gmail.com>
References: <cover.1622029873.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 4.0.2:

- Using Union containing generics as type hint causes an error
- Libdoc does not anymore work with resource files in PYTHONPATH
- Rebot removes sourcename attribute from <kw> in output.xml
- Run Keyword If Test Failed does not work correctly if it is not
  first keyword in teardown and test is skipped
- Argument conversion problems when type hint is ABC

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit 73d63dd3fecc192695514aad00341020ca08066f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...-robotframework_4.0.1.bb => python3-robotframework_4.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-robotframework_4.0.1.bb => python3-robotframework_4.0.2.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-robotframework_4.0.1.bb b/meta-python/recipes-devtools/python/python3-robotframework_4.0.2.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-robotframework_4.0.1.bb
rename to meta-python/recipes-devtools/python/python3-robotframework_4.0.2.bb
index 3e5d67e0a4..67ebe3ee69 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework_4.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework_4.0.2.bb
@@ -13,7 +13,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE_EXT = "zip"
 
-SRC_URI[sha256sum] = "9fa609ceb78f67b1476edce8a7011b16bf3ab41c0fb8c211de6c99955eaf9fde"
+SRC_URI[sha256sum] = "efd39558219fddc86473d4d390aeaec60640d7a7567a15fd51c0576f20e46171"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-shell \
-- 
2.17.1

