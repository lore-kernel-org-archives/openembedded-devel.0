Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SpbSc-00085w-4A
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 10:42:52 +0200
Received: by bkcik5 with SMTP id ik5so2247692bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 01:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=tHZVvtxHc/FzzhTuCb0V5vaceEYksvas+vAk5vOVNK8=;
	b=zNISTcA+gXSyDZKEocszmEmceGDFklrGuSwGiLHCscHwvmqkfOzKvMKqGq5SyDQ4BZ
	N8ltbveRaoLI4Qw/nEUYI0FYweqcBfMSnYU1uPdYGnDOa8AC06+1RpUSVn6OjZlUxTKq
	umVCunXPUDYWCUlrVydmHnc4FF7VyIS1Zd93OmwEtRO4RFSAlW2ubnRtTshgcum0ozq7
	2sxsxXB/nZ1BLCH5upVn1LE6FqVQPZ1Y18EL6wYMjIn73jkn6cTM3fIPe8PG2vXQ+aiI
	dIBcEiKg3fUleyGI//pL3gO6KDrQY9Pzxe4J93IcydB5cFM86OzNfvPtwnLCxvyS0gHM
	ADww==
Received: by 10.205.117.141 with SMTP id fm13mr106161bkc.125.1342168295095;
	Fri, 13 Jul 2012 01:31:35 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id fu8sm4214355bkc.5.2012.07.13.01.31.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 01:31:34 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 10:30:27 +0200
Message-Id: <1342168240-7760-20-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
References: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe, V2 19/32] atftp: move systemd support to meta-systemd
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
X-List-Received-Date: Fri, 13 Jul 2012 08:42:57 -0000
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
index 0000000..3706d9f
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-extended/atftp/atftp_0.7.bbappend
@@ -0,0 +1,10 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
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
1.7.6.5



