Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S1mCo-00045I-DJ
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Feb 2012 23:04:34 +0100
Received: by eekc1 with SMTP id c1so211326eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Feb 2012 13:56:09 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.13.212 as permitted sender) client-ip=10.213.13.212; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.13.212 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.13.212])
	by 10.213.13.212 with SMTP id d20mr3276027eba.99.1330293369309
	(num_hops = 1); Sun, 26 Feb 2012 13:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=hatAsxEasLHIPFOGxMtFX2TlCLFtu2PKussSpDXXc6o=;
	b=UJ9JAdAq1xsPjJcjMLTEclTw6cA7qQe1jv+SGHvg++1XK+7yECAx6QK8gxOCyvqXa+
	p+7OJtN5j1V2nqSNPHfWHUj7KUTGESsKQFYqhzDDhDuY++nYTi3I8ithXjVXKrDJZj1Y
	w+EpEbzaIIA/8uuMoMuUe3LWZQT8vXoEVWEHs=
Received: by 10.213.13.212 with SMTP id d20mr2441897eba.99.1330293368964;
	Sun, 26 Feb 2012 13:56:08 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n52sm50003573eea.5.2012.02.26.13.56.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 26 Feb 2012 13:56:08 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 26 Feb 2012 22:55:59 +0100
Message-Id: <1330293360-14909-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
Subject: [meta-oe][PATCH 1/2] lua5: drop unused NATIVE_INSTALL_WORKS without quotes too
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
X-List-Received-Date: Sun, 26 Feb 2012 22:04:34 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/lua/lua5.1_5.1.4.bb |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-devtools/lua/lua5.1_5.1.4.bb b/meta-oe/recipes-devtools/lua/lua5.1_5.1.4.bb
index 5591c4c..eca7755 100644
--- a/meta-oe/recipes-devtools/lua/lua5.1_5.1.4.bb
+++ b/meta-oe/recipes-devtools/lua/lua5.1_5.1.4.bb
@@ -39,7 +39,6 @@ do_install () {
 	install -d ${D}${libdir}/pkgconfig
 	install -m 0644 ${WORKDIR}/lua5.1.pc ${D}${libdir}/pkgconfig/lua5.1.pc
 }
-NATIVE_INSTALL_WORKS = 1
 BBCLASSEXTEND = "native"
 
 SRC_URI[md5sum] = "d0870f2de55d59c1c8419f36e8fac150"
-- 
1.7.8.4



