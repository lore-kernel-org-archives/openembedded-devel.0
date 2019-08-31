Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 158B37F4CB
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 21:32:01 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id go14so4887675plb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 14:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=0DJNWTLveRpxmWGkjAi1Gf4JhXIJlEP7UYfx41Romhs=;
	b=ELF2HPTYnANPlwd3SlyiQgdPXDh0OPC0UKjmYyFRGEut1joWYvVwvWAkFpgo9znRCC
	gwYMskP8tO/TMH+iSd3MKEdMlwGp6Qq8Y2euWvRKeV0LzQITwsffyKrHl9aFCr5VY09b
	YpB0vXgDp0JerJ1KBUGCrQSM2d+CAbXv5Gdst92yOn02fzQABaEmJBXaVLLRLP7aV5ZV
	9TvTCENFJo6A3nOQdB2bxfppKw6QwzxVphJDIh+9MAWjDyMHcqfO2He3n16kpSdZAgIP
	pinLk3wnl/jRXl9kgnZYBXXIyFHzkd/KY9McVOw/PCegJKnuGifN+/7XsBF1wCOnvVsn
	pb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=0DJNWTLveRpxmWGkjAi1Gf4JhXIJlEP7UYfx41Romhs=;
	b=HwyjE3fAs4/m+bYugfFafgJpEHAzlXaFKgn2ad7/w9xeH5BatlZEw3x63OtfvctX9z
	B7mcbJhm3g0NLKHVZP32Ov1YDNBVLSwAhskI+xGKitw0IGdyMZX1bWGQlMT2I4/qXHPv
	3r5Jz4ZMV7I2P2aHLxtALhRnJBUI45S1aN4VeHSuw6g+Dvk++NNyrWSnRWca9bOY7ePs
	ZMCCYqNp0fHyp9s2ByeSDWFed1K6Katt2ehkcN8a8BEf+Pl9cr1LHPA96gc9mRie2ckC
	iodS0JIkyHOwBxM8e8WTYikqsdEXwQVin1SDeQGseeEUPpQgyWKDxJJmTMXqg56wi9WH
	u37g==
X-Gm-Message-State: APjAAAXstMT/gH334swd8uOxfLAfUPKSGWpFH3M/uvYw51+440ghpCft
	pS9wtnuO/3RqfeyF84nDvaPCYlKI
X-Google-Smtp-Source: APXvYqwY7q0k/syEmwUF4Q+kfOqLi+L8zT3ncoVLHvu5HrzWstGGUEpFpS0sVSlq8sHBpNH00KV7Lg==
X-Received: by 2002:a17:902:a410:: with SMTP id
	p16mr22651079plq.150.1567287122097; 
	Sat, 31 Aug 2019 14:32:02 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:8107:6109:754a:f033])
	by smtp.gmail.com with ESMTPSA id
	a18sm8060827pgl.44.2019.08.31.14.32.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 31 Aug 2019 14:32:01 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 31 Aug 2019 14:31:37 -0700
Message-Id: <1bc5cbddf4fad6382b75d8533ace68a8e41999a9.1567286967.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567286967.git.akuster808@gmail.com>
References: <cover.1567286967.git.akuster808@gmail.com>
Subject: [warrior 16/23] scsirastools: add runtime dependency on bash
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
X-List-Received-Date: Sat, 31 Aug 2019 21:32:01 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* fixes:
  ERROR: QA Issue: /etc/init.d/sgraid contained in package scsirastools-raidmon requires /bin/bash, but no providers found in RDEPENDS_scsirastools-raidmon? [file-rdeps]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb b/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb
index 77d3cfe..37d083c 100644
--- a/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb
+++ b/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb
@@ -44,4 +44,4 @@ FILES_${PN}-raidmon = "${sbindir}/sgraidmon ${sysconfdir}/init.d/sgraid"
 
 RDEPENDS_${PN} += "bash"
 RDEPENDS_${PN}-diskmon += "${PN}"
-RDEPENDS_${PN}-raidmon += "${PN}"
+RDEPENDS_${PN}-raidmon += "${PN} bash"
-- 
2.7.4


