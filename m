Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id CCD1378088
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jul 2017 10:06:00 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id w198so706597lff.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jul 2017 03:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ga++qS2FK3ryOI8tINjck3cpG8pzh3kBaZ2HNHm+bOw=;
	b=NpE2Ns79axOsQW+mTJ50MzaoNzIuUNeP9dgTXGGNH0OTxT41+9Dg3QmHKD4+e/WYIq
	r1CFmVsurdE/GDtkroYJv1IM/V5UUEHMzbE7qHfkgKoXeRt1MV9P8460a/M+/5ZIp3al
	n8MUUSDUJDHcDuyClkynyPXE4+PrnswR7DVJJkP9BPqJbbhO3LoHLSNoFy8cE78ms1FH
	Z+YRcD5L4TCHiOws98kv/gjA2VhclRgZNLTp4QPAOKIj3lvB6+44zQrjOM7hhsyvjB+Q
	zkciumxrd+rbefFNsiZTDfmXTIM6ANyKLjm084aNPG4Mn/2Z8/GQuhcRb5AVKzSubGKi
	hX/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ga++qS2FK3ryOI8tINjck3cpG8pzh3kBaZ2HNHm+bOw=;
	b=sEd7j8bgUyNghbfMRkRser7nMwaBU2uwqnht/TyOrCW03Sx9aGbmVglDF47JVzYxFr
	n+NaytHLb5Tez87nk3b6yZMarIMCCtsj2YZcFhyCWKOYTdWeayZRIhVqLR1srl58jjop
	/QIlGlTMijsLjOBfJaiUKOHYfLpja+L2iW0WzmGHrZcUZ7+U7P6lpu0E+KhqngaM9DYC
	POm3HQLKHk/qzROU3E302B8W6qk6pPTTMdENQtP8IxdtiPEGhKX/JIWlWrRYcQ4ELdUi
	dVecDUsbKYByaIBGtnIV/HCtLSz5JbYNs6MTTR3Z0cV34t1R0GkoMSBgACeBqUFjE/yO
	tlnQ==
X-Gm-Message-State: AIVw110k/gGaco5D2MHRFDQGMC5/fJb0qoaMVuOOoQnq2ge2Uxm9h9RF
	laVvt6b81PfF7ZjC0Tc=
X-Received: by 10.25.221.77 with SMTP id u74mr377868lfg.29.1500372361422;
	Tue, 18 Jul 2017 03:06:01 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id j12sm455132lfh.23.2017.07.18.03.06.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Jul 2017 03:06:00 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Jul 2017 12:05:41 +0200
Message-Id: <20170718100541.2916-4-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170718100541.2916-1-ricardo.ribalda@gmail.com>
References: <20170718100541.2916-1-ricardo.ribalda@gmail.com>
Subject: [meta-clang][PATCH] llvm-config: Fix implementation of --libs flag
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
X-List-Received-Date: Tue, 18 Jul 2017 10:06:02 -0000

llvm-config is called by mesa with the following parameters:

llvm-config --libs liba libb libc libd .....

This result in an invalid call of llvm config:

llvm-config --libs
llvm-config liba
llvm-config libb
llvm-config libc
....

Fix this use.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 recipes-devtools/clang/llvm-common/llvm-config | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-devtools/clang/llvm-common/llvm-config b/recipes-devtools/clang/llvm-common/llvm-config
index 9fb14cb74cdc..4462896af6e2 100644
--- a/recipes-devtools/clang/llvm-common/llvm-config
+++ b/recipes-devtools/clang/llvm-common/llvm-config
@@ -14,6 +14,10 @@ if [[ $# == 0 ]]; then
   exec "$NEXT_LLVM_CONFIG"
 fi
 
+if [[ $1 == "--libs" ]]; then
+  exec "$NEXT_LLVM_CONFIG" $@
+fi
+
 for arg in "$@"; do
   case "$arg" in
     --cppflags)
-- 
2.13.2


