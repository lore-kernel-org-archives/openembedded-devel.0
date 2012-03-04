Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S4Bg2-0007qw-Is
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Mar 2012 14:40:42 +0100
Received: by wgbdr12 with SMTP id dr12so2433042wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Mar 2012 05:32:09 -0800 (PST)
Received: by 10.180.86.230 with SMTP id s6mr7226889wiz.16.1330867929228;
	Sun, 04 Mar 2012 05:32:09 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id hn8sm44636656wib.11.2012.03.04.05.32.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Mar 2012 05:32:08 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 Mar 2012 14:32:02 +0100
Message-Id: <1330867925-23330-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQmAMJ187nGpTkEQ3hI+VnYkA17VNjE7IbI9JaB1I5d+vpRIN+aH1fHITjtJOiUHRA8uwA49
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe 1/4] python-tornado: update to the 2.2 release
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
X-List-Received-Date: Sun, 04 Mar 2012 13:40:42 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../0001-disable-AI_ADDRCONFIG-flag.patch          |    2 +-
 .../recipes-devtools/python/python-tornado_git.bb  |    7 +++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-devtools/python/python-tornado/0001-disable-AI_ADDRCONFIG-flag.patch b/meta-oe/recipes-devtools/python/python-tornado/0001-disable-AI_ADDRCONFIG-flag.patch
index a3efbca..3c3ec7c 100644
--- a/meta-oe/recipes-devtools/python/python-tornado/0001-disable-AI_ADDRCONFIG-flag.patch
+++ b/meta-oe/recipes-devtools/python/python-tornado/0001-disable-AI_ADDRCONFIG-flag.patch
@@ -24,7 +24,7 @@ index cfff0ba..c181f24 100644
 -        # exist on some platforms (specifically WinXP, although
 -        # newer versions of windows have it)
 -        flags |= socket.AI_ADDRCONFIG
-     for res in socket.getaddrinfo(address, port, family, socket.SOCK_STREAM,
+     for res in set(socket.getaddrinfo(address, port, family, socket.SOCK_STREAM,
                                    0, flags):
          af, socktype, proto, canonname, sockaddr = res
 -- 
diff --git a/meta-oe/recipes-devtools/python/python-tornado_git.bb b/meta-oe/recipes-devtools/python/python-tornado_git.bb
index 22078bc..693b454 100644
--- a/meta-oe/recipes-devtools/python/python-tornado_git.bb
+++ b/meta-oe/recipes-devtools/python/python-tornado_git.bb
@@ -2,10 +2,9 @@ DESCRIPTION = "Tornado is an open source version of the scalable, non-blocking w
 LICENSE = "Apache"
 LIC_FILES_CHKSUM = "file://README;md5=e7fb9954003d7cd93322ccf282210d1c"
 
-PV = "2.1.1"
-PR = "r4"
-SRCREV = "112fdb48b06b754d1f94335ea9e2fd62a07a5fe3"
-SRC_URI = "git://github.com/facebook/tornado.git \
+PV = "2.2"
+SRCREV = "02bc76155de5bf4dca243e4d0c019c0ac4c8b3be"
+SRC_URI = "git://github.com/facebook/tornado.git;branch=branch2.2 \
            file://0001-disable-AI_ADDRCONFIG-flag.patch \
           "
 
-- 
1.7.2.5



