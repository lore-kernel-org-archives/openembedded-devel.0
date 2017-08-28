Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 36FFC7813F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Aug 2017 05:38:12 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id g13so3479153pfm.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Aug 2017 22:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8VSYkA2uHIY4uBGDctH+hGK8E1lb5BL5bp4dxaHcOsw=;
	b=HENxcSY7zwa/hPYIGCKwUnGqG6Ng66kIYiAvocSVe2FD4TWjI/aARy4bVXvyR7mEOj
	VyRPIyHFghlzGw+mtSoNERaLszeBLQd5ig6aEVyGAn6mwoGC9pwMuUbSnbKyWwBaKMmc
	CLMWpZ4OOBbShpRJ7HFegIlHSpoTqj1NlUecnbSz2GUKF9M3Yxune/7vcgXiiYm/98+5
	2OHdT1gi6l/wHmwdw2bjv/wPe4TucOj7NJtwtNYJYhs/KWYwhP/hxVxeIk7QwSXjjF9a
	hDOUcKPv/+MlN4Rw1Juf9TzWoC1+AsoznncctQMzbY65DReM8mhXUqLrv4wCrrZ9k/si
	h+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8VSYkA2uHIY4uBGDctH+hGK8E1lb5BL5bp4dxaHcOsw=;
	b=KkEoZSwzRAIgoT++jRKekNwAt+z6cmwTTq5gbN4owfHCG5vmZ/g1mOP2S63pe36CPM
	vE9k1M76w0grN9GfhfxwWo9w7sLZg0TjbsARcA5W0oDP2b7uxkmMXS/LFU8jdg775BRT
	Npqk6eDqGchW2B6AHJFha2ALsIfalIfwEROwEXJSR+NqL+T3Xqn0JqsN2EO2IIp0eynb
	3OQbAO8inbRhBdBoGwp2qBMSnAdsl9b1Veqocwr9D/BeHsMzcguhKdkM/ByFaax4i9sZ
	5Db78yxMS0sfgE19p+HEDIf8JsjORHo8pd7UUS4OXg4Rl7bfViHuPikCCrXqSKm8266l
	hBtw==
X-Gm-Message-State: AHYfb5jWbEc5UCbZ2f462Ip/ogSiOmQRSRsgrlv/hqu/MxRthYDhrSgJ
	Ohh8sCdrq6aMTc0w
X-Received: by 10.99.149.73 with SMTP id t9mr6133847pgn.227.1503898694120;
	Sun, 27 Aug 2017 22:38:14 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::79ab])
	by smtp.gmail.com with ESMTPSA id
	c80sm22113515pfj.26.2017.08.27.22.38.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 Aug 2017 22:38:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 27 Aug 2017 22:38:04 -0700
Message-Id: <20170828053804.37296-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170828053804.37296-1-raj.khem@gmail.com>
References: <20170828053804.37296-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH V2 2/2] squid: Disable format-truncation warning only with gcc
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
X-List-Received-Date: Mon, 28 Aug 2017 05:38:14 -0000

Clang does not support this option

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-daemons/squid/squid_3.5.26.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-daemons/squid/squid_3.5.26.bb b/meta-networking/recipes-daemons/squid/squid_3.5.26.bb
index 9f0ae5da1..3ee96abb7 100644
--- a/meta-networking/recipes-daemons/squid/squid_3.5.26.bb
+++ b/meta-networking/recipes-daemons/squid/squid_3.5.26.bb
@@ -26,6 +26,9 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${MIN_VER}/${BPN}-${P
            file://gcc7-fixes.patch \
            file://0001-tools.cc-fixed-unused-result-warning.patch \
            "
+
+SRC_URI_remove_toolchain-clang = "file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch"
+
 SRC_URI[md5sum] = "dc1830cd361e077814aa39bcc3691d8b"
 SRC_URI[sha256sum] = "41d8845863dcd026c856508cd1599d417c8947ffd96e86e24085f9893cb8b8c2"
 
-- 
2.14.1


