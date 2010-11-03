Received: from smtp204.alice.it ([82.57.200.100])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1PDcI3-0005Vw-Qx
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 13:18:08 +0100
Received: from jcn (80.116.251.53) by smtp204.alice.it (8.5.124.08)
	id 4C88E33B0435C62C; Wed, 3 Nov 2010 13:17:17 +0100
Received: from ao2 by jcn with local (Exim 4.72)
	(envelope-from <ospite@studenti.unina.it>)
	id 1PDcHE-0004mI-9N; Wed, 03 Nov 2010 13:17:16 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Nov 2010 13:17:13 +0100
Message-Id: <1288786633-18309-3-git-send-email-ospite@studenti.unina.it>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1288786633-18309-1-git-send-email-ospite@studenti.unina.it>
References: <1288786633-18309-1-git-send-email-ospite@studenti.unina.it>
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
X-SA-Exim-Connect-IP: 82.57.200.100
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] tzcode-native: bump version to 2010n
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
X-List-Received-Date: Wed, 03 Nov 2010 12:18:08 -0000

Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
---
 ...code-native_2010m.bb => tzcode-native_2010n.bb} |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)
 rename recipes/tzcode/{tzcode-native_2010m.bb => tzcode-native_2010n.bb} (51%)

diff --git a/recipes/tzcode/tzcode-native_2010m.bb b/recipes/tzcode/tzcode-native_2010n.bb
similarity index 51%
rename from recipes/tzcode/tzcode-native_2010m.bb
rename to recipes/tzcode/tzcode-native_2010n.bb
index c6a334869..3f0c2b5 100644
--- a/recipes/tzcode/tzcode-native_2010m.bb
+++ b/recipes/tzcode/tzcode-native_2010n.bb
@@ -6,11 +6,11 @@ require tzcode-native.inc
 # Also, tzdata (and it is needed to build tzcode) version can differ from
 # tzcode version, thus this variable
 
-TZDATA_PV = "2010m"
+TZDATA_PV = "2010o"
 
-SRC_URI[tzcode-2010m.md5sum] = "dee44c5b5ff70c424f62333b4c6d09a2"
-SRC_URI[tzcode-2010m.sha256sum] = "24f0274d531a53415f1314891bc0df47778044a53186a1c0eb2df3991af91a18"
-SRC_URI[tzdata-2010m.md5sum] = "9e33cb126c8cb6673f39390d347fb0e2"
-SRC_URI[tzdata-2010m.sha256sum] = "1454a13a32e23e81195404d00ab97a64a356e9a5852fc7d121ed7e58cbdb75aa"
+SRC_URI[tzcode-2010n.md5sum] = "a7a776a5713831993e814fe0c05f9fd5"
+SRC_URI[tzcode-2010n.sha256sum] = "f2810d87764f142c762b6d5ec3cb9621c981503c041246a1f6f3c24fd5ef131a"
+SRC_URI[tzdata-2010o.md5sum] = "5cae5c56fad81dc29f8fcd933a05768e"
+SRC_URI[tzdata-2010o.sha256sum] = "cd0f3799688b3b870cd988505e47c2975b1808e73ec0677bc9db4b705b534c07"
 
 PR = "${INC_PR}.0"
-- 
1.7.2.3



