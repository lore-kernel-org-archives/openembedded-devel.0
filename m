Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web12.1237.1616604599444399695
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 09:49:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FmtwS3Si;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id j3so28380677edp.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Mar 2021 09:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k/1phB9HuUAH5pYHKS2Vh08ONbBJ1s8T/h78fxpcBlM=;
        b=FmtwS3Siuq8YajlmGCKhbsAfovboEmQncxrNOH0EbQLPUaOlblq7hCHeS+lbE0pH0F
         bdEfhRlPVt6bAPFe7N2LrMid9zkW71qAyAjHidGZnaLROTHnP8Oa2d6cCImWGMx4RBax
         aS9xp2eCIvnFbRXFtFsn08ONAwMtus9YcFym1F6zPQJyUh+NUzDVbEd63FObyuLDMcHC
         v/95orre5tvLhkBpvxMkuPzy33eHxnE4JqlM9lToiCWGIFm491+56ge+/IEc6dI1SJkP
         ixmKMpfLuAsAcc1wdsrGZ/4jsq2BCUpasqLldJm3oyZdNFRif8ZkyeRb4AkEJi4QRmuq
         CDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k/1phB9HuUAH5pYHKS2Vh08ONbBJ1s8T/h78fxpcBlM=;
        b=O16ihiSYodW8J+1EKSrk2LqP2rADBkLSWEJzaWgk1DI4TAIbbNvithEvF4hv0AmOB0
         dW2BpcQ6v8DQ8Bs0lFypCPJdF2cQJEbzmkxwZHs1nUQiGHrX09qw2ei1oe8ZbghzU1Af
         b2mhTRJsIoSWsuRLt4geE78qjS8iAONMqRkTtRj/OGtNdbIUskdJU8eGM0Tg/0xQPo48
         zx1qe8yTGY1dsHgpjvtJYJKrhqtdN7Djql6ZQq/wChB44Y+/vCUh0cEWMZ9itknfJyvt
         K46jMfHpCzEXUB2uLjTlOq8Nqtlm+M0b0PeBzAs8NwGNSB4pqmjJWlq7KWctez5lr/i6
         IwHg==
X-Gm-Message-State: AOAM533gY33LwwkCDnE7OhpRHcvdFlL2se00IRTcB+N86mp2BgQyfBKZ
	He4ObSpOQsvA8mSHSdJJasx1MIgAT34=
X-Google-Smtp-Source: ABdhPJykbSj+ALkc9QsdDPJeaZeCPpPLiZed/FWwBCtxkB/h2avsJAiUuApsCyoJLWGICh3ClT6rVA==
X-Received: by 2002:a05:6402:51cd:: with SMTP id r13mr4501310edd.116.1616604597757;
        Wed, 24 Mar 2021 09:49:57 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a9sm1400749eds.33.2021.03.24.09.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 09:49:57 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-python2][PATCH 1/2] python2-target-recipes-blacklist.inc: add PNBLACKLIST for mysql-python, lio-utils, openlmi-tools from meta-oe as well
Date: Wed, 24 Mar 2021 17:49:54 +0100
Message-Id: <20210324164955.391104-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/distro/include/python2-target-recipes-blacklist.inc | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 conf/distro/include/python2-target-recipes-blacklist.inc

diff --git a/conf/distro/include/python2-target-recipes-blacklist.inc b/conf/distro/include/python2-target-recipes-blacklist.inc
new file mode 100644
index 0000000..40a73d5
--- /dev/null
+++ b/conf/distro/include/python2-target-recipes-blacklist.inc
@@ -0,0 +1,9 @@
+# recipes from this layer already have PNBLACKLIST inside the recipes
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

