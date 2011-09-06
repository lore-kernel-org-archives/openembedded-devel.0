Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R0qRz-0000AJ-0H
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Sep 2011 09:52:07 +0200
Received: by mail-ew0-f47.google.com with SMTP id 5so2463833ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Sep 2011 00:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=TTQl1hUEHtBvk06IoyxeS7g5bCWBbgLd2UUv5wPbQeM=;
	b=cWResWq5oaVDTnF/V9ebdMUBGB+4JlJmkKK8yxZzkPznJdBoGYnvlB4YEX4glk1bf2
	ge/ndaL4T+Ee9OiK7RaTN4xOsBnDQIabaYwdyLt0h45dCC+67kVzlLJhv+DEJAvCNxNY
	MoaQPP29/nInKVaraUrwT/ePVHpOcEFTrQYWI=
Received: by 10.213.27.148 with SMTP id i20mr1078002ebc.139.1315295227907;
	Tue, 06 Sep 2011 00:47:07 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f3sm858631eea.4.2011.09.06.00.47.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Sep 2011 00:47:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Sep 2011 09:46:40 +0200
Message-Id: <291eb03cdeabde1e59f78a971b94fcde3aeaf4ae.1315295094.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <d8844ea29a966dcba6a0bf1c0c9827ba24b00861.1315295093.git.Martin.Jansa@gmail.com>
References: <d8844ea29a966dcba6a0bf1c0c9827ba24b00861.1315295093.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1315295093.git.Martin.Jansa@gmail.com>
References: <cover.1315295093.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][PATCH 3/6] imlib2: package also /usr/src/debug files to ${PN}-dbg
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
X-List-Received-Date: Tue, 06 Sep 2011 07:52:07 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/imlib2_svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/imlib2_svn.bb b/meta-efl/recipes-efl/efl/imlib2_svn.bb
index a2585e7..58fed9e 100644
--- a/meta-efl/recipes-efl/efl/imlib2_svn.bb
+++ b/meta-efl/recipes-efl/efl/imlib2_svn.bb
@@ -27,7 +27,7 @@ do_install_append() {
 
 PACKAGES =+ "imlib2-loaders-dbg imlib2-filters-dbg imlib2-loaders imlib2-filters"
 FILES_${PN} = "${libdir}/lib*.so.* ${libdir}/imlib2/*/*.so"
-FILES_${PN}-dbg = "${libdir}/.debug/ ${bindir}/.debug/"
+FILES_${PN}-dbg = "${libdir}/.debug/ ${bindir}/.debug/ ${prefix}/src/debug/"
 FILES_${PN}-dev += "${bindir}/imlib2-config ${libdir}/*.so ${includedir}"
 FILES_${PN}-bin = "${bindir}"
 FILES_imlib2-loaders = "${libdir}/imlib2/loaders/*.so"
-- 
1.7.6.1



