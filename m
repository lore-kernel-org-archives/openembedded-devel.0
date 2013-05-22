Return-Path: <philip.balister@gmail.com>
Received: from mail-qe0-f53.google.com (mail-qe0-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id DADC86A34D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2013 11:31:03 +0000 (UTC)
Received: by mail-qe0-f53.google.com with SMTP id s14so1029642qeb.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2013 04:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=UETLgElV5RudvpwON0mqBLQGys3k2SxqYQodij63PrM=;
	b=hU58EzzZO1ZvVTEdYddP/S+WXnLh44bleBQzVDuHqR6SSc9qVpwDfOBIppVEiacB15
	oBwJXOMKYP674syd3/tw4gjq/fUPNfg+dx/EJ5tzwkk7s0qlafcg/L0tMFvSKE0hJL3O
	zHVVeQnQ31lo1C0T9eBi3Etp7I57bglJJFu688mWnW0nk0RIRJnH8CKlJGXaJU4/vzEN
	QB7gNNN6DWM9Cn/xKJnJcAguJuI1z4fVKfz1a/1Y6HqxhDmL2k56VntDQSXNH6c5V9Ch
	BR62+EZ30EKEyK4Y2OdmgW93nwvYsaiKMvNV2KGl9LZweps/zpmmU5NrIs2QDFVrfCoO
	7Tvg==
X-Received: by 10.229.165.9 with SMTP id g9mr2435526qcy.66.1369222264495;
	Wed, 22 May 2013 04:31:04 -0700 (PDT)
Received: from localhost.localdomain
	(pool-96-240-170-171.ronkva.east.verizon.net. [96.240.170.171])
	by mx.google.com with ESMTPSA id l13sm7418737qaj.9.2013.05.22.04.31.03
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 22 May 2013 04:31:03 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 May 2013 07:31:00 -0400
Message-Id: <1369222261-29852-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.7.11.7
Subject: [meta-oe][PATCH 1/2] uhd-firmware : Update to 3.5.3.
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
X-List-Received-Date: Wed, 22 May 2013 11:31:04 -0000

Signed-off-by: Philip Balister <philip@balister.org>
---
 .../{uhd-firmware_003.005.002.bb => uhd-firmware_003.005.003.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-connectivity/uhd/{uhd-firmware_003.005.002.bb => uhd-firmware_003.005.003.bb} (79%)

diff --git a/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.005.002.bb b/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.005.003.bb
similarity index 79%
rename from meta-oe/recipes-connectivity/uhd/uhd-firmware_003.005.002.bb
rename to meta-oe/recipes-connectivity/uhd/uhd-firmware_003.005.003.bb
index 3afae27..4369907 100644
--- a/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.005.002.bb
+++ b/meta-oe/recipes-connectivity/uhd/uhd-firmware_003.005.003.bb
@@ -4,13 +4,13 @@ HOMEPAGE = "http://www.ettus.com"
 PE = "1"
 
 LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://share/uhd/images/usrp_e100_fpga_v2.bin;md5=29260868c9484a37a7e6b61b29c57a4a"
+LIC_FILES_CHKSUM = "file://share/uhd/images/usrp_e100_fpga_v2.bin;md5=e86f2186823b264efc627aafc0ad60a2"
 
 inherit allarch
 
 SRC_URI = "http://files.ettus.com/binaries/uhd_stable/releases/uhd_${PV}-release/uhd-images_${PV}-release.tar.gz"
-SRC_URI[md5sum] = "2dbb7e2fb0c774e5ea2372bac25102e5"
-SRC_URI[sha256sum] = "217efa814fb031ad136bd3dcf89ca219dd6d7ee01aa7e65c56c56b77379117bd"
+SRC_URI[md5sum] = "65cf76fd363d576ceff9c1527ade297b"
+SRC_URI[sha256sum] = "9079586def30b6805053092673d942c0051f1f99eebc676b871f070c04b66e35"
 
 S = "${WORKDIR}/uhd-images_${PV}-release"
 
-- 
1.7.11.7


