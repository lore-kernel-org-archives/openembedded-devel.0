Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5948271ABB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 18:20:43 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id n204so218656843qke.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 10:20:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kR6B5zx6B1QOV3nX81rKaRI4MAxsJheue9MFjmTyktE=;
	b=UAonRBv/Jf5FuXNHJW+GG1QJ/BrYbxyxsYoZGX2N/kGYYXUBaTRDV9G2Mu/lCfU5mA
	XHq8fbqQ+BdqE+veZj2i+zOP0sO+LvFT86jWYnvMuVGTUURIPdNg/Qw/vPud9iN/xNFK
	0xUdJlX75mJ1g9nIB4g90EM/E7W7uZ2t1hT3A2l+a8UlcUCPLDFz8x6Ml65qAVUlr8DM
	OvmT8S/pcZBfu5tkgbtlHcRUVgzhmx1wWMrz5OmmBNtI6ZjmyHznH5iJtP56H849C1Eo
	L9J8iykOLi3DxPRcnMH8SpcauyOkZSNrwZk0Ld/B6w5rntcNeP/8lOb+o6T2gdxn0No+
	gE/g==
X-Gm-Message-State: AKaTC00GKJGDyQ4T2Qoyj5+iauwXlV7uj0fKNTdUV6wg6t3C6Qaqk1HH7695gIbNzvFEDg==
X-Received: by 10.55.89.197 with SMTP id n188mr33749733qkb.217.1480530044656; 
	Wed, 30 Nov 2016 10:20:44 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	g13sm34038879qtg.15.2016.11.30.10.20.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 Nov 2016 10:20:44 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2016 13:20:36 -0500
Message-Id: <1480530036-2109-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-enum34: add native and nativesdk
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
X-List-Received-Date: Wed, 30 Nov 2016 18:20:46 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-enum34_1.1.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-enum34_1.1.6.bb b/meta-python/recipes-devtools/python/python-enum34_1.1.6.bb
index e9d075f..31d2147 100644
--- a/meta-python/recipes-devtools/python/python-enum34_1.1.6.bb
+++ b/meta-python/recipes-devtools/python/python-enum34_1.1.6.bb
@@ -6,3 +6,5 @@ SRC_URI[md5sum] = "5f13a0841a61f7fc295c514490d120d0"
 SRC_URI[sha256sum] = "8ad8c4783bf61ded74527bffb48ed9b54166685e4230386a9ed9b1279e2df5b1"
 
 inherit pypi setuptools
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


