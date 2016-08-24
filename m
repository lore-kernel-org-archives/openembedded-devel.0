Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C6503731AC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2016 09:22:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7O9MTRP023402
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2016 02:22:29 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 24 Aug 2016 02:22:28 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 24 Aug 2016 17:06:53 +0800
Message-ID: <4cd9fd833dd959f5abebbfed955f4e5eda5c9cc2.1472027350.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1472027350.git.jackie.huang@windriver.com>
References: <cover.1472027350.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 05/16] ntp: control ipv6 support based on DISTRO_FEATURES
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
X-List-Received-Date: Wed, 24 Aug 2016 09:22:28 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Add PACKAGECONFIG for ipv6 and control it based
on DISTRO_FEATURES.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-networking/recipes-support/ntp/ntp_4.2.8p8.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p8.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p8.bb
index bca5a07..f3344c0 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p8.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p8.bb
@@ -46,7 +46,9 @@ USERADD_PARAM_${PN} = "--system --home-dir ${NTP_USER_HOME} \
                        --shell /bin/false --user-group ntp"
 
 # NB: debug is default-enabled by NTP; keep it default-enabled here.
-PACKAGECONFIG ??= "cap debug refclocks"
+PACKAGECONFIG ??= "cap debug refclocks \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)} \
+"
 PACKAGECONFIG[openssl] = "--with-openssl-libdir=${STAGING_LIBDIR} \
                           --with-openssl-incdir=${STAGING_INCDIR} \
                           --with-crypto, \
@@ -57,6 +59,7 @@ PACKAGECONFIG[readline] = "--with-lineeditlibs,--without-lineeditlibs,readline"
 PACKAGECONFIG[refclocks] = "--enable-all-clocks,--disable-all-clocks,pps-tools"
 PACKAGECONFIG[debug] = "--enable-debugging,--disable-debugging"
 PACKAGECONFIG[mdns] = "ac_cv_header_dns_sd_h=yes,ac_cv_header_dns_sd_h=no,mdns"
+PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 
 do_install_append() {
     install -d ${D}${sysconfdir}/init.d
-- 
2.8.3


