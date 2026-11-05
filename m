Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32575.1793879732690984121
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 03:55:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=NAoKTcKk;
 spf=pass (domain: konsulko.com, ip: 209.85.128.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso16377925e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 03:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793879731; x=1794484531; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W/TsgsqJcRaqJ2dxbanmp7Yg8Yy0G1qV/9S7IKD1WgU=;
        b=NAoKTcKk0m5NDQmzWPPKeftmZEUX49pGwKjonCtNeLTvt8wLwk57+ZB5HzFFbo8Cqk
         mH/nLGAVdcJxkWryWJ9exxTbGJzTr5tMj6cE9TF2w8gcVJW91Emfu8yljMc+MMTDb3zC
         MR1MTgLQ1XI4IJvl7omTspsCJToEvnCRYzJ3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879731; x=1794484531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W/TsgsqJcRaqJ2dxbanmp7Yg8Yy0G1qV/9S7IKD1WgU=;
        b=Cd/5Ek3NmVMHdKeS20sAAR2o0oYju9PAs9DXl1HlIglstKrvBNYYejzGoFmO9ZCaPq
         dG2BuVb+gOPceY3tNJaz/Jj87SORZhB5QEmh40hgmhcj9UDw7dZuC+FoOYfusvI+33RZ
         0R3Nz8boXFb8INIqFZ3ESD+vLBbtzJ3oE00tcXNZ5Nbqd+ef8fZdGQ/kGDbybkE4Wdly
         Mw3q9GadET6ZIl9PqpEu7f2DC6hV8Z3KF2sZI2jHBixhsK8FwV0lswv9CB1maG0T0b9H
         Hkc3KVRo2H4NU0v23jo2j3BlIhzeMnOv62vf21hLE+aVmh31prn1eaTbn7WQWYJOpBj3
         B9MA==
X-Gm-Message-State: APuU4Z+vrt3GUjuF3QjRaUQd63D4YS0lnbA74rsgIaGDLVAGQFzfidiz
	UNIktZOuWbDGFgqYjvzt/Xf/eXwlxqrld3ZgWodZydIQWhKVSwBLeNacru46e4GCEkeeAk+Xt+K
	gRpMo
X-Gm-Gg: AYBFou1l9/BUFsk1qE1mGbYDS+vgr/CQUt+En3fMluBMS61FoQns6+4iN4ypzYIzKlW
	emTircHVvZ9wloQHW/fpaBWeC9mXrQldnEZbUarteriD6SVBV5WoPhA5TFmjz76x3/z1IKhU2To
	Lom1td3AAdqd+ef/gRTFQaKk/mgT2yuVdHGesmrLTH0ONf8y2fIGkp/MjAQpFlqbwDwKVj/ITUC
	WS1b5AdRxHUdkUB7/nC4Tt01UUs3gaaUq6gKtk4NMZONsGYPsoS+SqmfOrwH3df//dFokyXWH6Y
	KXF0ygPzD5aS/ksGzTzmE852bUAQKFmzxrckjPHtT8PwfYRYUQS1H8asblTwMCdu+tPUzCKAB60
	VaXS+V19+PqayXh7lEhqpwcNm9FtGKaJli+OSI/MWxGGqQxuJeEMWzZyXjdx6O7OGqbmE8awBY0
	c9vFaOnv0TYhPNwWpam7vNDbm9y6/l9c+UzmgOAiDo046HAdFCfUwN07Feq9Y3F4h0p0Na/9GZw
	nk0K35qpSn2Y32CZ4qIkBQU/HdIEBP6Q5LHCuOJLD+L4ppUEH3FeRRJ3aGvbkyovhaFWaYkGlG+
	ITc/SPIek/4x6ZtC4nzwS2f9lQQJA0xmNqGw5Dx+KzkIMrqbydcpZdDtTJkwMU8Ta5HWniZr+dn
	PDg5XuizPsDI0xkehsh3/aWwHwDxuTf7H1CaILtIEO8dNI5UzHIfkz5o=
X-Received: by 2002:a05:600c:1f93:b0:4a5:75d2:c104 with SMTP id 5b1f17b1804b1-4ac17ffa050mr432102895e9.22.1793879731020;
        Thu, 05 Nov 2026 03:55:31 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm173720995e9.3.2026.11.05.03.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:55:30 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 03/19] python3-cmd2: Upgrade 4.4.0 -> 4.4.1
Date: Thu,  5 Nov 2026 13:55:10 +0200
Message-ID: <20261105115526.634289-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105115526.634289-1-leon.anavi@konsulko.com>
References: <20261105115526.634289-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 11:55:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131903
Content-Type: text/plain; charset="utf-8"

Upgrade to release 4.4.1:

- Size the relay test's payload from the pipe capacity
- Publish releases from GitHub Actions with PyPI provenance

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-cmd2_4.4.0.bb => python3-cmd2_4.4.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_4.4.0.bb => python3-cmd2_4.4.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_4.4.0.bb b/meta-python/recipes-devtools/python/python3-cmd2_4.4.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-cmd2_4.4.0.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_4.4.1.bb
index 07fa8f46e8..e3e8d075e6 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_4.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_4.4.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f2a861642858e0858af9dd4e4716bae0"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "6655b92e0231a43f20eadb6fb9a1ad54f8b9c9e716b4ce493542044f0d3ca926"
+SRC_URI[sha256sum] = "e8ef3f9bf2fb8f72acddaf934b97c49d14c6ae2be7271c547b97593abdea6c1e"
 
 inherit pypi python_setuptools_build_meta python3native
 
-- 
2.47.3

