Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 528CB74AD8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 14:39:17 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id f21-v6so2544730iob.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 07:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=iGQaRRVhXntOi3i6Pk3NrKp1WjhkAGr5eWIBj0qqb94=;
	b=ad+z3qQwWCjEbB8kzeQpSWzfkS5R9+bMw5ImOAWt6UqSnVgQ2/YE3JeA/7HmrAu5bU
	gs1c1hd1vuuZuvk+lCwRUicePMt5/Oz5N5b4sBdFP8PZOqglb4huSG/7mrtGe8GI9ccM
	X7STLACIhR7HebQVuhtnBI4owlHGREBz7i1P1zv+Ko13cOYXv1kSNq10Qo5ZhXJ1Y/Lb
	08oLsw11lV50GKZAdN820qwhHH+8nHpaslVMY6PSfFbyjgxDnx0o0O95kjSVFGwiH5uw
	/ZScR/Z0pnYx9g2LQNwe09Iduq0Uxkejmn+/k04vdM5xSwRaPzwmkULkTTpMtg66r8Rg
	y1eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=iGQaRRVhXntOi3i6Pk3NrKp1WjhkAGr5eWIBj0qqb94=;
	b=GBG7NgcT1CKPCy3MJ8W30llG5h0LLt5vAhTvAeeKfgprYPnpM0Vi/H1i2MlcHiYNlt
	VviWWZ0TLDvLi0VH6g7kDfwmA4pS6nj9U6Nnip02DesloQFWTilWuzc2GYEFulENWIRl
	+bUcpZkpUTkiO4nDOKXerJ83F3SGiBNzkDCJMajJYYJ+ubWJuImyTxspJBtTR60lHxZo
	lzTM9Mx2sQcTIpohshoag6ip6cLxKh9f3MIg6Mbw0YNtiIx1q87fU4U5ctPwJA0tnR1b
	Urk8+4jGb9GCYh5pTeL5I4y1XPCSO77onBk0m1Zis/5m7GbKCWBOFE8icQBO+nszfKEz
	cCmQ==
X-Gm-Message-State: ALKqPwdzK50TnMmu7XFvq5B6YJiUuP0LPiutdtVAvOvBIo/5n78M7JDo
	NBOeSAe+8MuLPlN2966SK54AsWIr
X-Google-Smtp-Source: ADUXVKIYWePt3ZmFkvJSmGW7vDyUkqJcwJh/cRr/3cp0TkKCTDBn0pFfgTqOzMPY585HuwtanaRoww==
X-Received: by 2002:a6b:3c3:: with SMTP id
	e64-v6mr1334407ioi.297.1527172757892; 
	Thu, 24 May 2018 07:39:17 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	a43-v6sm2435261itj.11.2018.05.24.07.39.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 May 2018 07:39:16 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 May 2018 10:38:44 -0400
Message-Id: <20180524143854.24096-8-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.582.gccdcbd54c
In-Reply-To: <20180524143854.24096-1-twoerner@gmail.com>
References: <20180524143854.24096-1-twoerner@gmail.com>
Subject: [meta-oe][master-next][PATCH v3 07/17] rapidjson: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Thu, 24 May 2018 14:39:17 -0000

The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
${datadir}/cmake end up in the dev package, so recipes no longer need to
provide custom packaging rules to handles these files.

	http://git.openembedded.org/openembedded-core/commit/?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93

Originally-conceived-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
index 8ab35d224b..069385d5b0 100644
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
+++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
@@ -20,7 +20,6 @@ EXTRA_OECMAKE += "-DRAPIDJSON_BUILD_DOC=OFF -DRAPIDJSON_BUILD_TESTS=OFF -DRAPIDJ
 
 # RapidJSON is a header-only C++ library, so the main package will be empty.
 
-FILES_${PN}-dev += "${libdir}/cmake"
 RDEPENDS_${PN}-dev = ""
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.0.582.gccdcbd54c


