Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TJPPP-0001Vf-NI
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Oct 2012 15:54:43 +0200
Received: by ggnv1 with SMTP id v1so820049ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Oct 2012 06:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=6pH/2Y/6yvYeQPXZ1790TEI23WEWM73U1zTT/cKKJD8=;
	b=Wg3ZNjXZAD4UWRNd40l2wuMGLAr9Uc4AIpPOEXUOT+Vi7s5aoF9gSwlqRKn78Wtl12
	Oo4T3TehEnbmzDCGmrk/tAetOc+rmWxzs/VHDt8IdsUbr1BzCKE1agoFeFkJyk13JXye
	Pmmlr2+U6/LntW/gVpba+f92LvFMWUyA67yrzWDF3JTGNr9VtHnF7btWt38A52z9SZs4
	9M+oGJ/Bqw/hh0j3W2zf0qrfTtJapUhrzFfqE17tQCUhhkDOqdTl1n5DnQfcig1IEW0n
	FcAfxoqJa/Bv0PKmATux2Apv0atesIYpsJAIgh3e7llO6iEEXV6h9I+X9qQ68LM6FsGe
	W2Bw==
Received: by 10.236.200.168 with SMTP id z28mr1844481yhn.34.1349271703854;
	Wed, 03 Oct 2012 06:41:43 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id l16sm3906857anm.6.2012.10.03.06.41.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Oct 2012 06:41:43 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Oct 2012 10:41:31 -0300
Message-Id: <1349271693-6378-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1349271693-6378-1-git-send-email-otavio@ossystems.com.br>
References: <1349271693-6378-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 2/4] lockdev: Add recipe based on upcoming 1.0.4 version
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
X-List-Received-Date: Wed, 03 Oct 2012 13:54:43 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/lockdev/lockdev_git.bb |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/lockdev/lockdev_git.bb

diff --git a/meta-oe/recipes-support/lockdev/lockdev_git.bb b/meta-oe/recipes-support/lockdev/lockdev_git.bb
new file mode 100644
index 0000000..beec5a6
--- /dev/null
+++ b/meta-oe/recipes-support/lockdev/lockdev_git.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "Locking devices library" 
+SECTION = "libs"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM="file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+PV = "1.0.3+git${SRCPV}"
+
+SRCREV = "16b899645d32012cc94cc9232f64d4ddaaf0b795"
+SRC_URI = "git://anonscm.debian.org/lockdev/lockdev.git;protocol=git"
+
+S = "${WORKDIR}/git"
+
+inherit lib_package autotools
+
+do_configure_prepend () {
+    ./scripts/git-version > VERSION
+
+    # Make automake happy
+    touch ChangeLog
+}
-- 
1.7.2.5



