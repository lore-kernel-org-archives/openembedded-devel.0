Received: from fg-out-1718.google.com ([72.14.220.157])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1NZO05-0001hj-9A
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 13:25:17 +0100
Received: by fg-out-1718.google.com with SMTP id 16so164891fgg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jan 2010 04:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=1PwqVkLsNsglc7bbQlyAUBug/+sIROmWIur/FFNNG14=;
	b=uxKl1CAXuw5F/cAej3vh4S1Fxg80M8lvZUF/+wX57Jr85DshGTk+RcR6+OD3qXVQkL
	9TMe4dOAzDUeKCWE0r6l3z05r/eQt6ARfmIsRxpucRv9X9GB+0Ls7AsbscH9HiQV15uI
	j/NCardvE0Zg4S1AbNds91MLPeS6qoh6BKNmY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=A+rfHMxNvWrkQgFMI/mDXFrJ4odYWFV86YEQmZpVP4/2JLHBGALKqDPYG1egPbT0E0
	DD8vrZtpgzeOPG+n5XUvQinfQ0YDOeFlzP2djmKQITpZne/YT73C3Ozs5OhSGmMj7qdT
	2j6IJVXLdCxfSZFw+R7wOyCMRtms2VAXGb+WE=
Received: by 10.103.125.19 with SMTP id c19mr3305273mun.114.1264422163105;
	Mon, 25 Jan 2010 04:22:43 -0800 (PST)
Received: from localhost.localdomain ([188.45.23.202])
	by mx.google.com with ESMTPS id i5sm20297052mue.25.2010.01.25.04.22.40
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 25 Jan 2010 04:22:42 -0800 (PST)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Jan 2010 13:22:41 +0100
Message-Id: <1264422161-15538-1-git-send-email-michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.6.4.4
In-Reply-To: <n>
References: <n>
X-SA-Exim-Connect-IP: 72.14.220.157
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] libertas-firmware: Add recipe for libertas firmware.
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
X-List-Received-Date: Mon, 25 Jan 2010 12:25:17 -0000

* Libertas firmware is used by kernel module libertas_sdio, which
  enables wifi on IGEPv2 boards.
---
 .../libertas-firmware/libertas-firmware_9.70.3.bb  |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libertas-firmware/libertas-firmware_9.70.3.bb

diff --git a/recipes/libertas-firmware/libertas-firmware_9.70.3.bb b/recipes/libertas-firmware/libertas-firmware_9.70.3.bb
new file mode 100644
index 0000000..022115d
--- /dev/null
+++ b/recipes/libertas-firmware/libertas-firmware_9.70.3.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Firmware for the libertas_sdio kernel module used by IGEPv2 board"
+LICENSE = "GPL"
+PR = "r0"
+
+SRC_URI = "http://extranet.marvell.com/drivers/files/SD-8686-LINUX26-SYSKT-9.70.3.p24-26409.P45-GPL.zip;name=firmware"
+SRC_URI[firmware.md5sum] = "f43e3f4d7fd913e3063309f4cdacc0f7"
+SRC_URI[firmware.sha256sum] = "b1f954d6beef91ad1713e6fe505fa7fe66fb6bbcb8e6d18cf700b4374cb358b8"
+
+S = "${WORKDIR}"
+
+do_install() {
+    tar -xvf ${S}/SD-8686-FEDORA26FC6-SYSKT-GPL-9.70.3.p24-26409.P45.tar
+    install -d ${D}/${base_libdir}/firmware
+    install -m 0644 ${S}/FwImage/sd8686.bin ${D}/${base_libdir}/firmware/
+    install -m 0644 ${S}/FwImage/helper_sd.bin ${D}/${base_libdir}/firmware/sd8686_helper.bin
+}
+
+FILES_${PN} = "${base_libdir}/firmware/*"
-- 
1.6.4.4



