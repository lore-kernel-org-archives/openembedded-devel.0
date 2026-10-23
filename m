Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12663.1792777453535209039
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Oct 2026 10:44:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=s2smcpw/;
 spf=pass (domain: konsulko.com, ip: 209.85.128.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so10593275e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 10:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792777452; x=1793382252; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o7hZohA2JImra7p+jgS1B0FAhr7dwg9hG0WoF021y8o=;
        b=s2smcpw/Pphudp3CGGDpAuqpPAnGkAO8Mnsrmhw6xerjmUO6IG0rDOSaYv9H5MB2bl
         JOAe8Fok3ZDWyQXGOCzuSuNANcuVJSyNkcL+ChJBPvgbmvCTTbTdj7rSa7J3+Qb+Eg4p
         5cvRp8FCi32oMrfYUgP8cmx4LBqR7PNu/r2e0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792777452; x=1793382252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o7hZohA2JImra7p+jgS1B0FAhr7dwg9hG0WoF021y8o=;
        b=rkUFm6Wuc0Zrns1dvrhvb+8e0bCfEBhXF+RAXTvc2QjaTdklgy2eyx1NLtqtJl3QDV
         IZi+KgiG1PTyN3CwovEsN2ej4u3kU+mLynmBSxU3blkZrqwvYsWhw8iixXRMaYdIxniZ
         akU+AjsgZATTHZKXboF+xj8jpppLUVXKOuQnlEA4BCE4D7y/hj97jr++1ciaTTtoUl1F
         YG1xvKr6c13cKMFUaxZExOIL/78UTcLA6Up7y3yFlwkR8hCIyGliXQpMMEcyNBpIlylb
         O4opLJZ7FP/T0T3ls9i2nyQbcPAWGKxLLo2rcLb4D5s4OCkjoOR6uEW1AneWP8/0+OLa
         ZS/g==
X-Gm-Message-State: AFq9FYIsE4cBCErrmwMjihTdiaii58Eu2m13hjPrmkVp4z14nzjUX4hA
	nVK+tpCtIuUgsjItgKzGUW/AiJ9MBB1mYem0APotvK84aZNfwo8zHT266DcudtFuG+zg0gpLtGz
	KwatD
X-Gm-Gg: AYBFou0QlDJdfhjektzQ8GVaLftqXldv4ahD3Z3H9YdnyGmLh34X4E7jRyvgkmD1n9s
	7Fbke8bhoripYEcwFdHgzDaz+8+IJ993FIe3/3pGw8duOcT/60Dv1GB8ODJSV6oM1CeWjw9GH6v
	uARWNycg7zj2SL+4+sBjgBpGUAG7t90kXlynIwX8vXMj0MhDaCGx5y5sL/87Dgn9rlzaBvrVUjz
	Ku+mHDQFM0vAd8tFm/8TI3X0ieC0Kd3Aq7Ukf/cpOwp1K3VWnH7SS081B5F8e7z7n8YkUaFkzf1
	1r+0rpK5BZyO4UuWuahtSqvVG8e+VR7GGi8LR/wwJH1FYjB5lFM/o7AFygHE4WDoypY36xjPkFf
	in2/+2qhGcjhD7d7E3l6rnueoOMoGwWXQ590KmX/hyEcONjxsZYGDKPBWy7VHnUHah1/1GtbgvW
	aXNegPggjW2iIG0g9JWviaESbRCItsKsanc4lQ+mD4yf4rqPxa3DBIMTQpnSYknxuipre/SnM+J
	Y29pXmJ9SzEgEwbEJ/3o/8FG/gVssKDJGJpyCfFiy25xIefJhxrMg/z9yy8wcmGB8FFLGicunIR
	CzXd8HSc/lg84vkLb9F83hf6b+Zmzwu09EvNn8duC4MhfjrU14JK8iBUN9nEypXtkky1u6RjXhC
	mXk0z
X-Received: by 2002:a05:600c:a00c:b0:4a2:397:73f2 with SMTP id 5b1f17b1804b1-4a211cd477cmr46918495e9.17.1792777451795;
        Fri, 23 Oct 2026 10:44:11 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d3ee6d8sm1147864f8f.14.2026.10.23.10.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:44:11 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 8/9] python3-jsonpatch: Upgrade 1.33 -> 1.36
Date: Fri, 23 Oct 2026 20:44:00 +0300
Message-ID: <20261023174401.3617912-8-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023174401.3617912-1-leon.anavi@konsulko.com>
References: <20261023174401.3617912-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 17:44:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131387
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.36:

- Honor optimization=False when generating patches
- Preserve the original file when in-place CLI replacement fails

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-jsonpatch_1.33.bb => python3-jsonpatch_1.36.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-jsonpatch_1.33.bb => python3-jsonpatch_1.36.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-jsonpatch_1.33.bb b/meta-python/recipes-devtools/python/python3-jsonpatch_1.36.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-jsonpatch_1.33.bb
rename to meta-python/recipes-devtools/python/python3-jsonpatch_1.36.bb
index 6a1715c6df..3107eddb52 100644
--- a/meta-python/recipes-devtools/python/python3-jsonpatch_1.33.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonpatch_1.36.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4f81c84f9a053e31fe9402a2a4e78864"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "9fcd4009c41e6d12348b4a0ff2563ba56a2923a7dfee731d004e212e1ee5030c"
+SRC_URI[sha256sum] = "7e110cb3c5a1c8768f7170bf8fb9887c4aa575fba74c95239e868b494bd9a522"
 
 RDEPENDS:${PN} += " \
     python3-json \
-- 
2.47.3

