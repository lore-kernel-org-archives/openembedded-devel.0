Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SAyRb-00063i-6S
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Mar 2012 07:57:51 +0100
Received: by wera1 with SMTP id a1so2429119wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2012 23:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=J/3rXo5b2Q/NyF/FsPy3AOWnwgeIsgU6eXiDTVOzLHc=;
	b=HgM7QldlmC107CprNUjh/qra637F4s74aL/xPhrIIbSLumW3RNr8HN/wPB9u+wFTz3
	Ni5tCfGrv/CH1pFZfNyzaXhrhp2yOVuSLsgoNyduunXd3EIVPWAk+LzI1TgZQSRiNdnI
	VKnTKfBmcW4+ydleHYyGbHZZYcV4Ze+7AWyXz5EdrU9CvZTxmZ+6Fq/+3p3JGVhQhskk
	jM7v3bcCjbeI7PtpQNgQKF4rgBSBYA3cvgsJxFip5vGRkFIgTTfSDcPu4zpOt5bAfRCB
	RMMpi3bmo8CS/H/tWzyjL36Dv+xf+WYyJAk1ULDAGT1Zk8nfBIQFUykBO9p5jPdlSCao
	YxAg==
Received: by 10.216.137.232 with SMTP id y82mr6214546wei.82.1332485335575;
	Thu, 22 Mar 2012 23:48:55 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o2sm19044435wiv.11.2012.03.22.23.48.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 23:48:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Mar 2012 07:48:42 +0100
Message-Id: <b388b7abc5e4bc0249d7a7025ef7df86682bb602.1332485253.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <c49db2c3482e38a5a2671b147a0a8dbcbcb5baa4.1332485253.git.Martin.Jansa@gmail.com>
References: <c49db2c3482e38a5a2671b147a0a8dbcbcb5baa4.1332485253.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1332485253.git.Martin.Jansa@gmail.com>
References: <cover.1332485253.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/3] kernel.bbclass: import QA warning fix for unpackaged files from oe-core
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
X-List-Received-Date: Fri, 23 Mar 2012 06:57:51 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/classes/kernel.bbclass |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
index c6fc197..cd36e55 100644
--- a/meta-oe/classes/kernel.bbclass
+++ b/meta-oe/classes/kernel.bbclass
@@ -110,6 +110,8 @@ kernel_do_install() {
 		oe_runmake DEPMOD=echo INSTALL_MOD_PATH="${D}" modules_install
 		rm -f "${D}/lib/modules/${KERNEL_VERSION}/modules.order"
 		rm -f "${D}/lib/modules/${KERNEL_VERSION}/modules.builtin"
+		rm "${D}/lib/modules/${KERNEL_VERSION}/build"
+		rm "${D}/lib/modules/${KERNEL_VERSION}/source"
 	else
 		bbnote "no modules to install"
 	fi
@@ -455,6 +457,14 @@ python populate_packages_prepend () {
 	do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.cis$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
 	do_split_packages(d, root='/lib/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='update-modules kernel-%s' % d.getVar("KERNEL_VERSION", True))
 
+	# If modutils and modprobe.d are empty at this point, remove them to
+	# avoid warnings. removedirs only raises an OSError if an empty
+	# directory cannot be removed.
+	dvar = d.getVar('PKGD', True)
+	for dir in ["%s/etc/modutils" % (dvar), "%s/etc/modprobe.d" % (dvar)]:
+		if len(os.listdir(dir)) == 0:
+			os.rmdir(dir)
+
 	import re
 	metapkg = "kernel-modules"
 	d.setVar('ALLOW_EMPTY_' + metapkg, "1")
-- 
1.7.8.5



