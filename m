Received: from [151.189.21.57] (helo=mail-in-17.arcor-online.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <no2spam@nospam.arcornews.de>) id 1MFWcZ-0002wa-8D
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Jun 2009 19:02:23 +0200
Received: from mail-in-20-z2.arcor-online.net (mail-in-20-z2.arcor-online.net
	[151.189.8.85]) by mx.arcor.de (Postfix) with ESMTP id BC47A3B258F;
	Sat, 13 Jun 2009 18:52:19 +0200 (CEST)
Received: from mail-in-10.arcor-online.net (mail-in-10.arcor-online.net
	[151.189.21.50])
	by mail-in-20-z2.arcor-online.net (Postfix) with ESMTP id AA437107E0F; 
	Sat, 13 Jun 2009 18:52:19 +0200 (CEST)
Received: from localhost.localdomain (p3077-ipngn201marunouchi.tokyo.ocn.ne.jp
	[114.177.118.77]) (Authenticated sender: leggewie@arcor.de)
	by mail-in-10.arcor-online.net (Postfix) with ESMTPSA id 427E628EF35;
	Sat, 13 Jun 2009 18:52:17 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mail-in-10.arcor-online.net 427E628EF35
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 14 Jun 2009 01:52:08 +0900
Message-Id: <1244911928-18691-1-git-send-email-no2spam@nospam.arcornews.de>
X-Mailer: git-send-email 1.6.0.4
Cc: Rolf Leggewie <oe-devel@rolf.leggewie.biz>
Subject: [PATCH] siteinfo.bbclass: add support for via C3 host
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
X-List-Received-Date: Sat, 13 Jun 2009 17:02:23 -0000

From: Rolf Leggewie <oe-devel@rolf.leggewie.biz>

the bfin line is changed only for cosmetic reasons while we're at it.

Adding viac3-linux to siteinfo.bbclass is what helped me get past
the gfortran/gcc-cross issues on my Via C3 host (big thank you to
Phil Blundell for helping to fix this).

http://tinderbox.openembedded.net/builds/158350/
---
 classes/siteinfo.bbclass |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/classes/siteinfo.bbclass b/classes/siteinfo.bbclass
index 0221b12..e51d7ab 100644
--- a/classes/siteinfo.bbclass
+++ b/classes/siteinfo.bbclass
@@ -32,7 +32,7 @@ def get_siteinfo_list(d):
                "arm-linux-uclibc":        "endian-little bit-32 common-linux common-uclibc arm-common",\
                "arm-linux-uclibcgnueabi": "endian-little bit-32 common-linux common-uclibc arm-common arm-linux-uclibc",\
                "avr32-linux-uclibc":      "endian-big bit-32 common-linux common-uclibc avr32-common",\
-               "bfin-uclinux-uclibc":       "endian-little bit-32 common-uclibc bfin-common",\
+               "bfin-uclinux-uclibc":     "endian-little bit-32 common-uclibc bfin-common",\
                "i386-linux":              "endian-little bit-32 common-linux common-glibc ix86-common",\
                "i486-linux":              "endian-little bit-32 common-linux common-glibc ix86-common",\
                "i586-linux":              "endian-little bit-32 common-linux common-glibc ix86-common",\
@@ -64,6 +64,7 @@ def get_siteinfo_list(d):
                "sh4-linux":               "endian-little bit-32 common-linux common-glibc sh-common",\
                "sh4-linux-uclibc":        "endian-little bit-32 common-linux common-uclibc sh-common",\
                "sparc-linux":             "endian-big bit-32 common-linux common-glibc",\
+               "viac3-linux":             "endian-little bit-32 common-linux common-glibc ix86-common",\
                "x86_64-linux":            "endian-little bit-64 common-linux common-glibc",\
                "x86_64-linux-uclibc":     "endian-little bit-64 common-linux common-uclibc"}
        if target in targetinfo:
-- 
1.6.0.4



