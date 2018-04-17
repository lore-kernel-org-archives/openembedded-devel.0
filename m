Return-Path: <brgl@bgdev.pl>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 29FA574556
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2018 14:20:29 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id v60so32162836wrc.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2018 07:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=enwre4rFDgPgg7MYhhfINi77r3dX2WUkneraWVPUecI=;
	b=dAt0UB+oNXpxbDb4fg+nuZ3XK0S7Yz3jsRWf9s8xPFrTHo2isoEDlEIf6dQxuBHRbd
	CGFIlWQQChe05svG1J3syRVFFBnKV9hPqng+N8ShoFKDEwzclKLulRFojgJFD57blto/
	AkOt3b/C1bIyqwHw9LN3HB/uSzfV7xgqrIqy3wgzyt98ZOaOYAQycz/CbiLjCWolusFP
	c6B6el9kRUIQSFutVaxCCQPM//xHOH/UgGRGs8YVGszIuse7CCeaR5ygrEl8s6yjTiOE
	u1eBlOhNgwv1kzvSHBNq3kr3IqYoNqwNHwKZsFePFpB9QGG2c43rHMQT5024ddREF6du
	WBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=enwre4rFDgPgg7MYhhfINi77r3dX2WUkneraWVPUecI=;
	b=PbszcLI9zSl3fNt3fTAPDAZgvt3rP2Gu+RxKQGxBfkCvAwg5czXYeC/hlnqsWWDj9d
	oVi8yzvDqRyf7BrNMWedwmHAbi57E94XmltPWx3MllIglcil6uKwRJKrEiK13qAZQYOk
	lj/nPIveHXXhR9dYMjr/c2XGiqO0TfjxXgsQPie/sVxXmHqVIGgJYHdz59g99YXD+3JL
	LgWInzx1IqC1WT5odU5axSKor2JPmuWbR5j8tzuZ3cN9d7lubEya4lSSH0xVmGJT6QxL
	qcfD+GZCpTYWE+a18uLZRQuvpptv4PwaQCESkQllUeNtOqYTfiOhr7D73aJSrAzCZ+k3
	ezhg==
X-Gm-Message-State: ALQs6tDQJqypAsFgqyT6AqsmRwlEFdj1Oxv4LiP1fASsyl5Vl5jcFc6B
	JMupHP/xMq5ONsGGgCIqKYoOig==
X-Google-Smtp-Source: AIpwx49TEGtqYtmai9B+CJA6HjAMXINExlRJfNbUs2OFuS1Wm4nGSuiaCbK9Uv0qFF5Vo3/ygNHaBA==
X-Received: by 10.28.18.199 with SMTP id 190mr1277562wms.50.1523974830670;
	Tue, 17 Apr 2018 07:20:30 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-1-7086-217.w90-116.abo.wanadoo.fr.
	[90.116.254.217]) by smtp.gmail.com with ESMTPSA id
	f132sm6455563wmf.13.2018.04.17.07.20.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Apr 2018 07:20:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Tue, 17 Apr 2018 16:20:20 +0200
Message-Id: <20180417142020.30100-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180417142020.30100-1-brgl@bgdev.pl>
References: <20180417142020.30100-1-brgl@bgdev.pl>
Subject: [meta-oe][PATCH v2 4/4] libgpiod: add support for v1.x series
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
X-List-Received-Date: Tue, 17 Apr 2018 14:20:30 -0000

Add a recipe for libgpiod v1.0.1. It can live next to the one for v0.3.3.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 meta-oe/recipes-support/libgpiod/libgpiod_1.0.1.bb | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod_1.0.1.bb

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.0.1.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.0.1.bb
new file mode 100644
index 000000000..51499fd72
--- /dev/null
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.0.1.bb
@@ -0,0 +1,4 @@
+require libgpiod.inc
+
+SRC_URI[md5sum] = "2ca0c3eb17d69e367b6f6a109ca86e41"
+SRC_URI[sha256sum] = "972924195367f5fb045c023d65340c4b7dfc8764499516be446553865208dedc"
-- 
2.17.0


