Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sdq3b-0001fb-4U
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jun 2012 23:52:23 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so2267906wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2012 14:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=p1nYhR0INE1+nQyGas54SCWNhVSeZeZTZ5y2cCsLPKM=;
	b=UM0lDOiQsR5LS9XemnldckzLoFQGV6Wiskf+9ICPYyQsPPJdRA/caFLNv0ALpaldG8
	qpETCwnNcl3FipoadPEb5CaOpPYXr6Mi090gJJmefXpX8aSRwNsfrJOsG9FLK3mP8ZaC
	2aG0Fl4elx6bCcvxzAvYccNJLCOt+hginPWIyoM8aoVTbfh4x2NS/EEb041+ehS5FWlt
	FkSPYugNwPrz4uUt+m2p/dyy9uVfESlfA3fzzqnkKIL2a9odPSgE/p1QF6ajDG6Av8dI
	M5T9AMO1X6guveXS/4ZcYGZf//okBAx2IJcmMK6oa3BKV2drEJCCpBSBPsnOVkoGKW9E
	AvOg==
Received: by 10.180.99.70 with SMTP id eo6mr15687422wib.17.1339364512834;
	Sun, 10 Jun 2012 14:41:52 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2104.dip.t-dialin.net. [91.10.33.4])
	by mx.google.com with ESMTPS id gc6sm19758306wib.0.2012.06.10.14.41.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 10 Jun 2012 14:41:52 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2012 23:46:47 +0200
Message-Id: <1339364820-2880-15-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
References: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [RFC, meta-oe 14/27] atftp: move systemd support to meta-systemd
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
X-List-Received-Date: Sun, 10 Jun 2012 21:52:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-extended/atftp/atftp_0.7.bb        |   10 +++-------
 .../recipes-extended/atftp/atftp}/atftpd.service   |    0
 .../recipes-extended/atftp/atftp_0.7.bbappend      |   10 ++++++++++
 3 files changed, 13 insertions(+), 7 deletions(-)
 rename {meta-oe/recipes-extended/atftp/files => meta-systemd/meta-oe/recipes-extended/atftp/atftp}/atftpd.service (100%)
 create mode 100644 meta-systemd/meta-oe/recipes-extended/atftp/atftp_0.7.bbappend

diff --git a/meta-oe/recipes-extended/atftp/atftp_0.7.bb b/meta-oe/recipes-extended/atftp/atftp_0.7.bb
index 1af4b63..ff1e11d 100644
--- a/meta-oe/recipes-extended/atftp/atftp_0.7.bb
+++ b/meta-oe/recipes-extended/atftp/atftp_0.7.bb
@@ -3,19 +3,15 @@ SECTION = "network"
 HOMEPAGE = "http://packages.debian.org/atftp"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=94d55d512a9ba36caa9b7df079bae19f"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/a/atftp/atftp_${PV}.dfsg.orig.tar.gz;name=archive \
            ${DEBIAN_MIRROR}/main/a/atftp/atftp_${PV}.dfsg-11.diff.gz;name=patch \
-           file://atftpd.init \
-           file://atftpd.service"
+           file://atftpd.init"
 
 S = "${WORKDIR}/atftp-${PV}.dfsg"
 
-inherit autotools update-rc.d systemd useradd
-
-SYSTEMD_PACKAGES = "atftpd-systemd"
-SYSTEMD_SERVICE_atftpd-systemd = "atftpd.service"
+inherit autotools update-rc.d useradd
 
 INITSCRIPT_PACKAGES = "${PN}d"
 INITSCRIPT_NAME_${PN}d = "atftpd"
diff --git a/meta-oe/recipes-extended/atftp/files/atftpd.service b/meta-systemd/meta-oe/recipes-extended/atftp/atftp/atftpd.service
similarity index 100%
rename from meta-oe/recipes-extended/atftp/files/atftpd.service
rename to meta-systemd/meta-oe/recipes-extended/atftp/atftp/atftpd.service
diff --git a/meta-systemd/meta-oe/recipes-extended/atftp/atftp_0.7.bbappend b/meta-systemd/meta-oe/recipes-extended/atftp/atftp_0.7.bbappend
new file mode 100644
index 0000000..a5553df
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-extended/atftp/atftp_0.7.bbappend
@@ -0,0 +1,10 @@
+FILESEXTRAPATHS := "${THISDIR}/${PN}"
+
+PRINC := "${@int(PRINC) + 1}"
+
+inherit systemd
+
+SRC_URI += "file://atftpd.service"
+
+SYSTEMD_PACKAGES = "atftpd-systemd"
+SYSTEMD_SERVICE_atftpd-systemd = "atftpd.service"
-- 
1.7.4.4



