Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F325F7CDB7
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Mar 2019 08:07:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x2887eZX029888
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 8 Mar 2019 00:07:40 -0800 (PST)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 8 Mar 2019 00:07:39 -0800
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Fri, 8 Mar 2019 03:06:13 -0500
Message-ID: <20190308080614.184756-4-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190308080614.184756-1-kai.kang@windriver.com>
References: <20190308080614.184756-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH 3/4] libio-socket-ssl-perl: 2.060 -> 2.066
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
X-List-Received-Date: Fri, 08 Mar 2019 08:07:40 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Update libio-socket-ssl-perl from 2.060 to 2.066.

* update line number of license in META.yml

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...ket-ssl-perl_2.060.bb => libio-socket-ssl-perl_2.066.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/libio/{libio-socket-ssl-perl_2.060.bb => libio-socket-ssl-perl_2.066.bb} (87%)

diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.060.bb b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.066.bb
similarity index 87%
rename from meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.060.bb
rename to meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.066.bb
index 20f880829..7609846d6 100644
--- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.060.bb
+++ b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.066.bb
@@ -10,7 +10,7 @@ HOMEPAGE = "http://search.cpan.org/dist/IO-Socket-SSL/"
 SECTION = "libs"
 
 LICENSE = "Artistic-1.0|GPLv1+"
-LIC_FILES_CHKSUM = "file://META.yml;beginline=11;endline=11;md5=963ce28228347875ace682de56eef8e8"
+LIC_FILES_CHKSUM = "file://META.yml;beginline=12;endline=12;md5=963ce28228347875ace682de56eef8e8"
 
 RDEPENDS_${PN} += "\
     libnet-ssleay-perl \
@@ -22,8 +22,8 @@ RDEPENDS_${PN} += "\
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/S/SU/SULLR/IO-Socket-SSL-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[md5sum] = "97fa6cd64f15db60f810cd8ab02d57fc"
-SRC_URI[sha256sum] = "fb5b2877ac5b686a5d7b8dd71cf5464ffe75d10c32047b5570674870e46b1b8c"
+SRC_URI[md5sum] = "ecf96ce2ff9e04a03a2d101c76ce1020"
+SRC_URI[sha256sum] = "0d47064781a545304d5dcea5dfcee3acc2e95a32e1b4884d80505cde8ee6ebcd"
 
 S = "${WORKDIR}/IO-Socket-SSL-${PV}"
 
-- 
2.20.0


