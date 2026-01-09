Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09D65D1A619
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 13:06:08 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9487.1767963958176150100
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jan 2026 05:05:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zg00BWov;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-430f3ef2d37so3652240f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 05:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767963956; x=1768568756; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XjPJBeeaV0AF/m5RPUX0VrysRdy0GvKjIBUm33sOIK0=;
        b=Zg00BWovMaf03WEh+NBS5GED0pUwlMEzlkDKkzN6ic/RFenyZbMJrSyqhxDs4k+OFT
         ZlHyP4LNgWoLPOBmljDrqkmzZp5GxPMp78mBflsVjG+ZNctGhseKLXMPQ8hgMuSKq0eq
         goipWGrI4mNwcjpebAROQHDsS4BjxYFyiLSrIXXXOMAH5uOzwOQe3iSbRV3TmKWh3X+v
         DhE30h/RbU2PwLNe5dmtwGIdeRsMwl9zBPrvHO45SdPSQ2LY75rqoj1tO1ASV00ah9P8
         oUTf53vK+P40PKGacCruQ7gpJ5P+EGnbe+atktX1f0FstYLrCkrhsqG6QyQHmMAi0kz6
         ieNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767963956; x=1768568756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XjPJBeeaV0AF/m5RPUX0VrysRdy0GvKjIBUm33sOIK0=;
        b=IXz01Hd0Y6aMhVjhCs7lr6okQFaPeCOgg6TICEeS/Sq5yqt2Yen2a44meIVBPmUKPF
         1CpGSlcUQy5Xhe0iEwPgg56F/bJiYk5DlR8+XddS3ozG7qawQA3ZGu30KWZh9lW97071
         AAXBY60ZRz62x4rV3q4BEBuhPnVU8HF0rjGXKJI1VxSGGBdDHIoHJ1bxiydssDPnYIUv
         D9Soo45wT44CuWytbYOlZpGQe2Nee0Hih+OkGUt9LlDe3muZ3YoZbI+nhO2frF7/Mwnc
         v98jGCMV/rJThv5RhvXWhw85umG2kA5EcAkWmHlQeHgqa/HElL7slpCjVjJ+Cu7Oa++a
         7GQA==
X-Gm-Message-State: AOJu0Yxr9t6RoOXydM2pC8vQgiktVKD+TUS7gXnkxUYrkgSHX1kA0Fg6
	tuqGqETIoykmGUurkQxBdcB+vneJcR2QG5Tg0pw27MCxYpWbn6Gv5S2UR63J2Q==
X-Gm-Gg: AY/fxX4u2FMDjAEJUGzwv8Xi/76yD8f3amPGsiWq90vvTa73eB+tdGhQn5Rw/oOlyce
	CCrCNYoXTWCS0QK3u7R4f5QlpaYbd4HhslFu9cP+5W/1KverrPhK2r2doZj60A0Qy6VO++BGtrr
	yF5T58Fu1duWnxGtvAtC36/D09v/44taApCe4zTaH1XI+fYJYS07ukXeajQh66w/VfCWhyAlP1L
	TC3nmMxxKx6Z4frvU1z+n0ToRNI+15ft+WX5v6F5T5ilotDpTOdlZC+4apYCS/PwL8vZO1bEZja
	cDfeIYi6ZjpdV0af22e3zJyEQ6TsWxzJ1yv+MYIB04H2XZ5XaWl1Qwb+gNDfx+TOrAm2XoQK/E8
	aVYV0IGwpQj1bKuxEW/wrzJv56f6N7HKMpjxMx7zu48OqduBa9P5duG12vtMNTQpigUDBrfGy3o
	JzRxRp472p
X-Google-Smtp-Source: AGHT+IHh5DpYBa0REkRHBf7ZYyiID8nxgFbFIdPnKPT/URIKRsQJkskUaKB0MkOjxSZjWCZRPJDjmA==
X-Received: by 2002:a05:6000:144f:b0:42f:f627:3a99 with SMTP id ffacd0b85a97d-432c37c87efmr12719999f8f.38.1767963956336;
        Fri, 09 Jan 2026 05:05:56 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee870sm22363067f8f.36.2026.01.09.05.05.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 05:05:29 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 2/3] wireshark: ignore CVE-2024-24476, CVE-2024-24478 and CVE-2024-24479
Date: Fri,  9 Jan 2026 14:04:16 +0100
Message-ID: <20260109130417.1591074-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109130417.1591074-1-skandigraun@gmail.com>
References: <20260109130417.1591074-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 13:06:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123301

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-24476
https://nvd.nist.gov/vuln/detail/CVE-2024-24478
https://nvd.nist.gov/vuln/detail/CVE-2024-24479

Upstream disputes all three vulnerabilities[1]. Looking at the history,
even though they were valid issues for some period of time, none of
them made it to an actual stable release: the vulnerabilities were
caused, caught and fixed in the same development cycle between two
releases.

CVE-2024-24476: vulnerability introduced with[2], fixed with[3]
CVE-2024-24478: vulnerability introduced with[4], fixed with[5]
CVE-2024-24479: vulnerability introduced with[6], fixed with[7]

Ignore all three of these vulnerabilities, as they are not present
in the used recipe version.

[1]: https://www.wireshark.org/docs/relnotes/wireshark-4.2.4.html
[2]: https://github.com/wireshark/wireshark/commit/395e3b6cb595bfc610f3c26e7e9eb1f8729fd952
[3]: https://github.com/wireshark/wireshark/commit/108217f4bb1afb8b25fc705c2722b3e328b1ad78
[4]: https://github.com/wireshark/wireshark/commit/a9a62ff576ae79e0d6afb3214a5d409ec4cdf9d7
[5]: https://github.com/wireshark/wireshark/commit/80a4dc55f4d2fa33c2b36a99406500726d3faaef
[6]: https://github.com/wireshark/wireshark/commit/53ec634ac2bf5f87a594aa72f16ca21c25a146a9
[7]: https://github.com/wireshark/wireshark/commit/c3720cff158c265dec2a0c6104b1d65954ae6bfd

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-support/wireshark/wireshark_3.4.16.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.4.16.bb b/meta-networking/recipes-support/wireshark/wireshark_3.4.16.bb
index 4835a72d76..a8eafe4a05 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.4.16.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.4.16.bb
@@ -102,4 +102,7 @@ FILES:${PN} += "${datadir}*"
 
 RDEPENDS:tshark = "wireshark"
 
+# disputed, vulnerabilities didn't appear in any releases
+CVE_CHECK_IGNORE = "CVE-2024-24476 CVE-2024-24478 CVE-2024-24479"
+
 BBCLASSEXTEND = "native"

