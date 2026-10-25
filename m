Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30957.1792964618439307594
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Oct 2026 14:43:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iMkVpjxm;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-353804b591eso4457781eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Oct 2026 14:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792964618; x=1793569418; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hh2uFHhq19+aIf/S5OzsF7AqdPRXz1HxN5SmPXEqPcA=;
        b=iMkVpjxmqiFBW0l488to5FyMIG2chyn/kRx+PvenyC3k1k368OPce56TomcMYY8FT+
         i3LmlMut9D69N2KU9DUnONCZ9dKQMX6UXegrl5r5lH85AMdZ6u9j+++tOFeTAxwsXOnz
         IWFDxb7610o5hR9Qw8RdZb2Iya4q85b45V0X6lB/4YKBBsghHSSFcY8r8dvnsNlVT+vL
         NgEAAWA3Xc9o0xk6B4AsWt6H95iqk3bgFuzd3DnyaEa11j2EAeKQ9wnpbW/MlkC/95QM
         HAHCEF7odlqt1J4rweklTY2SE2482jF/evdEazUVMjVqFV5UsFYpLzk6IkJY1JwJrp7G
         DfHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792964618; x=1793569418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hh2uFHhq19+aIf/S5OzsF7AqdPRXz1HxN5SmPXEqPcA=;
        b=X4SZbJegH1u3b7GWOIpjxXtU6GtROufKIhEmPQpw0/JRd5cXcYgnHESYZ49leyRqDv
         gJdV9eQx8NBaQs9tf50Yn0PDeVwbdwY1XTgk9D+VKdUQAIu5XZqH8X1j4ZROJKbZS60T
         ybda7Ami60ssWW40Kj2Xy+1/u9QckW/0h5e4RxXCcOuvIedfImF+5m5xCLuA/VzVRDIz
         EvpGU5RNY5Ww/qb7JQUZFag/vCLvgSfIvkcGH0k4z6GxAkG885Hj8EAP13iXlGsdt2qs
         lMZdKW/tZzpCxYXmvCTjNtWCIstHVRfyqGM+VSthewpKCZ1e+rmmWKdLHbaekQOcu9Gk
         traA==
X-Gm-Message-State: AFq9FYK4+6R+QYdMbUyUuvGfb83O2sdY+ssFL2hLzrnREJQhPy6pqi01
	wVwldQ3DxoRiuxTdjoahuXyUyfZ7zAB/RKzk90sj6xlqqYPbyTKcFifEEJgJPb9K0tA=
X-Gm-Gg: AYBFou1vdG3BGLk/R+LZE4gipMg3Q8/i9ObXXbjogNl/7f0ixich+lZdkuqnLV3YUKv
	igEqQkGwjoeFEQ38iPgyYnP5QwqGQDlIKgZsxQRULpdeqZvBG2jo7vjVBwmsxmjDobH4iC9aPGE
	npXNWKiHZWvHbdoFqzOqKlyEA6ZqmjW+XaBXjV/yE7p776qIIIFNDF3akZO812npjgyNuaTtFAh
	UT3aZcTilPbGgkEgMklIeipZVR2WaZQsPsea1tBS5egrMQrku2jIU0H5DOhKj2VZ5iyvB8+wN6r
	cCHrpO0Ya4Yw2bI6qIea55G43wgoGkR4SvexA1WdU2q5t7X9wGyo5PG5oyHns4VpaynF4ryQbTi
	TNHA1KA5ZN/SixDOs+9UmZIdqAzGXhMP4hyVCwTwWoRSFBEq+7ED00ZxDe1czm8zuaVJNgaXl1z
	AW3Z4cvwpHLl9pAM0habYEAB91MusBkg3YOrRHz2mvYJnLiAUlvBsNLZ5/0uF+yUM3OqrvxVopp
	It4mXm6Rpq/iNYaDj5gjfuqWqR6uYXNtzLX8G2whSSCqsKAhMnZYKIt3PtopBBfh8hmBAGpaIM/
	q+01TAE9MoZ7x5V+NUUQz/2BY0vcW7C5L5AJE1eUWvldQBYzWgYPe/6Qwkxfb4wRpyn57b/2DaS
	WXvG1S0vfaSIqElkYm1wXOVM27M2b5DBCGDUl8TVN7P2w+abFs1VUrHe1XMe/PlHb4nGCodKyU+
	Y6RLH0gBOF+tlDOTHS7gI66SMNnAhr3+SlcnaTkBJw/SAXzIN4rfnir1hXB7HynpC3+RRcSuQy3
	MwiQSHcJgpNv/507g7iFVcSkzF9RnJeOJJcMg/Lo4d/6bgL46j5
X-Received: by 2002:a05:693c:66db:20b0:353:5b04:8d19 with SMTP id 5a478bee46e88-369e847a128mr6636333eec.9.1792964617606;
        Sun, 25 Oct 2026 14:43:37 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369ff5a4d68sm4451403eec.14.2026.10.25.14.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 14:43:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 5/6] python3-fsspec: Skip network test in ptest
Date: Sun, 25 Oct 2026 14:43:29 -0700
Message-ID: <20261025214330.653779-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025214330.653779-1-khem.raj@oss.qualcomm.com>
References: <20261025214330.653779-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 25 Oct 2026 21:43:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131410
Content-Type: text/plain; charset="utf-8"

test_async_cat_file_ranges fetches a file from a public S3 bucket, which
fails without DNS and internet access on the target, as in sysvinit
qemu images where resolv.conf is empty.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-devtools/python/python3-fsspec/run-ptest        | 6 ++++++
 .../recipes-devtools/python/python3-fsspec_2026.9.0.bb      | 2 ++
 2 files changed, 8 insertions(+)
 create mode 100755 meta-python/recipes-devtools/python/python3-fsspec/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-fsspec/run-ptest b/meta-python/recipes-devtools/python/python3-fsspec/run-ptest
new file mode 100755
index 0000000000..544881a837
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-fsspec/run-ptest
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+# test_async_cat_file_ranges fetches a file from a public S3 bucket, so it
+# needs working DNS and internet access from the target.
+pytest --automake \
+    --deselect implementations/tests/test_reference.py::test_async_cat_file_ranges
diff --git a/meta-python/recipes-devtools/python/python3-fsspec_2026.9.0.bb b/meta-python/recipes-devtools/python/python3-fsspec_2026.9.0.bb
index cacafc88d6..6b2b4c33b1 100644
--- a/meta-python/recipes-devtools/python/python3-fsspec_2026.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-fsspec_2026.9.0.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b38a11bf4dcdfc66307f8515ce1fbaa6"
 SRC_URI = "git://github.com/fsspec/filesystem_spec;protocol=https;branch=master;tag=${PV}"
 SRCREV = "0f76baaae4a227b085b18e8469e6cc1792a95ade"

+SRC_URI += "file://run-ptest"
+
 inherit python_hatchling ptest-python-pytest

 DEPENDS = "python3-hatch-vcs-native python3-hatchling-native"
