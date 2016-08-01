Return-Path: <jpuhlman@mvista.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 769156E660
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Aug 2016 04:42:02 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id ks6so48793720pab.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Jul 2016 21:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=lKfGNNCzBkpC18v876YHu0onxU4bBp7mLytVfd4R4f4=;
	b=bD2+bZcOMgIgzOKD6ePX+s2eJmAGSHs5dissXGKeS4Hkc6yANFZwkogu0Zaj7BjduA
	y9BRisC0lGl93U3ijvnP5I59ojzIjbGJkZ5gF9NkvxvQN071aOSBiQkCRZgEFq/9yQgw
	ZIR1dVy7kgLlAwaGRVNX84aigyHByCLnTn+y10GIAXHiG/OYD4uEF6B0Ud7DtO9tzFfe
	0MA++uNzmKUr5BlJV6ylCZqx10tbmBwtCjR4p8HDxZrZAvF6l/LdUvTO0CHYv/eR669z
	CAfLubjsEjQySQSIlSrQKpAs/vYUT3nBazmOUSRxuPdpBG4ISw3ukNNPw7l8IXtAIuxy
	Vwgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lKfGNNCzBkpC18v876YHu0onxU4bBp7mLytVfd4R4f4=;
	b=Bqy4Ph/FKrsntLZP7FGhJC0ViK9leilXdqkmUXzqzqq1hgd7bN8JZQHdxKr7WRAN3T
	TunQfF4aPJ3yy70JwRHgwuyx9eLYrrhgVVjOJpy6S3HvAnyQyHMvBKic2jRi4wRJcWAV
	W1ffi/Z5ECQ0mkJzxvhnuCNo0wMHOnn3LZjZd+whUZpodBiB2S8w32n4rI6CB2g6VXil
	iVkbMAAN9ogzlRKLKjNzd/GBEalSKb1G62niBKcXKOGu1+84MxHaifURCj2vUJDqClgq
	YLdxDOybzOHqqSQY5wcTZJI0InZgX1UIy24BTWNY7pFX/N0jjSV3WtwEZ3Gag5IDrCe7
	ZPSQ==
X-Gm-Message-State: AEkoousZ3QoW8AMUZPcrtMs30ETYzLT2iMcId3tp7mzEVJTqkCCLvgfWCaL0Kmaqkv88y1iv
X-Received: by 10.66.9.42 with SMTP id w10mr91618128paa.34.1470026523110;
	Sun, 31 Jul 2016 21:42:03 -0700 (PDT)
Received: from workhorse.mvista.com
	(99-0-9-164.lightspeed.frokca.sbcglobal.net. [99.0.9.164])
	by smtp.gmail.com with ESMTPSA id
	h66sm41342022pfe.58.2016.07.31.21.42.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Jul 2016 21:42:02 -0700 (PDT)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 31 Jul 2016 21:41:57 -0700
Message-Id: <1470026517-26247-1-git-send-email-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH] Fix random python backtrace in mutlilib handling code.
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
X-List-Received-Date: Mon, 01 Aug 2016 04:42:02 -0000

newval is not defined in all cases. Set to None and check if it is set.

  File
"/local/foo/builds/x86/layers/openembedded-core/meta/classes/multilib_global.bbclass",
line 90, in preferred_ml_updates(d=<bb.data_smart.DataSmart object at
0xf6fd528c>):
                 if not d.getVar(newname, False):
    >                d.setVar(newname, localdata.expand(newval))
             # Avoid future variable key expansion
UnboundLocalError: local variable 'newval' referenced before assignment
---
 meta/classes/multilib_global.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
index 67dc72b..11ae268 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -72,6 +72,7 @@ def preferred_ml_updates(d):
             pkg = pkg.replace("virtual/", "")
             virt = "virtual/"
         for p in prefixes:
+            newval = None
             if pkg != "kernel":
                 newval = p + "-" + val
 
@@ -86,7 +87,7 @@ def preferred_ml_updates(d):
 
             # implement alternative multilib name
             newname = localdata.expand("PREFERRED_PROVIDER_" + virt + p + "-" + pkg)
-            if not d.getVar(newname, False):
+            if not d.getVar(newname, False) and newval != None:
                 d.setVar(newname, localdata.expand(newval))
         # Avoid future variable key expansion
         provexp = d.expand(prov)
-- 
2.6.2


