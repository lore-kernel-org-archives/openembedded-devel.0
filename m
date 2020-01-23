Return-Path: <ticotimo@gmail.com>
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 0E56A7ED76
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 14:43:15 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id t6so1443030plj.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 06:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5ymlJtrDzoFSv1woaIhFi4bPp4+9crEsa0PSldhkrQI=;
	b=XPxTf76ty38rP/xDiRJJ8LREjhgC4Taa+CUyxE6KbIPGFMFAI1o37ntXwTBws8U+p+
	aYdTGZtHAOPl98pi1k4bQ3YolSMFCDrlLKIv8tdrkZT63p7iWu6PvX3IvS0DaSZUgJJh
	SEnnuZ469c+Wa+cweufjQoNv7HtbHEfnXSExzohWgtD7sScRwrPL+eVKU5eXP23iklkk
	a0EF8TyRQL/fTtmbAkF/4iclyqdvyrKJyW3dN1lJdpqQiyYF1Gzj4A0ZT21v9s/di/eb
	fK6xw6KPZjvzAo5wuG/J6rs/HcRbCLGJ31h0KbaFW5EBOdfcaGNj3by1ZSdpnfTtJo0t
	GJyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5ymlJtrDzoFSv1woaIhFi4bPp4+9crEsa0PSldhkrQI=;
	b=sar27V2C6r6LiIWoHJtPz7jAvlTMlauEQY4En0fbietH4fELIdu/7tizN0QhyZIjSx
	mXgzBp4BU+8bMJH6BCLEufHMnFr/Yf94lAIYThkbdubn1r7MEjIXZLo1eIA2wN+HeXBE
	P2DUM+bw4+UFwj5pHbhuL0lVM3KY/2ToxjW/mJebDxHwG49R9e233oynnwWUGHWx8AVS
	dLXNovgxfg9sDNp1tky5s9CZalDTDOkySjW5VENYLCM1gPE1nvmkN2Wgl1pC8Sw0VOkf
	EBxb2rJnaPLlq3xff006wSxbSBgYISUe3RUa2CePwCY1mM9a0wWsLKvI0h81L+KE/07v
	sZOw==
X-Gm-Message-State: APjAAAV8OwaD4PVhTcoWfQGXbLXMK9dYiwnyE/tAkHgak1u3wctbpgPL
	T4c+Bm6UXdlVhW9YaBMlwftbj4U6iSs=
X-Google-Smtp-Source: APXvYqysLRwgTsX9WDXq/I/AG43ACrph2YEiaW2Dp+eoBxSDp7e2YHzk1R+MR9rZuzzp5+QWjzKyIQ==
X-Received: by 2002:a17:90a:30e8:: with SMTP id
	h95mr5016468pjb.30.1579790596924; 
	Thu, 23 Jan 2020 06:43:16 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:982e:71f9:9a69:ecbf])
	by smtp.gmail.com with ESMTPSA id s7sm3479009pjk.22.2020.01.23.06.43.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 23 Jan 2020 06:43:16 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Jan 2020 06:42:55 -0800
Message-Id: <20200123144255.960-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-python2][PATCH] python-pygobject: add missing target RDEPENDS
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
X-List-Received-Date: Thu, 23 Jan 2020 14:43:16 -0000
Content-Transfer-Encoding: 8bit

* Missing run-time dependency:
  - python-io (StringIO)

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 recipes-devtools/python/python-pygobject_3.34.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-devtools/python/python-pygobject_3.34.0.bb b/recipes-devtools/python/python-pygobject_3.34.0.bb
index 287846d9..2fd0b513 100644
--- a/recipes-devtools/python/python-pygobject_3.34.0.bb
+++ b/recipes-devtools/python/python-pygobject_3.34.0.bb
@@ -31,7 +31,7 @@ PACKAGECONFIG[tests] = "-Dtests=true, -Dtests=false, , "
 PACKAGECONFIG[stagedir] = "-Dstagedir=${PYTHON_SITEPACKAGES_DIR}, -Dstagedir="", , "
 
 BBCLASSEXTEND = "native"
-RDEPENDS_${PN} = "python-pkgutil"
+RDEPENDS_${PN} = "python-io python-pkgutil"
 RDEPENDS_${PN}_class-native = ""
 
 do_install_append() {
-- 
2.25.0


