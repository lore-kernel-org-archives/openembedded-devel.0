Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5D5547F82D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2019 22:58:23 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id q22so2337934pgk.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Nov 2019 14:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sTyGZmRKiRAc6yx23bZyn5aSTZGwhq7QQ8V+anG+TUI=;
	b=lbqcD6p8CeprZLHDlZdo3P7DeukKNMKaBbId8L/xaAw4SSswIfj4Eme1zoOw7AJCgX
	dPp7MRcndGqEF6CO++KEzNw5dJyhxRYiUOh+dE4IwzYZwBZOt92CgBZBfu/Qp6aK5jbl
	7qnUPskRVPZ5pu/QeMVoj2lkMKpBOPewCWWT+Ju41T5qsI5ON1G7fgpwagBFpr9Ty/4i
	ek739iF0Ac7O3A8FC1nh+TgATMvFNZLSTEmdFk71NRguEfYXbglvRHNwjPRmhfNBfNAa
	+clJJ9CfcKeNfRbeI83KH+w6osYG5fTGxJ9dm5trrIBKuTaOCFEW/GNlnf4oxEa1B+ua
	SXdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sTyGZmRKiRAc6yx23bZyn5aSTZGwhq7QQ8V+anG+TUI=;
	b=XY3nrc69ISpPhLLEsZayjRdkmYkfyBY+8peAgths/SQqZryNcStcB7Ci+eE23ra9FB
	ayc0XgVdHsQB+NHdMjica8JEYl7iti6wYgLWps3aS8K/MbX7lNiGnD25o5Tck90ybgC4
	ZEf9ISYErrUzu1oS54OHhxJOmKm5CnQqg8HqMxGoHI6nXSOFSHX0QNBc5vswZcB2p4Nc
	5wk340MPCup6Ahri6JXr8UT3i8jgP1lQz00mnyhNm4CIca/3kwKPgcEGCXsLm2SYLBPR
	kBaPTqUm1PjyHFjFIP7Wny9hhPEKgZ1fMPUI+rh34mX0A3+CN4u8EwQzrCZLX7w28TmY
	ZIYQ==
X-Gm-Message-State: APjAAAXCzd/fFEtPg6eeq8tjIhIxXc2cjKxMJHum0vq3LyS4giXjaNzb
	ZrFaCeOXacf5IGw8zYK9ss14pFgcEwY=
X-Google-Smtp-Source: APXvYqySTAja9fRgVKGgP0/haxvya7zI9BD92jGw60HKIcGRUxOVSXCPUEV/6QILwOke7f82Q5gCSQ==
X-Received: by 2002:a63:f441:: with SMTP id p1mr6458369pgk.362.1573685904034; 
	Wed, 13 Nov 2019 14:58:24 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::30e8])
	by smtp.gmail.com with ESMTPSA id l93sm3557301pjb.6.2019.11.13.14.58.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 13 Nov 2019 14:58:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Nov 2019 14:58:10 -0800
Message-Id: <20191113225811.1535-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-webserver][PATCH] layer.conf: Add phpmyadmin->php dep to SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS
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
X-List-Received-Date: Wed, 13 Nov 2019 22:58:24 -0000
Content-Transfer-Encoding: 8bit

phpmyadmin rdeps on php-cli but we can ignore signatures for the deps

ERROR: phpmyadmin different signature for task do_package_write_ipk.sigdata
Hash for dependent task php/php_7.3.11.bb:do_packagedata changed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-webserver/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-webserver/conf/layer.conf b/meta-webserver/conf/layer.conf
index 6157d4d304..2c6fad4ac6 100644
--- a/meta-webserver/conf/layer.conf
+++ b/meta-webserver/conf/layer.conf
@@ -23,4 +23,5 @@ LICENSE_PATH += "${LAYERDIR}/licenses"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   phpmyadmin->bash \
+  phpmyadmin->php \
 "
-- 
2.24.0


