Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10327.1795752991350956908
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:16:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=SAZqboJV;
 spf=pass (domain: gmail.com, ip: 74.125.82.43, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1a3c08d6928so11425696c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795752991; x=1796357791; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1I5VVvLVQbNgAE5H07C6B9rUeiDZed3w3jplEXSAVU8=;
        b=SAZqboJVLA+49TmGeBBfGs4ivEoYhqDBbH8qb26+Y/NAwYNBXv8fXe3LxK+wj/m/Mg
         kDWmbRneSPqp2Ux3zwyyVPXdjwCb8HlE8bXiZ7HbMQrrUGXj1XHMhTxQRw+bEIz0hPAy
         3GOmO/SEcEc4EefLRst3UbEYEG3OJLz3q6hWXM1tK5oLF6sE8lFzy9XaAM2ZJVjQ9siA
         hnMIsA/Ew5F9KdMQcJKaS4N4MqnP0jS8u26WuyZnQmLgEhC/1YXk68GdxeKmaDpEhY0q
         iGS4nQZ1i6nbwYguOm+oSwKSLevZnRD2myk2qVCcC37/3QIVHhG9hisYrwpk225Jlsus
         rYYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752991; x=1796357791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1I5VVvLVQbNgAE5H07C6B9rUeiDZed3w3jplEXSAVU8=;
        b=fsLj+NZ/6rizwsiIJfkV92HsOhUp1mTybgbD1CrAWsbwnGJSj0cH4zGhrMuPMZQbRe
         YgSGmubwAaCL5Y/WTRC8wdHf0LLllDxdl4jxuAhwNrJQL8LEBVavdNGvpzEZW9GjEV7/
         SJMwguGnbwwysPGz5vGuW1risJW0yknrFjJpgOm/J3Y5jN8I+BMQMOmN222bPVbN5OAe
         76y8QT38D15jN5wAuru6ILlig+8nuQyA2RL2hn1adCEo/XkeEDSVfs0MO9KZqMLLWccy
         pp2d4oi8GBxlaKED8Brdy74DwWtBTOww7rMuYJoTypuKyY5AQEclLPqrCBwhkak8X15F
         LopQ==
X-Gm-Message-State: APuU4Z+UUuAGddu1goGLsrAhA/tAmx5eOeUB+KBeJf3oOfqwe5q0LLB5
	z6phuf7Eg1oOtCwqEC/Jl4i1c2mq/kab8m/A0tZohHdA8J1/TngNhcEz3UN/bUc/
X-Gm-Gg: AZFdTZc1R470YXsemzOCyHI+7lz+m5f4wckOTNjfoPufE0KkuZSscWlAxDgposiigC/
	6lZ7wZG9NjAS17+nK74bIBg34FQj1abzL5xVocMFqwFYG6lezTIHVZ3pgNm5rUtrwDvih9pLbJu
	Vd0+M8afNjfJGtscVdpUnnPPTa04+s41QXF5IQjlv2MXlepXdwTutL87FA2Mjr0+Ca+mfNfjQXc
	KbrfPEnnFeJx+cs2J1zuZkQ1jGkXBVVDbjPV/1bJ+Bgb4RfjlBW6Xs5PTb7eOIgqFKs2PmBnJ2v
	Qbt45JhpcnoVdknRmmAGQu/wCsrzWWjVSnLw571rVc1+l7kmj6c30D+9WKcWqOm+6tAeESqFD/V
	ztqm7QDL34SLKIPqbuPL7ZJwjEi4t+Ddop15D+HU0HWV2W9ZUfxFZ298B8QoHZ03PNSuHMlpH56
	78zCwVA2e0BMAIiMnmCN5gwmADCelHQNwz9TytTSSAvFjkHqoXYFdgVv4w3mc5WY44bb8ZK0Uju
	oeIvEQ0ALXU2SvWBO/A6oRPQx0DNyeJgbXVbLlxURWm7nKy7TSI/6HqLIF6MGZgeIeME3Yh5iKo
	US0rtKGlEsDiPi8D0mkcAtBNx47xyhD+nsOm1wURRLlNDV5RBGhjFFiEWr48keKQ2HVxURpznd+
	+a8PUKJrmbqEeHo6khis0EOAcSdAkDoWXkf4DDZUpV5jMSofOujz3WxJXVmU3/0qeo/YXhlM75J
	SgA/4UNLDSZutzBWE1tyFnx60GsZGJXFYnmzqKHMCts0MqTx32Q6KTevTpYaNp0uR4THYwOw+VH
	2zzYc8TlPbq+TF4lfCxM4bmlPiYAGgGY+6sObHcg8bINygzfg2tAryJep7PUWEfCUxnwNJ0sMuJ
	yMd+Fvj1pj0/DER7hms8i7f2BQ==
X-Received: by 2002:a05:7022:6985:b0:1af:16c4:d06b with SMTP id a92af1059eb24-1b55686d5c1mr29387061c88.10.1795752990670;
        Thu, 26 Nov 2026 20:16:30 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm52062757c88.2.2026.11.26.20.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:16:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 11/32] python3-zipremove: Add recipe
Date: Thu, 26 Nov 2026 20:15:53 -0800
Message-ID: <20261127041614.1775064-12-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
References: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:16:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133230
Content-Type: text/plain; charset="utf-8"

zipremove extends the standard zipfile module with remove-related
capabilities (ZipFile.remove(), repack()) for Python versions that do
not provide them.

It is a runtime dependency of python-sbom, which newer releases of the
tox-dev projects use as a hatchling build hook to write PEP 770 SBOMs
into their wheels.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python/python3-zipremove_0.10.0.bb         | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-zipremove_0.10.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-zipremove_0.10.0.bb b/meta-python/recipes-devtools/python/python3-zipremove_0.10.0.bb
new file mode 100644
index 0000000000..960977a1d7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-zipremove_0.10.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Extend zipfile with remove-related capabilities"
+HOMEPAGE = "https://github.com/danny0838/zipremove"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d2da6a8d85b7f2d0302ded46d6865430"
+
+SRC_URI[sha256sum] = "3c5957c115447b54299d3a23128764b59c4558fc98c4b878ff2dbc5db8a62021"
+
+inherit pypi python_setuptools_build_meta
+
+DEPENDS += "python3-wheel-native"
+
+RDEPENDS:${PN} += " \
+    python3-compression \
+    python3-core \
+    python3-io \
+"
+
+BBCLASSEXTEND = "native nativesdk"
