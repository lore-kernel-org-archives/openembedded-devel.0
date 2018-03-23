Return-Path: <brgl@bgdev.pl>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3BD9A78771
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Mar 2018 11:07:26 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id l49so2558070wrl.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Mar 2018 04:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RKwCo05mzc59GDa/fEOmfD4K8FsaxI+6iaBNvEx4zo0=;
	b=BRQ61J4hF2bqa4nySk3ZD2Ubcj3kBbFNXRxP8y/C0F35NyUsT05l1ujl/v9hiAAt9L
	snjGaA5DqSBqYZYKmuN2utZgu39nFsDDBZ1IyjMo0oJmP4j1wsV9OhW2tFMSujcF0RGd
	tT4gxj+nALtp5DVpsRnBwO8KuF0PJyFJJuM7by0Te3HHnp/BRSkS5u7krqBf17Y4sI6X
	o/7i3D7v6nFGXqT60+5yIXQ/uuk05ucaH+m7S956I8xjvvel6Z8iyFvMKD6rhLW+NqI7
	z7t12/7ZMJDo54InsCnO2bdOh03/XsD2ssw4oBevrDxEmFTFmbt7AbefgwWiLH3KO0wB
	leFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RKwCo05mzc59GDa/fEOmfD4K8FsaxI+6iaBNvEx4zo0=;
	b=QNAswhw0vry+LvqQ2jiZV9YadTPQfvQP6/R8NriBUTR35y4ctR/9zKNCJ1nAUb5KKC
	O6Ppr9grZ2lVr8Aq5XjVJ765sn0j+90jwnuU4LYKlQtKBKvC6xtGA/orNQegmr8I4HIn
	DZ0Fotwb/DQAN3z90VN7ErVnvE5W+JtJob5Uc/ZenZ+dX8V/g4mMrWMVtyqM9pM5gvia
	pjgAmlXcMtxnbtq4fwrI0QNqIS+XLwFD6mylmj6AuOgX6fR+Yei+kmI/HmvQH0grcQ7E
	725uXOYOtcZPdwQ7yMVJMVPaK3wGWC/rktNCxSbDTsSX6pJh/C9b33qGtdMoOlKOIkJZ
	/32g==
X-Gm-Message-State: AElRT7HQxe8++QT0mxQi6Nw87gJ59VIIwWYBpPYTFZnNyJamFb5R3NSE
	Y5+swxQLCdaISrQlgjxWZGIGFA==
X-Google-Smtp-Source: AG47ELsKyP7f+NlQMi05RPhW6zXRbUrWMnz+E4i/Jk//mh8hbRf6L3Qzt0NqoB+pKwhs2oyF5Bg1Fg==
X-Received: by 10.223.133.133 with SMTP id 5mr24087106wrt.195.1521803247954;
	Fri, 23 Mar 2018 04:07:27 -0700 (PDT)
Received: from brgl-bgdev.home ([2a01:cb1d:af:5b00:e837:b8d5:48c1:571b])
	by smtp.gmail.com with ESMTPSA id
	c57sm6184788wrg.84.2018.03.23.04.07.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Mar 2018 04:07:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 23 Mar 2018 12:07:17 +0100
Message-Id: <20180323110719.1010-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180323110719.1010-1-brgl@bgdev.pl>
References: <20180323110719.1010-1-brgl@bgdev.pl>
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/3] libgpiod: include the version in the recipe filename
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
X-List-Received-Date: Fri, 23 Mar 2018 11:07:27 -0000

As the first step in supporting both v0.x and v1.x series: include the
version in the recipe filename.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 meta-oe/recipes-support/libgpiod/{libgpiod.bb => libgpiod_0.3.2.bb} | 2 --
 1 file changed, 2 deletions(-)
 rename meta-oe/recipes-support/libgpiod/{libgpiod.bb => libgpiod_0.3.2.bb} (98%)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod.bb b/meta-oe/recipes-support/libgpiod/libgpiod_0.3.2.bb
similarity index 98%
rename from meta-oe/recipes-support/libgpiod/libgpiod.bb
rename to meta-oe/recipes-support/libgpiod/libgpiod_0.3.2.bb
index b2e3bae69..20068894e 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_0.3.2.bb
@@ -8,8 +8,6 @@ SRC_URI = "https://www.kernel.org/pub/software/libs/libgpiod/${BP}.tar.xz"
 SRC_URI[md5sum] = "9c1966bea7dffd59bd099a8b2930e2ea"
 SRC_URI[sha256sum] = "50c7862428ca90b58672e2475aea66d33a6fc86c6bab1928c0660f3aedf44a37"
 
-PV = "0.3.2"
-
 inherit autotools pkgconfig
 
 # enable tools
-- 
2.16.1


