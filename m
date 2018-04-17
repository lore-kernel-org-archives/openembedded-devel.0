Return-Path: <brgl@bgdev.pl>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id AFCBD74547
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2018 14:20:26 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id s18so36039632wrg.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2018 07:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jEX7KR7XJE9uj2oMdYpkmQ7wcDi0Y5+OeV7+S+xo5/o=;
	b=KQcZfu0+DRgwVdSFclY9qPR4vg6YZ7/7mQhd8ZY9GmE42+L78JvFpp4fM4oC0bdMVL
	QUuzy+j74lBusgbd7my6cqbUW/G+ch8UvASZbUcYcpH0rmFvc2h6tR5PBQcqvLti0KOG
	wxy//1SpgTD8rL5VJlNZl7tzg67Hx+J6tBy6/hT3r8wLmRyHp4Zi2AcPUHkDxkPm7oea
	vjE5Oi8phvkqFDAQBY32D/W6eqlqvotHqO3ajImnyJk9hfcNNmtZJnd1ZYxDosCAtYKR
	++mEAM3AQTiKmDvfeQfula6Z5ZC5csdl3tMhXynuI0prKKMSE5mDiBnkSu4mjRU6KHt8
	CQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jEX7KR7XJE9uj2oMdYpkmQ7wcDi0Y5+OeV7+S+xo5/o=;
	b=KMPjaW5458YsN55AvgX5Qr/+qtLk9oBXbVClk1PRcywT9NQCtpphLVo405L6g+edpC
	TXOk712GknoOEtHoTybEMpjcbylETPRxyyUZLprcR/QZcYJEyNpOm0EjfKF4DPpDbR4j
	ZrCmoYkZ40NA6+8pznn2KN82gEjIk+Tz5SQdAixNwtbkztWEVWkZFRFR/fvUFuaOJnaw
	ytjrRXjD4pQXsqbPIhV78aZDoUD4MP+PtcT/iGWbgUepCopoQgenIqfrQuQdbIny4ftV
	AyqxPigqW0YKGV44ZKS0Sbiy+gTcuWD7sBuKmN8ffd7QwIuzVzm6vvedwtGt/fy3SCvT
	nC8g==
X-Gm-Message-State: ALQs6tAJXqZyGM3ph4fCCyQ6VBtDUs/cwrNvfHQUt3IP0rCUTV06FW3o
	bqcim/kIOXP1FZ8z04nFxp6rHg==
X-Google-Smtp-Source: AIpwx48CfgP1VJlCotVg7/tBPsxKUjmJZw0XUg55MBTGPmmHeIukbB8TcccigwbXMBhx7wWhdhLwGw==
X-Received: by 10.28.127.203 with SMTP id a194mr1212512wmd.57.1523974827256;
	Tue, 17 Apr 2018 07:20:27 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-1-7086-217.w90-116.abo.wanadoo.fr.
	[90.116.254.217]) by smtp.gmail.com with ESMTPSA id
	f132sm6455563wmf.13.2018.04.17.07.20.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Apr 2018 07:20:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Tue, 17 Apr 2018 16:20:17 +0200
Message-Id: <20180417142020.30100-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180417142020.30100-1-brgl@bgdev.pl>
References: <20180417142020.30100-1-brgl@bgdev.pl>
Subject: [meta-oe][PATCH v2 1/4] libgpiod: include the version in the recipe filename
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
X-List-Received-Date: Tue, 17 Apr 2018 14:20:26 -0000

As the first step in supporting both v0.x and v1.x series: include the
version in the recipe filename.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../recipes-support/libgpiod/{libgpiod.bb => libgpiod_0.3.2.bb} | 2 --
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
2.17.0


