Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rd0NT-00044O-42
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Dec 2011 15:09:11 +0100
Received: by mail-ee0-f47.google.com with SMTP id t10so2604639eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2011 06:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=NwdrDnTN6Pq5HRFUiXxgg6Qab8pgOo+5ba29KkCoaoE=;
	b=EAktWSNHk9tKyw6UwfsI8x4ujimQsWofSSK1QhfmBSAcCANOnHvKXVW1Srn5REzXyj
	TK3bXyy+QZwpyxDKOb9AiB4oazDEFXlSwFRVdByuhpJoGadJNNYJvBYHRYdQhoShrxvG
	PJzzBAMO16qjygpfwP3CdxYa3At5oWxPdUU/0=
Received: by 10.14.50.145 with SMTP id z17mr981496eeb.104.1324389729030;
	Tue, 20 Dec 2011 06:02:09 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a60sm7175962eeb.4.2011.12.20.06.02.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Dec 2011 06:02:08 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Dec 2011 15:01:16 +0100
Message-Id: <89fc3c7f28f6e4d2dc1fcbe760db8c8fdc229dc3.1324389403.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <458f724d9bdb716b6907ea797a92fe0f67f1f72b.1324389403.git.Martin.Jansa@gmail.com>
References: <458f724d9bdb716b6907ea797a92fe0f67f1f72b.1324389403.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1324389403.git.Martin.Jansa@gmail.com>
References: <cover.1324389403.git.Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe][meta-efl 7/7] midori: upgrade from 0.4.2 to 0.4.3
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
X-List-Received-Date: Tue, 20 Dec 2011 14:09:11 -0000

* only build tested, it does segfault in runtime but it's the same with
  previous 0.4.2 version and probably not caused by midori itself

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../midori/{midori_0.4.2.bb => midori_0.4.3.bb}    |    9 ++-------
 1 files changed, 2 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-connectivity/midori/{midori_0.4.2.bb => midori_0.4.3.bb} (54%)

diff --git a/meta-oe/recipes-connectivity/midori/midori_0.4.2.bb b/meta-oe/recipes-connectivity/midori/midori_0.4.3.bb
similarity index 54%
rename from meta-oe/recipes-connectivity/midori/midori_0.4.2.bb
rename to meta-oe/recipes-connectivity/midori/midori_0.4.3.bb
index 10109e6..2be8274 100644
--- a/meta-oe/recipes-connectivity/midori/midori_0.4.2.bb
+++ b/meta-oe/recipes-connectivity/midori/midori_0.4.3.bb
@@ -1,16 +1,11 @@
 require midori.inc
 
-PR = "r2"
-
 SRC_URI = "http://archive.xfce.org/src/apps/midori/0.4/midori-${PV}.tar.bz2;name=midori \
            file://waf \
           "
+SRC_URI[midori.md5sum] = "900037557b82818d79d2dd1c5a7d7fd2"
+SRC_URI[midori.sha256sum] = "fca4a0eab03358f20d7700069dbf2faaf8fa5c11aaad97f4208aea608f4bed9f"
 
 do_configure_prepend() {
   cp -f ${WORKDIR}/waf ${S}/
 }
-
-SRC_URI[midori.md5sum] = "4ec9c3daa332ebe865cba6aa8256ef63"
-SRC_URI[midori.sha256sum] = "2e3f104254fb9a28c77e8acf1cc8ae6dd529499711d558b29146ab0fa915f0a7"
-
-
-- 
1.7.8



