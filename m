Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Spc6M-0006VU-0Q
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 11:23:54 +0200
Received: by mail-ey0-f175.google.com with SMTP id l1so885914eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 02:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=/+EcStqkyOm69TENXKC0zqxJ7NC4E3PWQr0U26TIqr8=;
	b=PDTi2+abVnm4GEpb9symb23ywCAyELXUghllaT2bf6xPJW/F/lIKzBTdG8Tqq6kC/4
	1hvpgSP7UGnBK3kF7vaQV4b4zbA0qS4wTQSFSCnKdUKtniN32UkfJUNRabiBCCrfxoaw
	hWzmWjlLmiQWPVpEyDXQsivH+sNrvFalkMhCerRWHiWicFKZ1MJU6fkzBGP5q+U2+rGf
	jAGTexIxEDrfrpAWzNgiIA8e0l5q9X5KB1m+FLykb0xlJYR1mYOUwwvMGAssMq1zqfyz
	ARCtDue+67GT2IF/uBhrfQheCUu5rG1yEpfbWUMehom+HuIMssUWExGe7Zt7spqGMhuB
	5iUw==
Received: by 10.14.48.75 with SMTP id u51mr84494eeb.42.1342170761953;
	Fri, 13 Jul 2012 02:12:41 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id u14sm23237653eem.4.2012.07.13.02.12.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 02:12:41 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 11:11:52 +0200
Message-Id: <1342170730-14982-6-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1342170730-14982-1-git-send-email-koen@dominion.thruhere.net>
References: <1342170730-14982-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlqGcDqbykkhtKMc0/RUNS0+832iIM+8+ld3gwMWYkAMklAUj8WUJ8PI5RbD0V7nwrNReJj
Cc: Koen Kooi <koen@dominion.thruhere.net>, eric@eukrea.com
Subject: [for-denzil][meta-oe 06/24] nodejs 0.6.18: fix patch name
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
X-List-Received-Date: Fri, 13 Jul 2012 09:23:54 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-devtools/nodejs/nodejs_0.6.18.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.6.18.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.6.18.bb
index d5785d2..7136ffc 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_0.6.18.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.6.18.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=914812f2875eef849b5c509cc25dcb4f"
 DEPENDS = "openssl"
 
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
-           file://gcc-4.7.patch"
+           file://fix-hardfloat-detection.patch"
 
 SRC_URI[md5sum] = "4a3d3123ccc7b9b21c1990fe074e3d14"
 SRC_URI[sha256sum] = "6cf4311ecbc1700e88f4382a31b3a7017c1572cd641fd06e653fc1692c2cffff"
-- 
1.7.10



