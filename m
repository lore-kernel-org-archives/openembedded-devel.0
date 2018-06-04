Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f49.google.com (mail-pl0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id A729E74D2F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jun 2018 02:49:02 +0000 (UTC)
Received: by mail-pl0-f49.google.com with SMTP id az12-v6so18738757plb.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Jun 2018 19:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=hRnC8J645Nr3pbmjolxHbLEyFh4t35FZ91UiOCDkgac=;
	b=FEOU8q1gyVz/bzn3CUYzZUwGnLRZjiDcnzHoUEXQ3InLPxponohkdL8Qfxo8dpC6MX
	hk+Y6H3i0ZI5LSkmDaHAZOT+8YN4AlOCC8z+kwlRsS6yAr7aNMOUPKfWltie94xn/adv
	6oBO6saR4xc1VPyGHD13CgNVOmsujmUkgDibrMoSwfcnhL3BUyaH/JchLVE3n5jEKPqL
	Aza2tRmqL1fatrb5lMbCZ1Jfwn3D2IhjAKP8Pb79PaQthlOtsj9gHYGjPQOImG3VJFAW
	YyLzvSZ6dc05tZMBaa2hzBIl9xHe4o9hgsYGlnBpEiMzIr9ubEsBiZTUcr/FqKzghgvV
	3yXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=hRnC8J645Nr3pbmjolxHbLEyFh4t35FZ91UiOCDkgac=;
	b=VujynSkNHX1+l7AAHakEYVDae+0RWTvTP+wjNPRlv+H4Q9qRfYfDUq15Crl/sI9tRP
	/iku4BjIThb1wY0YNOwjxSs/qYzbwmIHPy9F2HY5tcm+t/gBmPAr/7MjFzaRn5H9VujV
	C9QeAdet7jXIFTx70PPO7M383yVK4UUEHvepj0x675wdf5lY4hobkRcLMBSa4bOhsCzn
	6XMB3poitbWrejvuk9XCkZ6invWQxMw1QSf73i6/Sn2P6xgATTeyQ1SUbwwBb8i2hHhR
	VOZa/G+oPFPoHM3P8Gy1+EcY6ueZiTM7DsmkhZ1LSD7q7OKEj9a9ixp3AzJH4xjA4iZf
	wtdA==
X-Gm-Message-State: ALKqPwcn1+xIWw9qwxzmg8InuWgUS7YWZkbEKa3lVDQL88ZJORiiWw3P
	N6UQceJySD3hfFoNY8XXPdyldg==
X-Google-Smtp-Source: ADUXVKJf8HVT8N43f8aUwSTwHn4Dw2pjkk4qVVvMnftXmKBqytoz6QutTOzmSps8tYBBsobEixoCPw==
X-Received: by 2002:a17:902:8:: with SMTP id
	8-v6mr19773935pla.287.1528080543951; 
	Sun, 03 Jun 2018 19:49:03 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:f1bd:c539:22b:bbf1])
	by smtp.gmail.com with ESMTPSA id
	o10-v6sm62844021pgc.80.2018.06.03.19.49.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 03 Jun 2018 19:49:03 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sun,  3 Jun 2018 19:48:42 -0700
Message-Id: <b400424d90fc9215631e0d6fe80727138e3c3046.1528080420.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1528080420.git.akuster808@gmail.com>
References: <cover.1528080420.git.akuster808@gmail.com>
Subject: [morty 08/15] wireshark: update to 2.2.6
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
X-List-Received-Date: Mon, 04 Jun 2018 02:49:02 -0000

From: Armin Kuster <akuster@mvista.com>

The following vulnerabilities have been fixed:
* [1]wnpa-sec-2017-12
  IMAP dissector crash ([2]Bug 13466) [3]CVE-2017-7703
* [4]wnpa-sec-2017-13
  WBMXL dissector infinite loop ([5]Bug 13477) [6]CVE-2017-7702
* [7]wnpa-sec-2017-14
  NetScaler file parser infinite loop ([8]Bug 13478) [9]CVE-2017-7700
* [10]wnpa-sec-2017-15
  RPCoRDMA dissector infinite loop ([11]Bug 13558) [12]CVE-2017-7705
* [13]wnpa-sec-2017-16
  BGP dissector infinite loop ([14]Bug 13557) [15]CVE-2017-7701
* [16]wnpa-sec-2017-17
  DOF dissector infinite loop ([17]Bug 13453) [18]CVE-2017-7704
* [19]wnpa-sec-2017-18
  PacketBB dissector crash ([20]Bug 13559)
* [21]wnpa-sec-2017-19
  SLSK dissector long loop ([22]Bug 13576)
* [23]wnpa-sec-2017-20
  SIGCOMP dissector infinite loop ([24]Bug 13578)
* [25]wnpa-sec-2017-21
  WSP dissector infinite loop ([26]Bug 13581)

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_2.2.5.bb => wireshark_2.2.6.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.2.5.bb => wireshark_2.2.6.bb} (95%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.5.bb b/meta-networking/recipes-support/wireshark/wireshark_2.2.6.bb
similarity index 95%
rename from meta-networking/recipes-support/wireshark/wireshark_2.2.5.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.2.6.bb
index 03ae3b9..a0b6b8f 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.2.5.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.6.bb
@@ -10,8 +10,8 @@ SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
 
 PE = "1"
 
-SRC_URI[md5sum] = "749e7ca7606ae7df5c1ca8c62f93ff31"
-SRC_URI[sha256sum] = "75dd88d3d6336559e5b0b72077d8a772a988197d571f00029986225fef609ac8"
+SRC_URI[md5sum] = "2cd9a35c2df8c32668c1776784f074df"
+SRC_URI[sha256sum] = "f627d51eda85f5ae5f5c8c9fc1f6539ffc2a270dd7500dc7f67490a8534ca849"
 
 inherit autotools pkgconfig perlnative
 
-- 
2.7.4


