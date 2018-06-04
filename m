Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f46.google.com (mail-pl0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id D2A8074D0C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jun 2018 02:39:46 +0000 (UTC)
Received: by mail-pl0-f46.google.com with SMTP id v24-v6so18730464plo.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Jun 2018 19:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=PpIdnmViOYFiCIeIIWKnO/l5Y1NlM6cql9nLBBxWUbs=;
	b=VpTUUiqG2OyBFKulryrvFi9nKKr2h/MFYhU5l2XeyrS85+BuQki0nk+Ode5LecN1pR
	xsJR0NWnUhQ4gQQB16+KowfNlBzjf9SofFGJm67AUwbTnDTwgtA5huodzVWdwoC2shOz
	aIf1C1UxJgbGqe9u9cvamwmFC728WE4cnwzxXmvsoTnKTYFiISR5bGj87j4FXL35DZDm
	VcuQWCh9mICSM5TFg9BVq0w8GgwOh6Vh+OxvwNX97jXSEks3RnmKK/eqZjZzYXvgHj63
	eFNHmtYGp8K5U208v22EYDgIixx96XnkmrZIMHO3k0wdyJAQ9yYFtzM5CCkBDiAizR/t
	0mUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=PpIdnmViOYFiCIeIIWKnO/l5Y1NlM6cql9nLBBxWUbs=;
	b=Pz8p4HUhuYcgMuQauk+yHW8rmJRd3O7+arIA3E/0avtGUhMLYsUpxWV70cZ6C/VCcW
	68jJxsLFFT0voM/au2/OFzsAmBAU8nSvHk08D3SGk0OAAMT9mDYL80sgJmIQXOxn4mTb
	2VjHtaXtFN4kJN9xzRvFtAwAMi0P5faiJgVGn+EyC8qbd9f9qqUEEhnJqVeZgo7i5PE7
	F9EnxBGX0t1crTF6ZFAON+yGWwGTNmzkPhNu9EUsJ4ijvR4t+LqboLd7cr6Rrn0uxyl2
	/cOsTRb7YLg5lD//dTxyVJWNFwLTt8xC3BT4RfR71n3tgd9VeZ4atE4gFoq1z8D9OkbH
	w1dA==
X-Gm-Message-State: ALKqPwc+6lRe2NlMk0hCaZwA+GgoSkRwg0keiCvgNb0O3TDZdCrXHpLI
	xV65yS5TYYhaOk5+pU33G5EgBQ==
X-Google-Smtp-Source: ADUXVKLKFraoc+j7Gy5gu+tSve9wG2IkY3k0j4lRlgrs8QBfSnxW2Eccd3mSV2KFHUI2rrYFdOxcEw==
X-Received: by 2002:a17:902:683:: with SMTP id
	3-v6mr20199570plh.291.1528079988029; 
	Sun, 03 Jun 2018 19:39:48 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:f1bd:c539:22b:bbf1])
	by smtp.gmail.com with ESMTPSA id
	m11-v6sm12069697pfk.42.2018.06.03.19.39.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 03 Jun 2018 19:39:47 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sun,  3 Jun 2018 19:39:36 -0700
Message-Id: <9eaebc6e783f1394bb5444326cd05a976b3122e9.1528079821.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1528079821.git.akuster808@gmail.com>
References: <cover.1528079821.git.akuster808@gmail.com>
Subject: [PATCH 6/6] wireshark: Update Package to 2.2.12
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
X-List-Received-Date: Mon, 04 Jun 2018 02:39:46 -0000

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


