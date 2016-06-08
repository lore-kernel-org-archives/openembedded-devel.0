Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id C34FF6E6B1
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jun 2016 07:45:07 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id ug1so14624pab.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jun 2016 00:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=YVfRNmSEjNCR5WG28eEuHoUnAUWlFHGRFtfOTDbjnoo=;
	b=hgjL//Cjc48dAgBdrByXV+1hd2ydvGZTQ2a9EueddxWNRZbbJbmfeeZB3eorScDwh1
	536AsgICTBKE5rpUc9ZHxR77hIoyrtQJabZrK5ByIguF1GxNWnOGdy3t0bp+k50dNJ0P
	/9IO1WgUFvK0kzjP12V2LnAbB347lzYkhcUrXXh2JFGTvQL2IzGDC32O8LhtivvLvLCf
	Raw8HtcsDYih7/Pq9MG2gEJUWIOQKz9qjTYY/83fME7ROORWOn5LLq/KgdDURz5XebwS
	+A0G9xOgF0AzckCfKfcEvHEFS7QMigMED3q1nZDk//uLV17NM5mIsf0kdLg1MlhHAeM6
	hzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=YVfRNmSEjNCR5WG28eEuHoUnAUWlFHGRFtfOTDbjnoo=;
	b=JWGsFhJn3TtIVNR7BBNqnRY+GujMO8GLVnB1Tn7ZAoKF2cewGqj8fS/lv5BE0i+ZZQ
	5S4hT1n1E5QRH2SBaFe2rLSg5DjMicv7oxUxhl/hVgNw2baf4sBxxjGIIAIt723L33sX
	8rOZFbQyQXwy5uO8XL97qz6CrJ/brNEr05yxsTp+7qNCNU045/tQ3yezBCgIhtrc2Db3
	MFgALQ8UQRTJpF/2T7G5lV5+QIpZh5yhpak0iYHSq798WeK9FQdhULKIWctgu6bkfMmm
	3BYoSkzaao24gjW4xpGOKQO6+goBDn5wD6XhUZamzOMDhp7W6zgl49/6do8SkuUdzDzX
	g9RQ==
X-Gm-Message-State: ALyK8tKaMUacy8rz3KpBSczlkDs1y++rJZ1Nvt8NqJTH3a5s4fyR4/9A9N7/VEoV7wqPSQ==
X-Received: by 10.66.43.232 with SMTP id z8mr4276968pal.17.1465371908011;
	Wed, 08 Jun 2016 00:45:08 -0700 (PDT)
Received: from akuster-ThinkPad-X240.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	m1sm31958177pab.46.2016.06.08.00.45.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Jun 2016 00:45:06 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Jun 2016 00:44:48 -0700
Message-Id: <1465371888-16368-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] wireshark: update to 2.0.4
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
X-List-Received-Date: Wed, 08 Jun 2016 07:45:10 -0000

The following vulnerabilities have been fixed:
     * [1]wnpa-sec-2016-29
       The SPOOLS dissector could go into an infinite loop. Discovered by
       the CESG.
     * [2]wnpa-sec-2016-30
       The IEEE 802.11 dissector could crash. ([3]Bug 11585)
     * [4]wnpa-sec-2016-31
       The IEEE 802.11 dissector could crash. Discovered by Mateusz
       Jurczyk. ([5]Bug 12175)
     * [6]wnpa-sec-2016-32
       The UMTS FP dissector could crash. ([7]Bug 12191)
     * [8]wnpa-sec-2016-33
       Some USB dissectors could crash. Discovered by Mateusz Jurczyk.
       ([9]Bug 12356)
     * [10]wnpa-sec-2016-34
       The Toshiba file parser could crash. Discovered by iDefense Labs.
       ([11]Bug 12394)
     * [12]wnpa-sec-2016-35
       The CoSine file parser could crash. Discovered by iDefense Labs.
       ([13]Bug 12395)
     * [14]wnpa-sec-2016-36
       The NetScreen file parser could crash. Discovered by iDefense Labs.
       ([15]Bug 12396)
     * [16]wnpa-sec-2016-37
       The Ethernet dissector could crash. ([17]Bug 12440)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_2.0.3.bb => wireshark_2.0.4.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.0.3.bb => wireshark_2.0.4.bb} (94%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.0.3.bb b/meta-networking/recipes-support/wireshark/wireshark_2.0.4.bb
similarity index 94%
rename from meta-networking/recipes-support/wireshark/wireshark_2.0.3.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.0.4.bb
index 76cb30a..8aec230 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.0.3.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.0.4.bb
@@ -8,8 +8,8 @@ DEPENDS = "perl-native pcre expat glib-2.0 sbc"
 
 SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
 
-SRC_URI[md5sum] = "62dc20f5a77542feed2e38f18db8ae3b"
-SRC_URI[sha256sum] = "e196376e75fe21fdef41b4eaa27ce2e1b2b561e7f7b20328a8e96657cc4465fc"
+SRC_URI[md5sum] = "622928dc6cb31c227c672ec3ec697f28"
+SRC_URI[sha256sum] = "9ea9c82da9942194ebc8fc5c951a02e6d179afa7472cb6d96ca76154510de1a5"
 
 PE = "1"
 
-- 
1.9.1


