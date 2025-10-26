Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56FD1CCF9E9
	for <webhook@archiver.kernel.org>; Sun, 26 Oct 2025 20:51:28 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.18157.1761511882201214309
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Oct 2025 13:51:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jNFXtt98;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3f0ae439bc3so2539949f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Oct 2025 13:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761511880; x=1762116680; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j3o+3BaPJMEPoWwdy43C6jzzsUiY6fTQI6Osh3u+hn4=;
        b=jNFXtt984kWm48gVJ/d2jpO3hHxndyUKttamtp+htKukTx2QnOm1LnyM2oRwrb3sho
         MIc0HFzxzjxU+XABxuO6NVkJlfYnAwY0nhh7RXx0TH6lz5/SZ3z2LipzKG64+mxsaj09
         VDyUTdfRfDW3ENqIjJoyH9qATXc401LX/SrsA2uN3wZTKNicJUp9742+/ol3w/3cYYvU
         jep8a4TGIxCna2SCrOz++INgzUy8tyXVyEt+gngRKO8tLJw4fHv+iKG0uNe0EITIMjAa
         kT+Lo47zdLx2itlaLsaXrDhjmIPYHImHkHDmAOR1VkrlDR4TBl5mhT6KmmKwoVc22gEO
         61Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761511880; x=1762116680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3o+3BaPJMEPoWwdy43C6jzzsUiY6fTQI6Osh3u+hn4=;
        b=TEAxD6UGxf/QtzkYcjXXJY+LYSSewxOt+xQT3E42EXxKtCDaoPP68xbY8wkkDEu9hF
         lA7AF9kumb9MIj7nKubP88C09BIg7Naj+VVThTCuVhaHxCKMXdQgDiMCRKfEgQpWs7Dz
         k8H+DyNA9XCfwlkOfGOchQjsQ8QpsgH8/xh7rIPddURLxo6a10rKt7X63NoEpm3FNXgV
         wwc43ST8fVpSQAbjdcbaNM5lLCSUnMmOTuBRDCc7hPJAeZ9JbnlrYi4ymmXPWgbvMPqw
         IPEtQzGB10vcW7zRaTP1001aLcYvhTOPl6PRfT83EID8zyLid6t43Z53MyFeDpcHG7DJ
         /Ecg==
X-Gm-Message-State: AOJu0YxOQZio04Euf/NZgm4v6WUfWZUnd32ytnUBxkrJlqcllF/WYLcV
	ZN93AH+xuxw5ZiAhqnzguAFjvoPu90Mf6ORmcCvteeN77lH46RE9mcmbuiFjEw==
X-Gm-Gg: ASbGncs8Y5eRatjG8vRXHHfnXkzaL3w3suZIqvT21/Foz53QLEfFK8vexXLsIm1cTmX
	7yNHTIjSlxwTRzhIFh1OJOKzVxqcaA+UD1/hwEJyJEfwmWwxzMVLX/aYngppHWttLPsYEUA/+HE
	r04RjL6PygyofsDXCrtLX1DheBwT8ICXkn1Iqzou9IjaupTzBsROR7aELeKBwLfz6A0DtDj1R/U
	KbPoeWhKLzS9pgWaPZG2lmL+vHEaR6hhDwyxOg1W69xK5FDvvow+Old9K8VEArI9d+maiQDMWHp
	y/wqsw5RowikKbXmGd+5lXEZjKtcF9iHQac27jETfAa8Lo8kMtN4orNIxzAsAEsAJjoVJHkHNLh
	9+zt2UQicevzuAusCNXHv7YbpnXWqY/Ck+w3zXmPECzGABughGiFTd5ZAZXfequbwa/eUMe7E4A
	==
X-Google-Smtp-Source: AGHT+IGH/0MYnFqgBov20F1Qzf2UVdiXh53DiGGcWSq3uyR9XKoLiHjZ/o9tcqL/6PheIkf79cioxg==
X-Received: by 2002:a05:6000:4201:b0:429:8c4e:b0c8 with SMTP id ffacd0b85a97d-42990712215mr8725587f8f.27.1761511880507;
        Sun, 26 Oct 2025 13:51:20 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952da12dsm10484113f8f.29.2025.10.26.13.51.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 13:51:20 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/3] python3-scapy: fix ptests
Date: Sun, 26 Oct 2025 21:51:17 +0100
Message-ID: <20251026205118.2439308-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251026205118.2439308-1-skandigraun@gmail.com>
References: <20251026205118.2439308-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 26 Oct 2025 20:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121016

1. Install missing test files
2. Enable network access by setting a nameserver in resolv.conf
   because some tests require this
3. One test tries to ping Google through IPv6 - this test requires
   ipv6 DISTRO_FEATURE. In case ipv6 is not enabled, skip this test
   from the run-ptest script.

NB: the last mentioned test to work  also requires IPv6 support from
your ISP. My ISP is IPv4-only, and I couldn't try it out. The above
comes from my reading of the testcode.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../include/ptest-packagelists-meta-networking.inc   |  2 +-
 .../recipes-devtools/python/python3-scapy/run-ptest  |  7 +++++++
 .../recipes-devtools/python/python3-scapy_2.6.0.bb   | 12 ++++++++++++
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/meta-networking/conf/include/ptest-packagelists-meta-networking.inc b/meta-networking/conf/include/ptest-packagelists-meta-networking.inc
index 408b559da2..838aee94d3 100644
--- a/meta-networking/conf/include/ptest-packagelists-meta-networking.inc
+++ b/meta-networking/conf/include/ptest-packagelists-meta-networking.inc
@@ -20,6 +20,7 @@ PTESTS_FAST_META_NETWORKING = "\
     mbedtls \
     openhpi \
     openl2tp \
+    python3-scapy \
     squid \
     tcpdump \
     wolfssl \
@@ -41,7 +42,6 @@ PTESTS_SLOW_META_NETWORKING = "\
 
 PTESTS_PROBLEMS_META_NETWORKING = "\
     nftables \
-    python3-scapy \
 "
 PTESTS_PROBLEMS_META_NETWORKING:append:libc-musl = "\
     libtalloc \
diff --git a/meta-networking/recipes-devtools/python/python3-scapy/run-ptest b/meta-networking/recipes-devtools/python/python3-scapy/run-ptest
index 417e21053c..5c166b7ba0 100644
--- a/meta-networking/recipes-devtools/python/python3-scapy/run-ptest
+++ b/meta-networking/recipes-devtools/python/python3-scapy/run-ptest
@@ -1,4 +1,11 @@
 #!/bin/sh
+
+if ! nslookup example.com; then
+  mv /etc/resolv.conf /etc/resolv.conf.bak
+  echo "nameserver 8.8.8.8" > /etc/resolv.conf
+  trap "mv /etc/resolv.conf.bak /etc/resolv.conf" INT EXIT
+fi
+
 python3 UTscapy.py -t regression.uts -f text -l -C \
     -o @PTEST_PATH@/scapy_ptest_$(date +%Y%m%d-%H%M%S).log \
     2>&1 | sed -e 's/^passed None/PASS:/' -e 's/^failed None/FAIL:/'
diff --git a/meta-networking/recipes-devtools/python/python3-scapy_2.6.0.bb b/meta-networking/recipes-devtools/python/python3-scapy_2.6.0.bb
index fdef5473ef..2086b018d6 100644
--- a/meta-networking/recipes-devtools/python/python3-scapy_2.6.0.bb
+++ b/meta-networking/recipes-devtools/python/python3-scapy_2.6.0.bb
@@ -30,9 +30,19 @@ do_install:append() {
 }
 
 do_install_ptest() {
+    install -d ${D}${libdir}/test/pcaps
     install -m 0644 ${S}/scapy/tools/UTscapy.py ${D}${PTEST_PATH}
     install -m 0644 ${S}/test/regression.uts ${D}${PTEST_PATH}
+    install -m 0644 ${S}/test/pcaps/bad_rsn_parsing_overrides_ssid.pcap ${D}${libdir}/test/pcaps/
+    install -m 0644 ${S}/test/pcaps/macos.pcapng.gz ${D}${libdir}/test/pcaps/
     sed -i 's,@PTEST_PATH@,${PTEST_PATH},' ${D}${PTEST_PATH}/run-ptest
+
+    # note1: if ipv6 isn't enabled, skip the related test (add '-K ipv6' argument)
+    # note2: to make this test work, your ISP also must support ipv6 - the test is trying
+    #        to ping google.com through ipv6.
+    if [ "${@oe.utils.all_distro_features(d, 'ipv6', 'true', 'false')}" = "false" ]; then
+        sed -i 's/UTscapy.py/UTscapy.py -K ipv6/g' ${D}${PTEST_PATH}/run-ptest
+    fi
 }
 
 RDEPENDS:${PN} = "tcpdump python3-compression python3-cryptography python3-netclient  \
@@ -41,3 +51,5 @@ RDEPENDS:${PN} = "tcpdump python3-compression python3-cryptography python3-netcl
                   python3-difflib"
 RDEPENDS:${PN}-ptest += "python3-json python3-mock python3-multiprocessing \
                          iproute2 tshark"
+
+FILES:${PN}-ptest += "${libdir}/test/"

