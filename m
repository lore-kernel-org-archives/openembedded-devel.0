Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BA7377265A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2015 08:26:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0Q8QBX4028699
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2015 00:26:11 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.136) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 26 Jan 2015 00:26:11 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 26 Jan 2015 16:26:10 +0800
Message-ID: <1422260770-6453-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH][meta-networking] wireshark: add PACKAGECONFIG option to use geoip
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
X-List-Received-Date: Mon, 26 Jan 2015 08:26:11 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Add geoip to PACKAGECONFIG to remove the warning:
    WARNING: QA Issue: wireshark rdepends on geoip, but
        it isn't a build dependency?

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-networking/recipes-support/wireshark/wireshark_1.12.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.2.bb b/meta-networking/recipes-support/wireshark/wireshark_1.12.2.bb
index 5740730..3fa4991 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_1.12.2.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_1.12.2.bb
@@ -36,6 +36,7 @@ PACKAGECONFIG[ipv6] = "--enable-ipv6, --disable-ipv6,"
 PACKAGECONFIG[gnutls] = "--with-gnutls=yes, --with-gnutls=no, gnutls"
 PACKAGECONFIG[gcrypt] = "--with-gcrypt=yes, --with-gcrypt=no, libgcrypt"
 PACKAGECONFIG[krb5] = "--with-krb5=yes, --with-krb5=no, krb5"
+PACKAGECONFIG[geoip] = "--with-geoip,--without-geoip,geoip"
 
 EXTRA_OECONF = "--with-qt=no --enable-usr-local=no --enable-tshark --with-c-ares=no"
 
-- 
2.1.0


