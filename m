Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8105.1795739771546912750
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:36:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=SF43ayWR;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2f0458cc9easo59787765ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739771; x=1796344571; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ybCLi/IxC2lsI9OORh//X9/b5XPOIqXrTTeIEOCEAj8=;
        b=SF43ayWRo6Wnm5K8pIpvBqabTz4ZKLKy2mjnz/+FkQYlyFzRhN1mQDUHTf+46sktwY
         /FQcmhvhIuq19gVQMqgz0Zfr22Nx3ZAwD84k9nXPWGKQW/wjNoZAv8oRYOtDOc9mje7P
         HRoATkIDDXQtX8YJL8M/v/aTln9EhbPFMoecCn1HGwEotJ/RbI9q/84SX2zHVHCPE7PG
         kVVjZFkokUSZr0MGk9BDLAJiqzV/TlSxrWJRhJBmfV114WsVMmBv67A8pTNSYW7AeeSU
         p1/EMYbgxRrxgGfzr4iqp5RNPGOeNFx3GTaGp1Tj56kERHc2rDTSeVteJf6OYN+lN1rd
         A8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739771; x=1796344571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ybCLi/IxC2lsI9OORh//X9/b5XPOIqXrTTeIEOCEAj8=;
        b=hk2i4XOgsQxI1F0HUQ2vx9hVbFrR3YbSZMdOywpfGJnnMhy84vGbtlIoxHvQ3hFEiS
         WXbMmK8x9rgOZQHZ8vWyvajp6uJ52EL1t2iJSsv8aDEnj6rJRw4us2L2LiklO5RzuYuF
         mfDfx516QipwR5vNVgqh/yqfbqR0IuEzUNLUzcm5l938mzRm/ft3HSYDvvpzBT/V6eRV
         D+iQ3yTwU1gqpwYZhPrgH/Vc32WfW0a8DX6mobViYwQ6JWp8taczFtNbAYokY26cSpAA
         aFYJt+DHjZjH3Y4gwFnsnFA7fdfG+a0Kf4L9Zq9UvvexWwcbvkfOgcrcFLbMcXSJAK98
         IIzw==
X-Gm-Message-State: APuU4Z9b6SM5dKUO1ggJAqmBKedYtfQvEfWXHA0Ko61oFFiuyKiF8jZu
	dfFMvu3do2+NMTT1LSTSv0k3KCPoh9h7Pc0YQsJ/Z3pVKbPkRypBX3PNNdI/Ug==
X-Gm-Gg: AZFdTZc33fL2fiIj9mTX2DnbeS2YEJPP8X3wB+FHpAyKqLIA1X7fXvzSyo/hHDDzbxQ
	qFI+zGphiY3PuSceKbEE5/QlzIA2PRZXHPit7DQ08mDe/IjD3bYesya+9e35kUS3vpDPCbI7nQE
	uyshEKHXaXqDjY9XEetWDM9rt3Mg4iNtFGt4122t69qRyx3stdyolU/237NWIWZiXGgxxAITeOI
	rX6NA0LWmEhXxwaXym36xPU+/DyUeSCeNilxyjRLFV0Rm88/DRYuNFp8HW/BBVcxT+wIgo2LRdU
	8ZUrZjrwflkYEijj/0rPybjgAU6lrJG41jBoiWW9qSePlZ/Ae2dIAnvlk7Q2zY9mm79Iypg8nO8
	CWnzOfiCFourE7z/gTpBDq/HvCM/wDNwu/cOw+YO1gtSppqMlKL8ZgjbYWidp5Q5b5dXbUPkl7w
	jpIVEdasY8wszroX0cCUw9PAEyTpiI7q3Eha0e2gUZELzNqmETgsURdNuFLyUIQCLAQ6CJ3X4Di
	bMlro2w9HQ97061Dga1l2L908ho+L5KVjOwdrqsAgfv2zNzg6leHywxNnBZxQrwBAieKb4dQxs/
	lDmpb7Oj80N3eN1Ohpi3q0nj6aZrORFAX77SEHBQCsLhZ4jeCkCE7Fk19aL2nquKg4FOYHlVvZ6
	FiZu4dfAIIy1xkaxG/okLQo7epDNAKE4odmdUBVNlFC/I8MmNm2gmab+i1N22qaQh/nUPJYURf2
	kjTdyeJYKrawtgzoXzmPIA2Hbd0R4fxBRxd8uw6jUTH4DOTVituFVavEqz35zaXWf0cQQE0UZ6L
	jymKMtK4vGjXEx1FayH83euywUBz1c4cnEw8vv80AT8OQYINWZOf4b2OBSsjxIOLoZ7hR9L7b5Z
	929inw==
X-Received: by 2002:a17:902:ce82:b0:2e9:7719:4104 with SMTP id d9443c01a7336-2f03ef58f9cmr220359375ad.8.1795739770755;
        Thu, 26 Nov 2026 16:36:10 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0fe9e36f9sm10410875ad.55.2026.11.26.16.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:36:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 06/39] ttf-liberation-sans-narrow: Upgrade to 1.07.6
Date: Thu, 26 Nov 2026 16:35:10 -0800
Message-ID: <20261127003543.2167775-7-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
References: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:36:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133176
Content-Type: text/plain; charset="utf-8"

releases.pagure.org is gone. Sans Narrow was split out of
liberation-fonts into github.com/liberationfonts/liberation-sans-narrow,
which only publishes 1.07.5 and later, so move to the latest release.

1.07.5 is the split into its own project; 1.07.6 fixes a too-wide macron
in the Sans Narrow fonts. The tarball now carries only the Sans Narrow
fonts, which are all the recipe installs. COPYING is unchanged.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ow_1.07.4.bb => ttf-liberation-sans-narrow_1.07.6.bb} | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-graphics/ttf-fonts/{ttf-liberation-sans-narrow_1.07.4.bb => ttf-liberation-sans-narrow_1.07.6.bb} (73%)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.6.bb
similarity index 73%
rename from meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb
rename to meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.6.bb
index a2c30f76a7..2b70a1fcd9 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.6.bb
@@ -5,20 +5,21 @@ DESCRIPTION = "The Liberation(tm) Fonts is a font family originally \
 created by Ascender(c) which aims at metric compatibility with \
 Arial, Times New Roman, Courier New."
 
-HOMEPAGE = "https://fedorahosted.org/liberation-fonts/"
+HOMEPAGE = "https://github.com/liberationfonts/liberation-sans-narrow"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "https://releases.pagure.org/liberation-fonts/liberation-fonts-ttf-${PV}.tar.gz \
+# 1.07.6 is attached to the release notes, not uploaded as a release asset
+SRC_URI = "https://github.com/liberationfonts/liberation-sans-narrow/files/2579431/liberation-narrow-fonts-ttf-${PV}.tar.gz \
            file://30-0-liberation-sans-narrow.conf \
 "
 
-SRC_URI[sha256sum] = "61a7e2b6742a43c73e8762cdfeaf6dfcf9abdd2cfa0b099a9854d69bc4cfee5c"
+SRC_URI[sha256sum] = "8879d89b5ff7b506c9fc28efc31a5c0b954bbe9333e66e5283d27d20a8519ea3"
 
 UPSTREAM_CHECK_URI = "https://github.com/liberationfonts/liberation-sans-narrow/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"
 
-S = "${UNPACKDIR}/liberation-fonts-ttf-${PV}"
+S = "${UNPACKDIR}/liberation-narrow-fonts-ttf-${PV}"
 
 do_install:append () {
     install -d ${D}${datadir}/fonts/TTF/
