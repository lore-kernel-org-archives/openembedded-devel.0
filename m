Received: from [93.188.72.201] (helo=mail.o2s.ch)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <david.lanzendoerfer@o2s.ch>) id 1Oc5Hq-0007yN-9i
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 01:34:50 +0200
Received: from dizzy-6.localnet ([::ffff:82.192.226.27])
	(AUTH: PLAIN david.lanzendoerfer@o2s.ch, TLS: TLSv1/SSLv3, 256bits,
	AES256-SHA) by koffein with esmtp; Fri, 23 Jul 2010 01:38:25 +0000
	id 000000000002ECF5.000000004C48F291.00003E0F
From: David =?iso-8859-1?q?Lanzend=F6rfer?= <david.lanzendoerfer@o2s.ch>
Organization: OpenSourceSupport GmbH
X-Face: a023Y#Om+E(<|Tkz7Ae>YeJ\rvY,eXDn^g66`NiaNQ"#xRJ=gr'!V}V#{MN6!YO{s{{); h
	=s@Vv%T)fi>gJrAHvijw^ZG9{b1rtf~mn$V^b`:3m>yH=o$Eo')Ul8f}F%1vdg9|52W=Xs
	rR^/E/SPo^{-R22[a}c?@tgfp<I#oOW7r}0We&3g5"2>N5r/Vu|>kWs"|J'XppA; *0A,6>
	*GY(0=H@>@^vEy]!m\)I42Lu@k~_=:U@/kf8{AO4'F7:Hy_*"5Xf9Vvkqr4E(32pVlT:=&
	i4l[3%?Z<zzP~wGSke?1VJj\cd~Z(,Upc;nOR|pqK@<j(`EYFSn,jN)A(~`YwM2nIv,
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Jul 2010 01:34:58 +0200
MIME-Version: 1.0
Message-Id: <201007230134.59343.david.lanzendoerfer@o2s.ch>
X-SA-Exim-Connect-IP: 93.188.72.201
X-SA-Exim-Mail-From: david.lanzendoerfer@o2s.ch
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] Adding maxima recipe (tool for algebraic calculation)
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
X-List-Received-Date: Thu, 22 Jul 2010 23:34:54 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

<JaMa> leviathan: and send PATCHv2 to ML if it builds for you correct .ipk I'll push it imediately

leviathan@dizzy-6 /mnt/sdb/build_gta02 $ ls tmp/deploy/ipk/armv4t/maxima*
tmp/deploy/ipk/armv4t/maxima_5.21.1-r0.5_armv4t.ipk  tmp/deploy/ipk/armv4t/maxima-dbg_5.21.1-r0.5_armv4t.ipk  tmp/deploy/ipk/armv4t/maxima-dev_5.21.1-r0.5_armv4t.ipk  tmp/deploy/ipk/armv4t/maxima-doc_5.21.1-r0.5_armv4t.ipk

@JaMa:
The content of the ipkgs is ok.
ready to push?

best regards
	leviathan
---
 recipes/maxima/maxima_5.21.1.bb |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)
 create mode 100644 recipes/maxima/maxima_5.21.1.bb

diff --git a/recipes/maxima/maxima_5.21.1.bb b/recipes/maxima/maxima_5.21.1.bb
new file mode 100644
index 0000000..ae89bea
--- /dev/null
+++ b/recipes/maxima/maxima_5.21.1.bb
@@ -0,0 +1,9 @@
+DESCRIPTION="Free computer algebra environment based on Macsyma"
+HOMEPAGE="http://maxima.sourceforge.net/"
+SRC_URI="http://www.sfr-fresh.com/unix/misc/${P}.tar.gz"
+LICENSE="GPLv2"
+
+inherit autotools
+
+SRC_URI[md5sum] = "e08ed533f3059cec52788ef35198bdcc"
+SRC_URI[sha256sum] = "1dae887e1787871437d699a6b1acc1c1f7428729487492a07c6a31e26bf53a1b"
-- 
1.6.4.4



