Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id AC8F778F0B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 17:48:09 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id v66-v6so7752736pgb.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 10:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=s8iGnGCAwlj3q5H25xyr/kRmV+OtRnuG183FmXbPBA8=;
	b=dHYqmVqzPh92dE5V81PEch0r5IbS34jruzr0hunkL5BL6cUTveigwwtGg/yVcDmvY0
	oWjLwTcxTFpRhwlzyGIJUq8cCkm8yPczBDVsGdJ8ubHKx5TW8oXiLCmGbHQqBM7/LKgL
	eOfBFqQYE0QGNVwcmORNidR/xjKgyydtgpWZV6a9xgyRav43uB1ZkHHQJLnDNOj8EFK4
	2IbjZbeaY0AWl4sLtqkHPJKvZaWcP+2UQNBrmqRhEyg6Zu1JHNSlmljtgXeokgV85wyH
	UKJQbEexnML3gkJPIKW4bd+jfthQmywQ0Fn8TgQxj5tqjboiRr8lj5uffeuRm2yzLlH4
	Mwwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=s8iGnGCAwlj3q5H25xyr/kRmV+OtRnuG183FmXbPBA8=;
	b=ZRFpylzgnx7qaAf1AEyrWe4AcOAxTXufJeyh3zgxGnBu8qHCag8/fT0IAoBbIxqGCn
	Xxqnob/BaGFa5MHbz/SpLbVDwWZvEXee/SOYwmLcv6r0fI3NqyTbKlzIjReJBdCSEyvo
	VqDt02SHInY9Wn6i2iHvBT9RaCdhHx3G3CBqRA99QQ+dqvLc1K4v58R2njkT7NYIOpeR
	pvTIFkF+JLy1JTPkymAVmkEfrbHf9Bv9JnrSpVOqjEt00pyw/0n5hB8mkpDTNQOCGmo0
	oxxrjh/U2yx98bhpfrUUwy/H/r3ZUCFtvtWU976otHwIADqklOB2bdUvKNZDqWJQ78wa
	W26A==
X-Gm-Message-State: APzg51DSNM++z5rk6pNvm7BnTDCXTreNGI9IeAP9apYXjj2fcEDt5nIu
	Hvgbm7+ul+ro3QGl2aU3xaH5EDq7
X-Google-Smtp-Source: ANB0VdbXBHijniVO9tnesFNJiwlKQUehaj8JZLPBsevvK2GnwOC6EkVpdcB2fkKsUEmPjX2rrpGJ5Q==
X-Received: by 2002:a63:3e8b:: with SMTP id
	l133-v6mr12786270pga.355.1535392090727; 
	Mon, 27 Aug 2018 10:48:10 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f180])
	by smtp.gmail.com with ESMTPSA id
	u43-v6sm24454446pgn.81.2018.08.27.10.48.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Aug 2018 10:48:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Aug 2018 10:47:57 -0700
Message-Id: <20180827174757.7027-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180827174757.7027-1-raj.khem@gmail.com>
References: <20180827174757.7027-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/5] libpwquality: Inherit distutils3-base
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
X-List-Received-Date: Mon, 27 Aug 2018 17:48:10 -0000

its building a module therefore its important to provide correct cross
build environment, distutils3-base automatically inherits python3native
this is seen when using clang where it tried to link with gcc since the
environment falls back to builtin LDSHARED variable

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/libpwquality/libpwquality_1.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.0.bb b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.0.bb
index f2d7922078..7e82bd61a4 100644
--- a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.0.bb
+++ b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.0.bb
@@ -19,7 +19,7 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 DEPENDS = "cracklib virtual/gettext python3"
 RDEPENDS_python3-libpwquality = "${PN}"
 
-inherit autotools python3native gettext
+inherit autotools distutils3-base gettext
 
 B = "${S}"
 
-- 
2.18.0


