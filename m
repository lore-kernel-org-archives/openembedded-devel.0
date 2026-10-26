Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7934.1793057205793251162
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2026 16:26:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kps3XmUl;
 spf=pass (domain: gmail.com, ip: 74.125.82.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1931ff67a29so2108123c88.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 16:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793057205; x=1793662005; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kfrIGGBA0DeDCi5Qkzbwsk07xg1PH+CxxKhBOhvh8Zw=;
        b=kps3XmUl7m8LYoQohBl3oiSTbqPeB/6S2U5hA5Sal+/R2qM+UuyU2sPyhrIvFaOn+N
         jeGrMry2H78tNjcEe0WOPuM6CDpnbYXmKFF02LP5eoVw+Wnu/s4KDbGwpWBtvQP3rxnW
         TARTKtMpWAfuGdu0guTKPzaiw7I6fUuAXwdmJJ7vs8a1866D+NgNPu2royRTlT6pFQye
         tZQRA9cF91rcfvnjLJki97+lwnw7JHEn+S2mRMk8B3vEj2M1wD938naJowStZwVaKhHJ
         4g1CTeUb0hx87cMpsqoMGlgR4W7oUtyycBXrURCJB1SL4e9XBoj4nIcn4bTEnjsZcT1s
         kg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793057205; x=1793662005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kfrIGGBA0DeDCi5Qkzbwsk07xg1PH+CxxKhBOhvh8Zw=;
        b=vslmVr+yWn44jpIqWhON/nxMYFwETXIZ2BbuVg+LqfmOexBf0LizJZpCXTW3vbcIOa
         ROp5NTKe/NjzbDcn1Xqcj8SUujoUJBUdTcEZzFzbfhn890RLZu9XNWVTmItT79QlpRQy
         xCchrq0WJBL40EwTLXTKZakCjAc38Mw/2h8WslWmnCJ46g04C0nWxHDC/+mJ8GEF+uUK
         WppxfdihHXR6U3DfH4mLZ8R3kXIq2bZlLdxV/RMi5Q47TNvrxIIdgYiy3a+EjXBxhtmO
         Ab8x7HqktLVidAHipvBGAvBOMP+qQekKBsoaqWpXnV+1nVhbPr4oZ8HMwdUqy3fcRczc
         IvkQ==
X-Gm-Message-State: AFq9FYKFbFN6d2iingleNIjIxCc7fmR5M0dQG4P7uG0z6vHunza3+wI1
	ooNBWG8RGKz32kV5AXAEj2C+TBK/yKngrRLsTBqJqTXIWBUQbvuRE4SjU4iWtw==
X-Gm-Gg: AYBFou073cx2u4ZXJDb5T6yTUZMszI9f8YToMPNkMc8WoHPhZyY5an42/SX5vwqJ6WO
	evqHexVW62fW+hHlTnNjBjF2lMqxSvTcx0TQbY4A92TVvPMWVOPkNxlP/WKAwu6+ohbg6sFnkbW
	XQiefETjghLgVVxgWFWiQ/PQKLPhhfOh6H9mPACxLvoXkOFbaldnBf/MPvah04B9StgAcXC9JN0
	qQmQB1TxBpuj2KOYfOPKAR2ZSDUeWNWPfhIQbgFh9M4iwAjEhTdRRCmYlDODvaRZpSorFwhPFkV
	D8i3JSfiSmqufQnx633LqnmVP5/QKCzXqM/v/A49URn37mPsd+kQUAIWjti/HOtuZu1LOQHCPBs
	KKhI7M3gK308bFzsSUDZhOJ9nRtbD7jX+v7JqSoAOr5okUdReJbF+vNGxNNbcthzQvPRLPj4ySf
	VlnviJnNKNGPYYXFlzBNdr9ZwjX5VB29Z6RB71LoN8lKoHrwK8XGcqGCrH6XqtUL1PVm3ESz25m
	tgw6BgBOw3RaPJ5DlyFv+1RwfE+RH3w3ZWX6muxQvcd608TVdAlcywi90vJxBR8YU+b7YX0N/gw
	Yz9Xsex0E8b1
X-Received: by 2002:a05:7022:7f12:b0:180:15be:1f9c with SMTP id a92af1059eb24-199361b4ecbmr11227170c88.30.1793057204775;
        Mon, 26 Oct 2026 16:26:44 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0e8d700sm32234982c88.10.2026.10.26.16.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 16:26:44 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 7/13] haveged: upgrade 1.9.26 -> 1.9.27
Date: Tue, 27 Oct 2026 12:26:19 +1300
Message-ID: <20261026232625.1275411-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026232625.1275411-1-ankur.tyagi85@gmail.com>
References: <20261026232625.1275411-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 23:26:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131447
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/jirka-h/haveged/releases/tag/v1.9.27

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../haveged/{haveged_1.9.26.bb => haveged_1.9.27.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/haveged/{haveged_1.9.26.bb => haveged_1.9.27.bb} (94%)

diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.26.bb b/meta-oe/recipes-extended/haveged/haveged_1.9.27.bb
similarity index 94%
rename from meta-oe/recipes-extended/haveged/haveged_1.9.26.bb
rename to meta-oe/recipes-extended/haveged/haveged_1.9.27.bb
index 727f856379..13782ddd5d 100644
--- a/meta-oe/recipes-extended/haveged/haveged_1.9.26.bb
+++ b/meta-oe/recipes-extended/haveged/haveged_1.9.27.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://www.issihosts.com/haveged/index.html"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRCREV = "c0edcf284f654321b7c5665fe38106f9321ceeb3"
+SRCREV = "54d8dd95f90c2af87d1b778f0469fae4cc225aa6"
 SRC_URI = "git://github.com/jirka-h/haveged.git;branch=master;protocol=https;tag=v${PV} \
 "
 
