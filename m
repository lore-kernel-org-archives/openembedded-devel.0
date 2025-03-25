Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22182C36005
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 12:26:22 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.64143.1742905577758342486
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 05:26:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OvrZv4hl;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso1101928866b.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 05:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742905576; x=1743510376; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G/HpLOH50D5iEyq+4pVgWna/g4qIXjNV0XudmCNS8t0=;
        b=OvrZv4hlcZmFus67rKVr95FPEROzvYCXvVRIRSucBX8k6ZAHKQXxStnxQz8eoQ0AFz
         upfpFpOd/gg8EzBJOIV2u1Z5g+28g7OmfwqjONg5fw5pxYEg/FONMFu73ng9YMTtikQe
         pfALwv4g7LT/mdOcBsoSrIW2XO9/Y8ybY6XX9pzmtiycWU3t36yGbmPDKXHbrVxGozMA
         2g3zqYADl3u3V8/PTmrEJJH85eDdPN49XiIBC33doesZwWlrj94Ce72/+CsKRXgipXQ5
         L02DC3vz9jPbB4ql/dnPfBMitxF+RYsn1z+Ej6fLnPV7eRGmGxkYAe1Gx1sjYmivb2Un
         8vMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742905576; x=1743510376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G/HpLOH50D5iEyq+4pVgWna/g4qIXjNV0XudmCNS8t0=;
        b=HeCK3QgxR/hT6spqgqBkEklVA0lnmMe9LMnDH6UOYa5jywVHy9T0hgSff98PUY3MQF
         zZR68T0pXtppgsu7eA+4cpjICsjpXHSqVhvjnfVz+Vnd3r9YSgvdhcxo7e27RyRo33I9
         4JVC6dmR6tPV/GpXUkGzyebS8XnX+p6OodYIvD0GB54HvM0RagF5G1x3KzYW5fjPZgqA
         VhWJ3jxAPNnyFtrLxpzzKPv+Xf/FIPpFp+dPPTaL6YKkani7AkRtZlxE53eKiDl3zj9o
         Gk5cPjVTz9i0uPjk3AoNgTJrRBJQlhnVA5hUS8AkhA+9djFpeass9tuP+2SAquoTjRFi
         6d9A==
X-Gm-Message-State: AOJu0YwcaGXNQEAcYr45dA248EcYsb7Wgxa7JgkB/YowIueoQAbNWdRi
	obkkR6RRv7ibMEvZhGgP0CB6AkGN8J9htWkNpf8RThzyQP06RrHZUu4Nb7NE
X-Gm-Gg: ASbGncvcNFdnpg9KcvJ+gb9LWWVNU+QqZ/msyJbIqbAysmd+6axTRIfcmXrxtv9owzQ
	9baZoMkf00iaJ/gROcjWlO6jYKGz1meIz7nF/1vplIIpS8+VJBRNnsqjSTCfbef4N6zJ9yJrVAz
	XYYSW+eZA5rJJQSj0bWahogrnFDfrCcz7nvaeQh0Jz8FFwtlEqUUmtzkeMVKutKWww+22D67NWh
	IgWxLqUFcf0gEbAsb4sqJVNqjZ0OXO92J9wNR6a6bRlsSrv209tawUvOzHpTXEu8JmSXT2eZZSN
	KkjmKeO6bib5HxRK4JsfAFi+70NDXSaxi5M7geZ64gROjiS4mpQl2q+29uExWRvlUKduTOA7dzB
	iNA==
X-Google-Smtp-Source: AGHT+IHGmsPLFeBCXS8ezNSk/qpFJd1E11r/pgXOpf5DkxsvCuoO9ibYG1X5FK2jSgeuMHsrdu/BEw==
X-Received: by 2002:a17:906:c105:b0:ac1:fab4:a83 with SMTP id a640c23a62f3a-ac3f22aec3fmr1570305266b.25.1742905575868;
        Tue, 25 Mar 2025 05:26:15 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac3efb6601bsm836951866b.88.2025.03.25.05.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 05:26:15 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 2/3] usb-modeswitch: fix build with gcc-15
Date: Tue, 25 Mar 2025 13:26:06 +0100
Message-ID: <20250325122608.1914030-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325122608.1914030-1-martin.jansa@gmail.com>
References: <20250325122608.1914030-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 12:26:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116273

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../0001-Fix-build-with-gcc-15.patch          | 51 +++++++++++++++++++
 .../usb-modeswitch/usb-modeswitch_2.6.1.bb    |  4 +-
 2 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/usb-modeswitch/usb-modeswitch/0001-Fix-build-with-gcc-15.patch

diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch/0001-Fix-build-with-gcc-15.patch b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch/0001-Fix-build-with-gcc-15.patch
new file mode 100644
index 0000000000..eb65beb686
--- /dev/null
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch/0001-Fix-build-with-gcc-15.patch
@@ -0,0 +1,51 @@
+From f497eef1f38bd79a96a13269f251f1413c54b790 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@gmail.com>
+Date: Tue, 25 Mar 2025 12:36:32 +0100
+Subject: [PATCH] Fix build with gcc-15
+
+* fixes:
+  http://errors.yoctoproject.org/Errors/Details/848747/
+
+usb_modeswitch.c: In function 'main':
+usb_modeswitch.c:573:28: error: too many arguments to function 'get_current_config_value'; expected 0, have 1
+  573 |         currentConfigVal = get_current_config_value(dev);
+      |                            ^~~~~~~~~~~~~~~~~~~~~~~~ ~~~
+In file included from usb_modeswitch.c:59:
+usb_modeswitch.h:55:5: note: declared here
+   55 | int get_current_config_value();
+      |     ^~~~~~~~~~~~~~~~~~~~~~~~
+usb_modeswitch.c:775:52: error: too many arguments to function 'get_current_config_value'; expected 0, have 1
+  775 |                                 currentConfigVal = get_current_config_value(dev);
+      |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~ ~~~
+usb_modeswitch.h:55:5: note: declared here
+   55 | int get_current_config_value();
+      |     ^~~~~~~~~~~~~~~~~~~~~~~~
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+Upstream-Status: Submitted [https://www.draisberghof.de/usb_modeswitch/bb/viewtopic.php?t=3122]
+---
+ usb_modeswitch.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/usb_modeswitch.c b/usb_modeswitch.c
+index 2d4c0aa..bfbcbfb 100644
+--- a/usb_modeswitch.c
++++ b/usb_modeswitch.c
+@@ -570,7 +570,7 @@ int main(int argc, char **argv)
+ 	/* Get current configuration of default device, note value if Configuration
+ 	 * parameter is set. Also sets active_config
+ 	 */
+-	currentConfigVal = get_current_config_value(dev);
++	currentConfigVal = get_current_config_value();
+ 	if (Configuration > -1) {
+ 		SHOW_PROGRESS(output,"Current configuration number is %d\n", currentConfigVal);
+ 	} else
+@@ -772,7 +772,7 @@ int main(int argc, char **argv)
+ 	if (Configuration > 0) {
+ 		if (currentConfigVal != Configuration) {
+ 			if (switchConfiguration()) {
+-				currentConfigVal = get_current_config_value(dev);
++				currentConfigVal = get_current_config_value();
+ 				if (currentConfigVal == Configuration) {
+ 					SHOW_PROGRESS(output,"The configuration was set successfully\n");
+ 				} else {
diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.1.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.1.bb
index cd3840feab..b6b720fe1e 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.1.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.6.1.bb
@@ -4,7 +4,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=091556bd6d0154cd4c2d17a1bfc7380a"
 
 DEPENDS = "libusb1"
 
-SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
+SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2 \
+    file://0001-Fix-build-with-gcc-15.patch \
+"
 SRC_URI[sha256sum] = "5195d9e136e52f658f19e9f93e4f982b1b67bffac197d0a455cd8c2cd245fa34"
 
 inherit pkgconfig systemd

