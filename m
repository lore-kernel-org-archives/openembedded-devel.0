Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QIu0Z-0007m6-PD
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 04:46:11 +0200
Received: by mail-yx0-f175.google.com with SMTP id 22so1669985yxn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 May 2011 19:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=JnvS+zWm/qCRsbqR7IxytOJBAlHfHc8zvds2bRGZnMc=;
	b=KTbesbALGYwle79H0N25eLmu3Cq1d4WPYY1gyFoQ7Y3dH0kWlutnAefCgMexRyBlUQ
	uCyfiwNQJ9aqVJ1Tff7fYs/fa2Yna0ACbYVBqBor+JdpFZLPwVUcbMjNNc4s4UGejHSh
	U4intUPITypJbYrh+1UynqzEE0MqSF4v4I1kg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=pN1aimUohnLltJolCz/y7oMjcckue3phX9A5LH1ubP5xH0zvhgnFzeOpc7XhMXePK5
	UfRJkQwVZxSBhWjWSozEK9Wrc95nq3OGBLSRzsQL6pBhNepW7h9eDNWtvfweoFxTlWVw
	hR+qEkrTK273gnJGk0DX9XZcuglYsU1j82MxA=
Received: by 10.91.148.10 with SMTP id a10mr4690713ago.43.1304822610069;
	Sat, 07 May 2011 19:43:30 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id v1sm4837128anh.25.2011.05.07.19.43.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 07 May 2011 19:43:29 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 May 2011 02:42:58 +0000
Message-Id: <1304822586-14872-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304822586-14872-1-git-send-email-otavio@ossystems.com.br>
References: <1304822586-14872-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 03/11] setxkbmap: add 1.2.0 version
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
X-List-Received-Date: Sun, 08 May 2011 02:46:12 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-graphics/xorg-app/setxkbmap_1.2.0.bb   |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xorg-app/setxkbmap_1.2.0.bb

diff --git a/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.2.0.bb b/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.2.0.bb
new file mode 100644
index 0000000..46576ce
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.2.0.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+LIC_FILES_CHKSUM = "file://COPYING;md5=22c34ea36136407a77702a8b784f9bd0"
+DEPENDS += " libxkbfile "
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "2f6df89201eb9a2cbfb905d6b82a191e"
+SRC_URI[archive.sha256sum] = "999591bf1ba8ca2a7d480b2c01702396e6c349d499fb583c0de136ec00dbae39"
-- 
1.7.2.5



