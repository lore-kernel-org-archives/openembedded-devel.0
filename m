Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f52.google.com (mail-pg0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id B034978864
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jan 2018 03:24:44 +0000 (UTC)
Received: by mail-pg0-f52.google.com with SMTP id o13so1378606pgs.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 19:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=wCr3hRuQjUz/rEPK3cXm+lb01Ls+ThmuRrDA2B+u9L4=;
	b=Fu3XRVh2q90epvCylscGTLyvycrnZjTESaO8rWi43lzbxRJfi+gE9fUPIqdX41Ir9w
	WneDW15/OVJH+QqlHEgs2BioKGcGkDBW97QygYZoVj4XjerqG3UMDleNsfYN8ZkQDT/6
	Q85Mvvsg9cedKRu3MTIBVDPRL1ELTbYAi979/ut8mwTBCZd1eAgTNiKabs/PzFGe8oyB
	tmoKmakJP4aNrAr9ms6gk9g31vmPte1y0+uamlowNKjvq5CiUiRjkG2E2sB0OLEs3Itr
	v7A/kPVg1F5pI+rt/k/S9Dr0d0G0XFIz7j6w/h/7NFkG4agD6c45/3gAAO9JnmHMarCa
	JsJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=wCr3hRuQjUz/rEPK3cXm+lb01Ls+ThmuRrDA2B+u9L4=;
	b=nT4s9PjZIMlCFUAvYMsVX/yEtty743L/EBlkNc0gxvkSr3agPGY0blX+mLX8J6Skjo
	WCPY5jpt1bJAH9KHMgEG+vIC7VuFJ9LnzqKASsj9ImiZFoW4lBg4uxCDtqvzQjOPQUQT
	mN4iLftvwhxGBR237Gs5VcoFmfi8k/I38fTPMLl1JntN7QbfR24ShwWih1CQRqBMQduF
	H1AoqhZuaHmCyggPKqhBMpYFz9OJo4VMb4PT1LgrK+Jr0cGmCDZ/w/MSeafU8I6rGzrG
	swqd0DpcG0ZfkhHYZncn6EuieOEHe547m6M7x+CsLlF7a9nmWMJMxir5HQViEEE0TYTw
	cwJg==
X-Gm-Message-State: AKwxytfuH4uEcUTqn0Ce+rzsODRsGc7ohE5ZTULT6uq5I6K4BqeulwPN
	iFuTZ+bh8vy0zSApPnmTmaWrSA==
X-Google-Smtp-Source: AH8x226AlXMoj/JJeMMfLVaHdFeGMP13WCEz3u8a0Hi+2y5xjVaEoaVv7oKuzp4Oyl08UdvzUrfokA==
X-Received: by 10.98.144.213 with SMTP id q82mr20892026pfk.59.1517023486053;
	Fri, 26 Jan 2018 19:24:46 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:2999:2a82:b9b6:e74c])
	by smtp.gmail.com with ESMTPSA id
	v22sm6692206pfa.158.2018.01.26.19.24.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Jan 2018 19:24:45 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jan 2018 19:24:05 -0800
Message-Id: <7d1925f4f7e592a115ecdd23a11a1e2f5653f8b6.1517023286.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1517023286.git.akuster808@gmail.com>
References: <cover.1517023286.git.akuster808@gmail.com>
Subject: [PATCH 05/36] samba: add missing RDEPENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 27 Jan 2018 03:24:45 -0000

From: Jackie Huang <jackie.huang@windriver.com>

* samba-tool requires the python modules from samba-python
  or it fails with:

  Traceback (most recent call last):
    File "/usr/bin/samba-tool", line 33, in <module>
      from samba.netcmd.main import cmd_sambatool
  ImportError: No module named samba.netcmd.main

* Provisioning with samba-tool requires samba-dsdb-modules
  or it fails with:

  Setting up secrets.ldb
  ldb: unable to stat module /usr/lib64/samba/ldb : No such file or directory
  WARNING: Module [samba_secrets] not found - do you need to set LDB_MODULES_PATH?
  Unable to load modules for /var/lib/samba/private/secrets.ldb: (null)
  ERROR(ldb): uncaught exception - None

* samba-python requires pytalloc and python-tdb or it fails with:

  TypeError: pytalloc: unable to get talloc.BaseObject type
  ERROR(<type 'exceptions.ImportError'>): uncaught exception - No module named tdb

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 9245c2a7ec30ba5df6826acd91d7a76d7f51d017)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.6.7.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb b/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb
index 59d7425..2b227c9 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb
@@ -186,7 +186,8 @@ python samba_populate_packages() {
 
 PACKAGESPLITFUNCS_prepend = "samba_populate_packages "
 
-RDEPENDS_${PN} += "${PN}-base"
+RDEPENDS_${PN} += "${PN}-base ${PN}-python ${PN}-dsdb-modules"
+RDEPENDS_${PN}-python += "pytalloc python-tdb"
 
 FILES_${PN}-base = "${sbindir}/nmbd \
                     ${sbindir}/smbd \
-- 
2.7.4


