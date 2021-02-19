Received: from mailrelay4-2.pub.mailoutpod1-cph3.one.com (mailrelay4-2.pub.mailoutpod1-cph3.one.com [46.30.212.3])
 by mx.groups.io with SMTP id smtpd.web12.6064.1613724753840078545
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Feb 2021 00:52:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bsorensen.net header.s=20191106 header.b=OidgWcN+;
 spf=none, err=permanent DNS error (domain: bsorensen.net, ip: 46.30.212.3, mailfrom: yocto@bsorensen.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bsorensen.net; s=20191106;
	h=content-transfer-encoding:content-type:mime-version:message-id:date:subject:
	 cc:to:from:from;
	bh=qR5+8RLglUKAMByJJ1f0aX6+hjom7qRxAUfV0vqGLKs=;
	b=OidgWcN+E4XKM1IeRNVgZ1p1pTd76W7RegyTMQSjh3CYmMkreK7slwrDqkOUaciZWlLTc8OqcfNAX
	 HSt2wOFvZm4QEyUajKD+0LEI13q3dnntG4pWD7s86eTRzApmIFWaol2OEPel6isrv9lU4d85SnuFvF
	 aBSoatvzSy3TRWaW8iES0Al5rVAJLxsRwdEWDMtS/1UHlw5XcoF8BE6uaMYEDd5UN3PQZh0jai9gaA
	 +iZQXqGNygQbHwTKXz7TU58wtd2NMH07alulthJeftNKzL7M80ESvaWrwBasxwsLFl1fe9uNFWernf
	 TUFAqSFvazUmm0+95673/Hk0lDtnytA==
X-HalOne-Cookie: 941f66238942926dff30914703d4a97311140ff6
X-HalOne-ID: cd1ed163-728f-11eb-a8f0-d0431ea8bb10
Received: from localhost.localdomain (unknown [85.191.185.161])
	by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id cd1ed163-728f-11eb-a8f0-d0431ea8bb10;
	Fri, 19 Feb 2021 08:52:31 +0000 (UTC)
From: =?UTF-8?B?Q2hyaXN0aWFuIEIuIFPDuHJlbnNlbg==?= <yocto@bsorensen.net>
To: openembedded-devel@lists.openembedded.org
Cc: chbs@prevas.dk,
	=?UTF-8?q?Christian=20Br=C3=A4uner=20S=C3=B8rensen?= <yocto@bsorensen.net>
Subject: "[meta-oe][PATCH] libgpiod: packageqa problem => static python lib to ${PN}-python-staticdev
Date: Fri, 19 Feb 2021 09:52:29 +0100
Message-Id: <20210219085229.25707-1-yocto@bsorensen.net>
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
 meta-oe/recipes-support/libgpiod/libgpiod_1.4.5.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.4.5.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.4.5.bb
index aec50e7e6..ab9639fc2 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.4.5.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.4.5.bb
@@ -27,7 +27,8 @@ PACKAGES =+ "${PN}-tools libgpiodcxx"
 FILES_${PN}-tools = "${bindir}/*"
 FILES_libgpiodcxx = "${libdir}/libgpiodcxx.so.*"
 
-PACKAGES =+ "${PN}-python"
-FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
+PACKAGES =+ "${PN}-python ${PN}-python-staticdev"
+FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/*.so"
+FILES_${PN}-python-staticdev = "${PYTHON_SITEPACKAGES_DIR}/*.a"
 RRECOMMENDS_PYTHON = "${@bb.utils.contains('PACKAGECONFIG', 'python3', '${PN}-python', '',d)}"
 RRECOMMENDS_${PN}-python += "${RRECOMMENDS_PYTHON}"
-- 
2.25.1

