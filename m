Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rumqu-0001KV-AZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 16:21:04 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so1955924eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 07:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=eJhprJcSQwe4Onokm1fyBEncy9z+KhEtNlVqJG4dSMw=;
	b=jDTntn8TuzTBH5+RgkAUC62ucwFkwNEi6cqsqHKT0MkP4wLeIT8w2bWZVf3APwvcMZ
	YqTpd6CnmpcIBIfrR7wsMYDrt0kqPoBHCrzC4D1VPMyg9w76QtmfJHtQCpPVoaGjkNwo
	IA5n0dZAsNvarlINtKknkNq6E2YtKDHIYNUSo=
Received: by 10.213.9.4 with SMTP id j4mr3671911ebj.100.1328627583667;
	Tue, 07 Feb 2012 07:13:03 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n58sm1424741een.10.2012.02.07.07.13.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 07:13:03 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Feb 2012 16:12:37 +0100
Message-Id: <1328627573-5217-12-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][RFC 11/27] atftp: remove unneeded systemd code
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
X-List-Received-Date: Tue, 07 Feb 2012 15:21:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-extended/atftp/atftp_0.7.bb |   10 ++--------
 1 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-extended/atftp/atftp_0.7.bb b/meta-oe/recipes-extended/atftp/atftp_0.7.bb
index ab14a28..6bd44a0 100644
--- a/meta-oe/recipes-extended/atftp/atftp_0.7.bb
+++ b/meta-oe/recipes-extended/atftp/atftp_0.7.bb
@@ -3,7 +3,7 @@ SECTION = "network"
 HOMEPAGE = "http://packages.debian.org/atftp"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=94d55d512a9ba36caa9b7df079bae19f"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/a/atftp/atftp_${PV}.dfsg.orig.tar.gz;name=archive \
            ${DEBIAN_MIRROR}/main/a/atftp/atftp_${PV}.dfsg-11.diff.gz;name=patch \
@@ -29,23 +29,17 @@ do_install_append() {
     install -d ${D}${sysconfdir}/init.d
     install -m 0755 ${WORKDIR}/atftpd.init ${D}${sysconfdir}/init.d/atftpd
 
-    install -d ${D}${base_libdir}/systemd/system
-    install -m 644 ${WORKDIR}/atftpd.service ${D}${base_libdir}/systemd/system
-
     install -d ${D}/srv/tftp
 
     rm ${D}${sbindir}/in.tftpd
 }
 
-PACKAGES =+ "atftpd-systemd atftpd"
+PACKAGES =+ "atftpd"
 
 FILES_${PN} = "${bindir}/*"
 
 FILES_${PN}d = "${sbindir}/* ${sysconfdir}/init.d/* /srv/tftp"
 
-FILES_atftpd-systemd += "${base_libdir}/systemd"
-RDEPENDS_atftpd-systemd += "atftpd"
-
 SRC_URI[archive.md5sum] = "aa269044a6f992eca78fee2f6119643c"
 SRC_URI[archive.sha256sum] = "18815f5b67290fac087c6b9da28dfa5e0feb722096f5c5de52e59b46026da559"
 SRC_URI[patch.md5sum] = "1636f199bf32c754a7bf34a5c647d138"
-- 
1.7.6.4



