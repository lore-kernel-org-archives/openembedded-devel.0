Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web10.513.1586384329566318085
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Apr 2020 15:18:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@broadcom.com header.s=google header.b=FGlzdKI2;
 spf=pass (domain: broadcom.com, ip: 209.85.210.196, mailfrom: jonathan.richardson@broadcom.com)
Received: by mail-pf1-f196.google.com with SMTP id b8so1251016pfp.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Apr 2020 15:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9CysSW289dpZ7e5k7n82gZwX+eMoWJhE8gVioCDS8g8=;
        b=FGlzdKI2lwCwebdTleJwVBum1g2aLpQDnCpwjmuE+4s07QfFaQZUSI2RNCGkfukSg8
         +Qt8rK1QxUYzLHNj7ZiqJ9e/E1nGzZc4qv8zAslma0YvPg0VgsJFawdShKyaByC16Yl5
         qyVgy8GEBgffQ2BfM03/iRuI/J1F5zmRoQ7JU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9CysSW289dpZ7e5k7n82gZwX+eMoWJhE8gVioCDS8g8=;
        b=anhUM4FlvUOUM3Cus7xPbmhGtlYrSGfz5d5qchYod5KoC2UmEV1dXKAQLgaMkLWURG
         L8O6isM4yRwl+7MU0dBGErNCaH98wZz+edBv+QaJnW+661/aTdW3YCug4/tljNf1uovd
         coF/Tuz0wdautS2dHKFeqRv9JUkXUEgh4JjGyHPyzT29cxTROIPWuizspsGcxlJpKT+m
         BrwUyJqOC3c6OGs6AJ29bfJc3mXjOvhGOUEoTiXqFkSh1J+qcqGQMdpI03KTUdcTyJ9E
         01sO3Im9EbcG8utwfDHapFO8Cd2u1KV/uAW4rX8vfVVTZZl5x0nYefkL6D/iTgDKCofP
         Omwg==
X-Gm-Message-State: AGi0PubuRKpyUxJ1wa7IhVmMtcjxl5hqxD8MEAoR06SQJaMQ54tBFxDd
	KaQ+4XAvyPrcQOP1iDrJsMBeA+L/evuARP3Jh2djKFyIHGtZWZRk94YglOce5JC8eCQjfqDtn+m
	GxOR4y5/4Bea5WeZdxU7rCLPLZbUZGTPhpMi/r5E0aE+60IwP+x2pfHp4R2cSgXGK6zFiT3UuC6
	kWw5WAV95+DWDciXak+R6FF9uwRNvXyXEFBg==
X-Google-Smtp-Source: APiQypJguYcFaQUDt1vdmA4Mz3xsH/T0GFe9N1qpl5dJyVKOZ3tlO2B0JWdwmVN6rfLQVeZ9kRjPNA==
X-Received: by 2002:a63:8e41:: with SMTP id k62mr3063160pge.420.1586384328557;
        Wed, 08 Apr 2020 15:18:48 -0700 (PDT)
Return-Path: <jonathan.richardson@broadcom.com>
Received: from lbrmn-lnxub108.ric.broadcom.net ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id h66sm2035051pgc.42.2020.04.08.15.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 15:18:47 -0700 (PDT)
From: "Jonathan Richardson" <jonathan.richardson@broadcom.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jonathan Richardson <jonathan.richardson@broadcom.com>
Subject: [meta-oe][PATCH 1/1] configshell-fb: Add initial version 1.1.28
Date: Wed,  8 Apr 2020 15:18:35 -0700
Message-Id: <20200408221835.18085-1-jonathan.richardson@broadcom.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

configshell-fb is a python library that provides a framework for
building simple but nice CLI-based applications.

Signed-off-by: Jonathan Richardson <jonathan.richardson@broadcom.com>
---
 .../python/python3-configshell-fb_1.1.28.bb      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-configshell-fb_1.1.28.bb

diff --git a/meta-python/recipes-devtools/python/python3-configshell-fb_1.1.28.bb b/meta-python/recipes-devtools/python/python3-configshell-fb_1.1.28.bb
new file mode 100644
index 000000000..2d9ec079a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-configshell-fb_1.1.28.bb
@@ -0,0 +1,16 @@
+SUMMARY = "A Python library for building configuration shells"
+DESCRIPTION = "configshell-fb is a Python library that provides a framework for \
+building simple but nice CLI-based applications. This runs with Python 2 and \
+2to3 is run by setup.py to run on Python 3."
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1dece7821bf3fd70fe1309eaa37d52a2"
+
+SRC_URI = "git://github.com/open-iscsi/configshell-fb.git;protocol=https;branch=master"
+SRCREV = "da8f0cef114e7343a7ae96ff1db7c8c574f819be"
+
+S = "${WORKDIR}/git"
+
+inherit setuptools3
+
+RDEPENDS_${PN} += "python3-modules python3-fcntl python3-six"
-- 
2.20.1

