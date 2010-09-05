Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hvontres@gmail.com>) id 1Os2fX-00034T-FM
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Sep 2010 02:01:13 +0200
Received: by pxi11 with SMTP id 11so591572pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Sep 2010 17:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=uRWIGCnqehn4Ra4Xxfb/ichLB3O2ZRy87uhVL9Y28a8=;
	b=nN5PGpXfL01fX4OBa1kAnWTepB5GGUAOiacg5VoB8oeHI1wXvHRtJRolXbXQDamiaz
	VmC3I1sJlCz0b/AmINLAsXIM8lpLJ/W0QFtusQtPDXY1Bk16FdIAJwvb8S4ybxFKfT56
	kYcNmNQN27xzzE+TmoT0P4AWG5Mo/UOj1N6wQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=ZfgN3MGm7cReTsIs06jk/2/u+tEtU3+e4ngyAgSUtq9o5nhc8EusV78tLt/bPMQ7qO
	j3pfigoO0akbyQ6/WXIUPQ0OXJr+42ZM2s7x5YpGmSKLSpi11zX0vKQiCQEMAfGGSNj3
	7RFpMkkXhMWsIsdnqDcohsojSw/46aYGCOd1U=
Received: by 10.142.60.4 with SMTP id i4mr841181wfa.252.1283644832822;
	Sat, 04 Sep 2010 17:00:32 -0700 (PDT)
Received: from localhost ([75.3.200.91])
	by mx.google.com with ESMTPS id t11sm1460531wfc.22.2010.09.04.17.00.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 04 Sep 2010 17:00:31 -0700 (PDT)
From: Henry von Tresckow <hvontres@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 Sep 2010 17:00:14 -0700
Message-Id: <1283644814-27013-1-git-send-email-hvontres@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: hvontres@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] dnsmasq: add version 2.55 from upstream
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
X-List-Received-Date: Sun, 05 Sep 2010 00:01:13 -0000

Signed-off-by: Henry von Tresckow <hvontres@gmail.com>
---
 recipes/dnsmasq/dnsmasq-dbus_2.55.bb |   13 +++++++++++++
 recipes/dnsmasq/dnsmasq_2.55.bb      |    4 ++++
 2 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 recipes/dnsmasq/dnsmasq-dbus_2.55.bb
 create mode 100644 recipes/dnsmasq/dnsmasq_2.55.bb

diff --git a/recipes/dnsmasq/dnsmasq-dbus_2.55.bb b/recipes/dnsmasq/dnsmasq-dbus_2.55.bb
new file mode 100644
index 0000000..896952d
--- /dev/null
+++ b/recipes/dnsmasq/dnsmasq-dbus_2.55.bb
@@ -0,0 +1,13 @@
+# dnsmasq with support for DBus interface
+
+require dnsmasq_${PV}.bb
+
+S = "${WORKDIR}/dnsmasq-${PV}"
+
+DEPENDS = "dbus"
+EXTRA_OEMAKE = "COPTS=-DHAVE_DBUS"
+
+do_install_append () {
+        install -d ${D}${sysconfdir}/dbus-1/system.d
+        install -m 644 dbus/dnsmasq.conf ${D}${sysconfdir}/dbus-1/system.d/
+}
diff --git a/recipes/dnsmasq/dnsmasq_2.55.bb b/recipes/dnsmasq/dnsmasq_2.55.bb
new file mode 100644
index 0000000..5f87704
--- /dev/null
+++ b/recipes/dnsmasq/dnsmasq_2.55.bb
@@ -0,0 +1,4 @@
+require dnsmasq.inc
+
+SRC_URI[dnsmasq-2.55.md5sum] = "b093d7c6bc7f97ae6fd35d048529232a"
+SRC_URI[dnsmasq-2.55.sha256sum] = "cf63ecf5977f00474cbda98376a9d8743500a82fd98e13f43d7037bce9f9f929"
-- 
1.7.0.4



