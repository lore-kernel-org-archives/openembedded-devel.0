Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8855.1792580477064744958
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 04:01:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=sd0CPxJu;
 spf=pass (domain: konsulko.com, ip: 209.85.221.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e20edd106so416851f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 04:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792580475; x=1793185275; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hj1MNq637zhoHfOGNY41hnUvUzyCS0xjBcHI3KRfacY=;
        b=sd0CPxJuQ1RHz/UPhX/bQBVhkCqHT3XKgjmQjtMKh9m5ZzYHCoJ5D8v4zIBkx+rlsk
         KtlqOVcqcrDQl/Ycwlh/I7YcGWO5KNkq9dN8E71nhtC9kLPhuJRsat60Jt1gWuKKSOPl
         IeCwyxJAANwPG6oHDHIx6ZMC7zdLwp0bnBPt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580475; x=1793185275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hj1MNq637zhoHfOGNY41hnUvUzyCS0xjBcHI3KRfacY=;
        b=dKiIM+cbXItAQCNfbKigYfMSok4Rl7aC1wEECC6wz3QDfQaytg87wcOstDIKs7qP3d
         lH5frOEYDzGanzHJnodLhytp7p1vLNu/bvySLpW/2JM4zKnEfJXF69iH89MxwGoKOy2p
         eoDHxT7cFZuWl2c/ejk41uLJ1fJ15Wlm0gna+yJse26vO7ycLqxU0y6soEe+YIX47QlA
         Wyvzja45jtIVV0raKqNMGe20zlOp0s3f4hRk6mwcL+H8CG5gmh9QO0+7SfhGSeiYoAqU
         zZiA81eNf80QBJsUj25o6x18SYw0Cl1tx9iRAxIp/lC5cS6vnxiLy7GeX3iYs0oaphJ0
         bs9A==
X-Gm-Message-State: AFq9FYLCcorMdAHQXECac9Ni/D3DhuPS0Lcbb7nRj633umROsAVAoAdy
	BDbftgyugYrsHVztCcPYOLy98ha86ARXN+dFqDsQwg53moY5/MMfWaxcLA+8Rfzz3JAxGZgE2kZ
	9sIk8
X-Gm-Gg: AYBFou1w4WK/PasPCuMJbkby6x8w15v6cvEo+eeS0PV+rwT2xoUDPjFcjP4TZ6jxaAL
	GIMtueBb7O2CVwidajxJqapqUDoRbdks+2A9MMbOhouvBBaAg6x2H3W0j5Bv3iqaNm94ho/yF2H
	yUOoXZPBCEbjH9zRkudCpVK2Tca/dxOS63BAGRFqnNIHXocgAAFEz7b57DzYsbr5Q4xKYPQJM2C
	cvF2PrshdDo/KCyUzosAGVb55KJgoL7MxiKUz9vi2FxsyvmDun3T9lbW7/pH/3nQcad6AZWMiG5
	nmua6gx6iX1ypIxFaiEU8ud0w9Kwhu4UzIIT9a6LjtqhxBubZP2X+EBc81Y7c7DrgvTHCOfuoas
	RnzniN8zvU4+50XlT21cY/UMoXawlPCkGbh62QDxavetAYiSyiZX579h6QT/qxhzoFZFlOK3Hyz
	E8mpci9wA5GWZPJ/zT4KArlASNb81dhCgohe7xGOGzNZx0WAAptoSgySusLM7HSUaCaAaYhtcDH
	Hg34EP8W6v4ouJNCP615/xIJkyTpscgiu6ysz27van85g8+J7qGE++OEq03NXb9pH4r7vhMSpsi
	68mFrVwXFA6Pi7OmXhLwbDOpBwF+eQ0sS0DWMveNf+iUkVC+HYIYGg9w5fzDhaRgqgsbSB8y/VH
	tYtpK
X-Received: by 2002:a05:6000:4b1b:b0:48e:2448:ea23 with SMTP id ffacd0b85a97d-48e264e5bf4mr3164620f8f.55.1792580473655;
        Wed, 21 Oct 2026 04:01:13 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583e25asm4972423f8f.46.2026.10.21.04.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:01:12 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 04/36] python3-djangorestframework: Upgrade 3.18.1 -> 3.18.3
Date: Wed, 21 Oct 2026 14:00:28 +0300
Message-ID: <20261021110103.1943456-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021110103.1943456-1-leon.anavi@konsulko.com>
References: <20261021110103.1943456-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 11:01:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131263
Content-Type: text/plain; charset="utf-8"

Upgrade to release 3.18.3:

- Restore order_by_precedence from 3.18.1 to fix broken return
  value

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ramework_3.18.1.bb => python3-djangorestframework_3.18.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-djangorestframework_3.18.1.bb => python3-djangorestframework_3.18.3.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-djangorestframework_3.18.1.bb b/meta-python/recipes-devtools/python/python3-djangorestframework_3.18.3.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-djangorestframework_3.18.1.bb
rename to meta-python/recipes-devtools/python/python3-djangorestframework_3.18.3.bb
index b845e55f28..98a8eb7c37 100644
--- a/meta-python/recipes-devtools/python/python3-djangorestframework_3.18.1.bb
+++ b/meta-python/recipes-devtools/python/python3-djangorestframework_3.18.3.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://pypi.python.org/pypi/djangorestframework"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=7879a5a716147a784f7e524c9cf103c1"
 
-SRC_URI[sha256sum] = "605d79fa2ec2f02905492e5ea13d903c2d842d0b4c915a57f7bf02ab9f3c91dd"
+SRC_URI[sha256sum] = "446a9b352e7eff630421ab3f2328bd2401b109a9470afa4a31189994911ed030"
 
 
 inherit pypi python_setuptools_build_meta
-- 
2.47.3

