Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id BA84F746F0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 13:32:12 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id c24so8068678wrc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 06:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=O45DQsE+bUXn78o7YXcPVR70AO7rjenTsTbwP0GYBmY=;
	b=MLYXObgY2uBcRyGvdmdmBOU/2blk/IQBEra3nN8sFHiZfxZ/jZpVdDPu18YKArZ3/g
	0/STENmyLtvnK9MotaAi0tVyKnOKbUrARoZP9yIxbadrOzedfkq8En9CPTeUbn04SdG3
	yO747aRZ8UPo/iOI8WXuyGNlmmzAeh4uWYuMgtnNPpgoiZxV8xMesEd3nu/eDNC4b8oW
	NIxGaxIi3Jsf2Fy86uvNE0dReDlx9QaHESBMz9VIbkfL3ngcCvCR3FHo2mUnENv30Hz2
	eQ/tldiHn5R8VSuqRMlviU7CeNfc+0D7y+2lUvUAaU69ZVERccO88rijitEMXlDGr7Ns
	hD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=O45DQsE+bUXn78o7YXcPVR70AO7rjenTsTbwP0GYBmY=;
	b=cXByr5OOna1xeSZbcYtXTkVQTQ05nPgZuwXsNkWAVVnz0eYcKesfr4GCTXHGPIKXfB
	ZnPvJZjO2JBZqzqKaLWOycMRFHjgsedIyU7bW9doME+OmyREAwulFkrQud12MVLm+kf4
	CKJPxPN6mBUmNrjharOUvjuGegAeqGTccg8YhgDvFjS0CDBYftz1ph4SNIYmZ/gt68vK
	RyDjv3h9iV3ZkOhx+2pm2En0ZOC6Z4Np+Q11R5zC7VfJO/uCvu84kHM5OdpdxcjcRSLY
	HAMlytWaaXZ0d/+6+ZYX/kS6wquvM+C65ZgryNEmfyO4DxGGzBisuW/gRgatNL4nCzxY
	w8iA==
X-Gm-Message-State: AElRT7HgIZqHf3bXKEDl+XBbEchrGDtEO7AS+6N6MuyTIv2JNIUbiHJv
	mj9+MsgFSjHt9Z6YsOYFPDouLw==
X-Google-Smtp-Source: AIpwx49LFGDiDYFro6nQMFSQ7cOz5MF4l/OKsFOxp5Lzumakwc1lXGTYEhQ3kY4odWSudb58NhNIqQ==
X-Received: by 10.223.176.7 with SMTP id f7mr9457155wra.257.1522416733341;
	Fri, 30 Mar 2018 06:32:13 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC180221E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:8022:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	93sm10468396wrh.46.2018.03.30.06.32.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 30 Mar 2018 06:32:12 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Mar 2018 15:31:20 +0200
Message-Id: <20180330133151.25882-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180330133151.25882-1-schnitzeltony@gmail.com>
References: <20180330133151.25882-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 08/39] libqmi: refresh 0001-Detect-clang.patch
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
X-List-Received-Date: Fri, 30 Mar 2018 13:32:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-connectivity/libqmi/libqmi/0001-Detect-clang.patch | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi/0001-Detect-clang.patch b/meta-oe/recipes-connectivity/libqmi/libqmi/0001-Detect-clang.patch
index 4047ffbf2..7a3429b9d 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi/0001-Detect-clang.patch
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi/0001-Detect-clang.patch
@@ -12,6 +12,7 @@ compiler are accepted.
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
+
 ---
  m4/compiler-warnings.m4 | 29 +++++++++++++++++++++++++----
  1 file changed, 25 insertions(+), 4 deletions(-)
@@ -53,7 +54,7 @@ index de4a8b0..e4ba718 100644
  		      -Wdeclaration-after-statement -Wstrict-prototypes \
 @@ -17,22 +37,23 @@ if test "$GCC" = "yes" -a "$set_more_warnings" != "no"; then
  		      -Wmissing-include-dirs -Waggregate-return \
- 		      -Wformat-security; do
+ 		      -Wformat-security -Wtype-limits; do
  		SAVE_CFLAGS="$CFLAGS"
 -		CFLAGS="$CFLAGS $option"
 +		CFLAGS="$CFLAGS $option $WERROR"
-- 
2.14.3


