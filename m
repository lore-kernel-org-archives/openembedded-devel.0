Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id AF0D574FCB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 08:18:11 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id f1-v6so7184183pgq.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 01:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XtpoRPT1Cbfu1NS9NJRS8bJR06RtuqLZPyTdxOwTOEE=;
	b=lf77Z9HjZY4rvZ6plNLYUDj+6mYBK9XryKI2hTapFEEkcbxcI0n+LhZzUwHjq7reBj
	InCSxMWB9Nnv9auJlk2JVDSVCto/WZz+3uWhOPbY7Sc/PCNOFM55CpccouT7HUfwGEb7
	OIjxPwP0LXmPsp2XbJ7glmlzH4GkVFRP9dxWck5HvvjFlNU7BYfwNBRg+poH4iBrBM5G
	ORhIQnY9Xx4ijVtaHcwhCNTOuNuEi4dL3+tviqFpq/iPSB92XkESX4nsYxaqMI35HWUE
	awjKTASljloVpSqT1TgO7ilcoSlCwJB/1JxtdQnNGpGMB7YSYl6gaXveWSFVHzJng6K7
	08mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XtpoRPT1Cbfu1NS9NJRS8bJR06RtuqLZPyTdxOwTOEE=;
	b=UGs0TwvI7YmVlhd/iKdzzXTVFEb+Ah6p3K34Y/g60+s2YvjSst/9gyFVw2sSgmtCw4
	xskF6urbqiIm2FJk6K4QnUw4rAU6Iom22se7h4kiSrm0QPT4uGOANduZsfyAI4dIsFcl
	G6jypgK2ckYm69AyMgHMCv3XhYu5GkE5QnLdiXrWKGNY7k0Etuj8LAEr9a61SXLaFHUS
	U7kI/pApEXl2WUbMilw/aiIV5sC5kuNjMZmabJ4XFL4fcggRZB0X4BFJFtJa6eW2bmj5
	ySQDDk7aX13QHFzi8ZwEkO6dWQzfnjb85B7etFBQELLBqnIJdRrkGGkEslmI/wRvHYtd
	0tug==
X-Gm-Message-State: AOUpUlG1lyv1+N1zlDgGnzZUQH2mnTqfDXB42SA4DDDhIczQGbmH1knp
	KJuCgztrW2QR636+Zi/AWo94OE2M
X-Google-Smtp-Source: AA+uWPyMHT4voTsNSvpZ4qBa2Jph7W+DjkJAlgvX/RouScfE71cyr9yRPn1rcQm9Ceh6jmNfDRpkvg==
X-Received: by 2002:a62:404e:: with SMTP id
	n75-v6mr17936664pfa.232.1534148292292; 
	Mon, 13 Aug 2018 01:18:12 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f217])
	by smtp.gmail.com with ESMTPSA id
	b64-v6sm23414971pfg.66.2018.08.13.01.18.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 01:18:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Aug 2018 01:17:38 -0700
Message-Id: <20180813081742.6961-17-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180813081742.6961-1-raj.khem@gmail.com>
References: <20180813081742.6961-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 17/21] owfs: Add dep on virtual/crypt
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
X-List-Received-Date: Mon, 13 Aug 2018 08:18:11 -0000

libcrypt is independent from glibc now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-protocols/radiusclient-ng/radiusclient-ng_0.5.6.bb  | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng_0.5.6.bb b/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng_0.5.6.bb
index 95faa65b1e..780423f0f0 100644
--- a/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng_0.5.6.bb
+++ b/meta-networking/recipes-protocols/radiusclient-ng/radiusclient-ng_0.5.6.bb
@@ -17,6 +17,8 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=3e47566c9271b786693d8a08792dbf41"
 
 inherit autotools-brokensep
 
+DEPENDS += "virtual/crypt"
+
 EXTRA_OECONF += "--disable-static"
 
 do_configure_prepend () {
-- 
2.18.0


