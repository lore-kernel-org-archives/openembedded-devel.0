Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TBRVN-0006ot-S2
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Sep 2012 16:31:57 +0200
Received: by mail-ee0-f47.google.com with SMTP id b57so429158eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Sep 2012 07:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=gTZ4JltWdmMPcO5qvA9nFmihCrbXCzae84z/LuIq8t4=;
	b=Cn64v8ewbuXu3gR+0MRvF/MfJznxS6ckAe+yb98BBMZaTVZzBlzYe+wmDk4xiA7SjC
	IQm+EiOVHvsfMJKIOYOx0Qb8EfSxHvNmzQ+llIa243CM8XQmcljSlYHSTv8K4BjKWvwT
	NqtYCesIskYtkUaTKyZBJMTGnWYq8WXLcc69XvLbNnOLXuj8K08YAUVUmEs8hrllLfC3
	67/nJniEJS7k4u3bZxLbNeLZWuKnC0f7FrZqHbsISOXLsTIdT8bc4jNTn0cLM0odlCZR
	tju9SSSO5bXKA6nBe/qQZU4Tq7bFT/tN5QKJr2LFB+1gcispx2fLTCkejuSLT3wACQun
	3icQ==
Received: by 10.204.148.66 with SMTP id o2mr4819521bkv.43.1347373169233;
	Tue, 11 Sep 2012 07:19:29 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 14sm9798898bkw.15.2012.09.11.07.19.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 07:19:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Sep 2012 16:19:01 +0200
Message-Id: <469c1599ceef77295ee1729fe67689e39badffa2.1347363666.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1347363666.git.Martin.Jansa@gmail.com>
References: <cover.1347363666.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1347363666.git.Martin.Jansa@gmail.com>
References: <cover.1347363666.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 3/5] sip-native: inherit qmake2 instead of qt4x11
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
X-List-Received-Date: Tue, 11 Sep 2012 14:31:57 -0000

* it seems enough
* inherit qt4x11 adds dependency on target qt4-x11-free, which is bad,
  because we don't need it and it's causing different sstate checksum:
  $ bitbake-diffsigs
    stamps.1347348593/nokia900/x86_64-linux/sip-native-4.13.3-r0.do_configure.sigdata.6e44871660ef91eab5ee4d56e55b6728
    stamps.1347348593/om-gta02/x86_64-linux/sip-native-4.13.3-r0.do_configure.sigdata.cdaf666b98c2c6ccfb710743dcdbd988
      Hash for dependent task qt4-x11-free_4.8.1.bb.do_populate_sysroot changed from 79234aca07686c1d97782e21fc098071 to 7e9ba3de3ba9f709a5d9ef5abadb2d9e

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/sip/sip-native_4.13.3.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/sip/sip-native_4.13.3.bb b/meta-oe/recipes-extended/sip/sip-native_4.13.3.bb
index 2ef10bf..c20683f 100644
--- a/meta-oe/recipes-extended/sip/sip-native_4.13.3.bb
+++ b/meta-oe/recipes-extended/sip/sip-native_4.13.3.bb
@@ -9,8 +9,9 @@ SRC_URI = "http://www.riverbankcomputing.co.uk/static/Downloads/sip4/sip-${PV}.t
 SRC_URI[md5sum] = "76192829cc42ec558db46e4f9e1d8ba9"
 SRC_URI[sha256sum] = "ec295f71ef339c5b98db5650865f2c6c1200c4085b7a3f33f284111e1f534ac1"
 S = "${WORKDIR}/sip-${PV}/sipgen"
+PR = "r1"
 
-inherit qt4x11 native python-dir
+inherit qmake2 native python-dir
 
 EXTRA_QMAKEVARS_POST += "DESTDIR=${S} CONFIG=console"
 
-- 
1.7.12



