Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2F27F6B9DD
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2014 11:04:08 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id t60so5397482wes.37
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2014 03:04:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XbQByWT8PNPVgCZotDr9R5Dv6bGamQmeylcN2TTnbQ4=;
	b=Rpmyo6wAc9MWvd4h42EMOGlYRW6TTvS9lupmo9Fz5jdTZsXlcdSv5o3XLUc/MEvYFX
	Jazf6wdL3GBIXIxI37BquoGdf25Pcwf7WwJNbu+tp2baVN97YxjFbNWocJO2aZ/8qC9P
	fQ6864ncQQ2hAsFXCqOp7ADDGVk11ctvCpeEwIu0/fhYcbJqYLMrp4h5pK2KwTDHNrxv
	sNBAGcBTyYXPC4OlNNtfyTddhhK9KrZhF71w7z9OM1EChKuxI9Z6Y0yaELzo7PsvMhDq
	xlL1LF+jhlo0V/MMwtxS//0p4hYhAgYiK8vdkNW7Qr46AV76DBsIeikTsRD23J6aiEJk
	GIvw==
X-Gm-Message-State: ALoCoQl1T+ZtZVjDQczrf4q57pVf7gR9E4KEHSUWy1XLJVVFWDlOlg4Ixa2b1+4ltOIg0CdkeOln
X-Received: by 10.194.77.7 with SMTP id o7mr6149346wjw.35.1390043047945;
	Sat, 18 Jan 2014 03:04:07 -0800 (PST)
Received: from localhost ([2001:610:612:0:21c:42ff:fef0:7f75])
	by mx.google.com with ESMTPSA id dm2sm8072290wib.8.2014.01.18.03.04.06
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jan 2014 03:04:06 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Jan 2014 12:04:04 +0100
Message-Id: <1390043044-20352-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.4.2
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [RFC][meta-oe][PATCH] jenkins: add 1.547
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 18 Jan 2014 11:04:09 -0000

The package split is based on the debian packages which have -common/-server and -slave.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---

This introduces a dependency on meta-java, which is of course a big no-no for meta-oe :( That leaves me with a few questions:

1) What's the best place for the jenkins recipe?
2) Do we have a virtual/runtime thing to express a dependency on /usr/bin/java without dragging in meta-java?
3) Any ideas for the contents and deps of the jenkins-slave package? 

 .../jenkins/jenkins/jenkins-server.service         | 11 +++++++
 meta-oe/recipes-devtools/jenkins/jenkins_1.547.bb  | 36 ++++++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jenkins/jenkins/jenkins-server.service
 create mode 100644 meta-oe/recipes-devtools/jenkins/jenkins_1.547.bb

diff --git a/meta-oe/recipes-devtools/jenkins/jenkins/jenkins-server.service b/meta-oe/recipes-devtools/jenkins/jenkins/jenkins-server.service
new file mode 100644
index 0000000..302d8bd
--- /dev/null
+++ b/meta-oe/recipes-devtools/jenkins/jenkins/jenkins-server.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Jenkins Daemon
+After=syslog.target
+
+[Service]
+Type=simple
+ExecStart=/usr/bin/java -jar /usr/share/jenkins/jenkins.war
+User=jenkins
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-devtools/jenkins/jenkins_1.547.bb b/meta-oe/recipes-devtools/jenkins/jenkins_1.547.bb
new file mode 100644
index 0000000..79d6dfc
--- /dev/null
+++ b/meta-oe/recipes-devtools/jenkins/jenkins_1.547.bb
@@ -0,0 +1,36 @@
+SUMMARY = "Continuous Integration and Job Scheduling Server"
+
+LICENSE = "MIT & Apache-2.0"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
+
+SRC_URI = "http://mirrors.jenkins-ci.org/war/${PV}/jenkins.war \
+           file://jenkins-server.service \
+          "
+SRC_URI[md5sum] = "539f6871ea89228edf779d3bc5051393"
+SRC_URI[sha256sum] = "e8e11089df2331de368de38030134dfd3b9a2c38beffb52e3af9b30a9bddcca9"
+
+inherit allarch systemd useradd
+
+do_install() {
+    install -d ${D}${datadir}/jenkins
+    install -m0644 ${WORKDIR}/jenkins.war ${D}${datadir}/jenkins/
+
+    install -d ${D}${systemd_unitdir}/system
+    install -m0644 ${WORKDIR}/jenkins-server.service ${D}${systemd_unitdir}/system
+    sed -i -e s:/usr/share:${datadir}: ${D}${systemd_unitdir}/system/jenkins-server.service
+}
+
+PACKAGES =+ "jenkins-common"
+FILES_jenkins-common = "${datadir}/jenkins/jenkins.war"
+
+PACKAGES =+ "jenkins-server" 
+FILES_jenkins-server = "${systemd_unitdir}"
+
+USERADD_PACKAGES = "${PN}-server"
+USERADD_PARAM_${PN}-server = "--system --create-home --home-dir ${localstatedir}/lib/jenkins jenkins"
+
+SYSTEMD_PACKAGES = "${PN}-server"
+SYSTEMD_SERVICE_jenkins-server = "jenkins-server.service"
+
+# From the debian packages, not sure about psmisc.
+RDEPENDS_jenkins-server = "openjdk-7-jre procps file psmisc jenkins-common"
-- 
1.8.4.2


