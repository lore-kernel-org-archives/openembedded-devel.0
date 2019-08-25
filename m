Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id D87D77D23C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Aug 2019 04:48:12 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id y26so15068249qto.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Aug 2019 21:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=p1j35Lupt9qwhzqdXpHwAtpYf2N755lf9fcox5urxPY=;
	b=ZZBGqj84pIW27OLkOkh0fWDqs5BfBFednjmoEVdz8u5OUZREDOVINWFn8MW9S4NNfA
	VBWu5Af8xIDDF0RGru6UqLmns5gvh49CECrmrz+kkyQO8Z51SYrjD0V1OvygQBKWpr9Y
	If0+BmvVCMkUyYbvMkgODOmgpHT4GPWzpZeqiYeP2IfwYOe65g1XQccxO0fUWakGXYMW
	eReQbMpOZeUudGqWn5Q9jVyj4XrxnsElYZxlLm7J+p8SIP+yp+7TSKq2ZN/nvKOYDmqI
	DUM/pUAjl4cKcTBbPUj3uTgJRqoBN26I9fn9AmZjSRWxx29RUTo5Ret3+1ibigFNA2zY
	U+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=p1j35Lupt9qwhzqdXpHwAtpYf2N755lf9fcox5urxPY=;
	b=LxXgGoMgjRp46CO9tbovun4De7citGZ8T/poJhaUh3DPGvYvbPojUv7gi2OINlJeTn
	uQE+ck+ORztz+esRFbk5h1bn0qCOVWfRvBCxUjRgsyJstqIfPor/dMRJmk5iLumVybfK
	fMs5zUC6fCMoUuMG1+AbwYdy+hkzEVyi6OMhE4JQZcWCFLZHOLCiAOuYZ07S6fCxxXzj
	Ars+EjffFIEeLKuL7wtxOVmFfgsPohCu8Abgm5nYQoRMCKoOLOLC8NJvylkeQi13Xyj/
	O57yzvOUNO0n+uN41JR1K+Siuf/r7NnzWPBisRoqQZqCB9SXuKHs30vzU9mkHPOXok28
	5fUQ==
X-Gm-Message-State: APjAAAW2/ZJgNYx+KbO1CrMCYz/9gu1f1G+9U+ohAo0sZ9fnVnDOYEic
	9SmvnFzieFmTlZgWnXN3/7TVsQbK2VvHaw==
X-Google-Smtp-Source: APXvYqxkdw93jYcGQgsDiY9OiL4jd+P5m0scbXs7sW1nDmYh+TpQHhmzp/ki35y/q8uK78mdDg3qrw==
X-Received: by 2002:a05:6214:136b:: with SMTP id
	c11mr10368246qvw.5.1566708493379; 
	Sat, 24 Aug 2019 21:48:13 -0700 (PDT)
Received: from mbedesk.Sonatest.net
	(ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca.
	[174.94.156.236]) by smtp.gmail.com with ESMTPSA id
	m38sm5130609qta.43.2019.08.24.21.48.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 24 Aug 2019 21:48:12 -0700 (PDT)
From: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Aug 2019 00:47:52 -0400
Message-Id: <20190825044752.9639-1-maxime.roussinbelanger@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][thud][PATCH v2] libedit: Add native and nativesdk to BBCLASSEXTEND
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
X-List-Received-Date: Sun, 25 Aug 2019 04:48:13 -0000
Content-Transfer-Encoding: 8bit

To keep support of meta-clang support on thud branch.
It depends on libedit and need it when building SDK
---
Changes in v2:
	- Add missing meta-oe in subject

meta-oe/recipes-devtools/libedit/libedit_20180525-3.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/libedit/libedit_20180525-3.1.bb b/meta-oe/recipes-devtools/libedit/libedit_20180525-3.1.bb
index 8cc0e959e0..60f4f5a22b 100644
--- a/meta-oe/recipes-devtools/libedit/libedit_20180525-3.1.bb
+++ b/meta-oe/recipes-devtools/libedit/libedit_20180525-3.1.bb
@@ -19,3 +19,5 @@ SRC_URI[md5sum] = "97679319742f45d6cdcd6075511b14ac"
 SRC_URI[sha256sum] = "c41bea8fd140fb57ba67a98ec1d8ae0b8ffa82f4aba9c35a87e5a9499e653116"
 
 S = "${WORKDIR}/${BPN}-${PV}"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


