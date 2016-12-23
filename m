Return-Path: <marcel@ziswiler.com>
X-Greylist: delayed 305 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 23 Dec 2016 10:27:48 UTC
Received: from mout.perfora.net (mout.perfora.net [74.208.4.196])
	by mail.openembedded.org (Postfix) with ESMTP id D7EAD7767A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Dec 2016 10:27:48 +0000 (UTC)
Received: from marcel-pc.toradex.int.net ([84.227.37.153]) by
	mrelay.perfora.net (mreueus001 [74.208.5.2]) with ESMTPA (Nemesis) id
	0Lm5HL-1cthoS0kqn-00ZdIJ; Fri, 23 Dec 2016 11:22:37 +0100
From: Marcel Ziswiler <marcel@ziswiler.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Dec 2016 11:22:30 +0100
Message-Id: <20161223102230.16697-1-marcel@ziswiler.com>
X-Mailer: git-send-email 2.9.3
X-Provags-ID: V03:K0:ucf0wlDI9Rd3+kdPm9ugDUvC2rAKSK3C2aGhqW7OV8+7lPT5Pd5
	wwVr+wNCURRHsIQFQuAzov34lCNNYZbfaTuU8DrOHuYqWk+qqUBsyjCGQUUI8ZRrE9SEXCH
	wcFGGRQs34FN3BoyszbuOq3Juf9W7okIH4epUgx+Fd+vI/gtJPnDikRJzkS3e+orIC6YhCL
	kGm5sb2VkpH1hyFOVca/w==
X-UI-Out-Filterresults: notjunk:1;V01:K0:GqUl7ouEGuI=:hOJUD9oLGxeYR3f3lB1yXd
	bM72QMANjWMGFjUGa3r/c4nJB+k+cRPzdAgYudpAhhZis3EOuYEwZdWmQWWYAb/2Q+75mNG/G
	y7HnWm527mi1vkJOGTlTfvrnU5vyvxL71xDHVDOYVPEm+XWhc2JtSeqD8ALhSrJDC29ao2wcn
	Hfd4sfC3y6jjxF3qW7sHGlZEJ4yItidvokqp96LCbTa+yR6y2Rg21qOl+5VdEoJhRNRH/GJVq
	plykQ3sGm82rFX3W3BLtPcFm4uWvgtjhI5H0DAgj4Eo5DgSnYVeH/mUyCe7M95bsALWEHWPfH
	IRNpv5yzBGLE5XtpHMq+ZlVc0/x/GHm1VYS7Y+kZu4uHQ3o//HCTk00F1gXkiiLq1hLBA8zWh
	Q/iAFa2mZhPlJrGSI0vtCjBttg0iFUFBer1yqExdSjhJus3vbPxMGqO34jKMx5cM2zEfzhGbu
	otKyWk5QI6NJ8ittVnk+DQp0fj1j3hk2GyYQEF4UtAwp5O+pzRQNVRu8ZxmtwuuTW4CGs5hVb
	lZ6fCVWs0zd1QBza9hEhfW1qvlLOHMEnC9pPTukk4hq4BEH7o9C4cY3/mBQHexsgdeYHpHC7j
	r4WdobGjNchN6Y49DteNHQiD8iGKhjEVOHspYLcmjArbzQjS/g/x9GdB6jBjJUD6j4ayHAL//
	l/+tjl3uT4Mv3jRxuGg+1shdSxKEsoXF93BOpNBq83qsgiE3XyjCTzROXthUuQJX8jTg=
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	Jonathan David <jonathan.david@ni.com>,
	Stefan Agner <stefan.agner@toradex.com>,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [PATCH] xinput-calibrator: fix operation on multihead configuration
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Dec 2016 10:27:55 -0000

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

As e.g. the Toradex Colibri T20, Apalis/Colibri T30 and Apalis TK1
modules are multihead capable and if HDMI is plugged in while the xinput
calibrator was run this led to the following error message:

root@apalis-t30:~# xinput_calibrator_once.sh
Unknown option: 640x480

Fix this by just using the first detected heads geometry definition.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 .../add-geometry-input-when-calibrating.patch                 | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/add-geometry-input-when-calibrating.patch b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/add-geometry-input-when-calibrating.patch
index 9dc94ae..296b075 100644
--- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/add-geometry-input-when-calibrating.patch
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator/add-geometry-input-when-calibrating.patch
@@ -1,6 +1,6 @@
-From 1cb83759632bb218559c4d0d65ff79f868c03dc5 Mon Sep 17 00:00:00 2001
-From: "Maxin B. John" <maxin.john@intel.com>
-Date: Tue, 9 Aug 2016 17:03:31 +0300
+From d4699c60c773e75a68227f82afea0b607667a4c0 Mon Sep 17 00:00:00 2001
+From: "Marcel Ziswiler" <marcel.ziswiler@toradex.com>>
+Date: Thu, 22 Dec 2016 11:34:31 +0100
 Subject: [PATCH] add geometry input when calibrating
 
 Send monitor geometry to xinput_calibrator when running the script
@@ -9,8 +9,11 @@ Update:
 
 Upstream-Status: Inappropriate [no longer maintained]
 
+Multihead capability update curtsy Toradex.
+
 Signed-off-by: Jonathan David <jonathan.david@ni.com>
 Signed-off-by: Maxin B. John <maxin.john@intel.com>
+Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
 ---
  scripts/xinput_calibrator_pointercal.sh | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
@@ -24,7 +27,7 @@ index fccb197..fea7c2f 100755
  fi
  
 -CALDATA=`$BINARY --output-type xinput -v | tee $LOGFILE | grep '    xinput set' | sed 's/^    //g; s/$/;/g'`
-+RESOLUTION=$(xrandr | awk -F '[[:space:]+]' '/ connected/ { if ($3 != "primary") print $3; if ($3 == "primary") print $4 }')
++RESOLUTION=$(xrandr | awk -F '[[:space:]+]' '/ connected/ { if ($3 != "primary") print $3; if ($3 == "primary") print $4 }' | sed q)
 +CALDATA=`$BINARY --geometry $RESOLUTION --output-type xinput -v | tee $LOGFILE | grep '    xinput set' | sed 's/^    //g; s/$/;/g'`
  if [ ! -z "$CALDATA" ] ; then
    echo $CALDATA > $CALFILE
-- 
2.9.3


