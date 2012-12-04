Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi24-00024s-PO
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:14:49 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1925797eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=7cit26Y4ixpa2aL5lmbopFkPkinIwuSSmZv/S6d7mek=;
	b=wwQZkkp3mFpxAloIst4WDQvA+qjd7/jf2OoPJx4w9oGKkizIx1fWPk3w3/CE3CXzjJ
	YmA/cTwtbYzyKTNviA02H+P2DDJYWCwxOpWiXh9Q0Mijqvv2yUCcsNNZU3KYP68o8jNB
	fQvAemDVZcCFRoRVjBmv6Dti1cDUz+w0lLZUMVTFmJm1qkuVljOIPVqRRzi2/2rlvt64
	02RlBxpJIRIt4zsIAwn4PuETWtkicnauqgq184gIYEByamiB3Z8gw/OnEsle1y5JZvbi
	yUViollwXNhe40h/tNk7fjUBy1+iLXRrjbUkYW/rxXPzL2B6NB1ino5R6POBp0OQyrrj
	T1WQ==
Received: by 10.14.214.132 with SMTP id c4mr42778083eep.18.1354586427143;
	Mon, 03 Dec 2012 18:00:27 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z8sm34789174eeo.11.2012.12.03.18.00.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:00:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:58:39 +0100
Message-Id: <d9b4e63046450c38209d8f3a5556db66760200f3.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 06/58] pyrtm: import from OE-Classic
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
X-List-Received-Date: Tue, 04 Dec 2012 02:14:50 -0000

* needed for rtmom
* add LIC_FILES_CHKSUM

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/python/pyrtm_0.2.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/python/pyrtm_0.2.bb

diff --git a/meta-oe/recipes-devtools/python/pyrtm_0.2.bb b/meta-oe/recipes-devtools/python/pyrtm_0.2.bb
new file mode 100644
index 0000000..0cc5e8e
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/pyrtm_0.2.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Python interface for Remember The Milk API."
+AUTHOR = "Sridhar Ratnakumar / srid"
+HOMEPAGE = "http://pypi.python.org/pypi/pyrtm"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=a53cbc7cb75660694e138ba973c148df"
+DEPENDS = "python-native"
+
+inherit distutils
+
+SRC_URI = "http://pypi.python.org/packages/source/p/${PN}/${P}.tar.gz"
+SRC_URI[md5sum] = "34423f39caf7df8a9db8e243be9cf1a0"
+SRC_URI[sha256sum] = "d9d46d096a38cb692b55f4ee9f364d54348298e9497b11c1ef057539b5de1567"
-- 
1.8.0



