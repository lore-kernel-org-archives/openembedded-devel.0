Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2266A615CB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 06:23:50 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id t6so7648432plj.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2020 22:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=g6bynXPK3nuDRDthPQXimurmQlTu5KFwztYM8OYVmRc=;
	b=qJHQxPflGapHwcgUgrWqZFjwyayRfJ6rMdwYF5fMBKwpJJnokmaeJtgUyNK5wAz+VB
	ter63wktrocFzHTv6Pvmiu/liSpC7yca2Pq5uY2yitDI0Lf1lO6FtUa8kJiV0++MM6Js
	TnkgFs64rTy7IypYozK/eiavAWoPhXXlRNXmyCiL2lgKu6t38HDmyddipfPq70Fn3Q27
	IVF0HMoh2M2SAy0WwZfpngvrzOx8+KzkRkvjxvzfK0dupqA8HvlJX6a3XJvc44wNWMTh
	LcvSMega/n9IuYm4lNNRGMbTz8RRrB8GyHOtyQWOfC1JivIliUQmBaTdAsouE38YkISl
	BqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=g6bynXPK3nuDRDthPQXimurmQlTu5KFwztYM8OYVmRc=;
	b=kMTIDSmxhXsaBvierlEf1NKqIkWk1XYobZAIUHld6KoKvJInMKGJU9oobeeG9qtdku
	0vi97npa9NC+rB5Xe3iR4p/X24TG7y66aBD0YYP9v0KBYHriZo1m7zMI7xco/F/Mblk0
	0uopjPAlJiVhaWsVtlSXZv/ylih+lXD5QHtUoP4zo9ZGa8bC/eK0b/oqBFcXsInE8Wjv
	OY85fSbkb8PUmTmga0lYTo3jLirWcT3aavW7aGhGvLY1KP+nzYFmImO0PPZY1wJ3FL7D
	hVjwpKybvjmYkkhJr4j/j5lfT64AN/F9N2i+muvdonRH5ClkPpV7WVZqtc4G0JZZLjwj
	sKug==
X-Gm-Message-State: APjAAAXc1qE7FwKfxERyQW4XhjNDue9b8ZjX4hpLRQpzoVZPG6RFlPRD
	suQHjLrUIEpGLSPq/Xj2pVesr3dhtUE=
X-Google-Smtp-Source: APXvYqyjKsW7SFiWT+WHXbUTGiy0f4NHcqmzhpVc86Pc+fuy5CAaQVQ8IuNLmLsWRTB/B6gxjU9njg==
X-Received: by 2002:a17:90a:8a98:: with SMTP id
	x24mr808646pjn.113.1582007030793; 
	Mon, 17 Feb 2020 22:23:50 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::98a3])
	by smtp.gmail.com with ESMTPSA id h26sm2573363pfr.9.2020.02.17.22.23.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 17 Feb 2020 22:23:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Feb 2020 22:23:48 -0800
Message-Id: <20200218062348.3742529-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200218062348.3742529-1-raj.khem@gmail.com>
References: <20200218062348.3742529-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 8/8] gupnp-av: Upgrade to 0.12.11
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
X-List-Received-Date: Tue, 18 Feb 2020 06:23:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gupnp/{gupnp-av_0.12.10.bb => gupnp-av_0.12.11.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-connectivity/gupnp/{gupnp-av_0.12.10.bb => gupnp-av_0.12.11.bb} (65%)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.12.10.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.12.11.bb
similarity index 65%
rename from meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.12.10.bb
rename to meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.12.11.bb
index cfd0227e47..1881656b47 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.12.10.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-av_0.12.11.bb
@@ -1,7 +1,7 @@
 require gupnp-av.inc
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/0.12/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "215f626508d76b767f5da7c9b92e87d8"
-SRC_URI[sha256sum] = "8038ef84dddbe7ad91c205bf91dddf684f072df8623f39b6555a6bb72837b85a"
+SRC_URI[md5sum] = "f09e99ae20271b0a8cadce806098ae8b"
+SRC_URI[sha256sum] = "689dcf1492ab8991daea291365a32548a77d1a2294d85b33622b55cca9ce6fdc"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://libgupnp-av/gupnp-av.h;beginline=1;endline=22;md5=2b47b7b5f799d2ebabe62b895e848820"
-- 
2.25.1


