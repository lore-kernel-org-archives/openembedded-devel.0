Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id F32AA776BE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Mar 2017 03:30:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v2D3UkLQ021088
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Mar 2017 20:30:46 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Sun, 12 Mar 2017 20:30:45 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 13 Mar 2017 11:29:20 +0800
Message-ID: <20170313032921.8669-5-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <20170313032921.8669-1-kai.kang@windriver.com>
References: <20170313032921.8669-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] cherokee: update SRC_URI
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
X-List-Received-Date: Mon, 13 Mar 2017 03:30:45 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The mirror site of cherokee in SRC_URI is down. Use another mirror
instead. See http://cherokee-project.com/downloads.html

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb b/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
index 9d22985..ba39f97 100644
--- a/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
+++ b/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
@@ -9,7 +9,7 @@ PR = "r9"
 
 DEPENDS = "libpcre openssl mysql5 ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
-SRC_URI = "http://www.cherokee-project.de/mirrors/cherokee/1.2/${PV}/cherokee-${PV}.tar.gz \
+SRC_URI = "http://mirror.aarnet.edu.au/pub/${BPN}/1.2/${PV}/${BP}.tar.gz \
            file://cherokee.init \
            file://cherokee.service \
            file://cherokee-install-configured.py-once.patch \
-- 
2.10.1


