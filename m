Return-Path: <ticotimo@gmail.com>
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 683757F82A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jan 2020 04:57:13 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id k25so13767833pgt.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 20:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HkSa7mDsK9sllzX3YbTehZrxeWywSsPxOpVlc9i1mzQ=;
	b=F0V2Ux+ob000dgy8dNeETJ6L0soDkSED6GBn8nWXe4/rJMRVTuokxfMfTuQwM/yPZJ
	GdUCB1A25/Qj+h8iaN8yl/cNVz52vrcrfH1xLPvC/pIPKTBcMJrwRYy8s6GZwj7bKGlf
	DV2Ntb/dR3VBSIXZ/5mGUZtyyHOofiK7fvEhSg25YAAWoyCZabLYhP4JJ+1qaJLhVbrM
	bGgfSdA3ptkqjTzXHd4aQ/GJcITNGVdbYal7PV4GT7h90Gy+O6CawwtIs+oucLMz7g52
	us6eQ7nKeOiPqFbsqVKtQPiyi0P9DFd8QCRcYtkDUBmAX8Vx4qptT8zLaegw7ptFhavI
	tTDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HkSa7mDsK9sllzX3YbTehZrxeWywSsPxOpVlc9i1mzQ=;
	b=imFJpHU91re5Ay/uokMQ2iPvXLUhm9Kh4J8V6Cbpjr4XSnPC8DiTCkv275y3Sdcl6w
	I2h1kRfVPwA1JUfY0ufWlVU5LApEnYcdMYDs18EGnc+NR9dwsTzxryd7sSONez+Ls1Kd
	Yj8FiN0QZ0ayJZcQY45Z97wUFR/xgIu112BjuhWYfZw4AEn5MaG4v+I7v8S69G20IgMR
	s6wMRZaniIXOH0G9VgF8x23Xii1pOu2rI18NsiJiqYuMTcFr2Lpxu13o91CypHOAFplV
	9HgS5qeUKtLOsjom9gpGU4s5qE8+XRoGHiwhFoemCZHPfBp3pwik/3/53KfOqYtg6qhw
	jLqg==
X-Gm-Message-State: APjAAAXkhcaKOXbpJP/FHJFB1qPA00T+Tjy7ZZdfWbvn+Mb8uXbAKjvR
	UJQN6fMsOT/NYum11LyBYWMNfMnJDjw=
X-Google-Smtp-Source: APXvYqyA+DS3z0mWihpAS2aVC/pqIYgX4q4/iYYBK1KuL3bSL9hgy/1QaAw8+CjWuIGjZ5cqW97Tgg==
X-Received: by 2002:a63:4282:: with SMTP id
	p124mr51922282pga.155.1579409834169; 
	Sat, 18 Jan 2020 20:57:14 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:b5c2:b07:e8c5:4266])
	by smtp.gmail.com with ESMTPSA id
	c18sm34118982pfr.40.2020.01.18.20.57.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 20:57:13 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Jan 2020 20:55:17 -0800
Message-Id: <20200119045517.2980-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-python2][PATCH] python-mako: mako.utils RDEPENDS on timeit
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
X-List-Received-Date: Sun, 19 Jan 2020 04:57:13 -0000
Content-Transfer-Encoding: 8bit

* Unfortunately, only python-misc provides
  timeit at this time.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 recipes-devtools/python/python-mako_1.1.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-devtools/python/python-mako_1.1.0.bb b/recipes-devtools/python/python-mako_1.1.0.bb
index ce7568aa..f7e6332a 100644
--- a/recipes-devtools/python/python-mako_1.1.0.bb
+++ b/recipes-devtools/python/python-mako_1.1.0.bb
@@ -13,6 +13,7 @@ inherit pypi setuptools
 
 RDEPENDS_${PN} = " \
     ${PYTHON_PN}-html \
+    ${PYTHON_PN}-misc \
     ${PYTHON_PN}-netclient \
     ${PYTHON_PN}-shell \
     ${PYTHON_PN}-threading \
-- 
2.25.0


