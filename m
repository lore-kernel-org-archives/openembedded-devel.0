Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 23D3178062
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Dec 2017 15:36:34 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id o126so37596060qke.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Dec 2017 07:36:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gEe72owJKtkVBeZbPr6Ef/qw/k+ZXsf8VpsEL9bC5no=;
	b=gt6jJ34YZOjqRZBaMJqDt/NFrXiYjHqNn2ERGgUTw+FSVK6HXQM0brbtg6WkwtoR7J
	obzeXttLoHWVzNdH2KP6uloi5b6v8Cf51JVUZDRjcOC487lOIRbX/SXuVaYv35TEebjF
	mGMQVcFCeRmXL/gQltZlW1oS5Lru9jZy9M2gO0xjPo6fkLd8CPzib2qDSdeSQv0P2qyz
	AtnmimWXwjIkx/cu0BdzvG0xekwHyxdWjiPOab2CHgetW+GSQGynnu0b8Fs9+DY4j7z+
	REx4d9rk9Qs4cT5qKc8IYZ03D6KnOUSDQZXq6ovxnQhMq+DCwRUwjV2B0M032rvUs4+D
	KnsQ==
X-Gm-Message-State: AKGB3mIRk4OM6w7JINjvSoqyvszCHEriZ6OC0BmIDHiHuUj3SjmROb7B
	bAJlBM+McLErWrAkHVoPstNmvVs9
X-Google-Smtp-Source: ACJfBouSay6edrB7awrUL9IPOPDm2knwoApb/MJielPPszM2/97Mnz66K8OpbrZIrMUSAkEzAgfCFQ==
X-Received: by 10.55.189.2 with SMTP id n2mr18083905qkf.155.1514475395648;
	Thu, 28 Dec 2017 07:36:35 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	s4sm22283392qkd.66.2017.12.28.07.36.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 28 Dec 2017 07:36:34 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Dec 2017 10:36:13 -0500
Message-Id: <1514475373-23802-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pandas: add json to the RDEPENDS list
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
X-List-Received-Date: Thu, 28 Dec 2017 15:36:35 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pandas.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python-pandas.inc b/meta-python/recipes-devtools/python/python-pandas.inc
index 266f8b7..8129fd0 100644
--- a/meta-python/recipes-devtools/python/python-pandas.inc
+++ b/meta-python/recipes-devtools/python/python-pandas.inc
@@ -16,6 +16,7 @@ DEPENDS += " \
 "
 
 RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-json \
     ${PYTHON_PN}-numpy \
     ${PYTHON_PN}-dateutil \
     ${PYTHON_PN}-pytz \
-- 
2.7.4


