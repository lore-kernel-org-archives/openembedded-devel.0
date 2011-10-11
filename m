Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RDiNc-0002Fa-M9
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Oct 2011 21:52:48 +0200
Received: by ywf7 with SMTP id 7so6966064ywf.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Oct 2011 12:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=TWh9kuZ0pHjWyb0nVdIcFa3TvrVt//ub+qiWBFCuYCg=;
	b=vTw3N4JzeA+MOxsgq1ZPlR2uOtvak9jN9LIctoEoVEjKwa6Y25HjvbyAHGtiTvP3UU
	7K3X/zZWIUGyeYO/1IJAmsvvey2FqXm1/lh560y9SysYxyx1eSuKTLTpzTKVUlzGxCBV
	oWTCoAA8CyCTwlNNidvW2GzVWGwHf0iGnISxU=
Received: by 10.236.185.198 with SMTP id u46mr32138449yhm.113.1318362426011;
	Tue, 11 Oct 2011 12:47:06 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id o50sm16294841yhl.9.2011.10.11.12.47.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Oct 2011 12:47:05 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Oct 2011 19:46:50 +0000
Message-Id: <2d40bd35a2ecf2ac49a66a09656c7319aa811c98.1318362324.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1318362324.git.otavio@ossystems.com.br>
References: <cover.1318362324.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1318362324.git.otavio@ossystems.com.br>
References: <cover.1318362324.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/1] xserver-nodm-init: exit 1 only if systemd is installed
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
X-List-Received-Date: Tue, 11 Oct 2011 19:52:48 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../xserver-nodm-init/xserver-nodm-init_2.0.bb     |   10 ++++------
 1 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
index d4a6b97..87079a6 100644
--- a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
+++ b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SECTION = "x11"
 
-PR = "r9"
+PR = "r10"
 
 SRC_URI = "file://xserver-nodm \
            file://xserver-nodm.service \
@@ -31,12 +31,10 @@ INITSCRIPT_PARAMS = "start 01 5 2 . stop 01 0 1 6 ."
 INITSCRIPT_PARAMS_shr = "start 90 5 2 . stop 90 0 1 6 ."
 
 pkg_postinst_${PN}_append () {
-    # can't do this offline
-    if [ "x$D" != "x" ]; then
-        exit 1
-    fi
-
     if [ -e /bin/systemctl ] ; then
+        # can't do this offline
+        [ "x$D" != "x" ] && exit 1
+
         systemctl enable xserver-nodm.service
     fi
 }
-- 
1.7.2.5



