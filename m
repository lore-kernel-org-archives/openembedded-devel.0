Return-Path: <diego.rondini@kynetics.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id EEBB97D39C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2019 22:15:00 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id r17so10229357wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2019 15:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kynetics-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=uEmQY0lqwWzeQhpZDlV1t0MCRT7qv/Cs0q0xn4NPb0k=;
	b=RwsCSeONOwWFXiNwC6k3lkQm8cjqfZJo0tgcZwBZa3TKTaXNVUjuvJRu0IIZzMvYPU
	smKqL0PDxBzXxgEKoadZ8bnaOmxqmVJrZKuMZdiCNLbKDI3kmtjijbK/5FecjLyDvThV
	vw6uN9OzbQ4ZjWq7VRVyk95U/+oKd7xYHzN1OwbB3RPbeidfPrAKg2G/wDFCtJRKt/oG
	AUv/sXcRpJKL7n2P2XiKibkLXthaff7NCzqLcvQGl4FuUB42NnWqTw8hU0F1fmDmT7by
	aYxyepELbr4fKmKcUwJA/5DkjtZ7I9RIh41iNbLNHUkP+nK+/mF/rjsFWTAHpg8vJuMr
	EZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=uEmQY0lqwWzeQhpZDlV1t0MCRT7qv/Cs0q0xn4NPb0k=;
	b=QpqSrUtVoZC6zDw10aJYfqE48xjWAssyiQHrtJ+ixeEJfSCjUGCyVivaTNi2cNXfgO
	FqUpQT71UbNV1QPoP6n+jOY71HdNQ8n6vBpuxNAnpqcKRiVjto3A3eM14ter+0RrXb/v
	H4D3rofx1FDqr/StsDXS78lODR09qOkn5xV79mghAPO8eVsWtfASKJJgbCaZ4l/eR9s2
	+DihBPF2P2L6PX5Y/nPTwCGySD9c8D4WcJbIugaA0tGtQN13Dz80KCPmvu+EQWQfEcoK
	565YbA3kSI/aGuA1lyBJ8+ryUUsJ16ysn/TGM8C9ER2Qgp8GHdjImIA5Vq0MesMILZJR
	m2dA==
X-Gm-Message-State: APjAAAW29oqpB2Afa5s+YPb5XVpjpvPiwLvdQFKiMpyIJEPbp/sKordU
	6treXUkcJKkTJn45k2KQYTKxuMycBcI=
X-Google-Smtp-Source: APXvYqyGtB+CSSHaCTj0DgaPelHWuomPPJDM8SFUJZBZqKAvdZgC+QLEKP2xcx6QgQ+1IAf/I1fC/w==
X-Received: by 2002:a7b:caa9:: with SMTP id r9mr9058790wml.58.1571436901392;
	Fri, 18 Oct 2019 15:15:01 -0700 (PDT)
Received: from localhost.localdomain ([81.29.205.101])
	by smtp.gmail.com with ESMTPSA id
	t11sm6352097wmi.25.2019.10.18.15.15.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 18 Oct 2019 15:15:00 -0700 (PDT)
From: Diego Rondini <diego.rondini@kynetics.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Oct 2019 00:13:39 +0200
Message-Id: <20191018221339.2581-1-diego.rondini@kynetics.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: Diego Rondini <diego.rondini@kynetics.com>
Subject: [meta-oe][PATCH] ttf-roboto: add recipe
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
X-List-Received-Date: Fri, 18 Oct 2019 22:15:01 -0000
Content-Transfer-Encoding: 8bit

Roboto is an Apache licensed sans-serif typeface family developed by Google as
the system font for its mobile operating system Android, and released in 2011
for Android 4.0 "Ice Cream Sandwich".

Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
---
 .../recipes-graphics/ttf-fonts/ttf-roboto_2.138.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/ttf-fonts/ttf-roboto_2.138.bb

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-roboto_2.138.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-roboto_2.138.bb
new file mode 100644
index 000000000..521caff74
--- /dev/null
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-roboto_2.138.bb
@@ -0,0 +1,14 @@
+require ttf.inc
+
+SUMMARY = "Roboto fonts"
+HOMEPAGE = "https://fonts.google.com/specimen/Roboto"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
+
+SRC_URI = "https://github.com/google/roboto/releases/download/v${PV}/roboto-android.zip"
+SRC_URI[md5sum] = "3b43a5cb33196ec25e44d5fcb40219e1"
+SRC_URI[sha256sum] = "c825453253f590cfe62557733e7173f9a421fff103b00f57d33c4ad28ae53baf"
+
+S = "${WORKDIR}"
+
+FILES_${PN} = "${datadir}/fonts/truetype/*.ttf"
-- 
2.21.0


