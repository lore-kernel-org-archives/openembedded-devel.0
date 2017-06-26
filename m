Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9615C77E44
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 15:11:28 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id 77so146264636wrb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 08:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=VL/p60OBI+8rfm77hKCyQ9N/unt4vB/zmaXkBT1JSPo=;
	b=AFv7ADrBQs51jpldjaHC4Zy58hOl3ydefrpkW/RXXIt3eiaitc+ohxl09PcjVP65aP
	C8XxVZAnZBQEqF3Zq5Ogp6q28P0jPa5VgaP4b9RTj3X5IcZEYExapkk+SJlap74rfmaY
	uB5FXlTz6ijq+qj07foGmqUpgug/D2XU4+h33QpICn28+Sx5C098YrFNCRxQnodPUbLF
	91iVPgJn+aOS6/mltAx/7sbuwTvIp/Bgv0g6XFDQzB1U5WLoXcAnPELNf8ZJmrzIB3Wx
	gimKWq8DxAuADEUvPDF7gNrRlSNXSkuF6w/+ap91jueXR+sxM71tADr7wq9Pg6JNIkcc
	Weog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=VL/p60OBI+8rfm77hKCyQ9N/unt4vB/zmaXkBT1JSPo=;
	b=QOERpjTEmwZ0WaTTLueOC/TKAQPJuDIcRo0OxgZX/7W0AIN6Tc9p5trJZwAIsKivVw
	T3xTsCseXoY0kvhAOmNq+xXQ07obrinwF7wPa5djmVbR2eYYsBWhYmEOU0pSz/8pW5Uz
	hE9py/Yj/x5ZUcckbMtS5gjMw3sI16lMUhfBo3EBuaO6Xd3FsjC3z4OaQ8XD/Gc5D8IO
	5TGUybAAmhUqMJNssr6TtbzdLZkSmxFZSZReXFgYN3boOJpNWgi8zzSHg//71vVPWNNb
	bnqzocT9o81Wheej5X95C5xZMh1viCrJiO4LBwiPHcaeZgfizB57ibuWbdqVkUWjQu08
	PL7Q==
X-Gm-Message-State: AKS2vOxcNccPXxl8EICGsshfVDZeY/exEQK+psIrHPnb5u4/H0TKVyNa
	3PTZDSyjsV7tEQuFfXA=
X-Received: by 10.223.182.170 with SMTP id j42mr14504753wre.87.1498489889858; 
	Mon, 26 Jun 2017 08:11:29 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id d91sm368379wma.7.2017.06.26.08.11.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Jun 2017 08:11:29 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Jun 2017 16:11:11 +0100
Message-Id: <20170626151117.6221-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170626151117.6221-1-ross.burton@intel.com>
References: <20170626151117.6221-1-ross.burton@intel.com>
Subject: [meta-oe][PATCH 2/8] Revert "meson: fix build/host confusion for bbclass"
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
X-List-Received-Date: Mon, 26 Jun 2017 15:11:29 -0000

This patch was incorrect: meson and autotools (thus OE) don't have conflicting
terminology, and using HOST_* for the host_machine variables is correct.

This reverts commit 77eae90ef5ca3f9a4bdf5727a29713dd2b215165.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/classes/meson.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/classes/meson.bbclass b/meta-oe/classes/meson.bbclass
index cc9bc505b..72f96c541 100644
--- a/meta-oe/classes/meson.bbclass
+++ b/meta-oe/classes/meson.bbclass
@@ -67,9 +67,9 @@ cpp_args = [${@meson_array('MESON_C_ARGS', d)}]
 cpp_link_args = [${@meson_array('MESON_LINK_ARGS', d)}]
 
 [host_machine]
-system = '${BUILD_OS}'
-cpu_family = '${BUILD_ARCH}'
-cpu = '${BUILD_ARCH}'
+system = '${HOST_OS}'
+cpu_family = '${HOST_ARCH}'
+cpu = '${HOST_ARCH}'
 endian = '${MESON_HOST_ENDIAN}'
 
 [target_machine]
-- 
2.11.0


