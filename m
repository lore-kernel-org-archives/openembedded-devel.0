Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 20265731D1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2016 09:22:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7O9MVmV019203
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Aug 2016 02:22:31 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 24 Aug 2016 02:22:30 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 24 Aug 2016 17:06:54 +0800
Message-ID: <f759a070389bd0ba265ee8554e1bc33cb7be1218.1472027350.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1472027350.git.jackie.huang@windriver.com>
References: <cover.1472027350.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 06/16] squid: control ipv6 support based on DISTRO_FEATURES
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
X-List-Received-Date: Wed, 24 Aug 2016 09:22:30 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Add PACKAGECONFIG for ipv6 and control it based
on DISTRO_FEATURES.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-networking/recipes-daemons/squid/squid_3.5.20.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-daemons/squid/squid_3.5.20.bb b/meta-networking/recipes-daemons/squid/squid_3.5.20.bb
index 5595bdf..760eca8 100644
--- a/meta-networking/recipes-daemons/squid/squid_3.5.20.bb
+++ b/meta-networking/recipes-daemons/squid/squid_3.5.20.bb
@@ -37,9 +37,11 @@ USERADD_PARAM_${PN} = "--system --no-create-home --home-dir /var/run/squid --she
 
 PACKAGECONFIG ??= "${@bb.utils.contains('TARGET_ARCH', 'powerpc', 'noatomics', '', d)} \
                    ${@bb.utils.contains('TARGET_ARCH', 'mips', 'noatomics', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)} \
                   "
 PACKAGECONFIG[libnetfilter-conntrack] = "--with-netfilter-conntrack=${includedir}, --without-netfilter-conntrack, libnetfilter-conntrack"
 PACKAGECONFIG[noatomics] = "squid_cv_gnu_atomics=no,squid_cv_gnu_atomics=yes,,"
+PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 
 BASIC_AUTH = "DB SASL LDAP NIS"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
-- 
2.8.3


