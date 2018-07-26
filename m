Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f47.google.com (mail-pl0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5211F78C2A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2018 15:10:45 +0000 (UTC)
Received: by mail-pl0-f47.google.com with SMTP id t17-v6so954954ply.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2018 08:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=RjmfXPtL2YnjpikfGs5ZDbvdBYXSFSNv5KN0+SakkbY=;
	b=XWrbT3kP90QrN1i7cbwmPMjXaZOR+C/MZVX3DjY2Nz+oKkQWGRkWIA3A9EDezFDYTj
	Bu3nIM6k6sZRx3cXY2m76Px5BFOTMYeIlL9RTjQKCjK9T4etAYD5AZHsLi3MGQeeniIR
	0yD9EHdLvgfsHw5/uHwX153BE5gVSOmI+XC2Q1cI/B3/8pls/E5mYLZmNi1YqCcMF+GS
	xXXKEVP/2tJITIB24367HVNMBxzWX+JB/mnJyQfBvUiahQPOcur9THN6xoEKAyi4GzGw
	AnxL9wIxZ0fJaPIm4ylYTnjW3LwIdKjvhbEULLiwwgzUK6viYmume+sz8l5YEpHg4bXE
	R+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=RjmfXPtL2YnjpikfGs5ZDbvdBYXSFSNv5KN0+SakkbY=;
	b=OHNCaeHIg5lQE9OyEMYpdZKyciPg/PB6jH7t+WRZYA/uXFNiaa6FzyTEf07qGbc9Hu
	mc9qqNfO3HgWC2HAleyO9fpRcUb8Nvc7e192mm6ZOxyWg5QUvDqq2jc4kMyqDcK8aV3S
	joExm5reA59QdkVPROegzChLXd0v/WGQ2SHFh0dbhkrxVc8LUk9DzT8PUd1gzHpfYyeZ
	kbr2tlYVfVyDKGPowr44WGrCvdRDBd8ey32bNYtslQVx/Yc9e59Ap23E+gciD7ce+L0h
	TkoWW3Dip/cczK5CkjW8iz6xmF4CzeJjgPC3vLX35DX+ws1IYyN9nb44OV4CCYPXdFcI
	qzvA==
X-Gm-Message-State: AOUpUlEc9BQx2VAZwz6GNMV35hbJzeZC9JdC3AAKibqpnix2PrhfYnYP
	OU0KzQcemIdGT8A3KPToA3w=
X-Google-Smtp-Source: AAOMgpd2DspD1G/wXDl/1PRynhII2aE+HpXOmn15xQpoPhDO2vMr7omt6oEcrLOk/wunaYDHJjTiRA==
X-Received: by 2002:a17:902:bd44:: with SMTP id
	b4-v6mr2392676plx.144.1532617847125; 
	Thu, 26 Jul 2018 08:10:47 -0700 (PDT)
Received: from pahoa2.kama-aina.net (c-67-181-203-136.hsd1.ca.comcast.net.
	[67.181.203.136]) by smtp.gmail.com with ESMTPSA id
	l84-v6sm3882855pfg.3.2018.07.26.08.10.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Jul 2018 08:10:46 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Thu, 26 Jul 2018 08:10:45 -0700
Message-Id: <20180726151045.19586-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] wireshark: update to 2.6.2
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
X-List-Received-Date: Thu, 26 Jul 2018 15:10:46 -0000

includes security fixes:

wnpa-sec-2018-34 BGP dissector large loop. Bug 13741. CVE-2018-14342.
wnpa-sec-2018-35 ISMP dissector crash. Bug 14672. CVE-2018-14344.
wnpa-sec-2018-36 Multiple dissectors could crash. Bug 14675. CVE-2018-14340.
wnpa-sec-2018-37 ASN.1 BER dissector crash. Bug 14682. CVE-2018-14343.
wnpa-sec-2018-38 MMSE dissector infinite loop. Bug 14738. CVE-2018-14339.
wnpa-sec-2018-39 DICOM dissector crash. Bug 14742. CVE-2018-14341.
wnpa-sec-2018-40 Bazaar dissector infinite loop. Bug 14841. CVE-2018-14368.
wnpa-sec-2018-41 HTTP2 dissector crash. Bug 14869. CVE-2018-14369.
wnpa-sec-2018-42 CoAP dissector crash. Bug 14966. CVE-2018-14367.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_2.6.1.bb => wireshark_2.6.2.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.6.1.bb => wireshark_2.6.2.bb} (95%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.6.1.bb b/meta-networking/recipes-support/wireshark/wireshark_2.6.2.bb
similarity index 95%
rename from meta-networking/recipes-support/wireshark/wireshark_2.6.1.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.6.2.bb
index 91c5e96bb0..4da0cecee4 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.6.1.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.6.2.bb
@@ -14,8 +14,8 @@ SRC_URI = "https://1.as.dl.wireshark.org/src/${BP}.tar.xz \
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[md5sum] = "b0e9e5fe22e96d9fdfad18f750fa8f55"
-SRC_URI[sha256sum] = "ab6e5bbc3464c956347b8671ce8397950ad5daff3bf9964c967d495f4ddbcd88"
+SRC_URI[md5sum] = "086d235509717190d06554b2ab870209"
+SRC_URI[sha256sum] = "49b2895ee3ba17ef9ef0aebfdc4d32a778e0f36ccadde184516557d5f3357094"
 
 PE = "1"
 
-- 
2.17.1


