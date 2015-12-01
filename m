Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 331D460761
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Dec 2015 17:16:15 +0000 (UTC)
Received: by igcto18 with SMTP id to18so11545831igc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Dec 2015 09:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=XXUeEoH8MFSssh8uKBFUr71ajf4CyymFY1Wn38X9spU=;
	b=RX+8o5+vDRZIJgMAoG2FnLRFNsCe1AM7yHb0GLytjAjkSgyszSX9aga3c2/GOEKpZ1
	7yk7iLG15Rku2j0kLtR6P50ciOZNDZepM5VvfcCqzBCeBjHnRSObTf8X/eq8Te9AHXv+
	AP/cmTk5FCkdpi0TbVINzZsTwmORpuMQDriSwuxbzZEGdMiwfBAJv0y1PlyjxQxqNrG7
	eRbd25dMcJTuuuvcq+NEfe8v+0Y32abVg084U9zWkMdAZeVpoAojBzwiRJAIv9qJ3HxZ
	XuE5Iyswq2XDTs5CCRWwIqIxqdr2ZBcgiT1CUp+vZjIDTgNkaLPqNgHO29kU2s2znX2o
	6jdg==
X-Received: by 10.50.66.179 with SMTP id g19mr29816997igt.20.1448990175925;
	Tue, 01 Dec 2015 09:16:15 -0800 (PST)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	qb7sm288509igb.8.2015.12.01.09.16.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Dec 2015 09:16:15 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Dec 2015 12:15:49 -0500
Message-Id: <1448990151-27720-1-git-send-email-twoerner@gmail.com>
X-Mailer: git-send-email 2.6.3.368.gf34be46
Subject: [meta-oe][PATCH 0/2] nodejs cleanup and add
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
X-List-Received-Date: Tue, 01 Dec 2015 17:16:18 -0000

The current stable version of nodejs is 4.2.2.

Currently there are two nodejs recipes from which to choose: nodejs, and
nodejs4. A user would naturally assume nodejs4 refers to version 4.2.2, but
they would be wrong. Nodejs4 refers to version 0.4.12.

Cleanup the current nodejs naming and include a new recipe for the latest
stable version.

Trevor Woerner (2):
  nodejs: cleanup
  nodejs: add recipe for latest stable

 .../enable-armv5e-build.patch                      |  0
 .../{nodejs => nodejs-0.12.7}/no-registry.patch    |  0
 .../libev-cross-cc_0.4.12.patch                    |  0
 meta-oe/recipes-devtools/nodejs/nodejs.inc         | 80 ++++++++++++++++++++++
 meta-oe/recipes-devtools/nodejs/nodejs_0.12.7.bb   | 74 +-------------------
 .../nodejs/{nodejs4_0.4.12.bb => nodejs_0.4.12.bb} |  2 +-
 meta-oe/recipes-devtools/nodejs/nodejs_4.2.2.bb    |  9 +++
 7 files changed, 92 insertions(+), 73 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs => nodejs-0.12.7}/enable-armv5e-build.patch (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs => nodejs-0.12.7}/no-registry.patch (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs4 => nodejs-0.4.12}/libev-cross-cc_0.4.12.patch (100%)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs.inc
 rename meta-oe/recipes-devtools/nodejs/{nodejs4_0.4.12.bb => nodejs_0.4.12.bb} (87%)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs_4.2.2.bb

-- 
2.6.0.rc3


