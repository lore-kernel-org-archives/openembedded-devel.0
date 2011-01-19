Received: from 26.mail-out.ovh.net ([91.121.27.225])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PfaXl-0005lb-J3
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 17:05:57 +0100
Received: (qmail 4737 invoked by uid 503); 19 Jan 2011 16:08:53 -0000
Received: from b9.ovh.net (HELO mail619.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 19 Jan 2011 16:08:53 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 19 Jan 2011 17:57:58 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 19 Jan 2011 17:57:57 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Jan 2011 16:57:29 +0100
Message-Id: <1295452649-28081-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1295452649-28081-1-git-send-email-eric@eukrea.com>
References: <1295452649-28081-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 721983316123037002
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH 2/2] busybox-1.18.2: add latest fixes
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
X-List-Received-Date: Wed, 19 Jan 2011 16:05:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

- hush: fix "cmd & <newline>" problem
98c46d10ee81f206f274da312086a3f0533582af

- disable automatic selection of FEATURE_SUID
3b5acaa4323bd165077e60098af94ad9750d62fd

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/busybox/busybox_1.18.2.bb |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/recipes/busybox/busybox_1.18.2.bb b/recipes/busybox/busybox_1.18.2.bb
index 71b50c8..e6d17d3 100644
--- a/recipes/busybox/busybox_1.18.2.bb
+++ b/recipes/busybox/busybox_1.18.2.bb
@@ -1,11 +1,17 @@
 require busybox_1.1x.inc
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 SRC_URI += " \
 	http://busybox.net/downloads/fixes-1.18.2/busybox-1.18.2-modprobe-small.patch;name=patch01 \
+	http://busybox.net/downloads/fixes-1.18.2/busybox-1.18.2-buildsys.patch;name=patch02 \
+	http://busybox.net/downloads/fixes-1.18.2/busybox-1.18.2-hush.patch;name=patch03 \
 	"
 
 SRC_URI[md5sum] = "69a82091e5710b72db5ce0e14e7c0cd7"
 SRC_URI[sha256sum] = "aa7e1cec8cd9c7f4e56098b9e4bb2ab5d593d5a35f766ad9e6a312289bf57080"
 SRC_URI[patch01.md5sum] = "dda72eaf33d19d6a0ac78e46e9411cfd"
 SRC_URI[patch01.sha256sum] = "ed5d83040414d035138bf484ccd514817342b143baff43ffff6ba556952de7ed"
+SRC_URI[patch02.md5sum] = "c7ae920c8adb767fc35b3a8ca3ad7351"
+SRC_URI[patch02.sha256sum] = "d9398bc5e65b7eff261f20526b6e07d61bef64dd978c92e6317334bfaa135938"
+SRC_URI[patch03.md5sum] = "854045f4b713df759b49945550843acf"
+SRC_URI[patch03.sha256sum] = "b70c4406307942f38b2c8d94675b7ca7db8ba0351ae916f838d04856b5aad33f"
-- 
1.6.3.3



