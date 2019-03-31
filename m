Return-Path: <nizovn@gmail.com>
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
	[209.85.208.180])
	by mail.openembedded.org (Postfix) with ESMTP id DE6587D013
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Mar 2019 10:43:53 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id r24so5536707ljg.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Mar 2019 03:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=GNfDr/oobyah/Zi0lQzHSqsyQ+LBMrQc7J4h2BL+PMQ=;
	b=UclVykfF4qyOdb7gCeyCgh2W3YeTKhNOvD724H0IDtMtpLIK3CTz+QW/e4dYd4Eq/B
	Qfv0C4pwvo37nqIasM7tNDPd3v2iXp2Ij7CzU6adi+NmAU14DBwu33c7inxlCiRfYzUj
	JSUXUZwG5m+c/Jt02LMtwWKqlefkj5b9RjdeoVKhXe+oJ9w4TjR5hCToD4HYPYCUitUu
	gLzl2lRIG2kGv9aAxdgFvNedwQgAzZV9dc/MLf8j70m1rj7P3IF/x2DGN7QYhCiR9+sd
	4MltiA+M+gxKT8idMueZAXpLQiu8qYGm6ob1yQefMOHU2fdnoixJQYrjDYrqngbBENQM
	/WqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=GNfDr/oobyah/Zi0lQzHSqsyQ+LBMrQc7J4h2BL+PMQ=;
	b=TRgjRs1SY1KYCPEGZjhLotc4ljV9//KtdpUvlcpZKIiH8MpL0nT5IjaxEaYd23tn4d
	1q2jcGzOBwVxPI2Hx59FCl9kKbXEGG6/WvBt7YqJMHStVPArH0pFRs9hJTHSQ3rk1DWH
	eG0TzL28ZBBKxKYlRG76E1T8uO3OuhYmC1g9xbbixCyeb6TnVPtSC5zv3DTbG4r7qSM1
	KVGKw9hdPGv3kxpIy9HBqbSXyQ+nUJktzMau7WoobMd460Nwb33QNIZVZ2sAdcEE3bxb
	vb6/H0NRz/jOW33ZwsghgwEAdUpba0sbVXHbTZZaAIPC2euQmCA1koWc7P4cNXmjJKgr
	SZaA==
X-Gm-Message-State: APjAAAXqaecJnJbSDe1qIQAYlK6I93XpWPgs2loW7TTBBQ627eykWuTc
	uOYReYN+/26tJuVxd9pPDc1O1lCY
X-Google-Smtp-Source: APXvYqyi8xFFXA02vRpuXC92lBQZZLck9YL/ldDfmudriahTnilRYGO1ylINMLjfnufdM9WKTsbCdA==
X-Received: by 2002:a2e:950:: with SMTP id 77mr28788621ljj.113.1554029034333; 
	Sun, 31 Mar 2019 03:43:54 -0700 (PDT)
Received: from localhost.localdomain ([93.183.69.182])
	by smtp.gmail.com with ESMTPSA id u3sm1414010lju.51.2019.03.31.03.43.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Mar 2019 03:43:53 -0700 (PDT)
From: Nikolay Nizov <nizovn@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 31 Mar 2019 13:43:27 +0300
Message-Id: <20190331104327.28050-2-nizovn@gmail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190331104327.28050-1-nizovn@gmail.com>
References: <20190331104327.28050-1-nizovn@gmail.com>
MIME-Version: 1.0
Cc: Nikolay Nizov <nizovn@gmail.com>
Subject: [meta-oe][PATCH 2/2] android-tools-conf: Make sure /dev/pts/0 exists
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
X-List-Received-Date: Sun, 31 Mar 2019 10:43:54 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Nikolay Nizov <nizovn@gmail.com>
---
 .../android-tools/android-tools-conf/android-gadget-setup      | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf/android-gadget-setup b/meta-oe/recipes-devtools/android-tools/android-tools-conf/android-gadget-setup
index 0e04f7dbe..beca353e6 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools-conf/android-gadget-setup
+++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf/android-gadget-setup
@@ -1,5 +1,8 @@
 #!/bin/sh
 
+[ ! -e /dev/pts ] && mkdir -p /dev/pts
+[ ! -e /dev/pts/0 ] && mount devpts /dev/pts -t devpts
+
 # TODO enable the lines below once we have support for getprop
 # retrieve the product info from Android
 # manufacturer=$(getprop ro.product.manufacturer Android)
-- 
2.19.2


