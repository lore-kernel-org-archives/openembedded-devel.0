Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1A4F465D6A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Apr 2014 09:07:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s38976Os003315
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 8 Apr 2014 02:07:06 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Tue, 8 Apr 2014 02:07:05 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 8 Apr 2014 17:07:50 +0800
Message-ID: <cba43680242c7e0c33a70b3d9c1422f789635d53.1396947706.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1396947706.git.jackie.huang@windriver.com>
References: <cover.1396947706.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2 3/3] collectd: explicitly enable/disable libsensors support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Apr 2014 09:07:05 -0000
Content-Type: text/plain

From: Ming Liu <ming.liu@windriver.com>

To avoid an implicit build result.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-extended/collectd/collectd_5.2.2.bb    |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb b/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
index 4eed2b6..7cb41b9 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
@@ -28,7 +28,8 @@ PACKAGECONFIG[postgresql] = "--enable-postgresql --with-libpq=yes, \
 PACKAGECONFIG[dbi] = "--enable-dbi,--disable-dbi,libdbi"
 PACKAGECONFIG[modbus] = "--enable-modbus,--disable-modbus,libmodbus"
 PACKAGECONFIG[libowcapi] = "--with-libowcapi,--without-libowcapi,owfs"
-PACKAGECONFIG[sensors] = "--enable-sensors,--disable-sensors,lmsensors"
+PACKAGECONFIG[sensors] = "--enable-sensors --with-libsensors=yes, \
+        --disable-sensors --with-libsensors=no,lmsensors"
 
 EXTRA_OECONF = " \
                 ${FPLAYOUT} \
-- 
1.7.9.5


