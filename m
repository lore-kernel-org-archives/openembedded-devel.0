Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 53D6E79CCB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Feb 2019 15:30:17 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id g9so5463211plo.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Feb 2019 07:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=QmZ5mRn2SQ9NeaItYCyz3pseReAuOUzSl2FzsRMqDII=;
	b=NXmQuzoXTsFMtSeYnwS+zakilQr96jcyQOijtQbdbj7Sv3qEDUAJo9ye08swgG9bAv
	rkyYKtR5dkxw8QxkGsJ0zB4hX/0Ch8cwYoVbVrBJ4gvqmIUGUeFJRsFpMozYYDKuxIeI
	z0yATOKYXIdWv8f3NJpdhOIuN4k+BphH7M5YU4ELf2+VrqEHwQc7MewDgY3Iga1fWxdr
	eT44mFMSN1WitbRkfXV+WqDoBybXqFxx/5guu0xF+PlSsxfaaRwaio8faLifmpqxaWpl
	GevT9Fxii2rBEqOj3XRVClZqtJBS+1XVdxwNv83Ev5lprNqi2CL/h9Fsyo+4QOiZIRkC
	FHZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QmZ5mRn2SQ9NeaItYCyz3pseReAuOUzSl2FzsRMqDII=;
	b=dgB5eI8HctXd1kdRu1x1OgRMuXVBHybav7Gxxl+bVWm2989IY9ClBs2pgJWiwOR5eD
	XqLZcifImxMD3EMUxVwzElGJpAJfx5CUPsuhEdgRmV2mV1rPLd4Yfe28aO+Y2kuPq9Fz
	aJoyPP2mBu3ZExXjR3+/aczvNBIJWeVw4r47BJhO+S9DurWcFQ9F6tOJaaMo2Txu4Osz
	GaQ/HszmNu+yGgoPEETblbFW0igKFgSt4YbrzIxoKSDzZcmWKASS3M7yqFRUTO+0CLia
	ayuQC3jVMVP8rjNOatUAUoBqktI7xOH76vObRr2H+c7AY5MwQAWU5Z9B//ZsRcrFJTZF
	WE9w==
X-Gm-Message-State: AHQUAuY3vlZjsrnk0+YOyBGXTLmXzMtgMApJJ2Pu9KGkerCIJM99qUe1
	Vm8xRXW0oqrXwnc7I/fBm5tBbxd3
X-Google-Smtp-Source: AHgI3IbASOn7hh9aOGNukXyNDr4fgkq2ds5ccCn69uR7NjWlMykbJyCI/yynmt4wLaGxPCibl6NfZw==
X-Received: by 2002:a17:902:31a4:: with SMTP id
	x33mr37105954plb.198.1549899018009; 
	Mon, 11 Feb 2019 07:30:18 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::dc44])
	by smtp.gmail.com with ESMTPSA id
	a187sm9341860pfb.61.2019.02.11.07.30.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Feb 2019 07:30:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Feb 2019 07:30:09 -0800
Message-Id: <20190211153009.24991-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190211153009.24991-1-raj.khem@gmail.com>
References: <20190211153009.24991-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] packagegroup-meta-oe: espeak-data is gone
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
X-List-Received-Date: Mon, 11 Feb 2019 15:30:17 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 1ec649355d..96672db9a0 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -226,7 +226,7 @@ RDEPENDS_packagegroup-meta-oe-support ="\
     anthy asio atop augeas avro-c bdwgc frame grail \
     ccid ceres-solver ckermit cpprest ctapi-common daemonize \
     daemontools debsums devmem2 dfu-util dfu-util-native digitemp \
-    dstat eject enca epeg espeak espeak-data fbset fbset-modes \
+    dstat eject enca epeg espeak fbset fbset-modes \
     fftw fltk-native gd gflags glog gnulib gperftools \
     gpm gradm gsl gsoap hddtemp hidapi htop hunspell hwdata iksemel \
     libinih inotify-tools joe lcms lcov libatasmart libbytesize \
-- 
2.20.1


