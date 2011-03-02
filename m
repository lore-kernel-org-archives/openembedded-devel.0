Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pespin.shar@gmail.com>) id 1PumES-0008MQ-Uj
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Mar 2011 14:36:48 +0100
Received: by mail-bw0-f47.google.com with SMTP id 10so137508bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Mar 2011 05:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=PKX1kKbYSQNJutKaTs/LPgYi2jWxPLO+E6VUvobg6r4=;
	b=f1/qZ6s353GanCDzZcXkJbblwHf4hIJARC9iWyJn6x0bEdUoqgGXutur6JMpEMzIml
	naJcj1r+NyLZmz2+r1ysvbQcMcWI2vYzlMwP4m2N9NpyF+2Ib/Lf7Vs3PXamCYh0d2DJ
	jM7TRp/sJterDY1DZzY1OWqH0qLqgCw8IXks4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=OgVRz/FJyVJ60WXbomJLAggP2hXbpl8GIX1YHPDr99DJvbBXQ9f5h1FiQ/L9jXVCFU
	t9gXhYMNBhcXjLQUYMZUR3qgdLNp1gz0kKKprTEjWGlOQHds3wZ5Q+fZ7bZQf3LW6/xM
	7vpp7qu8rvvgYio31A1Jqr+qf268BKTp9ItUk=
Received: by 10.204.52.136 with SMTP id i8mr7272846bkg.74.1299072924010;
	Wed, 02 Mar 2011 05:35:24 -0800 (PST)
Received: from localhost.localdomain ([90.163.57.54])
	by mx.google.com with ESMTPS id z18sm4163436bkf.20.2011.03.02.05.35.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Mar 2011 05:35:23 -0800 (PST)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Mar 2011 14:35:28 +0100
Message-Id: <1299072929-4465-3-git-send-email-pespin.shar@gmail.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <1299072929-4465-1-git-send-email-pespin.shar@gmail.com>
References: <1299072929-4465-1-git-send-email-pespin.shar@gmail.com>
Subject: [PATCH 3/4] xserver-xorg-conf: add xorg.conf config file for exopcslate machine.
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
X-List-Received-Date: Wed, 02 Mar 2011 13:36:49 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 .../xserver-xorg-conf/exopcslate/xorg.conf         |   15 +++++++++++++++
 recipes/xorg-xserver/xserver-xorg-conf_0.1.bb      |    2 +-
 2 files changed, 16 insertions(+), 1 deletions(-)
 create mode 100644 recipes/xorg-xserver/xserver-xorg-conf/exopcslate/xorg.conf

diff --git a/recipes/xorg-xserver/xserver-xorg-conf/exopcslate/xorg.conf b/recipes/xorg-xserver/xserver-xorg-conf/exopcslate/xorg.conf
new file mode 100644
index 0000000..945bc35
--- /dev/null
+++ b/recipes/xorg-xserver/xserver-xorg-conf/exopcslate/xorg.conf
@@ -0,0 +1,15 @@
+Section "InputDevice"
+        Identifier      "touchscreen"
+        Driver          "evtouch"
+        Option          "Device" "/dev/input/touchscreen0"
+        Option          "DeviceName" "touchscreen"
+        Option          "MinX" "0"
+        Option          "MinY" "0"
+        Option          "MaxX" "4094"
+        Option          "MaxY" "4094"
+        Option          "ReportingMode" "Raw"
+        Option          "SendCoreEvents" "true"
+        Option          "AutoServerLayout" "on"
+        Option          "AccelerationProfile" "0"
+EndSection
+
diff --git a/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb b/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
index 9db7962..692df9d 100644
--- a/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
+++ b/recipes/xorg-xserver/xserver-xorg-conf_0.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Machine specific xorg.conf files"
-PR = "r42"
+PR = "r43"
 
 SRC_URI = "file://xorg.conf"
 
-- 
1.7.2



