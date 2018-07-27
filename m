Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6E2986067C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 18:03:55 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id c15-v6so5951356qtp.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 11:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+pLEDZvb0dWFs9N8rBgE6LrT/KusglTpH+wyDlEOB60=;
	b=DCf+TD2VxuJz0T7B7MPARCOkDhMaSVgrEJ5dNzuIwLgWgtZuaDjPD3Lf4osu45swh2
	0uTkoHRkeWNboTl4HJyxVJl01Hu48WbhKYPTw2EmsWv6212IsX1dbQSFFC5riFyKpomt
	a5sZ5oInbTkNknxIG//EmH2+4VFSTuJRnkf9f/IZNLRKNIZPJnasQ0W3BFSdu1gsrUXe
	NZiKf192vGWK94WmiTa0bsdrM7L1ORpUa8vLvlycYC4baK11a11xNlt7hDHhlCqVcm53
	UJx/LGWdqn7c5nl2cUNfJUhZvBvQm2UQwYSNUn5AGPRuM86cW8i8sH8LkiKyB9/U+mnP
	MPLw==
X-Gm-Message-State: AOUpUlHIOL3c0ose7DzN3K+YX0B6984wS35w9Tm9P7E6w7Uhd78wZv3E
	qdigXe5C7ekQGjezV14LBB4TznkADvA=
X-Google-Smtp-Source: AAOMgpcubL6bW61AGivWOKcMG1jXzCqHa7ctcpFO8MpWVgEVnkTWZHANfgGX4S7AYe1Dz/2Z/3DrLQ==
X-Received: by 2002:ac8:23b1:: with SMTP id
	q46-v6mr6818251qtq.322.1532714635866; 
	Fri, 27 Jul 2018 11:03:55 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	j16-v6sm2444360qtp.13.2018.07.27.11.03.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Jul 2018 11:03:55 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Jul 2018 14:03:48 -0400
Message-Id: <1532714628-4473-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-ndg-httpsclient: update to version 0.5.1
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
X-List-Received-Date: Fri, 27 Jul 2018 18:03:55 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-ndg-httpsclient.inc        | 4 ++--
 ...ython-ndg-httpsclient_0.5.0.bb => python-ndg-httpsclient_0.5.1.bb} | 0
 ...hon3-ndg-httpsclient_0.5.0.bb => python3-ndg-httpsclient_0.5.1.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-ndg-httpsclient_0.5.0.bb => python-ndg-httpsclient_0.5.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-ndg-httpsclient_0.5.0.bb => python3-ndg-httpsclient_0.5.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc b/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc
index 4e07e4e..91235b9 100644
--- a/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc
+++ b/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://python-requests.org"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://MANIFEST.in;md5=ce22c0cd986d2de3f7073cd6b5523ae0"
 
-SRC_URI[md5sum] = "1c28be0449268359e795b3b5687feeb7"
-SRC_URI[sha256sum] = "c009f5430790936b3a97eaf9f968516664d97e146ab2bda991f0caadb7cc088b"
+SRC_URI[md5sum] = "b0fc8ea38f87d2c1ab1ed79a95c078f9"
+SRC_URI[sha256sum] = "d72faed0376ab039736c2ba12e30695e2788c4aa569c9c3e3d72131de2592210"
 
 PYPI_PACKAGE = "ndg_httpsclient"
 
diff --git a/meta-python/recipes-devtools/python/python-ndg-httpsclient_0.5.0.bb b/meta-python/recipes-devtools/python/python-ndg-httpsclient_0.5.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-ndg-httpsclient_0.5.0.bb
rename to meta-python/recipes-devtools/python/python-ndg-httpsclient_0.5.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.5.0.bb b/meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.5.0.bb
rename to meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb
-- 
2.7.4


