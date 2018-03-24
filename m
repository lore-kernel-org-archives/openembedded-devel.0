Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3570D786EA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Mar 2018 13:46:14 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id s48so15401853qtb.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Mar 2018 06:46:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=K0N2Sy9D7LYDaxGYe4bGn/htd7Z8uVPyJfVdtT0jPq4=;
	b=lyCc6wvHS3CZsOSxDnI0v31QiCKWFuSINVneFroc/afy64QDXAT659M0TlP3ha5vMp
	fVGFnMRRkMekWJyGh46lEYDmWjEUnw/6Nui+teoaIwNqLOWJM9pf4y91CID2BqLHxjlU
	y27GT8/xMnCuyG9vPnU5qEe+7Ypn+WgpRyBGcWqRqrtQOG/SwSo0vqpr2Kiv/CWAvl7M
	za2hNTZc9GXHfDqzhe5IsxcJGmzUl5a5uJ2vUeTg4cdHjOKFEuRLlDVnAEkGfQnKLVLD
	yAWeHzZM40KeyjoF2Ka2v6vX92gj8EKs10MYUZk4rF7LQKbgFmfCplztFJvM9GA7+neq
	dKsQ==
X-Gm-Message-State: AElRT7F7fuRaRVqIsnbeZTyx1HMk0slljZ3nKB86qpf2dhmVANoJQksy
	Owv7FTFWlKrA49CXEJCAZjTNfokI
X-Google-Smtp-Source: AG47ELsT469pgafyd2nPAgRgjHujh8URq+x+xikp7nBjuDXmsaCSn/99Ze0OWbOozktSqk9L31VQlQ==
X-Received: by 10.237.43.228 with SMTP id e91mr48256671qtd.17.1521899175930;
	Sat, 24 Mar 2018 06:46:15 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id 10sm8250627qkl.65.2018.03.24.06.46.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 24 Mar 2018 06:46:15 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 24 Mar 2018 09:46:05 -0400
Message-Id: <1521899165-11434-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-flask-user: update to version 0.6.20
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
X-List-Received-Date: Sat, 24 Mar 2018 13:46:15 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-flask-user.inc             | 4 ++--
 .../{python-flask-user_0.6.19.bb => python-flask-user_0.6.20.bb}      | 0
 .../{python3-flask-user_0.6.19.bb => python3-flask-user_0.6.20.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-flask-user_0.6.19.bb => python-flask-user_0.6.20.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-flask-user_0.6.19.bb => python3-flask-user_0.6.20.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-flask-user.inc b/meta-python/recipes-devtools/python/python-flask-user.inc
index c2b7182..1955954 100644
--- a/meta-python/recipes-devtools/python/python-flask-user.inc
+++ b/meta-python/recipes-devtools/python/python-flask-user.inc
@@ -6,8 +6,8 @@ HOMEPAGE = " https://github.com/lingthio/Flask-User"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=97de97cd9d6e23c88129d884588ce71a"
 
-SRC_URI[md5sum] = "f7965e66ca139c8436896da07e66c21f"
-SRC_URI[sha256sum] = "601abcc0343dfbae0c56273d98362d5cdc266ac84d20b3f65a212e4a2c83b302"
+SRC_URI[md5sum] = "9ce424f080659e1d5e1b75c9ed2f03af"
+SRC_URI[sha256sum] = "699df643471f08f9a4d10c3b17c0a53e92bb71c7feb414bedd76c7c9263dcf5e"
 
 PYPI_PACKAGE = "Flask-User"
 
diff --git a/meta-python/recipes-devtools/python/python-flask-user_0.6.19.bb b/meta-python/recipes-devtools/python/python-flask-user_0.6.20.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-flask-user_0.6.19.bb
rename to meta-python/recipes-devtools/python/python-flask-user_0.6.20.bb
diff --git a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb b/meta-python/recipes-devtools/python/python3-flask-user_0.6.20.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
rename to meta-python/recipes-devtools/python/python3-flask-user_0.6.20.bb
-- 
2.7.4


