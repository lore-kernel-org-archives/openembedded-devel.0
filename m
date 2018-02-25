Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 66B5C7889F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 21:33:54 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 68so5720269pfx.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 13:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=VnjcuHABO4UKe2gLyIm6umu28rDdY2viQiDuke2o0VE=;
	b=dkXQSbYQx+8Yaxkn0xAs5wT3T6byXB5NRlo7Fkp2Y/H86Vh87HiJjeRrA3+7+LC7iH
	zsqlKV2RfoDyvSAWWBI5lKGtd5bL0j6k/sReh0aEdQDtsXV/gA/lcKWvlU4ev0ft1BO6
	NDWXXAEvb3yy1Km4cnaWb5LA+WHYz/n7fSz+oVw0ZnFGc8JuArmhEZ5dcS1RPIVLmExn
	NWm9713QUqxhfAONPcrVWVJdqeYLqKMjtHG2piZU9KWdzYc2wD8F6tf5fHUbiWz6OZ1P
	/SHnRaCO9ZCgP1kMNGIqWuMd3nbsotxy2pJh0HeoFEFvJCocoUqBuq02WbeuC0GGLGXp
	yktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=VnjcuHABO4UKe2gLyIm6umu28rDdY2viQiDuke2o0VE=;
	b=s8WTtRCslvwPQUwpAo6tfy+cYv4SefAO5pg5hmb0LxLZY78EmXw7Xo5MDRvheHQiqu
	rINB/JFx1opr3x+Xaj1Dddk7AifuR9pxy1cRBOqPYeXstghGbBj0ZC+VJ1W/wSmS2BS/
	WEZisJXhP8wQKvmZ7kPethz8oarA9y8AZRh69iJJsz4UD1s7Zy7OJ6IiMumRVM06Gh2k
	YK+bgIAIiilM9/iO8mYNdtQ7FEOvW6bfQ9U5mzGAJlvVlmCX278HNuKqe2IwHbOeShFl
	pUxCFNd2n+8Pxsv7OxRSHw2K/mJgKxVnX5y0O6jaSE9z4hGF0v14KmtrXhMrB6Zd0G9x
	eEOA==
X-Gm-Message-State: APf1xPDi1gNGaYcnwokyz07tX8uZQ8rHmOdnMnvqzg2NhVlJO4l+vlwo
	QRXlO0XXbgCJTlFhQisfj5sVUw==
X-Google-Smtp-Source: AH8x225y3d9BM0Uu9Q6IX6dpgNZCIE52Fbk3c16JmjeZzqWp6yugKnK/MVM1YFY2dd/cGXI6keIFFg==
X-Received: by 10.98.200.131 with SMTP id i3mr8507272pfk.40.1519594435883;
	Sun, 25 Feb 2018 13:33:55 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:ad95:2a34:2e02:2fdf])
	by smtp.gmail.com with ESMTPSA id
	64sm12014600pgj.39.2018.02.25.13.33.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 13:33:55 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 13:33:17 -0800
Message-Id: <1519594406-24490-27-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
References: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 27/36] cryptsetup: move to crypto
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
X-List-Received-Date: Sun, 25 Feb 2018 21:33:54 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{recipes-support => recipes-crypto}/cryptsetup/cryptsetup_1.7.4.bb    | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-support => recipes-crypto}/cryptsetup/cryptsetup_1.7.4.bb (100%)

diff --git a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.7.4.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_1.7.4.bb
similarity index 100%
rename from meta-oe/recipes-support/cryptsetup/cryptsetup_1.7.4.bb
rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_1.7.4.bb
-- 
2.7.4


