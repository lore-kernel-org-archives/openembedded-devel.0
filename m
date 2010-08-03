Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1OgKFZ-0007sx-8Y
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Aug 2010 18:22:01 +0200
Received: by mail-fx0-f47.google.com with SMTP id 12so2157248fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Aug 2010 09:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=zf1uGJUPAYJwtyDyhVtTa2zpc3OLIJfwtjVoExcWHj4=;
	b=J0sCW4ywUSvuGEHk/3aSrVnMacFEQukHznJ2w2gs8E3uhbQptDAuH5aiazre/BRZIL
	Bw5uIk5DQoLayeokqexI0ExE7J0qCMwI75G+3ZGl6CTiqbkLdcaJLQ3eNYotjKy/Bv5M
	0KxeEqyROplm7N5NpXeq+kihgj15Tol3rUS1A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=jb/q+s+hM7e7Alp/tgYDu3IJTsTfpiZnXVPfvswXFaJCHz8b7hAbrdv+Cj/1LMu21H
	HFtAh/J5tlgOQk8cs7drfLeIAY0OGIxxAE0w0foP2OlVfT49fGZc8vPTZuSIx/v2q6Ik
	k418TNsID4rAQQphKLSrRKu9JdJmV1hCdUkhU=
Received: by 10.223.122.146 with SMTP id l18mr7563411far.82.1280852516352;
	Tue, 03 Aug 2010 09:21:56 -0700 (PDT)
Received: from aalonso-pc.lan ([201.153.72.151])
	by mx.google.com with ESMTPS id s20sm2570960faa.28.2010.08.03.09.21.53
	(version=SSLv3 cipher=RC4-MD5); Tue, 03 Aug 2010 09:21:55 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Aug 2010 11:23:25 -0500
Message-Id: <1280852605-3524-11-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <1280852605-3524-1-git-send-email-aalonso00@gmail.com>
References: <1280852605-3524-1-git-send-email-aalonso00@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 11/11][v2] xserver-kdrive-common: xilinx virtex5 support
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
X-List-Received-Date: Tue, 03 Aug 2010 16:22:01 -0000

* Add Xserver args support for virtex5 board
* Increase PR
* v2 split changes for handling xilinx virtex platforms

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 .../xserver-kdrive-common/Xserver                  |    2 ++
 .../xserver-kdrive-common_0.1.bb                   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/xserver-kdrive-common/xserver-kdrive-common/Xserver b/recipes/xserver-kdrive-common/xserver-kdrive-common/Xserver
index b6c27df..c1a9a44 100644
--- a/recipes/xserver-kdrive-common/xserver-kdrive-common/Xserver
+++ b/recipes/xserver-kdrive-common/xserver-kdrive-common/Xserver
@@ -175,6 +175,8 @@ case `module_id` in
                  if [ "$XSERVER" = "/usr/bin/Xorg" ];then
                       ARGS=""
                  fi;; #TODO: handle kdrive
+        "Xilinx Virtex"*)
+                ARGS="$ARGS $PPM" ;;
         *)
                 # It is a device we do not know about, in which case we force
                 # kdrive to use the current framebuffer geometry -- otherwise
diff --git a/recipes/xserver-kdrive-common/xserver-kdrive-common_0.1.bb b/recipes/xserver-kdrive-common/xserver-kdrive-common_0.1.bb
index 52a88b8..04a3f13 100644
--- a/recipes/xserver-kdrive-common/xserver-kdrive-common_0.1.bb
+++ b/recipes/xserver-kdrive-common/xserver-kdrive-common_0.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Common X11 scripts"
 LICENSE = "GPL"
 SECTION = "x11"
-PR = "r45"
+PR = "r46"
 
 SRC_URI = "\
   file://Xdefaults \
-- 
1.7.2



