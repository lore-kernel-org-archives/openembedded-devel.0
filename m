Received: from mail-tul01m020-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pjohn@mvista.com>) id 1Rimzh-0001TA-83
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jan 2012 14:04:33 +0100
Received: by obcwn6 with SMTP id wn6so542012obc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jan 2012 04:57:10 -0800 (PST)
Received: by 10.50.219.234 with SMTP id pr10mr2374706igc.27.1325768226383;
	Thu, 05 Jan 2012 04:57:06 -0800 (PST)
Received: from [10.82.0.127] ([115.115.74.130])
	by mx.google.com with ESMTPS id l28sm201336035ibc.3.2012.01.05.04.57.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Jan 2012 04:57:05 -0800 (PST)
From: philby john <pjohn@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 05 Jan 2012 18:25:56 +0530
Message-ID: <1325768156.22038.6.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 (2.32.3-1.fc14) 
Cc: koen@openembedded.org, mwester@dls.net, hrw@openembedded.org
Subject: [PATCH] Fix ctorrent build failure by using --disable-maintainer-mode option
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
X-List-Received-Date: Thu, 05 Jan 2012 13:04:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

From: Philby John <pjohn@mvista.com>
Date: Thu, 5 Jan 2012 18:08:00 +0530
Subject: [PATCH] Fix ctorrent build failure by using --disable-maintainer-mode option

ctorrent package fails with error "aclocal.m4:14: error: this file was
generated for autoconf dnh3.3.1" as reported here
lists.linuxtogo.org/pipermail/openembedded-devel/2008-October/006598.html
Fix this by including --disable-maintainer-mode.

Also since ctcs inherits ctorrent.inc add do_configure() there doing
nothing.

Signed-off-by: Philby John <pjohn@mvista.com>
---
 recipes/ctorrent/ctcs_1.4.1.bb     |    6 +++++-
 recipes/ctorrent/ctorrent.inc      |    6 ++++++
 recipes/ctorrent/ctorrent_3.3.1.bb |    2 +-
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/recipes/ctorrent/ctcs_1.4.1.bb b/recipes/ctorrent/ctcs_1.4.1.bb
index 8680b0c..d1e084e 100644
--- a/recipes/ctorrent/ctcs_1.4.1.bb
+++ b/recipes/ctorrent/ctcs_1.4.1.bb
@@ -5,7 +5,11 @@ RDEPENDS_${PN} = "perl perl-module-strict perl-module-socket perl-module-fcntl \
             perl-module-errno perl-module-sys-hostname"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/dtorrent/ctcs-${PV}.tar.gz"
-PR="r1"
+PR="r2"
+
+do_configure () {
+        :
+}
 
 do_install () {
   install -d ${D}/usr/bin
diff --git a/recipes/ctorrent/ctorrent.inc b/recipes/ctorrent/ctorrent.inc
index 8005fa9..e04c5d3 100644
--- a/recipes/ctorrent/ctorrent.inc
+++ b/recipes/ctorrent/ctorrent.inc
@@ -8,3 +8,9 @@ DEPENDS = "openssl"
 SRC_URI = "${SOURCEFORGE_MIRROR}/ctorrent/ctorrent-${PV}.tar.bz2"
 
 inherit autotools
+
+EXTRA_OECONF = "--disable-maintainer-mode"
+
+do_configure() {
+                oe_runconf
+}
diff --git a/recipes/ctorrent/ctorrent_3.3.1.bb b/recipes/ctorrent/ctorrent_3.3.1.bb
index efc2eca..2c6e4f9 100644
--- a/recipes/ctorrent/ctorrent_3.3.1.bb
+++ b/recipes/ctorrent/ctorrent_3.3.1.bb
@@ -6,7 +6,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/dtorrent/ctorrent-dnh${PV}.tar.gz \
            file://CVE-2009-1759.patch;striplevel=0 "
 
 S = "${WORKDIR}/${PN}-dnh${PV}"
-PR="r1"
+PR="r2"
 
 SRC_URI[md5sum] = "9bfe42c2dd6a6aabd545fe332bc23e87"
 SRC_URI[sha256sum] = "e65d9c7a4da499314126d979a0a79ce5123e0f969c786bfddcee261f14cb648b"
-- 
1.6.3.3.338.ge89ce



