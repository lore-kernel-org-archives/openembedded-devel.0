Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RQ4Cd-0001ef-Qf
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Nov 2011 22:36:31 +0100
Received: (qmail invoked by alias); 14 Nov 2011 21:30:09 -0000
Received: from p5B0A3A75.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.58.117]
	by mail.gmx.net (mp007) with SMTP; 14 Nov 2011 22:30:09 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19dpaI/dNBdjdvmw2VcRKt8VCa8NDViDPvsUqGJmv
	FjqihDppzlX3Ru
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Nov 2011 22:35:09 +0100
Message-Id: <1321306512-9055-3-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1321306512-9055-1-git-send-email-schnitzeltony@gmx.de>
References: <1321306512-9055-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce][V2 2/5] midori: update to 0.4.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Nov 2011 21:36:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

for bad and sometimes vala-dirty people [1] we keep overwriting of waf since
midori still installs waf 1.5.19
(checked by bitbake -cunpack midori && <midori-workdir>/waf --version).

[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-November/035995.html

Reviewed-by: Paul Menzel <paulepanter@users.sourceforge.net>
Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../midori/{midori-0.4.1 => midori}/waf            |  Bin 92569 -> 92569 bytes
 .../midori/{midori_0.4.1.bb => midori_0.4.2.bb}    |    4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/midori/{midori-0.4.1 => midori}/waf (100%)
 rename meta-oe/recipes-connectivity/midori/{midori_0.4.1.bb => midori_0.4.2.bb} (58%)

diff --git a/meta-oe/recipes-connectivity/midori/midori-0.4.1/waf b/meta-oe/recipes-connectivity/midori/midori/waf
similarity index 100%
rename from meta-oe/recipes-connectivity/midori/midori-0.4.1/waf
rename to meta-oe/recipes-connectivity/midori/midori/waf
diff --git a/meta-oe/recipes-connectivity/midori/midori_0.4.1.bb b/meta-oe/recipes-connectivity/midori/midori_0.4.2.bb
similarity index 58%
rename from meta-oe/recipes-connectivity/midori/midori_0.4.1.bb
rename to meta-oe/recipes-connectivity/midori/midori_0.4.2.bb
index 7f4eb4b..10109e6 100644
--- a/meta-oe/recipes-connectivity/midori/midori_0.4.1.bb
+++ b/meta-oe/recipes-connectivity/midori/midori_0.4.2.bb
@@ -10,7 +10,7 @@ do_configure_prepend() {
   cp -f ${WORKDIR}/waf ${S}/
 }
 
-SRC_URI[midori.md5sum] = "33dde203cd71ae2b1d2adcc7f5739f65"
-SRC_URI[midori.sha256sum] = "b3c77ddb6f562a0ea3d2e6fbb756ca0dc158ad8410f4b60f8e5998c2f7305f07"
+SRC_URI[midori.md5sum] = "4ec9c3daa332ebe865cba6aa8256ef63"
+SRC_URI[midori.sha256sum] = "2e3f104254fb9a28c77e8acf1cc8ae6dd529499711d558b29146ab0fa915f0a7"
 
 
-- 
1.7.4.4



