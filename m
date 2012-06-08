Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1ScvrT-0004PX-0K
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jun 2012 11:52:07 +0200
Received: by mail-ey0-f175.google.com with SMTP id l1so982280eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jun 2012 02:41:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=o/wCudp46g10FBgWmGe4vdbNBskP622J/JvHr5g0xBY=;
	b=aEiQmAMS+ABaMdW9zuHURGbjK7JF7nzjZg2LLDekMhmLZ2P+6kVgI1oNTpj+B2hIWG
	uSGz79wn3eooojldCJudubLDQOaobEsNTf7P7gAgeNwihGh5SOAOpyO3u3bG+6/sWhdm
	HOVPGmdyzBXQSh2a1wBH5warI/eSzQCuYn2EuT2ravaYTmN2+patjDVJQGd/xtsUs16C
	39hzORfOWyTM61+ohGp6gaLQBeJMwTMb8o9YKYSe/U3Jz7hiwrMzbA/5Nmwpl2QvAFby
	k35eCDXG9A92pzPO8j8yJdLDQsU5SnNuPtHaVRSKDtgE061UIHwuqvhn47lD7b4B8KwK
	sHig==
Received: by 10.14.119.197 with SMTP id n45mr3350956eeh.204.1339148499701;
	Fri, 08 Jun 2012 02:41:39 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id y54sm20217236eef.10.2012.06.08.02.41.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jun 2012 02:41:38 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Jun 2012 11:40:41 +0200
Message-Id: <1339148443-9467-12-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1339148443-9467-1-git-send-email-koen@dominion.thruhere.net>
References: <1339148443-9467-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmrEHL15JSuxHqWh3c0SkZH098h9BMhxjhnk/K9Q0nntuWvYHGVuw69nyGdSiyGYsSI4TaF
Cc: Koen Kooi <koen@dominion.thruhere.net>, eric@eukrea.com
Subject: [for-denzil][meta-oe][PATCH 12/14] gateone: update to 1.1
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
X-List-Received-Date: Fri, 08 Jun 2012 09:52:07 -0000

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



