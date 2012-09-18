Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDymC-0001l8-4z
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 16:27:48 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2999326bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 07:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=gp9k5aySXu20qdfHJCv0eHTKsmnD9Fc0+uF8e4gg4zw=;
	b=wUh4F6SLr7DEN9hHsGgTx214Al10FZbQWBDoXfONSTk4lIHnjxyBu9InFw6jP7G1w/
	yA6gorreGn3dXWLtqCU4sO+pCBptOa1RRL1BrUkPxyUcQFS8+KhQ5FfHfaeNyq4yftz0
	iEwhQ12bW8Z8PgMIsRvNS1VglEOiYLiUQnbYi/fh+nJHtc+z3w59O7Mzav8fTgJh9PtX
	gXWFs8s6BL0pwfn4brNld7Nob/707RtJVDZv5Syd2OOkSdnUa1HP/7ZYkkkAqWRVeR09
	vOEjBh9dVoaNFzw+yjRB4ee2EaycOEecy/+2s4EwksSOWIBn63M5+qXoE2YyIb0sYdCS
	JxWA==
Received: by 10.204.154.131 with SMTP id o3mr153848bkw.87.1347977710441;
	Tue, 18 Sep 2012 07:15:10 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id y20sm8006887bkv.11.2012.09.18.07.15.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 07:15:09 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 16:13:19 +0200
Message-Id: <1347977601-28665-39-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/-oe/-multimedia 38/40] xfmpc: initial add 0.2.2
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
X-List-Received-Date: Tue, 18 Sep 2012 14:33:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.2.bb |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.2.bb

diff --git a/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.2.bb b/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.2.bb
new file mode 100644
index 0000000..1f31be9
--- /dev/null
+++ b/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.2.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Music Player Daemon (MPD) client written in GTK+"
+HOMEPAGE = "http://goodies.xfce.org/projects/applications/xfmpc"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+DEPENDS = "gtk+ libxfce4util libxfce4ui libmpd vala-native"
+
+# for now we recommend our own mpd-server
+RRECOMMENDS_${PN} = "mpd"
+
+inherit xfce-app
+
+SRC_URI[md5sum] = "e4e198850c2467c47783969ac9c16ec0"
+SRC_URI[sha256sum] = "ed0cc2940bd5928bb30fab1531c22185a97bd0cc5beacd9e3be4d4cd994a6862"
-- 
1.7.6.5



