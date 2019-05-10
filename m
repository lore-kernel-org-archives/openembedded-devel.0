Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C397A6C1D5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 11:55:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 450pYc6Sjmz7k
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 May 2019 13:55:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557489317;
	bh=SAfd04/UVvDK0X66X4ArVMC48vEqZyA2V81QmvhDZuU=;
	h=From:To:Subject:Date:From;
	b=G/lG35pAwOCy/m/5l5i1ty7ewQaXQl/PHEadxqBVsfFN87FMYM6+3t5D/ASIXFB/n
	AloAZCTddaAs46Twzzd+pVk+Qcu9bkd6Y2+fCw+toB0T3vyMzrvR43nUyTDIrnkSTb
	1dmeq1KJuVNrjBfZOly7CiXTKAn9N7GWHfRFqBb0S2Cjl/3oa7j6B7EjIyUtvfE2Gb
	E3CMQNAQgjnG81eyRa/vI+dLYIdAAQhroIqSg7L0ATqTgejORZvtysb+PPq+xkPfAb
	7+Y4n7njQUe1vNeHzJjCXk2Vvb4SZiHqEKVvxHsMNOJ3yYQ86TzOs15pN7DgvmsDCG
	iixxHjfaCGZ9g4RduJ0Z8jguvtKVFVy6vGyifhXPMAtfpD3XHkJuOePCP1IRYALlJl
	tvJ21YDHDUZVtsj2pwAcfZhs+UWlRTIgBWU9Uol3TztnRzcia+jDgb+i5TcGApQtb/
	hGm3xIfPgJMS/KNWZ1RQBqU5wAxu9XOLyWb7jyjFr5e85hOHlwnP9Bxy3wp3/od7uu
	DgMRXumqwvCj5JmZf6h7yO0FpVfo2tS/dDEjTfHHAVBr1QjFdqluoLUcZrN564bHK7
	gOtGh939SJr8iY8B51thjI51YsDrEIHWOJryK4xZ+kel22C5Dhnz+aSg7E81KEIXue
	uGlPjINIwsAOa84Sx/ji6x6o=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 May 2019 14:54:58 +0300
Message-Id: <20190510115515.19491-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] rocksdb: Upgrade 5.18.2 -> 5.18.3
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
X-List-Received-Date: Fri, 10 May 2019 11:55:17 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
index 27c7b20e1..8d846197a 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.Apache;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.leveldb;md5=fb04ff57a14f308f2eed4a9b87d45837"
 
-SRCREV = "a1774dde9a5bd51bc6ece5988781c6f28cc69d48"
+SRCREV = "641fae60f63619ed5d0c9d9e4c4ea5a0ffa3e253"
 SRCBRANCH = "5.18.fb"
-PV = "5.18.2"
+PV = "5.18.3"
 
 SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH} \
            file://0001-Disable-Wshadow-and-do-not-mark-default-copy-constru.patch \
-- 
2.17.1


