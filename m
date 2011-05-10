Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJoK4-0007D5-I3
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 16:54:04 +0200
Received: by yxn22 with SMTP id 22so2360851yxn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 07:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer; bh=iHlCLdctbpZl+z8uARR1uRHJGPYGjkQ1Cw0Ltvp6k/c=;
	b=aM6sSHYZNpOe2k6IIYfZym1Zv4rKgwarUWG9pbgrxkurAWwxMnBBbVz60U8lKoTI38
	jHemrl3Ib3MBTrcnZRvfa3e5dQL7WH7BnnHy1ehJmK3YWdW5W7RISU6/P2rQzRTozSPC
	k2o5z6F6X/wal94jEXejvuk6WZfHqffcGEdOg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=HJbV2kNFC2lFTNLbOaf0ZUusK6VIu/V4+vq3AFNQEg7Swk9Lo7WmFAaYCc+A1+OtPm
	ozmvcOW6Dc/gTB7m3oHeZirR6P6aZXLMkK14CpU18pdlZ4TBGvjFg6ivivi4KBI+yf4c
	1bASBdCMPoN3hQfy5nKMw627LMlPknZyIcCBE=
Received: by 10.236.63.136 with SMTP id a8mr1619303yhd.339.1305039078544;
	Tue, 10 May 2011 07:51:18 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id l73sm3147845yhn.98.2011.05.10.07.51.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 07:51:16 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 May 2011 14:51:02 +0000
Message-Id: <1305039065-1326-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v1 1/4] setxkbmap: add version 1.2.0
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
X-List-Received-Date: Tue, 10 May 2011 14:54:04 -0000

This is in sync with OE at 6e7e35679200cd55264fae308cd5dec7ef2d1d29.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-graphics/xorg-app/setxkbmap_1.2.0.bb   |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xorg-app/setxkbmap_1.2.0.bb

diff --git a/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.2.0.bb b/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.2.0.bb
new file mode 100644
index 0000000..592a95d
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.2.0.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+LIC_FILES_CHKSUM = "file://COPYING;md5=5feafdbe6dfe9e2bd32325be0cfc86f8"
+DEPENDS += " libxkbfile"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "2f6df89201eb9a2cbfb905d6b82a191e"
+SRC_URI[archive.sha256sum] = "999591bf1ba8ca2a7d480b2c01702396e6c349d499fb583c0de136ec00dbae39"
-- 
1.7.2.5



