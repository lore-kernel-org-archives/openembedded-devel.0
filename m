Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Spc6d-0006Vo-0O
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 11:24:11 +0200
Received: by mail-ee0-f47.google.com with SMTP id t10so352488eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 02:12:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=o/wCudp46g10FBgWmGe4vdbNBskP622J/JvHr5g0xBY=;
	b=SsY7stlKLU/GKsJ21Cx/FD0KGLaKz0ojDFFJ8VeHzQFTymv4Ip8EYZYPECihe25Iz+
	R0feGypeWt9yV6zcR/xRJIkiMYEMnp+88DElYiRF1NKICgNSaOilZtXMT4Wr8wYRyVD+
	DqfPwpPv57aW0nUUaR12gS9NUurgz/YCXKGqG6OaxwLQPXm1sa6C3YgjF1mTE6Ql74rx
	usw40l1n7bnPw3LZaek+pkjbJSZVRPxajx9flEzWpa48jawkjmMrpnbKhhL+na2ArniD
	m+9vQdV81sEakFcSFiXhjhlclm7q64oQ6dFfA8lfohfOJ8b3qrEPQR5GNfTJmMX4p+Ll
	Whfg==
Received: by 10.14.45.10 with SMTP id o10mr77336eeb.166.1342170779071;
	Fri, 13 Jul 2012 02:12:59 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id y54sm23166886eef.10.2012.07.13.02.12.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 02:12:57 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 11:11:58 +0200
Message-Id: <1342170730-14982-12-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1342170730-14982-1-git-send-email-koen@dominion.thruhere.net>
References: <1342170730-14982-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQn25oAk6RH8pCUn1PElQ6C77gnsXbse+HgCfkhGhGzpoX2pE1fyoz2ppG+kCxDWHj8inA7c
Cc: Koen Kooi <koen@dominion.thruhere.net>, eric@eukrea.com
Subject: [for-denzil][meta-oe 12/24] gateone: update to 1.1
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
X-List-Received-Date: Fri, 13 Jul 2012 09:24:11 -0000

Sort RDEPENDS alphabetically as well.

Based on https://github.com/liftoff/meta-oe/commit/9cb653845d7bb4416d2e8e6c5a09a54e08dd7578 by Dan McDougall

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../recipes-connectivity/gateone/gateone_git.bb    |   45 +++++++++++---------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/meta-oe/recipes-connectivity/gateone/gateone_git.bb b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
index 983dc24..bfb3274 100644
--- a/meta-oe/recipes-connectivity/gateone/gateone_git.bb
+++ b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "HTML5 (plugin-free) web-based terminal emulator and SSH client"
 LICENSE = "AGPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ee5b168fc7de89a0cadc49e27830aa2c"
 
-PR = "r1"
+PR = "r4"
 
-PV = "1.0"
-SRCREV = "0dfa4196ca514e075199c0dbf849353c6aa2976b"
+PV = "1.1"
+SRCREV = "bb74e1095adb66b04b51ed6ff10ae0aa96afdd46"
 SRC_URI = "git://github.com/liftoff/GateOne.git \
            file://gateone-avahi.service \
            file://gateone.service \
@@ -29,28 +29,33 @@ SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE = "gateone.service"
 
 FILES_${PN} = "${localstatedir}/lib ${localstatedir}/log ${base_libdir} ${sysconfdir}"
-RDEPENDS_${PN} = "python-tornado \
-                  python-datetime \
-                  python-shell \
-                  python-subprocess \
-                  python-terminal \
-                  python-io \
+RDEPENDS_${PN} = "file \
+                  mime-support \
+                  openssh-ssh \
                   python-compression \
-                  python-syslog \
-                  python-misc \
                   python-crypt \
-                  python-netclient \
+                  python-datetime \
                   python-email \
+                  python-fcntl \
                   python-html \
-                  python-textutils \
-                  python-pyopenssl \
-                  findutils \
-                  python-simplejson \
+                  python-imaging \
+                  python-io \
+                  python-json \
+                  python-logging \
+                  python-misc \
                   python-multiprocessing \
+                  python-netclient \
                   python-pkgutil \
-                  python-imaging \
+                  python-pyopenssl \
+                  python-re \
+                  python-readline \
+                  python-shell \
+                  python-simplejson \
+                  python-subprocess \
+                  python-syslog \
+                  python-terminal \
+                  python-textutils \
+                  python-tornado \
+                  python-unixadmin \
                   python-xml \
-                  file \
-                  openssh-ssh \
-                  mime-support \
                  "
-- 
1.7.10



