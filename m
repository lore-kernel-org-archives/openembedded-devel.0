Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7416377FC9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jul 2017 10:05:54 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id t72so1282854lff.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jul 2017 03:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rhb/ht+XapnfZfXIKB6wg4sBtFwrBubSvne9OwFrXYU=;
	b=JSlwbs2uBDH1Vk4RAJC0DCF0Dolh6/684S89hxQ3NHb3/wcJL9icpAEcjqW4e0q9hz
	NeBnWjbCHHY1h3QnRfCt30Z9V48c9dq5EXN3cKvyp9xpFgNMgx0Y4U4HW5pdHOjY7YDa
	sxJj6f+3bFT/+eS9Dxbido65DAp27RTGBIAnM5Bqa9JNXIMFXDHNUb2nN0vszP0F5pTN
	bx4RzS4yzNOoyTkPfMfAXkSWNCFlaEqBgT4GF2ieAOr5JsIYizyWdj3HyH+i1qyV2VBK
	0cZwD9BSiok619JgpT0bxXWyuZLPInzw+4CBTMXSta+DEwQI2/wMp2nkZvb3fqMNX6q9
	KkBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rhb/ht+XapnfZfXIKB6wg4sBtFwrBubSvne9OwFrXYU=;
	b=rgCPukuK8k1/xV1FR912i/7eirAsZwO25dWH+C7+eZJ0gBdme1m+zv+uAH2DTP00Se
	v5yNK4a8J9wBQXLwDungB8zhVY4ZDrA//C/LR5QZ7QNldod1DUEtQxFDKwkqVX/bYwYH
	MyrVrcTzDMRp2Imyg4X/8z1xjJNVirU+pmS6xL2V98l7R+TF+1WK/5Ww3oHqeSDSjEfF
	VpbP8OVpEhJvSJ9jh1QSeNpkH0sw6ZqAVntfzh7rZdCVNmcZfgTXzUWhegDIhJnaibft
	q2n8UtYmqeg/GHdd8JSBkezxKYZ+wR1jVkcqh2qRhN/lEPIIzldO/evqF4itmmifydx/
	EyOQ==
X-Gm-Message-State: AIVw110NUzZRo7FrW/6SCPh5cMsiZKtIP1rzyLmfgMOdoswuzcnXMi1p
	V/KxBf4J0V2o81BvQ8E=
X-Received: by 10.25.56.76 with SMTP id d12mr311218lfj.55.1500372355281;
	Tue, 18 Jul 2017 03:05:55 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id j12sm455132lfh.23.2017.07.18.03.05.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Jul 2017 03:05:54 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Jul 2017 12:05:39 +0200
Message-Id: <20170718100541.2916-2-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170718100541.2916-1-ricardo.ribalda@gmail.com>
References: <20170718100541.2916-1-ricardo.ribalda@gmail.com>
Subject: [meta-clang][PATCH] clang: Fix name of .so file
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
X-List-Received-Date: Tue, 18 Jul 2017 10:05:55 -0000

When we are building an unreleased version the so name is:

libLLVM-MAJOR.MINORsvn.so
instead of just
libLLVM-MAJOR.MINOR.so

E.g.:

libLLVM-5.0svn.so

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 recipes-devtools/clang/clang_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-devtools/clang/clang_git.bb b/recipes-devtools/clang/clang_git.bb
index 6c7de15c480b..6690966085d9 100644
--- a/recipes-devtools/clang/clang_git.bb
+++ b/recipes-devtools/clang/clang_git.bb
@@ -131,6 +131,7 @@ FILES_${PN} += "\
 
 FILES_${PN}-libllvm += "\
   ${libdir}/libLLVM-${MAJOR_VER}.${MINOR_VER}.so \
+  ${libdir}/libLLVM-${MAJOR_VER}.${MINOR_VER}svn.so \
 "
 
 FILES_${PN}-dev += "\
-- 
2.13.2


