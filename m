Received: from mickerik.phytec.de (mickerik.phytec.de [195.145.39.210])
 by mx.groups.io with SMTP id smtpd.web08.17424.1607101542020151831
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Dec 2020 09:05:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@phytec.de header.s=a1 header.b=ST9Y7etq;
 spf=pass (domain: phytec.de, ip: 195.145.39.210, mailfrom: r.karszniewicz@phytec.de)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1607101539; x=1609693539;
	h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BBamjDIPqLVguy7KILEpfVGAouVelBeCCauh9sHOTxo=;
	b=ST9Y7etqX8O/uOm5smN8tNXpi6leEC7XYEAhjuzy1hm83I96rMIenfXrc2ahUnSx
	M1YUwdvmruauUvha4SRMXYesjTRPw1nk/2vrTEEsEHXeP3lXJNNtHSn2v6WnyVvf
	z/KSVSrBtB2uIe/1p2KALM5+K0ziwPUPhbj2y3nolpc=;
X-AuditID: c39127d2-981ff70000006435-b4-5fca6c633839
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 7B.F3.25653.36C6ACF5; Fri,  4 Dec 2020 18:05:39 +0100 (CET)
Received: from augenblix2.phytec.de ([172.16.0.56])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2020120418053950-919734 ;
          Fri, 4 Dec 2020 18:05:39 +0100 
From: r.karszniewicz@phytec.de
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] firmwared: add recipe
Date: Fri, 4 Dec 2020 18:05:39 +0100
Message-Id: <1607101539-25986-1-git-send-email-r.karszniewicz@phytec.de>
X-Mailer: git-send-email 2.7.4
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 04.12.2020 18:05:39,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 04.12.2020 18:05:39,
	Serialize complete at 04.12.2020 18:05:39
X-TNEFEvaluated: 1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNJMWRmVeSWpSXmKPExsWyRoCBSzc551S8wdzVlhYXDy9ldmD0OLdx
	BWMAYxSXTUpqTmZZapG+XQJXxuXTa1kK+oQq2l99Zm9gPMTfxcjJISFgInF+1TX2LkYuDiGB
	rYwSvw4ugHLOMUo8XvGCFaSKDahqd/MtZhBbREBX4uOHuYwgtrCAvkTD+jlgNSwCKhLPG58x
	gdi8Ah4SF37fZofYICdx81wnM8hQCYFGJoknbU/ZIBJCEqcXn2WewMi9gJFhFaNQbmZydmpR
	ZrZeQUZlSWqyXkrqJkagBw9PVL+0g7FvjschRiYOxkOMEhzMSiK8saon44V4UxIrq1KL8uOL
	SnNSiw8xSnOwKInzbuAtCRMSSE8sSc1OTS1ILYLJMnFwSjUwdqdXFkec27lm4wZ2pllcwvxv
	QxW+JNQkWh4tMXJfxlzVzP3ilF97Tr57wITIBtO5/0yznNh312iq+/6Yku/K/L/so4fV3n++
	B5bvflBhHCevLfVy1mTVXTbTa3f7zflje2K51qtNdQ8+Wj7c9rJUd2PjNyfWFBndgwzxrv7T
	FP4z7lvb3pulxFKckWioxVxUnAgAKd9ULM4BAAA=

This program is needed for loading external firmware via Linux' fallback
mechanism.

Signed-off-by: Robert Karszniewicz <r.karszniewicz@phytec.de>
---
I wasn't sure which subdirectory to put it in, but I picked recipes-bsp.
Thanks.

 .../firmwared/firmwared/firmwared.service          |  9 +++++++
 meta-oe/recipes-bsp/firmwared/firmwared_git.bb     | 29 ++++++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-bsp/firmwared/firmwared/firmwared.service
 create mode 100644 meta-oe/recipes-bsp/firmwared/firmwared_git.bb

diff --git a/meta-oe/recipes-bsp/firmwared/firmwared/firmwared.service b/meta-oe/recipes-bsp/firmwared/firmwared/firmwared.service
new file mode 100644
index 000000000000..c2106a25168c
--- /dev/null
+++ b/meta-oe/recipes-bsp/firmwared/firmwared/firmwared.service
@@ -0,0 +1,9 @@
+[Unit]
+Description=Linux Firmware Loader Daemon
+
+[Service]
+Type=simple
+ExecStart=@BINDIR@/firmwared -d /lib/firmware
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-bsp/firmwared/firmwared_git.bb b/meta-oe/recipes-bsp/firmwared/firmwared_git.bb
new file mode 100644
index 000000000000..3b2a8070bdd3
--- /dev/null
+++ b/meta-oe/recipes-bsp/firmwared/firmwared_git.bb
@@ -0,0 +1,29 @@
+SUMMARY = "Linux Firmware Loader Daemon"
+DESCRIPTION = "The Linux Firmware Loader Daemon monitors the kernel for \
+firmware requests and uploads the firmware blobs it has via the sysfs \
+interface."
+HOMEPAGE = "https://github.com/teg/firmwared"
+PR = "r0"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=7b486c2338d225a1405d979ed2c15ce8 \
+                    file://COPYING;md5=daa868b8e1ae17d03228a1145b4060da"
+
+SRC_URI = "git://github.com/teg/firmwared.git \
+           file://firmwared.service"
+
+PV = "1+git${SRCPV}"
+SRCREV = "2e6b5db43d63a5c0283a4cae9a6a20b7ad107a04"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "glib-2.0 systemd"
+
+inherit pkgconfig autotools systemd
+
+SYSTEMD_SERVICE_${PN} = "firmwared.service"
+
+do_install_append() {
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/firmwared.service ${D}${systemd_unitdir}/system
+    sed -i -e 's,@BINDIR@,${bindir},g' ${D}${systemd_unitdir}/system/firmwared.service
+}
-- 
2.7.4

