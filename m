Return-Path: <3kU6qXQMKAMoCq0w44w1u.s42@flex--wak.bounces.google.com>
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com
	[209.85.210.202])
	by mail.openembedded.org (Postfix) with ESMTP id 0CB387F6BC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2019 23:45:20 +0000 (UTC)
Received: by mail-pf1-f202.google.com with SMTP id i28so5804896pfq.16
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2019 16:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=date:message-id:mime-version:subject:from:to:cc;
	bh=HckXpIUzAJdRZsQK1gscl4mgha/04dry8wZm3WrY1NQ=;
	b=iAcnx7a0WTdiS4gmcfHVwmebEvr7Mf84WjLIi1npAxOK87xNdcJys79uPo/78nGf/9
	VtAICtYTjS4mg33FyTJ/MKYxNAiddGop+rrFSZCabkZfsnsPPvFEcVWU5TGgHLfezKlw
	woQWT2vGcUu63ncU3OKUq0pot5jKkx7JsBohTB9JHhZK1eB5Q2VaJ7QHcCCG/sZqNEDq
	yIze4KYJMcD8uCPC3N8uQ5wIvGxpJOlwZXxZRsizj39DIVq1qmiKfpRtm6DIGFgsXSTU
	wdI+zUmWMNPN0ayZKyVmnxYi4NZXTwsScrtvmx3TCkSkEOyrpj9PZOf6aDoUza1xfPGX
	8QYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
	bh=HckXpIUzAJdRZsQK1gscl4mgha/04dry8wZm3WrY1NQ=;
	b=SBLT+jY5L8py1WmBQ5zVzQ0TVQ9CysU3axr9vJLNr86zrj+oPEoYuI7a/yDXJ782vc
	VUlHCbNuUBX9opMZF3j7ZgL7IFi8R5j83vI/Nh4kIoTvSddLLvoAcql+u8iDbZwKd4A8
	ZyA7tIizROToS8n3mXqEp/JFSRZGPzWtDkM2L5DdZUzPEYqXrFhxUAQNLqe8ZDTD1RLD
	wMAm0x3CtI1+7dEYSBzRVqcHm8mLebaZIBtZjdbN9Yy2qQdma657cX1PitkeCj3/p9WF
	ofRSBbFa3vC9/yUkQN3TMZiGsmvfFi2WN5PspJVUNzOIG1p11HWo+ApwJXadnkmBypo4
	RsXw==
X-Gm-Message-State: APjAAAW9SAALWzUv2O4gwnylOG6ebWCJv/LUiV8n5ZU1o+hXR3L4wGQB
	YFVzncneru0d42avPP1sYIlGti+BUmaTbrUlWkH6S1b2qfPS8aXWVsCSYrHbmOhWZiEkbsAjyOy
	xomUnHIig00w6sH5iabADRQ3IYt15PHhZm6T+kH/8/i6FB1YPZnUr0HWc76hfL5W7uONBUdyiUS
	YI4uo=
X-Google-Smtp-Source: APXvYqwEdbWAa4yNKRQPa83m3PE/gSyvfrQW7PqA+8KEmVsCEStXUC2cY6BCe/TV5JgJA2WHJn4HPsQ=
X-Received: by 2002:a65:6641:: with SMTP id z1mr13082198pgv.23.1571442321871; 
	Fri, 18 Oct 2019 16:45:21 -0700 (PDT)
Date: Fri, 18 Oct 2019 16:45:15 -0700
Message-Id: <20191018234515.15676-1-wak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0
From: "William A. Kennington III" <wak@google.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] span-lite: Init at 0.6.0
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
X-List-Received-Date: Fri, 18 Oct 2019 23:45:21 -0000
Content-Type: text/plain; charset="UTF-8"

Signed-off-by: William A. Kennington III <wak@google.com>
---
 meta-oe/recipes-support/span-lite/span-lite_0.6.0.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-oe/recipes-support/span-lite/span-lite_0.6.0.bb

diff --git a/meta-oe/recipes-support/span-lite/span-lite_0.6.0.bb b/meta-oe/recipes-support/span-lite/span-lite_0.6.0.bb
new file mode 100644
index 000000000..0ea2dcc8d
--- /dev/null
+++ b/meta-oe/recipes-support/span-lite/span-lite_0.6.0.bb
@@ -0,0 +1,12 @@
+SUMMARY = "single-file header-only version of a C++20-like span for C++98, C++11 and later"
+HOMEPAGE = "https://github.com/martinmoene/span-lite"
+LICENSE = "BSL-1.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
+
+SRC_URI += "git://github.com/martinmoene/span-lite"
+SRCREV = "34118d2df7976f635c8fd35b5959f86cb52ba93c"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+inherit ptest
-- 
2.22.0


