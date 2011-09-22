Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1R6ktB-0007Hb-5Y
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Sep 2011 17:08:40 +0200
Received: (qmail invoked by alias); 22 Sep 2011 15:03:15 -0000
Received: from p5B0A1554.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.21.84]
	by mail.gmx.net (mp069) with SMTP; 22 Sep 2011 17:03:15 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+G/G4s7uWGYI6BOEqqWWtLVC4AZ66ZkWdFdEiJym
	FtagJU0K7hDW6N
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Sep 2011 17:06:35 +0200
Message-Id: <1316704004-19647-5-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1316704004-19647-1-git-send-email-schnitzeltony@gmx.de>
References: <1316704004-19647-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce V2 04/13] xfce-utils: add openssh-misc to RDEPENDS_${PN}
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
X-List-Received-Date: Thu, 22 Sep 2011 15:08:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

log message was: /etc/xdg/xfce4/xinitrc: line 171: ssh-agent: command not found

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../recipes-xfce/xfce-utils/xfce-utils_4.8.2.bb    |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-xfce/recipes-xfce/xfce-utils/xfce-utils_4.8.2.bb b/meta-xfce/recipes-xfce/xfce-utils/xfce-utils_4.8.2.bb
index e36b6a7..34d87d2 100644
--- a/meta-xfce/recipes-xfce/xfce-utils/xfce-utils_4.8.2.bb
+++ b/meta-xfce/recipes-xfce/xfce-utils/xfce-utils_4.8.2.bb
@@ -3,9 +3,8 @@ SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
 DEPENDS = "gtk+ virtual/libx11 dbus libxfce4util libxfce4ui"
-RDEPENDS_${PN} = "xrdb"
 
-PR = "r0"
+PR = "r1"
 
 inherit xfce
 
@@ -22,6 +21,7 @@ FILES_${PN} += " \
         ${datadir}/dbus-1/* \
         ${datadir}/xsessions/xfce.desktop \
 "
+RDEPENDS_${PN} = "xrdb openssh-misc"
 
 SRC_URI[md5sum] = "7f48198f4bee3edf7869064c2922c609"
 SRC_URI[sha256sum] = "a12b708b0cd19ffa07afb2ab2cd1bf9377ff7fbbfbe16d7493a5bb973bcb0aa5"
-- 
1.7.4.4



