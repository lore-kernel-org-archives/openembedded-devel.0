Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A48C3DA6F
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 08:54:14 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.9371.1692953650374831723
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Aug 2023 01:54:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=stF7QYnt;
 spf=pass (domain: konsulko.com, ip: 209.85.221.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-31c615eb6feso514990f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Aug 2023 01:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1692953648; x=1693558448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=udUAHhaSBZzKQbt+itHc7Q6UNX9Roazr12EYn87hUH0=;
        b=stF7QYntRMKngfWzuuHuWZTj5KBSwSsU8XU/osY14f6DXQEp9PeLU8kY2TKFfGbr1i
         /Rj0sLuROYBVPTM9/l1L+yyFhxelVGAVVcLFvIUta5tM+vSgMkv2OgcCkkkKFojsdONk
         jxdH4kn9pfhQaNt7r3tE4lMn2LWV5x1yvJVPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692953648; x=1693558448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=udUAHhaSBZzKQbt+itHc7Q6UNX9Roazr12EYn87hUH0=;
        b=jZ926iZQjCC95v2gK73nO9lf5SIBIE+fT0X1HdPrVTw1gSjhPCW4DPCYsDYrdKpRlj
         YrsVIpSgJ7OfehgoE8K5Iw1UhcV0l6Qh+Dcc6/ibdAFEXPWXqTKrVj1bhvty5MSeCNVn
         VgZ+kw+dHfkmSGkQGKTp7kZWvdfJoBOw8tpuYU9rWuQdvKj5qloT87tFltfEYW9Lt0xb
         ijaYP2mVpVlsGRGJ8u/qex1t27GSPKt1Jf6MkfaYNf4fnW1XmkbohzdXGSL8ea4qegyB
         YlGu7ZqfVUZ8x00wJ+bIpdR6g3SMMG6WdyUuCNe4QYQ4sjeCdYvRDMiukkj0FwXv9wL3
         Voog==
X-Gm-Message-State: AOJu0YzrzyVimaIcGRt9p8jK9tiDST1tKddRuk4Mb3u2N6/BTuzYdxad
	O/m65ZBeJx2LxbIhIBpQ8sCYpvXgltGK8oAcEwo=
X-Google-Smtp-Source: AGHT+IGN2XJx+QIbxirygzrK2sStVWUqe2OOH2PiWApA7Aurp+pYjY8OJtCL7H2dM/W8xZo0Vyv+aA==
X-Received: by 2002:a5d:4d85:0:b0:319:7b57:8dc5 with SMTP id b5-20020a5d4d85000000b003197b578dc5mr13314459wru.54.1692953648506;
        Fri, 25 Aug 2023 01:54:08 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id n14-20020a5d51ce000000b0031ad5470f89sm1597128wrv.18.2023.08.25.01.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 01:54:08 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 2/2] neatvnc: add new recipe
Date: Fri, 25 Aug 2023 11:54:05 +0300
Message-Id: <20230825085405.2956415-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230825085405.2956415-1-leon.anavi@konsulko.com>
References: <20230825085405.2956415-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Aug 2023 08:54:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104608

Add a new recipe for neatvnc v0.6.0, a liberally licensed VNC
server library with a clean interface. It is required for building
Weston with VNC backend.

Please note that tls is not part of the default PACKAGECONFIG
because it requires gnutls. However, to use properly VNC it should
be enabled if building Weston 12 with VNC backend.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-graphics/neatvnc/neatvnc_git.bb   | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/neatvnc/neatvnc_git.bb

diff --git a/meta-oe/recipes-graphics/neatvnc/neatvnc_git.bb b/meta-oe/recipes-graphics/neatvnc/neatvnc_git.bb
new file mode 100644
index 000000000..834401520
--- /dev/null
+++ b/meta-oe/recipes-graphics/neatvnc/neatvnc_git.bb
@@ -0,0 +1,40 @@
+SUMMARY = "A liberally licensed VNC server library"
+DESCRIPTION = "This is a liberally licensed VNC server library that's intended to be fast and neat."
+HOMEPAGE = "https://github.com/any1/neatvnc"
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94fc374e7174f41e3afe0f027ee59ff7"
+
+SRC_URI = "git://github.com/any1/neatvnc;branch=master;protocol=https"
+
+SRCREV = "8b3dc1ae6099dcfa73aec3ae11df2fdc58540d14"
+
+PV = "0.6.0+git${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "libdrm pixman aml zlib"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[tls] = "-Dtls=enabled,-Dtls=disabled,gnutls"
+PACKAGECONFIG[jpeg] = "-Djpeg=enabled,-Djpeg=disabled,libjpeg-turbo"
+PACKAGECONFIG[examples] = "-Dexamples=true,-Dexamples=false,libpng"
+PACKAGECONFIG[benchmarks] = "-Dbenchmarks=true,-Dbenchmarks=false,libpng"
+
+PACKAGE_BEFORE_PN += "${PN}-examples"
+ALLOW_EMPTY:${PN}-examples = "1"
+FILES:${PN}-examples = "${bindir}"
+
+NEATVNC_EXAMPLES = "draw png-server"
+
+inherit meson pkgconfig
+
+do_install:append () {
+	if ${@bb.utils.contains('PACKAGECONFIG', 'examples', 'true', 'false', d)}; then
+		install -d ${D}${bindir}
+		for bin in ${NEATVNC_EXAMPLES}; do
+			install -m 0755 ${B}/examples/$bin ${D}${bindir}
+		done
+	fi
+}
+
+BBCLASSEXTEND = "native"
-- 
2.39.2


