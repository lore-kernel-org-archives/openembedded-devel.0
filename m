Return-Path: <brgl@bgdev.pl>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 212FB7452B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2018 14:20:28 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id o15so5045999wro.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2018 07:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AeZpsXM+XQhgsTwnI/omQvtWNxU4uTK/qJjdgqtmKfQ=;
	b=YkdKerqzoEYmp+KR2kzzM5vGEp27xaLpMlxsiNblgVF4X4GwvTIorQAu42NamL3zEh
	tRhMeERWPjuvsxBkHyR5RQwg24EKES3GD7qm4U6TFM73tReQkUsW4+dI+D9QZMKSOnQQ
	GWAzsRsJ8wTJH7/lKaHsLm3rDeYVROmUWLQ8BWpTZx65hCh+GoJmW/JxLKCjw6iKMGEX
	eAlf43o41Dy48feM5oq7CuW2ksJvBc3NqAcATUUUWXzKC+IjsGkicbzUkq5qc4HTQ/tg
	WJoNJhUGbBZ8qrs4XcBs4FmdcxDQZ1mR4/+CfQLKyzcLWTHv+Cmcy5lg4J81yh73nl4V
	E+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AeZpsXM+XQhgsTwnI/omQvtWNxU4uTK/qJjdgqtmKfQ=;
	b=sJ6bekzcJP9lR1FscrXnaHCI5gP/gcu/RPdaUIChf4JuFQbsFjwPzfjP4yR3fxUBn4
	J9Y3pF0ItiKaNnWir8p2vRDS8zKcd+LDjlcxN3ACs9j4B83nnwzEs4qh7KBEa9xDhENc
	ICjibdhTC7LmsuqfXk71mlzKo9w9krU1DCQwOj2lbKKmJE6r6Yd9a3J802Nb2l7fC5Mh
	KMs0F3eBy+kBhZ6dfa4srXXDg+A0jT7d5kx08BsyI6Wh7cEvSu1sPjtyYmdEjmDunUb9
	IkzfNpT1gGOR6VP0bdvjrW+MTITWLxDHvMgqvcRKhEjWrYNEGvEDUEb+ImW3PFJ7RDBO
	7foA==
X-Gm-Message-State: ALQs6tCaEjorNa02zLs/sEWLNwAjeh2P7KUglESC+5HU0CrrK6l1brcO
	Fy5Uito5zIX0HSiuI7350jpLr3/PA/g=
X-Google-Smtp-Source: AIpwx48+rq1v1ilxiQrzFt6PA9L7qaviVGTgFvvQKceCuAFfigBdDol5hyAUTtD3N+MCAmsEqljf1A==
X-Received: by 10.223.133.209 with SMTP id 17mr1894461wru.143.1523974829528;
	Tue, 17 Apr 2018 07:20:29 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-1-7086-217.w90-116.abo.wanadoo.fr.
	[90.116.254.217]) by smtp.gmail.com with ESMTPSA id
	f132sm6455563wmf.13.2018.04.17.07.20.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Apr 2018 07:20:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Tue, 17 Apr 2018 16:20:19 +0200
Message-Id: <20180417142020.30100-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180417142020.30100-1-brgl@bgdev.pl>
References: <20180417142020.30100-1-brgl@bgdev.pl>
Subject: [meta-oe][PATCH v2 3/4] libgpiod: bump version to v0.3.3
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
X-List-Received-Date: Tue, 17 Apr 2018 14:20:29 -0000

This is a bug fix release of the v0.3.x series.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 meta-oe/recipes-support/libgpiod/libgpiod_0.3.2.bb | 4 ----
 meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libgpiod/libgpiod_0.3.2.bb
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_0.3.2.bb b/meta-oe/recipes-support/libgpiod/libgpiod_0.3.2.bb
deleted file mode 100644
index ea785ad0c..000000000
--- a/meta-oe/recipes-support/libgpiod/libgpiod_0.3.2.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require libgpiod.inc
-
-SRC_URI[md5sum] = "9c1966bea7dffd59bd099a8b2930e2ea"
-SRC_URI[sha256sum] = "50c7862428ca90b58672e2475aea66d33a6fc86c6bab1928c0660f3aedf44a37"
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb
new file mode 100644
index 000000000..09fb65a08
--- /dev/null
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_0.3.3.bb
@@ -0,0 +1,4 @@
+require libgpiod.inc
+
+SRC_URI[md5sum] = "2aa1e1a80c3c919ae142ab9a55fb59ca"
+SRC_URI[sha256sum] = "b773e557af1a497f786825462a776b7bf90168e67ee0a5bc5d2473a5674dc38c"
-- 
2.17.0


