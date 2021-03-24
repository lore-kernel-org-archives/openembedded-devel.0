Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.1352.1616604621397745403
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 09:50:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kAVAdP/Y;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id hq27so34012026ejc.9
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Mar 2021 09:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Km+M2BPaaPwlTx9DM5zlxOmZHKxFCLz8BjY5nWNts/4=;
        b=kAVAdP/Yl9oko+OSsG586UXyMlmjnMO1eLU9x+fLVxsgZkoiNsBFF+gw/+WKfC2xjh
         DxrTRQ5C9wMDlLSBTbgBMPsOG30Q1so64Dfd8CRPuVrkpt+Y1C9dBjrpsH85hcPTfz/t
         eztueZIB2ZkUEalyTkcQYmilTaNSGwSlkFQnW2h9j+2ruyy0OjEydpqnjUSnsKzrM/04
         Vxvz+vrMx/p6pqY59O2uBEl9Gy+Y1+kZFoiytGuI/paDeGT6hL+kWzpyi+Bf76/GQ+xD
         LIfOdOyefCPUZHBZQhU6fwLW7I+Kp/VyDsEH1LpsPn/p2eYZSEYE+w/ouwf5FvO/gWvq
         EWZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Km+M2BPaaPwlTx9DM5zlxOmZHKxFCLz8BjY5nWNts/4=;
        b=pFybgIgG/yMySCkMJkW7fotVpZMZ03krLixMRrWV3luF7m7IxL3mpmRbcfcb50fbze
         ZsjV8fUCbZrdtuPDr37Tcr5jFgNn6wuXjRzpros6oingkX4E8uUhdKgkXzPFqddh5PnF
         nRYFLuqczqWgWPtN97wc+SLUW8rESRrvFKBLqn17hEA08p863LvE2A5j+z4m3Cm/19hJ
         MTS1f9LS4qtqBVkxU1HaRFCFlAlS/4l4n8up5WlAT1kwfZ0I/A4kUcQfuIDtzPVxKsE1
         DqGyolrnTMpIztQwB8//xbYx+K8w7sepY5yRV1u/D8JSDWdqWuZemsLIiarxeUpHNEwk
         oibw==
X-Gm-Message-State: AOAM530cmot16lpLWIrwaDUEJqc7VIZsveR5DQeoKxXnTC/np1qzbK+r
	KhdJ9c4HDo41WoOlT+2tnspVhP8hTus=
X-Google-Smtp-Source: ABdhPJxc2XBzlV3ON3UK2jQAw4NEPwAdpEh6mIQrOe7yVUgNN9GsjbXJSPlJdqjx68UF/LvPXWZgkQ==
X-Received: by 2002:a17:907:2661:: with SMTP id ci1mr4620731ejc.403.1616604614604;
        Wed, 24 Mar 2021 09:50:14 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id s6sm1162761ejx.83.2021.03.24.09.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 09:50:14 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-python2][gatesgarth][PATCH 3/3] python2-target-recipes-blacklist.inc: remove mysql-python, lio-utils, openlmi-tools from meta-oe-packagegroup
Date: Wed, 24 Mar 2021 17:50:10 +0100
Message-Id: <20210324165010.391197-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324165010.391197-1-Martin.Jansa@gmail.com>
References: <20210324165010.391197-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/distro/include/python2-target-recipes-blacklist.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/conf/distro/include/python2-target-recipes-blacklist.inc b/conf/distro/include/python2-target-recipes-blacklist.inc
index f83b28a..abf7f19 100644
--- a/conf/distro/include/python2-target-recipes-blacklist.inc
+++ b/conf/distro/include/python2-target-recipes-blacklist.inc
@@ -314,7 +314,10 @@ PNBLACKLIST[telepathy-python] ?= "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_PY
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

