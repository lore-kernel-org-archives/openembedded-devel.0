Received: from 64.mail-out.ovh.net ([91.121.185.65])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PqOa7-0007Y7-6y
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 12:33:03 +0100
Received: (qmail 25474 invoked by uid 503); 18 Feb 2011 11:09:29 -0000
Received: from b6.ovh.net (HELO mail240.ha.ovh.net) (213.186.33.56)
	by 64.mail-out.ovh.net with SMTP; 18 Feb 2011 11:09:28 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 18 Feb 2011 13:31:45 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 18 Feb 2011 13:31:44 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Feb 2011 12:32:09 +0100
Message-Id: <1298028729-10564-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-Ovh-Tracer-Id: 6386104271940791625
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH] acl: fix build problems with rpath on older libtool
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
X-List-Received-Date: Fri, 18 Feb 2011 11:33:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* bump INC_PR

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/udev/acl_2.2.49.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/recipes/udev/acl_2.2.49.bb b/recipes/udev/acl_2.2.49.bb
index 5a37c57..20f94db 100644
--- a/recipes/udev/acl_2.2.49.bb
+++ b/recipes/udev/acl_2.2.49.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Commands for Manipulating POSIX Access Control Lists"
 LICENSE = "GPLv2"
 
-PR = "r3"
+PR = "r4"
 
 DEPENDS = "attr"
 
@@ -20,6 +20,9 @@ EXTRA_OECONF = " --enable-gettext=yes \
 do_configure_append() {
     # gettext hack
     echo "#define _(str) str" >> ${S}/include/config.h
+    # use same fix as libiconv
+    sed -i -e  s/^hardcode_libdir_flag_spec/#hardcode_libdir_flag_spec/ \
+           -e s/^runpath_var/#runpath_var/ ${S}/*-libtool
 }
 
 do_configure_prepend() {
-- 
1.7.0.4



