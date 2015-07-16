Return-Path: <dominic.sacre@gmx.de>
X-Greylist: delayed 309 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 16 Jul 2015 12:52:00 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	by mail.openembedded.org (Postfix) with ESMTP id 5934D6E648
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jul 2015 12:52:00 +0000 (UTC)
Received: from dastp.fritz.box ([79.253.171.134]) by mail.gmx.com (mrgmx101)
	with ESMTPSA (Nemesis) id 0La3c1-1YYNNu04NB-00llm7;
	Thu, 16 Jul 2015 14:46:51 +0200
From: =?UTF-8?q?Dominic=20Sacr=C3=A9?= <dominic.sacre@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Jul 2015 14:45:52 +0200
Message-Id: <1437050752-12663-1-git-send-email-dominic.sacre@gmx.de>
X-Mailer: git-send-email 2.4.5
MIME-Version: 1.0
X-Provags-ID: V03:K0:ddCRmUwdmetDbspxTwo0MW6jjpp9EoANoeS0v7b2b4lQOd0tE7D
	4WLBj+PP+ruRVSuE2pSfZn8I8J87klTFTJqKVF0MunhTY9moi7EVkhdDKQaC472DrjeXhTW
	zg6+5VNtwROx12IRAabEuOPvoAArTIvTPM5vyXugwQA6tQOE7SybaOsATWJyjM5qkolV5eM
	wLyJy61jc26Wri+4dbZBA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:MioYnSJ2Igk=:6QgrgHyCEA3+NMMjesGcSN
	zDaSFTFdAforzW1tUQOS7khQclbGlFJFmotAIBfmzrhR/MYXKI51QQfo+kcRbaKa8UHUoW2Iy
	Fgbd+hpc75b8mbqy1z4tfELoxhmVIW2OmhWGP6jqYU9AJgQwXqiYIrnPRGw75MSjimsEuXH1k
	FMv9QBKtXmbNFRU6djubt5r/qoDSRHtI9OzptorYrIWHepU604zB/segkxwJkBPWbYfiAlb6+
	PKD5RhKZgTXWW1hYQJmrCHnXwR1oQcFeZNfZ/fnZUiFJwrimtJJ630Vy6LNY0KWUh7Pe3mD9Y
	qMjFDUrDrjDGzGcJkestsP5TtXU1DBV8tf7j5mgL/Xd1i0D4kTXVqJNgGcem5cNyxOicxb0fH
	GMZjVh3ax9JwVlec7b+ScQTeVs7bcKZoswZPbH4Bomqkk4vG+2B87HNwJpwsDU5pfcmGJat8b
	FvP0tU4YAomT+YC4QGo9Vo/0QxkXr1gEN9RewcL1G0Qw8W5XdbPX4MEyeZPz5YT3m4iOnA/HE
	4FXCrvOfMa6NNWBjFmQ7cSKgiVbZs12Rl8PZBvxpNFCmBefNzdxUHENUG2HkZruVsMTaEM59x
	ftni9NeCxw9qNW7zYILTU2CxC4ORk8B/gPfG3+k+z1VSfGIgPd9nvXM7uBKS+glrgRRclOodE
	ONT9jGjRvrmC2b85l+9k/0nH7JBwR/q2vG/6pLF6V7/g9Tsi4V6BKL66jyICC7THHgLk=
Subject: [meta-oe][PATCH] fio: Add PACKAGECONFIG for numa, re-enable ARM build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Jul 2015 12:52:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Make fio's NUMA support optional via PACKAGECONFIG.
Enable this feature by default, except on ARM where libnuma/numactl
is not available.

Signed-off-by: Dominic Sacré <dominic.sacre@gmx.de>
---
 meta-oe/recipes-benchmark/fio/fio_2.2.6.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb b/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
index 82f9cd4..1255441 100644
--- a/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
@@ -10,10 +10,13 @@ SECTION = "console/tests"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 
-DEPENDS = "libaio zlib numactl"
+DEPENDS = "libaio zlib"
+
+PACKAGECONFIG ??= "numa"
+PACKAGECONFIG[numa] = ",--disable-numa,numactl"
 
 # ARM does not currently support NUMA
-COMPATIBLE_HOST = "^((?!arm).*)$"
+PACKAGECONFIG_remove_arm = "numa"
 
 # rev for v2.2.6
 SRCREV = "f52c9691bc8c285f3445235c69acdfd6de7f9b82"
-- 
2.4.5


