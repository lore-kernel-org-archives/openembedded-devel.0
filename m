Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C46C87720D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Sep 2016 05:27:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u885R57o007362
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 7 Sep 2016 22:27:06 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 7 Sep 2016 22:27:04 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 8 Sep 2016 13:10:48 +0800
Message-ID: <20160908051048.15948-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [meta-networking][PATCH] waf-samba.bbclass: Append PACKAGECONFIG_CONFARGS to EXTRA_OECONF
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
X-List-Received-Date: Thu, 08 Sep 2016 05:27:08 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Append PACKAGECONFIG_CONFARGS to EXTRA_OECONF for waf-samba.bbclass
because the PACKAGECONFIG will not be handled for all recipes after
the following commit in oe-core:

commit c98fb5f5129e71829ffab4449b3d28082bc95ab4
Author: Martin Jansa <martin.jansa@gmail.com>
Date:   Tue Aug 30 16:19:58 2016 +0200

    base, autotools: Append PACKAGECONFIG_CONFARGS to EXTRA_OECONF only in autotools.bbclass

    * recipes which don't inherit autotools or cmake bbclass and want to
      use the configure options from PACKAGECONFIG need to handle
      PACKAGECONFIG_CONFARGS themselves.

    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-networking/classes/waf-samba.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/classes/waf-samba.bbclass b/meta-networking/classes/waf-samba.bbclass
index 772bc75..a58ca2c 100644
--- a/meta-networking/classes/waf-samba.bbclass
+++ b/meta-networking/classes/waf-samba.bbclass
@@ -20,6 +20,8 @@ CONFIGUREOPTS = " --prefix=${prefix} \
                   --mandir=${mandir} \
                 "
 
+EXTRA_OECONF_append = " ${PACKAGECONFIG_CONFARGS}"
+
 # Three methods for waf cross compile:
 # 1. answers:
 #    Only --cross-answers - try the cross-answers file, and if
-- 
2.7.4


