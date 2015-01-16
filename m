Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0CA6172C0A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jan 2015 06:14:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0G6E7Uf016881
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jan 2015 22:14:07 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.163.146) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 15 Jan 2015 22:14:06 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 16 Jan 2015 14:13:59 +0800
Message-ID: <4e0ec73607aac99d7aaebf8148621a1d2848db46.1421388212.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1421388212.git.jackie.huang@windriver.com>
References: <cover.1421388212.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/7] net-snmp: have mib-modules=smux enabled
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
X-List-Received-Date: Fri, 16 Jan 2015 06:14:17 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

According to the following commit, net-snmp needs to have
mib-modules=smux enabled:
commit f64db3011c04ada0a8ac04b9eddde05b67d21eec
Author: Aws Ismail <aws.ismail@windriver.com>
Date:   Mon Mar 25 11:30:06 2013 -0400

    Quagga has no snmp support, unrecognized options --enable-tcp-md5

    1. Quagga's tcp-md5 has been renamed to linux24-tcp-md5

    2. net-snmp needs to have mib-modules=smux enabled to enable
    quagga to support snmp. Make the net-snmp option dependent
    on the DISTRO_FEATURE snmp.

    3. Misc: install the sample conf files for quagga. Also,
    Make sure that the post install script is being run
    on the target rather than during the rootfs creation
    stage.

    Signed-off-by: Amy Fong <amy.fong@windriver.com>
    Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
    Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
index a76de0d..07c7b60 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
@@ -36,6 +36,9 @@ EXTRA_OECONF = "--disable-embedded-perl \
                 --with-defaults \
                 ${@base_conditional('SITEINFO_ENDIANNESS', 'le', '--with-endianness=little', '--with-endianness=big', d)}"
 
+# net-snmp needs to have mib-modules=smux enabled to enable quagga to support snmp
+EXTRA_OECONF += "--with-mib-modules=smux"
+
 CACHED_CONFIGUREVARS = " \
     ac_cv_header_valgrind_valgrind_h=no \
     ac_cv_header_valgrind_memcheck_h=no \
-- 
1.9.1


