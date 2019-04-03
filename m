Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id EDA847D2D2
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2019 08:29:57 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id y13so20132483wrd.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Apr 2019 01:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kQK9hVbklzwmJA/MhRCorl5fVkl4y9SneDbmixXhpWI=;
	b=ZIXgEGXo0z4icayEZowmod8mQheIUlCjUT2h/7vyL7K05hyLvknH1SEFz8nP2/UNiM
	VAfHkMFlbs9qb4hB+HH4JAFbA4li0xg0janhiMG8DtOwtcAw/Z/PnWBxuEsQDCjgqL7T
	HOlkwR4uRTJV2ND/j6OLRqNLMwn8fpjrabeaQkTlqMg96ajVxWKHwiVtFyQyYVtQ6N3S
	ooocSH4U1e8yZPMzfEmrwdXsYBDHp/+uJxGHqfFDIi+U8F88rOgmQDhi5eEqxZ1XRnZ2
	8EFBlt3f36PCOu67JgPpceh0Mjee11GhTz62g/ZWQEf2rDruvqytnDF9lCot+WKjewGf
	+MWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kQK9hVbklzwmJA/MhRCorl5fVkl4y9SneDbmixXhpWI=;
	b=DR4BaWVsXbRTVlWQjXF+ycRLEfKJcPnD0zAMcU6MZRHApeYpT5r/IgoKTOHQtJAvZf
	3ezBygkyio/GcIeyJJRBL5pBmYH4bCpz96Nr1wETY5hOFO+TRnk93h5HUJbRlFJeNSiV
	4T4Hjs03WnWajL+gLrul68Q1XzCbS9x+v4v9OGnREkMfyoivQjViibpduOCPlkEZmmwq
	O8dt0tItgykk6n4L0kNv/hX5/jbqBKqtcNWRyY7PNU62pgd6rGroE1rnqeCFJLIE2bUX
	4mI36KOi4YcpOQin5TYhUfwsbr338MT8tXZQVTIQ23RZj3dEwwIFw2tnYCZBzdAdob9G
	zmlA==
X-Gm-Message-State: APjAAAW9H2sFTJxWQzrvWpGuEIGBDi39hPuSGEjwmymvG2056CGOTeo/
	NttD53yBCbPnMcYUDEem4GSWy0/17bY=
X-Google-Smtp-Source: APXvYqwqJ4Wr9r/0Pj6Oxhn+DGEb09dKz5sGHepwjz2UpG282d2HEH4G9gw4UhNP8bsrev3eoTDqRg==
X-Received: by 2002:adf:cd06:: with SMTP id w6mr50280807wrm.52.1554280198417; 
	Wed, 03 Apr 2019 01:29:58 -0700 (PDT)
Received: from VM-VPR.corporate.saft.org
	([2a04:cec0:1050:ef0b:a7a5:d60d:857c:6708])
	by smtp.gmail.com with ESMTPSA id l21sm6975587wme.4.2019.04.03.01.29.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Apr 2019 01:29:57 -0700 (PDT)
From: Vincent Prince <vincent.prince.fr@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Apr 2019 10:28:42 +0200
Message-Id: <1554280123-19112-2-git-send-email-vincent.prince.fr@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554280123-19112-1-git-send-email-vincent.prince.fr@gmail.com>
References: <1554280123-19112-1-git-send-email-vincent.prince.fr@gmail.com>
Subject: [meta-oe][PATCH 2/3] cppzmq: bump version 4.2.3 => 4.3.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Apr 2019 08:29:58 -0000

Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
---
 meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
index 9aff59c..2f99417 100644
--- a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
+++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=db174eaf7b55a34a7c89551197f66e94"
 DEPENDS = "zeromq"
 
-SRCREV = "6aa3ab686e916cb0e62df7fa7d12e0b13ae9fae6"
-PV = "4.2.3+git${SRCPV}"
+SRCREV = "213da0b04ae3b4d846c9abc46bab87f86bfb9cf4"
+PV = "4.3.1+git${SRCPV}"
 
 SRC_URI = "git://github.com/zeromq/cppzmq.git"
 
@@ -13,6 +13,8 @@ S = "${WORKDIR}/git"
 
 inherit cmake
 
+EXTRA_OECMAKE = "-DCPPZMQ_BUILD_TESTS=OFF"
+
 PACKAGES = "${PN}-dev"
 
 RDEPENDS_${PN}-dev = "zeromq-dev"
-- 
2.7.4


