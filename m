Received: from mailrelay3-2.pub.mailoutpod1-cph3.one.com (mailrelay3-2.pub.mailoutpod1-cph3.one.com [46.30.212.2])
 by mx.groups.io with SMTP id smtpd.web12.6468.1614061862280906252
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Feb 2021 22:31:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bsorensen.net header.s=20191106 header.b=t7NZRZZf;
 spf=none, err=permanent DNS error (domain: bsorensen.net, ip: 46.30.212.2, mailfrom: yocto@bsorensen.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bsorensen.net; s=20191106;
	h=content-transfer-encoding:content-type:mime-version:message-id:date:subject:
	 cc:to:from:from;
	bh=dktT7bEZWa6NF7VzlU3tntsiU6cQBjbLFJi6RuPvzeo=;
	b=t7NZRZZf1SATM2wxbwKfY2FrQCuXux0LzPIrqMDu6c3y6RzxUfaMVP8VZmk/iEh4zOpzh2b02w/dg
	 /VpuBpCRB5xBSJfIAOzmA0ZnOTc1SITtwsxV+SI/vSTo+JOHaeTjSKnQbhCtqWOpS60zsUeQ9DaquV
	 7WDfZrGZB70SR2KSbMa05vuToxcYkEpcEwHsCmi3uR8mEn0m+AuZU43wh22N6YL/8wZU4hpKByIvnI
	 +z8E0LBM5Z1yZtqY0TRSC/wRUsUPFoz4isNnJbQ3qP3mGbbxxdI1XMj64OOAgg42QxYGWG9PCZObF+
	 tXMB5YxxLt7DF/NVFI8UUJXK1sCCI6g==
X-HalOne-Cookie: 21501288d36895376e69204beeab10074b8b9628
X-HalOne-ID: b1545bfc-75a0-11eb-8ccc-d0431ea8bb03
Received: from localhost.localdomain (unknown [85.191.185.161])
	by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id b1545bfc-75a0-11eb-8ccc-d0431ea8bb03;
	Tue, 23 Feb 2021 06:30:59 +0000 (UTC)
From: =?UTF-8?B?Q2hyaXN0aWFuIEIuIFPDuHJlbnNlbg==?= <yocto@bsorensen.net>
To: openembedded-devel@lists.openembedded.org
Cc: chbs@prevas.dk,
	=?UTF-8?q?Christian=20Br=C3=A4uner=20S=C3=B8rensen?= <yocto@bsorensen.net>
Subject: [meta-oe][PATCH v3] libgpiod: packageqa problem => static python lib to ${PN}-staticdev
Date: Tue, 23 Feb 2021 07:30:58 +0100
Message-Id: <20210223063058.6740-1-yocto@bsorensen.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Problem:
QA Issue: non -staticdev package contains static .a library

Reason:
Both /usr/lib/python3.8/site-packages/gpiod.a and
/usr/lib/python3.8/site-packages/gpiod.so are in ${PN}-python.

Signed-off-by: Christian Bräuner Sørensen <yocto@bsorensen.net>
---
 meta-oe/recipes-support/libgpiod/libgpiod_1.6.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.2.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.2.bb
index e6b6476e2..c6c262b70 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.2.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.2.bb
@@ -31,7 +31,8 @@ FILES_${PN}-tools = "${bindir}/*"
 FILES_libgpiodcxx = "${libdir}/libgpiodcxx.so.*"
 
 PACKAGES =+ "${PN}-python"
-FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
+FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/*.so"
+FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/*.a"
 RRECOMMENDS_PYTHON = "${@bb.utils.contains('PACKAGECONFIG', 'python3', '${PN}-python', '',d)}"
 RRECOMMENDS_${PN}-python += "${RRECOMMENDS_PYTHON}"
 
-- 
2.25.1

