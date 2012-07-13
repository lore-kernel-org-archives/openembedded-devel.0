Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Spc6U-0006VU-CI
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 11:24:02 +0200
Received: by mail-ey0-f175.google.com with SMTP id l1so885914eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 02:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=0QK73AUhuHaHAyB4B1e+VqRJb1R8dsYMT5vfeoVfU6A=;
	b=o3JdPx+6toRDs4sSiyFR2Uq2fExnCcO20lDNkQZRpZ88rLVEl8YGCxzQ47ZD8Lu3AN
	mF166nnoHqbnRYiSG7Zs5LJXbG3vBgcD0/4dzI6BRDF2TbHHsrZBggmjVPRQVLMUYDzP
	5gz8Oe+fefS6Duky/xdsk4JWrxLwd94VgZagVCfW/Mgf1Sub7RP5d/4ATPQ73hiGotLg
	4xqvb3oggR5nJ55xteWuBZYaEW0H28NjiM9cgBjVaH546RQNGxMdTppMQNOB+t/ADpnF
	009ljsRbOMVxCnjfkxvFw1trbzgw/pgzQaixyCrtcDLgTlXgLd+dsa7JczZOOEVQvfCG
	+LXA==
Received: by 10.14.96.8 with SMTP id q8mr65242eef.203.1342170770317;
	Fri, 13 Jul 2012 02:12:50 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id z16sm23142039eef.16.2012.07.13.02.12.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 02:12:49 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 11:11:55 +0200
Message-Id: <1342170730-14982-9-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1342170730-14982-1-git-send-email-koen@dominion.thruhere.net>
References: <1342170730-14982-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlZ1dxyIYbB95kPGMNaOzP+CdnWQ5/ZTlrNUfH/tTYmt3r/NIHAzDszecqle2/NdhzVG8Ss
Cc: Koen Kooi <koen@dominion.thruhere.net>, eric@eukrea.com
Subject: [for-denzil][meta-oe 09/24] python-numpy: Fixed numpy dependencies.
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
X-List-Received-Date: Fri, 13 Jul 2012 09:24:02 -0000

From: Dan McDougall <daniel.mcdougall@liftoffsoftware.com>

Numpy was missing a number of dependencies in the .bb file without which it will
not work.

Signed-off-by: Dan McDougall <daniel.mcdougall@liftoffsoftware.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
index 36ab622..bae624e 100644
--- a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
+++ b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
@@ -24,3 +24,8 @@ do_compile_prepend() {
 
 SRC_URI[md5sum] = "5c7b5349dc3161763f7f366ceb96516b"
 SRC_URI[sha256sum] = "2e7bb84573e5123e07f3c919fd433bc09b78d606252b6b719e385c2a981d8e06"
+
+RDEPENDS_${PN} = "python-unittest \
+                  python-diffutils \
+                  python-pprint \
+                 "
-- 
1.7.10



