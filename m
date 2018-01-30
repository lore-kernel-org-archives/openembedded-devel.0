Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id D51F8605C3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jan 2018 18:38:29 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id a27so18574545qtd.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jan 2018 10:38:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EsUS8OZ60TmDnO1CQb3GpWjXya7ZAhAU/kuy3e6j7eQ=;
	b=NgtFDKfhdcqYqUbEzWUJKXzgZzXsqaQymJR0c0WsNKBHOLcosQWRdEudSCfn7XKf/T
	egATa7Gj2SqCSjUrhdi1OBchG/M8OAr4X7+2Qf9ScPPozO6APTlpIAOWDeRLqU+1BFtS
	B9RD1kINT1pXvpXp6LDM/+yxuti1+efYXJvUc94f4h18/wjdNpmztoJdhbnxTq2DiZbJ
	FszFBIM5+s/0gr3iuaaEgVoMqJp6K4QOIoEQKHu8KQQ1HzPVEPPCVUdaKzKUwcLU8dRc
	Ga8TttugMjAfr/aPqmGuUQn4SabEsEYkAtWrzvgTUuBdprBmD7qxAAjVhWjsGLJmZRFC
	nVkw==
X-Gm-Message-State: AKwxytfdBMQIFTQovP9t4z75Ik0UkSRjYdQ9LYWnXkR0tmp+mqgLDMd7
	p0uu6KxMRVl/a3oKQ4V3rU0r/25V
X-Google-Smtp-Source: AH8x225WjfIQBDDdA8Xgp+uhkZYHaCuOIsKnqi5IeUJpK5uwX8UGd5wHI4k4TYATt5a/w2L+X1sv1w==
X-Received: by 10.200.45.109 with SMTP id o42mr45413329qta.263.1517337510524; 
	Tue, 30 Jan 2018 10:38:30 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id m70sm9550730qke.7.2018.01.30.10.38.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 30 Jan 2018 10:38:29 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Jan 2018 13:38:19 -0500
Message-Id: <1517337499-2417-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCHv2] python-ndg-httpsclient: update to version 0.4.4
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
X-List-Received-Date: Tue, 30 Jan 2018 18:38:30 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-ndg-httpsclient.inc        | 4 ++--
 ...ython-ndg-httpsclient_0.4.3.bb => python-ndg-httpsclient_0.4.4.bb} | 0
 ...hon3-ndg-httpsclient_0.4.3.bb => python3-ndg-httpsclient_0.4.4.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-ndg-httpsclient_0.4.3.bb => python-ndg-httpsclient_0.4.4.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-ndg-httpsclient_0.4.3.bb => python3-ndg-httpsclient_0.4.4.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc b/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc
index 133cab1..b556432 100644
--- a/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc
+++ b/meta-python/recipes-devtools/python/python-ndg-httpsclient.inc
@@ -3,8 +3,8 @@ HOMEPAGE = "http://python-requests.org"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://MANIFEST.in;md5=ce22c0cd986d2de3f7073cd6b5523ae0"
 
-SRC_URI[md5sum] = "59a2f0a5b3b60e6c520a9cc7be9aff87"
-SRC_URI[sha256sum] = "7bfd8c5cfcbc241a93ca6a4e45f952650f5c7ecf7c49b1dbcf5f4d390240be0b"
+SRC_URI[md5sum] = "a0d349cf9530e331697a6e5ab1f40de6"
+SRC_URI[sha256sum] = "fba4d4798dcac2965874f24afb6631b4326baa4bd02505744d34f690c354856a"
 
 PYPI_PACKAGE = "ndg_httpsclient"
 
diff --git a/meta-python/recipes-devtools/python/python-ndg-httpsclient_0.4.3.bb b/meta-python/recipes-devtools/python/python-ndg-httpsclient_0.4.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-ndg-httpsclient_0.4.3.bb
rename to meta-python/recipes-devtools/python/python-ndg-httpsclient_0.4.4.bb
diff --git a/meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.4.3.bb b/meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.4.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.4.3.bb
rename to meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.4.4.bb
-- 
2.7.4


