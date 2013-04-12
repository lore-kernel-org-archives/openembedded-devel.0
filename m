Received: from mail-ee0-f50.google.com ([74.125.83.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UQb7k-0002UN-0B
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Apr 2013 12:23:31 +0200
Received: by mail-ee0-f50.google.com with SMTP id e53so1202285eek.23
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Apr 2013 03:05:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=sbeVT3RnLPia7Eyb4iMi/IYPVGMwQHJLz42AIrDrnjw=;
	b=YRkKhCeAW8b+VJE7dRMKuiPMhacdKYjYtYVlUOxznF/Sx/h+vtGTAyHp0YCO+GZ9TL
	/PWAkCYyNl4bCMxS9RSDzv50jP8UyoLW/3VFAR6IWQ2OjlJ9mWx+iMD53xEjzimMaUR3
	Dup4OabFCdk1Hd/YiFlIsL+2uv17i2SqCabpOvEj5G44TdT6F0Z7PufkX7QZEfwMQFYA
	V4o3Qu8DFIbqIlbAjj2lXp1NoUz57IUQ4vwoXOts7oMQif9Uw0/0o1tkcMe1Vpq5OsJD
	pRrfzK7po/vOvTbbwEJWkJb0Jb+kAZn6mgbP9b2z+5+D8d198WHBG1IfyvyWgFbmVt+g
	qvuw==
X-Received: by 10.14.210.132 with SMTP id u4mr26595303eeo.19.1365761103725;
	Fri, 12 Apr 2013 03:05:03 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id ca4sm10203666eeb.15.2013.04.12.03.05.01
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 12 Apr 2013 03:05:02 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Apr 2013 12:04:46 +0200
Message-Id: <1365761087-1229-4-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1365761087-1229-1-git-send-email-koen@dominion.thruhere.net>
References: <1365761087-1229-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkpwl30Ua2ItLGYGRw8UxXCkqs6N1U8SjbNEHSJQAMZhwhdCnWcJHESKzrDf/NWh8muNDyB
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCHv3 4/5] cloud9: use node4 to build o3-xml binary
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
X-List-Received-Date: Fri, 12 Apr 2013 10:23:31 -0000

Using node 0.8.x will make it crash at runtime

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb b/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
index a78c653..0c07b12 100644
--- a/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
+++ b/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
@@ -5,7 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4784c3bcff601fd8f9515f52a11e7018"
 
 PR = "r2"
 
-DEPENDS = "libxml2 nodejs-native"
+# Nodejs-native for node-waf, nodejs4-native for the headers
+DEPENDS = "libxml2 nodejs-native nodejs4-native"
 
 SRC_URI = "git://github.com/ajaxorg/cloud9.git;name=cloud9ide \
            git://github.com/ajaxorg/o3;destsuffix=o3;name=o3 \
@@ -68,11 +69,11 @@ do_configure () {
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



