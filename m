Received: from mail-lb0-f177.google.com ([209.85.217.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <david.c.nystrom@gmail.com>) id 1U0Uft-0001Zl-6O
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jan 2013 11:13:49 +0100
Received: by mail-lb0-f177.google.com with SMTP id go11so1877760lbb.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2013 01:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=lNpxiaAKuJ/mjeEmY1UFKTmyJeu7dZqxMFctIeuylAI=;
	b=qvfkVNVrLlENTKHmJATSM/fW2zlMfBLDqX1Y63jM1hT5FZICFdLfIIeOxkzapQGTN1
	zHRE1V4z/JFh9M8d6HDjmv96N4GsPwOaUVTmGT5BDcaGfZ+V1gsbzaHrU7ysWDChRb7S
	RGHo2prq+U1YgVcIqjk6URoX5H6OI2NcNaAC7jHeeswa00au9EwanMxy5HnoHF08i9Z7
	Glpd+wgeHxjAuYiNs5xcyZoueFveJekcKJPDOjBtrjkgMfwUTaa6zN8giT4Tca5KAr7T
	K8XiwFmjZGEo3jcwbDbsdcMlxInSXoVlCgdvxqSOM8NqQLZAiVwUSv48Nnu/D+yN6KLR
	Z0TQ==
X-Received: by 10.152.131.168 with SMTP id on8mr3985131lab.38.1359539888119;
	Wed, 30 Jan 2013 01:58:08 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id gu8sm496031lab.6.2013.01.30.01.58.06
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 30 Jan 2013 01:58:07 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 1DA4C4001F4; Wed, 30 Jan 2013 10:58:00 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Jan 2013 10:57:58 +0100
Message-Id: <1359539878-8331-1-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: =?UTF-8?q?David=20Nystr=C3=B6m?= <david.nystrom@enea.com>
Subject: [meta-oe][PATCH] Upgrade of python-lxml to 2.3.5
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
X-List-Received-Date: Wed, 30 Jan 2013 10:13:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 .../{python-lxml_2.2.8.bb => python-lxml_2.3.5.bb} |   15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-devtools/python/{python-lxml_2.2.8.bb => python-lxml_2.3.5.bb} (69%)

diff --git a/meta-oe/recipes-devtools/python/python-lxml_2.2.8.bb b/meta-oe/recipes-devtools/python/python-lxml_2.3.5.bb
similarity index 69%
rename from meta-oe/recipes-devtools/python/python-lxml_2.2.8.bb
rename to meta-oe/recipes-devtools/python/python-lxml_2.3.5.bb
index a175609..76821ff 100644
--- a/meta-oe/recipes-devtools/python/python-lxml_2.2.8.bb
+++ b/meta-oe/recipes-devtools/python/python-lxml_2.3.5.bb
@@ -2,20 +2,21 @@ DESCRIPTION = "Powerful and Pythonic XML processing library combining \
 libxml2/libxslt with the ElementTree API."
 HOMEPAGE = "http://codespeak.net/lxml"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=7de92baeb3b7bfaebe72404155fdb346"
+LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=3638a580895ea734c2cbb46f586afd2c"
 SRCNAME = "lxml"
-PR = "r2"
+PR = "r0"
 
 DEPENDS = "libxml2 libxslt"
 RDEPENDS_${PN} += "libxml2 libxslt python-compression"
 
-SRC_URI = "http://pypi.python.org/packages/source/l/${SRCNAME}/${SRCNAME}-${PV}.tar.gz;name=lxml"
-SRC_URI[lxml.md5sum] = "d6c612d63a84d79440912a1b29d3b981"
-SRC_URI[lxml.sha256sum] = "89b73925b5e3295dcf4675cb948007a20eb029fe35c9a162ae19ec11f1abafe5"
+SRC_URI = "http://lxml.de/files/lxml-2.3.5.tgz \
+"
 
+SRC_URI[md5sum] = "d03fb3b9139df7f182afffe72f412c87"
+SRC_URI[sha256sum] = "7ec68de58814014543b3b6f21f36e3695359be715ad06348a14c7820dfa0e092"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-inherit setuptools
+inherit setuptools 
 
 DISTUTILS_BUILD_ARGS += " \
                      --with-xslt-config='${STAGING_BINDIR_NATIVE}/pkg-config libxslt' \
@@ -30,5 +31,3 @@ DISTUTILS_INSTALL_ARGS += " \
 BBCLASSEXTEND = "native nativesdk"
 RDEPENDS_${PN}_virtclass-native = "libxml2-native libxslt-native"
 
-
-
-- 
1.7.9.5



