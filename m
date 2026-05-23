Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1ADECD5BB1
	for <webhook@archiver.kernel.org>; Sat, 23 May 2026 03:47:31 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2398.1779508050912740115
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2026 20:47:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FXGygWUX;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2bd266f6fc0so39962815ad.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2026 20:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779508050; x=1780112850; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NEaxPFUGbqs8exj73uhdgx5yYAsYgBi6GLXqqNNkjN8=;
        b=FXGygWUXTYc0s7F3peKjUDsN9pd/dB3iO2LAiPgdnxAj1UUtlE2qs/90+nyZ2Ix35u
         QZigV9kTvhiNTfc2OFO+tjiq5ZMCk18tVm0lfmkw0IJA11v9hGzVGkieNAlTjRKPDmaj
         B/cgznA2B0GAU1t2wEbHyau2dXxdIzBm5JHNpjVXptAB/0TtJWHRwKa8L+/Fe65DEDGP
         dWXm3NsQiYNHuzS7wauxW93ZEo4l1gGvsJsaZd1NQrTMZpMnjZYda8KXXbGu1j+Txgid
         2YJ536T1RzvCrXKrqSuBMzpbq3AjVEl/C3tFgUmaPFD4BEeiNoyeRcV6oBloi2eITTEf
         5Mrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779508050; x=1780112850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NEaxPFUGbqs8exj73uhdgx5yYAsYgBi6GLXqqNNkjN8=;
        b=DioijbfbuPBkDrMRlEPotp5B61L254zfhj/+hxZalvOdMuCxOaIx8OQOE3TQbFQtyo
         NQ7oqYtxrTKpOAq9gKKC94uRF8IUOlhg6ieYu4eTvFIZnv6X2Su4x9xyuyOod9Hayui/
         MgBWZs6/mqBJlmURWECKSK0WPYGps58ITWIpUIJRYLfD/snQJUpppGWu4edE7LfUFJMF
         ep3y7HJxHs9Eih27FEjyaDD1ZWVkYz/hWfd22NzLWJkz9WccrRT957Ex0AK1JvBZmglE
         nxxMCO9Htn9DkGzVSXDBbLCL3RD9ouWfK05FqbXF5HWYSDQ9JGm0JNKddTLRvGnN86FX
         jUBw==
X-Gm-Message-State: AOJu0YzRHP0GLGDD28KagVG8WEjCAlMQRiuFhjUlSIJ2+MC0GqRJIoey
	tUtBANrZR++i2FmL+1xN/D8JfuZ/b65CwQhOgkmM9Xj3nAQcJkCwLg8Qr25wDnaj
X-Gm-Gg: Acq92OG85whIxvssQiAQfOa1Oyhx/yGxb24VJqNsftc6apQjhG514LeOAYPNY28HEqi
	kCsQsmEuRUCdzSV5zYq2DHsHy/7eyUAWY0yL/6EHC9EeoQcKWvmgfPHKfXNe9ajXvFWeajXSCNx
	zBz6+fP+gavaYwT9nf9sTIAmQvqk6zYCQgMEvfkIMR3NPE+RVSYMLQQ77sB8ToBxm127+JW2uDJ
	F0oOvPQ4tfZ05JNutGT+mIWqr3VuUD4Qftb6hsqk3ANl6FcV3HoBLUWg7p9HWiKLWHc0z2j/qsn
	iM2n+SGhSStRhwY0E8DWxHEGmPJvNdEuxU0iPeUzYyDsXVpO8HWx8+wrfdEQ4HvnVbb7ih35DYF
	zsBj4Fvf31IWQm9+qZ6CX3xGxHm4LuwSlYt9ppw1OZG0QfktzeBpJ3EcUGBjuteCBQsNIj7T9P/
	UWF96FjQLI1l4fFBU+rVizosXOWRAaLmTd2+Wr
X-Received: by 2002:a17:902:ebc2:b0:2bd:83e1:5613 with SMTP id d9443c01a7336-2beb067468dmr63869475ad.20.1779508050238;
        Fri, 22 May 2026 20:47:30 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695b83sm28592835ad.9.2026.05.22.20.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 20:47:29 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 1/2] imagemagick: upgrade 7.1.2-22 -> 7.1.2-23
Date: Sat, 23 May 2026 15:47:20 +1200
Message-ID: <20260523034721.256262-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 May 2026 03:47:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127149

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Bug and security fixes
https://github.com/ImageMagick/ImageMagick/compare/7.1.2-22...7.1.2-23

PTEST passed:

root@qemuarm64:~# ptest-runner imagemagick
START: ptest-runner
2026-05-23T03:43
BEGIN: /usr/lib/imagemagick/ptest
...
...
DURATION: 1
END: /usr/lib/imagemagick/ptest
2026-05-23T03:43
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{imagemagick_7.1.2-22.bb => imagemagick_7.1.2-23.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-22.bb => imagemagick_7.1.2-23.bb} (99%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-22.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-23.bb
similarity index 99%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-22.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-23.bb
index dababfbfac..480f9d9a06 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-22.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-23.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://imagemagick-ptest.sh \
 "
 
-SRCREV = "ccf56fb3edd41389a02e4fe7a1a11a18f2b13389"
+SRCREV = "6a10c829fb645e0de1408030e6e0f67e820b0c98"
 
 inherit autotools pkgconfig update-alternatives ptest
 export ac_cv_sys_file_offset_bits = "64"

