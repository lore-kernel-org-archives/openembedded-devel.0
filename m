Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1D7F377E36
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 16:42:58 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 79so18583553pgf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 09:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=74vSkimhHpWPcEEMbbHHJlmBk5z1B9h6VrmCva5EN9o=;
	b=QYLwNoWH+tBHQqzM0K2JXDOrlzxuhyCLhOmTKlntX0Ob/h+Tr62wi3Z6IYtSpncMMy
	/GXpOOkPAbsSJw0Z7zK7ibkQB7L6UQ0Hx2UDcC65mR42YU7/IbF2Q4gbsYWykEX3cQH1
	zry0Eunw9n+MLE7/Y7QrBejS1g/n/1eCKQv0NWCd6egt22N8t+vLUjDTd8AaxIZdmOfU
	ia6uZrczE+wIni0qIpKoj3Fq36DSCDBgrFYIOn39GW0AOs5NNL302HwkDBMx0dH0uV6m
	gshXFzSldyppoRBqp0f6aOK7nTbthA4DKeHGw9Ot8i9Wk9iiE7zNaq1uvqWpblpxZMAM
	BJ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=74vSkimhHpWPcEEMbbHHJlmBk5z1B9h6VrmCva5EN9o=;
	b=OkZNUuSnnQDDgI4vZYc5ojvtikK99Sd8ByB5OPVbBBGPj5Yh67GtNqIel5dO2pfJQs
	D+rs3vWmvgeBare1C2BRKM/e/EwiBRWqPU0MGKvtXvN8NwMTm1pdIe8pvBZT0VKjkV4q
	Otc1n5j9Hig1DY+seaJ8sHP/U0aNLPRFsHFvYBt7N74CXD1xHjEVwkhdPc8i4aXnOmL1
	tgwM0lAqs9r09KdwjhiKbAFI/57TaT5qOlmvLMcKlaeDY9yGnXAY6u2mlbQqzFfReN4n
	Vuto41JiMVJN+/jLsaRt+e1xWYMUmo+LlJp4/6AxVhNVGsoDkvYXD+fdsZV5zNdjDO7V
	07+g==
X-Gm-Message-State: AFeK/H2wDihbs19XKJV5MCgATlvs1lMlrdR51+LLvJd/gdObewPvfuZNuKZOGKvjy6B26g==
X-Received: by 10.99.101.67 with SMTP id z64mr4297211pgb.78.1490978579888;
	Fri, 31 Mar 2017 09:42:59 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm11569706pfh.124.2017.03.31.09.42.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 09:42:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 09:42:08 -0700
Message-Id: <20170331164247.5052-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
In-Reply-To: <20170331164247.5052-1-raj.khem@gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 04/43] v4l-utils: Depend on argp-standalone for musl
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
X-List-Received-Date: Fri, 31 Mar 2017 16:42:59 -0000

musl does not bundle libargp like glibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.10.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.10.1.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.10.1.bb
index b9732fedc..4d87b50dc 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.10.1.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.10.1.bb
@@ -6,6 +6,7 @@ PROVIDES = "libv4l media-ctl"
 
 DEPENDS = "jpeg \
            ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11', '', d)}"
+DEPENDS_append_libc-musl = " argp-standalone"
 
 inherit autotools gettext pkgconfig
 
-- 
2.12.1


