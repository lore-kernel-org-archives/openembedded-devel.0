Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 58A7E7F9F6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Sep 2019 14:03:01 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id y135so9658028wmc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Sep 2019 07:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NdzQemPkL0IV3LsaU7Jf55E4KCvV68R5NCrXTKwDOhI=;
	b=s+WqyAJl8TR2/5IY0VUxpFcoiTtW33ecp53zlX8h2QZuE7YpNfSt4z0eVogBtfD8ON
	zTWxd2rtlMofeRp5bdp3WlB04yBosPprXBKBQcg/gQ1eP15cD8fn5fkyYauVuvOajPF2
	+1XIIRYEgfEJiS+7cK2LXPdhM2gCh55YrvQBCyjZSFHRQbqCgA7M84iEP0ETXhBDeCEE
	NC2eN91xHqLMzWjTDfZeo8StNKbJ8irweu1IUkBdDNqCMEwKyban3/JLxBsjqBJzFnHw
	paIgBCNptMNV3x3/+O6n7BZNvT3Ru4Zib4YWb3m70jFKM9f3UpYNGGbjhPrkCQF2R2UM
	SwvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NdzQemPkL0IV3LsaU7Jf55E4KCvV68R5NCrXTKwDOhI=;
	b=L/b1U/AQ87lJvZByXHyHCvfHvTvoz913DNywND0TNYMRRttcrEBoJYxdmEs2X0yLh2
	pNMv69/m+M36gJWSec0QQDL3WJJRnl/VMlcNn9bSt4NMDhiiuhZtHRnjKeLOdgT5gQSl
	TRNd2eEE6k9DkLlz2Bi4lfkpoQyhql0AkK48dIijaU83XROi86cWAxUxO5qWtRf1HcTC
	Orv3Xirk8jmD2YfzdqAaoJkSqi+YrzcYAbOZzgsz1O68hUWnlM/LUoqY2bHQjzVVajw1
	ugz/qxfjtGOUzi++pskoYKciNGzH+RjhqabKDEdbcHvK2RWyYC2fRpV0ft0eO7rJhrgt
	TSyg==
X-Gm-Message-State: APjAAAXE53wXoB+9B1ZC7c/Tkb3nKjrW7xqdGnZ4X1M5FxxELcYMiFhL
	xHkI8xuSN0OUdRSmRyYW3y/siLS8lDY=
X-Google-Smtp-Source: APXvYqwG/qXWUiIkYofWnE6Oy8k+txpmd6zP31F4+ztnX4RRvGRVwaHWA0P0Ujk+404oD3aRDoX8/A==
X-Received: by 2002:a1c:cfc9:: with SMTP id f192mr3462882wmg.85.1568988181706; 
	Fri, 20 Sep 2019 07:03:01 -0700 (PDT)
Received: from VM-VPR.corporate.saft.org ([80.215.101.3])
	by smtp.gmail.com with ESMTPSA id
	f186sm2338132wmg.21.2019.09.20.07.03.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Sep 2019 07:03:01 -0700 (PDT)
From: Vincent Prince <vincent.prince.fr@gmail.com>
X-Google-Original-From: Vincent Prince
	<vincent.prince.external@saftbatteries.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Date: Fri, 20 Sep 2019 16:02:40 +0200
Message-Id: <1568988163-30013-2-git-send-email-vincent.prince.external@saftbatteries.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568988163-30013-1-git-send-email-vincent.prince.external@saftbatteries.com>
References: <1568805952-19822-1-git-send-email-vincent.prince.external@saftbatteries.com>
	<1568988163-30013-1-git-send-email-vincent.prince.external@saftbatteries.com>
Cc: Vincent Prince <vincent.prince.external@saftbatteries.com>
Subject: [meta-oe] [PATCH v2 1/4] python*-psutil: Add native and nativesdk to BBCLASSEXTEND
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
X-List-Received-Date: Fri, 20 Sep 2019 14:03:01 -0000

Signed-off-by: Vincent Prince <vincent.prince.external@saftbatteries.com>
---
 meta-python/recipes-devtools/python/python-psutil.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-psutil.inc b/meta-python/recipes-devtools/python/python-psutil.inc
index e466c5c..0908c1c 100644
--- a/meta-python/recipes-devtools/python/python-psutil.inc
+++ b/meta-python/recipes-devtools/python/python-psutil.inc
@@ -18,3 +18,5 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-threading \
     ${PYTHON_PN}-xml \
 "
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


