Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10244.1795752981668789963
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:16:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=G/nzvM53;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b563e32936so3514401c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795752981; x=1796357781; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ixEravuv2nkXoBO0nIgFeP41XKHrYpTfS9fyyaKbyKA=;
        b=G/nzvM53y921RV0jZMRZ4laIN5VbRP9Plir8YBJyauzytoFgnJOFFTsnT+GQM0tRAr
         C+rZ+gHo4obk5ucrwbX89vyfnqhAMaHsjjMK74lrDZGse1rMxh2OkyrbwXNIwGtsJsBn
         pEo6ygHpgHKEOs8lg6ZUHaGCQFVaCV5Y5id++SEjh1YhmzCF6JMDOunLWCtyQb1c9cXY
         FdW1CI0RXEzDjf4GZdX4FJK0H3KXpqgg9P0tFKdk4TJnfwL8ZAq2GOyCGj/jqH/m6ep/
         vogs4/KQwgRhWZsqtZDaFfP8iwn/MZLRojDJrEMbSjPRMq4mOW0PBaBCoVGOXFcbq8s+
         edqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752981; x=1796357781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ixEravuv2nkXoBO0nIgFeP41XKHrYpTfS9fyyaKbyKA=;
        b=STCiKhdIn9KXiGsxY2HIkipa8Hu6IXo8baolQ4TCpdZhRZwFvwUa6aBC+gmzwttMWP
         Y3XUXLSOU/XXGUgwBvul4s3xhv7bbTFSAtUbmLJNd1yeIQzCNrtnZOwIL14qqqhh14TZ
         5VedpsACQenXP3KaGaptbbY6AmrC+yexW4VTDigoQWV1aHeKlJOxcbC8HO6HMZSfWWYt
         3CdIFrGj1Ug4WmqID2GYkK++LtEV9fHzN0/bU9hxX5qFQtnPfKp4LUZdPB19P+PwBWHz
         e+3oBOZp5U7HuOe+GociUBlYbjI3kPW7GK1yqU0QyRF13y+uMRmLjoK5k3Zm7F/0hSMv
         37mg==
X-Gm-Message-State: APuU4Z/bmHzJvyelBTyziOx7OHm2o+oj5mjrToDrEKXf2BC0uLvKDUOk
	HtW/lh4lhA/B43jXViWKWsGSx7KtijO4SgVj71tdoMnqmgAfa9di2z2Z/TS2V369
X-Gm-Gg: AZFdTZc88lTeuLX4zhC1lxicJ3ydUsbAT5/lWDH0Ys3gFQhlXBWd+7CwOSfAFHYbI4V
	CltZ2ajNOJdOA4bz8h6EBRf2Aa937WRf5OijiT4kOvleD25eM0APeTDf1FQ2+uRwMm0NYIoJzuF
	9ZJ3I6mtOUwtUoPMUY9YMQMtHQ7hUjobfHovRqvVGGITypTKhWQGs4snA+soVEnE8UGcp7zeke9
	668uHITG4Q4h/ABzoZbQLkldG2xCKgI+ZI5lMNNGEBa5rIYDy+XmgyF76v1Hrmw1mhzX68Jh02c
	Q9Ft5MczZhNbAv9j590IiByRGSTucIpIdfXcIFWIBFtOk1ESswOjdINnglXVD9LPqgsFbQhe7ZQ
	xYXXnBhvsjAqLxOr5jSXJ671f0jBEf+sB+edN2VZ+hOspLCzGDcuc4LdqHMdQd42syjW8iMSGlr
	78S8KDoTZ5th5VjOl6fjnY0eRe7x2ESSGwbnu9kMDkgdNeNP6GalogaZo4UFFNGz5fB19LJ4B8f
	uhF1jLV+ofP4Ni2JVJSdYLZ0+R+uwElys/mjW8yAQY8pexT0X0uS6nW+duVFhQks04XF3LStNFx
	nl6Cn0C5g0wOo5Tc81krKrc5xgBQ7I783WJIHKpHanaj1TprBjXTPC4suQrMBr6VnDoPw8okyUZ
	G/O8DY/M4x1VdFuY3fBWB9cgrkq7eAOw6rlQ8eTHFWgVMq98wfx6S/o6YJ+hFsIAsOxqmFoDHPf
	wFXc7j5tQHG5lewZKtLyVJ084zBmXshSdij8QqL9Az+Sw1StLWWodYCTZaF1PPQ8nPezYILZSrh
	NYufUpwfCxotI6iNspukg6Xxu9YYndMSICgBqONOVJ2EQLo+XcEQWHhxmKD1M5adgOZVJz5CAeQ
	Y+qsos8NPwjBcyg5qk1n/+Jbag==
X-Received: by 2002:a05:701b:4583:10b0:185:33ab:4d55 with SMTP id a92af1059eb24-1b5569101fdmr21778305c88.29.1795752981025;
        Thu, 26 Nov 2026 20:16:21 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm52062757c88.2.2026.11.26.20.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:16:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 02/32] python3-behave: Fix upstream version check
Date: Thu, 26 Nov 2026 20:15:44 -0800
Message-ID: <20261127041614.1775064-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
References: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:16:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133221
Content-Type: text/plain; charset="utf-8"

The default tag regex picked up the gherkin_v6 tag and reported
"6". The recipe tracks the main branch (1.4.0.dev0) ahead of the
latest v1.3.3 tag, so check for new commits instead.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-behave_1.4.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-behave_1.4.0.bb b/meta-python/recipes-devtools/python/python3-behave_1.4.0.bb
index c514fe7792..3128a62cf2 100644
--- a/meta-python/recipes-devtools/python/python3-behave_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-behave_1.4.0.bb
@@ -7,6 +7,8 @@ PV .= "+git${SRCREV}"
 SRCREV = "aca602b4410163fe4be045ce86c9d76ec34a717a"
 SRC_URI += "git://github.com/behave/behave;branch=main;protocol=https"
 
+UPSTREAM_CHECK_COMMITS = "1"
+
 
 inherit python_setuptools_build_meta
 
