Received: from [209.85.219.209] (helo=mail-ew0-f209.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1N5f3N-0008H3-TV
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Nov 2009 13:33:36 +0100
Received: by ewy5 with SMTP id 5so1613700ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2009 04:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=1hmwHZYhwJ5F3ePiDNmfVmEGwn6XXej0EWJ7eQV4Nk0=;
	b=YKgCoVszSI69NSXof331gWwmfCBzeCQDCjk7hBelSYHwfufRM/GrlBmz4LX4f8qM1M
	hsLWSNAlojrDcGp+t4WEkj8Kpb7cHapG982wWtmimmlMOeSSLVmNFKOlRlHqT/KZj8j8
	2fYjPvHRhB2yQ3QC+XjUcNlZYohyb2IhQ6utw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=jW8Yw4am19uNHPM3sfc/YcidxyNPZhHj626/C/7bFFbApu5vYyCMX8P5Vvi4x/6DdP
	HB/djxDgwnxXE1dybXS0HdF0k+RTHBsfhNVfmm2NW7Rp4bQJmMO+LZfgQpWsbSPBMqHR
	QMIPeaGqfDP9EMcLEcHlGGmsn95/tc+nR0SBA=
Received: by 10.213.58.16 with SMTP id e16mr1642060ebh.17.1257337941088;
	Wed, 04 Nov 2009 04:32:21 -0800 (PST)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 24sm3324358eyx.37.2009.11.04.04.32.19
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 04 Nov 2009 04:32:20 -0800 (PST)
From: Koen Kooi <koen.kooi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Nov 2009 13:32:04 +0100
Message-Id: <1257337925-46801-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.1
In-Reply-To: <1257337925-46801-1-git-send-email-koen@dominion.thruhere.net>
References: <1257337925-46801-1-git-send-email-koen@dominion.thruhere.net>
X-SA-Exim-Connect-IP: 209.85.219.209
X-SA-Exim-Mail-From: koen.kooi@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Koen Kooi <koen@openembedded.org>, Koen Kooi <k-kooi@ti.com>
Subject: [STABLE][PATCH 2/3] xserver-xorg-conf: add omap3517-evm support
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
X-List-Received-Date: Wed, 04 Nov 2009 12:33:37 -0000

From: Koen Kooi <koen@openembedded.org>

* This fixes the "blank screen" problem Frank Walzer reported

Signed-off-by: Koen Kooi <k-kooi@ti.com>

---
 .../xserver-xorg-conf/omap3517-evm/xorg.conf       |   29 ++++++++++++++++++++
 recipes/xorg-xserver/xserver-xorg-conf_0.1.bb      |    2 +-
 2 files changed, 30 insertions(+), 1 deletions(-)
 create mode 100644 recipes/xorg-xserver/xserver-xorg-conf/omap3517-evm/xorg.conf

diff --git a/recipes/xorg-xserver/xserver-xorg-conf/omap3517-evm/xorg.conf b/recipes/xorg-xserver/xserver-xorg-conf/omap3517-evm/xorg.conf
new file mode 100644
index 0000000..983bb08
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg-conf/omap3517-evm/xorg.conf
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
1.6.1



