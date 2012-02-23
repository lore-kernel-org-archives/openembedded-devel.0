Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S0Xdx-00056J-5t
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 13:19:29 +0100
Received: by eaal10 with SMTP id l10so506709eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 04:11:08 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.14.95.129 as permitted sender)
	client-ip=10.14.95.129; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.14.95.129 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.14.95.129])
	by 10.14.95.129 with SMTP id p1mr771647eef.10.1329999068152 (num_hops =
	1); Thu, 23 Feb 2012 04:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=mEhpEhD+qxfHMKVcm+z9dFKXfX3EJmL3Wdo4gkrO8V0=;
	b=UumUfN36lD+XB+Y/MnyQ1zIE3MfkmzNnEgjq7CHMR76/QLqQAtG/LaG1GEIW6nKA2e
	PuJqOu1FRuFM4iNeaGTfJJq9lnrKpxMSGCuGN1xDyy/ixNbLmKLCDa59jxH+hHUQ1BH1
	D2QXJaR/vwjyKhU5wueQVDm8ljANy2I7t6TDU=
Received: by 10.14.95.129 with SMTP id p1mr612892eef.10.1329999068043;
	Thu, 23 Feb 2012 04:11:08 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n52sm4739136eea.5.2012.02.23.04.11.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 04:11:07 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2012 13:10:51 +0100
Message-Id: <1329999054-23112-21-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
References: <1329999054-23112-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe V3 20/23] dhcp: remove unneeded systemd code
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
X-List-Received-Date: Thu, 23 Feb 2012 12:19:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-connectivity/dhcp/dhcp_4.2.0.bbappend  |   12 +-----------
 1 files changed, 1 insertions(+), 11 deletions(-)

diff --git a/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.0.bbappend b/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.0.bbappend
index 4344eaa..829ad3c 100644
--- a/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.0.bbappend
+++ b/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.0.bbappend
@@ -3,19 +3,9 @@ FILESEXTRAPATHS := "${THISDIR}/files"
 
 inherit systemd
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 SYSTEMD_PACKAGES = "dhcp-server-systemd"
 SYSTEMD_SERVICE_dhcp-server-systemd = "dhcpd.service"
 
 SRC_URI += "file://dhcpd.service"
-
-do_install_append() {
-    install -d ${D}${base_libdir}/systemd/system
-    install -m 644 ${WORKDIR}/dhcpd.service ${D}${base_libdir}/systemd/system
-}
-
-PACKAGES =+ "dhcp-server-systemd"
-
-FILES_dhcp-server-systemd += "${base_libdir}/systemd"
-RDEPENDS_dhcp-server-systemd += "dhcp-server"
-- 
1.7.6.4



