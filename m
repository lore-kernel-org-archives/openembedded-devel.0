Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 44EAF79265
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 18:28:10 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id o18-v6so5223443wmc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 11:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=1zYVdyRcnt1bF1xJLEVS3R7dhhRHy/B8/kwu2+tBh3U=;
	b=LnUEYDIDjcV3gLQzGVSav021zqEp/X0YDjg4G2dTWhVtoC5AfbKlXV20m4Wh6KZVvV
	rwZyMq/JkvsVJBfqk2csqSSR6MyQIi58P23kXyKC6akSyzsh2t6Olb5YOBo6I9cqyHsY
	ICfCn8wcWxEEPLKo1sxZjwciVhKxKo2BbIvUlDCPXavY1RNAIOG3MHVfPspRaKn4UjOF
	u/cwnAVEoZib608R6lchftbbF3aXKNpT077Ng2mBLa2nHF+s9/34tR250uEtT9Ouo8nM
	ZibnpATVHHtlIiEbBgq2zqbZzclbejbLeujNSNkBmGZft0hhZ5VOOyKG58Kk74keKoXE
	DfdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1zYVdyRcnt1bF1xJLEVS3R7dhhRHy/B8/kwu2+tBh3U=;
	b=D8+YJloPew1HvrSB+9FzDIygFMh88lqp8Zf5c2zvfJ9lmZK6fQL1yeSxFqh9++mLgo
	J28QDD0/ywkKw7X6CqdmtyK7XNJqTR+MAuN6CT+sNW4Ruu0hOxiGwLuPr1CCMxsqoQMe
	kOkVy1BSGfG0tF+1arh2AqPaly3KOlakWGqyLcMDWaADej9OJ+EAjn/dHGKtF6CfaXu+
	cqfd15/PZ9IX86P9mXeaz6d4THVNqoxBeT4E1XZEdWBsf5CqFzXy7laxphAkPyB5cp6j
	e/tA9tqB6r8CCVpAHiPa6fmR6ngfIDy3+ekemtGcIl1L9X7aepmNYpU3lWxdAPsUFnSl
	ukTg==
X-Gm-Message-State: AOUpUlEELCRbzj2qPmvfLS6na+0uQyqD8QTD0oO5Glj6lr/aMXXrDhpo
	C1Pw982gkir8jZjPYLF/Q7NrUpFW
X-Google-Smtp-Source: AA+uWPz9lqfVU6P1comDAyuHXcXFBwXwunSCXo7OiNReEUYuRQ/AjXIvbdkdKXxdvOLzfobNlDZymQ==
X-Received: by 2002:a1c:c95:: with SMTP id
	143-v6mr17741783wmm.50.1534444090699; 
	Thu, 16 Aug 2018 11:28:10 -0700 (PDT)
Received: from localhost.localdomain
	(p200300F07BC4D1601E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc4:d160:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	g10-v6sm26040224wrv.90.2018.08.16.11.28.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 Aug 2018 11:28:09 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Aug 2018 20:27:46 +0200
Message-Id: <20180816182748.2400-15-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20180816182748.2400-1-schnitzeltony@gmail.com>
References: <20180816182748.2400-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 14/16] libsdl2-net: initial add 2.0.1
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
X-List-Received-Date: Thu, 16 Aug 2018 18:28:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-graphics/libsdl/libsdl2-net_2.0.1.bb   | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/libsdl/libsdl2-net_2.0.1.bb

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-net_2.0.1.bb b/meta-oe/recipes-graphics/libsdl/libsdl2-net_2.0.1.bb
new file mode 100644
index 000000000..0ea96fe1b
--- /dev/null
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-net_2.0.1.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "Simple DirectMedia Layer networking library."
+SECTION = "libs/network"
+LICENSE = "Zlib"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=fe9d52a78585a65224776875510ed127"
+
+SRC_URI = " \
+  https://www.libsdl.org/projects/SDL_net/release/SDL2_net-${PV}.tar.gz \
+"
+S = "${WORKDIR}/SDL2_net-${PV}"
+
+inherit autotools pkgconfig
+
+DEPENDS = "virtual/libsdl2"
+
+SRC_URI[md5sum] = "5c1d9d1cfa63301b141cb5c0de2ea7c4"
+SRC_URI[sha256sum] = "15ce8a7e5a23dafe8177c8df6e6c79b6749a03fff1e8196742d3571657609d21"
+
+do_configure_prepend() {
+    # create dummy files which autotools consider as mandatory
+    touch ${S}/NEWS ${S}/README ${S}/AUTHORS ${S}/ChangeLog  
+
+    # Remove old libtool macros.
+    for macro in libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4; do
+        echo ${S}/acinclude/macro
+        rm -f ${S}/acinclude/$macro
+    done
+}
-- 
2.14.4


