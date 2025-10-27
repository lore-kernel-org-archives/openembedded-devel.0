Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 373E2CCF9F0
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 20:10:24 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.1247.1761595820429054667
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Oct 2025 13:10:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JvCwglgT;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-475dd559b0bso34481765e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 13:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761595819; x=1762200619; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f4iANeNE4kKsCPrYfM3I3rbtggSyAU86lfLK4iDiAsw=;
        b=JvCwglgT7rcKLRyq+klWo8Q4dn+LD1v0hnEaT6FjXHiBpgsXcG7WffgL/b5Q3Q7Ptf
         8/9dIuD/HXW074voYIZgQN9+5Hc8y0fqRCd52v1pYQ+vDJAVx5jEWYQcb9/9iOI7JKWm
         ccdLAYZvmw4kwlFjCCZIDA2dBQWmXIlThjkw7+L9VWVjj9weZS0Cb3aAyCBekI8bhW7G
         kqoz3dcakvDu+ror0zC4yaRp92ldsIZ8FvwRbHSw0e4zJXdzYtVhCYE7fzWMcNEY4qwU
         ckNzdnq+s0n52bXn5ldnCH+6jy9HTzNQLFM+w4GtZsFCTH8cJmkXBg6zeD1U+RxLcNAJ
         qjAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761595819; x=1762200619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f4iANeNE4kKsCPrYfM3I3rbtggSyAU86lfLK4iDiAsw=;
        b=GSOC90Ac5aG/fckN1BZFgRth1STn17af1M20SPbIkGyVpjGatn63x/uBYhGXLPzy3t
         05irWBsHtS9B/kYYKkKyBOOAwiaVsYSefSGTP674VLI9AVy3UaFJ054QdQr6mph2j4dI
         VuGwBBtjXrqIGa4F5UWjEocVIen/9OXTG5jUdA6gcmli0/hz9ZGRsBL29jGHjGTww5ew
         aUQ9VXDEFbgNIXzNtCvcmq8aBmAJnO7piz7ZbakNxwqcKitY/i94MqoI+OJ8+7Ebxh4r
         FPgZjs0GrxlkJg8tk22WkWyN37iv8fBRZmqgmrBti0Nn2sBCaYFaA+TzPPJMrp4gpVl0
         m8qA==
X-Gm-Message-State: AOJu0YyYvibHF2G2Jza21Lfv9m3A57OacbXvUyM4vV+R1i3dYW0mun4v
	2grk2t6DIC43qyVTwpwQ30gGOXn0BBc6yZZP15Yiycn6MC0nhu9EpDZsxovdhw==
X-Gm-Gg: ASbGncuvRyNKS6+9qmOlvF5JQQDnAe1yEzn4rcSkvvxNSemgcvrnF9OCbXnkTOlAuK+
	UkiFnYwnDYktF0ZWgRccavLJ2ThwM3DXpMZlNgYpbd83pwuXlAN72nR8gSbSySny/7CUhvA68KU
	zwrYM9hJIrLcdPVptv+MpSc5lLORcIU42G/uYd4ZkEvW6cewcqUPIr2hKd9mxuBa6SKa1aNyy3O
	U/Aa6nVlDzKKKFGHzrwCp79AUIIhAKkj2AiZtqda7oEJlY9I9ebYWNo3jT6Y9MEUc7Wri/Uwa2O
	GttkKB3oczf63UzdNnI6/kY0EJgpPEL1WhoaXWlXappTiEXVoJoSqExnGs/jHz3j2/O3+ifq5cO
	LmVTLWREOyLuo9m6ZfRzwdiMV55svJhKwFSGXq/KHqmlrCIunCZD722m2VTsHALz9kvz1feuRoQ
	==
X-Google-Smtp-Source: AGHT+IGj6xglHW9sp/voOzcPJDALILDIXUrpmS4LEAcdLHKP8QAywK9xWWGKAz8fNM3FooyhKzZ65g==
X-Received: by 2002:a05:600c:354c:b0:475:da1a:5418 with SMTP id 5b1f17b1804b1-47717df9ddemr9260285e9.1.1761595818546;
        Mon, 27 Oct 2025 13:10:18 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd47853csm155508975e9.13.2025.10.27.13.10.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 13:10:18 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 4/5] python3-scapy: fix ptests
Date: Mon, 27 Oct 2025 21:10:14 +0100
Message-ID: <20251027201015.4098472-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251027201015.4098472-1-skandigraun@gmail.com>
References: <20251027201015.4098472-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 20:10:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121059

1. Enable network access during tests by setting a nameserver
2. Add missing tshark dependency
3. Install missing test files

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-devtools/python/python3-scapy/run-ptest |  7 +++++++
 .../recipes-devtools/python/python3-scapy_2.4.5.bb  | 13 +++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/meta-networking/recipes-devtools/python/python3-scapy/run-ptest b/meta-networking/recipes-devtools/python/python3-scapy/run-ptest
index 797d8ecf78..847b69af94 100644
--- a/meta-networking/recipes-devtools/python/python3-scapy/run-ptest
+++ b/meta-networking/recipes-devtools/python/python3-scapy/run-ptest
@@ -1,4 +1,11 @@
 #!/bin/sh
+
+if ! nslookup example.com; then
+    mv /etc/resolv.conf /etc/resolv.conf.bak
+    echo "nameserver 8.8.8.8" > /etc/resolv.conf
+    trap "mv /etc/resolv.conf.bak /etc/resolv.conf" INT EXIT
+fi
+
 UTscapy3 -t regression.uts -f text -l -C \
     -o @PTEST_PATH@/scapy_ptest_$(date +%Y%m%d-%H%M%S).log \
     2>&1 | sed -e 's/^passed None/PASS:/' -e 's/^failed None/FAIL:/'
diff --git a/meta-networking/recipes-devtools/python/python3-scapy_2.4.5.bb b/meta-networking/recipes-devtools/python/python3-scapy_2.4.5.bb
index 0f66dfd784..83f6a6026a 100644
--- a/meta-networking/recipes-devtools/python/python3-scapy_2.4.5.bb
+++ b/meta-networking/recipes-devtools/python/python3-scapy_2.4.5.bb
@@ -34,8 +34,21 @@ do_install:append() {
 do_install_ptest() {
     install -m 0644 ${S}/test/regression.uts ${D}${PTEST_PATH}
     sed -i 's,@PTEST_PATH@,${PTEST_PATH},' ${D}${PTEST_PATH}/run-ptest
+    install -D -m 0644 ${S}/test/pcaps/bad_rsn_parsing_overrides_ssid.pcap ${D}${PYTHON_SITEPACKAGES_DIR}/test/pcaps/bad_rsn_parsing_overrides_ssid.pcap
+    install -m 0644 ${S}/test/pcaps/macos.pcapng.gz ${D}${PYTHON_SITEPACKAGES_DIR}/test/pcaps/
+
+    # note1: if ipv6 isn't enabled, skip the related test (add '-K ipv6' argument)
+    # note2: to make this test work, your ISP also must support ipv6 - the test is trying
+    #        to ping google.com through ipv6.
+    if [ "${@oe.utils.all_distro_features(d, 'ipv6', 'true', 'false')}" = "false" ]; then
+        sed -i 's/UTscapy3/UTscapy3 -K ipv6/g' ${D}${PTEST_PATH}/run-ptest
+    fi
 }
 
 RDEPENDS:${PN} = "tcpdump ${PYTHON_PN}-compression ${PYTHON_PN}-cryptography ${PYTHON_PN}-netclient  \
                   ${PYTHON_PN}-netserver ${PYTHON_PN}-pydoc ${PYTHON_PN}-pkgutil ${PYTHON_PN}-shell \
                   ${PYTHON_PN}-threading ${PYTHON_PN}-numbers"
+
+RDEPENDS:${PN}-ptest += "tshark"
+
+FILES:${PN}-ptest += "${PYTHON_SITEPACKAGES_DIR}/test/pcaps"

