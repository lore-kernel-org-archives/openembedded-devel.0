Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DC2FD731E5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2016 09:22:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7O9MQ3c019200
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2016 02:22:26 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 24 Aug 2016 02:22:25 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 24 Aug 2016 17:06:51 +0800
Message-ID: <81f605dbb81ccc515770cb857e9c326e4484ec82.1472027350.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1472027350.git.jackie.huang@windriver.com>
References: <cover.1472027350.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 03/16] daq: control ipv6 support based on DISTRO_FEATURES
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
X-List-Received-Date: Wed, 24 Aug 2016 09:22:26 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Add PACKAGECONFIG for ipv6 and control it based
on DISTRO_FEATURES.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-networking/recipes-connectivity/daq/daq_2.0.6.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb b/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb
index 813c414..3ed3aab 100644
--- a/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb
+++ b/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb
@@ -20,6 +20,9 @@ SRC_URI = "http://fossies.org/linux/misc/daq-${PV}.tar.gz \
 EXTRA_OECONF = "--disable-nfq-module --disable-ipq-module --includedir=${includedir} \
     --with-libpcap-includes=${STAGING_INCDIR} --with-dnet-includes=${STAGING_LIBDIR}"
 
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)}"
+PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
+
 SRC_URI[md5sum] = "2cd6da422a72c129c685fc4bb848c24c"
 SRC_URI[sha256sum] = "b40e1d1273e08aaeaa86e69d4f28d535b7e53bdb3898adf539266b63137be7cb"
 
-- 
2.8.3


