Return-Path: <eric@eukrea.com>
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	by mail.openembedded.org (Postfix) with ESMTP id B8A7D6BE6E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2013 17:12:55 +0000 (UTC)
Received: from e6520eb.local.eukrea.com (unknown [88.170.243.169])
	by smtp4-g21.free.fr (Postfix) with ESMTP id A69534C8213;
	Thu,  7 Nov 2013 18:12:52 +0100 (CET)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: javier.viguera@digi.com
Date: Thu,  7 Nov 2013 18:12:49 +0100
Message-Id: <1383844369-15682-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	=?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [PATCH v3] cherokee: use cherokee-project.de mirror
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
X-List-Received-Date: Thu, 07 Nov 2013 17:12:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb b/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
index 8cfe58f..45b232a 100644
--- a/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
+++ b/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
@@ -9,7 +9,7 @@ PR = "r9"
 
 DEPENDS = "libpcre openssl mysql5 ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
-SRC_URI = "ftp://ftp.osuosl.org/.1/cherokee/1.2/${PV}/cherokee-${PV}.tar.gz \
+SRC_URI = "http://www.cherokee-project.de/mirrors/cherokee/1.2/${PV}/cherokee-${PV}.tar.gz \
            file://cherokee.init \
            file://cherokee.service \
 "
-- 
1.8.3.1


