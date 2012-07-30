Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Svrse-0002tu-Rg
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jul 2012 17:27:36 +0200
Received: by bkcik5 with SMTP id ik5so2201258bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2012 08:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=hDmz45dxud0ke4svUJDzjOCY2LGZDj/BhtrzAL71RJI=;
	b=wUZMqF0viE1yod95bXkBTLsgBSrl68qpmxL7Cd2QsEixnZ5StbNOvOzASc0pDYzNBy
	kJQWoSNMmMRDaXri8mGbTu+TidwYWb91DBnvVx33659NimANNcAOnIL++4Ud0WbbVRWr
	3krWbaZ997+oi5LMDn1iOCb7AckrwCiIDlgESLMYA6erN93ORm7vSyICC8kTr7Lj79AO
	ed1tbsp3ZfnxQmFEN6DvyVrwD6sFAN9nGrHRHkNsyYQa20k0AOOUrS1d54FUJtvILXaA
	nTapGIQqauuAmpgcF7M7i2OZVwPa1DUNoQxXdyoJIgXU9aXvCuMm65k5qzwhMgnNbyvi
	Ae+Q==
Received: by 10.204.128.213 with SMTP id l21mr4018626bks.84.1343661361184;
	Mon, 30 Jul 2012 08:16:01 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id t23sm4009138bks.4.2012.07.30.08.15.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jul 2012 08:16:00 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Jul 2012 17:15:28 +0200
Message-Id: <1343661328-26631-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1343661328-26631-1-git-send-email-schnitzeltony@googlemail.com>
References: <1343661328-26631-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe 2/2] gnome-menus: stop configure detecting host's python
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
X-List-Received-Date: Mon, 30 Jul 2012 15:27:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch does not cause python bindings builded properly (native headers included)

error message was:
ERROR: This autoconf log indicates errors, it looked at host include and/or library paths while determining system capabilities.
Rerun configure task after fixing this. The path was '/home/andreas/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/gnome-menus-2.30.5-r0/gnome-menus-2.30.5'
ERROR: Function failed: do_qa_configure
ERROR: Logfile of failure stored in: /home/andreas/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/gnome-menus-2.30.5-r0/temp/log.do_configure.7913
NOTE: package gnome-menus-2.30.5-r0: task do_configure: Failed

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../gnome-menus/gnome-menus_2.30.5.bb              |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb
index d4057c0..f8b2fac 100644
--- a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb
+++ b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb
@@ -3,10 +3,11 @@ SECTION = "x11/gnome"
 LICENSE = "GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LIB;md5=5f30f0716dfdd0d91eb439ebec522ec2"
+PR = "r1"
 
 DEPENDS = "python libxml2 gconf popt gtk+"
 
-inherit gnome pkgconfig python-dir
+inherit gnome pkgconfig python-dir pythonnative
 
 SRC_URI[archive.md5sum] = "caa6772e63ed5870cf43dc3d354e0624"
 SRC_URI[archive.sha256sum] = "6dcc565006d6e8c2025ae83ab1f82edf6bd04d61c804c0dc9bf5ea50629c4caa"
-- 
1.7.6.5



