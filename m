Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5FD7C60248
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Nov 2016 06:34:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uA26YqrM008783
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 1 Nov 2016 23:34:52 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 1 Nov 2016 23:34:51 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 2 Nov 2016 14:34:29 +0800
Message-ID: <20161102063429.23924-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [meta-networking][PATCH v2] squid: disable gnu atomic operations for mipsel
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
X-List-Received-Date: Wed, 02 Nov 2016 06:34:51 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Disable GNU atomic operations for mipsel since it's
not supported.

Refer to https://gcc.gnu.org/bugzilla/show_bug.cgi?id=56300:

  There is no hardware support for 8 bytes atomic operations on
  32-bit MIPS targets.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-networking/recipes-daemons/squid/squid_3.5.20.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-daemons/squid/squid_3.5.20.bb b/meta-networking/recipes-daemons/squid/squid_3.5.20.bb
index 364d00e..fc7f768 100644
--- a/meta-networking/recipes-daemons/squid/squid_3.5.20.bb
+++ b/meta-networking/recipes-daemons/squid/squid_3.5.20.bb
@@ -38,6 +38,7 @@ USERADD_PARAM_${PN} = "--system --no-create-home --home-dir /var/run/squid --she
 
 PACKAGECONFIG ??= "${@bb.utils.contains('TARGET_ARCH', 'powerpc', 'noatomics', '', d)} \
                    ${@bb.utils.contains('TARGET_ARCH', 'mips', 'noatomics', '', d)} \
+                   ${@bb.utils.contains('TARGET_ARCH', 'mipsel', 'noatomics', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)} \
                   "
 PACKAGECONFIG[libnetfilter-conntrack] = "--with-netfilter-conntrack=${includedir}, --without-netfilter-conntrack, libnetfilter-conntrack"
-- 
2.8.3


