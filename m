Return-Path: <mats.dev.list@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id BF6A5770F4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Sep 2016 10:45:49 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id k12so461268lfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Sep 2016 03:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:subject:to:message-id:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=1gKBGwm/o25TrSlfXoxzTVTUpgdGL7Tx75nUv/FC77Y=;
	b=iiE1CTfj+fmue66LnLwbnipIiviHvwpaobxRkGhusqMLLVo8mJRQWcLVtZMvBYwSwR
	1OV/5y8vMFaDwcIIM7VmR4XkA6gIewwi+/SLwYsHJhqTT1n0KVKiqiydLLLC39v7f6Ml
	CV1szK30O1xOMK7NQyi7OIH7FcR33SXqkK4Bt1xlxJN6efwR3OfM28VBvWkP0mYtGbwT
	luk7ZdC0G/zqMQzX6pzrbzkVVSj5TkA2K+lfhq3X1HLjGxENIbxCpzMCU+1hbRDM3Q3f
	WJFE2HwUT2gYar3dOjaZf6FeS7dvxQxlUxPhOEtSmP7VG5P89YD985nXxtAJPkS+q6gL
	+Qcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:subject:to:message-id:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=1gKBGwm/o25TrSlfXoxzTVTUpgdGL7Tx75nUv/FC77Y=;
	b=Rj4AK7/zuhCadWqY4wie4tb/wrGQT/3i/cduycnm9zOglZJB7cyCH4NtKK5cR0+LbW
	7bybANuYGEL3ijkZAG7SZlhERnbPbl1qWdjOwLe/Yp8oE/wg0G0HuJA9ye3oW2S381Bw
	DOPSPRw6l9Y2DEEkbRRPN4gV65BRBwXMK0PgYraA0UxnlLuJFX9SUg2zo43qp6znzoRb
	x6idrWIXnt6jIvnnKSDI+7vwoQbhMbE/DF/ZK83kbI0GdPXDUHdDlLkgKbNoEtyJy5F1
	T9DZFdRko/2sXTbgzYH4UFfzMmjn+XNfGORgaApf0jyRQv9L8/D0BoKFkASwvAYPD+Wz
	qvaw==
X-Gm-Message-State: AE9vXwMO7XG9Ws/sPNi2/5Gy4CSaku0esz8KcWLyN2KebuK6DTo/0gbygvybltsZCsYhcA==
X-Received: by 10.25.24.91 with SMTP id o88mr757290lfi.81.1473849948669;
	Wed, 14 Sep 2016 03:45:48 -0700 (PDT)
Received: from [192.168.1.205] ([195.84.96.49])
	by smtp.gmail.com with ESMTPSA id
	l10sm4599381lfd.19.2016.09.14.03.45.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Sep 2016 03:45:48 -0700 (PDT)
From: Mats Karrman <mats.dev.list@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <17c49fd3-d0d9-d00f-69d9-07656bee9c00@gmail.com>
Date: Wed, 14 Sep 2016 12:45:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
Subject: [PATCH] libnl: Fix possible host contamination error
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
X-List-Received-Date: Wed, 14 Sep 2016 10:45:50 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

 From 975b7e64462a465449d367ff6a4e5240a59221d9 Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?Mats=20K=C3=A4rrman?= <mats@southpole.se>
Date: Wed, 14 Sep 2016 12:29:27 +0200
Subject: [PATCH] libnl: Fix possible host contamination error

---
  meta/recipes-support/libnl/libnl_3.2.28.bb | 4 ++++
  1 file changed, 4 insertions(+)

  Possibly a cannon to swat a fly but I get "WARNING: libnl-1_3.2.28-r0 
do_package_qa: QA Issue: libnl: /libnl-nf/usr/lib/libnl-nf-3.so.200.23.0 
is owned by uid 1001, which is the same as the user running bitbake. 
This may be due to host contamination [host-user-contaminated]"
  type errors on every file.

diff --git a/meta/recipes-support/libnl/libnl_3.2.28.bb 
b/meta/recipes-support/libnl/libnl_3.2.28.bb
index 26982f3..3fcfbc1 100644
--- a/meta/recipes-support/libnl/libnl_3.2.28.bb
+++ b/meta/recipes-support/libnl/libnl_3.2.28.bb
@@ -23,6 +23,10 @@ SRC_URI[sha256sum] = 
"cd608992c656e8f6e3ab6c1391b162a5a51c49336b9219f7f390e61fc5

  inherit autotools pkgconfig

+do_install_append() {
+    chown -R root:root ${D}
+}
+
  FILES_${PN} = "${libdir}/libnl-3.so.* \
                 ${libdir}/libnl.so.* \
                 ${sysconfdir}"
-- 
2.1.4



