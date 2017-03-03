Return-Path: <kingcako@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 050FF7767A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Mar 2017 23:52:04 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id 68so3977403itg.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Mar 2017 15:52:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fheNtXYTGtPx/eRTfRrkabSaWyzEtodxfQbP0NMH194=;
	b=EVi8WedaKwAlgtDhqMcBbS0gOMujJRfkzLoNqvvd+iYO9dltsPIc8qrDhoiY2Efta7
	AoPm5Y7XxGFrG0RDR70ATBmSJ58+y5xLspsuu292UePfy4uRm/qfytM+Wnvr6nxByzls
	ZsjYZA7p0mdT09pr60Ix7h5t85N36hyzIPvCVb7ZuhfmWNx6jtW0Iv5K8WeMTN+R6SVu
	bX6Qk8nbhBh3OpSeTT/ddITIa0SNkKRPC54Rug0lz6kyQCNRcIf8LyclamZVJU/u2LMu
	evv/JFC2KOb/WI9gITCQSlxE4wxlT2XJWXScRC20lgzxMFGDA2uBfVIv2IDo+L0OKdoD
	hHFw==
X-Gm-Message-State: AMke39noitmIY29P2Ta5pC1HLle9ZjkgZHbLSuk0X5AEMLsS5WCUkFBFCnEv00Lm+yyYzg==
X-Received: by 10.36.213.196 with SMTP id a187mr5690497itg.4.1488585125882;
	Fri, 03 Mar 2017 15:52:05 -0800 (PST)
Received: from zener.lan (50-250-129-172-static.hfc.comcastbusiness.net.
	[50.250.129.172]) by smtp.gmail.com with ESMTPSA id
	m100sm5220493iod.14.2017.03.03.15.52.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 03 Mar 2017 15:52:05 -0800 (PST)
From: David Cako <dc@cako.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Mar 2017 16:52:03 -0700
Message-Id: <1488585123-46482-1-git-send-email-dc@cako.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] increment pyyaml setup.py version number
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
X-List-Received-Date: Fri, 03 Mar 2017 23:52:06 -0000

I was getting dependency issues on my target machine due to an incorrect version number in setup.py.

---
 meta-python/recipes-devtools/python/python-pyyaml/setup.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-pyyaml/setup.py b/meta-python/recipes-devtools/python/python-pyyaml/setup.py
index 2ed1c94..50318d5 100644
--- a/meta-python/recipes-devtools/python/python-pyyaml/setup.py
+++ b/meta-python/recipes-devtools/python/python-pyyaml/setup.py
@@ -1,5 +1,5 @@
 NAME = 'PyYAML'
-VERSION = '3.10'
+VERSION = '3.12'
 DESCRIPTION = "YAML parser and emitter for Python"
 LONG_DESCRIPTION = """\
 YAML is a data serialization format designed for human readability and
-- 
2.7.4


