Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B5FE76F348
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 10:54:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1PAsNJP029657
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 25 Feb 2014 02:54:24 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 25 Feb 2014 02:54:22 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 25 Feb 2014 18:54:16 +0800
Message-ID: <a1776d6a50c9a7fcd20a4fc7ce55931088872cfb.1393325556.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1393325556.git.hongxu.jia@windriver.com>
References: <cover.1393325556.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] strongswan: fix building lib32-strongswan failed while systemd enabled
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
X-List-Received-Date: Tue, 25 Feb 2014 10:54:27 -0000
Content-Type: text/plain

While systemd enabled, there was an error to build lib32-strongswan:
...
| ERROR: Function failed: SYSTEMD_SERVICE_lib32-strongswan value
lib32-strongswan.service does not exist
...

The name of the service file should be the hardcoded
'strongswan.service' rather than '${PN}.service', so
the 'strongswan.service' will be found while building
lib32-strongswan.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-networking/recipes-support/strongswan/strongswan_5.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.0.0.bb b/meta-networking/recipes-support/strongswan/strongswan_5.0.0.bb
index eb49494..e45e81a 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.0.0.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.0.0.bb
@@ -33,4 +33,4 @@ INSANE_SKIP_${PN}-plugins = "staticdev"
 RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "${PN}.service"
+SYSTEMD_SERVICE_${PN} = "strongswan.service"
-- 
1.8.1.2


