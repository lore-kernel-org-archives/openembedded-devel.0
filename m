Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0EFD773306
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jun 2015 05:27:16 +0000 (UTC)
Received: by pdbnf5 with SMTP id nf5so58319682pdb.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2015 22:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=s4u6Iikz0qhCU1egrupQg6OOS7XWcWrYgGLaVT/rXZA=;
	b=IqDxqLhWaWL2wal8DcpnoaO+Ld3ca71TU0rM/tg6P7uF9vMwxO248/WKjZA+8Vls6Q
	C4pXoHbftvWz9eQ1ZLLlnIcjE8gVS8RfeXum1kCsKTZhZJrAr/bDyi9TX8MGb4UbHms+
	yOrxmw00zctYAFNItBotFz1oAzNWAoDB1D9ANpMnwPkRE3MHYYNrRmajgdLm5tumb6mc
	d3eDc1RC0discs8JDywMPsz+Z7E32QuweBSX+NFjc7vv4BTYQfUNy2GVN//bcr/JTqOn
	tKDztbpghrO0F6NBMWRS6IRjxR69fKnMuB+gibSJg2yOT/tG4bGcHapnsgHd9oI2/qpn
	E2tQ==
X-Received: by 10.68.204.133 with SMTP id ky5mr17788093pbc.67.1434605237342;
	Wed, 17 Jun 2015 22:27:17 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id oo3sm6618229pac.31.2015.06.17.22.27.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 17 Jun 2015 22:27:16 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Jun 2015 22:27:12 -0700
Message-Id: <1434605232-4375-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-networking][PATCH] wireshark: update to 1.12.6
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
X-List-Received-Date: Thu, 18 Jun 2015 05:27:19 -0000

include a security fixes but no CVE #

The following vulnerabilities have been fixed.
  * [1]wnpa-sec-2015-19
  WCCP dissector crash. ([2]Bug 11153)
  * [3]wnpa-sec-2015-20
  GSM DTAP dissector crash. ([4]Bug 11201)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_1.12.5.bb => wireshark_1.12.6.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_1.12.5.bb => wireshark_1.12.6.bb} (94%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.5.bb b/meta-networking/recipes-support/wireshark/wireshark_1.12.6.bb
similarity index 94%
rename from meta-networking/recipes-support/wireshark/wireshark_1.12.5.bb
rename to meta-networking/recipes-support/wireshark/wireshark_1.12.6.bb
index 32d0ab9..936ad62 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_1.12.5.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_1.12.6.bb
@@ -10,8 +10,8 @@ SRC_URI = "https://2.na.dl.wireshark.org/src/wireshark-${PV}.tar.bz2"
 
 PE = "1"
 
-SRC_URI[md5sum] = "9ee199dde4f36a3d71f7b81dd6764e93"
-SRC_URI[sha256sum] = "d0f177b2ef49e4deae4ff7d3299bdd295ba558a3934ce8ae489b2f13927cbd82"
+SRC_URI[md5sum] = "25ad2bc1c2a21396827c238fcff51bf3"
+SRC_URI[sha256sum] = "22ac0cc872f12cef9bb2cacfe0720eed8533dc5cea102d21de511620606cb3b6"
 
 inherit autotools pkgconfig
 
-- 
2.3.5


