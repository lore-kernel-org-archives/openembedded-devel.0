Return-Path: <joe@deserted.net>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 13F9560557
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 03:23:47 +0000 (UTC)
Received: by iodt126 with SMTP id t126so175217730iod.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2015 20:23:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id;
	bh=Ha9vbizttI/2P079r6U/8UhZH/Ov1pGioGLjs72A6CQ=;
	b=hjSmCu+r/O82yUAkugwVUoozDJQazcz5+ZIMiw3jOLnW0h9p6Ll6mCLQ3tFo+WVTmS
	m2Bs5tGs2KUkWUJtW/ugaHn85grl3ajJz5qf6xjvkmivY5BIGqCDwQtjoY94m9QZowvu
	BJlNIWUPE5caH7t6BS8fnR4m6shENpB1nQT+p4pfrjifkaHpBPC00NkkCiqwguhDbpxD
	GVZaxJAGsWqawBm6o86u1ySSGM+16aGhG6bPEdeMW9dkYNzgS88X0+N8n6cibyWVyMnJ
	9cbG3/CceKRqZ5X4w9Qsn4DFHik7+LBkn/aB8ig9vL8xQPbhqbyKgBTS4AM1IMoqZ21h
	i2hA==
X-Gm-Message-State: ALoCoQngdfkhdF5+P6EK8EOdEd9uuh/NoTqA0cTyxfPGA4rS3wSlpYUbYBWjhelG1LBUn52arYmE
X-Received: by 10.107.12.163 with SMTP id 35mr4069280iom.78.1439868227858;
	Mon, 17 Aug 2015 20:23:47 -0700 (PDT)
Received: from mir.deserted.net ([23.233.31.74])
	by smtp.gmail.com with ESMTPSA id
	p79sm14372688iop.15.2015.08.17.20.23.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 17 Aug 2015 20:23:47 -0700 (PDT)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Aug 2015 23:24:08 -0400
Message-Id: <1439868248-25769-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] netcf: support multilib builds
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
X-List-Received-Date: Tue, 18 Aug 2015 03:23:51 -0000

When doing a multilib build, /usr/lib is still created but not collected
into FILES_${PN} by default, resulting in a QA error.  Adding both
${libdir} and ${nonarch_libdir} catches all scenarios.

It also turns out that the previous do_install_append would throw an error
in a multilib build since systemd always installs to .../lib/... but
${libdir] would point at .../lib64/...

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 meta-networking/recipes-support/netcf/netcf_git.bb | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/netcf/netcf_git.bb b/meta-networking/recipes-support/netcf/netcf_git.bb
index d47bb3b..8a8963e 100644
--- a/meta-networking/recipes-support/netcf/netcf_git.bb
+++ b/meta-networking/recipes-support/netcf/netcf_git.bb
@@ -32,12 +32,22 @@ do_configure_prepend() {
 do_install_append() {
     if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
        install -d ${D}${systemd_unitdir}/system
-       mv ${D}${libdir}/systemd/system/* ${D}${systemd_unitdir}/system/
-       rm -rf ${D}${libdir}/systemd/
+       if [ -d "${D}${libdir}/systemd/system" ]; then
+           mv ${D}${libdir}/systemd/system/* ${D}${systemd_unitdir}/system/
+           rm -rf ${D}${libdir}/systemd/
+       else
+           mv ${D}${nonarch_libdir}/systemd/system/* ${D}${systemd_unitdir}/system/
+           rm -rf ${D}${nonarch_libdir}/systemd/
+       fi
     else
        mv ${D}${sysconfdir}/rc.d/init.d/ ${D}${sysconfdir}
        rm -rf ${D}${sysconfdir}/rc.d/
     fi
 }
 
+FILES_${PN} += " \
+        ${libdir} \
+        ${nonarch_libdir} \
+        "
+
 SYSTEMD_SERVICE_${PN} = "netcf-transaction.service"
-- 
1.9.1


