Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web11.134.1596583564034604780
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2020 16:26:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=xiX8h7GC;
 spf=pass (domain: linaro.org, ip: 209.85.210.51, mailfrom: anibal.limon@linaro.org)
Received: by mail-ot1-f51.google.com with SMTP id h22so2688585otq.11
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2020 16:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fadd18Wok1huH/S0IY6NQPRJTTcrXDCVrvwyplmb38k=;
        b=xiX8h7GCgACco9f+1RU+reAKE/JZBNmueQe/XinoIhOK0/MdiNU64msuh4uGg+oGW5
         /GILiyZ+TCLIAnZwKHAwJejwF+oyXxjsC6twKeUU/CTmuawpmTgKE5NKggAoCegT7lAW
         cxHHk5u2HiqJ1XZJAKHknYjN3l7/BcLdRCXAId3YNqDU5CjUCQ8UNTUnz4MZ6trCDzKy
         Pxuxub1fzU2rqe2nDMdlYwyIvirIT3IkG8MkLBXlgkwTXfrDxfZoOAL15gVJ1T20OSZQ
         QgAEh6u7zuSMKf7gp9mRuuRy/4q/9mcXPYg7haWR7IRAgial8xWauVYtiSduJA3M8OVa
         byeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fadd18Wok1huH/S0IY6NQPRJTTcrXDCVrvwyplmb38k=;
        b=VPrW8M9mHJzk2bsyuTu20BWLNiBCUpIalj1JbsfzEE4NN51FBGYDN4BxlE5/wMt4NT
         HiBefDXJ7ZysaUaQ6QCc7I1QDisOHE7qpCyclljOBIaO85sIHQob4ur/yIXwEic3W2vQ
         T8yayteFgHwBb/vfjguJB55XTlS/Pp/er2IPJ0ES0+hbbgmwVVJS03yGwjMEVEhP7nQi
         lqIKwbUAMsoIbWE+UownW270sYipSSkO5mBJ7IkEb6P7Hr4SmpEQMFsFTHmMR60nzMR0
         cUj3YqnWLAU6KVI52dgeMm3XIPCh5J/jAtoOzjywtLQYoYFMJZ35dKS2sNoLAdxdNFKr
         kw+A==
X-Gm-Message-State: AOAM533qNwTD30QIqxeU0dVDYbFg/e+/v5r0UE6dAHElIdFaaoOQDnXB
	IYTinhJ4oiAFAY49OQeSLSbfvNUUcFo=
X-Google-Smtp-Source: ABdhPJz1Bk2HS4r49ZaGapw06bzsPDXpw/3qpuArBjjBfYFygp+HuloZtKBT/whWOhofRk/+u8UMHw==
X-Received: by 2002:a9d:2787:: with SMTP id c7mr408204otb.29.1596583563063;
        Tue, 04 Aug 2020 16:26:03 -0700 (PDT)
Return-Path: <anibal.limon@linaro.org>
Received: from blackbox.rga.ip ([2806:109f:4:de8:908a:c7ff:fe6a:e9f5])
        by smtp.gmail.com with ESMTPSA id e7sm45313otj.28.2020.08.04.16.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2020 16:26:02 -0700 (PDT)
From: "Anibal Limon" <anibal.limon@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: dmitry.baryshkov@linaro.org,
	nicolas.dechesne@linaro.org,
	=?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
Subject: [PATCH] meta-oe: opengl-es-cts install deqp test runners
Date: Tue,  4 Aug 2020 18:25:59 -0500
Message-Id: <20200804232559.39980-1-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 .../recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.bb    | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.bb b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.bb
index 3e336e45c..a9ded3d78 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.bb
+++ b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.bb
@@ -13,6 +13,13 @@ S = "${WORKDIR}/git"
 do_install() {
 	install -d ${D}/${CTSDIR}
 	cp -r ${B}/external/openglcts/modules/* ${D}/${CTSDIR}
+
+	install -m 0755 ${B}/modules/egl/deqp-egl ${D}/${CTSDIR}
+	install -m 0755 ${B}/modules/gles2/deqp-gles2 ${D}/${CTSDIR}
+	install -m 0755 ${B}/modules/gles3/deqp-gles3 ${D}/${CTSDIR}
+	install -m 0755 ${B}/modules/gles31/deqp-gles31 ${D}/${CTSDIR}
+	install -m 0755 ${B}/modules/internal/de-internal-tests ${D}/${CTSDIR}
+
 	rm -r ${D}/${CTSDIR}/*.a ${D}/${CTSDIR}/cmake_install.cmake ${D}/${CTSDIR}/CMakeFiles
 	rm -r ${D}/${CTSDIR}/*/*.a ${D}/${CTSDIR}/*/cmake_install.cmake ${D}/${CTSDIR}/*/CMakeFiles
 	rm -r ${D}/${CTSDIR}/common/subgroups/*.a ${D}/${CTSDIR}/common/subgroups/cmake_install.cmake ${D}/${CTSDIR}/common/subgroups/CMakeFiles
-- 
2.28.0

