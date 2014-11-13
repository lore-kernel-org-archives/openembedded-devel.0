Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4ECD260167
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Nov 2014 02:42:46 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id et14so3124936pad.14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Nov 2014 18:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=jiBke6HFD4d5WCRZpQYEJzLV/1kBVektTj3ZdN76QYY=;
	b=IQWOMOThmCwG+AaQgEBqPCx53Dp3bymwRV6+46PbRnnUfdY70SAIBcVv7Qg9APRArH
	u5k0lMnsunYsXiAQcfEi+I5VUCpx8m1CcB2Wl/kAvl35yBWtH4wi/mthBD6aNCO9uIv/
	wESB0AdF7sGqFQ+r+6OSt4lvysmFndbNfxEN77OR9HAAD0/AB+7pUzgCydbdC+krgD5s
	Zhhh8WNaN3OWzyq3hqRyMNNpdsVYdP4AJt3Qn/JchrCb9KG4E2DMmBOO4TA2eZOgQiP3
	6QmZ6oqXnsXVXRwY2X0avB1bJ9sJkFzIYShikYc68ezSRAKNpTi+X5Nfk5heRjfG69z8
	qZAw==
X-Received: by 10.67.15.174 with SMTP id fp14mr52622301pad.66.1415846567161;
	Wed, 12 Nov 2014 18:42:47 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id u8sm8533806pdr.10.2014.11.12.18.42.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 12 Nov 2014 18:42:45 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Nov 2014 18:42:42 -0800
Message-Id: <1415846562-9776-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][master][dizzy][PATCH] wireshark: update to 1.12.2
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
X-List-Received-Date: Thu, 13 Nov 2014 02:42:47 -0000

The following vulnerabilities have been fixed.
* wnpa-sec-2014-20
  SigComp UDVM buffer overflow. (Bug 10662)
  CVE-2014-8710
* wnpa-sec-2014-21
  AMQP crash. (Bug 10582)
  CVE-2014-8711
* wnpa-sec-2014-22
  NCP crashes. (Bug 10552, Bug 10628)
  CVE-2014-8712, CVE-2014-8713
* wnpa-sec-2014-23
  TN5250 infinite loops. (Bug 10596)
  CVE-2014-8714

Reference:
https://www.wireshark.org/docs/relnotes/wireshark-1.12.2.html

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_1.12.1.bb => wireshark_1.12.2.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_1.12.1.bb => wireshark_1.12.2.bb} (92%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.1.bb b/meta-networking/recipes-support/wireshark/wireshark_1.12.2.bb
similarity index 92%
rename from meta-networking/recipes-support/wireshark/wireshark_1.12.1.bb
rename to meta-networking/recipes-support/wireshark/wireshark_1.12.2.bb
index e198863..5740730 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_1.12.1.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_1.12.2.bb
@@ -13,8 +13,8 @@ SRC_URI = " \
 
 PE = "1"
 
-SRC_URI[md5sum] = "14b3e3d8979d1eb27ff085bb5f400e67"
-SRC_URI[sha256sum]= "82b26bd416ec15903b27785e35a622687008a743342054e96eaaeaa249be584b"
+SRC_URI[md5sum] = "2f2a16be8b087227cb17733c72288ae4"
+SRC_URI[sha256sum] = "30ae16b408a592642ce3a84dd9877d24df7a6dae8da4847486965190039df292"
 
 inherit autotools pkgconfig
 
-- 
1.9.1


