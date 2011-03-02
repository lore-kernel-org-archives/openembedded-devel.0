Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pespin.shar@gmail.com>) id 1PumEW-0008Mc-Kz
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Mar 2011 14:36:53 +0100
Received: by bwz10 with SMTP id 10so137527bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Mar 2011 05:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=lPYMzT3dudDTQFWlboz3npAguga8mURIsuyvw9B5giI=;
	b=JcnvJ1e9rf4A9o67nRK9EfhJq7cb1EBlvokX+M1SrHSMe+ZC/VaUqA/TOpV0bglMUb
	dBdwcw8WjM1lHM0PQRKjWAti1FkYeQQAjJ2tE+pPcHmtJlN5/n5wPGUcP5HVO/F17ilb
	amGcKc9cTti1Ap8XDBxlcVd73UYVHQuonOOW8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=fBgsxkl3QviOA3yD0vU8CB/dQyQHPy8iyVbmfJOFfLHqNDqzbKqAErcrKHNjYzbzoy
	QCFE4MgWssrirJGXdYscmyjW50DAFYnMf5uAHkpraXOKT/Nzruu8xuVnQtmE7cF58+2o
	neVYyXQ2gqsve6w9QUNpIR4puirQ/TvWPbl/A=
Received: by 10.204.59.76 with SMTP id k12mr7722462bkh.70.1299072922409;
	Wed, 02 Mar 2011 05:35:22 -0800 (PST)
Received: from localhost.localdomain ([90.163.57.54])
	by mx.google.com with ESMTPS id z18sm4163436bkf.20.2011.03.02.05.35.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Mar 2011 05:35:21 -0800 (PST)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Mar 2011 14:35:27 +0100
Message-Id: <1299072929-4465-2-git-send-email-pespin.shar@gmail.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <1299072929-4465-1-git-send-email-pespin.shar@gmail.com>
References: <1299072929-4465-1-git-send-email-pespin.shar@gmail.com>
Subject: [PATCH 2/4] netbase: add interfaces config file for exopcslate machine.
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
X-List-Received-Date: Wed, 02 Mar 2011 13:36:53 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 recipes/netbase/netbase/exopcslate/interfaces |   17 +++++++++++++++++
 recipes/netbase/netbase_4.21.bb               |    2 +-
 2 files changed, 18 insertions(+), 1 deletions(-)
 create mode 100644 recipes/netbase/netbase/exopcslate/interfaces

diff --git a/recipes/netbase/netbase/exopcslate/interfaces b/recipes/netbase/netbase/exopcslate/interfaces
new file mode 100644
index 0000000..53b28b5
--- /dev/null
+++ b/recipes/netbase/netbase/exopcslate/interfaces
@@ -0,0 +1,17 @@
+# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
+
+# The loopback interface
+auto lo
+iface lo inet loopback
+
+# Wireless interfaces
+auto wlan0
+iface wlan0 inet dhcp
+        pre-up echo nameserver 208.67.222.222 > /etc/resolv.conf
+        pre-up echo nameserver 208.67.220.220 >> /etc/resolv.conf
+wireless_mode managed
+wireless_essid any
+
+# Bluetooth networking
+iface bnep0 inet dhcp
+
diff --git a/recipes/netbase/netbase_4.21.bb b/recipes/netbase/netbase_4.21.bb
index f3ae6e9..1e27069 100644
--- a/recipes/netbase/netbase_4.21.bb
+++ b/recipes/netbase/netbase_4.21.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "This package provides the necessary \
 infrastructure for basic TCP/IP based networking."
 SECTION = "base"
 LICENSE = "GPLv2"
-PR = "r50"
+PR = "r51"
 
 inherit update-rc.d
 
-- 
1.7.2



