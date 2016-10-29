Return-Path: <dachaac@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 363D571A93
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Oct 2016 13:25:39 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id n3so5059222lfn.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Oct 2016 06:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1vTW6DSktoLXTkoO++mJ3pYk+S1Q/JiN3YxsAwQPWzM=;
	b=pTM9cSuJJjvBTSjGcOubG20UWHpaUpUo0JqxRg5N6aReygTSoovbJf7ZPawqAqUj91
	18MSMyBlsWE3ZwtdyZgyeS7C81Hv5JRWVvRdOyOF58WTopujE4LFNvNujKz8vhBJgMyB
	c7fIOEz0c8QHAUr5UMgafywlQo9XD93j6mNIq2FA2F8hv6fWNKnWT/C0dATZaTH24yq2
	8EZyPZM9Qsq8HIBC7cbydCP1Mb/XjYlYdcx/huwNhOH1623bVufA8zslaQYTD5cyIADk
	RcFRWI+DSwcR7zoRLlaXMYGzNPwN07gf6ES4gJEkyJ/HrS42EEFLiHzHr581C+ING2jl
	Amlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1vTW6DSktoLXTkoO++mJ3pYk+S1Q/JiN3YxsAwQPWzM=;
	b=ZEWzifb6GThkLAb/GUSZR5PNfcdOO4XvR7UjjP7ZIxEYpehv4AdX0Mhp9TMPL8i3gE
	Nmk5Id7k4JJU+mQ9/ulXnS3ijdHvs1AkJBxa0QbAXZg8BWRRZ2xr+ToeoXe1ZDQVaYXz
	PNAENe/ZlZJuR+rh51ICv4uwXTsOwq7h/XOkvbA271YAEHVoSdBtojRq1CNFI6KkFs7n
	ioucVgyeVe/PfalkahQTEz6EjnXdYl8DcQUnQ6uIPr3Y6uspDvKO+TsDAIljVlDB4VhM
	TctgH6aOm9sFSq5ifcq2uXllSKq88M7bv8q8bHa918+hrgKvIO5mxdYiN+FDs8TPL02/
	Qgow==
X-Gm-Message-State: ABUngvfl40Lfes8XKS8bpNJceNlUI+yeerPprK+6D46/y4whR5qfzYcHHf2u1IbkhVDbxA==
X-Received: by 10.25.215.34 with SMTP id o34mr11902569lfg.35.1477747540555;
	Sat, 29 Oct 2016 06:25:40 -0700 (PDT)
Received: from localhost.localdomain
	(dtd-fyyj9s1547l4zq--t-3.rev.dnainternet.fi.
	[2001:14ba:80fe:4000:fd7d:738d:a714:6fff])
	by smtp.gmail.com with ESMTPSA id 127sm545173ljf.27.2016.10.29.06.25.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 29 Oct 2016 06:25:39 -0700 (PDT)
From: =?UTF-8?q?Vesa=20J=C3=A4=C3=A4skel=C3=A4inen?= <dachaac@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 29 Oct 2016 16:24:55 +0300
Message-Id: <1477747495-15188-1-git-send-email-dachaac@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-qt5][master][PATCH] Update Qt5's git repositories to match new locations
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
X-List-Received-Date: Sat, 29 Oct 2016 13:25:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Qt5's repositories in github has changed locations.

Qt5 itself and most of its modules are now under:
github.com/qt

Where as qt5-everywhere-demo is under:
github.com/qt-labs

Signed-off-by: Vesa Jääskeläinen <dachaac@gmail.com>
---
 conf/layer.conf                              | 3 ++-
 recipes-qt/examples/qt5everywheredemo_1.0.bb | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index b7207e6..b2a4fbc 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -27,5 +27,6 @@ LICENSE_PATH += "${LAYERDIR}/licenses"
 
 IMAGE_FEATURES[validitems] += "qtcreator-debug"
 
-QT_GIT ?= "git://github.com/qtproject"
+QT_GIT ?= "git://github.com/qt"
+QT_LABS_GIT ?= "git://github.com/qt-labs"
 QT_GIT_PROTOCOL ?= "git"
diff --git a/recipes-qt/examples/qt5everywheredemo_1.0.bb b/recipes-qt/examples/qt5everywheredemo_1.0.bb
index ab2bbd4..7735d90 100644
--- a/recipes-qt/examples/qt5everywheredemo_1.0.bb
+++ b/recipes-qt/examples/qt5everywheredemo_1.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://main.cpp;md5=1187cb795a0f96bce64e63dd1a67dc2b"
 DEPENDS = "qtdeclarative qtgraphicaleffects"
 
 SRCREV = "c17fe9e0ec0882ac4c4dc1168095f569acab5d09"
-SRC_URI = "${QT_GIT}/qt-labs-qt5-everywhere-demo"
+SRC_URI = "${QT_LABS_GIT}/qt-labs-qt5-everywhere-demo"
 
 S = "${WORKDIR}/git/QtDemo"
 
-- 
2.7.4


