Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web12.1238.1616604600132971796
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 09:50:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iUp5/dwh;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id j3so28380708edp.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Mar 2021 09:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nJ41ohsfmkng2THYWODNBDSMklCAEimS23p0jATzomk=;
        b=iUp5/dwhCcQ1c7VrWI8Xc7qwRLzQ7F6pka3LCcbbVbyf0K4418U7K2DRHzhhCXKWwg
         TWB0gqkTMJdzLG6rWtO2znAKuBTrab9aeymsOmkA0zyBLYJZxZDTfBgi+d0o1qllOjyx
         zaia4g3Lspjv1zkxNUqe4S5JHqJccTIJ9hc4iO5c0NC5CboAOO0Ciq+iqGNKbKio5bOJ
         KmzLU98uWgh7eV7AgBMd5CoeBeSVI6VPrN+u/80OM5ANzUa14TBWM+ftG2OIMpDrCvbk
         MJoJwEnWsXDDzZRPZ1XdeBdrIzUY+L+Deq3frD6jCHNgdj5lzQ0JbQ7Tqyy6kPEbBuGJ
         if/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nJ41ohsfmkng2THYWODNBDSMklCAEimS23p0jATzomk=;
        b=Bx1epoFbTvchVKUnvoeb1RkFUFoumg6pLyIZVuxf0WTK5Dt0o2ZYWidVHKeNr1c4gF
         WWTSOp5UNirNby5wk8QkLR3a+GnZacbrFjfO9LgbO/eu7WPXom13L7WDbSL67f97q2ah
         NAGyz8v6qcpUnjiwKejdKDboEbTPuNLmu9bzGchRk+cvTVGnL6q5bJL9ktwojTh7sKqw
         FJvZ+rPHr42pg43y+uEr5XduWqiOTIkCFuB6LAMMhNe+FvNXaDL8sA4iL9w86MnCz1Ck
         chnwbTCEGpAum+jYePy5mJwIh9+yOiBGKa3u5GDRpOevzZj7e9u8IuRmALlr291yuPiX
         rHuQ==
X-Gm-Message-State: AOAM532Oi69lKYfMJujtYITIDpnNaQBDG4JPVKvtKu05m0Ljdb0rQEqa
	3CQdyEAA4KPJfF5izWK5NNX17BNdBn8=
X-Google-Smtp-Source: ABdhPJyZJT64+Pk7Y2xIrk4vLmNPxTxg//4DUbM7rb9/XgqoMe/3tfv7yxNJXtzkjXQ1AD01HnjNYg==
X-Received: by 2002:a05:6402:3596:: with SMTP id y22mr4448884edc.207.1616604598540;
        Wed, 24 Mar 2021 09:49:58 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id lk12sm1208246ejb.14.2021.03.24.09.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 09:49:58 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-python2][PATCH 2/2] python2-target-recipes-blacklist.inc: remove mysql-python, lio-utils, openlmi-tools from meta-oe-packagegroup
Date: Wed, 24 Mar 2021 17:49:55 +0100
Message-Id: <20210324164955.391104-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324164955.391104-1-Martin.Jansa@gmail.com>
References: <20210324164955.391104-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/distro/include/python2-target-recipes-blacklist.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/conf/distro/include/python2-target-recipes-blacklist.inc b/conf/distro/include/python2-target-recipes-blacklist.inc
index 40a73d5..f55ed0b 100644
--- a/conf/distro/include/python2-target-recipes-blacklist.inc
+++ b/conf/distro/include/python2-target-recipes-blacklist.inc
@@ -3,7 +3,10 @@
 # from other layers:
 # meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb
 PNBLACKLIST[mysql-python] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this , then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+RDEPENDS_packagegroup-meta-oe-dbs-python2_remove = "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'mysql-python', d)}"
 # meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
 PNBLACKLIST[lio-utils] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+RDEPENDS_packagegroup-meta-oe-support-python2_remove = "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'lio-utils', d)}"
 # meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb
 PNBLACKLIST[openlmi-tools] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'python2 is out of support for long time, read https://www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if you really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHON3 to "yes"', d)}"
+RDEPENDS_packagegroup-meta-oe-extended-python2_remove = "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', '', 'openlmi-tools', d)}"
-- 
2.30.2

