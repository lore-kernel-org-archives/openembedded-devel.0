Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.2518.1622059182476613025
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 12:59:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GO59WR3Y;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: nishaparrakat@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id p7so2345067wru.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 May 2021 12:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=lY2qGVpk27abpysB3yKhnTDM+lIaOyT1JTSbMW6iXrY=;
        b=GO59WR3Yxk7UzGf9dGSyvauBPdDdQSy+dRPyIwzEnHd3SIvfb2KvDKhdYRIQpi+g8R
         9iUKlDvSWvl+OefmURZw8d3oFWXA8iYFdJ6D9oRKErUkGjdYfW8EGB4OKvqp1GbG9cZT
         En9DhDIPQVP7yHaGN+1PMbkSQZSf4KiAyfYYLsxIWk2ZShuO2Cp3t91MNC8cO9We0b56
         L3YZBMzHvZZdB1CC9xEQb7h6KEMS6N9kbhB5i2gkkJyRtJqQyX/yIhxipFwzZJp/kd7P
         IRwLZ96Joit3w1fnXZRF74iFhweKJIbaD3Yqg3EnnUTZ3jJNFXqXr015adM0wGhn0Ykv
         b+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=lY2qGVpk27abpysB3yKhnTDM+lIaOyT1JTSbMW6iXrY=;
        b=CiYADRkRw9M3NSRbDaaqYQWzhQc0u/7t5WcFXRRTxmgTq/erHTLZOy19bppH4/9dt9
         7ARsKJ12F8/n1V879do11fbtT6sjYsDfBXiF2wVjF5xcEDvb6i2aB1eM/vGGrvMH7YYe
         rytTxO4Vafz7DxZWJ/tCwdGDxVOvq8qZiYfkE51iWUvl6m26zVgLLEnQwQyjJuj5an8U
         tsCR6lGY7ZH9yEAbKPXHSIGumBkOk5hPGjDdliWHZIWqIdzbg9eEdnkm8hP26jSIU/9f
         rj8zckj8X6xSB8Jo1/2FfUE9xCeS2Ia6sOomiHJC3YLuol4NAz3sG2aNyz2X+deF9TfN
         rVBw==
X-Gm-Message-State: AOAM533SGU49yma/9jdGc7iK55a5g3CD+eAkmjpGR9qyhmycfscvgCVX
	RaZzSg82da6qPVgZJECPBfEl7ubOBEkfQHL3UsW9sH2E
X-Google-Smtp-Source: ABdhPJxKelv+aVcbnG0+gbc0kXZ9YbbCWdv+lzVKw045CXfdttjB/ascKYz7bXfh8laqKwc46Jr8Sw==
X-Received: by 2002:a05:6000:43:: with SMTP id k3mr34768275wrx.222.1622059180761;
        Wed, 26 May 2021 12:59:40 -0700 (PDT)
Return-Path: <nishaparrakat@gmail.com>
Received: from bsys_traas.speedport.ip (p200300c00f3bb0593a22e2fffe1aa816.dip0.t-ipconnect.de. [2003:c0:f3b:b059:3a22:e2ff:fe1a:a816])
        by smtp.gmail.com with ESMTPSA id y2sm8852895wmq.45.2021.05.26.12.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 12:59:40 -0700 (PDT)
From: "Nisha Parrakat" <nishaparrakat@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>
Subject: [meta-oe][master][PATCH 1/2] p7zip: build and package lib7z.so needed for fastboot
Date: Wed, 26 May 2021 19:59:28 +0000
Message-Id: <20210526195929.26047-1-nishaparrakat@gmail.com>
X-Mailer: git-send-email 2.17.1

a) use option 7z to build the lib7z.so library
This is needed for android-tools for building fastboot
from android-tools

b) Packaged the lib7z.so and codec libraries as a part of this recipe
Fastboot RDepends on it lib7z.so

c) Fixed a C++17 forbidden error when lib7z.so is built

fixes the below error

| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp: In member function 'virtual LONG NArchive::NWim::CHandler::GetArchiveProperty(PROPID, PROPVARIANT*)':
| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:308:11: error: use of an operand of type 'bool' in 'operator++' is forbidden in C++17
|   308 |           numMethods++;
|       |           ^~~~~~~~~~
| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:318:9: error: use of an operand of type 'bool' in 'operator++' is forbidden in C++17
|   318 |         numMethods++;

Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
Signed-off-by: Nisha Parrakat <nishaparrakat@gmail.com>
---
 ...nge_numMethods_from_bool_to_unsigned.patch | 25 +++++++++++++++++++
 meta-oe/recipes-extended/p7zip/p7zip_16.02.bb | 21 ++++++++++++++--
 2 files changed, 44 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool_to_unsigned.patch

diff --git a/meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool_to_unsigned.patch b/meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool_to_unsigned.patch
new file mode 100644
index 000000000..edde52593
--- /dev/null
+++ b/meta-oe/recipes-extended/p7zip/files/change_numMethods_from_bool_to_unsigned.patch
@@ -0,0 +1,25 @@
+fixes the below error
+
+| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp: In member function 'virtual LONG NArchive::NWim::CHandler::GetArchiveProperty(PROPID, PROPVARIANT*)':
+| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:308:11: error: use of an operand of type 'bool' in 'operator++' is forbidden in C++17
+|   308 |           numMethods++;
+|       |           ^~~~~~~~~~
+| ../../../../CPP/7zip/Archive/Wim/WimHandler.cpp:318:9: error: use of an operand of type 'bool' in 'operator++' is forbidden in C++17
+|   318 |         numMethods++;
+
+
+use unsigned instead of bool
+Signed-off-by: Nisha Parrakat <Nisha.Parrakat@kpit.com>
+
+Upstream-Status: Pending
+--- ./CPP/7zip/Archive/Wim/WimHandler.cpp       2021-05-20 10:51:56.997402701 +0000
++++ ./CPP/7zip/Archive/Wim/WimHandler.cpp       2021-05-20 10:52:16.665604125 +0000
+@@ -298,7 +298,7 @@
+
+       AString res;
+
+-      bool numMethods = 0;
++      unsigned numMethods = 0;
+       for (unsigned i = 0; i < ARRAY_SIZE(k_Methods); i++)
+       {
+         if (methodMask & ((UInt32)1 << i
diff --git a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
index 13479a90f..ada49114c 100644
--- a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
+++ b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
@@ -9,6 +9,7 @@ SRC_URI = "http://downloads.sourceforge.net/p7zip/p7zip/${PV}/p7zip_${PV}_src_al
            file://do_not_override_compiler_and_do_not_strip.patch \
            file://CVE-2017-17969.patch \
            file://0001-Fix-narrowing-errors-Wc-11-narrowing.patch \
+           file://change_numMethods_from_bool_to_unsigned.patch \
            "
 
 SRC_URI[md5sum] = "a0128d661cfe7cc8c121e73519c54fbf"
@@ -16,10 +17,26 @@ SRC_URI[sha256sum] = "5eb20ac0e2944f6cb9c2d51dd6c4518941c185347d4089ea89087ffdd6
 
 S = "${WORKDIR}/${BPN}_${PV}"
 
+do_compile_append() {
+    oe_runmake 7z
+}
+FILES_${PN} += "${libdir}/* ${bindir}/7z"
+
+FILES_SOLIBSDEV = ""
+INSANE_SKIP_${PN} += "dev-so"
+
 do_install() {
 	install -d ${D}${bindir}
-	install -m 0755 ${S}/bin/* ${D}${bindir}
+	install -d ${D}${bindir}/Codecs
+	install -d ${D}${libdir}
+	install -d ${D}${libdir}/Codecs
+	install -m 0755 ${S}/bin/7za ${D}${bindir}
 	ln -s 7za ${D}${bindir}/7z
+	install -m 0755 ${S}/bin/Codecs/* ${D}${libdir}/Codecs/
+	install -m 0755 ${S}/bin/7z.so ${D}${libdir}/lib7z.so
 }
 
-BBCLASSEXTEND = "native"
+RPROVIDES_${PN} += "lib7z.so()(64bit) 7z lib7z.so"
+RPROVIDES_${PN}-dev += "lib7z.so()(64bit) 7z lib7z.so"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

