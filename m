Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AFD9C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 05:38:50 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.7612.1645421929016688435
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Feb 2022 21:38:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IIguVBfo;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id v4so14143676pjh.2
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Feb 2022 21:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JXPfcyS6n1Orc9JOQO//XgJdI8YTS5ePiTvuD+KuZ6M=;
        b=IIguVBfovMvQYKh51SUyPMs7ZqCnliFiwDFoMA8rH8r7dAoWOyAktyzeFzFIsDbyDf
         f9NLQuGbQgfTh4ZAMzy39fuTv7n+hJSGf/qj5VTbZBHBCEODz3ZsiRhCVZ50GdiWvynw
         4/tTEQczbEk5/L2AyhqhM8mNqxIPTYwI9y7jYEjSSB6PrvzEBMLuPYaL82cUGMpFb4al
         b39hy0uJNPzAKhB21O1p0IkCqM+f+JWr+Wtb2tecXpOB1hRvc+bURQp68rNe+2f1B6ah
         DrbGpRCzIsAH5gufKshCZ50KxqasfCKnarJfEf0FdAagMdtNQzrCrD+bnrEEDemXvybO
         wgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JXPfcyS6n1Orc9JOQO//XgJdI8YTS5ePiTvuD+KuZ6M=;
        b=jlclshdfy3eUnVYDtID41KnwqnNDpgOR0g7w+Rw2+N6N5s0ezNvLI+cy7rzutmBEde
         hj9di4VKO4rEEF0qj2ZatrO5WNML4nu+//8dsgm+DioDf/cyQMfWd8hl5/IqyPimplle
         ktJI8wn8WGv/H7E4A7YP2odSwGHfPmTaKCbEoiswunLz0LoH44iWeUrDc68P0K0qkGsU
         PHGSIuLV/8vE7oMUBy1y+aL1FZCICVYfBbKJoLtna00fkKhilCIfIg3idvf+uWIUHOW0
         anNzNrE7gRcYltpPEqFxQsUBMgCYZirAiS2FXNOxgz5kOlm01sfNsXD7RVghfAzyuaoh
         tzQg==
X-Gm-Message-State: AOAM533Q0cD08e44XlkzyMQJAzeclmBVl/18DOmC/BrxtBOKzf0mb4pr
	SL+r0KfibmcdYRjN7HZYhGaQ3x8wN4/3KQ==
X-Google-Smtp-Source: 
 ABdhPJwXpIBczb7GtrrWfE4OCXHQqOyP3587eJ5PqHw71kUjmtQFv0AGPq2k7N/pGvGBB1kSoRsHLw==
X-Received: by 2002:a17:902:ed8e:b0:14f:40da:1251 with SMTP id
 e14-20020a170902ed8e00b0014f40da1251mr17181373plj.15.1645421928357;
        Sun, 20 Feb 2022 21:38:48 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 h7sm10527444pfi.128.2022.02.20.21.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 21:38:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [[meta-oe][PATCH v2 6/6] libxml++-5.0: Add recipe for libxml++ 5.0
Date: Sun, 20 Feb 2022 21:38:41 -0800
Message-Id: <20220221053841.98265-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221053841.98265-1-raj.khem@gmail.com>
References: <20220221053841.98265-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Feb 2022 05:38:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95404

This is not ABI compatible with older version which is still used by
many packages so add it such that it can live alongside

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-core/libxml/libxml++-5.0_5.0.1.bb | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-core/libxml/libxml++-5.0_5.0.1.bb

diff --git a/meta-oe/recipes-core/libxml/libxml++-5.0_5.0.1.bb b/meta-oe/recipes-core/libxml/libxml++-5.0_5.0.1.bb
new file mode 100644
index 0000000000..9c3b3e9ad8
--- /dev/null
+++ b/meta-oe/recipes-core/libxml/libxml++-5.0_5.0.1.bb
@@ -0,0 +1,20 @@
+SUMMARY = "C++ wrapper for libxml library"
+DESCRIPTION = "C++ wrapper for libxml library"
+HOMEPAGE = "http://libxmlplusplus.sourceforge.net"
+BUGTRACKER = "http://bugzilla.gnome.org/buglist.cgi?product=libxml%2B%2B"
+SECTION = "libs"
+LICENSE = "LGPL-2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 "
+
+SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
+SRC_URI = "${GNOME_MIRROR}/libxml++/${SHRT_VER}/libxml++-${PV}.tar.xz \
+"
+SRC_URI[sha256sum] = "15c38307a964fa6199f4da6683a599eb7e63cc89198545b36349b87cf9aa0098"
+
+S = "${WORKDIR}/libxml++-${PV}"
+DEPENDS = "libxml2 glibmm"
+
+inherit meson pkgconfig ptest
+
+FILES:${PN}-doc += "${datadir}/devhelp"
+FILES:${PN}-dev += "${libdir}/libxml++-${SHRT_VER}/include/libxml++config.h"
-- 
2.35.1


