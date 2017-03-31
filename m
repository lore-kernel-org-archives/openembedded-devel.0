Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9681C77DB3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 15:18:40 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id u18so21366921wrc.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 08:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=c3gq1M9n2wNa5PS6++40E242YGbABB2Zi4RpIYKI9V0=;
	b=J7Y65p7uhiVXr48DcjyK70Za9+aWY7ZXN06p1HDcYBLTHZOwmL5kmxEEUgAm1FVYI8
	SPaEaSbKPLJ8Q808d8y5RMYLey3o7a2efGsQ3Q9Wiq3BbgAjhPNx8y1rL1JN1VSEk4XX
	QzRMXB/RCiZFF9oAGDllaLW61ZMzah+M5SrLc+LNm60DNVsCC13Om9VjjbA4GO6mtLqM
	C6HQwYibjKQxLdekeaK6guHEjxdkcejwmrOxBEfSWueqdVZRi/FR9nnFT0lls7h39KbB
	K1+QqvMcsyD09dRPLTu2W7SacPsRb5xYYEU9ZBwb2PvxMt6JAggiZYL/T6Xx0w4pOlvr
	I33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=c3gq1M9n2wNa5PS6++40E242YGbABB2Zi4RpIYKI9V0=;
	b=S79bvUMaxAT3TzUFP5xRYwg+O7kGoTcz/YG+fwTMHjVhaFOXUGuPZ84JyJ/+S15Vkr
	vLLOoeB/7PClDnHkpvaBwnLp/GJhvZzDUa3WRFfXyQh4MdF25ZdApeS23Hc4G/TIye0v
	LaaxWmMwaFMdv7967dbopJfPvVj7rDe90AF+CFsiKA3SVM+MV6FRtD8pgzRIVYEau7zG
	qgPIh7gWcUnbEMX2vW/yqiS5yE9IN9T6ZNWSSk60WpjZPUkGfI++oDF6J75WMYaMgAM4
	LbwgcrWLgtAwj9KtphyjmxWudG8bg5OJl2ZEpspc+CWj66dso1qjmMWmjqutilPwst3z
	1Pqw==
X-Gm-Message-State: AFeK/H1eJzWzxuQ6fYWssu8+e60U/53AchnRRP4d2S4pDUeMkoDhW2waTNdrXZ4hUAdXng==
X-Received: by 10.223.153.228 with SMTP id y91mr3357901wrb.81.1490973520938;
	Fri, 31 Mar 2017 08:18:40 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	x133sm3259782wme.22.2017.03.31.08.18.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 08:18:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 17:18:25 +0200
Message-Id: <20170331151828.25907-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170331151828.25907-1-Martin.Jansa@gmail.com>
References: <adec7310-ce23-cef8-0c06-ea4b5bf9036c@gmail.com>
	<20170331151828.25907-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][morty][PATCHv2 4/7] ttf-liberation-sans-narrow: use pagure.org instead of retired fedorahosted.org
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
X-List-Received-Date: Fri, 31 Mar 2017 15:18:41 -0000

* https://fedoraproject.org/wiki/Infrastructure/Fedorahosted-retirement
* cherry picked from master:
  commit 2c4b17449d0178e830bedcbe3e2fbe348984b589
  Author: Martin Jansa <Martin.Jansa@gmail.com>
  Date:   Wed Mar 29 10:23:12 2017 +0200

    ttf-liberation-sans-narrow: use pagure.org instead of retired fedorahosted.org

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb
index f36cf4b18..5b406bc65 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb
@@ -9,7 +9,7 @@ HOMEPAGE = "https://fedorahosted.org/liberation-fonts/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "https://fedorahosted.org/releases/l/i/liberation-fonts/liberation-fonts-ttf-${PV}.tar.gz \
+SRC_URI = "https://releases.pagure.org/liberation-fonts/liberation-fonts-ttf-${PV}.tar.gz \
            file://30-0-liberation-sans-narrow.conf \
 "
 
-- 
2.12.2


