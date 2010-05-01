Received: from mail.codelabs.ch ([217.150.249.120] helo=fenrir.codelabs.ch)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ken@codelabs.ch>) id 1O8K2k-0001wo-77
	for openembedded-devel@lists.openembedded.org;
	Sat, 01 May 2010 23:16:12 +0200
X-Virus-Scanned: by codelabs.ch
Received: from localhost.localdomain (244-43-239-77-pool.cable.fcom.ch
	[77.239.43.244])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by fenrir.codelabs.ch (Postfix) with ESMTPSA id DB56E62C6F;
	Sat,  1 May 2010 23:05:20 +0200 (CEST)
From: Adrian-Ken Rueegsegger <ken@codelabs.ch>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 May 2010 23:12:17 +0200
Message-Id: <1272748338-23051-1-git-send-email-ken@codelabs.ch>
X-SA-Exim-Connect-IP: 217.150.249.120
X-SA-Exim-Mail-From: ken@codelabs.ch
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] tzcode: update tzdata to latest version (2010i).
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
X-List-Received-Date: Sat, 01 May 2010 21:16:12 -0000

Signed-off-by: Adrian-Ken Rueegsegger <ken@codelabs.ch>
---
 recipes/tzcode/tzcode-native_2010f.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes/tzcode/tzcode-native_2010f.bb b/recipes/tzcode/tzcode-native_2010f.bb
index f2fbffd..8585de2 100644
--- a/recipes/tzcode/tzcode-native_2010f.bb
+++ b/recipes/tzcode/tzcode-native_2010f.bb
@@ -6,11 +6,11 @@ require tzcode-native.inc
 # Also, tzdata (and it is needed to build tzcode) version can differ from
 # tzcode version, thus this variable
 
-TZDATA_PV = "2010h"
+TZDATA_PV = "2010i"
 
 SRC_URI[tzcode-2010f.md5sum] = "e530cc9bbdfd5e8c1eac21a68f4d5656"
 SRC_URI[tzcode-2010f.sha256sum] = "651d866c91ada925b4ac9491e69ebd5c355c46b2c01dd1741b5e6a609d93eb1e"
-SRC_URI[tzdata-2010h.md5sum] = "d384ac091e6d56802f9b3e6b3d3f0f2e"
-SRC_URI[tzdata-2010h.sha256sum] = "a4918d60f63440ba9b6050205881e8a98d718dc0c2b7df5955f43e781eab6e7d"
+SRC_URI[tzdata-2010i.md5sum] = "4d2a90afd5bffe8df97f3def245e178e"
+SRC_URI[tzdata-2010i.sha256sum] = "bee0a26cca54db3413416d968c0a6361d83188b112d2512559d0e3602f254dc3"
 
 PR = "${INC_PR}.2"
-- 
1.7.0.2



