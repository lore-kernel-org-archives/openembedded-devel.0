Return-Path: <net147@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 04321739C0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2015 05:22:41 +0000 (UTC)
Received: by pdbnh10 with SMTP id nh10so76785547pdb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Mar 2015 22:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=XFDc/hUQ5muqcxsa66jqiOjyG8Y6UyfQxVgsmGQU9Yo=;
	b=yuReyyp+v7YSdLW/stGgjbINcj6fQAevDdhEAXtHz3MZAf/+lBeMY3AxyA8vWc0rF1
	5xerHsdBjYDkGuD2mzvrbj5Lpg35y/xePMalxJA26h1nGRa5saj0fx5eZRwZ+mu5TtJ8
	AfWh6coXr53Hsr8B80Fit8MrYmR0jhaNLqR5OryQQ2ezQUxBsG1b3LElkhflYKVui+lT
	ydXByWUml7KCS5oKsp0pf4IWQCXlwrFmRFymZgmBG90DGwMJ2RJBhRI58Z6sjinSNT9o
	nR9Jw8q+qTKKoIjBMgGsruGSAcIORfKzzLtxR41B4x7v12NlZUq9yu9P4+K8a+lF4JW0
	5LSg==
X-Received: by 10.66.118.129 with SMTP id km1mr62013113pab.112.1425964962660; 
	Mon, 09 Mar 2015 22:22:42 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	ki2sm21956121pdb.33.2015.03.09.22.22.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Mar 2015 22:22:41 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Mar 2015 16:20:08 +1100
Message-Id: <1425964808-17857-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.3.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] nodejs: remove curl from RDEPENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Mar 2015 05:22:42 -0000

curl is only needed to run "make test".

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_0.12.0.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.12.0.bb
index fae4b59..d74d7c1 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.12.0.bb
@@ -66,9 +66,6 @@ do_install_append_class-target() {
     sed "1s^.*^#\!${bindir}/env node^g" -i ${D}${libdir}/node_modules/npm/bin/npm-cli.js
 }
 
-RDEPENDS_${PN} = "curl"
-RDEPENDS_${PN}_class-native = ""
-
 PACKAGES =+ "${PN}-npm"
 FILES_${PN}-npm = "${libdir}/node_modules ${bindir}/npm"
 RDEPENDS_${PN}-npm = "python-shell python-datetime python-subprocess python-textutils"
-- 
2.3.1


