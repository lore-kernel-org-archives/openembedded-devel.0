Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5DF896086F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Apr 2018 14:09:28 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id c21-v6so10530433plz.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Apr 2018 07:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=wW4nB3ArOxkmMOvjC/E67gHfMfc+631FLHeudUPAcjY=;
	b=iVH8NE3AX1nUr45HA9gvhV7BVcsh9dc+KMDQFk32YQn7VRKJu0tBp5lwcdFXSo3LYN
	leYbmkYUIT9gVuinRWjAMgPcM315IDzmSko+RxYoSZUXBoEd59bV1xPROG8gl2RfG3HZ
	946BFcfw8vcobewcncF0nU18IyMdkkyBVpOHxyptytA+nRjYYDN+mfCbtXIyZGX2get4
	fCU/8dDa1SyIJLSZMkDdKqs51CnIWcAyJT92BSn5bVvHeVMWpQrd5xpn/5weU4J4spnz
	5dk1dry/JvSZ1O/UkiQc51LLn19Obl12Rgqbny1HGiQIW+TcZEPXyjU4ZeHWnCNOv08W
	68Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=wW4nB3ArOxkmMOvjC/E67gHfMfc+631FLHeudUPAcjY=;
	b=QaIHELQTBIr2hvqJ3e2rQdVcAup5vlVFMAUg0wICLsPlCZQgmGTKammT2XBkPLnPF1
	FKUsnNDr4HEt2tIMrFS4hty2QXt3+EVFu54BnVXRa4ADYanL9bN4XDyu2J6IOuRn29Pp
	jpf/6iVFRjeNIKydZT+zE9SPiCvofAi6RucF4a57sAJsd0bk3R88Eupu3n1oZUmTx+K+
	3wtBgEVkHbjnHKGvnnOoS/ljpedWipWfSML3gY61A+VNljx5S6N6sgRCztFRJFfQlN2r
	GJumr4rKPva/e+jZTU7iHQtH8/SXy7HrUnmniKnr9voJiUpjRYM3pCYo1DkzEA3UYN89
	Si/g==
X-Gm-Message-State: ALQs6tDugiOpCqVOMB0myIzSvBDlHYepOhuPk9ptuFIoc8EUlZKpaBkM
	2IFcr2MOt5K7mt8spDTaVZlwTw==
X-Google-Smtp-Source: AIpwx48/atECInNs96YuzubtY7JLA/n21bo/4PF1osRhBclSIQVF62bCVbyv8zPwZyK7cXHUYBtP8g==
X-Received: by 10.101.101.196 with SMTP id y4mr4534789pgv.129.1522850969934;
	Wed, 04 Apr 2018 07:09:29 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:a4f3:7c10:9123:63ea])
	by smtp.gmail.com with ESMTPSA id
	a22sm9634932pgw.10.2018.04.04.07.09.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 Apr 2018 07:09:28 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Wed,  4 Apr 2018 07:09:24 -0700
Message-Id: <1522850964-2056-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] wireshark: update to 2.4.6 and add upstream check
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
X-List-Received-Date: Wed, 04 Apr 2018 14:09:29 -0000

Security fixes:

   The following vulnerabilities have been fixed:
     * [1]wnpa-sec-2018-15
       The MP4 dissector could crash. ([2]Bug 13777)
     * [3]wnpa-sec-2018-16
       The ADB dissector could crash. ([4]Bug 14460)
     * [5]wnpa-sec-2018-17
       The IEEE 802.15.4 dissector could crash. ([6]Bug 14468)
     * [7]wnpa-sec-2018-18
       The NBAP dissector could crash. ([8]Bug 14471)
     * [9]wnpa-sec-2018-19
       The VLAN dissector could crash. ([10]Bug 14469)
     * [11]wnpa-sec-2018-20
       The LWAPP dissector could crash. ([12]Bug 14467)
     * [13]wnpa-sec-2018-21
       The TCP dissector could crash. ([14]Bug 14472)
     * [15]wnpa-sec-2018-22
       The CQL dissector could to into an infinite loop. ([16]Bug 14530)
     * [17]wnpa-sec-2018-23
       The Kerberos dissector could crash. ([18]Bug 14576)
     * [19]wnpa-sec-2018-24
       Multiple dissectors and other modules could leak memory. The TN3270
       ([20]Bug 14480), ISUP ([21]Bug 14481), LAPD ([22]Bug 14482), SMB2
       ([23]Bug 14483), GIOP ([24]Bug 14484), ASN.1 ([25]Bug 14485), MIME
       multipart ([26]Bug 14486), H.223 ([27]Bug 14487), and PCP ([28]Bug
       14488) dissectors were susceptible along with Wireshark and TShark

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_2.4.5.bb => wireshark_2.4.6.bb}           | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.4.5.bb => wireshark_2.4.6.bb} (92%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.4.5.bb b/meta-networking/recipes-support/wireshark/wireshark_2.4.6.bb
similarity index 92%
rename from meta-networking/recipes-support/wireshark/wireshark_2.4.5.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.4.6.bb
index e330b99..9a7978f 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.4.5.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.4.6.bb
@@ -9,8 +9,11 @@ DEPENDS = "pcre expat glib-2.0 glib-2.0-native libgcrypt libgpg-error"
 SRC_URI = "https://1.as.dl.wireshark.org/src/${BP}.tar.xz"
 SRC_URI += "file://libgcrypt.patch"
 
-SRC_URI[md5sum] = "2b6f1f37c72fa15a0a1863016a0abcc0"
-SRC_URI[sha256sum] = "b3b2ec29fba0f4a3a590438abe4054e56f19108d440fc2d61492db9d8ff16fd7"
+UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
+UPSTREAM_CHECK_REGEX = "wireshark-(?P<pver>2\.4(\.\d+)+)\.tar\.xz"
+
+SRC_URI[md5sum] = "8cfb73e286dd6427ca4405e6e802d13e"
+SRC_URI[sha256sum] = "8e965fd282bc0c09e7c4eba5f08a555d0ccf40a7d1544b939e01b90bc893d5fe"
 
 PE = "1"
 
-- 
2.7.4


