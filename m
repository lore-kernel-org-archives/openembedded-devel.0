Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OWDxM-0002HR-Bz
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Jul 2010 21:37:32 +0200
Received: by fxm12 with SMTP id 12so5392329fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Jul 2010 12:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=nBGOR2JVCZ0KEMJSiyl4zNUHqhEVfT/8IMzDba8v6r8=;
	b=S2rdzWY01blf4M9T6AWeTmL1YvvCMhOFa7DCvh1XmYrgEsPxK4MQ8CaVFRyGlqyo1g
	0jiGm6fLO1iLUMb3mi9QItK5T+zenTiePCzVWhUzl5KMH3nNbeOZZqCUKuYY8XjHDi+2
	1fEt4WPh7VtEKuhseW8mOwJ8javV3c8S2VjvM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=VtdWdE/B+SWz3It4OhM5Uy+G1Gx5+MI8pXmC/pQBz0Qi8oIW7HLC2LlK7ebA9R/12C
	AhkKC7O8XNRk8uLz9EGaUqJ+SGWr3jpPgs+QGz+f7PTdWw6mWVs7H0PuWenS0P0KJljI
	pMhKvK00jIPRlCmSisoCM34deyGr1Vc1cTTYQ=
Received: by 10.86.63.10 with SMTP id l10mr4237498fga.47.1278444754125;
	Tue, 06 Jul 2010 12:32:34 -0700 (PDT)
Received: from s42.loc (85-127-92-50.dynamic.xdsl-line.inode.at [85.127.92.50])
	by mx.google.com with ESMTPS id q24sm12626441faa.42.2010.07.06.12.32.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 06 Jul 2010 12:32:33 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OWDsX-0001J7-7a; Tue, 06 Jul 2010 21:32:25 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Phil Blundell <philb@gnu.org>
Date: Tue,  6 Jul 2010 21:32:20 +0200
Message-Id: <1278444743-4924-2-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1278444743-4924-1-git-send-email-rep.dot.nop@gmail.com>
References: <1278444743-4924-1-git-send-email-rep.dot.nop@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH][v3 1/4] busybox: configure according to {MACHINE, DISTRO}_FEATURES
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
X-List-Received-Date: Tue, 06 Jul 2010 19:37:33 -0000
X-List-Received-Date: Tue, 06 Jul 2010 19:37:33 -0000
X-List-Received-Date: Tue, 06 Jul 2010 19:37:33 -0000
X-List-Received-Date: Tue, 06 Jul 2010 19:37:33 -0000
X-List-Received-Date: Tue, 06 Jul 2010 19:37:33 -0000
X-List-Received-Date: Tue, 06 Jul 2010 19:37:33 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/busybox/busybox-config.inc |   28 +++++++++++++++++++++++++++
 recipes/busybox/busybox.inc        |   37 ++++++++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+), 0 deletions(-)
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
index a5346bd..827e917 100644
--- a/recipes/busybox/busybox.inc
+++ b/recipes/busybox/busybox.inc
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



