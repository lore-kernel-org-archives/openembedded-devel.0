Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8906.1793358203234932619
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2026 04:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=uYHq5P7J;
 spf=pass (domain: konsulko.com, ip: 209.85.218.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c3f8d72d7ceso91423066b.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 04:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793358201; x=1793963001; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/TrjousrCaTXFdcv0v0fx3xm82gLmAPbMXDGsVFp+OI=;
        b=uYHq5P7JBfVGZ4uqYw8Wa0smpESGl3fuRI1rffpHiQHLbQoYdBZpMZPAQ5Ker5Dj5M
         Xy7Z1ST1/I07DyXoUHgplXszbjpCL/JIPV6DsQ01wmJo9nUl3LXjaBte+IGxhoxPerWh
         5SdjyzGbR/i/bofSISJPjwNbmLVFqigooCv6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358201; x=1793963001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/TrjousrCaTXFdcv0v0fx3xm82gLmAPbMXDGsVFp+OI=;
        b=kb75GudPbfOECXYwKSg8CT5d01bhmSWQIDhy23EPUwID3H5ABsXktkXoRenZUUGCz/
         J8iPrAIeuu4SOrpCfnVRKBmmeMa7tSu2KyBxkrDVp0AGofKiHddcWZJbIa2OpsuPqZ0F
         /1jR50Ezeo9ST7OwpJD96WSDuaRvybZo965c8hZcj4ASgyzgJ+sT1r/S6LVYVTscLpxA
         JvC+5jPuvuStRicSXQeeR3RPte4jiKqLl0T7wZUg4or4AelrnRfbls7CVfvYFqFb4zAv
         WOUBtexy7sjF6tvTUAeqc2Kndx2YjaZUBqzf7fekL+rGgx3GMGJ3+tna06NX3CCFIjZI
         05yw==
X-Gm-Message-State: AFq9FYKaqBQR3DFQ1M2zxLw1YrvelDrQTbw53/MPEDhAgMeOhNCIMfm/
	Ow8ciPzzrxjLNVgXJd1LJyFwCQAjSyx88RFzDjvkgCo+4EwC1Rq1FwEOqtoucE2Jqt9rfrGLGaI
	Gu/H8
X-Gm-Gg: AYBFou1ihMAYNiSk9fe0Cll1gvFWZZfJMXindNNrf4JQqOmG70WkxPrbZnJO/0r419H
	MoTfZg7ziBZhHf1VHu93n1UWtR+BLZQk2d1Kp1EYlWIsZKEUMNwoavdA4t8HDSAb54ycrmaorv7
	it4KWRboY5FzOu+i7T4L05WrXCja0OSFeFd7hYNSmkW9/3QCf1iAYxAq0CtybksZkpMkQsDmIpe
	zeUxsLrHIastxXN6T6OiyXr/+Siz2LiTvh44A531a/UP73/i1U9cEAVPbh24Kq13omFeG8a5O81
	NasMY0eZX4zf06F+JlKvuPwYTMCm/gb5eLSWTOKCyDICpDQpjn8ew6gz8xfpb4PXfPpbbvYVdNt
	qdd40q+HfJSollEYceHRou6A5/u+dzAkfWu2SqgZWlc7ROtu6VXIW5467DqFHso8UWDEivYJ7av
	zNM3xqSA8CI+78vzgob84SHxGQzMMdjIA6y49SLpjtv5GevzvAUyKWOlgGcKGgnXqo2KEFE917A
	lb9oyc4uDDHv/4jjM4Pykhv1uvoviYGfwT5u6Vyg35liQOEuxpdsQ63IVi2d1j5opfFsCgl+AHC
	b+JpE5Pvzsd0mmBWwS+70faUNn/ueX8Gor2rIefkw2noytPiSpgjEav4dDPGuJUHXD6W0QqXR3q
	HOUfJ1vvcizrxJqssOvA9wGnTpT+mZmNh1v29cqdkmDXiD19I/yMQag==
X-Received: by 2002:a17:907:7251:b0:c49:8d28:73ad with SMTP id a640c23a62f3a-c4ca7ad7e39mr167935166b.49.1793358201108;
        Fri, 30 Oct 2026 04:03:21 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm2642151f8f.23.2026.10.30.04.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:03:20 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 07/25] python3-httplib2: Upgrade 0.32.0 -> 0.32.1
Date: Fri, 30 Oct 2026 13:02:51 +0200
Message-ID: <20261030110309.1124614-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030110309.1124614-1-leon.anavi@konsulko.com>
References: <20261030110309.1124614-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 11:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131689
Content-Type: text/plain; charset="utf-8"

Upgrade to release 0.32.1:

- cacerts: remove distrusted Comodo AAA Certificate Services root
  CA due to eMudhra incident https://emudhra.we-have-a-problem.com/

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-httplib2_0.32.0.bb => python3-httplib2_0.32.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-httplib2_0.32.0.bb => python3-httplib2_0.32.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-httplib2_0.32.0.bb b/meta-python/recipes-devtools/python/python3-httplib2_0.32.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-httplib2_0.32.0.bb
rename to meta-python/recipes-devtools/python/python3-httplib2_0.32.1.bb
index 341cb3dd04..54af71c097 100644
--- a/meta-python/recipes-devtools/python/python3-httplib2_0.32.0.bb
+++ b/meta-python/recipes-devtools/python/python3-httplib2_0.32.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56e5e931172b6164b62dc7c4aba6c8cf"
 
-SRC_URI[sha256sum] = "48a0ef30a42db65d8f3399045e1d09ab0ba66e3b9efc360d07f80ea55d286025"
+SRC_URI[sha256sum] = "37900eb8a74576bd99fc39ae1dc8409f95f965d45b56cbcb2194bb55f58a90e1"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3

