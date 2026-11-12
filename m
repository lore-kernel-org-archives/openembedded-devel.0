Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7033.1794520738133136776
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2026 13:58:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=cdld3VJJ;
 spf=pass (domain: konsulko.com, ip: 209.85.128.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so3762675e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 13:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794520736; x=1795125536; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wi/0LV+YUEO9M62VOkaFbSkkg7Csmqm78tztuczi61M=;
        b=cdld3VJJ5mKSdAUqRoYo6DOPiTvvjAoVKH2XMVoWpXjbpbxwm6l71n/lXrtj/BvWTS
         fgW/43x1yFLmvOMq9AUTkpSWsLfjppfoQzGbZ/vL1l2D0f7nrkFiUSrX68tmhvLT3NiJ
         VHX/zWhji2MPcLF8PtoW0ruvMoCF4pwn7IKGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794520736; x=1795125536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wi/0LV+YUEO9M62VOkaFbSkkg7Csmqm78tztuczi61M=;
        b=ZIZftmGSGj27U76SwnlM+jeMMIHRZnwTJspLYnAlrdHXuFODOdRBmPxImgmmrtWaN8
         idfJlSBY3pKy/CMW8TK5T6JVtfMKaKIqKo9Kp1Nd5ujNk8mYUlO91QoLFxfoN92wZhrM
         SvgZ/US0pCIthkL446y6P6/I0z9CsYcL6+tnoCRLig2LHb2p/kUhhGIv7AIhKglUP1zX
         xY0oQyce1UZoGcoXRIWvX1vcTcebvhuFfnPE+X2OXvgtpICvJgNw7RX/VBqvS+0PYaEK
         lyStCsiK3SC8N7Ybw+PltCmrMh3uNZ4Bbie4j0UfS+RD5y3/TG/Fl1x4WHMPO03PZJTq
         lYQQ==
X-Gm-Message-State: APuU4Z/9q5+JrpyHSpy/48SH0KLhMYlURuqfsUdOnJ5Y5oiz60h0Ykjy
	gEh9kNJpP4tLIRZUHmETZfj3ik7Nzfr7lwdztbwIkQ7lBkigR2VbI0jBAOK+i7J+TN0zakNxuyd
	F6mU0
X-Gm-Gg: AYBFou2lOMFqdfA6yrVGIKTafPyUv27/Hl8W5WGSREohjdLpv3agHgKFw5evQRT4FRj
	lRPtPRP6fIUEKOsMrUcxxjijx6xbYvnXW/FZ699KvK7QGwpD76t38+3DQDi8u9zfysHrgXTUDr0
	llQ0lAF5EjUW63EDNNaQapH2UGB34q5KvP5CuVAHHGMuiwdFtGvxz4Umtdb3jlxnJbfUVHpdAjy
	S+1senJ9GVkHsuyXfHngoKqb6zYKWrscanvq8JjHfGP7+n0qQZ5qK6HGDo2CUui5joBPnqqJ5hd
	zKmzYFpaHQAMEhcpxR54uz05MJ/XmZSYD/spX5H/dvlB5iTujH3mc/UK6P+e935CYESYxkixVDs
	C6YV/P4Ten6QPDBI0asDsTrlPxfa7j5nga0tK+XyppXQgFNmbcvqLzPBZB9kgYxSArAPhuGdPUf
	pYMU44wN5nnP+PoyKaw57lfp3Uk3BCsmc/grNI9p50RGd07Gp0OkErEyFrTclWck7TAdcgrwyaT
	+WrvarsAukJdEMQIZgAKmrPuyPCCvx4VW5OaMb8B012XKm4uK4ZtUnDR2YOSF8g2jdHzxwO9D43
	YU7bMGF6nlMx3txxD1pdiv5AjCwRFGk6F9Wh1l98v0HFroxtB17pQ/h3WfpfHJ4WcHF49wM6S1y
	ua32GnoJobRK/PC8T+2gnjYhJJuCpWUa9X+l2X8vFPIFrNjUaREkirA==
X-Received: by 2002:adf:e18f:0:b0:490:50c1:f352 with SMTP id ffacd0b85a97d-49c713ae3f4mr1484433f8f.39.1794520736272;
        Thu, 12 Nov 2026 13:58:56 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c77393700sm1043896f8f.18.2026.11.12.13.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 13:58:55 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-cbor2: Upgrade 6.2.0.post2 -> 6.2.1
Date: Thu, 12 Nov 2026 23:58:49 +0200
Message-ID: <20261112215852.3336380-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112215852.3336380-1-leon.anavi@konsulko.com>
References: <20261112215852.3336380-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 21:59:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132218
Content-Type: text/plain; charset="utf-8"

Upgrade to release 6.2.1:

- Fixed a segmentation fault on Python 3.12-3.13 when hashing,
  comparing or printing a self-referential CBORTag decoded from
  untrusted CBOR data, such as when used as a map key or set
  element; a catchable RuntimeError (wrapped in a CBORDecodeError
  during decoding) is now raised instead (GHSA-6rgc-8hxm-rj7p)
- Corrected the semantic-decoder example for immutable sets

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-cbor2_6.2.0.post2.bb => python3-cbor2_6.2.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cbor2_6.2.0.post2.bb => python3-cbor2_6.2.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_6.2.0.post2.bb b/meta-python/recipes-devtools/python/python3-cbor2_6.2.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-cbor2_6.2.0.post2.bb
rename to meta-python/recipes-devtools/python/python3-cbor2_6.2.1.bb
index cda44d3864..e7856adf6c 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_6.2.0.post2.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_6.2.1.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a79e64179819c7ce293372c059f1dbd8"
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "3b08ba9f3a556186515000949d478e47e6d55322f9d86bdaef5b4e3d27d48298"
+SRC_URI[sha256sum] = "086c1588bd407a46739da704b5ee7d15225dc998d9582a0519fc6c9a114b25f7"
 
 inherit pypi python_setuptools3_rust cargo-update-recipe-crates ptest-python-pytest
 
-- 
2.47.3

