Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SX76h-0002Ff-5n
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 May 2012 10:39:47 +0200
Received: by eekd49 with SMTP id d49so2320405eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 May 2012 01:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=o/wCudp46g10FBgWmGe4vdbNBskP622J/JvHr5g0xBY=;
	b=cQZNJaLbox07h2FdiXN4jmXCfSTbTlwd/Ov34+rI0T+YFDArXbJDq2I+tQrDBDb5rY
	Arv4+o3pBCnJCdAGdn0ne8JGOMRYmZyFZKF2aYq7j8W8TwImJu3GwBN5O9oOF/u24L1N
	vLps2k/pHgJcwrCZP+zmJCeCBUyTvdHfpso7SDHqQOX9XbogWM+U/Wi79Rex20o9gSil
	IDTgNnQbUEjLrEGfo8VVqLwQsJa4Iw3lGAAn2WY2E5X0QTpjF1c5JbNFBztEVsf2hX0b
	uD1nW11cmkr2q/47F8cS2JRMEewnz8qD25LXWmusyB8N/zvphFaVj73/fDzhTk13OgRs
	DJBg==
Received: by 10.213.114.83 with SMTP id d19mr775751ebq.64.1337761777290;
	Wed, 23 May 2012 01:29:37 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id a16sm119496427eeg.0.2012.05.23.01.29.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 May 2012 01:29:36 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 May 2012 10:29:25 +0200
Message-Id: <1337761766-28429-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQltm28KDf3emZYR0fbqidQjc8AjLfGY0opkhvyj3RQqHylXZaeqzQHwayzl4ypxVxpvknX+
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 1/2] gateone: update to 1.1
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
X-List-Received-Date: Wed, 23 May 2012 08:39:47 -0000

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



