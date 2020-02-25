Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4F041616C8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 19:07:41 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id j7so3582633wrp.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 11:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ShHyCKQpyL27KKBg8OnMJykwzmchA9TwaF3d0GTMCpA=;
	b=Aj31I3UXIieWklvMH7FjaAxwcz+eSixVoH3x7b5oPXRpr/zMJcTMYnmbZHwneXegYk
	3JOdQrsaQlJf6NEcmGezb1cfiHN20k1zMrF4mu/w5qxc2K9MGnOEFVclsbPfzTyiHPvL
	j8VYUuFlxWwZZpGw2pze0SHheQAMM+Ke5TC8l3kxuAbdkfNLdmlmv6r4Pl8/HmCVyuPK
	M9O6ev7fqzoRKsh+nHePS30bypWbKLIgQfEVQQDw4KneRZEAEJPekT6iWsErHN2cGFuu
	ahU7wUlbc99hs/zd56HLYuSsUYDiPASdGR4tJ2cc/kU69gwfZQEb2TPgeB8yKhYpKCds
	hPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ShHyCKQpyL27KKBg8OnMJykwzmchA9TwaF3d0GTMCpA=;
	b=Fm05Gcnr4TayzKpLtRKTGFYlZQVCHNVFcCPeUED2HC7urYPkUHStCJQc0mOWY/QUKu
	HeByNZ6/AFsbF/MVBDv9hRD4t39cRgc11dmE/8fr4YluNFvvwKc/0WttUJS6e+yydw7+
	wtVDZy6Grl0on3YyC4RYor2K69hkHisLdPurXz2dORukarcKVVXu4sQpLlu8AermAaq6
	OthG5PPPBY6SFmEkT1fW2hwvzdv0ul8ECUzAX+D/M8zqXOOr71Oy5qmSYfe9Ws7pxNX4
	+MKofG70RzG5AC1RK8oqpl0YVjnn4n5DeIljg5Da0giuWGf9205pRxDLwffUaqcSveK6
	0dSw==
X-Gm-Message-State: APjAAAXf2JLTIU8zhW7KMHhvNWeUW+kGYfEBgMQcCE74IwZClDsh4wgg
	OqbTIhQXQKF8RVg3R8i2UlQZgEwr
X-Google-Smtp-Source: APXvYqxkCutL8wX4xNqk/7wB97/iXOXXPhuklS2mNYl5f4fluBPCgco4JsOIjA1JaJ7xiwwYWsbnzQ==
X-Received: by 2002:adf:f491:: with SMTP id l17mr621716wro.149.1582657661815; 
	Tue, 25 Feb 2020 11:07:41 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	z6sm25238705wrw.36.2020.02.25.11.07.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 25 Feb 2020 11:07:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Feb 2020 20:07:38 +0100
Message-Id: <20200225190739.4056-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-python2][PATCH 1/2] python-ldap: skip when meta-networking isn't included
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
X-List-Received-Date: Tue, 25 Feb 2020 19:07:41 -0000
Content-Transfer-Encoding: 8bit

* fixes:
  ERROR: Nothing PROVIDES 'cyrus-sasl' (but meta-python2/recipes-devtools/python/python-ldap_3.2.0.bb DEPENDS on or otherwise requires it)
  in world builds without meta-networking

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-devtools/python/python-ldap_3.2.0.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/recipes-devtools/python/python-ldap_3.2.0.bb b/recipes-devtools/python/python-ldap_3.2.0.bb
index af8961e..8e43dee 100644
--- a/recipes-devtools/python/python-ldap_3.2.0.bb
+++ b/recipes-devtools/python/python-ldap_3.2.0.bb
@@ -23,9 +23,15 @@ do_configure_prepend() {
     sed -i -e 's:^include_dirs =.*:include_dirs = =/usr/include/sasl/:' setup.cfg
 }
 
+
 RDEPENDS_${PN} = " \
     ${PYTHON_PN}-pprint \
     ${PYTHON_PN}-threading \
     ${PYTHON_PN}-pyasn1 \
     ${PYTHON_PN}-pyasn1-modules \
 "
+
+python() {
+    if 'networking-layer' not in d.getVar('BBFILE_COLLECTIONS').split():
+        raise bb.parse.SkipRecipe('Requires networking-layer to be present to provide cyrus-sasl.')
+}
-- 
2.20.1


