Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1Sa8jq-0003bO-6F
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 May 2012 19:00:42 +0200
Received: by wgbdr1 with SMTP id dr1so1019920wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2012 09:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=0ZXh1TTPbKr5YHZP+5txl8PKVSASEWhJ5nNJTKISpi8=;
	b=IMzU2lBBrRiDE/WQhXS5rTemPJbD+g7HdWaUYVjq2Fm9OObFgID4n94+wAFGkiKpdb
	+2H41u3Y4b8+0bw4hLSbdNjeToeRabpRz77YkqGYBTQgm2w2KDkOGqM627+iUzXTgCut
	RXTGSXF2AFaTgJixlD5sZW3Ok802SOqOZmul5Tyt/injlyWmxHHjdEHeaG4cSIJ2S5c1
	Cnp69rujYC4RwkhjEKeqzqhy4PMWp2+z5upN+OhjCBKws3zPr9m5dvv9g9PWweTq++/i
	hVV7O/p2uBN2tdXhlDDInsrMecrfnc3dnaEmd/jXlUsZ0ssFHqpA5j0hB1xz6IJIIZ9p
	CZTg==
Received: by 10.216.193.162 with SMTP id k34mr713244wen.54.1338483022156;
	Thu, 31 May 2012 09:50:22 -0700 (PDT)
Received: from localhost.localdomain
	(197.Red-79-150-15.dynamicIP.rima-tde.net. [79.150.15.197])
	by mx.google.com with ESMTPS id ez4sm4670831wid.3.2012.05.31.09.50.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 May 2012 09:50:21 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 May 2012 18:50:02 +0200
Message-Id: <1338483003-14850-2-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1338483003-14850-1-git-send-email-elvis.dowson@gmail.com>
References: <1338483003-14850-1-git-send-email-elvis.dowson@gmail.com>
Cc: Elvis Dowson <elvis.dowson@gmail.com>
Subject: [meta-xilinx 2/2] tune-ppc440: Add glibc configure options.
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
X-List-Received-Date: Thu, 31 May 2012 17:00:42 -0000

* Add glibc configure options to get ppc440 specific library.

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 conf/machine/include/tune-ppc440.inc |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/conf/machine/include/tune-ppc440.inc b/conf/machine/include/tune-ppc440.inc
index 371fdf9..35e93e9 100644
--- a/conf/machine/include/tune-ppc440.inc
+++ b/conf/machine/include/tune-ppc440.inc
@@ -10,4 +10,5 @@ TUNE_FEATURES_tune-ppc440 = "m32 fpu-soft ppc440"
 TUNE_PKGARCH_tune-ppc440 = "ppc440"
 PACKAGE_EXTRA_ARCHS_tune-ppc440 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc-nf} ppc440"
 
-#MACHINEOVERRIDES .= "ppc440"
+# glibc configure options to get ppc440 specific library (for sqrt)
+GLIBC_EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "ppc440", "-with-cpu=440", "", d)}"
-- 
1.7.9.5



