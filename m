Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4A5357F32E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2019 09:16:01 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id b16so16588170wrq.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Sep 2019 02:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=67HVEH/7hxICWJ7BxWiYwF3qSksEYQeGjdmvJKh1PQY=;
	b=DRV9uWeuJBCPNW0o0iKMcmeKh21A10MuFh3GQF7Ne0HsuAIAltmNOFIppkemW9bpwk
	X6TBEcUBrNFv4Ntf/ldUNYe6AU6tpx9O+ep8g8B4WW6pZlVWZQTQ3HFUDaRW+Okp09Qu
	uOY1Pk5/Kb2cAh/dDvHEXtjCx+YnEFVaLZNtIAt5BbWtkmHO+LcZxkAjWRDfqqCJsbHr
	e6bB47GlzCVpZvi4x1ax/29AwNlI/xgFeeEeJ1Z/YWf7HLRfIPo/gps4sBALokOJK3nP
	UL2a1lNdsB6lu069VHmXje0/EmOkmlHV4se2QJz7iGUUmaae6MJvaKmjmwGIOYO/wH2K
	vaZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=67HVEH/7hxICWJ7BxWiYwF3qSksEYQeGjdmvJKh1PQY=;
	b=D/3rkh5aRoBHh/6+OOxjfvFVNdzVOYq+besRjlgIhkBRS19eNUHSERGSFxIy5SeZ6X
	xqWAlqcdthzsP18LhmS+4BYouulWTuZUsYmHO7OVGse30zfUmwVgzQMOhVVnsx+RsUN+
	qtgFbC8i0FN5bEhT9eD0kRV3UIkxfopQkTlHqLcBQbTJiXPnvGWB/0yyTv/3CqWH52RX
	6ASyQe9W6lSp53iOESqIUxilLzdTgD333etETeiVQwyrPp5n74Gy/O6zNFhCxlTYXMeG
	Tue0PRv/d7C1YwUZekPSv0l6LpLUQ5YxSVQ6VVOWjknB7ew+4rbY6MH9rg56iWv3n/Cj
	d7Gw==
X-Gm-Message-State: APjAAAWY24/sZus3RxkaMj5VF/kybkgShOrGHKPghQlhD3bXtzj7M5Iw
	C+SDZYX/hln6yrTE1TlJP0svlQ1iXeM=
X-Google-Smtp-Source: APXvYqzHTPR6hFX+qQIJ1tTCIfFMFkk/C+xiBp/uzwMxmN9lJOCKXgaQu0XPWAfOXji5R62AY5bYBg==
X-Received: by 2002:adf:eb49:: with SMTP id u9mr24832102wrn.235.1567502161668; 
	Tue, 03 Sep 2019 02:16:01 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	l9sm14113809wmi.29.2019.09.03.02.16.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 03 Sep 2019 02:16:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Sep 2019 09:16:01 +0000
Message-Id: <20190903091601.552632-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH] python3-pyatspi: restrict with GTK2DISTROFEATURES
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
X-List-Received-Date: Tue, 03 Sep 2019 09:16:01 -0000

* fixes:
  NOTE: Resolving any missing task queue dependencies
  ERROR: Nothing PROVIDES 'gtk+' (but meta-oe/meta-python/recipes-devtools/python/python3-pyatspi_2.32.1.bb DEPENDS on or otherwise requires it)
  gtk+ was skipped: one of 'x11 directfb' needs to be in DISTRO_FEATURES
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
  Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'python3-pyatspi', 'gtk+']

  Summary: There was 1 WARNING message shown.
  Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pyatspi_2.32.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyatspi_2.32.1.bb b/meta-python/recipes-devtools/python/python3-pyatspi_2.32.1.bb
index 6d80c10915..c60d40e3a2 100644
--- a/meta-python/recipes-devtools/python/python3-pyatspi_2.32.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyatspi_2.32.1.bb
@@ -11,6 +11,10 @@ SRC_URI = "git://github.com/GNOME/pyatspi2.git;protocol=https;branch=gnome-3-32"
 SRCREV = "dc4565208fca00da06b972915a080ad3c63f640d"
 S = "${WORKDIR}/git" 
 
+# Same restriction as gtk+
+inherit distro_features_check
+ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
+
 inherit pkgconfig autotools python3native
 
 FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}/pyatspi/*"
-- 
2.17.1


