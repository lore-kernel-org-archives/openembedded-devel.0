Return-Path: <pjtexier@koncepto.io>
X-Greylist: delayed 365 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 09 Dec 2019 17:00:50 UTC
Received: from koncepto.io (koncepto.io [195.154.119.111])
	by mail.openembedded.org (Postfix) with ESMTP id BC9067FBEB
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 17:00:50 +0000 (UTC)
Received: from menoah.home (lfbn-1-6734-38.w90-120.abo.wanadoo.fr
	[90.120.168.38]) by koncepto.io (Postfix) with ESMTPSA id C14E76002B;
	Mon,  9 Dec 2019 17:54:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1575910483;
	bh=EF8z/eK1w5aC9mCzCvdpmEbkc0hqLVPpP+Q0YfwKyB4=;
	h=From:To:Cc:Subject:Date:From;
	b=XyPxTGtSr2Xr7A2l1G9v0K3JJggWRjo1zpW0cmkHMWkfbyhhuHN65lNJgpxgCPmBy
	NkN3PwHJM1GABtqkyAu9+ttliCUNFsqI00pZQQjDRN8adq96odl+Hjn1Yd2R5XRsoo
	1Fb31S6RsPDubT991qnlb36AXD9gc1vhh52xgB33qouG3pArfps1X1VxaEvcWWove8
	s66C8PmPuG6ivA+EmYQysSW17c/9wHZdnYny9i4T+fslhFnv5TpEiTsqktPj3MTAgW
	j4vR6BfHDAmAzOWaRa9CY3BD+PH8wyHBgd3ino351CxWFq08+uY6xb/qQSBcBjNqna
	qUBTB1DQ+T7Bg==
From: Pierre-Jean Texier <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 17:54:38 +0100
Message-Id: <1575910478-14575-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] libssh2: add nativesdk support
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
X-List-Received-Date: Mon, 09 Dec 2019 17:00:51 -0000

Fixes:
 Missing or unbuildable dependency chain was: ['nativesdk-cmake', 'nativesdk-curl', 'nativesdk-libssh2']

So, extend libssh2 to nativesdk to fix this issue.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb b/meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb
index 185ea11..c1f337a 100644
--- a/meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb
+++ b/meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb
@@ -25,4 +25,4 @@ PACKAGECONFIG ??= "openssl"
 PACKAGECONFIG[openssl] = "--with-crypto=openssl --with-libssl-prefix=${STAGING_LIBDIR}, , openssl"
 PACKAGECONFIG[gcrypt] = "--with-crypto=libgcrypt --with-libgcrypt-prefix=${STAGING_EXECPREFIXDIR}, , libgcrypt"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


