Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5D7FE65D57
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Apr 2014 07:53:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s387rp03024333
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 8 Apr 2014 00:53:51 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Tue, 8 Apr 2014 00:53:50 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 8 Apr 2014 15:54:34 +0800
Message-ID: <b9df73e738c282a73199a2d9361550aa259f1eb8.1396941241.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1396941241.git.jackie.huang@windriver.com>
References: <cover.1396941241.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/3] collectd: explicitly disable libsensors support
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
X-List-Received-Date: Tue, 08 Apr 2014 07:53:52 -0000
Content-Type: text/plain

From: Ming Liu <ming.liu@windriver.com>

To avoid an implicit build result.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-extended/collectd/collectd_5.2.2.bb    |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb b/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
index 4eed2b6..00010c7 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
@@ -35,6 +35,7 @@ EXTRA_OECONF = " \
                 --disable-perl --with-libperl=no --with-perl-bindings=no \
                 --with-libgcrypt=${STAGING_BINDIR_CROSS}/libgcrypt-config \
                 --disable-notify_desktop \
+                --with-libsensors=no \
 "
 
 do_install_append() {
-- 
1.7.9.5


