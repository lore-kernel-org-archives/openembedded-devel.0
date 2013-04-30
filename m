Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UX5fX-0000Fk-QD
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Apr 2013 10:12:12 +0200
Received: by mail-ee0-f47.google.com with SMTP id b57so94675eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2013 00:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=gOHukIYXep2h6txq4FDrIswkMUCbgssb3LZBBUu2V3E=;
	b=xNwExO030jM9YuCnru5R3ErKyJXAMqa5cxZ0vlZLIi9nBtTBrIvNhSC0oRPA5bJdo0
	4VJiJG2xHp76DcInSca/o9S2ox2s9yL7MEctww6Se6VIWhhX7zSYf7DWuV4XtfiIq+LH
	vfcIcipfDresiNo/QTmc4rofWjcDKLRAiygAaqMvSvxtCzyxGcvuq9wOeL1xo1AkMBqJ
	UKK2bjeygvTJzynVJMHf2bHOZC1DYcPBGE1wjlAHDxWVohi/hL9tb2VhjKM+krWm9Ra1
	+uDArK2XK7Cz7PbTBHFe9YOjj38T3AMAJX42AaWzNwJGcpg9m8CQx1RchK7RzhEUzIHe
	Jbhw==
X-Received: by 10.14.206.129 with SMTP id l1mr87408667eeo.30.1367308461762;
	Tue, 30 Apr 2013 00:54:21 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-204.unitymediagroup.de.
	[95.222.160.204]) by mx.google.com with ESMTPSA id
	e50sm20378335eev.13.2013.04.30.00.54.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 30 Apr 2013 00:54:20 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Apr 2013 09:51:59 +0200
Message-Id: <1367308319-29173-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-systemd] dhcp: do not start dhclient by default on boot
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
X-List-Received-Date: Tue, 30 Apr 2013 08:12:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* most of the time start fails:
  | root@overo:~# systemctl status dhclient.service
  | dhclient.service - Dynamic Host Configuration Protocol (DHCP)
  |         Loaded: loaded (/lib/systemd/system/dhclient.service; enabled)
  |         Active: failed (Result: resources) since Thu 2000-01-06 22:07:27 UTC; 15min ago
  |         Process: 300 ExecStart=/sbin/dhclient -cf /etc/dhcp/dhclient.conf -q -lf /var/lib/dhcp/dhclient.leases $INTERFACES (code=exited, status=0/SUCCESS)
  |
  | Jan 06 22:07:27 overo systemd[1]: Starting Dynamic Host Configuration Proto.....
  | Jan 06 22:07:27 overo systemd[1]: PID file /var/run/dhclient.pid not readab...t.
  | Jan 06 22:07:27 overo systemd[1]: Failed to start Dynamic Host Configuratio...).
* in cases it does not fail to start and we have a managing service (e.g
  networkmanager) two instances of dhclient are running

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-connectivity/dhcp/dhcp_4.2.5.bbappend  |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.5.bbappend b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.5.bbappend
index 22d412a..e9e09d3 100644
--- a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.5.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.5.bbappend
@@ -3,12 +3,13 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 inherit systemd
 
-PRINC := "${@int(PRINC) + 2}"
+PRINC := "${@int(PRINC) + 3}"
 
 SYSTEMD_PACKAGES = "dhcp-server dhcp-relay dhcp-client"
 SYSTEMD_SERVICE_dhcp-server = "dhcpd.service"
 SYSTEMD_SERVICE_dhcp-relay = "dhcrelay.service"
 SYSTEMD_SERVICE_dhcp-client = "dhclient.service"
+SYSTEMD_AUTO_ENABLE_dhcp-client = "disable"
 
 FILES_dhcp-server += "${systemd_unitdir}/system/dhcpd.service"
 FILES_dhcp-relay += "${systemd_unitdir}/system/dhrelay.service"
-- 
1.7.6.5



