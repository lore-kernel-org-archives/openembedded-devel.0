Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.1271.1616604615517330398
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 09:50:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BtHuQciO;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id dm8so28454340edb.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Mar 2021 09:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F1fVwsmLGh7aQwnVeV6S8bYY8AmVMmklzro2brEJc9I=;
        b=BtHuQciOoOrFBmEvpcnDc4Z5GnvyI7re+Uw15pslGxtbnvJxLcinYJSOcEkKgkZx8C
         kENs48CScx28NJiXiNo92cN1Ya8J5AFBpM5ft5xz4UW8xcjdvEVApeOgf2qKSTcdewaG
         uB6Dm7cvZ5k+BesdZpZOWipVFz4291I6sRzlkRLwC2mrgDxIUKrobNqz5Ex7Dlerujx9
         bSqXK0VI/13+uIYaOdRHO4NVJcfpCfp6bqtHy+B+VqIUO5QgWVS4rP+3yFcHzVLDuVXm
         PZCSKXks6LHmkh0Dpw+afliDwk08UtnSJJlZwabUuH4zIKTwgGUh/2kuxDl535qXP/i3
         +AcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F1fVwsmLGh7aQwnVeV6S8bYY8AmVMmklzro2brEJc9I=;
        b=qMpW6Jiznxj7xH589Dvdg1a/gHS067a4z8cM9bsiKXHEHEgfdSFyvE7CreeT/wIsh7
         594lbYhpy2fHJUfFpuZrwuho3tGCd8MsfC10hrAy8414+wuDlQJxoIhV90H0pv4b4nVF
         WER/xrSWyp4vZHpdGq9FnWg7fXXUK8/l12qFMcRyI/CPZFbjERiVWi9m62qWp982nKpC
         HdaPXUysV/jLyVEDZjMlpy1S9WSzZZRV/Lq4+967MDbfhotEtZon3IkthYNKHKU/g7bH
         cOAL6Vg1zSbLtgHuFJpBJm0AzBmiCkNeTdZ1N82ixUks7aQzEBv9Lhlx8rR7Suw0S6Rg
         Z8IA==
X-Gm-Message-State: AOAM531zyK3Ga0UIAeNELNBjQnvD0seBwWF/SL60Gz/GRYM07XoKgHIv
	QbdH7KUxfOrex8aL3x9opjD4lPWFOXY=
X-Google-Smtp-Source: ABdhPJzkWo0aT9b4Bl5YhHizocZrMMuKuCN00WLc03+cf/ZW/CnKpd/ZC/IHGRxhTyLXIpKGh/4tNw==
X-Received: by 2002:a50:ec07:: with SMTP id g7mr4449413edr.72.1616604613852;
        Wed, 24 Mar 2021 09:50:13 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id p3sm1197170ejd.7.2021.03.24.09.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 09:50:13 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-python2][gatesgarth][PATCH 2/3] python2-target-recipes-blacklist.inc: add PNBLACKLIST for mysql-python, lio-utils, openlmi-tools from meta-oe as well
Date: Wed, 24 Mar 2021 17:50:09 +0100
Message-Id: <20210324165010.391197-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324165010.391197-1-Martin.Jansa@gmail.com>
References: <20210324165010.391197-1-Martin.Jansa@gmail.com>
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

