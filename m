Return-Path: <adrian.ratiu@ni.com>
X-Greylist: delayed 5939 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 24 Feb 2017 13:16:28 UTC
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id ECD1471A75
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 13:16:28 +0000 (UTC)
Received: from us-aus-exch2.ni.corp.natinst.com
	(us-aus-exch2.ni.corp.natinst.com [130.164.68.12])
	by us-aus-skprod2.natinst.com (8.16.0.17/8.16.0.17) with ESMTPS id
	v1OBbUqu014668
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Fri, 24 Feb 2017 05:37:30 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Fri, 24 Feb 2017 05:37:29 -0600
Received: from adi-pc-linux.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Fri, 24 Feb 2017 05:37:28 -0600
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 24 Feb 2017 13:35:24 +0200
Message-ID: <20170224113524.4347-1-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.11.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-02-24_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=1
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
	definitions=main-1702240116
Cc: ken.sharp@ni.com
Subject: [meta-webserver][PATCH] apache-websocket: add depend on pbzip2-native
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
X-List-Received-Date: Fri, 24 Feb 2017 13:16:29 -0000
Content-Type: text/plain

This fixes the build failure:

ERROR: apache-websocket-0.1.1-r0 do_install_source: Failed to
archive (...) /bin/sh: pbzip2: command not found

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb b/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
index da33115aa..0beb3ed04 100644
--- a/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
+++ b/meta-webserver/recipes-httpd/apache-mod/apache-websocket_git.bb
@@ -6,7 +6,7 @@ LICENSE = "Apache-2.0"
 
 inherit autotools-brokensep pkgconfig
 
-DEPENDS = "apache2 apache2-native"
+DEPENDS = "apache2 apache2-native pbzip2-native"
 RDEPENDS_${PN} += "apache2"
 
 # Original (github.com/disconnect/apache-websocket) is dead since 2012, the
-- 
2.11.1


