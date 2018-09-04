Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6CE2074E47
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Sep 2018 18:58:10 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id j8-v6so2142694pff.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Sep 2018 11:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EP038BUwZJge9xkeBp8ktEl22RVsPIlFhwVpYYu04Mo=;
	b=Mey9qr2gp2aQblP4fVyXx0UKgjfhZTnRxkVjhO4kKUtI+9hlztJVzRRroQw/VA3x6J
	xOiy7+fzFIMGSOeOLDE22o3j4rJhd+ReA5p0NWA83cs4RVu3bow/NlaPmQa0z2cbpDgh
	4N1He36m4rT/5MxO9AQ1dqj/qCIbaCgwWsp6f/uaZF8rMYMPhV6bofqfcenZh3PqYf9p
	n4z5DUUf0ZI4h3BuBjGiYpwzjEnlklLv+Pi5m8emQA6yw6bGhdxCh/UOIbqPeyiA5lpK
	qWEsCXWgk4JP1nTjOOtYqDxc7lFrozeleZLD/zbW8YgeRw7S/GUI34ve7ea2LhR1tVUY
	DFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=EP038BUwZJge9xkeBp8ktEl22RVsPIlFhwVpYYu04Mo=;
	b=DtRF3HpnD62ZJTqpBzgumNRwtxYrV29d4sD1F1ZJHEEFGipptE4EPME30e2NEOD8qK
	EEwhsLVvF4dxVqVkemCgdHAlPHFWIRfDWsJKtc7cofsCuxAiX1pvZzgoneah9uRstz7x
	NBkXmE5npgSoUB/kSMviysz941w1y+VKVYiA7RgbqQp2EJknEvxW8hEUCInFN4t5HDy4
	AEYPR5NGdmFvkYuaN5LyvIBz0Q9dCAeOAFlpmpXjAch45UeAtJZBWIf92ctPhmHIuiJT
	6LojblvSFVNlub/VPXv9rlXQ0uOq9NBdRD78t9R115j3x6chB47Rg238HXdgQu3rF0YX
	G++w==
X-Gm-Message-State: APzg51AZNdCTxxFLV2E+68syTdZhAecyR5Lah8mHBPJUIO/M97HhWbYr
	ZVVD7rXlZMAZJY9snwOWmV4w4SiI
X-Google-Smtp-Source: ANB0VdZrypSoX17+91i71yT34ZPIP64tGVY8stbHAxvgarYmmzNvRiQEQWMg9w4xxJh+ST7BZNLKOg==
X-Received: by 2002:a63:d20e:: with SMTP id
	a14-v6mr30038956pgg.226.1536087491168; 
	Tue, 04 Sep 2018 11:58:11 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	v7-v6sm33722784pgh.57.2018.09.04.11.58.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Sep 2018 11:58:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Sep 2018 11:57:50 -0700
Message-Id: <20180904185750.23747-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180904185750.23747-1-raj.khem@gmail.com>
References: <20180904185750.23747-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 6/6] liboauth: Depend on openssl10
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
X-List-Received-Date: Tue, 04 Sep 2018 18:58:10 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb b/meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb
index 3311da5a8f..6f3787ca82 100644
--- a/meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb
+++ b/meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT|GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING.MIT;md5=6266718a5241c045c8099d9be48817df \
                     file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
 SECTION = "libs"
-DEPENDS = "curl openssl"
+DEPENDS = "curl openssl10"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BP}.tar.gz"
 SRC_URI[md5sum] = "689b46c2b3ab1a39735ac33f714c4f7f"
-- 
2.18.0


