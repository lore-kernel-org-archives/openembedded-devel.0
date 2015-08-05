Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 19DDA6E630
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Aug 2015 06:57:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t756v3D0022871
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 4 Aug 2015 23:57:03 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Tue, 4 Aug 2015 23:57:03 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Aug 2015 14:49:40 +0800
Message-ID: <1438757380-15461-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-networking] znc: provide SRCREV_FORMAT
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
X-List-Received-Date: Wed, 05 Aug 2015 06:57:05 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Add SRCREV_FORMAT to provide a composite version number for
get_srcrev() in fetch2 code. This fixes error:

  * FetchError: Fetcher failure: The SRCREV_FORMAT variable \
    must be set when multiple SCMs are used.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta-networking/recipes-irc/znc/znc_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-irc/znc/znc_git.bb b/meta-networking/recipes-irc/znc/znc_git.bb
index d81c170..091db49 100644
--- a/meta-networking/recipes-irc/znc/znc_git.bb
+++ b/meta-networking/recipes-irc/znc/znc_git.bb
@@ -13,6 +13,8 @@ SRC_URI = "git://github.com/znc/znc.git;name=znc \
 SRCREV_znc = "f47e8465efa4e1cd948b9caae93ac401b4355df8"
 SRCREV_Csocket = "07b4437396122650e5b8fb3d014e820a5decf4ee"
 
+SRCREV_FORMAT = "znc_Csocket"
+
 S = "${WORKDIR}/git"
 
 inherit autotools-brokensep pkgconfig
-- 
1.9.1


