Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJ75z-0001Wn-MG
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 May 2011 18:44:39 +0200
Received: by gwb11 with SMTP id 11so1743904gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 May 2011 09:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=c1HT42IZzbwQvWuV/3+S9gsTrG2fgEdDWNDeTO7/MIc=;
	b=lZhbW/5TBNXWrHpuC646x4Q0L5/yver2HbzF+8EdGAocIjB4bWj/s3L+8/54WnwOOD
	ozzEnE4Dv3ocTCxKkGyXQiCkwiOclrQlCHCzAOGdw4pjV0reb+QU/0GZ+Ajkw4GKxQKh
	nIxlfYuctN/U96OLVDcvXoxFAMy99BxRXWhI8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=LQNhW8pXV9vZZsIwc6CTsPoAvXm07ica9SNNH4Ewughzx3kFhxwqO5s/n2vhFxD6HA
	G2yhHRy2fgfAFZkWoOgWYAkkp2PdTcnLqArWgVS0j/4c1KKv9Qlwe0eqewmluMjDkAKV
	YRzZDrB2tNPTHPKUTSPU4Hq6cUn19/MuMv3F0=
Received: by 10.236.153.193 with SMTP id f41mr6407974yhk.407.1304872913831;
	Sun, 08 May 2011 09:41:53 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id l74sm2245064yhn.96.2011.05.08.09.41.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 08 May 2011 09:41:53 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 May 2011 16:41:27 +0000
Message-Id: <1304872895-21596-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304872895-21596-1-git-send-email-otavio@ossystems.com.br>
References: <1304872895-21596-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v3 03/11] setxkbmap: add version 1.2.0
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
X-List-Received-Date: Sun, 08 May 2011 16:44:39 -0000

This is in sync with OE at 6e7e35679200cd55264fae308cd5dec7ef2d1d29.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-graphics/xorg-app/setxkbmap_1.2.0.bb   |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xorg-app/setxkbmap_1.2.0.bb

diff --git a/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.2.0.bb b/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.2.0.bb
new file mode 100644
index 0000000..2d153e4
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.2.0.bb
@@ -0,0 +1,8 @@
+require xorg-app-common.inc
+LIC_FILES_CHKSUM = "file://COPYING;md5=22c34ea36136407a77702a8b784f9bd0"
+DEPENDS += " libxkbfile"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "2f6df89201eb9a2cbfb905d6b82a191e"
+SRC_URI[archive.sha256sum] = "999591bf1ba8ca2a7d480b2c01702396e6c349d499fb583c0de136ec00dbae39"
-- 
1.7.2.5



