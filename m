Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id 59A267E27B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 05:23:37 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id d85so1273043pfd.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 22:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ogVOnVaFQznjK5NZM0EjXsUJrJeiz++pCk4dImsezO4=;
	b=c8PpgW7OGp4P3FvvhOh0oAqgPXywG/QihSLBU+1WS+TNPaW+IkSvbz3U85ErFp/hX4
	JcpilakmzEbI6Ai8A3Lz4YgUVucv4M2osVNSInuPp1aotat9XkoLWBMf/3m1scML51h3
	+tmSui/0GZQDrB5sn59TfJxZxGG/92DZCXB1uOEa2tAEQN0nnavhCceDycmYBt47v2d+
	36luoahlC3oH9UVOw5bEVaJiCBafbUU0n7LZwGYD3vDNaCe14ZVpFNFCtwRqyz1JEtFI
	JzKwonnwvyOxmobA+5dLCMJnrziLJknApM3KgDoi1qlfNGCjqytTZlQnUkvb2ZCD9T55
	S6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ogVOnVaFQznjK5NZM0EjXsUJrJeiz++pCk4dImsezO4=;
	b=FqYzmCCFOgkAEgNzWSTOwInanwxXO0GOj8goCGFLvX+Wf83UOntVNiTv9updRZ3rag
	st0rcQPKQxOBYCVNm1anB9HAcVC29z3fU+veFj9EKxWly8H2LTyo3xLr6zbSBLqMYBxc
	TFPNL9VL+VopW8kror4HutrwZPE+blqCPhTKbYJPy3sLr6oLVapK8eiYAIHG0ZXhuIyg
	GICVPRHwhduzZp3HDwtW5JJW2K3qHGPd/2QNHSu1BqNJmI2ZazWuu++/2gzOG7pVs1/0
	qDvhRPXM7QfEsBKL9wzTDTOAn0Pc31JdzR2CPo1Qc0TbG4oCR65+lZSZdI235QnxAQ/J
	jBfg==
X-Gm-Message-State: APjAAAX5iK45nI5nVDCrUeUnyu8tI3Mds1hVnFie2a3iXbmKQl9QdYNJ
	WnZ0ueJYU9xe9LYvKeCNdR5f05kPlBY=
X-Google-Smtp-Source: APXvYqwj5dxdP1CL7M4RlLWW4G5mGzEf5sTIXKEHnozZDN9rNhSxQ7zw+Qzbe+eS/v3wM/gPKWV5eQ==
X-Received: by 2002:aa7:984a:: with SMTP id n10mr9164228pfq.3.1567056217884;
	Wed, 28 Aug 2019 22:23:37 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	d18sm1398802pgi.40.2019.08.28.22.23.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 28 Aug 2019 22:23:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Aug 2019 22:23:24 -0700
Message-Id: <20190829052324.11614-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
Subject: [meta-multimedia][PATCH] ncmpc: Update to 0.34
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
X-List-Received-Date: Thu, 29 Aug 2019 05:23:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Needed to work with boost 1.70+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-multimedia/musicpd/{ncmpc_0.33.bb => ncmpc_0.34.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{ncmpc_0.33.bb => ncmpc_0.34.bb} (96%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.33.bb b/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.34.bb
similarity index 96%
rename from meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.33.bb
rename to meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.34.bb
index d4ebe1769a..0c99c7c698 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.33.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/ncmpc_0.34.bb
@@ -33,5 +33,5 @@ PACKAGECONFIG[chat_screen] = "-Dchat_screen=true,-Dchat_screen=false"
 SRC_URI = " \
     git://github.com/MusicPlayerDaemon/ncmpc \
 "
-SRCREV = "8e98f89ff07b140e6357dab2a9a9f6432ae0e521"
+SRCREV = "79cf9905355f25bc5cc6d5a05d2846d75342f554"
 S = "${WORKDIR}/git"
-- 
2.23.0


