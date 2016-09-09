Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 09020731AE
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Sep 2016 02:51:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u892pJjb024986
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 8 Sep 2016 19:51:19 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 8 Sep 2016 19:51:18 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 9 Sep 2016 10:34:55 +0800
Message-ID: <95b6e4d5222aae52ee4d0a69149eee4472bf5787.1473388166.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1473388166.git.jackie.huang@windriver.com>
References: <cover.1473388166.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/2 v2] waf-samba.bbclass: Add PACKAGECONFIG_CONFARGS to CONFIGUREOPTS
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
X-List-Received-Date: Fri, 09 Sep 2016 02:51:21 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Add PACKAGECONFIG_CONFARGS to CONFIGUREOPTS for waf-samba.bbclass
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
 meta-networking/classes/waf-samba.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/classes/waf-samba.bbclass b/meta-networking/classes/waf-samba.bbclass
index 772bc75..af4c7d0 100644
--- a/meta-networking/classes/waf-samba.bbclass
+++ b/meta-networking/classes/waf-samba.bbclass
@@ -18,6 +18,7 @@ CONFIGUREOPTS = " --prefix=${prefix} \
                   --oldincludedir=${oldincludedir} \
                   --infodir=${infodir} \
                   --mandir=${mandir} \
+                  ${PACKAGECONFIG_CONFARGS} \
                 "
 
 # Three methods for waf cross compile:
-- 
2.8.3


