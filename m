Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RFwp6-0007ET-0m
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 01:42:27 +0200
Received: by mail-bw0-f47.google.com with SMTP id t8so85760bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Oct 2011 16:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=nUFgkppM1CuV3J6RsFlZVDLzU/G938fSAKJ22nxrm3E=;
	b=jJvCIoSqx7WlHM26Rq0NRxX/Ns3FJl6ppX4DI/hdnD6M+oAF9g1AqAVXs/2GtBAi9E
	JakVftU9tJVIP88kXxa5VEAwOsM5Z8266KyKZW9zk34NQK3TGcuIl0ozwb0MrxQ4QP1E
	rDrF9CRShN8o4xyAFkq6M9EaKqZFkG0FSLd+M=
Received: by 10.223.76.201 with SMTP id d9mr4023fak.12.1318894597116;
	Mon, 17 Oct 2011 16:36:37 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v17sm163815fai.18.2011.10.17.16.36.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Oct 2011 16:36:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Oct 2011 01:35:28 +0200
Message-Id: <a44535822b80285792c5d2567bfa89246eb1f396.1318894479.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <1ab4e30380da2444cfc66fe5283beb83168964a7.1318894479.git.Martin.Jansa@gmail.com>
References: <1ab4e30380da2444cfc66fe5283beb83168964a7.1318894479.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318894479.git.Martin.Jansa@gmail.com>
References: <cover.1318894479.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][meta-gnome 09/10] wv: add SRC_URI checksums and drop deprecated patch=1 param
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
X-List-Received-Date: Mon, 17 Oct 2011 23:42:27 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/wv/wv_1.2.0.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-gnome/recipes-gnome/wv/wv_1.2.0.bb b/meta-gnome/recipes-gnome/wv/wv_1.2.0.bb
index cef7660..b20a556 100644
--- a/meta-gnome/recipes-gnome/wv/wv_1.2.0.bb
+++ b/meta-gnome/recipes-gnome/wv/wv_1.2.0.bb
@@ -7,7 +7,9 @@ DEPENDS = "libgsf glib-2.0"
 PR = "r3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/wvware/wv-${PV}.tar.gz \
-           file://pkgconfig.patch;patch=1"
+           file://pkgconfig.patch"
+SRC_URI[md5sum] = "b6319d5e75611fe2210453b5feb82c0c"
+SRC_URI[sha256sum] = "a76f44468e78591e6d510d326702e7c3999d2b9dd3ab8ab8c1c9811fd5b111e4"
 
 inherit autotools pkgconfig
 
-- 
1.7.7



