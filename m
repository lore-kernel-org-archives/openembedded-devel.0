Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7F5306174D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 20:39:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48PNc02jxSz40
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 21:39:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582317568;
	bh=zpAohNDnuSbzCrsQ3G8Y4WiVBu3H929OQ+ufStsyITU=;
	h=From:To:Subject:Date:From;
	b=oFYtE83MaOGepPsUO8EqlEnorTxBmkoGxMysMQlLrsG/oNpKhEBrqp+nUkg+2RDy4
	r1XfB9qvgQhgl2ZKAEppPdn3j7cqvZKoTkAVYFf0VmEjojXWe73m4AxGtyFlLR3Rvc
	1yBZNmE6B46IkXxnyxummctSujx7tNYJluLEm1+wIb5Zmn6a8U4MuLv1dO58e/5VSt
	V7Y0O5SnA2tlvBp1ddJMl0Ld5s1ZSTIMdpvSrfCHRLi3T+5TjyxI6SM+IutZUtqppq
	rch5GMLkxA3Hg64slprtoewsfER7xLRMjw1dts7SaBZUky+4LjPnr55mZTzVQGPnNq
	JDfNhdPw8WAbp5RKLwLjthTV7lthc7ozsgHRKVvk6/aupalMrturMzwDalSK8NXIbs
	EIyfN+EFdkU1gx7+PnBf8XJ3A5Ke8Lg6/YxQzg1YPjuFyeiKztVeMU9tHLvjda6mPj
	pTyvFXez+2r2KgXApl9I10zz/Is12MXYfywP4liPxgFHG7eJyv+JcyR/1DDmGPP711
	+hcBscyJX0h6IoT77XFsh8vn8UeCXJyhKGemWFsS9eVUR5D1CP/qI4KEbrWGm40OKK
	72qX1otW/PuuCQSIxHReF81a7kZzemCNdvb+T2q26HGNaXO1UExezGLXVCzfm1Bf8n
	8NPQH7zBVwyt+29GtpQyrSZM=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Feb 2020 22:39:26 +0200
Message-Id: <20200221203926.17141-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][zeus][PATCH] wireshark: Upgrade 3.0.6 -> 3.0.8
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
X-List-Received-Date: Fri, 21 Feb 2020 20:39:31 -0000

Upgrade on the 3.0 stable branch,
including fixes for CVE-2019-19553 and CVE-2020-7045.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../wireshark/{wireshark_3.0.6.bb => wireshark_3.0.8.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.0.6.bb => wireshark_3.0.8.bb} (95%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.0.6.bb b/meta-networking/recipes-support/wireshark/wireshark_3.0.8.bb
similarity index 95%
rename from meta-networking/recipes-support/wireshark/wireshark_3.0.6.bb
rename to meta-networking/recipes-support/wireshark/wireshark_3.0.8.bb
index ccaa0c94a..226e16e4e 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.0.6.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.0.8.bb
@@ -12,8 +12,8 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[md5sum] = "c6f8d12a3efe21cc7885f7cb0c4bd938"
-SRC_URI[sha256sum] = "a87f4022a0c15ddbf1730bf1acafce9e75a4e657ce9fa494ceda0324c0c3e33e"
+SRC_URI[md5sum] = "034f09e639fb4efebbc08af7b2a85333"
+SRC_URI[sha256sum] = "b4bd8189934d82330a053c5b10398f2b625b1e1c8818831ab61739b2d7aa7561"
 
 PE = "1"
 
-- 
2.17.1


