Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38508EE645A
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 16:35:13 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.88292.1767198905108292968
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Dec 2025 08:35:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z2/8V5Dn;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a0d6f647e2so176878215ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 08:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767198904; x=1767803704; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0mOnp1eeEXfSKQQS7x66qj8MMR/Q74JHjRGqKZhMBc=;
        b=Z2/8V5DnN0I+uykuX2OOswpnR5YjomlsiPxi//Ybpf/LR5NYT8DfUu3euskLaKGm72
         PEiikL1VZ6VnezR7x68caAHoI0eyYms4agCApzyDpDlw9HNclagAX7Jec1yFZQh+aGTg
         HTGN/wSU/MLy74XwzYwzqlmJbQMG5q9OroJa56Us8Dip9oGMltmNaK6uDwGT3qZvngKe
         964q8cEuh1fXExqdbQC0S7NFh/VK+F4Ei92KtnQZrz6vtszGVP9okLoWlwodZ1+Fszcr
         w8o8Hy68oJlXZAyB0D1kFoozAeTQtSZ5ukgGFpTXLm8MhtCGOStLDjUJyECmHL6lTqTE
         QiZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767198904; x=1767803704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M0mOnp1eeEXfSKQQS7x66qj8MMR/Q74JHjRGqKZhMBc=;
        b=CEA03004mEGS0IgqId9dlfPVv+HHmA/pqW/yoaXuYWdVsS+Y90KsW05JNX+gLQIXRB
         aaeeTUzTixeDCSaIaIvMr6FjRQcbobHkEWHU2xQBdrgKRJ3Xs3vGylW/hBFMvhYpiO14
         BBxm+Z7ZcbPeG3WH9XhzvhiCLGgQ9cllfzG1YZMZIg+SeNJoq64LwFo27BNUS+2HNhII
         zAdJK+cmqcwlSxJQ4TzNq0OxyL9+rXqxK9/JhI8P0mLhDpuLllbb9kJi8w8fpOG1ZIb3
         D/qNQWZaGA6UNDsprWvQdTOhL7JozD1wVdIdjU2/NGHppeyvrvRKUxdMhXxd6EJ5Mh3z
         mKlw==
X-Gm-Message-State: AOJu0YxCbKGdD84NsQyUs1XtPWHWqrjCYTj6j4qkzYLAD5//mRmX4OJF
	hS0fViiLNnEqrtEbjUtMWH+OSDVj9r1w04C24BrmzL8rreYiFNMGOFYsWl22sQ==
X-Gm-Gg: AY/fxX6VyWNuYbr2sqWo5735W1pm9Sq7ahFL3eCgSFuIjIbibcu+0dQm27jAruJgKb9
	K+idQc931J4Uj5pcKXOMlsbkPaPM5ByBJ4TyzctYRlD/UW2n2DzIzKgaO1DUoOjcsyjhDYLbazg
	7y6+CrvYViOF0Uea8nUvYTonEB/n+725WaNJR6Pd+vDLlCDBuJdmQKgcmvYnPu6wLuwokO7/2n3
	KbIaBB2IzgjxS0eA8xW8dGsAUwRzcr8xQYAC2xhmRDNs6wFQhHn5EtqZZH+JEuxlcXtg/c68vuZ
	Vrf5HaDcuRQ+zcBqYqyd3t2gVsPrjZlQlCdDvHddQnTHVe1nGtJO2gdpItgp7aua8hrksf3PSK0
	gqbcT4i3ypnA8afUd12NuMO1vtXA4tJHWB7kKQeBmVoKql+pyW0Y10BWMdXUQQy5SXCC+J3uevB
	IOeITpWbgTd4BxA8P9EUvUZF4ioo6itx316yHvNEzl1KF+oq/jwpdSq+XzN7PnsiZNP8sCQdbTq
	U7p8Lr3ThD8+f0EYMnjMPiftYTOsp8=
X-Google-Smtp-Source: AGHT+IEbcrlkslj/LYr9AN6jfnqOusKteLLCOyYDGG/+tcs4PiFLk+gUz3hvtepcRJMjq/wBpdYZGA==
X-Received: by 2002:a05:7022:2526:b0:119:e56b:c745 with SMTP id a92af1059eb24-121722a7625mr35845161c88.10.1767198904069;
        Wed, 31 Dec 2025 08:35:04 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::28b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121725548b5sm141302534c88.17.2025.12.31.08.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 08:35:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-bumble: Add recipe
Date: Wed, 31 Dec 2025 08:34:57 -0800
Message-ID: <20251231163457.2607226-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251231163457.2607226-1-raj.khem@gmail.com>
References: <20251231163457.2607226-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 16:35:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123082

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-bumble_0.0.220.bb          | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-bumble_0.0.220.bb

diff --git a/meta-python/recipes-devtools/python/python3-bumble_0.0.220.bb b/meta-python/recipes-devtools/python/python3-bumble_0.0.220.bb
new file mode 100644
index 0000000000..150c342187
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-bumble_0.0.220.bb
@@ -0,0 +1,38 @@
+SUMMARY = "Bluetooth Stack for Apps, Emulation, Test and Experimentation"
+HOMEPAGE = "https://github.com/google/bumble"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7a775f1b11285b6abedd76748d176125"
+
+SRC_URI[sha256sum] = "3ffb36148e4a558ea21253f7593d23d6250090b0af2920a82fcbfeacc6970fe9"
+
+inherit pypi python_setuptools_build_meta ptest-python-pytest
+
+DEPENDS += "python3-setuptools-scm-native"
+
+RDEPENDS:${PN} += "\
+	libusb1 \
+	python3-appdirs \
+	python3-click \
+	python3-cryptography \
+	python3-grpcio \
+	python3-humanize \
+	python3-platformdirs \
+	python3-prettytable \
+	python3-prompt-toolkit \
+	python3-protobuf \
+	python3-pyee \
+	python3-pyserial \
+	python3-pyserial-asyncio \
+	python3-pyusb \
+	python3-websockets \
+"
+RDEPENDS:${PN}-ptest += "\
+	python3-pytest-asyncio \
+	python3-aiohttp \
+"
+# WARNING: We were unable to map the following python package/module
+# runtime dependencies to the bitbake packages which include them:
+#    libusb-package
+#    pyee
+
+PYPI_PACKAGE = "bumble"

