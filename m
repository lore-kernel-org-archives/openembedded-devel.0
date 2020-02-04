Return-Path: <tgamblin@windriver.com>
X-Greylist: delayed 461 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 04 Feb 2020 20:23:49 UTC
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E8D2661072
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Feb 2020 20:23:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 014KFTBp022474
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 4 Feb 2020 12:15:59 -0800
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 4 Feb 2020 12:15:48 -0800
Received: by ala-lpggp2.wrs.com (Postfix, from userid 20958)	id B89FBC60F44;
	Tue,  4 Feb 2020 12:15:47 -0800 (PST)
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 4 Feb 2020 12:15:47 -0800
Message-ID: <20200204201547.41125-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] lftp: upgrade 4.9.0 -> 4.9.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Feb 2020 20:23:55 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../lftp/{lftp_4.9.0.bb => lftp_4.9.1.bb}                     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/lftp/{lftp_4.9.0.bb => lftp_4.9.1.bb} (89%)

diff --git a/meta-networking/recipes-connectivity/lftp/lftp_4.9.0.bb b/meta-networking/recipes-connectivity/lftp/lftp_4.9.1.bb
similarity index 89%
rename from meta-networking/recipes-connectivity/lftp/lftp_4.9.0.bb
rename to meta-networking/recipes-connectivity/lftp/lftp_4.9.1.bb
index ef047f7a3..79a380ada 100644
--- a/meta-networking/recipes-connectivity/lftp/lftp_4.9.0.bb
+++ b/meta-networking/recipes-connectivity/lftp/lftp_4.9.1.bb
@@ -7,8 +7,8 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "http://lftp.yar.ru/ftp/lftp-${PV}.tar.bz2"
-SRC_URI[md5sum] = "b05817a2c26463618271730d0f677edb"
-SRC_URI[sha256sum] = "309e7e91a7c020625715e85c1726b1e7524da22518683fbe051ac13116dedeac"
+SRC_URI[md5sum] = "19ce64012bc722ad61667372fa262382"
+SRC_URI[sha256sum] = "a692fd081c19e2cc045869ab721a4fb3d7571040849a4406c4042f735232414c"
 
 inherit autotools gettext pkgconfig
 
-- 
2.23.0


