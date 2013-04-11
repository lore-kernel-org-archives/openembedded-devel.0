Received: from mail-ee0-f54.google.com ([74.125.83.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UQFIH-0007jN-Ha
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Apr 2013 13:03:56 +0200
Received: by mail-ee0-f54.google.com with SMTP id e51so672843eek.27
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Apr 2013 03:46:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=aIqnIj22WxK4mfGIBi8xeicykzgFKnibDsMZDRKGcm0=;
	b=dQ+/UOZMkSMx4JMt/4AohRbo6dadAdeLhJey9GUGP0+f3LXMobVOfcwPj2eVyZeFsa
	nSHYxnfS5n3G60CyJ6IWyYEvzfoojoqX5zZwbT8HMg/Afai8UCHrv2lAa4a9iwyu5Jga
	2pt0nYs+HZMC400rtQXolVzIwT/o0srIoEB4iE0vQ24Qnz5tpwetWo+sv93Zj6A8DiHQ
	pNDbdIV9hKAJZ3NOXv/q5/hEsMsAYoFnJgOeft+1O6t+sdGpUI+Z5lzjD9NK/l5RVAN4
	wdojVKoxCoFKnmJri1pCghvgXoRQIM7uTqvFAqdraxZNB1YOpQ3maknIe97Xok7H3sfb
	wKQQ==
X-Received: by 10.14.107.69 with SMTP id n45mr15738639eeg.23.1365677190812;
	Thu, 11 Apr 2013 03:46:30 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id a41sm4946895eei.4.2013.04.11.03.46.29
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 11 Apr 2013 03:46:29 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Apr 2013 12:46:03 +0200
Message-Id: <1365677165-9296-6-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1365677165-9296-1-git-send-email-koen@dominion.thruhere.net>
References: <1365677165-9296-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQn1YBL4rUL4wHVR+vifr5DYBo+qJZUtWx5OzqGq46LyTyPk+wEkgrgMegsOoHjqTweUqwxG
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCHv2 6/8] cloud9: use node4 to build o3-xml binary
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Apr 2013 11:03:59 -0000

Using node 0.8.x will make it crash at runtime

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb b/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
index a78c653..ef32829 100644
--- a/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
+++ b/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4784c3bcff601fd8f9515f52a11e7018"
 
 PR = "r2"
 
-DEPENDS = "libxml2 nodejs-native"
+DEPENDS = "libxml2 nodejs4-native"
 
 SRC_URI = "git://github.com/ajaxorg/cloud9.git;name=cloud9ide \
            git://github.com/ajaxorg/o3;destsuffix=o3;name=o3 \
@@ -68,11 +68,11 @@ do_configure () {
  node-waf -vv configure
 }
 
-EXTRA_CXXFLAGS = "-Idefault/include -I../include -Idefault/hosts -I../hosts -Idefault/modules -I../modules -Idefault/deps -I../deps -I${STAGING_DIR_NATIVE}/usr/include/node -fPIC -DPIC"
+EXTRA_CXXFLAGS = "-Idefault/include -I../include -Idefault/hosts -I../hosts -Idefault/modules -I../modules -Idefault/deps -I../deps -I${STAGING_DIR_NATIVE}/usr/include/node4 -fPIC -DPIC"
 
 do_compile () {
  cd ${WORKDIR}/o3
- node tools/gluegen.js
+ node4 tools/gluegen.js
  cd hosts
  ${CXX} ${TARGET_CXXFLAGS} ${EXTRA_CXXFLAGS} -c -o sh_node.o node-o3/sh_node.cc
  ${CXX} ${TARGET_CXXFLAGS} ${EXTRA_CXXFLAGS} -c -o sh_node_libs.o node-o3/sh_node_libs.cc
-- 
1.8.1.4



