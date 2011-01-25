Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PhcMK-000580-15
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 07:26:32 +0100
Received: by pzk12 with SMTP id 12so937136pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jan 2011 22:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=FI90MKNTOU9EZXDbpQmRIMdzIHWmnDdnhsWbmp7jeAQ=;
	b=j0bZeWG5gOJzAOnfpmWOSHFKfYcjDL3bNIiq666v/7Pr1sQk76khnusFvkFX494+UQ
	do23kO1cmgtKRboQkBCj2LG77jjDEZthJaGgBM22G5qfggPHDMAap3sPn5Y8+vgIjaVv
	8hnBl7eS3n42dxlSL0cx3b9D0m/ePiNaJMZp4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=QyxxXtFiNslTGG1QzfMKA7Futd5D8VhBkmrHR0XeJU0Av07utKsRAV5ybWpekf3bEu
	kvBeT1O/pbC7Qss/iQt8SaUjr/HfMXDVcHqb7voXeOa3ecpuGuO26/oMtTF7KG0i3phl
	l2O7Zfp2sFHIdpqiPL101Hazs0yfFfTuCBa7I=
Received: by 10.143.9.3 with SMTP id m3mr3236345wfi.381.1295936745264;
	Mon, 24 Jan 2011 22:25:45 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id x18sm18429417wfa.23.2011.01.24.22.25.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 24 Jan 2011 22:25:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jan 2011 22:25:37 -0800
Message-Id: <1295936745-718-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1295936745-718-1-git-send-email-raj.khem@gmail.com>
References: <1295936745-718-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 1/9] classes/package_ipk.bbclass, classes/sourceipk.bbclass: Use opkg-utils-native instead of ipkg-utils-native
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
X-List-Received-Date: Tue, 25 Jan 2011 06:26:32 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/package_ipk.bbclass |    4 ++--
 classes/sourceipk.bbclass   |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/classes/package_ipk.bbclass b/classes/package_ipk.bbclass
index 97e5cd8..fea678d 100644
--- a/classes/package_ipk.bbclass
+++ b/classes/package_ipk.bbclass
@@ -70,7 +70,7 @@ do_package_update_index_ipk[lockfiles] = "${DEPLOY_DIR_IPK}.lock"
 do_package_update_index_ipk[nostamp] = "1"
 do_package_update_index_ipk[recrdeptask] += "do_package_write_ipk"
 do_package_update_index_ipk[recrdeptask] += "do_package_write_ipk"
-do_package_update_index_ipk[depends] += "ipkg-utils-native:do_populate_sysroot"
+do_package_update_index_ipk[depends] += "opkg-utils-native:do_populate_sysroot"
 
 #
 # Update the Packages index files in ${DEPLOY_DIR_IPK}
@@ -315,7 +315,7 @@ python do_package_ipk () {
 python () {
     if bb.data.getVar('PACKAGES', d, True) != '':
         deps = (bb.data.getVarFlag('do_package_write_ipk', 'depends', d) or "").split()
-        deps.append('ipkg-utils-native:do_populate_sysroot')
+        deps.append('opkg-utils-native:do_populate_sysroot')
         deps.append('fakeroot-native:do_populate_sysroot')
         bb.data.setVarFlag('do_package_write_ipk', 'depends', " ".join(deps), d)
 }
diff --git a/classes/sourceipk.bbclass b/classes/sourceipk.bbclass
index 17a7cdd..b443ef6 100644
--- a/classes/sourceipk.bbclass
+++ b/classes/sourceipk.bbclass
@@ -34,9 +34,9 @@
 # Need to figure out how to use ipkg-build in this class.
 # I tried adding it as a dependency for the do_create_srcipk
 # task using:
-#   do_create_srcipk[depends] += "ipkg-utils-native:do_populate_sysroot"
+#   do_create_srcipk[depends] += "opkg-utils-native:do_populate_sysroot"
 # But then there is a circular dependency between sourcipk.bbclass and
-# ipkg-utils-native.  Until I can figure out how to resolve this
+# opkg-utils-native.  Until I can figure out how to resolve this
 # circular dependency I am extracting the needed pieces from ipkg-build
 # into this class and building the source ipk myself.
 
-- 
1.7.0.4



