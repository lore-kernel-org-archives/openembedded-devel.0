Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7B75572BA6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jan 2015 06:14:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0G6E8OB024720
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jan 2015 22:14:08 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.163.146) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 15 Jan 2015 22:14:08 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 16 Jan 2015 14:14:00 +0800
Message-ID: <ce1702cd97b09cfa5b7b6550c942a9d6027074e6.1421388212.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1421388212.git.jackie.huang@windriver.com>
References: <cover.1421388212.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/7] net-snmp: move persistent dir to /var/lib/net-snmp
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

Move persistent dir to /var/lib/net-snmp and fix security contexts for
them.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-networking/recipes-protocols/net-snmp/files/init          | 2 ++
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb | 1 +
 2 files changed, 3 insertions(+)

diff --git a/meta-networking/recipes-protocols/net-snmp/files/init b/meta-networking/recipes-protocols/net-snmp/files/init
index 434b2fa..6b02570 100755
--- a/meta-networking/recipes-protocols/net-snmp/files/init
+++ b/meta-networking/recipes-protocols/net-snmp/files/init
@@ -28,6 +28,8 @@ case "$1" in
 	echo -n " snmptrapd"
     fi
     echo "."
+
+    test ! -x /sbin/restorecon || /sbin/restorecon -FR /var/lib/net-snmp
     ;;
   stop)
     echo -n "Stopping network management services:"
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
index 07c7b60..3567094 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
@@ -34,6 +34,7 @@ EXTRA_OECONF = "--disable-embedded-perl \
                 --enable-shared \
                 --disable-manuals \
                 --with-defaults \
+                --with-persistent-directory=${localstatedir}/lib/net-snmp \
                 ${@base_conditional('SITEINFO_ENDIANNESS', 'le', '--with-endianness=little', '--with-endianness=big', d)}"
 
 # net-snmp needs to have mib-modules=smux enabled to enable quagga to support snmp
-- 
1.9.1


