Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2AA017D2FD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2019 08:53:17 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id f72so3422048wmf.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2019 01:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=6ifCRj2Objf6NmLT0zulKd0FH/u8+1zYZ0zxQrgCQoY=;
	b=I0d5+ZthmAncBlped+lEYgn0Kf+b6b6Hn5rD2oM+fGmDanjiy6QO9bDUYsMYPo4Jhy
	U7DwaLxHFw94FvtpSs9OFQ77RnVTsIzgVy6mLns5vNBEpDCKtlpLLwPpU9ujiQNnJJkj
	ahREnuFz+CwVnSdB7ylmlRroknfD9zoaYVpi10hqka5k9K4p3caP3s06D1kvC72+DYx1
	zVvGdDkHi/VCy5Zw+OF4Q7LOn/Kx0JFjB0OafcRTXwgUN4S1Emn5at57IhGG1x5l0AG5
	2+qXDmnE2ObF5mACt360FnLOzC7SQeCRM1IgqiPLRc8TFoa5o0Z76mlu1+aDPhDEXiRC
	DFKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6ifCRj2Objf6NmLT0zulKd0FH/u8+1zYZ0zxQrgCQoY=;
	b=XFKRtAy14eitB9vbhFHVfIQSOqzYTxALkFCA00J9dqqiM+/syn9UYxuf3uLZi9yVAK
	w6Llg9ucbeqEsWP0LK2a9iAGkisqrWQ9j4JjZEye9m2NDqZBnCzxtQPeXrZfu5tWmCcS
	mYkTuVwF8HNTeCCMln3qYXxk/vfXcKIHLtk2HH79Ez7/s3ZkwPMOxJfTs3qTF+OISql9
	YhmNUanVt/X7+sWdfdjRQkOeXyzsAMjqW2hXSqPXbwfaoH0gNjl30pPZ0J28m05ce2VJ
	riEaLeGbagF4u6bI4v5yfthDmFfnhLs8ASWqJ9qNLsovUHVZieWsIfG5sRNxk1pe/MTh
	7Q1w==
X-Gm-Message-State: APjAAAUoS3iYXaz3KKgxyktfGQ5B1t7SePAMr6Z15StFQKCO9NQ9WEMj
	3w3kERqij7pmUhq+nJQlrtiP2ec6LLA=
X-Google-Smtp-Source: APXvYqwlk2fxPq/wT72ks4qp9a4Wx4UppQGs9F8DQLdPEhbumMxsmsu7JU4rgKvdStsfZlhn7USxpA==
X-Received: by 2002:a1c:f20a:: with SMTP id s10mr6353468wmc.145.1565945598490; 
	Fri, 16 Aug 2019 01:53:18 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id z8sm5820745wru.13.2019.08.16.01.53.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 16 Aug 2019 01:53:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Aug 2019 08:53:22 +0000
Message-Id: <20190816085323.2700796-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH 1/2] nodejs: fix QA error about /usr/bin/python dependency
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
X-List-Received-Date: Fri, 16 Aug 2019 08:53:18 -0000

* fixes:
  ERROR: QA Issue:
  /usr/lib/node_modules/npm/node_modules/node-gyp/gyp/samples/samples
  contained in package nodejs-npm requires /usr/bin/python, but no
  providers found in RDEPENDS_nodejs-npm? [file-rdeps]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_10.16.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_10.16.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_10.16.2.bb
index e259c45bea..d464e9d8af 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_10.16.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_10.16.2.bb
@@ -100,7 +100,7 @@ do_install_append_class-target() {
 
 PACKAGES =+ "${PN}-npm"
 FILES_${PN}-npm = "${exec_prefix}/lib/node_modules ${bindir}/npm ${bindir}/npx"
-RDEPENDS_${PN}-npm = "bash python python-shell python-datetime python-subprocess python-textutils \
+RDEPENDS_${PN}-npm = "bash python-core python-shell python-datetime python-subprocess python-textutils \
     python-compiler python-misc python-multiprocessing"
 
 PACKAGES =+ "${PN}-systemtap"
-- 
2.17.1


