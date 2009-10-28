Received: from [209.85.219.209] (helo=mail-ew0-f209.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eballetbo@gmail.com>) id 1N344N-0004vU-Ef
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Oct 2009 09:39:54 +0100
Received: by ewy5 with SMTP id 5so489220ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2009 01:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=CFLzsTzT3NZ1NWGjqWz8zQL8QR5jS4bW5nA33X+vLCw=;
	b=UNSh9ECF0S+dfOv0uT1F8n1LyvXueFJ4eFb8L1TKVF97fw9cgKKjhh5+UOZwFicaWx
	Bp068EcrD4Hx4yvyN/hC3pPXx9m51D+pLaFb6CODNSRMyUI9JOJIs0ZpweUs8YMFdDhd
	E5/BLVWU7h5ixS8uzmC4WEYm3VAPWjGy2zbow=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=I2YB9XCHLyelb/H23uYUuzLHgyuJGwv26CmYRWE3fYPZS6xj8T0kxI8u5/rIKPx1ha
	8LtnHUfLUu4vtk/hmNc4ThrYPLuOrLBFYJ9Yf9kl8PVN+YErbVWFKaC9GgE7rMPpNStK
	RNs0SWKfcXAdGeE/p05cKoMoxbkbwgwelpPxQ=
Received: by 10.211.143.10 with SMTP id v10mr3066346ebn.57.1256719124966;
	Wed, 28 Oct 2009 01:38:44 -0700 (PDT)
Received: from localhost.localdomain (248.Red-213-97-239.staticIP.rima-tde.net
	[213.97.239.248])
	by mx.google.com with ESMTPS id 10sm2203065eyz.19.2009.10.28.01.38.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 28 Oct 2009 01:38:44 -0700 (PDT)
From: Enric Balletbo i Serra <eballetbo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Oct 2009 09:38:38 +0100
Message-Id: <1256719119-2413-5-git-send-email-eballetbo@gmail.com>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1256719119-2413-4-git-send-email-eballetbo@gmail.com>
References: <1256719119-2413-1-git-send-email-eballetbo@gmail.com>
	<1256719119-2413-2-git-send-email-eballetbo@gmail.com>
	<1256719119-2413-3-git-send-email-eballetbo@gmail.com>
	<1256719119-2413-4-git-send-email-eballetbo@gmail.com>
X-SA-Exim-Connect-IP: 209.85.219.209
X-SA-Exim-Mail-From: eballetbo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Enric Balletbo i Serra <eballetbo@iseebcn.com>
Subject: [STABLE][PATCH 4/5] xserver-xf86-config: Add version for IGEP v2 board
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
X-List-Received-Date: Wed, 28 Oct 2009 08:39:54 -0000

From: Enric Balletbo i Serra <eballetbo@iseebcn.com>


Signed-off-by: Enric Balletbo i Serra <eballetbo@iseebcn.com>
---
 .../xserver-xorg-conf/igep0020/xorg.conf           |   29 ++++++++++++++++++++
 recipes/xorg-xserver/xserver-xorg-conf_0.1.bb      |    2 +-
 2 files changed, 30 insertions(+), 1 deletions(-)
 create mode 100644 recipes/xorg-xserver/xserver-xorg-conf/igep0020/xorg.conf

diff --git a/recipes/xorg-xserver/xserver-xorg-conf/igep0020/xorg.conf b/recipes/xorg-xserver/xserver-xorg-conf/igep0020/xorg.conf
new file mode 100644
index 0000000..07d849d
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg-conf/igep0020/xorg.conf
@@ -0,0 +1,29 @@
+Section "Module"
+        Load    "extmod"
+        Load    "dbe"
+        Load    "glx"
+        Load    "freetype"
+        Load    "type1"
+        Load    "record"
+        Load    "dri"
+EndSection
+
+Section "Monitor"
+        Identifier      "Builtin Default Monitor"
+EndSection
+
+Section "Device"
+        Identifier      "Builtin Default fbdev Device 0"
+        Driver  "omapfb"
+EndSection
+
+Section "Screen"
+        Identifier      "Builtin Default fbdev Screen 0"
+        Device  "Builtin Default fbdev Device 0"
+        Monitor "Builtin Default Monitor"
+EndSection
+
+Section "ServerLayout"
+        Identifier      "Builtin Default Layout"
+        Screen  "Builtin Default fbdev Screen 0"
+EndSection
diff --git a/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb b/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
index 95aa82b..67fc683 100644
--- a/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
+++ b/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Machine specific xorg.conf files"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "file://xorg.conf"
 
-- 
1.5.4.3



