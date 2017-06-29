Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id DDA2B77EFE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jun 2017 04:53:06 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id d5so11562466pfe.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jun 2017 21:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MejAHqrX2OJapIYLq7IshnQyj67ZKewm8Q7t7LQQCRg=;
	b=DtLVL4wpVHtQ/zwZ4IemsBjtTAQUYi7anGuIMmiTxUvbsv+DHFj/HtWNgEFY3Ot3D0
	IuHs/oVNvhEF/YQoIDGZrW7CaPzFjxr/+Za+GfK9ZEAi2+XxZcsbfaT5YCOZLbbHxoVl
	R7EPa8UTDgueYFC/J1TX4U5UQKwunC4edd/vBrh5JlwZCbKemssZU3XsozQwj5wjuYe0
	D9rffke4j+NZ7wxd85y2yhfeqnNCpGc3DxPLgN9fiqXNBbu4O99wAY7jqSs2piFHfcDQ
	idflzgQ9BNA3Mh8XPOhEhZKNxLnzI1gwtNfxHLvpNiWtWRi8BEanBSKgZuANY758xXaz
	xzJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MejAHqrX2OJapIYLq7IshnQyj67ZKewm8Q7t7LQQCRg=;
	b=g2NLlP77RTBO3wOe0f4ik051n5AyMpJwlDG3EhIS0XqLuYCh0I90FIQTtGUrg2aBkF
	dXUkj/auuzoN0FWpRTW+Jvkv1ccMEV8wtS/k2AWLPkHM5Mqd4ZISduPdaSQ2PCbBOspW
	o1JVIgmUyX9LSZO91y5JcNMcDSho2GGBRAA7gBOBaxA2Ic43WGxboysQDNkC77WdsIfe
	6c9++uZZrTgWlYMRWlulZGHgFuA+sZUe1nr2F7IhZmygIIl47qkcAYiHRp721hwxpTqg
	VAPtZ0Pr1TG0vshh00ORJ2+69OP4uk5nHTFHVuuivL4d7EYvzt3WlU8ztBQE1rHHLK4w
	DEeA==
X-Gm-Message-State: AKS2vOy6Qn8E/QEdEmOX8vpe/T9dLJqpARd0KcvO7IdDgylcDt+/iWuU
	Ze0Ytmu6E5ELLJWL
X-Received: by 10.99.120.69 with SMTP id t66mr13958198pgc.237.1498711987687;
	Wed, 28 Jun 2017 21:53:07 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id 3sm8068423pfp.11.2017.06.28.21.53.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Jun 2017 21:53:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Jun 2017 21:52:53 -0700
Message-Id: <20170629045254.22351-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170629045254.22351-1-raj.khem@gmail.com>
References: <20170629045254.22351-1-raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 3/4] network-manager-applet: Remove all occurances of -Werror in makefiles
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
X-List-Received-Date: Thu, 29 Jun 2017 04:53:07 -0000

There are options like -Werror=foo which get trimmed to =foo and
results in compiler fails

Fixes

| aarch64-bec-linux-gcc: error: =format-security: No such file or directory

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../network-manager-applet/network-manager-applet_1.4.4.bb              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.4.4.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.4.4.bb
index 5ad107012..8cec305ef 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.4.4.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.4.4.bb
@@ -20,7 +20,7 @@ PACKAGECONFIG ??= ""
 do_configure_append() {
     # Sigh... --enable-compile-warnings=no doesn't actually turn off -Werror
     for i in $(find ${B} -name "Makefile") ; do
-        sed -i -e s:-Werror::g $i
+        sed -i -e s%-Werror[^[:space:]]*%%g $i
     done
 }
 
-- 
2.13.2


