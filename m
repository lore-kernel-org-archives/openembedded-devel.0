Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 46C6560DD7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Oct 2014 15:27:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9HFRQES025336
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Oct 2014 08:27:27 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 17 Oct 2014 08:27:26 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 17 Oct 2014 11:27:25 -0400
Message-ID: <1413559645-28916-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] wireshark: add PACKAGECONFIG for krb5
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
X-List-Received-Date: Fri, 17 Oct 2014 15:27:31 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* fixes floating dependency:
WARNING: QA Issue: wireshark rdepends on krb5, but it isn't a build dependency? [build-deps]

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-networking/recipes-support/wireshark/wireshark_1.12.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.1.bb b/meta-networking/recipes-support/wireshark/wireshark_1.12.1.bb
index 147c513..e198863 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_1.12.1.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_1.12.1.bb
@@ -35,6 +35,7 @@ PACKAGECONFIG[graphics] = "--enable-wireshark, --disable-wireshark,"
 PACKAGECONFIG[ipv6] = "--enable-ipv6, --disable-ipv6,"
 PACKAGECONFIG[gnutls] = "--with-gnutls=yes, --with-gnutls=no, gnutls"
 PACKAGECONFIG[gcrypt] = "--with-gcrypt=yes, --with-gcrypt=no, libgcrypt"
+PACKAGECONFIG[krb5] = "--with-krb5=yes, --with-krb5=no, krb5"
 
 EXTRA_OECONF = "--with-qt=no --enable-usr-local=no --enable-tshark --with-c-ares=no"
 
-- 
2.0.0


