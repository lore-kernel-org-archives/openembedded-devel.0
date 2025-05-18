Return-Path: <dimitris@siganos.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E56C3ABD8
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 19:29:37 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.36123.1747596567862510630
 for <Openembedded-devel@lists.openembedded.org>;
 Sun, 18 May 2025 12:29:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siganos-org.20230601.gappssmtp.com header.s=20230601 header.b=bmJhBHwY;
 spf=none, err=permanent DNS error (domain: siganos.org, ip: 209.85.128.65, mailfrom: dimitris@siganos.org)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-441d1ed82dbso37297375e9.0
        for <Openembedded-devel@lists.openembedded.org>; Sun, 18 May 2025 12:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=siganos-org.20230601.gappssmtp.com; s=20230601; t=1747596566; x=1748201366; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nXg9sO2J2PpGD19LKIPbzaC5YUlFKRIC0jceUukRosE=;
        b=bmJhBHwYG9LeDmEWd+UX1iPCvFBgsWl5HWcAVQxoW7DzlHk1pEnFILazdOKm/HQfPU
         QJdtJUM0Nv/WVtxISH7g/nTPV65iFjJHQdD/eqxrSPG0Kzuvu6Om/mc9x0y1YtZqnHnK
         YX7+YrDZjku+KxMCCUu73LL+NvVJlksXLuVBcKDpbrpcR4HgkVTBKypHx9i6AZgLp3bU
         GPqSaMJaJYl8/66PnrTEP92vpYI92GvBZaPG/b6XjW1ROhnRZmuj2BYFXEJgHdTYmtJv
         T306R+OkHfwsl7GnJKvcRQ/apUDpQEdSzCxXzsY1V7ZZbyFixXga+SYTzx0YvFu0KYth
         52+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747596566; x=1748201366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nXg9sO2J2PpGD19LKIPbzaC5YUlFKRIC0jceUukRosE=;
        b=Q6TEtbQywlAvBPF/cfIaJKFEzjYK2rPQ8tzjPGn8yF+S3t2tEi6P2VtpZZG4+G1zby
         xYTT6DlqP8Uk27fsn/1a/Wa1J6LALQgZ3okbW4sKa2qg71FL3O3mDqwnSGnF3pkUgVpj
         jaj7qhjBVg8hs+mqZtiwtTS4zTgXHCOivQMTjP5for0JF2cJDOLQMQtNzWEcZhgvzI7N
         YlWeEsyD/Pjf5T/aIfwpsMUGlpf/kJlBDHQbs9UMBHFlJaqfCJeoYwbzW4ncML/RNATx
         z2Z9Jn85tdTp8yChZUjwzeGgxnmbJ+AQ/uTOx0KTIqy7QozqPkmowC8RhH5wf/WseZ2q
         Q7bw==
X-Gm-Message-State: AOJu0Yx6coYNxu2/ZOvORWvQHVq0+EthVs84B4AHO/Kw0MF0fCD2ejmt
	2Qw/oTC2MzOO8QOuTXR6OW6wPoKVwhXEhGlVrCBa0vJaGbf2BSulqE08oB9mzhttfls6xkkv8/T
	XiY2JIOZRF34E
X-Gm-Gg: ASbGncv+SQscslbTNZ/0L0u8GR0ogGx0VvcAt1NL40EugJ+WEb4fCDNaO5HIJO/So4v
	y2Oi7I7Gb4fAmMG8ieke4P8pixB4P1eAJocu3T8apQQTEVVhDMyKhvNYgnuq+t1Sg0AV3Cne3Fy
	Ps8vM3eUpU+jwoAx2f5SWJ15RKLGnZT8uvR93do6C6SqDzFS6Fdyy0yuXfv4jHahC7gO47F5xFn
	kUhsdQipxQAoHGbybNc1g3jh8wOo1oTRYrVwT51eWXk3HEerXew0QKh5POKnnkLRTYFwEyx73Eb
	zCWKTAxW/Na02utMdwPUwm+UPBbX2246+f8Fbh1NAXhMuxuhDY8kR+ASWAQ8OWfptwdBYn2vF5C
	4KUY48CEQnozhM77EVlco
X-Google-Smtp-Source: AGHT+IGcJv4gwd4Ae8pYc5jmGp+ewHiU8v64nrItzNRAZytdoHPo31tz5EXTyZKPNjHeGrJ7+8lgyQ==
X-Received: by 2002:a05:600c:4fd4:b0:441:b00d:e9d1 with SMTP id 5b1f17b1804b1-442fd606ce9mr111858805e9.2.1747596565859;
        Sun, 18 May 2025 12:29:25 -0700 (PDT)
Received: from tux.. (cpc79031-cbly7-2-0-cust13.6-2.cable.virginm.net. [82.14.108.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f338050csm182596135e9.10.2025.05.18.12.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 12:29:25 -0700 (PDT)
From: Dimitrios Siganos <dimitris@siganos.org>
To: Openembedded-devel@lists.openembedded.org
Cc: Dimitrios Siganos <dimitris@siganos.org>
Subject: [PATCH] bvi: add new package
Date: Sun, 18 May 2025 20:28:34 +0100
Message-Id: <20250518192835.229015-1-dimitris@siganos.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 May 2025 19:29:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117461

bvi is a visual editor for binary files

Signed-off-by: Dimitrios Siganos <dimitris@siganos.org>
---
 meta-oe/recipes-support/bvi/bvi_1.4.2.bb | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-support/bvi/bvi_1.4.2.bb

diff --git a/meta-oe/recipes-support/bvi/bvi_1.4.2.bb b/meta-oe/recipes-support/bvi/bvi_1.4.2.bb
new file mode 100644
index 0000000000..e6da1efd41
--- /dev/null
+++ b/meta-oe/recipes-support/bvi/bvi_1.4.2.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Binary VI editor"
+DESCRIPTION = "bvi is a visual editor for binary files."
+HOMEPAGE = "https://sourceforge.net/projects/bvi"
+SECTION = "console/utils"
+LICENSE = "GPL-3.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a36207309d382da27cd66fdaae922e3c"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/bvi/bvi-${PV}.src.tar.gz"
+SRC_URI[sha256sum] = "4bba16c2b496963a9b939336c0abcc8d488664492080ae43a86da18cf4ce94f2"
+
+DEPENDS += "ncurses"
+
+inherit pkgconfig autotools
+
+# build inside the source tree, bvi does not support out of tree building
+B = "${S}"
+
+EXTRA_OECONF += "\
+    --build=${BUILD_SYS} \
+    --host=${TARGET_SYS} \
+"
-- 
2.34.1


