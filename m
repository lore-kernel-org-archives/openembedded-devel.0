Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id CC63E76036
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2018 13:57:14 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id c126-v6so2816856qkd.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2018 06:57:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HvmygtD9kJWN/QAXhzcWEjcXUVia8j3hAwUzTF7EMuQ=;
	b=Lli6rZ/4wetZoPRjcLFXGupRFJtL4DZv7JL9AFjxlNXcpPTPjqOgTku4Ryg7Gv2jLn
	MbSdC9kZiMzIm77fzfsWO9QBMWZu0rqlutrjk5HSIf6MIyHbb+5Qy4zIvenPKg2Cv7fz
	pohyd5FnNjomkRV3Q64Fl1JT4LcvLgJ2qFjBTwruLsJLZ8Vzz9BJRDBYZu5rLkv1J/y0
	H8SKeKAI1JVHKcz5TpN11CeC/psVWi2+3+Vc++RFrDA+0yNO/0o1AfAi+RZ5MlQDGmou
	YNnmRy+DUVsFTIs8dZ9YG+8sx52AejG7lbI1RW6EE3XGBlSiNljKubJjRaJp8ozgY5oj
	XzyA==
X-Gm-Message-State: AOUpUlH3P31TeyDSjsEGL//ScTQl4ilc78ZfeA3+nFq6DJcygFUqyZ9J
	iK/fEX2Wx3c6/jo1Vae8BilZ9nXr
X-Google-Smtp-Source: AAOMgpcVhtPujcghXGlvQ/VfykKBGIO8xQtifisOSrn0nsIigU6JXWZQkBb3nrjm17S0LNdIOEHvJA==
X-Received: by 2002:a37:9904:: with SMTP id
	b4-v6mr5600091qke.102.1531231035413; 
	Tue, 10 Jul 2018 06:57:15 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	w4-v6sm3684716qtb.22.2018.07.10.06.57.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Jul 2018 06:57:14 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Jul 2018 09:56:59 -0400
Message-Id: <1531231019-16708-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-vobject: update to version 0.9.6
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
X-List-Received-Date: Tue, 10 Jul 2018 13:57:15 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-vobject_0.9.5.bb => python-vobject_0.9.6.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-vobject_0.9.5.bb => python-vobject_0.9.6.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python-vobject_0.9.5.bb b/meta-python/recipes-devtools/python/python-vobject_0.9.6.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python-vobject_0.9.5.bb
rename to meta-python/recipes-devtools/python/python-vobject_0.9.6.bb
index d2f343e..d92c137 100644
--- a/meta-python/recipes-devtools/python/python-vobject_0.9.5.bb
+++ b/meta-python/recipes-devtools/python/python-vobject_0.9.6.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "http://vobject.skyhouseconsulting.com/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[md5sum] = "aa629d6ae95db5edfd5b2402eb1073cb"
-SRC_URI[sha256sum] = "0f56cae196303d875682b9648b4bb43ffc769d2f0f800958e0a506af867b1243"
+SRC_URI[md5sum] = "1da0747914fe440329c0b37e4be9040d"
+SRC_URI[sha256sum] = "cd9ede4363f83c06ba8d8f1541c736efa5c46f9a431430002b2f84f4f4e674d8"
 
 inherit pypi setuptools
 
-- 
2.7.4


