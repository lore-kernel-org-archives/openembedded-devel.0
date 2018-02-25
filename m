Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 831DB787DE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 21:33:39 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id r26so202077pgv.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 13:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=DYNxc7yM8EToyBvqMpQTf/7GLVjQYPKIpS53PqTGgjE=;
	b=T0CDpPg0l4shzcbR2E2hksVZpyq8WA1v50e+U/HCSB1n6rb+A6pwNHZUmr88PAM0sW
	qA/VQ6+9S8NiwotDKYCPG9cktGNItZEzHhnOsPtC2EmYKijU1STBU7fpcCLvSsk1BeHR
	53FJgPeArBUdh8ZWC0h6mHgWS3R9L5ACb5bvYZSGeRO6uRi9mYXGmARikr15oMPA0E+4
	Cxbtr/yC/2a42HqjyWZh5NWRjqMreAijYqX5UkP4KmBEJZQM00h7ac/BayFkXdBO8slk
	kpk7MeMOYBojC/9fbGZEZ0emLpkpWIP82dAmLn4u9vCi2Bys437NjXaOcTF8RBAKu+py
	BAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=DYNxc7yM8EToyBvqMpQTf/7GLVjQYPKIpS53PqTGgjE=;
	b=cG28haIQarMe+/f+UBlXvggVMElyxGHkNztMGyEdodGjAG5AVG/3iWL97pXLUhcduy
	i2Yh7j+G2SEK3SM+82fu8mGM9WOqkkP/u/yHmSKhqdjrP22zt/abxqptA35KO04BHZ2n
	qEZSyKB7PSPHu1afNjUMv8aRIm1flmpBWgkj3bOlymbQrxns9o3J4Zd8djMNHAOBK63p
	gGLgtep5am+r7Feo1v5+fS/s3H0+rDrTmHEqVjbDXCorpDW1XObxE1IavB1zAWNESwW+
	PNSyjRbZfmY89yJY7phc2EH5NHrQo1tjAWTmJg58kTHxam0ygh839+vUSLZI9QC6y1BG
	Ivhw==
X-Gm-Message-State: APf1xPD7qLFT6AcwfoClwqjg0oAA4BeGtSn/OUmqTGqm0gXGIWQAJj7N
	Lb6ZF7jhOphIjttmAlobhaHC5w==
X-Google-Smtp-Source: AG47ELsa2Xyi5dIyqwRD5B1fDCBW7oIMgNduui/q9czMSWqoOm2ioWXnc9oeJ5WxBoXf3WLTYyAheA==
X-Received: by 10.99.180.77 with SMTP id n13mr974430pgu.361.1519594420798;
	Sun, 25 Feb 2018 13:33:40 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:ad95:2a34:2e02:2fdf])
	by smtp.gmail.com with ESMTPSA id
	64sm12014600pgj.39.2018.02.25.13.33.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 13:33:40 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 13:33:03 -0800
Message-Id: <1519594406-24490-13-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
References: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 13/36] cxxtest: move to recipes-test
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
X-List-Received-Date: Sun, 25 Feb 2018 21:33:40 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/{recipes-devtools => recipes-test}/cxxtest/cxxtest_4.3.bb | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-devtools => recipes-test}/cxxtest/cxxtest_4.3.bb (100%)

diff --git a/meta-oe/recipes-devtools/cxxtest/cxxtest_4.3.bb b/meta-oe/recipes-test/cxxtest/cxxtest_4.3.bb
similarity index 100%
rename from meta-oe/recipes-devtools/cxxtest/cxxtest_4.3.bb
rename to meta-oe/recipes-test/cxxtest/cxxtest_4.3.bb
-- 
2.7.4


