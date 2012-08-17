Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T2HN2-0004su-3A
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Aug 2012 09:53:28 +0200
Received: by weyr6 with SMTP id r6so2365993wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Aug 2012 00:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=CWwvWLhEfMfhyPngTKAyUTZ/3wLrm59nOPLJcMCwDxQ=;
	b=0KtyiVMKY6Yty+eBXTLoKh8jIDbfd/yHuvI7XfG5mLhbIXcjPAAsJXdTUFnjX9T0gO
	KTSYrhHW7q0E7G/7pDDrSYO9VxFMFS8QFtteiWqjTbZyk9BrECaxl2qxeW/lHgCkLfN0
	7r9YpZGYry8li46YF4MWEyKUSXQL0BsWK9CcDvRs5AEuB7ngGHyGmbtWCSn5cpyczZbH
	DnQKeaT+/vAK/0I6Gh7arzg8Xg40WIvKOJcfnf/let3zcYGOB9or0X9m401bVktH0nvB
	7jzA/abfe+x0unAwYU++Uiz6t9hNYBUXrxC/AC6yD6P1kELCF/C6htchEDPdT47+o49b
	yXyw==
Received: by 10.216.198.10 with SMTP id u10mr2051395wen.80.1345189289844;
	Fri, 17 Aug 2012 00:41:29 -0700 (PDT)
Received: from localhost.localdomain (p4FDF1574.dip.t-dialin.net.
	[79.223.21.116])
	by mx.google.com with ESMTPS id cl8sm8281791wib.10.2012.08.17.00.41.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Aug 2012 00:41:29 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Aug 2012 09:48:20 +0200
Message-Id: <1345189700-26130-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1345189700-26130-1-git-send-email-schnitzeltony@googlemail.com>
References: <1345189700-26130-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-systemd,V3] wpa-supplicant: add systemd support
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
X-List-Received-Date: Fri, 17 Aug 2012 07:53:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* native systemd support came in with v1.0 [1]
* needs [2] to work properly
* mends my wlan under control of networkmanager

[1] http://hostap.epitest.fi/gitweb/gitweb.cgi?p=hostap-1.git;a=blob_plain;f=wpa_supplicant/ChangeLog
[2] http://patches.openembedded.org/patch/34335/

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
v1->v2: chenge recipe's location
v2->v3: add SYSTEMD_AUTO_ENABLE = "disable"
 .../wpa-supplicant/wpa-supplicant_1.0.bbappend     |    3 ---
 .../wpa-supplicant/wpa-supplicant_1.0.bbappend     |   15 +++++++++++++++
 2 files changed, 15 insertions(+), 3 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend
 create mode 100644 meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend

diff --git a/meta-oe/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend b/meta-oe/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend
deleted file mode 100644
index 54da0ff..0000000
--- a/meta-oe/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
- 
-PRINC = "1"
diff --git a/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend b/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend
new file mode 100644
index 0000000..a4dceb4
--- /dev/null
+++ b/meta-systemd/oe-core/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bbappend
@@ -0,0 +1,15 @@
+PRINC = "2"
+
+inherit systemd
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "wpa_supplicant.service"
+SYSTEMD_AUTO_ENABLE = "disable"
+
+do_install_append () {
+    install -d ${D}${systemd_unitdir}/system
+    install -m 644 ${S}/systemd/*.service ${D}${systemd_unitdir}/system
+}
+
+# systemd.bbclass does not catch all multiple-instance-service-files
+FILES_${PN}-systemd += "${systemd_unitdir}/system/"
-- 
1.7.4.4



