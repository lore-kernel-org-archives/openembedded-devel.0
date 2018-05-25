Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DCAFB74DFE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 May 2018 07:57:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w4P7v5X9024217
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 25 May 2018 00:57:05 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Fri, 25 May 2018 00:57:04 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <Joe_MacDonald@mentor.com>
Date: Fri, 25 May 2018 15:54:50 +0800
Message-ID: <1527234893-8733-10-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1527234893-8733-1-git-send-email-yi.zhao@windriver.com>
References: <1527234893-8733-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-networking][PATCH 09/12] vblade: add UPSTREAM_CHECK_URI
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
X-List-Received-Date: Fri, 25 May 2018 07:57:05 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-daemons/vblade/vblade_22.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-daemons/vblade/vblade_22.bb b/meta-networking/recipes-daemons/vblade/vblade_22.bb
index d7b1dfa..a51a8c3 100644
--- a/meta-networking/recipes-daemons/vblade/vblade_22.bb
+++ b/meta-networking/recipes-daemons/vblade/vblade_22.bb
@@ -16,6 +16,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/aoetools/${BP}.tar.gz \
 SRC_URI[md5sum] = "510d98ba0f231284a5fbe2da11cb2d6e"
 SRC_URI[sha256sum] = "a990378f273f10eb431e42954a871aed52714035bbab28c54cef600c458356bb"
 
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/aoetools/files/vblade/"
+
 inherit autotools-brokensep update-rc.d systemd
 
 do_install() {
-- 
2.7.4


