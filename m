Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 12AFB78072
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 20:30:20 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id c7so16542167qtn.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 12:30:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=74VxBmIkfUipNPS7O4dGXHloc/IuQIUG4t1c2z0/7OM=;
	b=TlOaqjalvS9EsiE6W7UGNCZAsqklUk4lXSPYAO46LbBZc9ZG3luVSZOn+/6hfa1xh1
	YnrBQyLLWvR0rAfP/QSIWPk54MBMBKguLTMyGx0/9Q0V7YFjag3OBnBLkmHxNBa1ANOq
	MQLJcm0jaqD+tcQfEsb6o0yY3ALidCsLpz0Ve78XUk3FqlXARQjhKQulwQWREoK8dOoU
	oRKqLwsO9uTCTCG5B1T2VEqWkFSIF0CktG+AQqcpNEqH2KbXeOOicnc4d9wvYMSOp8wi
	/50CzZFHmAAGqbj3nR66kjhh0HwocHH6GYaE/NhKW6Beh9AP1ejXHWM21Cxi6282KyCQ
	VyKA==
X-Gm-Message-State: APf1xPBCTFLHXVQwa3KtXHrff94PGxb+eQH9SApLKGQze+lIsg2ng1GC
	m2ly2w/F7Mq88N+HySzRWLrBldLs
X-Google-Smtp-Source: AG47ELtO/yhdtzEi9zHueiTOhFuLaw2pP/8pf4wP6Qi4tLkhebek9lH/CWFE5icQ9e8Rc1OIqF9Nhw==
X-Received: by 10.237.54.103 with SMTP id e94mr13581462qtb.112.1519590621743; 
	Sun, 25 Feb 2018 12:30:21 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	i52sm4645262qtf.91.2018.02.25.12.30.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 12:30:21 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 15:30:12 -0500
Message-Id: <1519590612-10717-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-ply: update to version 3.11
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
X-List-Received-Date: Sun, 25 Feb 2018 20:30:21 -0000

Update license checksum for new copyright year

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-ply.inc                  | 6 +++---
 .../python/{python-ply_3.10.bb => python-ply_3.11.bb}               | 0
 .../python/{python3-ply_3.10.bb => python3-ply_3.11.bb}             | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-ply_3.10.bb => python-ply_3.11.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-ply_3.10.bb => python3-ply_3.11.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-ply.inc b/meta-python/recipes-devtools/python/python-ply.inc
index a6cdf4b..a744950 100644
--- a/meta-python/recipes-devtools/python/python-ply.inc
+++ b/meta-python/recipes-devtools/python/python-ply.inc
@@ -3,10 +3,10 @@ DESCRIPTION = "Python ply: PLY is yet another implementation of lex and yacc for
 HOMEPAGE = "https://pypi.python.org/pypi/ply"
 SECTION = "devel/python"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://README.md;beginline=3;endline=30;md5=fcb04bc2f765e46ab7084d6ab6e452bb"
+LIC_FILES_CHKSUM = "file://README.md;beginline=5;endline=32;md5=f5ee5c355c0e6719c787a71b8f0fa96c"
 
-SRC_URI[md5sum] = "1d63c166ab250bab87d8dcc42dcca70e"
-SRC_URI[sha256sum] = "96e94af7dd7031d8d6dd6e2a8e0de593b511c211a86e28a9c9621c275ac8bacb"
+SRC_URI[md5sum] = "6465f602e656455affcd7c5734c638f8"
+SRC_URI[sha256sum] = "00c7c1aaa88358b9c765b6d3000c6eec0ba42abca5351b095321aef446081da3"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-ply_3.10.bb b/meta-python/recipes-devtools/python/python-ply_3.11.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-ply_3.10.bb
rename to meta-python/recipes-devtools/python/python-ply_3.11.bb
diff --git a/meta-python/recipes-devtools/python/python3-ply_3.10.bb b/meta-python/recipes-devtools/python/python3-ply_3.11.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-ply_3.10.bb
rename to meta-python/recipes-devtools/python/python3-ply_3.11.bb
-- 
2.7.4


