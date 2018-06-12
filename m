Return-Path: <brgl@bgdev.pl>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5528778F33
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 14:53:30 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id f16-v6so24430994wrm.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 07:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=x1hTkRGQwUV/eyQnyTyc/0JIBZnVfZFtYLg4VKBoOuo=;
	b=t4hxImGTo7xDBH5EZiu9yvDcGXsAPef8l7FlrpkD8B1DJwFOp6iaS53mGSs+OE7FNS
	UkkRSWDOc25/JtdY+5qQC2k7k3zOrJg4l1XSci7p3dlYdr2N7l3/d6arJ5bMCj3/7S1t
	vAbSsWBoxIwTP1ZjmoU2ywcdUHZl6/9FgZC9s/fvrJWuCNhw4W/bptlyPiAsojaE4X54
	Ex68MSKR3wydmSJKO67UhAsrOXZuqoCQwk1dn/LPOX8OaD/X0bWU4L0pCRS4rjukFymT
	o+0JzBsvOfvkwvYrGkpIX4pvZxwSIHgDRFdFgzNNm2N6CDuCSimfnXQI8x1Hf4NxoEfY
	vJpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=x1hTkRGQwUV/eyQnyTyc/0JIBZnVfZFtYLg4VKBoOuo=;
	b=AGCIyELSY74dCJq27qI6mY2BgBvmlQFzxXBtTjxLME3KRES5cxnpn6Vjmq7InSl4oQ
	TCWjN+UM2oqAUnaXnWA1tN8K7EOpndmkvbEddAT6uWNyE1ltw4sT5MAZsQUghzRaB4Wh
	St8MZj1cKsxCVPTsyANzW7tcmhMNLQ6N9G9J5/pJwSCVnHoxx/PLp3JmVeV8h++wDOMv
	qNOqnqYftq+FnctUu7O1EjqWfb3rvlM7LE64oG1GierGs5M63ZjKgSyOnwYiwwLZS00S
	3raeuWj8abAAtRM9n1yaIkSt0aZiWZ4So25UD1759eklyxeWStvbsGBZ3IGMvVniUZGq
	wO/g==
X-Gm-Message-State: APt69E0SJoPa8zT8iI+Tabs5sGWrrCMdPu/M//GDYNpPQN76ammQysa7
	2n14D5dIND93BudWb1kDnSAJug==
X-Google-Smtp-Source: ADUXVKJlnb93Eu2eKtvJ0SUpuHTQq2EITfqusdXnQnZG/XvKYckeHwQ9WdaDSO3hvp3bIUWzRCMy+w==
X-Received: by 2002:adf:a925:: with SMTP id
	u34-v6mr629752wrc.248.1528815211130; 
	Tue, 12 Jun 2018 07:53:31 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-NIC-1-84-58.w2-15.abo.wanadoo.fr.
	[2.15.173.58]) by smtp.gmail.com with ESMTPSA id
	d15-v6sm8598555wmb.0.2018.06.12.07.53.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Jun 2018 07:53:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Tue, 12 Jun 2018 16:53:23 +0200
Message-Id: <20180612145323.24136-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH] libgpiod: add packageconfig for C++ bindings
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
X-List-Received-Date: Tue, 12 Jun 2018 14:53:30 -0000

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 meta-oe/recipes-support/libgpiod/libgpiod_1.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.1.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.1.bb
index 1bda8bc3a..ab0bc980d 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.1.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.1.bb
@@ -5,6 +5,8 @@ DEPENDS += "autoconf-archive-native"
 SRC_URI[md5sum] = "80237a047a9d653a14c5d71e5ce9d641"
 SRC_URI[sha256sum] = "9758466468a7ef3f5e30c182c1303abef6241e665cda4d82a64328a7474838c1"
 
+PACKAGECONFIG[cxx] = "--enable-bindings-cxx,--disable-bindings-cxx"
+
 PACKAGECONFIG[python3] = "--enable-bindings-python,--disable-bindings-python,python3,python3-core"
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native', '', d)}
 
-- 
2.17.0


