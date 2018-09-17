Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 64C1C7953E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 22:41:15 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id b19-v6so329496wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 15:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=u2jnmZIVrZxCNUTAGtiIE9SgeN+1cm9LLtFFPMxkxKg=;
	b=JNWBnaUcchiKb5l+RiktNq96I/9dNuQi5DY8IRKeIrn5BxV+loFuvl3488f+9M5G07
	Fo1gyNFPUXdiZmiPW2exEph5/YDHST1oi1YQik1NaU6bOr0uSroqTIbALym0maxsrBQU
	mqBim1rws9cwIaq7kEHLUfiRueAUbiJhmvL71kZLfCA4LvWITG0uB+lHWO6EMn25lUbp
	eFU3BmXe/fuOcsj8asWFZ4Ihv+J3Gy6cwJY8bEGBLpeFsn/XjWjbMW7cRj1he4oPF7j4
	4iwil346cJy8n9+mxZOoORQigTQ62+UL0cOBA4fuKT96vpMrlXKWgkZxrMP2IoHp0wId
	whQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=u2jnmZIVrZxCNUTAGtiIE9SgeN+1cm9LLtFFPMxkxKg=;
	b=FFNf3BJB2vMT22lktnTikYzaBCSw81fFPaGtmKoKFYZ0FeDGYLSN98er1ne9t9Un2a
	f15NQYiv6zEA5MQIo7ExzKsJatY0/9vxrl++byURVrrT8K34KqpohIheX13OZ+EmqWLG
	15oDNvuccGyStK68RqzxaztqyW4tyAyG6aA9Ycr/hy4KlIvNh/lpT836kipXFzkhi74k
	SVGR0aya0O1Mxlj486xsBjVP5lcYrXO3REmYF+/TIn7D3LWYZObagKgz3KRQuSMr2/vp
	wU3NOX/ShTY0f+bQ1c75K3wrqdwhOey6DznIMy/WeLdcE+MaU0JfGrSN07GzZVCrEkWm
	1AAA==
X-Gm-Message-State: APzg51BytQb7hzORiBFG+XR1DzpH+omb/pPK+Ptum3+Owsxw4PpRcsU8
	v8771/j49ftRkb+SSaMhyPkIt4bR
X-Google-Smtp-Source: ANB0VdZbYfrkID2gt9cE8NW4CqOuutTmuTualGefxsNf4/6QgLHzJaGsf99Vf4/EGU8Wq62ogMFlvA==
X-Received: by 2002:a1c:8587:: with SMTP id
	h129-v6mr13361481wmd.105.1537224074664; 
	Mon, 17 Sep 2018 15:41:14 -0700 (PDT)
Received: from localhost.localdomain
	(host215-117-dynamic.54-82-r.retail.telecomitalia.it.
	[82.54.117.215]) by smtp.gmail.com with ESMTPSA id
	d1-v6sm32892499wrc.52.2018.09.17.15.41.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 17 Sep 2018 15:41:13 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2018 00:41:10 +0200
Message-Id: <1537224070-22084-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-initramfs][PATCH] klibc-static-utils: fix textrel, disable security flags for the static utils
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
X-List-Received-Date: Mon, 17 Sep 2018 22:41:15 -0000

Fix
WARNING: klibc-static-utils-2.0.4-r0 do_package_qa:
 QA Issue: ELF binary 'X' has relocations in .text [textrel]

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.4.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.4.bb b/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.4.bb
index c835fd6..35e17b2 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.4.bb
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.4.bb
@@ -10,3 +10,7 @@ KLIBC_UTILS_PKGNAME = "klibc-static-utils"
 
 require klibc-utils.inc
 require klibc.inc
+
+# avoid textrel if linking with -pie
+SECURITY_CFLAGS = ""
+SECURITY_LDFLAGS = ""
-- 
2.7.4


