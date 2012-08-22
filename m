Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1T4GfR-0000hv-RW
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Aug 2012 21:32:42 +0200
Received: by daks35 with SMTP id s35so1005222dak.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Aug 2012 12:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=w3ECiVjti7as9u0/WDBsAZf1fBPDbrrKAxrIJbyLTKQ=;
	b=XlP7e/rasxFsTtLXZQYJ8j1heSEpkutoQOXhaTOz8uADFM7RvlHMJ1oy0w7zKVTRqN
	xchzL+OIoTqFCitC08qoU2GmSLWu9zI1xz3RPE7Th+iAdVVGJpmgUTKloiwRtNBimcUm
	c1hxTnaxlWrQWvMrj9eblJfW1I8g7wO6jusPFUunbiwJJNCgc9MuLECwy0m8WV0TaCxD
	tGZ/Zk0jWl7DlKXgMT6tlv/bCQ3z0P7FSGZdNGSVoADEbCtWXNGAm05KQ34Nk/EedTAW
	jEIHUAGA52rmVbGIrwh85TN6P4Tqy3okZmfjs5l4icFAIXO2s82SKeJgRGhS4iadPqgZ
	u6uw==
Received: by 10.68.226.167 with SMTP id rt7mr54785729pbc.146.1345663235616;
	Wed, 22 Aug 2012 12:20:35 -0700 (PDT)
Received: from eos.du.ae ([94.205.108.162])
	by mx.google.com with ESMTPS id oj8sm4254996pbb.54.2012.08.22.12.20.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Aug 2012 12:20:34 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Aug 2012 23:20:18 +0400
Message-Id: <1345663224-42350-1-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Elvis Dowson <elvis.dowson@gmail.com>
Subject: [meta-xilinx 1/7] tune-ppc440: Reorder tune features.
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
X-List-Received-Date: Wed, 22 Aug 2012 19:32:42 -0000

* Minor change to reorder the tune features.

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 conf/machine/include/tune-ppc440.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/include/tune-ppc440.inc b/conf/machine/include/tune-ppc440.inc
index 35e93e9..699dfc9 100644
--- a/conf/machine/include/tune-ppc440.inc
+++ b/conf/machine/include/tune-ppc440.inc
@@ -6,7 +6,7 @@ TUNEVALID[ppc440] = "Enable ppc440 specific processor optimizations"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppc440", "-mcpu=440", "", d)}"
 
 AVAILTUNES += "ppc440"
-TUNE_FEATURES_tune-ppc440 = "m32 fpu-soft ppc440"
+TUNE_FEATURES_tune-ppc440 = "m32 ppc440 fpu-soft"
 TUNE_PKGARCH_tune-ppc440 = "ppc440"
 PACKAGE_EXTRA_ARCHS_tune-ppc440 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc-nf} ppc440"
 
-- 
1.7.9.5



