Return-Path: <ticotimo@gmail.com>
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
	[209.85.216.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2D7C57D200
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jan 2020 03:40:23 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id a6so5069321pjh.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 19:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=31yL5YEnnJbNGqijyc6DeQXACd+eHXor5XN1W1bBL3Q=;
	b=Yi3AAoJ8Sq5JeK67+asKi6ocBBkffRjr3FVed9pGskYx7hTc02tD0zdewZyHeNMn9/
	RAJY51drdyDei3gnX1MqvzD2AdHUB0xlmNn4luW7Cf1IzkOw0LzJ+zQyxJ9QlcLFi8Cd
	JET5p/maxbIJ2QBmZ4jCoOFpgogtqGWuhMlwg5ketHQ/EOJwIsXTBPn1fkAzvL18DW/3
	MPujEFMA0GECguEkOXTLxSodBHoPieGjc7gpF1EKRT+Fw1D/Z6jkhVOR/IHkGdOMDmId
	ezoZbTVQTkzK229uHZWcSsRvaFfZLstGXMcrhwnPghoSF3x5SSSae+kddLqSD38iQYFT
	jggQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=31yL5YEnnJbNGqijyc6DeQXACd+eHXor5XN1W1bBL3Q=;
	b=c/hIjmcMY5H2H8r1jkKSpvzl2MOuEEA6yunhbj1qU/Zow2M9LqDHDrvL50bLyn3o97
	gOWFbdGx564ZvslShOG1PzeUoTa+B1t6QxP5KXVnnKNNZwxAsUeYedMQS9Q2HuIQiJec
	41fq3trN+e7XmAhMBup5k/pvnYeZwhyWDprm25K9nQQ8WO4AEYoDqLpvPjHZW3pBqoLa
	nvfECcy4tnCi3BNiSdp+LRDIk6JHb2w2zpfILAD7jiAn9r+1CL6QGsOgWw0DKvUb6oGz
	Oha2ArwxRylPVGrMJkdvtcLgv5OyGEPc3ncYERiYIhL6gSUrLYTQzNebLJE0dRT/i3WQ
	Vvog==
X-Gm-Message-State: APjAAAVA8rDfNGZ+kaDa2VEpCh+Gp8p8GnjH7VlxjUjR9LojfsIM83m/
	TqOQCugw0OctVotAglsL2V72u/vjomE=
X-Google-Smtp-Source: APXvYqymM0SDt63wQmgh03WDbO43zVrrxsOGQtGAjjY3qjg2FYzAi4seXbO2YWeOKQtlgXIK3y6/OA==
X-Received: by 2002:a17:902:bf49:: with SMTP id
	u9mr8011081pls.199.1579405224992; 
	Sat, 18 Jan 2020 19:40:24 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:b5c2:b07:e8c5:4266])
	by smtp.gmail.com with ESMTPSA id
	144sm36103788pfc.124.2020.01.18.19.40.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 19:40:24 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Jan 2020 19:35:58 -0800
Message-Id: <20200119033558.20923-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-python2][PATCH] python-slip-dbus: add RDEPENDS
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
X-List-Received-Date: Sun, 19 Jan 2020 03:40:24 -0000
Content-Transfer-Encoding: 8bit

The dependency on python-six as inadvertently missed when
porting to meta-python2.

The original recipe was missing addtional dependencies on
python-dbus, python-pygobject, python-decorator

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 recipes-devtools/python/python-slip-dbus_0.6.5.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/recipes-devtools/python/python-slip-dbus_0.6.5.bb b/recipes-devtools/python/python-slip-dbus_0.6.5.bb
index 99dc9ce5..0c67fa39 100644
--- a/recipes-devtools/python/python-slip-dbus_0.6.5.bb
+++ b/recipes-devtools/python/python-slip-dbus_0.6.5.bb
@@ -28,4 +28,11 @@ do_compile_prepend() {
 # python-native/python: can't open file 'setup.py': [Errno 2] No such file or directory
 CLEANBROKEN = "1"
 
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-dbus \
+    ${PYTHON_PN}-decorator \
+    ${PYTHON_PN}-pygobject \
+    ${PYTHON_PN}-six \
+    "
+
 inherit setuptools
-- 
2.25.0


