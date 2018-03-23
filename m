Return-Path: <hainsvdbosch@ziggo.nl>
Received: from smtpq3.mnd.mail.iss.as9143.net (smtpq3.mnd.mail.iss.as9143.net
	[212.54.34.166])
	by mail.openembedded.org (Postfix) with ESMTP id A6BC478898
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Mar 2018 07:54:31 +0000 (UTC)
Received: from [212.54.34.114] (helo=smtp6.mnd.mail.iss.as9143.net)
	by smtpq3.mnd.mail.iss.as9143.net with esmtp (Exim 4.86_2)
	(envelope-from <hainsvdbosch@ziggo.nl>) id 1ezHWz-0002CP-5N
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Mar 2018 08:54:33 +0100
Received: from 524978c1.cm-4-2b.dynamic.ziggo.nl ([82.73.120.193]
	helo=localhost.localdomain)
	by smtp6.mnd.mail.iss.as9143.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <hainsvdbosch@ziggo.nl>)
	id 1ezHWz-0007H9-2W; Fri, 23 Mar 2018 08:54:33 +0100
From: Hains van den Bosch <hainsvdbosch@ziggo.nl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Mar 2018 08:54:24 +0100
Message-Id: <20180323075424.7219-1-hainsvdbosch@ziggo.nl>
X-Mailer: git-send-email 2.15.1
X-SourceIP: 82.73.120.193
X-Authenticated-Sender: hainsvdbosch@ziggo.nl (via SMTP)
X-Ziggo-spambar: /
X-Ziggo-spamscore: 0.0
X-Ziggo-spamreport: CMAE Analysis: v=2.3 cv=HPnt6Llv c=1 sm=1 tr=0
	a=Q7YWMR2eS1SS1617XCK1UA==:17 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19
	a=v2DPQv5-lfwA:10 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8
	a=pGLkceISAAAA:8 a=I18q9gkwhqph5zSTPp4A:9 a=ZPHkQOs1zdIA:10
	a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22 none
X-Ziggo-Spam-Status: No
X-Spam-Status: No
X-Spam-Flag: No
Subject: [meta-oe][PATCH V2] iperf3: refresh patch
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
X-List-Received-Date: Fri, 23 Mar 2018 07:54:32 -0000

WARNING: iperf3-3.2-r0 do_patch:
Some of the context lines in patches were ignored. This can lead to incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
Applying patch 0001-include-stdint.h-for-various-std-c99-int-types.patch
patching file src/cjson.h
Hunk #1 succeeded at 28 with fuzz 2 (offset 5 lines).
patching file src/timer.h

Now at patch 0001-include-stdint.h-for-various-std-c99-int-types.patch
---

Patch for cjson.h already applied with version 3.2.

Signed-off-by: Hains van den Bosch <hainsvdbosch@ziggo.nl>
---
 ...-include-stdint.h-for-various-std-c99-int-types.patch | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/0001-include-stdint.h-for-various-std-c99-int-types.patch b/meta-oe/recipes-benchmark/iperf3/iperf3/0001-include-stdint.h-for-various-std-c99-int-types.patch
index ae3620800..599ee1dfb 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3/0001-include-stdint.h-for-various-std-c99-int-types.patch
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3/0001-include-stdint.h-for-various-std-c99-int-types.patch
@@ -5,23 +5,9 @@ Subject: [PATCH 1/2] include stdint.h for various std c99 int types
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- src/cjson.h | 2 ++
  src/timer.h | 1 +
- 2 files changed, 3 insertions(+)
+ 1 file changed, 1 insertions(+)
 
-diff --git a/src/cjson.h b/src/cjson.h
-index fb8cd3b..69cd272 100644
---- a/src/cjson.h
-+++ b/src/cjson.h
-@@ -23,6 +23,8 @@
- #ifndef cJSON__h
- #define cJSON__h
- 
-+#include <stdint.h>
-+
- #ifdef __cplusplus
- extern "C"
- {
 diff --git a/src/timer.h b/src/timer.h
 index 0f9c5eb..0b195be 100644
 --- a/src/timer.h
-- 
2.15.1


