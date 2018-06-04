Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 051AE74B83
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jun 2018 02:39:44 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id h12-v6so5257201pfk.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Jun 2018 19:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=1emZI6hF7hRrTeNzOitNMH+11t54NqvDGxhl+EBHD38=;
	b=asigujBUX8KKSrVthNEeDnZDRZ2eu6BZeKRXxWOn3N4ciencSSVOTpKqKLuS0ElcWd
	8p7rcNdJfJYQ1Z7mDZW0NNs/es5tQ8/wgdnI7sy8Y2Akx6hQ4gP60cDRJ8bs4ld/VsTX
	7zgXo9fnQo/KrCaHqgviQtSzIj1/27AkVAVuAQcy5AJlIcaX/7uxm70pozFROXoJnIAR
	YSx8xrDewiiXzBgTWcQxIdpff8QvDy1ZPxwjUFSbJH4l6c39PaoroMowR8A3cu7zGsuA
	2HWxkwyGld0V+z6UHWMraK/mjVAzY5vSXK9lJnPaAWLPxyTbhLQi64VNcRtN4gyVYatJ
	dMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=1emZI6hF7hRrTeNzOitNMH+11t54NqvDGxhl+EBHD38=;
	b=k2YIpyIrT8eenJiJbQMam4b3wNROeTVC8KJsuW/zdqL46YOHsUnCdDWjD9iXT95Ycp
	9ECAkeNVGUUnIfIZ6ND7ixRPyu5HbceVocRk1loq2SZgHMSlJoU4iXfmMFBMDQE6iVYA
	VxMQ0DgU35nkvEP7IDNRrI8x/YHh7YB0ZKT+oc1+UVJM3EcMdj15xZGiDIHF7C/Wi8Ec
	umDL6F7UMtxvYMXyRmRuLGPqmdPCHE+/WyXyKJObwODs1fmwQcRghz4/7RgVisFbV/97
	0AuoImS+tMril9dHu43y7bvnGus+NgEni391l0oq4GNY7NTkSTy5VtDHS7kAvkE1HgSl
	lWXQ==
X-Gm-Message-State: ALKqPwcZTJ8ngDVL+6yRjKi6+Cl36IDAHSdpSuBTSwB0Mk5knkWXiokC
	2EqmpIqR4e7Dfd1CVJaMq960bQ==
X-Google-Smtp-Source: ADUXVKJg0C3SzseF+/3owHGbpTv2pXpQlFT1hX/iiovtz8OWrTND3+dYhYKLGB/lqGvUPV8g05jDew==
X-Received: by 2002:a65:5284:: with SMTP id
	y4-v6mr15456103pgp.297.1528079986281; 
	Sun, 03 Jun 2018 19:39:46 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:f1bd:c539:22b:bbf1])
	by smtp.gmail.com with ESMTPSA id
	m11-v6sm12069697pfk.42.2018.06.03.19.39.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 03 Jun 2018 19:39:45 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sun,  3 Jun 2018 19:39:34 -0700
Message-Id: <d8ce5a7195f1210912c698a135492df1e073447e.1528079821.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1528079821.git.akuster808@gmail.com>
References: <cover.1528079821.git.akuster808@gmail.com>
Subject: [PATCH 4/6] wireshark: update to 2.2.10
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
X-List-Received-Date: Mon, 04 Jun 2018 02:39:45 -0000

The following vulnerabilities have been fixed:
     * [1]wnpa-sec-2017-42
       BT ATT dissector crash ([2]Bug 14049) [3]CVE-2017-15192
     * [4]wnpa-sec-2017-43
       MBIM dissector crash ([5]Bug 14056) [6]CVE-2017-15193
     * [7]wnpa-sec-2017-44
       DMP dissector crash ([8]Bug 14068) [9]CVE-2017-15191

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../wireshark/{wireshark_2.2.9.bb => wireshark_2.2.10.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.2.9.bb => wireshark_2.2.10.bb} (95%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.9.bb b/meta-networking/recipes-support/wireshark/wireshark_2.2.10.bb
similarity index 95%
rename from meta-networking/recipes-support/wireshark/wireshark_2.2.9.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.2.10.bb
index 82c25ff..5358ba0 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.2.9.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.10.bb
@@ -10,8 +10,8 @@ SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
 
 PE = "1"
 
-SRC_URI[md5sum] = "7d5e65efd0714bd6248aa5b36c28320d"
-SRC_URI[sha256sum] = "c8b32c0e7d44a277e737c53d9d142ad3fe4265338f25a7fd8c891f58a7633fc2"
+SRC_URI[md5sum] = "ae3a1a43a6e3687f44a738fd15d78021"
+SRC_URI[sha256sum] = "8574a5e1fdec7affae640924bd46c1aed1bd866e02632fa5625e1450e4a50707"
 
 inherit autotools pkgconfig perlnative
 
-- 
2.7.4


