Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
	[209.85.208.176])
	by mail.openembedded.org (Postfix) with ESMTP id 88A007E7E5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Jun 2019 18:35:02 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id h10so9093924ljg.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Jun 2019 11:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=7+fHxC0VnDbrnPwTjfVRr6PeKrUk1lxOWn9LnFgP+GQ=;
	b=FtL8OdIvKeFLNrOz0YVFukcbaYCQdS6FrROIzfY/VVgiUQNSRugjSr3BBogxqGcPYp
	Wpvt966U0NK9iI0z0eXTaR41NXoV0NVYYrHjF1BGFXapMsPJrkBzIN0peG2LRLADjDDN
	fVV84Un6O9ZQYY4P4gdLhzgD4TO8Hiqvg4rBWv5p7IAamKVL9l9XBR+V8JnUaR66ekBt
	Y1sQTiWyTa1H4c6/FJnoNmm+zDHaAcKOEZZfdisQgsY/lAap+xFpFhI8v1XJh8ZG3D0Q
	va/Sd+lQauY64m6JILtBz/L2cQ2wv74ZH0EedHv7wlVfoZOGqRKE9ZfMYpy9+8uDwldA
	9WyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7+fHxC0VnDbrnPwTjfVRr6PeKrUk1lxOWn9LnFgP+GQ=;
	b=nKSMpU+G+ulnszbL9ak+uETFEGR0ZoS9St/ryXPzO2WqqCC7pX2Y8t77m6fwqx7w+J
	momBu+m0IxjHQUfdVchvl65eizfV8zmQdqXr+WbsudU2smLFDy1hsQALmzTt03uNrxcB
	fUR3Z+rDi5lQSebUkm+MLMTf/fdTT0g54zN1Nekpw4+sMeBx4BaYcMo7KR+jG2rh/I6+
	wKfcFQoF2GNBJPQ8cGx4xdwjHHnpaTMHfGikKuag/FvA9E2jsKKnknALjg5IhphMKCZW
	Vfmeepd4WQcOfmnXGFRcXUylN7BqenzSGBVWp2d5dinT4qFZQlsm8wC1bxoknvb5cFip
	f+SQ==
X-Gm-Message-State: APjAAAUevwdJm3PDFs8xaUaIN8KD3C5PRBBmOxoM9N5x0rW9i+lZYOzQ
	nPwy9AYR4wOkeB5vI5baWp6LGMGDvLs=
X-Google-Smtp-Source: APXvYqyHOhfXVi34iHlFGAs6+uaGeSXrAKYPyeWmeQn2XugXqvU+ClpTK2altrS0j73NM2Q2Y1QZmQ==
X-Received: by 2002:a2e:870f:: with SMTP id m15mr9368755lji.223.1561833302918; 
	Sat, 29 Jun 2019 11:35:02 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id 2sm1848943lju.52.2019.06.29.11.35.02
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 29 Jun 2019 11:35:02 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 29 Jun 2019 20:35:00 +0200
Message-Id: <20190629183500.30971-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] uftp: update to 4.9.11
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
X-List-Received-Date: Sat, 29 Jun 2019 18:35:03 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-support/uftp/{uftp_4.9.9.bb => uftp_4.9.11.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/uftp/{uftp_4.9.9.bb => uftp_4.9.11.bb} (77%)

diff --git a/meta-networking/recipes-support/uftp/uftp_4.9.9.bb b/meta-networking/recipes-support/uftp/uftp_4.9.11.bb
similarity index 77%
rename from meta-networking/recipes-support/uftp/uftp_4.9.9.bb
rename to meta-networking/recipes-support/uftp/uftp_4.9.11.bb
index a64d081cf..8b47bd16f 100644
--- a/meta-networking/recipes-support/uftp/uftp_4.9.9.bb
+++ b/meta-networking/recipes-support/uftp/uftp_4.9.11.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/uftp-multicast/files/source-tar/"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/uftp-multicast/source-tar/uftp-${PV}.tar.gz"
-SRC_URI[md5sum] = "154e2c82a33fd4999040f8836e2dca2c"
-SRC_URI[sha256sum] = "c04bc75a88fc3d57504269f260be4d0b1bc440508b5a5ca587df6c16b771aa48"
+SRC_URI[md5sum] = "c0bc86b3067825a3866de9ef80c7451a"
+SRC_URI[sha256sum] = "2ddc835a35f669d55df27ab6883ba19bb00bc8e4b66897ceaedb160b02246b1a"
 
 DEPENDS = "openssl"
 
-- 
2.17.1


