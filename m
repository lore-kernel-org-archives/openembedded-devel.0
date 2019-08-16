Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 306C97D2FD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2019 08:53:20 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id p77so2716405wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2019 01:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=S7xnFP+qeyr9QRTYNVqsdEowRcX5IaVFMa5J3lu+9Pg=;
	b=X5bRKrK2Ubx0TIbVPlSDgFwlDpCI3hGq2l7yxK15hXgdkKn2dgD3hPR3g5eO1DWAlY
	tSNYwxpX4RmuFrt8ELHlZ8G4w45WrA4Rm4/5VPx0+L9fiIm2f25aoW2NlhnYiJqr1lWI
	YD7Sj69Ney9mOpBZY/HfvDEWBWwFPNQr7qQ/tNjQDrs4cK5Xn7zWx6A8KUpbHFws/HZs
	H5uItwB+x0mfNRXvcMyiUK3frpAIphWcWpWlQrpAYZDX0iIuTkZ189XRdx5oZzbFW5qg
	dD0C+tt3HJbb+TaR/ER+lT2LVhUvpgbiNX+7Zai2pfLjQCWVabvNxR3DcWDK7FJ5TktA
	T6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=S7xnFP+qeyr9QRTYNVqsdEowRcX5IaVFMa5J3lu+9Pg=;
	b=S1Uh0HpcLdZOBTNsTauXY/+I5wU7H6vrLyGicV/itduuy9HUcnTBUSZySq3ngRe1Pu
	MW00uozJjBojjZQIe5rL5QNOnAuHsgxa+wWluMaUrr8tu5DPE8SFjHg6z6mphFFzZHG6
	uYUx8sh5ih2Y99wAKkW+VcGiDCHg7uEjaAyJam0dmuxcWrURsiwulNEmZPVMYCWJgyCI
	YWiDc5rrrUwf1RzTGD5K98M/k4WW/xCFRe91LD9ruJ178yHnKOyucKKFYUrS6ZQ7h3M2
	Rb2uOp2nuiHqfZeIkJcMe35/4YR5+ZdJw9xISXUsvY2F4B496ybqXaWFMrbTzZt1vRPp
	7+Zg==
X-Gm-Message-State: APjAAAX9N6YnqSKZKksMBiqozrRiy1LjT4GE3G1VKF9llJ5hFutPp/Kd
	nlxjrTE0fa9cke2QGA7kND2OVLmxFJk=
X-Google-Smtp-Source: APXvYqx+nyVmVRlFkhbpflqCH4p/j0WahD5SGauFI2isDrAwpighglXUQaMQf8Btahtt3N1DeDVBhQ==
X-Received: by 2002:a1c:e90d:: with SMTP id q13mr6443672wmc.89.1565945600482; 
	Fri, 16 Aug 2019 01:53:20 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	d16sm6650430wrj.47.2019.08.16.01.53.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 16 Aug 2019 01:53:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Aug 2019 08:53:23 +0000
Message-Id: <20190816085323.2700796-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190816085323.2700796-1-Martin.Jansa@gmail.com>
References: <20190816085323.2700796-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] iotop: add runtime dependency on python-core
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
X-List-Received-Date: Fri, 16 Aug 2019 08:53:20 -0000

* fixes:
  ERROR: QA Issue: /usr/sbin/iotop contained in package iotop requires
  /usr/bin/python, but no providers found in RDEPENDS_iotop? [file-rdeps]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/iotop/iotop_0.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/iotop/iotop_0.6.bb b/meta-oe/recipes-extended/iotop/iotop_0.6.bb
index 94643cd24c..b01d7f64e6 100644
--- a/meta-oe/recipes-extended/iotop/iotop_0.6.bb
+++ b/meta-oe/recipes-extended/iotop/iotop_0.6.bb
@@ -24,4 +24,4 @@ do_install_append() {
 
 RDEPENDS_${PN} = "python-curses python-textutils \
                   python-codecs python-ctypes python-pprint \
-                  python-shell python-subprocess"
+                  python-shell python-subprocess python-core"
-- 
2.17.1


