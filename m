Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 0444160144
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2015 22:20:45 +0000 (UTC)
Received: by pablj1 with SMTP id lj1so27849642pab.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Mar 2015 14:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=GPXVraq3+QXUB7Wn/5WUY0/VAg0JZd6n93/ay5pbKxg=;
	b=owDIlGHZ0CVEyFtCtdih84UruD3oqzJeLVGcvoFyCSxqM/kooX2avVLi6jZBz4NnaG
	PGQBAuTe74ZsapwGh3O7E9osu0QGtwRqtR99023cCATal1ltGd8xZWujkmavJEBKRwbK
	mKzmfxymE7J/npjmzc69d+UT88mXOmHmY+JdCCjK8ID1wzUc6ceeM6eBSYO6TzEobwwD
	/m5Oid1T4EAS3lsFr2UHYKOcdEBBogTbDSUTr1U6QvMQKGo32BxdndQcmWY3DKfIYkZh
	OWf1cbY+sx1Ie1AwINKbGeTfKTHXknA6tS96rEuNVu9nqCuVG2iml0dSrpQBXeCKlv1d
	RaHA==
X-Received: by 10.68.215.65 with SMTP id og1mr10320138pbc.79.1425507646919;
	Wed, 04 Mar 2015 14:20:46 -0800 (PST)
Received: from Pahoa2.mvista.com (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by mx.google.com with ESMTPSA id zc3sm4958095pbb.46.2015.03.04.14.20.45
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 Mar 2015 14:20:45 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2015 14:20:43 -0800
Message-Id: <1425507643-15027-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-networking][PATCH] wireshark: update to 12.4
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
X-List-Received-Date: Wed, 04 Mar 2015 22:20:54 -0000

From: Armin Kuster <akuster@mvista.com>

The following vulnerabilities have been fixed.
* [1]wnpa-sec-2015-06
    The ATN-CPDLC dissector could crash. ([2]Bug 9952) [3]CVE-2015-2187
* [4]wnpa-sec-2015-07
    The WCP dissector could crash. ([5]Bug 10844) [6]CVE-2015-2188
* [7]wnpa-sec-2015-08
    The pcapng file parser could crash. ([8]Bug 10895) [9]CVE-2015-2189
* [10]wnpa-sec-2015-09
    The LLDP dissector could crash. ([11]Bug 10983) [12]CVE-2015-2190
* [13]wnpa-sec-2015-10
    The TNEF dissector could go into an infinite loop. Discovered by
    Vlad Tsyrklevich. ([14]Bug 11023) [15]CVE-2015-2191
* [16]wnpa-sec-2015-11
    The SCSI OSD dissector could go into an infinite loop. Discovered
    by Vlad Tsyrklevich. ([17]Bug 11024) [18]CVE-2015-2192

For more information see
https://www.wireshark.org/docs/relnotes/wireshark-1.12.4.html

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../wireshark/{wireshark_1.12.3.bb => wireshark_1.12.4.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_1.12.3.bb => wireshark_1.12.4.bb} (93%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.3.bb b/meta-networking/recipes-support/wireshark/wireshark_1.12.4.bb
similarity index 93%
rename from meta-networking/recipes-support/wireshark/wireshark_1.12.3.bb
rename to meta-networking/recipes-support/wireshark/wireshark_1.12.4.bb
index f16d0f6..6833216 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_1.12.3.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_1.12.4.bb
@@ -13,8 +13,8 @@ SRC_URI = " \
 
 PE = "1"
 
-SRC_URI[md5sum] = "e6318b8451d4e56d39bd911da296ef19"
-SRC_URI[sha256sum] = "69950b9dcb1a630982b5f680554d73d27ee0dc856fc6aeef88c8d04eb5ac33ea"
+SRC_URI[md5sum] = "acfa156fd35cb66c867b1ace992e4b5b"
+SRC_URI[sha256sum] = "de804e98e252e4b795d28d6ac2d48d7f5aacd9b046ee44d44266983795ebc312"
 
 inherit autotools pkgconfig
 
-- 
1.9.1


