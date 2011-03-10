Received: from bsmtp3.bon.at ([213.33.87.17] helo=lbmfmo03.bon.at)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pgsellmann@portner-elektronik.at>)
	id 1Pxheo-00025m-6b for openembedded-devel@lists.openembedded.org;
	Thu, 10 Mar 2011 16:20:06 +0100
Received: from bsmtp.bon.at (unknown [192.168.181.108])
	by lbmfmo03.bon.at (Postfix) with ESMTP id 39E61CE49A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2011 15:53:42 +0100 (CET)
Received: from aspire.localdomain (unknown [88.116.171.82])
	by bsmtp.bon.at (Postfix) with ESMTP id D2098130054
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2011 15:53:28 +0100 (CET)
From: Peter Gsellmann <pgsellmann@portner-elektronik.at>
Organization: PORTNER Elektronik
Date: Thu, 10 Mar 2011 15:53:27 +0100
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Message-Id: <201103101553.27407.pgsellmann@portner-elektronik.at>
Subject: [PATCH] vsftpd-2.0.5: added dependency for correct build order
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
X-List-Received-Date: Thu, 10 Mar 2011 15:20:06 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

vsftpd needs the cap_* functions; if the library libcap is not built before vsftpd, an error occurs.

Signed-off-by: Peter Gsellmann <pgsellmann@portner-elektronik.at>
---
 recipes/vsftpd/vsftpd_2.0.5.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/vsftpd/vsftpd_2.0.5.bb b/recipes/vsftpd/vsftpd_2.0.5.bb
index 518628e..2486744 100644
--- a/recipes/vsftpd/vsftpd_2.0.5.bb
+++ b/recipes/vsftpd/vsftpd_2.0.5.bb
@@ -3,6 +3,8 @@ SECTION = "console/network"
 LICENSE = "GPL"
 PR = "r2"
 
+DEPENDS = "libcap"
+
 SRC_URI = "ftp://vsftpd.beasts.org/users/cevans/vsftpd-${PV}.tar.gz \
            file://makefile.patch \
            file://nopam.patch \
@@ -20,7 +22,7 @@ do_configure() {
 }
 
 do_compile() {
-        oe_runmake "LIBS=-lcrypt -L${STAGING_LIBDIR}"
+        oe_runmake "LIBS=-L${STAGING_LIBDIR} -lcrypt -lcap"
 }
 
 do_install() {
-- 
1.7.2.3



