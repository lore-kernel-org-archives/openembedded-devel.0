Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rumqo-0001JM-76
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 16:20:58 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so2181062eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 07:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=jk4/nU+EayIR+VNTunB6fhVX0Nz+5RoBf6FukO5PHx0=;
	b=L9EsRzK2dkowL10sFNXyPdwSpqcikByykUZgl90E7S1nmZgmKQ4ISdqa8PM/wXlDvP
	YSTzBGtFKzNFu5AUu8+Ckyy76P/NhslvKvovBqwrZtSYeve8BgsP2VeI7KGd5uAhxlA2
	uXcJyRF/1O5bMRFbum0sNY98w0ZrvDsazcY/o=
Received: by 10.14.94.66 with SMTP id m42mr4266495eef.66.1328627578186;
	Tue, 07 Feb 2012 07:12:58 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n58sm1424741een.10.2012.02.07.07.12.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 07:12:57 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Feb 2012 16:12:32 +0100
Message-Id: <1328627573-5217-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][RFC 06/27] openssh: remove unneeded systemd code
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
X-List-Received-Date: Tue, 07 Feb 2012 15:20:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../openssh/openssh_5.9p1.bbappend                 |   14 +-------------
 1 files changed, 1 insertions(+), 13 deletions(-)

diff --git a/meta-oe/recipes-connectivity/openssh/openssh_5.9p1.bbappend b/meta-oe/recipes-connectivity/openssh/openssh_5.9p1.bbappend
index 3f68e09..de7668f 100644
--- a/meta-oe/recipes-connectivity/openssh/openssh_5.9p1.bbappend
+++ b/meta-oe/recipes-connectivity/openssh/openssh_5.9p1.bbappend
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 SYSTEMD_PACKAGES = "openssh-sshd-systemd"
 SYSTEMD_SERVICE = "sshd.socket"
@@ -8,15 +8,3 @@ SYSTEMD_SERVICE = "sshd.socket"
 inherit systemd
 
 SRC_URI += "file://sshd.socket file://sshd@.service file://sshdgenkeys.service"
-
-do_install_append() {
-       install -d ${D}${base_libdir}/systemd/system
-       install -m 644 ${WORKDIR}/sshd.socket ${D}${base_libdir}/systemd/system
-       install -m 644 ${WORKDIR}/sshd@.service ${D}${base_libdir}/systemd/system
-       install -m 644 ${WORKDIR}/sshdgenkeys.service ${D}${base_libdir}/systemd/system
-}
-
-PACKAGES =+ "openssh-sshd-systemd"
-
-FILES_openssh-sshd-systemd += "${base_libdir}/systemd"
-RDEPENDS_openssh-sshd-systemd += "openssh-sshd"
-- 
1.7.6.4



