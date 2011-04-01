Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5mSh-00033V-Ly
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Apr 2011 00:04:59 +0200
Received: by mail-iy0-f175.google.com with SMTP id 7so4322131iye.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2011 15:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=VcAT+SNHTdKGE50yGqHURHhSznRGKvYtpA+SMwZShIU=;
	b=e4ct3TwRX/LI/TihZ4P9W1icD5UT7tRzdNv1dBvq6MjQU7O+AcnX1+/3fni0udQMOt
	HNigizYNjwDFNH0YX3/e3m6oTvtmaOVWMaYFvA7K/xxi4KU6yFwbecyuIKV8+Vlqvho+
	ausmQ+lbQ4gSIu5lJ1VQAGqdGMe36t7mOKrQg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=j3XZlPUo2lh6gBs4ffrCAidyTE+1Y7CbI7G1+oR+tPFEHRtWjhnnSlzBlQvheInfyS
	ywTgpnzstRGi+wcA3VE1/etUU/+8idprz049MiFm1aHlRDscvC0hJ0883wHZ2NCMhyAK
	IEy2nurUZKZPM7Sv8FFDNxZkM48poMOTUq8zo=
Received: by 10.42.96.194 with SMTP id k2mr5429867icn.431.1301695380167;
	Fri, 01 Apr 2011 15:03:00 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id gy41sm1711131ibb.39.2011.04.01.15.02.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Apr 2011 15:02:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Apr 2011 15:02:50 -0700
Message-Id: <a7dbb15f74cadd7c7d8feeeee01564930f765744.1301695158.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301695158.git.raj.khem@gmail.com>
References: <cover.1301695158.git.raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/7] siteinfo.bbclass: Use linux-uclibceabi instead of uclibcgnueabi
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
X-List-Received-Date: Fri, 01 Apr 2011 22:04:59 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/classes/siteinfo.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/classes/siteinfo.bbclass b/meta-oe/classes/siteinfo.bbclass
index c0db539..f1db913 100644
--- a/meta-oe/classes/siteinfo.bbclass
+++ b/meta-oe/classes/siteinfo.bbclass
@@ -109,13 +109,13 @@ def get_siteinfo_list(d):
                "armeb-linux":             "endian-big bit-32 common-glibc arm-common",\
                "armeb-linux-gnueabi":     "endian-big bit-32 common-glibc arm-common armeb-linux",\
                "armeb-linux-uclibc":      "endian-big bit-32 common-uclibc arm-common",\
-               "armeb-linux-uclibcgnueabi": "endian-big bit-32 common-uclibc arm-common armeb-linux-uclibc",\
+               "armeb-linux-uclibceabi": "endian-big bit-32 common-uclibc arm-common armeb-linux-uclibc",\
                "arm-darwin":              "endian-little bit-32 common-darwin",\
                "arm-darwin8":              "endian-little bit-32 common-darwin",\
                "arm-linux":               "endian-little bit-32 common-glibc arm-common",\
                "arm-linux-gnueabi":       "endian-little bit-32 common-glibc arm-common arm-linux",\
                "arm-linux-uclibc":        "endian-little bit-32 common-uclibc arm-common",\
-               "arm-linux-uclibcgnueabi": "endian-little bit-32 common-uclibc arm-common arm-linux-uclibc",\
+               "arm-linux-uclibceabi": "endian-little bit-32 common-uclibc arm-common arm-linux-uclibc",\
                "avr32-linux":             "endian-big bit-32 common-glibc avr32-common",\ 
                "avr32-linux-uclibc":      "endian-big bit-32 common-uclibc avr32-common",\
                "bfin-uclinux-uclibc":       "endian-little bit-32 common-uclibc bfin-common",\
-- 
1.7.4.1



