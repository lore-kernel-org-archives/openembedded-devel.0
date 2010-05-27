Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1OHcSy-0004kt-Tv
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 May 2010 14:45:42 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.3/8.14.4) with ESMTP id o4RCfOtv024406
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 27 May 2010 14:41:25 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.71) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1OHcOp-0000p0-VS; Thu, 27 May 2010 14:41:24 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 May 2010 14:41:11 +0200
Message-Id: <0e0cdcf922c4d5d97f306388e606d90a6b18da67.1274963939.git.enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.0.1
In-Reply-To: <251e7c878dc4a683988be506f6285ba6ac53b47c.1274963939.git.enrico.scholz@sigma-chemnitz.de>
References: <251e7c878dc4a683988be506f6285ba6ac53b47c.1274963939.git.enrico.scholz@sigma-chemnitz.de>
In-Reply-To: <251e7c878dc4a683988be506f6285ba6ac53b47c.1274963939.git.enrico.scholz@sigma-chemnitz.de>
References: <251e7c878dc4a683988be506f6285ba6ac53b47c.1274963939.git.enrico.scholz@sigma-chemnitz.de>
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Scanned-By: MIMEDefang 2.68 on 62.153.82.30
X-SA-Exim-Connect-IP: 62.153.82.30
X-SA-Exim-Mail-From: enrico.scholz@sigma-chemnitz.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH 3/3] patch.bbclass: use oe_param_bool()
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
X-List-Received-Date: Thu, 27 May 2010 12:45:46 -0000
X-List-Received-Date: Thu, 27 May 2010 12:45:46 -0000
X-List-Received-Date: Thu, 27 May 2010 12:45:46 -0000

This patch replaces a complicated if statement with a more simple
code.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 classes/patch.bbclass |   12 +++++-------
 1 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/classes/patch.bbclass b/classes/patch.bbclass
index 7b0c444..8fe8c00 100644
--- a/classes/patch.bbclass
+++ b/classes/patch.bbclass
@@ -46,15 +46,13 @@ python patch_do_patch() {
 			local = os.path.join(workdir, base)
 			ext = os.path.splitext(base)[1]
 
-		if "apply" in parm:
-			apply = parm["apply"]
-			if apply != "yes":
-				if apply != "no":
-					bb.msg.warn(None, "Unsupported value '%s' for 'apply' url param in '%s', please use 'yes' or 'no'" % (apply, url))
-				continue
+		is_patch = ext in (".diff", ".patch")
+
+		if not oe_param_bool(parm, 'apply', is_patch):
+			continue
 		elif "patch" in parm:
 			bb.msg.warn(None, "Deprecated usage of 'patch' url param in '%s', please use 'apply={yes,no}'" % url)
-		elif ext not in (".diff", ".patch"):
+		elif not is_patch:
 			continue
 
 		if not local:
-- 
1.7.0.1



