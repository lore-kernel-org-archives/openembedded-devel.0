Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D48DD77070
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jun 2016 08:21:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u578LfIH023135
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 7 Jun 2016 01:21:41 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 7 Jun 2016 01:21:41 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 7 Jun 2016 01:21:40 -0700
Message-ID: <1465287700-18359-2-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1465287700-18359-1-git-send-email-liezhi.yang@windriver.com>
References: <1465287700-18359-1-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] nostromo: add group www-data
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
X-List-Received-Date: Tue, 07 Jun 2016 08:21:42 -0000
Content-Type: text/plain

Fixed:
Running useradd commands...
useradd: group 'www-data' does not exist

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb
index 562ecd0..c6593e1 100644
--- a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb
+++ b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb
@@ -30,6 +30,7 @@ do_compile() {
 # we need user/group www-data to exist when we install
 #
 USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM_${PN} = "--system www-data"
 USERADD_PARAM_${PN} = "--system -g www-data www-data"
 
 do_install() {
-- 
2.7.4


