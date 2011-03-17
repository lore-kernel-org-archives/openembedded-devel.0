Received: from bsmtp5.bon.at ([195.3.86.187] helo=bsmtp.bon.at)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pgsellmann@portner-elektronik.at>)
	id 1Q0AsM-0000Sa-3b for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 11:56:18 +0100
Received: from aspire.localdomain (unknown [88.116.171.82])
	by bsmtp.bon.at (Postfix) with ESMTP id E7AE32C401F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2011 11:54:28 +0100 (CET)
From: Peter Gsellmann <pgsellmann@portner-elektronik.at>
Organization: PORTNER Elektronik
To: "openembedded-devel" <openembedded-devel@lists.openembedded.org>
Date: Thu, 17 Mar 2011 11:54:19 +0100
MIME-Version: 1.0
Message-Id: <201103171154.20231.pgsellmann@portner-elektronik.at>
Subject: [PATCH 1/3] ntp-4.2.6 configuration files
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
X-List-Received-Date: Thu, 17 Mar 2011 10:56:18 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Mark some files in ${sysconfdir} as configuration files so they are not blindly overwritten when upgrading

Signed-off-by: Peter Gsellmann <pgsellmann@portner-elektronik.at>
---
 recipes/ntp/ntp_4.2.6p3.bb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes/ntp/ntp_4.2.6p3.bb b/recipes/ntp/ntp_4.2.6p3.bb
index 1476c6f..844198f 100644
--- a/recipes/ntp/ntp_4.2.6p3.bb
+++ b/recipes/ntp/ntp_4.2.6p3.bb
@@ -1,6 +1,6 @@
 require ntp.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/${P}.tar.gz \
         file://tickadj.c.patch \
@@ -12,7 +12,9 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/${P}.tar.gz \
 SRC_URI[md5sum] = "59876a9009b098ff59767ee45a88ebd2"
 SRC_URI[sha256sum] = "6e84d4ddfa14b911c3ed88463af10867e1fa9b287e7b34d8a02e78be85a7c40e"
 
-EXTRA_OECONF += " --with-net-snmp-config=no --without-ntpsnmpd" 
+EXTRA_OECONF += " --with-net-snmp-config=no --without-ntpsnmpd"
+
+CONFFILES_${PN} = "${sysconfdir}/ntp.conf"
 
 do_install_append() {
         install -d ${D}/${sysconfdir}/init.d
-- 
1.7.2.3



