Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web09.1273.1616604630519445471
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 09:50:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KHds5DyY;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id hq27so34013344ejc.9
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Mar 2021 09:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F1fVwsmLGh7aQwnVeV6S8bYY8AmVMmklzro2brEJc9I=;
        b=KHds5DyYX65lu2ctFDB+YBCsFReKSEoRKHcl9sNzXZunUxkD0RDpPSGhJWAi5I2Qs0
         39S7QliOdzpqoZdh7nI1Dqum34NR9oIR9WAkfgf7j7mslhVjN/pjl64IAlwjE3QuzC+F
         WLE2mfgq2eqc0cnBWwo0zsPf14gVSLC6wNewNolkWvXPfrhwVHo8AOIrOrPgUHZC/AI/
         nyAbe/vWD00w8hgSJgzYj+QTRzu+QsnYq/+o+vwK+DCvjL0vZxDuRfKiNCFsiKeR+m6y
         y46aoJ1lL8nXP6o4YRcrXUZ9Ej64B83LEXPU8s8/frG1A85sUhWQnd9m1k0y5gZqdRJR
         lTSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F1fVwsmLGh7aQwnVeV6S8bYY8AmVMmklzro2brEJc9I=;
        b=bb8ntILvmuMtsfZpxseFFIJaTSeZ8w0CTp+TQp1sSx2Zhjw8DB53I0evLOXPAMnwWv
         kOdYgPjlgRrBnO1t8sYtWQYbm8GlW28NrvJ5p4Mw84R4mIWphdNQHa91a+nu70RE7K83
         AgBBISSqosX+j/jkDWaQZF4x34uabVB5O6+WXEPCw2L4hUXgx76r4wCjgl7Gofo1v2xs
         CHR+Pur6puGEROGXJbd4Ner7QEgvfppBVY/vfAPxOu2hAH39G9SZYIxayEC2vN3NBVWO
         xdSE9V9AH2DZaSZyIr095+Gy3R0Yd28/lk5jcogOhkCe+WilBShhmZPpd3RDQSGdkesu
         mk6Q==
X-Gm-Message-State: AOAM531N9MB6CqM6TFJPCWT5k4bNvWX8NefJRt1SQTFq8qP5Nxdvmh7q
	lyCejEaHp8VBl2ROGuNdE/VKmq0jlkY=
X-Google-Smtp-Source: ABdhPJxnNrr4nP0ai6IRiNsFbkb2reH0ikWvdb1GHQYeOtCvxA9syvKIe9ptgJD0CwZTbf2StKi06g==
X-Received: by 2002:a17:906:7c4:: with SMTP id m4mr4748034ejc.63.1616604628890;
        Wed, 24 Mar 2021 09:50:28 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id w18sm1185507ejn.23.2021.03.24.09.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 09:50:28 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-python2][dunfell][PATCH 2/3] python2-target-recipes-blacklist.inc: add PNBLACKLIST for mysql-python, lio-utils, openlmi-tools from meta-oe as well
Date: Wed, 24 Mar 2021 17:50:25 +0100
Message-Id: <20210324165026.391335-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324165026.391335-1-Martin.Jansa@gmail.com>
References: <20210324165026.391335-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/distro/include/python2-target-recipes-blacklist.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/conf/distro/include/python2-target-recipes-blacklist.inc b/conf/distro/include/python2-target-recipes-blacklist.inc
index 37eb49c..f83b28a 100644
--- a/conf/distro/include/python2-target-recipes-blacklist.inc
+++ b/conf/distro/include/python2-target-recipes-blacklist.inc
@@ -310,3 +310,11 @@ PNBLACKLIST[python-yappi] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON
 PNBLACKLIST[python-zipp] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
 PNBLACKLIST[python-zopeinterface] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
 PNBLACKLIST[telepathy-python] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+
+# from other layers:
+# meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
+PNBLACKLIST[mysql-python] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this , then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+# meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
+PNBLACKLIST[lio-utils] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+# meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
+PNBLACKLIST[openlmi-tools] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
-- 
2.30.2

