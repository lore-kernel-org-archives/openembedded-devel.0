Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8F05F7FCCE
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 11:28:22 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id d16so25050518wre.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 03:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=e2o26wxzT2NwX0wQ/b8S0gSC/glT48jrbZS/7wRfne0=;
	b=r9Yx5nvvdIuDNFIs7qkQPodFA9G+1x/1sfuUokN4ZjZcpDfvoGHsP/zaJpNh7+PPZK
	W6DR/2rxaZ/8N4X97fiIvcTMFP9zWrK5vwIsCi9AZytaWdVtj5g2xSPbB0o/OVycRO1Q
	SGhzXQ3W7b0rOFZT6oK3DXaT1JMXEHf7SUBhUxpEFYKksh9D3xH5x1yPy+jGp6B4uo8M
	HcjFcZIJHNmo5k2DIDf+qAmBdSY+JF84qfDbEBbz8M9G9At8hCNxbQbmcZECebcJyNtd
	/oNewtHVh0273vk/p59BOmAQZNO0dE4C9Ejw/Qg3dGzIBOom8UCGpMSAngIBlLbn9avK
	5JwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=e2o26wxzT2NwX0wQ/b8S0gSC/glT48jrbZS/7wRfne0=;
	b=PMeueWLfKbvH2fOoz60IzRF115xr5tzr9/ej4rws59fyNdK/UbiAHi/ur8UOjxsyvw
	Vqka0tikdr3P28A4XD/twndjION49rKSmqzNUzqKDsq8fzpXEGKzUgXinnD780QDdGux
	bLhixsuuKUCa/pdRX319Ds9i1DNpCyJL6MD5/NsvkH8FkobEa5sNDjcMRKgswWKp5Aqt
	9kdb/b21PLQ8SNEU5aBnpe01CpTWkvKSxqxejVWGHPqepQfPkAyeZ2qJg2kkpWGuKd7W
	Pz6aUmBgi032vQMZn+cKf58pnVilJcWxoDgJT7COyAQ9mXOvK6LCdxCZ4SzgZURJSZwL
	KaOw==
X-Gm-Message-State: APjAAAXuOoN+CJGfgX3qb8HO2p7jjuHh5YxNBfXzYsfmSEpabzRVnc51
	2cHObJ02gaem7T4HQHeA3z0z138whYE=
X-Google-Smtp-Source: APXvYqySNeMRWYzBM/Qn5t4dKFq1es5q30t4ttdlxEPGFtGZ5a7ah5VLqNo9gNL8NgNVrCHuN0//Zg==
X-Received: by 2002:adf:e641:: with SMTP id b1mr8063980wrn.34.1579346903044;
	Sat, 18 Jan 2020 03:28:23 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F3CA15804DD3CACFED9DBE9.dip0.t-ipconnect.de.
	[2003:f0:7f3c:a158:4dd:3cac:fed9:dbe9])
	by smtp.gmail.com with ESMTPSA id
	b15sm2965720wmj.13.2020.01.18.03.28.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 03:28:22 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Jan 2020 12:27:53 +0100
Message-Id: <20200118112757.5287-20-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200118112757.5287-1-schnitzeltony@gmail.com>
References: <20200118112757.5287-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 19/23] vlc: add mime-xdg to inherit
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
X-List-Received-Date: Sat, 18 Jan 2020 11:28:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-multimedia/recipes-multimedia/vlc/vlc_3.0.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.8.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.8.bb
index fa7174d32..e29ade65c 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.8.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.8.bb
@@ -24,7 +24,7 @@ SRC_URI = "http://download.videolan.org/pub/videolan/${BPN}/${PV}/${BP}.tar.xz \
 SRC_URI[md5sum] = "744442ec0c145453ea1d257914c8072e"
 SRC_URI[sha256sum] = "e0149ef4a20a19b9ecd87309c2d27787ee3f47dfd47c6639644bc1f6fd95bdf6"
 
-inherit autotools gettext pkgconfig features_check
+inherit autotools gettext pkgconfig features_check mime-xdg
 
 ARM_INSTRUCTION_SET = "arm"
 export BUILDCC = "${BUILD_CC}"
-- 
2.21.0


