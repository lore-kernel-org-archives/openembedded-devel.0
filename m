Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1OeriB-0001ZW-6q
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 17:41:32 +0200
Received: by wwd20 with SMTP id 20so7524749wwd.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 08:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=rFqHIviPoVxyYpdHFzwAi5wB8oowKaZRN0qX/OVpC4I=;
	b=j8P7vwmysHCerA4HtvaoO4lbw1BtVDAxN8l5hNT8o/JZZyu8msAtRJO2M2ifgIBPVl
	pm/EwDZ7JaKIYBOxMloyn5IgF7fy5vQsR1RRVSMsl3VcpvaGBrIhN4ORYCdkP3dA+9Al
	/ZHe+BFvNYvce2/Q00uosgywiBaRcrX1a3W6I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Tfn98dGweNMcvLojbk1iFXEZJ/8MBmR4yt34ebETCzLTrS8cf+7rE8gdP7CawFoJd4
	hGYyU91MBWmxC77W4aQ9pzPGgoQbQ2i3IZsemoXYedks2qDhF9RH7pS3NyOiIOkJMU6D
	rY0/ssh6QQvImXQjSdZ0BFljQ0VhFFrkXnLYc=
Received: by 10.227.138.5 with SMTP id y5mr1860933wbt.204.1280504463864;
	Fri, 30 Jul 2010 08:41:03 -0700 (PDT)
Received: from aalonso-pc.lan ([201.153.218.190])
	by mx.google.com with ESMTPS id h3sm2015014wbb.15.2010.07.30.08.41.01
	(version=SSLv3 cipher=RC4-MD5); Fri, 30 Jul 2010 08:41:03 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jul 2010 10:42:35 -0500
Message-Id: <1280504555-3633-10-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <openembedded-devel@lists.openembedded.org>
References: <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 74.125.82.41
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 10/10] xserver-kdrive-common: xilinx virtex5 support
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
X-List-Received-Date: Fri, 30 Jul 2010 15:41:32 -0000

* Add Xserver support for virtex5 board
* Update module id for Xilinx platforms, xserver
  arguments are setup at runtime by getting
  module id info from /proc/cpuinfo
* Increase PR

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 .../xserver-kdrive-common/Xserver                  |    9 ++++++++-
 .../xserver-kdrive-common_0.1.bb                   |    2 +-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/recipes/xserver-kdrive-common/xserver-kdrive-common/Xserver b/recipes/xserver-kdrive-common/xserver-kdrive-common/Xserver
index 347b005..375b787 100644
--- a/recipes/xserver-kdrive-common/xserver-kdrive-common/Xserver
+++ b/recipes/xserver-kdrive-common/xserver-kdrive-common/Xserver
@@ -34,7 +34,12 @@ module_id() {
     # grep "Module ID" /proc/hal/assets | sed "s/.*://"
     ## used to read from /proc/hal/model, but that is removed in 2.6
     # echo ' iPAQ' `cat /proc/hal/model`
-    awk 'BEGIN { FS=": " } /Hardware/ { print $2 } ' </proc/cpuinfo
+    id=`awk 'BEGIN { FS=": " } /Hardware/ { print $2 } ' </proc/cpuinfo`
+	if [ -n "$id" ]; then
+		echo -n "${id}"
+    else
+        awk 'BEGIN { FS=": " } /platform/ { print $2 } ' </proc/cpuinfo
+	fi
 }
 
 export USER=root
@@ -171,6 +176,8 @@ case `module_id` in
                  if [ "$XSERVER" = "/usr/bin/Xorg" ];then
                       ARGS=""
                  fi;; #TODO: handle kdrive
+		 "Xilinx Virtex"*)
+				 ARGS="$ARGS $PPM" ;;
         *)
                 # It is a device we do not know about, in which case we force
                 # kdrive to use the current framebuffer geometry -- otherwise
diff --git a/recipes/xserver-kdrive-common/xserver-kdrive-common_0.1.bb b/recipes/xserver-kdrive-common/xserver-kdrive-common_0.1.bb
index 52a88b8..04a3f13 100644
--- a/recipes/xserver-kdrive-common/xserver-kdrive-common_0.1.bb
+++ b/recipes/xserver-kdrive-common/xserver-kdrive-common_0.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Common X11 scripts"
 LICENSE = "GPL"
 SECTION = "x11"
-PR = "r45"
+PR = "r46"
 
 SRC_URI = "\
   file://Xdefaults \
-- 
1.7.2



