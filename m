Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 124FB60190
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Feb 2018 01:31:21 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id f4so2450802plr.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Feb 2018 17:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=PpIdnmViOYFiCIeIIWKnO/l5Y1NlM6cql9nLBBxWUbs=;
	b=TfllFuJkEpN1by2Id6q96Q1wg2BAaJerhfjw/K/Nu5uhmNrlxHQ0Ax3QShhaFKXhqq
	ayvsy681Mn+fID4RiFF1Vaucw8QByl01uVLZd1Hdz0XpTIgXybJZIaIOF6YPXG770niP
	ZRLnqT3MzypPpZABYKQmUmgpukkEkk20NngPu4ytCtgoTNaHojDgRF9GQY1LRPqdOz20
	SBYRHr7Gx+DWLO2MA624bCgPEr6Vi8Kuuym+crWbudOsSB5qaAUadKVjFLN/tXhEhM2E
	dQu8ID9pd7cFPv0CxofLXL3OyxnsOm0ZfQpUKZKMdM0NEOr0bUgLWwLT+Q05XcEjUuKg
	OG6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=PpIdnmViOYFiCIeIIWKnO/l5Y1NlM6cql9nLBBxWUbs=;
	b=n+IdGJL99Oc4vBN1peBGeBEeRPWEocPbcKQJDzYL10j/O6KEG/D8KNqtdDQ1ZVsOQI
	OXDhnHdP76ctvlwN+DxLpKv9ENSa8A+KoLQ+NhcGTbVG0+kKgWYzNANG43a8qty+jslv
	15BccpkPzGR9YUwBO+SeRQneSGbftNho4JaFFuEMjArD7mQB7huZ9lZZBjuyP+QNj4yw
	T5UR1jyXzJqdh7hTS7DC2iu5823XBuMBlD2Ah409DWlotglf8LRzdxYgNSl9IwV6yLDa
	Yx2pS9GS2Q83Kh/kGNL41yeK1E3FTzsqBlyWEb6lPGEGgkVz5zCuVPi+DvAerWpOsRJT
	qrVA==
X-Gm-Message-State: APf1xPCI7vV6/ObB9zkwS+FgY5l4l5OwE8AWflhMh11uJIUcBSDOz1/M
	xvn3JdzpZjH5wXnsfV6m8xOxZA==
X-Google-Smtp-Source: AH8x224gzlFDiJsbP4654CaZkj6gaQhibRkXHe0JeJJp5C2EN3zQIAmpPH+CrBgqFzJ/mQ+05c47pw==
X-Received: by 2002:a17:902:2f43:: with SMTP id
	s61-v6mr4134469plb.235.1517967082922; 
	Tue, 06 Feb 2018 17:31:22 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com ([223.196.115.131])
	by smtp.gmail.com with ESMTPSA id p69sm524525pfk.7.2018.02.06.17.31.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Feb 2018 17:31:22 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Feb 2018 07:01:17 +0530
Message-Id: <1517967077-13584-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] wireshark: Update Package to 2.2.12
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
X-List-Received-Date: Wed, 07 Feb 2018 01:31:22 -0000

Includes:
	wnpa-sec-2018-01,  Multiple dissectors could crash. (Bug 14253) CVE-2018-5336

	wnpa-sec-2018-02, The MRDISC dissector could crash. (Bug 14299, Bug 13707) CVE-2017-17997

	wnpa-sec-2018-03, The IxVeriWave file parser could crash. (Bug 14297) CVE-2018-5334

	wnpa-sec-2018-04, The WCP dissector could crash. (Bug 14251) CVE-2018-5335

Full release notes: https://www.wireshark.org/docs/relnotes/wireshark-2.2.12.html

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_2.2.11.bb => wireshark_2.2.12.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.2.11.bb => wireshark_2.2.12.bb} (95%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.11.bb b/meta-networking/recipes-support/wireshark/wireshark_2.2.12.bb
similarity index 95%
rename from meta-networking/recipes-support/wireshark/wireshark_2.2.11.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.2.12.bb
index 5eb372e..6c0b644 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.2.11.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.12.bb
@@ -10,8 +10,8 @@ SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
 
 PE = "1"
 
-SRC_URI[md5sum] = "a79ba6cda83be2a91bde4110fe194788"
-SRC_URI[sha256sum] = "a9f11621e85d7e1d72259157edd94825e72af3fd72e184b8474459f92ad5fc40"
+SRC_URI[md5sum] = "ebf3d4230d7a13408758cdf037c42d66"
+SRC_URI[sha256sum] = "3274458d1bb1658a5001465ecb07c7cbfc709571ef36bd062897570d4bab3ebc"
 
 inherit autotools pkgconfig perlnative
 
-- 
2.7.4


