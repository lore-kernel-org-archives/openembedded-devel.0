Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 359E878825
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 21:33:38 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id w21so8113068plp.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 13:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=vFAwAGOLM33Jv2avZXHpOJWsFg8N29WQMRA85U9O6hU=;
	b=muHa/xJwF9uy3ZDS861Egxs4C8EABEzBa6ZwQNtKZkCM+P7dSZDb4W6xzhUXOPAn0Z
	Qh6YQGYXAcDZdQjdBSFJ61ZD/Os59N083/zsjKc1THwcBMRJ/Rn7EBxXNHO1Mt9R/Hb2
	eQ3N+VQlEzqIIs6BIm4Rekj8NYSW4bDxZF7dlWQaMXt4FH4zL1fciPuKz5GDX7l/EFIR
	jEAhhNqSLkdka7Sw+beJMmebZyaWEdfPory0zupTfnATdDcTTZaT3nHT8mIgOrb6uPMt
	jj+QqfjzgdaGxCLVGlESLICZjWaYOSIeYEuNGqW3ALRozyayKx+sRPOrlckEhyQi6P7x
	W9Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=vFAwAGOLM33Jv2avZXHpOJWsFg8N29WQMRA85U9O6hU=;
	b=byVo0lRguTCtrmksvQWsBW3ToNpUTeIHrqQb/ZInZQHTAFjWysP3ik9ShapPj8S9ms
	lWcFHeNuPZPzUTyLne7qjDT7z2cmrYLfRYoautiQ5LvcGfR69cMCvo+1ff2PNeh5EDoG
	YRboAaADfJCqay358NoWwUeOQ4g5LuEQClikaryWXCEZFLxU5xPYtCsbjsRalxIUy8DW
	jm3hNLNgvS6iN5WRX6bMTlOyiOxzFb8UQHNCjkFjACzA+bxGqxJV4Mdsrb4MmkM7Tk87
	H6CkFgVLQut/31eIMS3G7yYDaHj158B1su3uFaYUicjMABVLGYtwkO8D2lOWHmgvztOz
	Hwbg==
X-Gm-Message-State: APf1xPBV86Dxr1z2OsjU7kH5iWacZQEmvNfNWi1JvjYZHPv01bCimeMU
	8MG0KNwbzaoRO//gNO98R1JCxw==
X-Google-Smtp-Source: AH8x227D1kCYP+C8BVKqr1G87eiEEfNMBUxUKLeTGUxomWeJRMgNnSVhHTCwkg9Yy1Uby+JVVAthDA==
X-Received: by 2002:a17:902:bc02:: with SMTP id
	n2-v6mr8552529pls.52.1519594419793; 
	Sun, 25 Feb 2018 13:33:39 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:ad95:2a34:2e02:2fdf])
	by smtp.gmail.com with ESMTPSA id
	64sm12014600pgj.39.2018.02.25.13.33.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 13:33:39 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 13:33:02 -0800
Message-Id: <1519594406-24490-12-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
References: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 12/36] fbtest: move to recipe-tests
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
X-List-Received-Date: Sun, 25 Feb 2018 21:33:38 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/{recipes-support => recipes-test}/fbtest/fb-test_git.bb | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-support => recipes-test}/fbtest/fb-test_git.bb (100%)

diff --git a/meta-oe/recipes-support/fbtest/fb-test_git.bb b/meta-oe/recipes-test/fbtest/fb-test_git.bb
similarity index 100%
rename from meta-oe/recipes-support/fbtest/fb-test_git.bb
rename to meta-oe/recipes-test/fbtest/fb-test_git.bb
-- 
2.7.4


