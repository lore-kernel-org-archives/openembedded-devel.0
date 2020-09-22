Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web11.954.1600750067076868130
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2020 21:47:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PPBUnc3d;
 spf=pass (domain: gmail.com, ip: 209.85.216.66, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f66.google.com with SMTP id md22so753881pjb.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2020 21:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bZ5ev//53cQms5lMk4WKcUgvYmwOYsf2fll8YoE9gbc=;
        b=PPBUnc3dGCF2LFTTWWiqr7vKBp9IHgSY+Vr9k9W2HWFQStkO9LrWJDaqaAwx8R2KVs
         0hrv6+sfkFG1GVAa6FTVdDSTp6lARWPg7PmOSI2NV7KhoAq/lsZsXWHuQkcUy9OnqIhv
         yomD0HEX1pxsCoHQXLTrmbNNJkuIveqftT/3Zs4f7tHfyV8Xgz/6jvfZ3ixxIbstMITw
         jArQ6xysO4fMyL0klHEwJvp6bFRYKSwllgzorYs5kGcgW8H2jNZbtAODaN++B5CWDrQx
         NFcTTGnmHxvoLJ53Zx0JIndw12I1Itg7v/mLjqXbCUMJc1odkxmw0jHMfLQ694o906I5
         EFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bZ5ev//53cQms5lMk4WKcUgvYmwOYsf2fll8YoE9gbc=;
        b=XFtEhumqnRqQYBxYOGxN2WyUzUyn/9X5tUGM2Y1GKRexBEpYxfPsrDCUSrqi7DEoTz
         WCplFwzuHFyCv+iNWwk/UQ6mg5vMgGOLrAMvSNFv2rZCLeTfmEp1iVG2k/QuHvGPB5VN
         xPik8N3iFrG1ELyiAu5vM8dGv+IQEi7agoWeH73d+0SCD/Bs14VBcg5wf0UzZIO3TH/+
         3iwD08efT6XckVXtHbnTRoZKrjN6dw7mZMgG1rHwFa96IhHyes3+4tU14ia2AOkM+D42
         m+Xqw4Y2YgBgAsfrxP9MvjzSpckwXywqbQBhFg4lyGr6lcneTHOFUSjSzfbPigzJjLTb
         PHjQ==
X-Gm-Message-State: AOAM532emGTOLDyNS3eTjnshmlzhGwr8kqfLBC7Wbz+Hays73/Yp6MoV
	sLA3YFw6MA22FNaigSHey7ZI8cF6GKA=
X-Google-Smtp-Source: ABdhPJxdOOUN/kkN8fSd0spmOn3RaZEfIzvgtbG+AK2h9jIADMYoYBkkO5QtHkZj910M7Z+DyJLYTA==
X-Received: by 2002:a17:90a:db05:: with SMTP id g5mr2362412pjv.22.1600750065713;
        Mon, 21 Sep 2020 21:47:45 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:9640:8176:7362:ce41:2f0c])
        by smtp.gmail.com with ESMTPSA id y13sm13563533pfr.141.2020.09.21.21.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 21:47:45 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <ticotimo@gmail.com>
Subject: [meta-python][PATCH 3/3] packagegroup-meta-python: -jinja2 -markupsafe => -ptest
Date: Mon, 21 Sep 2020 21:47:27 -0700
Message-Id: <20200922044727.18107-3-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200922044727.18107-1-ticotimo@gmail.com>
References: <20200922044727.18107-1-ticotimo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <ticotimo@gmail.com>

The main recipes for python3-jinja2 and python3-markupsafe
have moved to oe-core. No need to duplicate them here.

Instead, we add them to meta-python3-ptest sub-package, since
we do enable ptest with bbappends.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-python.bb  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index c03f610da8d..e1624df6e7b 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -17,13 +17,13 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-rfc3987 python3-xlrd python3-bandit python3-constantly python3-inflection \
     python3-javaobj-py3 python3-sh python3-pycrypto python3-pyasn1 python3-pydbus python3-wtforms \
     python3-pybluez python3-babel python3-parse-type python3-bitarray python3-django-south \
-    python3-pyusb python3-prctl python3-jinja2 python3-werkzeug python3-pyjks python3-requests-ftp \
+    python3-pyusb python3-prctl python3-werkzeug python3-pyjks python3-requests-ftp \
     python3-behave python3-pyyaml python3-tzlocal python3-pretend python3-stevedore \
     python3-sijax python3-langtable python3-requests-file python3-crcmod python3-robotframework \
     python3-pint python3-coverage python3-iso8601 python3-ndg-httpsclient python3-yappi python3-twofish \
     python3-speaklater python3-smbus python3-djangorestframework python3-msgpack python3-jsonpointer \
     python3-flask-script python3-cassandra-driver python3-ujson python3-aws-iot-device-sdk-python \
-    python3-pytest-runner python3-pyiface python3-flask-login python3-markupsafe python3-setuptools-scm \
+    python3-pytest-runner python3-pyiface python3-flask-login python3-setuptools-scm \
     python3-semver python3-sdnotify python3-flask-user python3-tornado python3-jsonpatch python3-pexpect \
     python3-progress python3-jsonschema python3-xstatic python3-pyroute2 python3-idna python3-sqlalchemy \
     python3-urllib3 python3-flask-mail python3-asn1crypto python3-pyinotify python3-intervals python3-pyperclip \
@@ -68,7 +68,7 @@ RDEPENDS_packagegroup-meta-python3-connectivity = "\
 "
 
 RDEPENDS_packagegroup-meta-python3-ptest = "\
-    python3-cryptography \
+    python3-cryptography python3-jinja2 python3-markupsafe \
     "
 
 EXCLUDE_FROM_WORLD = "1"
-- 
2.25.0

