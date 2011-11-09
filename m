Received: from stoexhub03.domain01.net ([83.145.59.144])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1RO7QT-0005P3-V9
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Nov 2011 13:38:46 +0100
Received: from localhost (193.235.91.228) by stoexhub03.domain01.net
	(10.12.10.3) with Microsoft SMTP Server id 8.3.137.0; Wed, 9 Nov 2011
	13:32:24 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 9 Nov 2011 13:32:24 +0100
Message-ID: <af4142d54e9a7999e8e705495cb746c07c7d3990.1320841846.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.7.2
In-Reply-To: <cover.1320841846.git.anders@chargestorm.se>
References: <cover.1320841846.git.anders@chargestorm.se>
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Subject: [PATCH 1/1] rsyslog: change postrm to prerm
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
X-List-Received-Date: Wed, 09 Nov 2011 12:38:46 -0000
Content-Type: text/plain

The systemd service can't be disabled if it already has been removed, thus disable it
prior to removing the package.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta-oe/recipes-extended/rsyslog/rsyslog.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog.inc b/meta-oe/recipes-extended/rsyslog/rsyslog.inc
index 8af2049..856d965 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog.inc
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.rsyslog.com/"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=51d9635e646fb75e1b74c074f788e973"
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 SRC_URI = "http://www.rsyslog.com/files/download/rsyslog/${PN}-${PV}.tar.gz \
            file://rsyslog.conf"
@@ -25,7 +25,7 @@ pkg_postinst_${PN} () {
 	systemctl enable rsyslog.service
 }
 
-pkg_postrm_${PN} () {
+pkg_prerm_${PN} () {
 	systemctl disable rsyslog.service
 }
 
-- 
1.7.7.2



