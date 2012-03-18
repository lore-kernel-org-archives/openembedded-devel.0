Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S9Mz4-000881-T3
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Mar 2012 21:45:46 +0100
Received: by wibhm17 with SMTP id hm17so2533275wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2012 13:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=0OpVr3IzEYfhJBOpbRGQ4RdmX99VYwsQKC9/nC2eWlU=;
	b=nCTPgooJ1/f9hEbV6CeM1XSZoR4wfL2r+8/we9TDA/Rhsu2dnxgzmtmOR9OpdsCKTC
	Ktt4obfs9l5qmRuzm4SqVBFyBBXfYpgee39Ce6/r+jKjs4E6zNMdNpi6bgod6pMAoiBp
	aO4YOW+qfemTDroaFSTAwlpnIeelNIgs8H03P1dzuzyqI2pzcbDCPtnycBsj2flSWGSm
	ImTao2Dq1BpI57iUN0yPEQVvAjiEKIIeRBWmDK7Jq9pWgNDEAk5QzOjGS5d3bvKhnzug
	RjxyT+yEuubrLm2AMeEp0q9V8ac29cRWF9ggi3VoY/VG1tTFy9oYFnUtiQXG2V4HPgHz
	45CA==
Received: by 10.216.136.13 with SMTP id v13mr5603348wei.32.1332103016637;
	Sun, 18 Mar 2012 13:36:56 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0D2E.dip.t-dialin.net.
	[79.223.13.46])
	by mx.google.com with ESMTPS id l5sm19761891wia.11.2012.03.18.13.36.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Mar 2012 13:36:55 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Mar 2012 21:40:50 +0100
Message-Id: <1332103254-3729-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1332103254-3729-1-git-send-email-schnitzeltony@googlemail.com>
References: <1332103254-3729-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe 2/6] libmpd: initial add 11.8.17
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
X-List-Received-Date: Sun, 18 Mar 2012 20:45:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-multimedia/musicpd/libmpd_11.8.17.bb   |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/musicpd/libmpd_11.8.17.bb

diff --git a/meta-oe/recipes-multimedia/musicpd/libmpd_11.8.17.bb b/meta-oe/recipes-multimedia/musicpd/libmpd_11.8.17.bb
new file mode 100644
index 0000000..b58a4fa
--- /dev/null
+++ b/meta-oe/recipes-multimedia/musicpd/libmpd_11.8.17.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "Music Player Daemon library"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+HOMEPAGE ="http://sourceforge.net/projects/musicpd"
+DEPENDS = "glib-2.0"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/musicpd/${PN}/${PV}/${PN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "5ae3d87467d52aef3345407adb0a2488"
+SRC_URI[sha256sum] = "fe20326b0d10641f71c4673fae637bf9222a96e1712f71f170fca2fc34bf7a83"
+
+inherit autotools
-- 
1.7.4.4



