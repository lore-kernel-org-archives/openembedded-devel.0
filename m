Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1OYP0e-0004Nv-GX
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Jul 2010 21:49:53 +0200
Received: by mail-pw0-f47.google.com with SMTP id 10so2330627pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jul 2010 12:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=lrWddTh+VeaavpVTam1cVgKYKABuA+FJZt1LuUuquMo=;
	b=rXKmwqiJU7CbtJHH2xuXhxXYqgAdE2+R+EZZklatw4CgRl5gH/MGuRD+vZNCXS146l
	PbHiTNpzrPS5cev8Exg/Ga1P6TdSxyHb2g8AG+3SeP1Y1Dl/12uQQ8ZL4oIQImCbagHj
	7a7Kr0HgUuEIazEilZxz0SmAZgPdJHSKKIaJ4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=kd+WIfF81yhb3vUrWohkgNA7dqD6EsIv8NS2vxqg9A+klt18i+FTTU+2q3jNp816Gq
	B07i7h0yYder4nDRDv/JZdZdiQCNvHdVj3DEX+EY0urpfV+Mg96mIP5sjn/WLtuTOUvz
	GBf/ZNKDVAvwESK0YUGuisRYmviAwzQshjHeA=
Received: by 10.142.194.15 with SMTP id r15mr13005842wff.276.1278963893635;
	Mon, 12 Jul 2010 12:44:53 -0700 (PDT)
Received: from aalonso-pc.lan ([201.153.224.36])
	by mx.google.com with ESMTPS id 23sm5192380wfa.22.2010.07.12.12.44.51
	(version=SSLv3 cipher=RC4-MD5); Mon, 12 Jul 2010 12:44:52 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Jul 2010 14:45:48 -0500
Message-Id: <1278963950-2587-7-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.7.1.1
In-Reply-To: <1278963950-2587-1-git-send-email-aalonso00@gmail.com>
References: <1278963950-2587-1-git-send-email-aalonso00@gmail.com>
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 7/9] xserver-kdrive-common: xilinx virtex5 support
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
X-List-Received-Date: Mon, 12 Jul 2010 19:49:53 -0000

* Add Xserver support for virtex5 platform
* Increase PR

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 .../xserver-kdrive-common/Xserver                  |   11 ++++++++++-
 .../xserver-kdrive-common_0.1.bb                   |    2 +-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/recipes/xserver-kdrive-common/xserver-kdrive-common/Xserver b/recipes/xserver-kdrive-common/xserver-kdrive-common/Xserver
index 347b005..235d349 100644
--- a/recipes/xserver-kdrive-common/xserver-kdrive-common/Xserver
+++ b/recipes/xserver-kdrive-common/xserver-kdrive-common/Xserver
@@ -34,7 +34,14 @@ module_id() {
     # grep "Module ID" /proc/hal/assets | sed "s/.*://"
     ## used to read from /proc/hal/model, but that is removed in 2.6
     # echo ' iPAQ' `cat /proc/hal/model`
-    awk 'BEGIN { FS=": " } /Hardware/ { print $2 } ' </proc/cpuinfo
+    id=`awk 'BEGIN { FS=": " } /Hardware/ { print $2 } ' </proc/cpuinfo`
+	if [ -n "$id" ]; then
+		echo -n "${id}"
+	fi
+    id=`awk 'BEGIN { FS=": " } /platform/ { print $2 } ' </proc/cpuinfo`
+	if [ -n "$id" ]; then
+		echo -n "${id}"
+	fi
 }
 
 export USER=root
@@ -171,6 +178,8 @@ case `module_id` in
                  if [ "$XSERVER" = "/usr/bin/Xorg" ];then
                       ARGS=""
                  fi;; #TODO: handle kdrive
+		 "Xilinx Virtex440")
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
1.7.1.1



