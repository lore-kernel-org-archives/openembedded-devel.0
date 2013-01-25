Received: from mail-ee0-f51.google.com ([74.125.83.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TyryR-0007dp-BO
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jan 2013 23:42:15 +0100
Received: by mail-ee0-f51.google.com with SMTP id d17so429454eek.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2013 14:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=buweO1tt6ydHqYezQzoJyta9Tt5LR7kp0U8Np4mcc98=;
	b=K4ftjA1DloZpb5iaTIJS2ZnPigOG13gmu3qMbdbXxLSfqRUuExQ64bU8pBLEL2PGhM
	xLcY2dXwISmxf6E/ZN9EJ9odUVrK74fMan1wykWMmr9z+O/fxEtZtefktmdxGQF3TD4d
	wpGScYrl9mx4wo3kBEgUsM0AVLza3OGGucZBI50yMnIRbZQlFxkhWEk36NVSc5aHXfiF
	+26+u9iIQFKO0l8x5N7wD9ePCnSvEvmszhZsFJPOJoQDzAKgn60qs9OZecOgyOLYuyrg
	vY373skIbj6igzN6SmFLpQ6fGZBmFESraFKC9XopghBn1EkYRoRbWp2w8HAMqnOEguJ5
	7Hjg==
X-Received: by 10.14.215.6 with SMTP id d6mr22485578eep.40.1359152800811;
	Fri, 25 Jan 2013 14:26:40 -0800 (PST)
Received: from localhost.localdomain (p5B0A1952.dip.t-dialin.net.
	[91.10.25.82])
	by mx.google.com with ESMTPS id k4sm3566723eep.15.2013.01.25.14.26.39
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 14:26:40 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Jan 2013 23:26:21 +0100
Message-Id: <1359152782-23743-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1359152782-23743-1-git-send-email-schnitzeltony@googlemail.com>
References: <1359152782-23743-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-systemd/V2 4/5] geany: initial add 1.22
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
X-List-Received-Date: Fri, 25 Jan 2013 22:42:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-devtools/geany/geany_1.22.bb |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/geany/geany_1.22.bb

diff --git a/meta-oe/recipes-devtools/geany/geany_1.22.bb b/meta-oe/recipes-devtools/geany/geany_1.22.bb
new file mode 100644
index 0000000..1e56ec8
--- /dev/null
+++ b/meta-oe/recipes-devtools/geany/geany_1.22.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "A fast and lightweight IDE"
+HOMEPAGE = "http://www.geany.org/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c107cf754550e65755c42985a5d4e9c9"
+DEPENDS = "gtk+"
+
+inherit autotools pkgconfig
+
+SRC_URI = "http://download.geany.org/${PN}-${PV}.tar.bz2"
+SRC_URI[md5sum] = "0672077fe83e2a739aa0eaca426aacf0"
+SRC_URI[sha256sum] = "901a35a7395ef10a80fb10b3ab63bae3871693a4e82d56388e9521a27877577e"
+
+FILES_${PN} += "${datadir}/icons"
-- 
1.7.4.4



