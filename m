Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8AD666BEF5
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 06:58:47 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id c10so2856529wiw.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Sep 2013 23:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=3qGOD7Qxp8yWZzth2bVc2aPTtja76w3K9XHxL78ioro=;
	b=Eb81SfOm6xbF1ZZFmJRqGGoPI4Tu2Gk/u4OJNko+YcNIHg7gixYDcUI1/iJTbPIutu
	6dc9SSQhJVWzM0h0oM/oXyhUD3k+cxvsQ/KpLoH6NdA7v9fGSICVja4FmqdLFWmXSYDJ
	J8mRL0yu1IgAXZK2GWWzQs8izzYiS2kOJFurOhindHQbVncpgZLK+lnolCHElNQ4P3xP
	aanU6kXVGNZbbs5/EgDOtBBJSyuFLiekGpcQo/by3FzlO7XMYjJUmxrvILgzjvv9oiUo
	OzzDrf32j9D8K6Dacc8iGSyXPp4muiDO2cDcjb+8uqCL33XZLfrtD4KIl3niqKINpNqC
	Jmvg==
X-Received: by 10.180.75.15 with SMTP id y15mr16797539wiv.12.1378191527441;
	Mon, 02 Sep 2013 23:58:47 -0700 (PDT)
Received: from localhost.localdomain (ip-178-200-247-59.unitymediagroup.de.
	[178.200.247.59])
	by mx.google.com with ESMTPSA id a8sm23332641wie.6.1969.12.31.16.00.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 02 Sep 2013 23:58:46 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Sep 2013 08:58:30 +0200
Message-Id: <1378191510-31214-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-networking] ntp: enable systemd-timedated control for ntp.service
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
X-List-Received-Date: Tue, 03 Sep 2013 06:58:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-networking/recipes-support/ntp/ntp.inc       |    5 +++++
 meta-networking/recipes-support/ntp/ntp/ntpd.list |    1 +
 2 files changed, 6 insertions(+), 0 deletions(-)
 create mode 100644 meta-networking/recipes-support/ntp/ntp/ntpd.list

diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networking/recipes-support/ntp/ntp.inc
index 79e7401..ebfa222 100644
--- a/meta-networking/recipes-support/ntp/ntp.inc
+++ b/meta-networking/recipes-support/ntp/ntp.inc
@@ -22,6 +22,7 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
            file://ntpd.service \
            file://sntp.service \
            file://sntp \
+           file://ntpd.list \
 "
 
 inherit autotools update-rc.d systemd
@@ -63,6 +64,10 @@ do_install_append() {
     install -m 0644 ${WORKDIR}/ntpdate.service ${D}${systemd_unitdir}/system/
     install -m 0644 ${WORKDIR}/ntpd.service ${D}${systemd_unitdir}/system/
     install -m 0644 ${WORKDIR}/sntp.service ${D}${systemd_unitdir}/system/
+
+    # see http://www.freedesktop.org/wiki/Software/systemd/timedated/
+    install -d ${D}${libdir}/systemd/ntp-units.d
+    install -m 0644 ${WORKDIR}/ntpd.list ${D}${libdir}/systemd/ntp-units.d/60-ntpd.list
 }
 
 PACKAGES += "ntpdate sntp ${PN}-tickadj ${PN}-utils"
diff --git a/meta-networking/recipes-support/ntp/ntp/ntpd.list b/meta-networking/recipes-support/ntp/ntp/ntpd.list
new file mode 100644
index 0000000..d1fe6b7
--- /dev/null
+++ b/meta-networking/recipes-support/ntp/ntp/ntpd.list
@@ -0,0 +1 @@
+ntpd.service
-- 
1.7.6.5


