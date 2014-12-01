Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id C138F722EB
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Dec 2014 01:04:49 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id ft15so9737073pdb.36
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Nov 2014 17:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=B2z8ehP1N0L1/7T4kmy2Q8i3B7dYfII1djvYcuHWgWc=;
	b=vgob4Cc/9TGsD29HO6ogLQNqYYBqvvTNyyyNXWj5kyT5zn+KugeL8IJj4R7ljaRAg7
	pFd9c2ZVcgOYAZEvc4bsa3Lubt6aMZxwgL46fFXLzarPrPcas1h4HrxL1olfDtG1NeKZ
	SNIbXZUcN7tJWBj8DqS6tJRPl2vJpApwibFLTTaWjSYyaUqeBmyYsylYe8KjqtXt7/93
	AuGDY0ZN0UmBuISQ9zwEfKhVqdh8fa/StMezwF+Nj2/ptzZ/RZd99RGo5//IaKlyATwv
	8BjrH+3M/xsXU8cmEV7A4GD2YnUaZf+MK1pnJmuUTNcHFAKQTLHdA1ubN+P/+U0Qir2X
	Wskg==
X-Received: by 10.68.202.1 with SMTP id ke1mr95072019pbc.139.1417395890672;
	Sun, 30 Nov 2014 17:04:50 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id v7sm11872248pdl.5.2014.11.30.17.04.48
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 30 Nov 2014 17:04:49 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 30 Nov 2014 17:04:16 -0800
Message-Id: <d2ee6870809bfbabd48cfda38f844a59ca91588c.1417194166.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1417194166.git.akuster808@gmail.com>
References: <cover.1417194166.git.akuster808@gmail.com>
In-Reply-To: <cover.1417194166.git.akuster808@gmail.com>
References: <cover.1417194166.git.akuster808@gmail.com>
Cc: otavio@ossystems.com.br
Subject: [PATCH 14/15] wireshark: update to 1.12.2
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
X-List-Received-Date: Mon, 01 Dec 2014 01:04:50 -0000

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
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
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


