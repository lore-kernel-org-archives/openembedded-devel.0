Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5D46B72646
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2015 01:45:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0Q1jCR4003189
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Jan 2015 17:45:12 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 25 Jan 2015 17:45:12 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 25 Jan 2015 17:45:08 -0800
Message-ID: <f4602e4bf5592cf3e39c5897c1ea935972614aaa.1422236615.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1422236615.git.liezhi.yang@windriver.com>
References: <cover.1422236615.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking] [PATCH 4/5] wireshark: add PACKAGECONFIG for geoip
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
X-List-Received-Date: Mon, 26 Jan 2015 01:45:11 -0000
Content-Type: text/plain

Fixed:
epan/dissectors/packet-ip.c:56:19: fatal error: GeoIP.h: No such file or directory

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-support/wireshark/wireshark_1.12.2.bb  |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.2.bb b/meta-networking/recipes-support/wireshark/wireshark_1.12.2.bb
index 5740730..4fd519e 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_1.12.2.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_1.12.2.bb
@@ -36,6 +36,7 @@ PACKAGECONFIG[ipv6] = "--enable-ipv6, --disable-ipv6,"
 PACKAGECONFIG[gnutls] = "--with-gnutls=yes, --with-gnutls=no, gnutls"
 PACKAGECONFIG[gcrypt] = "--with-gcrypt=yes, --with-gcrypt=no, libgcrypt"
 PACKAGECONFIG[krb5] = "--with-krb5=yes, --with-krb5=no, krb5"
+PACKAGECONFIG[geoip] = "--with-geoip, --without-geoip, geoip"
 
 EXTRA_OECONF = "--with-qt=no --enable-usr-local=no --enable-tshark --with-c-ares=no"
 
-- 
1.7.9.5


