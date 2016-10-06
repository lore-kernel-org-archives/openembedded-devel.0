Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id DD77A71A98
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Oct 2016 00:33:37 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id qn10so192992pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Oct 2016 17:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=/z+DjwjXA1/VXmtFinuVkVTWo+YhqjmDin4ukmYs14E=;
	b=PD6nwMCVD41/X7HkoBDs1EmYpS2MtDuEr1CRon2makg3v2CnqPEzQYm+dsbO49GCOJ
	IVZnI+ZMpq1GkQRIpNBLHUOFj4KKVcq4l6te38uFDdSpiR6wfMOKtvHH78IqfehEzKgB
	FUCQDWyxQMvoQatdYo8k5HnbFocyPnWu9OrNRX/yB86rVfqqWU9C8qCOHyUZpowh5/6v
	pGRMRLGR5PWnESJt9jNvb/eogImu3E321wkfAPz+kbZPdhyedah8s9K0wMdICcxe+Alp
	2CBylp2uRSJM0Qb0NwrVl4hR149EFXQy5u5FubVAkiYLh34WhE32BxHsRJq4K441oiuC
	mb4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=/z+DjwjXA1/VXmtFinuVkVTWo+YhqjmDin4ukmYs14E=;
	b=I5sn6T7fjdVYxO2VyFdrj5vBUvTnqHe0TiGF7BcwSLxtSJfsmjAQeTssF0EQQ1nwWt
	EUAxKECu6uwVYnyK6mQTl+jAECjAGQvE8D/Ire9SfE7wz4Qhi/HmArRDEDERyQvwKuYe
	+o7aYzgpTo87sR6AClT6JsfvSESXpJebBHSCMvQe0hyUIr2cTE9r1lmYDBTp6P7WaI3m
	WWKS1YUTSFIYZk2jH3l1w0jaE46FcsLZOqSE4SUuBC2bhg0QkhMH0/o7pvdgONlfzG/5
	LMHXwDRcfPcJqdfavdlM0Ic3RCUpEwKSetG7njolK23xEimxU1QdxJVjCKH77XcIn0cs
	elvQ==
X-Gm-Message-State: AA6/9RmWdv1n0DYe90PtH8U7h7+YK8DW/9BwU5El42cg8xXMBrVSGzmtt9J6/gVjNoXAyw==
X-Received: by 10.66.21.231 with SMTP id y7mr14269933pae.156.1475714018923;
	Wed, 05 Oct 2016 17:33:38 -0700 (PDT)
Received: from akuster-ThinkPad-X240.mvista.com
	(50-233-148-156-static.hfc.comcastbusiness.net. [50.233.148.156])
	by smtp.gmail.com with ESMTPSA id n85sm120595pfb.31.2016.10.05.17.33.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 05 Oct 2016 17:33:38 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Oct 2016 17:33:37 -0700
Message-Id: <1475714017-9205-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] wireshark: update to 2.2.1
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
X-List-Received-Date: Thu, 06 Oct 2016 00:33:39 -0000

Restore PE

includes 2 security fixes:
wnpa-sec-2016-57. NCP dissector crash. Fixed in 2.2.1.
wnpa-sec-2016-56. Bluetooth L2CAP dissector crash. Fixed in 2.2.1.

see https://www.wireshark.org/docs/relnotes/wireshark-2.2.1.html

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_2.2.0.bb => wireshark_2.2.1.bb}             | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.2.0.bb => wireshark_2.2.1.bb} (93%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.0.bb b/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb
similarity index 93%
rename from meta-networking/recipes-support/wireshark/wireshark_2.2.0.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb
index dca3be6..a5fb7f6 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.2.0.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.1.bb
@@ -8,8 +8,9 @@ DEPENDS = "pcre expat glib-2.0 sbc"
 
 SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "c7de0997f74934f25b456846cf75cb81"
-SRC_URI[sha256sum] = "a6847e741efcba6cb9d92d464d4219917bee3ad0b8f5b0f80d4388ad2f3f1104"
+PE = "1"
+SRC_URI[md5sum] = "49a1023a69ac108ca089d750eee50e37"
+SRC_URI[sha256sum] = "900e22af04c8b35e0d02a25a360ab1fb7cfe5ac18fc48a9afd75a7103e569149"
 
 inherit autotools pkgconfig perlnative
 
-- 
2.7.4


