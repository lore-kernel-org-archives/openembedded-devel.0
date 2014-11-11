Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4CF746AC0D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Nov 2014 09:50:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAB9o9Q5013785
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Nov 2014 01:50:10 -0800 (PST)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 11 Nov 2014 01:50:09 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 11 Nov 2014 04:50:06 -0500
Message-ID: <1415699406-29540-2-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1415699406-29540-1-git-send-email-jackie.huang@windriver.com>
References: <1415699406-29540-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2 2/2] rrdtool: add missing dependency on groff-native
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
X-List-Received-Date: Tue, 11 Nov 2014 09:50:14 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

rrdtool needs groff-native to format the documentation.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-extended/rrdtool/rrdtool_1.4.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.8.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.8.bb
index b901f2e..6bc5e98 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.8.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.8.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://oss.oetiker.ch/rrdtool/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=44fee82a1d2ed0676cf35478283e0aa0"
 
-DEPENDS = "libpng zlib cairo pango glib-2.0 libxml2"
+DEPENDS = "libpng zlib cairo pango glib-2.0 libxml2 groff-native"
 
 SRCREV = "1850e00a17e25e93c39e608f4e2da50f29c5c712"
 PV = "1.4.8"
-- 
2.0.0


