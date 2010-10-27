Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PB297-00008W-Ks
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Oct 2010 11:18:14 +0200
Received: by bwz10 with SMTP id 10so338699bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Oct 2010 02:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=qxeyoArEhgdsPptg+Et8ItJZfAfA25iAyvn9P1sb4WI=;
	b=ImNHyHOEip+aAXKsKiXnVIZo1TMnLi3OYh1ohlUnm0YucyZ4Qm8yhWJ5HMxHmzFwqJ
	cKSJ+80GEZS7QMDXj+76645mmXRLt++02K0PeLkAUlvEuXKYuBf1Aj2ukDK4fSvL+32x
	ROoAdUopfPDwh0ODpgg9SdG71MXGQ9JDD4fCA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=LNMj3ZMSHnZOQZ92Wa/+roizszIiZLUVvL6sNDTq2r75ad6niqDsA2iODHFAzs8yFO
	kGtYJvmOl8sW1eT2Vk8MWBQKDqaPVz1JoAAv0qv1KOZ6mNN63yheiSsGyAtceTDerheW
	f18xIy2Dnq4eYKFBs8KeLHpCoPiFblzuc6fOM=
Received: by 10.204.84.144 with SMTP id j16mr7179614bkl.92.1288171052369;
	Wed, 27 Oct 2010 02:17:32 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id p22sm5997742bkp.9.2010.10.27.02.17.31
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 27 Oct 2010 02:17:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Oct 2010 11:17:29 +0200
Message-Id: <1288171049-2692-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.1
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] efl.bbclass: improve packaging a bit
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
X-List-Received-Date: Wed, 27 Oct 2010 09:18:14 -0000

* include dbus service config if available
* include plugins from //plugins/ (ie from ethumb)
* include edje modules (ie from emotion)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 classes/efl.bbclass        |   14 +++++++++++---
 recipes/efl1/ethumb_svn.bb |    2 --
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/classes/efl.bbclass b/classes/efl.bbclass
index 1433457..f148e9c 100644
--- a/classes/efl.bbclass
+++ b/classes/efl.bbclass
@@ -29,10 +29,16 @@ do_install_prepend () {
 # This construction is stupid, someone with more E knowledge should change it to =+ or something
 PACKAGES = "${PN}-dbg ${PN} ${PN}-themes ${PN}-dev ${PN}-doc ${PN}-tests ${PN}-static"
 
-FILES_${PN} = "${libdir}/*.so.*"
+FILES_${PN} = "${libdir}/*.so.* \
+               ${libdir}/edje/modules/${PN}/*/module.so \
+               ${libdir}/${PN}/plugins/*.so \
+               ${datadir}/dbus-1/services/* \
+"
+
 
 FILES_${PN}-themes = "${datadir}/${PN}/themes \
                       ${datadir}/${PN}/data \
+                      ${libdir}/${PN}/plugins/data/*.edj \
                       ${datadir}/${PN}/fonts \
                       ${datadir}/${PN}/pointers \
                       ${datadir}/${PN}/images \
@@ -47,6 +53,7 @@ FILES_${PN}-dev   += "${bindir}/${PN}-config \
                       ${libdir}/${PN}/*.la \
                       ${libdir}/${PN}/*/*.la \
                       ${datadir}/${PN}/edje_externals \
+                      ${libdir}/edje/modules/${PN}/*/module.la \
 "
 
 FILES_${PN}-static += "${libdir}/${PN}/*.a \
@@ -54,9 +61,10 @@ FILES_${PN}-static += "${libdir}/${PN}/*.a \
 "
 
 FILES_${PN}-dbg +=   "${libdir}/${PN}/.debug \
-                      ${libdir}/${PN}/*/.debug"
+                      ${libdir}/${PN}/*/.debug \
+                      ${libdir}/edje/modules/${PN}/*/.debug/module.so \
+"
 
 FILES_${PN}-tests  = "${bindir}/${PN} \
                       ${bindir}/*_* \
                       ${datadir}"
-
diff --git a/recipes/efl1/ethumb_svn.bb b/recipes/efl1/ethumb_svn.bb
index f958bd4..9d3e65b 100644
--- a/recipes/efl1/ethumb_svn.bb
+++ b/recipes/efl1/ethumb_svn.bb
@@ -20,6 +20,4 @@ AUTO_LIBNAME_PKGS = ""
 FILES_${PN} += "\
     ${bindir}/ethumbd \
     ${libexecdir}/ethumbd_slave \
-    ${libdir}/plugins/*.so \
-    ${libdir}/plugins/data/*.edj \
 "
-- 
1.7.3.1



