Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PozV7-0008Ve-Cg
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 15:34:05 +0100
Received: by eya28 with SMTP id 28so2040278eya.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Feb 2011 06:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=XdcVHvT29VIZzdKP89QT6Ub0/PodlekvNrVhYGONMqA=;
	b=X1KOfyKKGN4Fv71qGvw5iuK9a/ZCdtr/0T/tyd4RiAyROfU6zTjwu87MnNvZErwyqw
	wX1rajQ/9Jw5j//up9S+COMr+jb/IWCX55vWMUa6N86QGQzMti4NemuVVS7odRzHq8C/
	4NbaGgdl1S6D0PxsurI6my24x5144ts9q429E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=RNRWnRTO6z73bzlclrxSw322l4K5+MmkeI5cCXN6VmgToMPXcv4mNJ06AMoUWJiFvr
	cxPG0uldsOJA/hHIZhQvXwv8RXdBk7wXC+NNAU61HQMaHLN8JAgYZtSwEEBppyeGNYjK
	IgxDQ8fD3hiAdWpwC+K42dZCKO5njc8i+eedA=
Received: by 10.204.102.19 with SMTP id e19mr3463434bko.35.1297693973471;
	Mon, 14 Feb 2011 06:32:53 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id z18sm1819152bkf.8.2011.02.14.06.32.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Feb 2011 06:32:52 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Feb 2011 15:32:35 +0100
Message-Id: <1297693958-25388-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1297693958-25388-1-git-send-email-Martin.Jansa@gmail.com>
References: <1297693958-25388-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/5] python: merge few s/python/${PN}/g from poky
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
X-List-Received-Date: Mon, 14 Feb 2011 14:34:05 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/python/python_2.6.6.bb |   24 ++++++++++++------------
 1 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/recipes/python/python_2.6.6.bb b/recipes/python/python_2.6.6.bb
index 4152554..a4d118d 100644
--- a/recipes/python/python_2.6.6.bb
+++ b/recipes/python/python_2.6.6.bb
@@ -92,18 +92,18 @@ do_install_append() {
 require python-${PYTHON_MAJMIN}-manifest.inc
 
 # manual dependency additions
-RPROVIDES_python-core = "python"
-RRECOMMENDS_python-core = "python-readline"
-RRECOMMENDS_python-crypt = "openssl"
+RPROVIDES_${PN}-core = "${PN}"
+RRECOMMENDS_${PN}-core = "${PN}-readline"
+RRECOMMENDS_${PN}-crypt = "openssl"
 
 # add sitecustomize
-FILES_python-core += "${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py"
+FILES_${PN}-core += "${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py"
 # ship 2to3
-FILES_python-core += "${bindir}/2to3"
+FILES_${PN}-core += "${bindir}/2to3"
 
 # package libpython2
-PACKAGES =+ "libpython2"
-FILES_libpython2 = "${libdir}/libpython*.so.*"
+PACKAGES =+ "lib${PN}2"
+FILES_lib${PN}2 = "${libdir}/libpython*.so.*"
 
 # additional stuff -dev
 
@@ -121,12 +121,12 @@ FILES_${PN}-dev += "\
 "
 
 # catch debug extensions (isn't that already in python-core-dbg?)
-FILES_python-dbg += "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/.debug"
+FILES_${PN}-dbg += "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/.debug"
 
 # catch all the rest (unsorted)
-PACKAGES += "python-misc"
-FILES_python-misc = "${libdir}/python${PYTHON_MAJMIN}"
+PACKAGES += "${PN}-misc"
+FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN}"
 
 # catch manpage
-PACKAGES += "python-man"
-FILES_python-man = "${datadir}/man"
+PACKAGES += "${PN}-man"
+FILES_${PN}-man = "${datadir}/man"
-- 
1.7.4.1



