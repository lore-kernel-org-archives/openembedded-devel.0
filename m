Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37956.1795594128875265479
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:08:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=OcpKFzgQ;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso2525275eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594128; x=1796198928; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NEdvrWweKn2h2ylYJPxbNR7RfIhPWzGjGhttImgGwM0=;
        b=OcpKFzgQiWCcCeyTFZbw+LAVSMmtHeTBrktjcGaVLnTEUUfniJQlg6qvLZfbHetB9X
         vcPUh0fx5yusTe2TqMnDUfXkvePOK0BtHCSqi7lzOR3A5DvqLJ6ahLmOI2Szodyg+XDZ
         iKiLE9sBEcvW6g5LK6mHvmXCCpoSrCJ2zcpZKVDcedjKWt8diMZ9Iat12fUOPHs0mpQZ
         1Wj91qmyw2WIKMOYjBTtHDh2oWaogumR6DWYlDPNRy9vfjUm7DQ+8IceTklYQI5Vvp1d
         gXabnpT5TawNs49gJOO2pjx9B2KS5DueXpa5fhl1HA9i3DlUHrpQ7QjWJTy0S/aFQhRm
         v1Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594128; x=1796198928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NEdvrWweKn2h2ylYJPxbNR7RfIhPWzGjGhttImgGwM0=;
        b=Wlp8CyBOgE3z/zOAPaKMpIAyVz0uNXMuKr4DGiyVStGOqRwdVIhPCxT3jETu/8bmlw
         ztn6oP9SOy5f3zRAqCRNPtA52qcji2TKMoQXZ/FsbT7naLg5z5toERivjspQilJGc6rv
         gXTA53KN13QUHvgY1rhyQVmbS9U1SZ+4LcgUjdqze3AOYK/B2XuLqBEXt51aalsn6ERn
         pr1tCtdNBYMLHefKixcXVE71sbF1JtfTp2oZB+BdGaRmbLdtxFjNNolO3ZVFttSBM0o1
         voAwjHLrQf+oLssFmUJmYV3qgKdkVQkDmfoBR9AMxgUSjISr+6hX/HBm87P6dhFaF29J
         D2DA==
X-Gm-Message-State: APuU4Z/HtL9bQL4SPW+RY3lnW3obFycZDtG+W/XJrt4ye1wnOJE54w33
	DpfC6yXvcsmp4zr1B1sUfK+tIgdZ4/9McOWyZXS8JyFAPF8rJKyDUX6/3u+pEjjq
X-Gm-Gg: AZFdTZe49RP35u0sRurRZhgbUaJMa5mbb12ZDjBBDRcp7K5gbdoXU+D4PuT9ahSqRej
	MYJx0FZhY1m9OVVQtmuz140YOUbwfq6EVHXh/pwcbzXbErndccVKHgfH+KNwOKKUk5Q0vQn/krS
	2jEWOQFfCZCGvKfdRy70Qewb5c3VmzE6i+d+bihGxn/8/VAdLVavm2CM0cRDJJ1+fpqcHDsYzdJ
	9ZUdJ8Yzma/LHJSVCpu678xf34BWLi4AcJEfmgudb7nGojmtZWbCNNTiexN2nehip5dMiuJ9PD4
	NazOZ4CX95c/cQsCirSakic46XxDun9DuCgqrly50C9brKG2+L20W2jbdvDuIYMhDoIrLpgeh+/
	1tnu6jaHuQE1BSCm/90GpHeEwhh4UyEcS5uL4JsSD0/PGkxnIrwSxuAH/hhvXHdtDfYIc9eD48G
	NsTizo/9kOv1HR5xFUM9cGJAF0HMv46Kul7hhOz+U9mBdhVIpFF4wROWcpBDeN7fzAMPmscjbg+
	sCB14BfuV2ATNwGsItvZaYu6OXZq0DFi/LlqVQiBl39g7dXRfllsrfGFf+O1S7slYlA7fUqnAgw
	veiVU9r4gLVEtR06CSo1r364LglkntbqpTUL/hyDCAS2lbBuHkmxU/cVkHqprsK0MbZqBWLXgOi
	bLumVE5QVDi/wWF+5A+kx+2kL0PtRX3pZsptFBj9lgSc4O+5rbzSJ/cxfIDZaMGa9ayFDFWJAV1
	Hid1qNan4PYXSkBZvKX/MJJFEXyaB8LDiI/jTeOkYLQrYWzJnaF34p7uESORwSMa9cnDVw3iwwI
	r8bqmO5JJuXRRS6d4jrbqEdvqXMmto5DdfztcWhhhrvcxBdhtg24xW2YlTATX+vFOSDdbYBQRsW
	AENscA==
X-Received: by 2002:a05:693c:69c7:b0:386:b745:ac60 with SMTP id 5a478bee46e88-386b745b019mr6557739eec.18.1795594128020;
        Wed, 25 Nov 2026 00:08:48 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:08:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 53/55] rasdaemon: Fix installed-vs-shipped on sysvinit without usrmerge
Date: Wed, 25 Nov 2026 00:07:09 -0800
Message-ID: <20261125080732.2419614-59-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133056
Content-Type: text/plain; charset="utf-8"

Since 1.0.0 rasdaemon builds with meson, which installs its systemd
units into ${libdir}/systemd/system unless systemd.pc is found in the
sysroot, and systemd is not in DEPENDS. When ${systemd_system_unitdir}
is /lib/systemd/system (no usrmerge), systemd.bbclass removes that
directory on non-systemd distros but not /usr/lib/systemd, and
do_package fails:

  ERROR: rasdaemon-1.0.0-r0 do_package: QA Issue: rasdaemon: Files/directories were installed but not shipped in any package:
    /usr/lib/systemd
    /usr/lib/systemd/system
    /usr/lib/systemd/system/rasdaemon.service
    /usr/lib/systemd/system/ras-mc-ctl.service

Move the units to ${systemd_system_unitdir} when the paths differ, so
systemd.bbclass packages or removes them as usual. This also covers
multilib, where ${libdir} is /usr/lib64.

Tested with sysvinit with and without usrmerge, and with systemd.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../meta-python/recipes-support/rasdaemon/rasdaemon_1.0.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-support/rasdaemon/rasdaemon_1.0.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-support/rasdaemon/rasdaemon_1.0.0.bb
index 86eced84a1..ae8e2bc5c9 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-support/rasdaemon/rasdaemon_1.0.0.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-support/rasdaemon/rasdaemon_1.0.0.bb
@@ -49,6 +49,11 @@ PACKAGECONFIG[nvidia-ns-decode] = "-Dnvidia-ns-decode=enabled,-Dnvidia-ns-decode
 PACKAGECONFIG[yitian-ns-decode] = "-Dyitian-ns-decode=enabled,-Dyitian-ns-decode=disabled"
 
 do_install:append() {
+	if [ "${libdir}/systemd/system" != "${systemd_system_unitdir}" ]; then
+		install -d ${D}${systemd_system_unitdir}
+		mv ${D}${libdir}/systemd/system/* ${D}${systemd_system_unitdir}/
+		rm -rf ${D}${libdir}/systemd
+	fi
 	install -d ${D}${sysconfdir}/init.d
 	install -m 755 ${UNPACKDIR}/init ${D}${sysconfdir}/init.d/rasdaemon
 }
