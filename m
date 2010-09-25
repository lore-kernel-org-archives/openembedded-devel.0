Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Ozdvb-0006wK-Gd
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Sep 2010 01:13:24 +0200
Received: by pvg6 with SMTP id 6so977087pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Sep 2010 16:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=VFZ2C5QGunDPvqv2GOV1ndpgIVTg+8yAi45l3j+6HkU=;
	b=TjeCjfT5XC4TON0fH85tEOlSlfjpCbhaA+rVpsq9RtYQJPTBnUFLJFvz86qSBp3Ov4
	0OsblofgdiAiZMJVRLCKjFqYX9KPAlpVfV93ZnwcUe/TYn4pep+wrGgRsS9mjZWkvzJF
	xqPMJMLo6FnNlsp3w2JTXSD6pjmTjhYIzwfAE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=twnZGCdNpXZ8MHVNthGoK7AYPIjPoIBASFSoiVwmWrgWNaB4PWWiaRluiJVYfrHCMw
	Vd1398//5KE/InGsf5zNodcPHp2ZGqwi4tDv1JalvNiLDaUF6JJ601K70RXo7irDhyWu
	Pi/WpoNmlx0vf3mCgX9Xc5c1mdBTTNQRKOJAQ=
Received: by 10.115.90.18 with SMTP id s18mr5942871wal.7.1285456380984;
	Sat, 25 Sep 2010 16:13:00 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id r37sm6791851wak.23.2010.09.25.16.13.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 25 Sep 2010 16:13:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Sep 2010 16:12:33 -0700
Message-Id: <1285456353-27457-13-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1285456353-27457-1-git-send-email-raj.khem@gmail.com>
References: <1285456353-27457-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 12/12] netbase: Add interface information for qemumips64 and qemumips64el
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
X-List-Received-Date: Sat, 25 Sep 2010 23:13:27 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/netbase/netbase/qemumips64/interfaces   |   13 +++++++++++++
 recipes/netbase/netbase/qemumips64el/interfaces |   13 +++++++++++++
 2 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 recipes/netbase/netbase/qemumips64/interfaces
 create mode 100644 recipes/netbase/netbase/qemumips64el/interfaces

diff --git a/recipes/netbase/netbase/qemumips64/interfaces b/recipes/netbase/netbase/qemumips64/interfaces
new file mode 100644
index 0000000..1c6955e
--- /dev/null
+++ b/recipes/netbase/netbase/qemumips64/interfaces
@@ -0,0 +1,13 @@
+# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
+ 
+# The loopback interface
+auto lo
+iface lo inet loopback
+
+# Wired or wireless interfaces
+auto eth0
+iface eth0 inet static
+	address 192.168.1.107
+	netmask 255.255.255.0
+	network 192.168.1.264
+	gateway 192.168.1.254
diff --git a/recipes/netbase/netbase/qemumips64el/interfaces b/recipes/netbase/netbase/qemumips64el/interfaces
new file mode 100644
index 0000000..63a360b
--- /dev/null
+++ b/recipes/netbase/netbase/qemumips64el/interfaces
@@ -0,0 +1,13 @@
+# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
+ 
+# The loopback interface
+auto lo
+iface lo inet loopback
+
+# Wired or wireless interfaces
+auto eth0
+iface eth0 inet static
+	address 192.168.1.108
+	netmask 255.255.255.0
+	network 192.168.1.264
+	gateway 192.168.1.254
-- 
1.7.0.4



