Return-Path: <akuster808@gmail.com>
Received: from mail-qa0-f52.google.com (mail-qa0-f52.google.com
	[209.85.216.52])
	by mail.openembedded.org (Postfix) with ESMTP id 526AD609B2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Jan 2015 02:32:39 +0000 (UTC)
Received: by mail-qa0-f52.google.com with SMTP id x12so718523qac.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jan 2015 18:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=8Ze9NU86Y9vK6ysUZW4EiCsTo7oIoEPkgBh/VvdS/JU=;
	b=w4+UH6kXjfh4Fgs8h9PC8g6ME8YcH//xtNdnvwpMQYH82lhmIW/6wDL71AMiLxNTlj
	WibBFFJd9vH0BBmVLk4t8SHk6JOjn1G2+kFlR3SIKIUztZehkhXOxCAVHGdSIULhw3zY
	Sez8J9YJyhyLjpL88/ko8S3zRtTJoswNyL6hE4b76XDqe/L+hAE3e7gV7fCvomoARYuE
	1ellhFO/cIzhAO8RIyx5UBjUWF7bdNpv6JDRvdlA3ijT1hyLt9+MEn9Z73uZBu8X05eA
	XhSUJM9UW8ZQE80BfDfKkIbdgaGzYa8yWw+OIq2/q+py0hLIq+Fsg+44J9z/jtA0hl1r
	M8Bg==
X-Received: by 10.140.23.210 with SMTP id 76mr10141735qgp.84.1420684360672;
	Wed, 07 Jan 2015 18:32:40 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id a41sm2875173qgf.4.2015.01.07.18.32.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Jan 2015 18:32:39 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Jan 2015 18:32:36 -0800
Message-Id: <1420684356-27832-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] wireshark: update to 1.12.3
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
X-List-Received-Date: Thu, 08 Jan 2015 02:32:45 -0000

The following vulnerabilities have been fixed.
     * [1]wnpa-sec-2015-01
      The WCCP dissector could crash. ([2]Bug 10720, ws-buglink:10806)
      CVE-2015-0559, CVE-2015-0560

      * [3]wnpa-sec-2015-02
      The LPP dissector could crash. ([4]Bug 10773)
      CVE-2015-0561

      * [5]wnpa-sec-2015-03
      The DEC DNA Routing Protocol dissector could crash. ([6]Bug 10724)
      CVE-2015-0562

      * [7]wnpa-sec-2015-04
      The SMTP dissector could crash. ([8]Bug 10823)
      CVE-2015-0563

      * wnpa-sec-2015-05
       Wireshark could crash while decypting TLS/SSL sessions.
       Discovered by Noam Rathaus.
       CVE-2015-0564

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_1.12.2.bb => wireshark_1.12.3.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_1.12.2.bb => wireshark_1.12.3.bb} (92%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.2.bb b/meta-networking/recipes-support/wireshark/wireshark_1.12.3.bb
similarity index 92%
rename from meta-networking/recipes-support/wireshark/wireshark_1.12.2.bb
rename to meta-networking/recipes-support/wireshark/wireshark_1.12.3.bb
index 5740730..2dd99d6 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_1.12.2.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_1.12.3.bb
@@ -13,8 +13,8 @@ SRC_URI = " \
 
 PE = "1"
 
-SRC_URI[md5sum] = "2f2a16be8b087227cb17733c72288ae4"
-SRC_URI[sha256sum] = "30ae16b408a592642ce3a84dd9877d24df7a6dae8da4847486965190039df292"
+SRC_URI[md5sum] = "e6318b8451d4e56d39bd911da296ef19"
+SRC_URI[sha256sum] = "69950b9dcb1a630982b5f680554d73d27ee0dc856fc6aeef88c8d04eb5ac33ea"
 
 inherit autotools pkgconfig
 
-- 
1.9.1


