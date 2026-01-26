Return-Path: <frederikbraendstrup@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBB85CF65E7
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 12:22:36 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18321.1769430149191639116
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 04:22:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BpRoKW3u;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: frederikbraendstrup@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b885d8f4092so566753166b.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 04:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769430147; x=1770034947; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6CuH+oobD0TUugw4LBf1Cm+VJXB5Ziws0T0Hofdvsgc=;
        b=BpRoKW3uyh7f+dT4rF3FjcEhY+uHU/wm6S+f9yKUUSuYc4PaAD0ftQurFBrdk9Tfxe
         NJLQR/Pt+ytusAv9bsyJjLIl2UM66Zs789moxj31VwD5CY1Ik25MOuV78euN0Wuzmh5/
         Yvs3SKqjeTrh5pwiYHGJA9SXy3VPAZvC4rATi+KGV5Kh17bje2LRL1qYr9IfU3YjxygK
         /vgHeRmPRnW7bdyJR4/kEKtw2dSGHiBK10QO9rmAQJWiJhyQpygCW+N55t8rk2p3VeEJ
         M1vwASnMGA0BqrMw3V+X3NdtOIFA3YMaD4LMXaLXNT9ukc2ek9nsC9E91UL5H7Fetoi9
         x3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769430147; x=1770034947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6CuH+oobD0TUugw4LBf1Cm+VJXB5Ziws0T0Hofdvsgc=;
        b=RTZWsbHEeO8TW+Z8jxcTkMiliJlPz3M6ptTL+n1ightySicg+so/zP9ItNEPyRpCO3
         pOUrgJxNGsCOcmXlrRNHuRNLM6d58UwLTLKki8TX43vT+PmzCt2qoPhBbc8eK72UD6WA
         uyzh6H5OJx7+dm2mGRhD9qkpV474+6SQIEmDcv2nDsKjdyNQ2fM0h9bRRFGVPbzV6SYl
         cKcqGP0BR8wqSVf0fSakVxAK5tcOCK+r4K5oiCBCOjO1eQquIyKmfGtZUMsiX2/xynsn
         AS+zYazbo1JJgJeG0DXfkwhW0TkawunNIBPG+VuOhMdL0LRDsGlbuDldFo9tOPsY1fvS
         BYGw==
X-Gm-Message-State: AOJu0YzhwzsyRG/YrrSKW9VQd/OQpn3RCqlE5pLL8i9w/3fKRHEm6yuh
	Xjhfnl3NFO2o+85pAqIgAarimv5uQMtMyIxtTY4UQxiAJZUQZqgiVbiqXbCRBuZj
X-Gm-Gg: AZuq6aJAOrMzwPzIIAaaSq5Iogs+goNspTd42DNtyOgwi9+OpC277C9q0YkiudP/E20
	opWpX0sjs/pnS9NzsZce1RDqovo7SiLIQpNWNtgqw7+PUUQPc7XgTWt2WFkoY6zbmnYQ7WUOqOu
	7Dr1KVsGP04pKALYwKeWloKzm2xTrwcawr5Z1LqR4QwkyC0AQ9Hqelq4cjtaYJvz40xsLWwe7S2
	wOAxzeY99viI8ujyCWS5ZbD6Oado2WnDUKc2fYAy3xSwX6ww4p/OUsGvJ3VO+Qsb/yB3QWNwc+9
	7FIJRWB8laFh9ZjQMjhMtVmza5aD2ApwjSK3AXycmtey0GymM08TcAkLP44gY+JolyfFI7/a7Ai
	hWO/i/Eac6Ya8ImrnR449JGA3eBI+Zv5CJzq/fCChnSSPRS8ITE/6cVco5fUz4GZg3KYVe60xra
	Zhwx2fugfFNAYShfrCOoVfVrhyVDX071JZwhj4/hAP+No3ELQtCL5pz8rVYd36xiP2
X-Received: by 2002:a17:907:2d09:b0:b87:12ad:d4d3 with SMTP id a640c23a62f3a-b8d4f721351mr278208866b.55.1769430147117;
        Mon, 26 Jan 2026 04:22:27 -0800 (PST)
Received: from ws.taila4487.ts.net (77.241.136.110.bredband.3.dk. [77.241.136.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b7bb0b0sm646495966b.67.2026.01.26.04.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 04:22:26 -0800 (PST)
From: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
Subject: [meta-oe][PATCH v2] glaze: add recipe at 7.0.1
Date: Mon, 26 Jan 2026 13:21:21 +0100
Message-ID: <20260126122120.1309697-2-frederikbraendstrup@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260119113241.4139214-1-frederikbraendstrup@gmail.com>
References: <20260119113241.4139214-1-frederikbraendstrup@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 12:22:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123875

---
 meta-oe/recipes-support/glaze/glaze_7.0.1.bb | 23 ++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-oe/recipes-support/glaze/glaze_7.0.1.bb

diff --git a/meta-oe/recipes-support/glaze/glaze_7.0.1.bb b/meta-oe/recipes-support/glaze/glaze_7.0.1.bb
new file mode 100644
index 0000000000..e481290b9c
--- /dev/null
+++ b/meta-oe/recipes-support/glaze/glaze_7.0.1.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Extremely fast, in memory, JSON and reflection library for modern C++. BEVE, CBOR, CSV, MessagePack, TOML, EETF "
+HOMEPAGE = "https://stephenberry.github.io/glaze/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ea4d29875d83fbbf50485c846dbbbed8"
+
+SRC_URI = "git://github.com/stephenberry/glaze;protocol=https;branch=main;tag=v${PV}"
+
+SRCREV = "a4af950700b8af2659f0d4a37a18a1b9c5300593"
+
+inherit cmake
+
+EXTRA_OECMAKE = "-Dglaze_BUILD_EXAMPLES=OFF -DBUILD_TESTING=OFF -Dglaze_ENABLE_FUZZING=OFF -Dglaze_DEVELOPER_MODE=OFF"
+
+do_install:append() {
+    install -d ${D}${datadir}/cmake/${BPN}
+    mv -f ${D}${datadir}/${BPN}/*.cmake ${D}${datadir}/cmake/${BPN}
+    rmdir -p --ignore-fail-on-non-empty ${D}${datadir}/${BPN}
+}
+
+# Glaze is a header-only C++ library, so the main package will be empty.
+ALLOW_EMPTY:${PN} = "1"
+
+BBCLASSEXTEND = "native"
-- 
2.52.0


