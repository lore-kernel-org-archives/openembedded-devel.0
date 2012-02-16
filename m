Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rxqm5-00063q-UK
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 03:08:45 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so504563eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2012 18:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=5axBmwa1xUEr5L64rMjlEYnaGA8dP7Lids8DUTXolyc=;
	b=PtxD/J8tI6vBpTyhUJQgJS2r6o0xR+AlTEczQ3BoQ1oCGYlImRlMLEbOcmsXTam4oq
	ym3Lg7RVxpz54L8xGZA3nHdVPjPw4X/DTrrrrSX/KNbVzlo+xvPzO+64vaWdttL0uOw+
	/f8vTKx5usJUUJKZ4nMMaOhyCv6b9V0Re5sVA=
Received: by 10.14.202.130 with SMTP id d2mr328902eeo.83.1329357635796;
	Wed, 15 Feb 2012 18:00:35 -0800 (PST)
Received: from localhost.localdomain (p5B0A2E3F.dip.t-dialin.net.
	[91.10.46.63])
	by mx.google.com with ESMTPS id n58sm17552669een.10.2012.02.15.18.00.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Feb 2012 18:00:35 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Feb 2012 03:03:12 +0100
Message-Id: <1329357796-27398-19-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][v2] 18/22] dhcp: remove unneeded systemd code
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
X-List-Received-Date: Thu, 16 Feb 2012 02:08:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
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
1.7.4.4



