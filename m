Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5746.1794975208303883317
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 20:13:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=grt6o7DR;
 spf=pass (domain: gmail.com, ip: 74.125.82.46, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1aefd1bf74aso337278c88.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 20:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794975208; x=1795580008; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8g3eXLCrape25dWSGiiVN9TL4L134NNMhZzjpnyLwn8=;
        b=grt6o7DRwORBrjdWntM3AezkOfnI/1CpWrGovedSwSpsccqY2Hv5Wp9J76pH7baPUT
         mDcvnKeiU1V2MM+Dr099rDj/vtNVdG5yTGLGV8pZZnFZ3flj+vqXBslL+mTUst/v0Ssi
         24oZXfUJLQwXNLYwshmIgz//6wnTodd6DQEaMBurwo9EvMQau/GQxE1/Ur8ztcZ6LjR3
         rmFM1u2okQeQeGznyQy1NeCUHs+tMP9UAu56JGt8QeD96tJQRpgsr8vwjqa+s9OFvVxo
         /zaEBlOrWOaB6J9IcekBWXGaJvy6ItmmBd28ELpsXIC1nJqw84udDC5apHkAtFXxPY0o
         hH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975208; x=1795580008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8g3eXLCrape25dWSGiiVN9TL4L134NNMhZzjpnyLwn8=;
        b=gfpeO8CLdNM8XFyWYh+dydKIHcql9hir6SwvXzj/PuxYj/l+crpXzVl+TNHjXbwK4L
         hxdMrYZpfNAmR5u21wykVUislvqNhzmL9bZFWRdEc746Nmq+a8nZQ4zTyBjp0rOU9NJx
         7SJLlVu8wJAAJDBDF7Ywt9eGyNiBqga8ebYdfJzhBn1TpcRHAQ9kmPLbrdC5qo+UO4CP
         Uh6oid2Rc8o0HhuvKYZD3RC0o2iZisgEYLxQ58ttuRjJW/qScTax67IKwcaekoKWzrzX
         x1yqO491xZmZ1A7T6phx8z2nZARiuCwemHsm8qkbgnZsZ18+g+GwygyAwkkX15TVCe0i
         O0nQ==
X-Gm-Message-State: APuU4Z9SxSrOixHXhBrIRRR3XDgIEXM8AT3vYLHzGWEtjbw4Y/Bif1Iu
	q1F58fEj2et+QPGGWGw/tO2R8xnaNgw1CDB/mvPL3LlSLFPQOanekzggMf98o106
X-Gm-Gg: AYBFou1tnUSZC0cZVBDq0rGlk0Agic/9xdJhea6XOZ+vgqqMh1H8HoKg4OdNtbeOelQ
	LXK3XdIdKY/czi9IP7b+8RUs+0ZD5ZOMaIy60+dX+LMyuToFM5P0+DH1sXugM4VXGIX4bu4kZrC
	nQyRH/YXLQC0oSqiGq/2IauiGdBpoqLWFZYfVTxHDUGLxIk/7IYxOLQL1U2dymKO9gbBJGkcUt0
	58+E3RvfRox2sfhml7Sm9SBQjL7hFxJ7dt+/E7Zki9IN+wQ5bb4xTWgHNXI+rFu2hAX3rhDmW1F
	7tKrCTaF1wvuWzVvIraxR8OcfyQ0RRnnLZ4nwUbqlE7L4V7K0nQZ1UYzMg9h+fMQ10t1qoQH1vw
	87e+dKk8ebq9kbroxDbPRX1oj7zGSQnDao4kH6GDmoWEPlquYbNEoL3ihMHuRK54xuKzNmwpxXK
	I+eImhhH1ZnV0iuH8cXy4NzEBJ1A5QWYaGRyb9KDJDQ+1ZswufLV1PklDL5jyLB7ttX4GbaKLQU
	RA8mk9EN4lqbuTv1RioKabhnDPYlEwnfBcWeSr07ff6WdVbidZ/toP3gFYKBJREkUIR8Fqb054x
	2sYYK+NgxY3pMH3i33lUhss1SsfS2xZRwHYdhRf8ZPQFOlVNEwOy1WaZANGHqQoP6hWPLrywgwh
	yjr4yGxu+3ChDiUUFUbE/9T0mQj+VLniuILbTEepH6AWc8oZfN6G2ufRji7KqGQ65XUjSJYmnL7
	mxtxlcDzK1bU3f0pb9zueU7PruCwGCNvUWx67DrrKZgXi44x1V3Hdx7YjTsSVqkNyFQ3rIzoRnW
	PCFjC8YaNCPAl1oJtPI+zmUI9UlRL4ZWwnTlySy2l+gckiTA/XLq/OJuMjQcouee/PaK9AbzyEn
	aER5
X-Received: by 2002:a05:7022:f907:b0:181:8948:f022 with SMTP id a92af1059eb24-1b543c02687mr1336862c88.21.1794975206602;
        Tue, 17 Nov 2026 20:13:26 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4eafsm2655742c88.14.2026.11.17.20.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:13:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 06/12] fdk-aac: Use SPDX FDK-AAC identifier
Date: Tue, 17 Nov 2026 20:13:11 -0800
Message-ID: <20261118041317.2287415-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118041317.2287415-1-khem.raj@oss.qualcomm.com>
References: <20261118041317.2287415-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 04:13:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132630
Content-Type: text/plain; charset="utf-8"

The layer-local Fraunhofer-FDK-AAC-Codec-Library-for-Android text only
differs from SPDX FDK-AAC in the copyright year, which SPDX matching
ignores. The xHE-AAC encoder license has no SPDX equivalent and keeps
its LicenseRef.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_3.0.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_3.0.0.bb b/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_3.0.0.bb
index 22fd88f9fc..0b29e64e7f 100644
--- a/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_3.0.0.bb
+++ b/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_3.0.0.bb
@@ -7,7 +7,7 @@ for digital audio."

 HOMEPAGE = "https://www.iis.fraunhofer.de/en/ff/amm/impl.html"

-LICENSE = "LicenseRef-Fraunhofer-FDK-AAC-Codec-Library-for-Android AND LicenseRef-Fraunhofer-FDK-xHE-AAC-Encoder-for-Android"
+LICENSE = "FDK-AAC AND LicenseRef-Fraunhofer-FDK-xHE-AAC-Encoder-for-Android"
 LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://NOTICE;md5=5985e1e12f4afa710d64ed7bfd291875 \
                     file://xhe-aac/NOTICE;md5=096ee69e4afc742d2f471c565d72ebb5"
@@ -24,5 +24,5 @@ inherit autotools
 PACKAGES =+ "libfdk-xhe-aac"
 FILES:libfdk-xhe-aac = "${libdir}/libfdk-xhe-aac${SOLIBS}"

-LICENSE:${PN} = "LicenseRef-Fraunhofer-FDK-AAC-Codec-Library-for-Android"
+LICENSE:${PN} = "FDK-AAC"
 LICENSE:libfdk-xhe-aac = "LicenseRef-Fraunhofer-FDK-xHE-AAC-Encoder-for-Android"
