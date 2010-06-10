Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OMnmK-0005jy-6w
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jun 2010 21:51:05 +0200
Received: by fxm9 with SMTP id 9so257530fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jun 2010 12:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=DPtsQ26RKfqLZxcjIZ/Vgt6WUKhneIhoX3K9uxFqyqE=;
	b=ZjNuKZbZ5crmkqtMlKc/XU4/2e0b0lFbgz1c7LlskSRYffG2fmRRAFnrO12sCeajSw
	hhHgBODorLX3LX2lfI6lvDwlR7o/NKXDQc3lpncb0gKT1NG1HwdGA29vEP64EUpqbddO
	Dk/i11xtJBZYa36vFPEfIQFM386+Q4J1GCftg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=o2YzPyCxKQtErIIn7PbE5bFE0D7cZwYf/ewrDwJT/LeSUDSJogwbTMZi0Z9xEGh9jL
	WTKJ3RAwOYvGTEfo9AdROhopWsIedLuLoFroiUUeAVtMLbd3prdAKEE8EykQCakTzztW
	iWPPdUvrJZ5j0yY0+ip7t/vZPJbZdDW2CvTTk=
Received: by 10.223.65.18 with SMTP id g18mr863986fai.32.1276199201274;
	Thu, 10 Jun 2010 12:46:41 -0700 (PDT)
Received: from s42.loc (85-127-249-17.dynamic.xdsl-line.inode.at
	[85.127.249.17])
	by mx.google.com with ESMTPS id j23sm1401878faa.14.2010.06.10.12.46.39
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 10 Jun 2010 12:46:40 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OMniE-0008Ko-Bm; Thu, 10 Jun 2010 21:46:50 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: philb@gnu.org
Date: Thu, 10 Jun 2010 21:46:48 +0200
Message-Id: <1276199208-31929-2-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1276114963.4424.42.camel@lenovo.internal.reciva.com>
References: <1276114963.4424.42.camel@lenovo.internal.reciva.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/2] busybox: configure according to {MACHINE, DISTRO}_FEATURES
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
X-List-Received-Date: Thu, 10 Jun 2010 19:51:05 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/busybox/busybox-config.inc |   28 +++++++++++++++++++++++++
 recipes/busybox/busybox.inc        |   39 +++++++++++++++++++++++++++++++++++-
 2 files changed, 66 insertions(+), 1 deletions(-)
 create mode 100644 recipes/busybox/busybox-config.inc

diff --git a/recipes/busybox/busybox-config.inc b/recipes/busybox/busybox-config.inc
new file mode 100644
index 0000000..26ccec4
--- /dev/null
+++ b/recipes/busybox/busybox-config.inc
@@ -0,0 +1,28 @@
+# internal helper
+def busybox_cfg(feature, features, tokens, cnf, rem):
+	if type(tokens) == type(""):
+		tokens = [tokens]
+	rem.extend(['/^[# ]*' + token + '[ =]/d' for token in tokens])
+	if type(features) == type([]) and feature in features:
+		cnf.extend([token + '=y' for token in tokens])
+	else:
+		cnf.extend(['# ' + token + ' is not set' for token in tokens])
+# Map distro and machine features to config settings
+def features_to_busybox_settings(d):
+	cnf, rem = ([], [])
+	distro_features = bb.data.getVar('DISTRO_FEATURES', d).split()
+	machine_features = bb.data.getVar('MACHINE_FEATURES', d).split()
+	busybox_cfg('ipv6', distro_features, 'CONFIG_FEATURE_IPV6', cnf, rem)
+	busybox_cfg('largefile', distro_features, 'CONFIG_LFS', cnf, rem)
+	busybox_cfg('nls',  distro_features, 'CONFIG_LOCALE_SUPPORT', cnf, rem)
+	busybox_cfg('ipv4', distro_features, 'CONFIG_FEATURE_IFUPDOWN_IPV4', cnf, rem)
+	busybox_cfg('ipv6', distro_features, 'CONFIG_FEATURE_IFUPDOWN_IPV6', cnf, rem)
+	return "\n".join(cnf), "\n".join(rem)
+# X, Y = ${@features_to_uclibc_settings(d)}
+# unfortunately doesn't seem to work with bitbake, workaround:
+def features_to_busybox_conf(d):
+	cnf, rem = features_to_busybox_settings(d)
+	return cnf
+def features_to_busybox_del(d):
+	cnf, rem = features_to_busybox_settings(d)
+	return rem
diff --git a/recipes/busybox/busybox.inc b/recipes/busybox/busybox.inc
index f554478..827e917 100644
--- a/recipes/busybox/busybox.inc
+++ b/recipes/busybox/busybox.inc
@@ -11,7 +11,7 @@ LICENSE = "GPLv2"
 SECTION = "base"
 PRIORITY = "required"
 
-INC_PR = "r29"
+INC_PR = "r30"
 
 SRC_URI = "\
   file://busybox-cron \
@@ -70,10 +70,47 @@ RDEPENDS_${PN}-udhcpd += "${PN}"
 LD = "${CC} -nostdlib"
 
 inherit cml1 update-rc.d
+require busybox-config.inc
+
+configmangle = '/CROSS_COMPILER_PREFIX/d; \
+		/CONFIG_EXTRA_CFLAGS/d; \
+		'
+OE_FEATURES := "${@features_to_busybox_conf(d)}"
+OE_DEL      := "${@features_to_busybox_del(d)}"
+DO_IPv4 := ${@base_contains('DISTRO_FEATURES', 'ipv4', 1, 0, d)}
+DO_IPv6 := ${@base_contains('DISTRO_FEATURES', 'ipv6', 1, 0, d)}
+python () {
+  if "${OE_DEL}":
+    bb.data.setVar('configmangle_append', "${OE_DEL}" + "\n", d)
+  if "${OE_FEATURES}":
+    bb.data.setVar('configmangle_append',
+                   "/^### DISTRO FEATURES$/a\\\n%s\n\n" %
+                   ("\\n".join((bb.data.expand("${OE_FEATURES}", d).split("\n")))),
+                   d)
+  bb.data.setVar('configmangle_append',
+                 "/^### CROSS$/a\\\n%s\n" %
+                  ("\\n".join(["CONFIG_CROSS_COMPILER_PREFIX=\"${TARGET_PREFIX}\"",
+			       "CONFIG_EXTRA_CFLAGS=\"${CFLAGS}\""
+                        ])
+                  ),
+                 d)
+}
 
 do_configure () {
 	sed -e 's#@DATADIR@#${datadir}#g' \
 		< ${WORKDIR}/defconfig > ${S}/.config
+	for i in 'CROSS' 'DISTRO FEATURES'; do echo "### $i"; done >> \
+		${S}/.config
+	sed -i -e '${configmangle}' ${S}/.config
+	if test ${DO_IPv4} -eq 0 && test ${DO_IPv6} -eq 0; then
+	  # disable networking applets
+	  mv ${S}/.config ${S}/.config.oe-tmp
+	  awk 'BEGIN{net=0}
+	  /^# Networking Utilities/{net=1}
+	  /^#$/{if(net){net=net+1}}
+	  {if(net==2&&$0 !~ /^#/&&$1){print("# "$1" is not set")}else{print}}' \
+		  ${S}/.config.oe-tmp > ${S}/.config
+	fi
 	cml1_do_configure
 }
 
-- 
1.7.1



