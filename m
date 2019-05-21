Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 53C8D7E140
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 03:56:46 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id a3so7846209pgb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2019 20:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=EkhFljgf6M7hV83VQjtrV20yLjcAc3ceMKTg1kIzTxg=;
	b=sPvfa2K9itb2Q5wWN47Wy/Kcx8NDao4jJTJl6rYMtQTyjUeD0gTyMyoovTPnvhytpt
	s96chTKMzopRix4m6XfmUyMm+DQJN5t6fcbqAKmnFn/+QXkAeVyXbtUca9oIKe/q3DSP
	qX6+V2No9R5QPanJz4iB44Xflo9tVoa4zd7TiFGuka0mhcn7YyP/nSP6QE80FxvjRTrO
	YUoe8OYqm0cXuQjGzV7d5nqgcVgSwHwlp5BV75ezey5K7rx/aEj58xUNgvgxmaEdGz3H
	XVsIFt+Fpjcz7GbEb1HBc51yek0xIgg9KSpWunvAi3YCuCTWf+7QV4WSbe9ilPSTZSt8
	cFVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=EkhFljgf6M7hV83VQjtrV20yLjcAc3ceMKTg1kIzTxg=;
	b=fJ/1wdXgD5Pnq6nTROrKlSAQE/eJjN8TlwZtrOeYtcw2nDAwJ6JydGbPxO+uBB/700
	HnKa/JuhVO8Pc114mp6swhOMXvL8E57wpyyC4KHBhToFteXXcHwQjrVGIDJUBEwWFJxn
	z7pDecgcivihDA9GyBMjEyZ90xhTqLXQx3mykl2/ruJ+Khjd8ETGVNABX+NxT1kqdHOT
	X0/uzb18NknTHZqLoZkujhUx7R98gnqLdbETYqZ4jBXmAbii6ftHbktUlm889Nj76cHu
	k03zdE3QXg1WQS8hZLGivpRTe/sDdJQ51z75N0oowOYKhNgl8q6Sw05wOJPtSEi+nn6M
	QNkg==
X-Gm-Message-State: APjAAAXbuBtg8X9/7p05H2kl8nI/aJ3jurgwIUm79zDFprcgEIaDMYFM
	rcI+1hunHL17WcDOixNTDOxkcdZs
X-Google-Smtp-Source: APXvYqzm6Qk4lQNbYAp9PRNbf7S8K29IE7hsf/OBLCjr9zlTdH6Q0BS3VQFD4PEW2vyV4BRV5dAncg==
X-Received: by 2002:a63:730f:: with SMTP id o15mr79493728pgc.315.1558411007520;
	Mon, 20 May 2019 20:56:47 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:199d:e2fe:5a4f:97f4])
	by smtp.gmail.com with ESMTPSA id
	h13sm23045273pfo.98.2019.05.20.20.56.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 20:56:47 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 May 2019 20:56:11 -0700
Message-Id: <21bb3f26c3336848fc234540ef9196d172f0ad7f.1558410874.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558410874.git.akuster808@gmail.com>
References: <cover.1558410874.git.akuster808@gmail.com>
Subject: [warrior][patch 11/34] miniupnpd: fix SRC_URI for multilib
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
X-List-Received-Date: Tue, 21 May 2019 03:56:47 -0000

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-connectivity/miniupnpd/miniupnpd_2.1.20190210.bb            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20190210.bb b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20190210.bb
index 302f507..d4093e5 100644
--- a/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20190210.bb
+++ b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20190210.bb
@@ -11,7 +11,7 @@ inherit autotools gettext pkgconfig systemd
 
 DEPENDS += "iptables net-tools util-linux libmnl libnetfilter-conntrack"
 
-SRC_URI = "http://miniupnp.tuxfamily.org/files/download.php?file=${P}.tar.gz;downloadfilename=${P}.tar.gz \
+SRC_URI = "http://miniupnp.tuxfamily.org/files/download.php?file=${BP}.tar.gz;downloadfilename=${BP}.tar.gz \
            file://miniupnpd.service \
            file://0001-Add-OpenEmbedded-cross-compile-case.patch \
            "
-- 
2.7.4


