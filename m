Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id ED76D7F111
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jul 2019 16:01:20 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id y17so27394422ljk.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jul 2019 09:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=KRSZHBVBxpwDjSu5JGeyXY3GU4BXuFu9FD7fZirHmVc=;
	b=GDeotTsUDbyxXlUKmb3+heMEYD6L8LybE53/AsixPmKYyrCa+Aos4nuNaeod1wCm5h
	4X/LcjhF1ZDh2ENC3LSB8Ls2SUdnBhMQa3XmyVL8jrrYefivQjFWjTYZISt8COWPWpv9
	fqZkgVK5Up+wcuCEQL82RShXZ/13Kd8vUViMn/CtQl7wlMGpw5roUUkIYAaeJP/cmgtS
	Y/LaK2c8iWRNjZsMdFYGahmlJp8c0TK3EaMlslQ9G1+ErrE5C9bJNer77Zp31wRSM/Z4
	CUBpUO6Y7JKKykqC1FtJKkMFUyiT7QhUMpKlD47uHaswDOO2qre1i0IoLj/rjYl8ReH/
	wHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KRSZHBVBxpwDjSu5JGeyXY3GU4BXuFu9FD7fZirHmVc=;
	b=eUR95mgUX4/TJLommRlQAY5m9LGMKezQYdit1HC5YEJmYiJ0D2rAf4VrsJ+sYGvtp1
	ervNUIgYgMhvRElUWUOUMiNfkeze33OZlpPTI3sdkNDnqnhU/cTWTlCY6MuJg9UJ4AI0
	WsNUsZSfHwUfccgRT5AVMrvForGoLwUSx5GE3wTs4DrtNuqbkT6/lUgGRrRwvt3l3GXt
	vx8NP0k4nCSaMR+oTFXmoc7oLD6GSCeTB6nGStJ5/nfo561xHEyRpMq4Oj4LfMfbEqND
	2mfxezilmLk0CHFoW3ySyVYeG2ZWA5qnicpNrb26SJ9iWb8/X3eqc9D/yHtfuTuosgJE
	aL/A==
X-Gm-Message-State: APjAAAWtzsJPSENLF5dqiKLE9kqQlI5F8zmEojgdv+5cx+R3n7izMx1/
	Bm8/LDl+bCNkoQPS+K8qk/RvlwB4
X-Google-Smtp-Source: APXvYqxEWC4YnXo3Re0h4j36PxMXyajtMFyBCklPu3yKz0H+1bLwa6QqntM0UImlMX+ZHLmOPjfLlA==
X-Received: by 2002:a2e:870f:: with SMTP id m15mr50197738lji.223.1564156880030;
	Fri, 26 Jul 2019 09:01:20 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	r68sm8475621lff.52.2019.07.26.09.01.17
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 26 Jul 2019 09:01:18 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jul 2019 18:01:14 +0200
Message-Id: <20190726160114.13709-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking]] dhcpcd: update to 8.0.1
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
X-List-Received-Date: Fri, 26 Jul 2019 16:01:22 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../dhcpcd/{dhcpcd_7.2.3.bb => dhcpcd_8.0.1.bb}           | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-connectivity/dhcpcd/{dhcpcd_7.2.3.bb => dhcpcd_8.0.1.bb} (78%)

diff --git a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.2.3.bb b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.0.1.bb
similarity index 78%
rename from meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.2.3.bb
rename to meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.0.1.bb
index 161810a2c..6438daea7 100644
--- a/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_7.2.3.bb
+++ b/meta-networking/recipes-connectivity/dhcpcd/dhcpcd_8.0.1.bb
@@ -9,10 +9,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0531457992a97ecebc6975914a874a9d"
 
 UPSTREAM_CHECK_URI = "https://roy.marples.name/downloads/dhcpcd/"
 
-SRC_URI = "http://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI += "file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch"
-SRC_URI[md5sum] = "b7aade2cc47afa6d645f798103365402"
-SRC_URI[sha256sum] = "74ab38177548abe968c2abacefffdd97b573acaedd4f77b6c0a54ae38f68566e"
+SRC_URI = "http://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz \
+           file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch"
+SRC_URI[md5sum] = "b9c3b3a116f1abafc346f80cb511f8c1"
+SRC_URI[sha256sum] = "031f4fbef5ad41b44714fec343ff5be898e3e3cd5e7c53d6ef3aaec43cdba931"
 
 inherit pkgconfig autotools-brokensep
 
-- 
2.17.1


