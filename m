Received: from mail-ea0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UPxwc-0001NX-4U
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Apr 2013 18:32:24 +0200
Received: by mail-ea0-f173.google.com with SMTP id k11so310933eaj.18
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2013 09:15:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=aIqnIj22WxK4mfGIBi8xeicykzgFKnibDsMZDRKGcm0=;
	b=Te6RABnZri2GSL4aYxiu/FavldoXxOn8oog7DxO5nlo+TLlE0n1HpPiA+DcsLRRPbQ
	nWKawT+qphcGAyBjhmVYEWZ39OjL3BQ01gcO06hLJAo/cvYTEbcLN3ZcUs1HYiUEjswP
	JVZNBsQZRefkhnvTujkqoQaR7QfxNZ7whdfxlq9gtxDI2GQv+bHEwESZPMlLO/lZ25nc
	LQsTtGRk6AepOdjUrOscu2d+OWAUdePbXD3wbgooSeQaq2RmI/yiRXmodHljEiVZPduZ
	6n8SUyDFx9UvqjR5NYnnJd7EI/k+55v3Grv2V5s9QDpJ6aTC7D95kTXiks8RTt/muiLH
	eThw==
X-Received: by 10.15.36.2 with SMTP id h2mr7143156eev.2.1365610500463;
	Wed, 10 Apr 2013 09:15:00 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id d47sm673685eem.9.2013.04.10.09.14.58
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 10 Apr 2013 09:14:58 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Apr 2013 18:14:20 +0200
Message-Id: <1365610462-29689-6-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1365610462-29689-1-git-send-email-koen@dominion.thruhere.net>
References: <1365610462-29689-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlKr9TryY8mB6zLwInZDQGvc58Gzfmax7ENIvYCO1zWF2Fc9dF9MmXTyYGV2/yE8WcTVDf2
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 6/8] cloud9: use node4 to build o3-xml binary
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
X-List-Received-Date: Wed, 10 Apr 2013 16:32:26 -0000

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



