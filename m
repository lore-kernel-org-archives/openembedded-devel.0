Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip.balister@gmail.com>) id 1PIVuE-00026p-NM
	for openembedded-devel@openembedded.org; Wed, 17 Nov 2010 01:29:47 +0100
Received: by gxk2 with SMTP id 2so858023gxk.6
	for <openembedded-devel@openembedded.org>;
	Tue, 16 Nov 2010 16:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:from:to:cc:subject
	:date:message-id:x-mailer;
	bh=0/N+dmiTmpWD/yOC1cykMVU5L6BSNXY2yl9LRvFe+ao=;
	b=eeOSpdkE72RtIQhraGbiZ7bZP756iIzETf1MiKYFeJEDMbt7xLERwN/r6vujBcd/jB
	2rLm7NkfC+Yczr9cNc4W+hjGnlNp6ouMhg77GgKPsS/g/Bs1zjJoPbxjJ5alNlMcWOe1
	r0/UXqSqVnSxpXZ8cmNxrlj6od1ueVg8bIVRI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=fH7AIYyuD1BCp9H7F5/aKy82oNZgJVfNRSts444BkwCBv8gXt6eNxlwxoNKhjdvPs5
	N6qPCUMnMWLiBYJL2EKN99Rar5QTaHMQQaTxgfsX2zO+xVmFvlOPU+UqK2GQaGOL2qXC
	/nYvch6mXhNfAuTKjCLbdjmAsSGorbJJlCLdU=
Received: by 10.90.27.4 with SMTP id a4mr10520315aga.135.1289953720574;
	Tue, 16 Nov 2010 16:28:40 -0800 (PST)
Received: from localhost.localdomain
	(adsl-75-37-22-143.dsl.pltn13.sbcglobal.net [75.37.22.143])
	by mx.google.com with ESMTPS id w3sm1997406anw.25.2010.11.16.16.28.39
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 16 Nov 2010 16:28:39 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: philip@balister.org
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Nov 2010 16:28:14 -0800
Message-Id: <1289953694-32685-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.7.2.3
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: philip.balister@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Philip Balister <philip@opensdr.com>
Subject: [PATCH] dhcp : Create directory for state storage. Convert to INC_PR.
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
X-List-Received-Date: Wed, 17 Nov 2010 00:29:47 -0000

From: Philip Balister <philip@opensdr.com>

---
 recipes/dhcp/dhcp4.inc        |    5 ++++-
 recipes/dhcp/dhcp_4.1.1-P1.bb |    2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/recipes/dhcp/dhcp4.inc b/recipes/dhcp/dhcp4.inc
index e2b2658..c7bf067 100644
--- a/recipes/dhcp/dhcp4.inc
+++ b/recipes/dhcp/dhcp4.inc
@@ -4,6 +4,8 @@ HOMEPAGE = "http://www.isc.org/"
 
 LICENSE = "ISC"
 
+INC_PR = "r1"
+
 SRC_URI = "ftp://ftp.isc.org/isc/dhcp/dhcp-${PV}.tar.gz \
            file://site.h \
 	   file://init-relay file://default-relay \
@@ -26,6 +28,7 @@ do_install_append () {
 	install -d ${D}${sysconfdir}/init.d
 	install -d ${D}${sysconfdir}/default
 	install -d ${D}${sysconfdir}/dhcp
+	install -d ${D}${localstatedir}/lib/dhcp
 	install -m 0755 ${WORKDIR}/init-relay ${D}${sysconfdir}/init.d/dhcp-relay
 	install -m 0644 ${WORKDIR}/default-relay ${D}${sysconfdir}/default/dhcp-relay
 	install -m 0755 ${WORKDIR}/init-server ${D}${sysconfdir}/init.d/dhcp-server
@@ -46,7 +49,7 @@ FILES_${PN} = ""
 FILES_dhcp-server = "${sbindir}/dhcpd ${sysconfdir}/init.d/dhcp-server ${sysconfdir}/default/dhcp-server ${sysconfdir}/dhcp/dhcpd.conf"
 FILES_dhcp-relay = "${sbindir}/dhcrelay ${sysconfdir}/init.d/dhcp-relay ${sysconfdir}/default/dhcp-relay"
 
-FILES_dhcp-client = "${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf"
+FILES_dhcp-client = "${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf ${localstatedir}/lib/dhcp"
 RDEPENDS_dhcp-client = "bash"
 
 FILES_dhcp-omshell = "${bindir}/omshell"
diff --git a/recipes/dhcp/dhcp_4.1.1-P1.bb b/recipes/dhcp/dhcp_4.1.1-P1.bb
index ed5a31b..0bbf50c 100644
--- a/recipes/dhcp/dhcp_4.1.1-P1.bb
+++ b/recipes/dhcp/dhcp_4.1.1-P1.bb
@@ -1,6 +1,6 @@
 require dhcp4.inc
 
-PR = "r1"
+PR = "${INC_PR}.1"
 
 SRC_URI += "file://fixincludes.patch \
             file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \
-- 
1.7.2.3



