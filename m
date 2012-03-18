Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S9Mz6-000883-6W
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Mar 2012 21:45:48 +0100
Received: by wibhj13 with SMTP id hj13so2594747wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2012 13:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=AmxPCQS2I4nAwtcxDWZfg70XT6OVfHWLZ1lBlv6AiRA=;
	b=kR8mwsW3vgG/4OkXjcaecrJvv7Sm2Sb9DrYEqGafj6qMeZaGAnT6sFM2aAmwyCpLrT
	KFYFQna2ufBbN4VAsNPYx/lzsbDtRwL7edA6m0SlcVzySVEPrJLCqCZRTcnJ8QKWX276
	nXScXmxBiz13WpWx+itphz5z/DZRcMKunPPZ10ck4ix3Jin1xpANeUzoq4p1NeleWr6C
	f3Caolvv9NaHC8a84NAcNND2oFuxD6rAYsRwsNkXj2jB4mIYEBYWEYyp1wMkiso/dqCT
	Sjr3l+qEdy8rXDaeqZWUUEXUMg0ODHdcvz3YZWarqepjgDG8VWqn188XqdMkj0+HtK09
	7obg==
Received: by 10.216.139.140 with SMTP id c12mr5168344wej.43.1332103017988;
	Sun, 18 Mar 2012 13:36:57 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0D2E.dip.t-dialin.net.
	[79.223.13.46])
	by mx.google.com with ESMTPS id l5sm19761891wia.11.2012.03.18.13.36.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Mar 2012 13:36:57 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Mar 2012 21:40:51 +0100
Message-Id: <1332103254-3729-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1332103254-3729-1-git-send-email-schnitzeltony@googlemail.com>
References: <1332103254-3729-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe 3/6] xfmpc: initial add 0.2.2
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
X-List-Received-Date: Sun, 18 Mar 2012 20:45:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-apps/xfmpc/xfmpc_0.2.2.bb |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-apps/xfmpc/xfmpc_0.2.2.bb

diff --git a/meta-xfce/recipes-apps/xfmpc/xfmpc_0.2.2.bb b/meta-xfce/recipes-apps/xfmpc/xfmpc_0.2.2.bb
new file mode 100644
index 0000000..84d798c
--- /dev/null
+++ b/meta-xfce/recipes-apps/xfmpc/xfmpc_0.2.2.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Music Player Daemon (MPD) client written in GTK+"
+HOMEPAGE = "http://goodies.xfce.org/projects/applications/xfmpc"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+DEPENDS = "gtk+ libxfce4util libxfce4ui libmpd vala-native"
+
+# for now we reccomend our own mpd-server
+RRECOMMENDS_${PN} = "mpd"
+
+inherit xfce-app
+
+SRC_URI[md5sum] = "e4e198850c2467c47783969ac9c16ec0"
+SRC_URI[sha256sum] = "ed0cc2940bd5928bb30fab1531c22185a97bd0cc5beacd9e3be4d4cd994a6862"
-- 
1.7.4.4



