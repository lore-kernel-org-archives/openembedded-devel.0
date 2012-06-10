Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sdq3c-0001fo-Ej
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jun 2012 23:52:24 +0200
Received: by mail-wi0-f177.google.com with SMTP id hm14so2039672wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2012 14:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=JJb/C7b8IHCBuY+oablA9AtbQ8rOACiojDfUE3dJfh4=;
	b=EmXM1nlJklUa4ncMnKfRYbUCOyDkBzqzywtufp21mhsgjqw4w7dgZd4d0wuMxQ8cBd
	G9nWYMR7b6V0mo1GZpQg3wCWjICk9zP6yhTCcjAleG9+AYuI3FUYdGA4jsRAFZUIqhAr
	RncOj34NYXCrHZrei3esd9WxAEN5NhzwgCPtYVjCX8ftCgKMGENPHD1mxwWTF4DlVNbF
	5QoViFeav/qcqPEVb2ABk2sGXAzSu2PwHdZDItxv0hAXLW6+oE3eEAWemsNGQfD3lH1E
	ldoXEZ+vK9r2URcoAPIUx0BuYWYJCdsik+AYwrXeZjTWyvqs4hb/gBB/MJRPcZAjC2DS
	jZqw==
Received: by 10.180.74.75 with SMTP id r11mr15704053wiv.7.1339364514151;
	Sun, 10 Jun 2012 14:41:54 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2104.dip.t-dialin.net. [91.10.33.4])
	by mx.google.com with ESMTPS id gc6sm19758306wib.0.2012.06.10.14.41.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 10 Jun 2012 14:41:53 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2012 23:46:48 +0200
Message-Id: <1339364820-2880-16-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
References: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [RFC, meta-oe 15/27] dhcp: move systemd support to meta-systemd
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
X-List-Received-Date: Sun, 10 Jun 2012 21:52:24 -0000
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
 rename {meta-oe => meta-systemd/meta-oe}/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bbappend (81%)

diff --git a/meta-oe/recipes-connectivity/dhcp/files/dhcpd.service b/meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp/dhcpd.service
similarity index 100%
rename from meta-oe/recipes-connectivity/dhcp/files/dhcpd.service
rename to meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp/dhcpd.service
diff --git a/meta-oe/recipes-connectivity/dhcp/files/dhcrelay.service b/meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp/dhcrelay.service
similarity index 100%
rename from meta-oe/recipes-connectivity/dhcp/files/dhcrelay.service
rename to meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp/dhcrelay.service
diff --git a/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bbappend b/meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bbappend
similarity index 81%
rename from meta-oe/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bbappend
rename to meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bbappend
index edd44c1..7391d30 100644
--- a/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bbappend
+++ b/meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bbappend
@@ -1,9 +1,9 @@
 # look for files in the layer first
-FILESEXTRAPATHS := "${THISDIR}/files"
+FILESEXTRAPATHS := "${THISDIR}/${PN}"
 
 inherit systemd
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 SYSTEMD_PACKAGES = "dhcp-server-systemd dhcp-relay-systemd"
 SYSTEMD_SERVICE_dhcp-server-systemd = "dhcpd.service"
-- 
1.7.4.4



