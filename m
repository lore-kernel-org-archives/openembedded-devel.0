Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1C84E65C91
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Nov 2014 05:28:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sA55SWGR021258
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 4 Nov 2014 21:28:33 -0800 (PST)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 4 Nov 2014 21:28:31 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Nov 2014 00:28:30 -0500
Message-ID: <1415165310-6527-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] traceroute: add VPATH to find libraries and avoid host contamination
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
X-List-Received-Date: Wed, 05 Nov 2014 05:28:43 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Fixed:
make[1]: *** No rule to make target '-lm', needed by 'traceroute'.  Stop.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-networking/recipes-support/traceroute/traceroute_2.0.20.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/traceroute/traceroute_2.0.20.bb b/meta-networking/recipes-support/traceroute/traceroute_2.0.20.bb
index 4b49c76..4476670 100644
--- a/meta-networking/recipes-support/traceroute/traceroute_2.0.20.bb
+++ b/meta-networking/recipes-support/traceroute/traceroute_2.0.20.bb
@@ -20,6 +20,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/traceroute/traceroute/${BP}/${BP}.tar.gz \
 SRC_URI[md5sum] = "559f104e155e0e14ee0c717776a745fa"
 SRC_URI[sha256sum] = "2facba9525c95428d7bff3a313fc6ecfd8c529c678ae666c73015558a0edc271"
 
+EXTRA_OEMAKE = "VPATH=${STAGING_LIBDIR}"
+
 do_compile() {
     export LDFLAGS="${TARGET_LDFLAGS} -L${S}/libsupp"
     oe_runmake "env=yes"
-- 
2.0.0


