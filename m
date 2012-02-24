Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S0joV-0001Bz-Um
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Feb 2012 02:19:11 +0100
Received: by eekd41 with SMTP id d41so881479eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 17:10:50 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.213.21.142 as permitted sender)
	client-ip=10.213.21.142; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.213.21.142 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.213.21.142])
	by 10.213.21.142 with SMTP id j14mr49982ebb.53.1330045850095 (num_hops
	= 1); Thu, 23 Feb 2012 17:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=EG4gu5Rnv5xbuEMUy5S5HS05O7Q6klk22v0odg7KIck=;
	b=nJPo6bhwKv5excXPQOb6cIGmkkPG6ZxGdlwPQ3RJxdlaxKZ4MJlckp0hGuWgI3Gl1x
	u5lqcn3WqdpycWusjPEW5BIFyR6KqVjOYABaGr5E76GUPtAtN6g3nF94enyQzvc9K9w/
	IjxOZPvJKOBpc4SNVa5TBvU8m33u9HXPl0sQY=
Received: by 10.213.21.142 with SMTP id j14mr35375ebb.53.1330045849994;
	Thu, 23 Feb 2012 17:10:49 -0800 (PST)
Received: from localhost.localdomain (p5B0A23FB.dip.t-dialin.net.
	[91.10.35.251])
	by mx.google.com with ESMTPS id v51sm11847840eef.2.2012.02.23.17.10.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 17:10:49 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Feb 2012 02:13:49 +0100
Message-Id: <1330046029-8749-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [meta-oe V2] dhcp: follow oe-core's update to 4.2.3-P2
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
X-List-Received-Date: Fri, 24 Feb 2012 01:19:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...{dhcp_4.2.0.bbappend => dhcp_4.2.3-P2.bbappend} |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
 rename meta-oe/recipes-connectivity/dhcp/{dhcp_4.2.0.bbappend => dhcp_4.2.3-P2.bbappend} (91%)

diff --git a/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.0.bbappend b/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bbappend
similarity index 91%
rename from meta-oe/recipes-connectivity/dhcp/dhcp_4.2.0.bbappend
rename to meta-oe/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bbappend
index 6d1e3df..edd44c1 100644
--- a/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.0.bbappend
+++ b/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bbappend
@@ -3,7 +3,7 @@ FILESEXTRAPATHS := "${THISDIR}/files"
 
 inherit systemd
 
-PRINC := "${@int(PRINC) + 3}"
+PRINC := "${@int(PRINC) + 1}"
 
 SYSTEMD_PACKAGES = "dhcp-server-systemd dhcp-relay-systemd"
 SYSTEMD_SERVICE_dhcp-server-systemd = "dhcpd.service"
-- 
1.7.4.4



