Return-Path: <hugo.saldanha@aker.com.br>
X-Greylist: delayed 602 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 23 Jun 2015 16:07:52 UTC
Received: from asmg.aker.com.br (asmg.aker.com.br [177.159.144.67])
	by mail.openembedded.org (Postfix) with SMTP id D6DF660557
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jun 2015 16:07:52 +0000 (UTC)
Received: from mail.aker.com.br (bat.bsb.aker.com.br [10.0.0.20])
	by asmg.aker.com.br [10.0.1.3]; Tue, 23 Jun 2015 13:07:48 -0300
	(envelope-from hugo.saldanha@aker.com.br)
Received: from saldanha.aker.com.br (10.4.3.1) by mail.aker.com.br (10.0.0.20)
	with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Tue, 23 Jun 2015 12:57:48 -0300
From: Hugo Vasconcelos Saldanha <hugo.saldanha@aker.com.br>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 23 Jun 2015 13:02:04 -0300
Message-ID: <1435075324-12895-1-git-send-email-hugo.saldanha@aker.com.br>
X-Mailer: git-send-email 2.4.4
MIME-Version: 1.0
X-AkerSMTPGW-ServerID: efa1de5243ffebe9bf836ee14063171c1764dbbe
X-AkerSMTPGW-MessageID: 8e21eb6a1f86be0e1725e6863904848ac00b3bbd-10o
Subject: [meta-oe][master/fido/dizzy][PATCH] libssh2: upgrade to v1.6.0
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
X-List-Received-Date: Tue, 23 Jun 2015 16:07:56 -0000
Content-Type: text/plain

Besides new features and improvements, this fixes CVE-2015-1782.

License's md5 changed because of a modified copyright.

Signed-off-by: Hugo Vasconcelos Saldanha <hugo.saldanha@aker.com.br>
---
 .../recipes-support/libssh2/{libssh2_1.4.3.bb => libssh2_1.6.0.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/libssh2/{libssh2_1.4.3.bb => libssh2_1.6.0.bb} (60%)

diff --git a/meta-oe/recipes-support/libssh2/libssh2_1.4.3.bb b/meta-oe/recipes-support/libssh2/libssh2_1.6.0.bb
similarity index 60%
rename from meta-oe/recipes-support/libssh2/libssh2_1.4.3.bb
rename to meta-oe/recipes-support/libssh2/libssh2_1.6.0.bb
index b537663..022482c 100644
--- a/meta-oe/recipes-support/libssh2/libssh2_1.4.3.bb
+++ b/meta-oe/recipes-support/libssh2/libssh2_1.6.0.bb
@@ -5,11 +5,11 @@ SECTION = "libs"
 DEPENDS = "zlib openssl"
 
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d00afe44f336a79a2ca7e1681ce14509"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c5cf34fc0acb44b082ef50ef5e4354ca"
 
 SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz"
-SRC_URI[md5sum] = "071004c60c5d6f90354ad1b701013a0b"
-SRC_URI[sha256sum] = "eac6f85f9df9db2e6386906a6227eb2cd7b3245739561cad7d6dc1d5d021b96d"
+SRC_URI[md5sum] = "00aabd6e714a5f42a4fb82ace20db1dd"
+SRC_URI[sha256sum] = "5a202943a34a1d82a1c31f74094f2453c207bf9936093867f41414968c8e8215"
 
 inherit autotools pkgconfig
 
-- 
2.4.4



