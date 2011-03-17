Received: from bsmtp5.bon.at ([195.3.86.187] helo=bsmtp.bon.at)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pgsellmann@portner-elektronik.at>)
	id 1Q0AsI-0000Rx-7Q for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 11:56:14 +0100
Received: from aspire.localdomain (unknown [88.116.171.82])
	by bsmtp.bon.at (Postfix) with ESMTP id 36FF12C4006
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 11:54:29 +0100 (CET)
From: Peter Gsellmann <pgsellmann@portner-elektronik.at>
Organization: PORTNER Elektronik
To: "openembedded-devel" <openembedded-devel@lists.openembedded.org>
Date: Thu, 17 Mar 2011 11:54:21 +0100
MIME-Version: 1.0
Message-Id: <201103171154.21792.pgsellmann@portner-elektronik.at>
Subject: [PATCH 2/3] vsftpd-2.0.5 configuration files
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
X-List-Received-Date: Thu, 17 Mar 2011 10:56:14 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Mark some files in ${sysconfdir} as configuration files so they are not blindly overwritten when upgrading

Signed-off-by: Peter Gsellmann <pgsellmann@portner-elektronik.at>
---
 recipes/vsftpd/vsftpd_2.0.5.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/vsftpd/vsftpd_2.0.5.bb b/recipes/vsftpd/vsftpd_2.0.5.bb
index 42a8236..af884b4 100644
--- a/recipes/vsftpd/vsftpd_2.0.5.bb
+++ b/recipes/vsftpd/vsftpd_2.0.5.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Secure ftp daemon"
 SECTION = "console/network"
 LICENSE = "GPL"
-PR = "r3"
+PR = "r4"
 
 DEPENDS = "libcap"
 
@@ -14,6 +14,8 @@ SRC_URI = "ftp://vsftpd.beasts.org/users/cevans/vsftpd-${PV}.tar.gz \
 
 inherit update-rc.d
 
+CONFFILES_${PN} = "${sysconfdir}/vsftpd.conf"
+
 do_configure() {
         # Fix hardcoded /usr, /etc, /var mess.
         cat tunables.c|sed s:\"/usr:\"${prefix}:g|sed s:\"/var:\"${localstatedir}:g \
-- 
1.7.2.3



