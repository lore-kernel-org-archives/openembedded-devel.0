Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 80CB97E2A4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 21:17:35 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id w1so142501ljw.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 14:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=A96yIa7j2eCBVLjOqc+QJiLaegAywL9HYVSYJGZI1RY=;
	b=B9SZXKHOjkJTcSQmUoI+Nzo4qoXtjw6Jd+jfSVtjWBYKie1wYZ7z5OtRDVkyUzJXJj
	Pb560SP1ksXtwpxGrb4m4crbo0PZAyPyeQpP9dGTNmMNXCMmJleuxpHnyHB6U6yH4Bf1
	7+4NYUwxQreaFMpG3siBpm5k/6OCX/FNMmjmy+lyh8EfYZfjiKojgLVeSHH/YPYYD88a
	mx1a6TuV+SCFpjrjzWN3Dzw0gT3ujSiP3yZZRqnkmeJq//KEtTYLW1upWldPxXBWW1Wc
	SajHw/+OCEnWXUt8HYai9ggmwW9LwBUOd1SZ+X1wHtOElGg81uaet9jMuZroJ44WLYe3
	JU4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=A96yIa7j2eCBVLjOqc+QJiLaegAywL9HYVSYJGZI1RY=;
	b=SUSAlQdeqJaZhFtB8FMusQ3YaN0UuTj9anI7NB2tpVGMgETqNaxpzEHmcNilYfMvaD
	knvwj6YgHKOqNPa2SF+dEE3i1/TvszEVhEsZeDOaC2OzwcSV7YclOagU830m2IMlZx1S
	Kf7BVz3HdfPmzR6qrpswfxh7hkxZ2Eu1X13PFbSF5qi5zneIjczSBLJeqfB0cojT6Jsn
	1+HoTmH+WxBDks6O1bWyKpI75qte+G495Q7kdiRN0zEHJiTR2Ex9V2elBAiqqXdifbxF
	xBapP/gByXM1QpJKsthoikoxhItMqwXWjSowNWJ8NNf59BZrZny2KeE4IiAQPDmjzsQE
	OI3w==
X-Gm-Message-State: APjAAAU67o2zzTzgpcSo+av/BLBOYXIeRu0Zm+lAddRe8cLLLRsC8OCA
	x2PFC5pPi2H+znUUGuwMF+f/6af7psk=
X-Google-Smtp-Source: APXvYqxbR8HKsPQ1RA+RxXlguO1GH9GDpOnf5yPMmg56UbpVnLCMkLExNA5InYujYItyFD3Qzkqp8A==
X-Received: by 2002:a2e:b0d0:: with SMTP id g16mr16660301ljl.132.1558473455753;
	Tue, 21 May 2019 14:17:35 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	v12sm4791757ljv.49.2019.05.21.14.17.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 May 2019 14:17:35 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 May 2019 23:17:33 +0200
Message-Id: <20190521211733.7103-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] mdns: update to 878.200.35
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
X-List-Received-Date: Tue, 21 May 2019 21:17:35 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../mdns/{mdns_765.50.9.bb => mdns_878.200.35.bb}          | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-protocols/mdns/{mdns_765.50.9.bb => mdns_878.200.35.bb} (92%)

diff --git a/meta-networking/recipes-protocols/mdns/mdns_765.50.9.bb b/meta-networking/recipes-protocols/mdns/mdns_878.200.35.bb
similarity index 92%
rename from meta-networking/recipes-protocols/mdns/mdns_765.50.9.bb
rename to meta-networking/recipes-protocols/mdns/mdns_878.200.35.bb
index 9a7152fcf..1bd17031a 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_765.50.9.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_878.200.35.bb
@@ -6,14 +6,13 @@ LIC_FILES_CHKSUM = "file://../LICENSE;md5=31c50371921e0fb731003bbc665f29bf"
 
 RPROVIDES_${PN} += "libdns_sd.so"
 
-SRC_URI = "http://opensource.apple.com/tarballs/mDNSResponder/mDNSResponder-${PV}.tar.gz \
+SRC_URI = "https://opensource.apple.com/tarballs/mDNSResponder/mDNSResponder-${PV}.tar.gz \
            file://build.patch;patchdir=.. \
            file://mdns.service \
            file://0001-nss_mdns-Do-not-include-nss.h-when-libc-glibc.patch;patchdir=.. \
            "
-
-SRC_URI[md5sum] = "4a6bc1628851002634ea3833a4dca317"
-SRC_URI[sha256sum] = "de61dd0034357aa50c60806726fb1f70fa8e953ff9cb62eccfb73efad10dba0a"
+SRC_URI[md5sum] = "e773f290a7d29f1072247985d6add2ff"
+SRC_URI[sha256sum] = "e777b4d7dbf5eb1552cb80090ad1ede319067ab6e45e3990d68aabf6e8b3f5a0"
 
 PARALLEL_MAKE = ""
 
-- 
2.17.1


