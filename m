Received: from mail-ee0-f45.google.com ([74.125.83.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UKwKR-0003T0-P5
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Mar 2013 20:48:21 +0100
Received: by mail-ee0-f45.google.com with SMTP id b57so4417427eek.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2013 12:31:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=ZM74SfDzpIffJ9qebWjVeBzQdhQZLZwfybdhgh7bDDQ=;
	b=VszOgBwiCscaxav2YxHnJ89FZO6eGcKjFU0C4nwTfvNuFYA0VmZYd2PhyfPgszwzI1
	4cGmvSk7RBIreIXMdVxxYzplf8aWxElKTqts0RR0F3Y2oF0Pnn4NYNYFC8N0O1avFp/j
	XZpTpb/YuaBpBmfO/2NHOmKBC0z3fVnQ1tQ8gR74U5KDGuTdAeFdmYLUbgE1csML2+46
	vzWrx+olyqxpjdASgx1GG661qSEyaIbLS7/sMxqYyx/KWbFiOkRHmWj4sNCBZusGDxgx
	1oK4hV4+MXUGY5fF+/ozL+ngmHO+bOd/t9A+612FZRWbmpfO8f1FbAlexNQkQZoIGtv6
	7c9A==
X-Received: by 10.14.207.200 with SMTP id n48mr30953224eeo.4.1364412670202;
	Wed, 27 Mar 2013 12:31:10 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id ca4sm33282353eeb.15.2013.03.27.12.31.08
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 27 Mar 2013 12:31:09 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Mar 2013 20:31:02 +0100
Message-Id: <1364412662-4159-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
X-Gm-Message-State: ALoCoQk01owp2FaQ8bJ0+raNbqZRbdYM1mRovG52rMT9fWBg+HLscJa6Qpe5/lsrdkh33yMQA7JH
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCHv2] multipath-tools: add recipe for git version
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
X-List-Received-Date: Wed, 27 Mar 2013 19:48:34 -0000

Multipath-tools hasn't seen a release in 3 years, so grab latest git.

'kpartx' is subpackaged since that's the tool most people want.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../multipath-tools/multipath-tools_git.bb         | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 recipes-support/multipath-tools/multipath-tools_git.bb

diff --git a/recipes-support/multipath-tools/multipath-tools_git.bb b/recipes-support/multipath-tools/multipath-tools_git.bb
new file mode 100644
index 0000000..808bc28
--- /dev/null
+++ b/recipes-support/multipath-tools/multipath-tools_git.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "The upstream project used to drive the Device Mapper multipathing driver."
+
+DEPENDS = "lvm2 libaio readline"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7be2873b6270e45abacc503abbe2aa3d"
+
+
+SRC_URI = "git://git.opensvc.com/multipath-tools/.git;protocol=http"
+SRCREV = "15fc23ffb2bd1bac6990eda3e23c3e8980e6cfa5"
+
+S = "${WORKDIR}/git"
+
+PV = "0.4.9+git"
+
+EXTRA_OEMAKE = "MULTIPATH_VERSION=${PV} DESTDIR=${D} syslibdir=${base_libdir} libdir=${base_libdir}/multipath"
+
+do_install() {
+	oe_runmake install
+}
+
+FILES_${PN}-dbg += "${base_libdir}/multipath/.debug"
+FILES_${PN} += "${base_libdir}/multipath \
+                ${base_libdir}/systemd"
+
+PACKAGES =+ "kpartx"
+FILES_kpartx = "${base_sbindir}/kpartx \
+                ${base_libdir}/udev/kpartx_id"
+
+RDEPENDS_${PN} += "kpartx"
-- 
1.8.1.4



