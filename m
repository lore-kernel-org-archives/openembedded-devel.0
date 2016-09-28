Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5C22660268
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Sep 2016 02:34:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8S2Ys6A019639
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Sep 2016 19:34:55 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Tue, 27 Sep 2016 19:34:54 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 28 Sep 2016 10:17:17 +0800
Message-ID: <20160928021717.28355-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [meta-networking][PATCH] ntp : Add openssl to default PACKAGECONFIG options
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
X-List-Received-Date: Wed, 28 Sep 2016 02:34:55 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Add openssl to default PACKAGECONFIG options so ntp
is configured to have crypto support by default.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-networking/recipes-support/ntp/ntp_4.2.8p8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p8.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p8.bb
index f3344c0..202d1a3 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p8.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p8.bb
@@ -46,7 +46,7 @@ USERADD_PARAM_${PN} = "--system --home-dir ${NTP_USER_HOME} \
                        --shell /bin/false --user-group ntp"
 
 # NB: debug is default-enabled by NTP; keep it default-enabled here.
-PACKAGECONFIG ??= "cap debug refclocks \
+PACKAGECONFIG ??= "cap debug refclocks openssl \
     ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)} \
 "
 PACKAGECONFIG[openssl] = "--with-openssl-libdir=${STAGING_LIBDIR} \
-- 
2.8.3


