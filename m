Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QIpmE-0000E5-0w
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 00:15:07 +0200
Received: by gyf1 with SMTP id 1so1641851gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 May 2011 15:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=JnvS+zWm/qCRsbqR7IxytOJBAlHfHc8zvds2bRGZnMc=;
	b=cceRi4FHU1qileZw0evd6MJpEsMc2NgmBJPLC4AED2oQYp2VukB7F4O5XcXEkJrKef
	C6tqum09o2HpeENjnIbiWWwk+fZglrPRD7Fxk01PYcAVHRs8LW0kr/1TbM969EnaKDf2
	XKD6OMaV3CFEkV03LmQlLlHC0oLf9h/Hn86Hc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=jPMV23eidltZd18BhIlsL40pTi2IGUjgSDrHZeMk+qEeOX4AJKcU3DgBHo5MVN2Pi1
	0ajeYTwXGkO4CT5spgGJzkmLmwxDBdEfM1VQUwPyEDzloExFifrq2Xi+RAVYF7tvmH4Q
	F84JSPmJIROU7kPm/sVeE8EaLSlsmlEwV8aiw=
Received: by 10.236.144.230 with SMTP id n66mr3139849yhj.17.1304806343300;
	Sat, 07 May 2011 15:12:23 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id g2sm2005922yhc.76.2011.05.07.15.12.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 07 May 2011 15:12:22 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 May 2011 22:11:51 +0000
Message-Id: <1304806316-9716-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304806316-9716-2-git-send-email-otavio@ossystems.com.br>
References: <BANLkTi=UexRucCByH0SrL-j0_+dB4DCC7Q@mail.gmail.com>
	<1304806316-9716-1-git-send-email-otavio@ossystems.com.br>
	<1304806316-9716-2-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 3/8] setxkbmap: add 1.2.0 version
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
X-List-Received-Date: Sat, 07 May 2011 22:15:07 -0000

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



