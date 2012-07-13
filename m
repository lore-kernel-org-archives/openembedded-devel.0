Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SpbSc-00085x-Df
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 10:42:52 +0200
Received: by bkcik5 with SMTP id ik5so2247698bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 01:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=j1Mx0ZnT4vrcdTZWrwvJFyI3cmr3nCZ+OE3ApTaAmfg=;
	b=M0wTdyF4/u6cki4E0DM7ZGflMu90Nn0tlc52iY8JF4UWldhTvHPb3Tv55/pQb0U9hl
	I4iFqqvHEY2hLAKg1/NI6Ewhp8wfls/QFWURgmc5NGOmmbUb5PtSJJP3jNefL+eeSdO/
	lADY9WHpvTOIxkgCCgHHyW/TNw76HJdHRgd6PzF2oQRe2WiHlaVHw8i/neNH95tqdUkK
	T3Mv7Y+ICBrKnztpPnROk9MFmun17sKbBODr/u9gxsMULVJ0IZYuUs8kQM18K0/Wh8uz
	vd1DufzApW0T3Bk9fl8abgdJz/HL+8lNi97KemyUJG10gfa+Bj0CpNo/1EQUZDGJvZdQ
	nOoA==
Received: by 10.204.129.208 with SMTP id p16mr95803bks.129.1342168296494;
	Fri, 13 Jul 2012 01:31:36 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id fu8sm4214355bkc.5.2012.07.13.01.31.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 01:31:35 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 10:30:28 +0200
Message-Id: <1342168240-7760-21-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
References: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe, V2 20/32] dhcp: move systemd support to meta-systemd
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
X-List-Received-Date: Fri, 13 Jul 2012 08:42:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-connectivity/dhcp/dhcp}/dhcpd.service  |    0
 .../dhcp/dhcp}/dhcrelay.service                    |    0
 .../dhcp/dhcp_4.2.3-P2.bbappend                    |    4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename {meta-oe/recipes-connectivity/dhcp/files => meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp}/dhcpd.service (100%)
 rename {meta-oe/recipes-connectivity/dhcp/files => meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp}/dhcrelay.service (100%)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bbappend (79%)

diff --git a/meta-oe/recipes-connectivity/dhcp/files/dhcpd.service b/meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp/dhcpd.service
similarity index 100%
rename from meta-oe/recipes-connectivity/dhcp/files/dhcpd.service
rename to meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp/dhcpd.service
diff --git a/meta-oe/recipes-connectivity/dhcp/files/dhcrelay.service b/meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp/dhcrelay.service
similarity index 100%
rename from meta-oe/recipes-connectivity/dhcp/files/dhcrelay.service
rename to meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp/dhcrelay.service
diff --git a/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bbappend b/meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bbappend
similarity index 79%
rename from meta-oe/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bbappend
rename to meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bbappend
index edd44c1..5fd7ccb 100644
--- a/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bbappend
+++ b/meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bbappend
@@ -1,9 +1,9 @@
 # look for files in the layer first
-FILESEXTRAPATHS := "${THISDIR}/files"
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 inherit systemd
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 SYSTEMD_PACKAGES = "dhcp-server-systemd dhcp-relay-systemd"
 SYSTEMD_SERVICE_dhcp-server-systemd = "dhcpd.service"
-- 
1.7.6.5



