Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 172BE78398
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Aug 2017 21:38:42 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id q16so841961pgc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Aug 2017 14:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=of3q3RfF6tG+osxhkQpX+A2rVvmJi1yo+XKxXn15MEI=;
	b=BZ57fjspTnLFa5AIAuc3+X6V7Ohn/ZI95du0krL6m9m1HVG4zgufLYt5vuuuCAFtYe
	Mraq6ig4GqMx3HpyBOWgzz6hrNvakQGltWx8O8t2vPDpIKouyQkN+vDa5xdA7fYBQhi3
	eZAuvOumnff9/T0Fs7qMQGCNZCE6CF6pRGkJ3hl1VFCdKF0u5jFryjm5d1yp50ng3X52
	fzw8wSF2xVYVpdplf6x/mLX+OhMZ79noV38PucEaJ24TLs+NhptOlFMmc4PaHY/ZmoWa
	iXJV3HB0nnfgoV8hZBa9gDlYlxeuFHBAS+yiLwSSW3G9V3KYwe+Bpib3fEhgkWmyoHKN
	S3eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=of3q3RfF6tG+osxhkQpX+A2rVvmJi1yo+XKxXn15MEI=;
	b=kHrD8SzypS78g8/EyfzLQP1tzD1ydYuiHC4ehjtT7AH+O3vmVYIKfYUXWo6fzoo1Sn
	GmIiI/pplFOWraEtXp8WFiZZlBXb15wn78lz/tWOPzbNYhTpLhcwX4uXnRungrVdWQnj
	vhhpy/Rf/7EDwzum94ducaYPBU8ZA1sYH3q+JmGCaRdGnP4tsYuO5WPOIrT5nlJz1s8p
	fD7RTnpe5GeZEANOg/STVKpEZBUAWkGg31ZJCcAadaZOTtpyP2tf5TrO4RAU6Mh0/401
	pmThE5PzbcC0Xf+nPc5r87hzEqJnp4LUv9UvUoG9ODR7N1ZFMg7bbI4Kk8fEEJO012iz
	KBnw==
X-Gm-Message-State: AHYfb5juMSmiEugykv3pMSd02UhRHLqZo5LGzhEXDJXqX7nc6Fixu24b
	Uh9bbd5U6FhZXnp3
X-Received: by 10.98.43.213 with SMTP id r204mr7857374pfr.0.1503610724432;
	Thu, 24 Aug 2017 14:38:44 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::79ab])
	by smtp.gmail.com with ESMTPSA id b27sm9076560pfe.6.2017.08.24.14.38.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Aug 2017 14:38:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Aug 2017 14:38:29 -0700
Message-Id: <20170824213829.41431-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170824213829.41431-1-raj.khem@gmail.com>
References: <20170824213829.41431-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 6/6] openl2tp: Add bash to rdeps
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
X-List-Received-Date: Thu, 24 Aug 2017 21:38:43 -0000

Fixes
QA Issue: /etc/init.d/openl2tpd contained in package openl2tp requires /bin/bash
, but no providers found in RDEPENDS_openl2tp? [file-rdeps]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
index 1e5bfe264..0395199e7 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
@@ -84,4 +84,4 @@ do_install_append () {
     fi
 }
 
-RDEPENDS_${PN} = "ppp ppp-l2tp"
+RDEPENDS_${PN} = "ppp ppp-l2tp bash"
-- 
2.14.1


