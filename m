Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07998C9830E
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 00:04:07 +0000 (UTC)
Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47676.1790553845414210582
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 17:04:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=M9aakNm5;
 spf=pass (domain: gmail.com, ip: 74.125.227.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2df8818fe1eso7243115ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 17:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790553845; x=1791158645; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z8imTtr1+jSZ6UcoIBsjZGCFlpRzi8Wacm2kPIXXUPA=;
        b=M9aakNm54XDtynUm+yBocL5SuLiCqeNLB1Or5WyT8RiZe1LQ4G2SG3Hcdc6fhSWlv0
         XAxvH67aPU8rsSRhgfMnwVnTRp7++AssQL9QyX/z8JP2P7B1qEmPsG3jThZPlq4y54Ow
         sz9ZkA+WrEXHfKr+g53VsEWPFhylOtO1zr9exCFnB+vW/+nMGhMWAkrDT3tCpAqwctMO
         zawUz45WKdUyMWaWnDdOm3eCoQditNFFSsD++EYZO70lgKT399ycuGUv2n5YkWFLZJWP
         St65bpwpgMNtsxLfN4fd1UST2J7mia3Nv8MEu78VYnNed156EN+/pjySroKYE1OUAyAF
         9nGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790553845; x=1791158645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z8imTtr1+jSZ6UcoIBsjZGCFlpRzi8Wacm2kPIXXUPA=;
        b=lnKwfQVUuTHT7aku//t1pa6tmv/2uaQnjiDeSn8GxXL13Ig8D2AzvA0zl6BqWneIa4
         uU2LuUuiNTN2HNo/wDrUj+TA1C8CmzdiiarivS2Xbl98pRJqJw5sCyIHiRr2oIINpQ4V
         N3Aj2v9SCSWZfehoJ+niEznpjygz185KrBZAMZqycYtYdPWowopn0DlvlJdjxyfU/c2C
         ZPL5tu9RA+8VXCHhmRwQOGmy/qBRnCQaShe7Du+V/3yms4+w4zbLANgwpR2ux2rEXO9d
         G17a0ryY/b94F6BRNGMaqXPgN4wY2fvxt9zc2W+MBPUAR57dgs/tldFmVzNB/e5vg5wD
         mzPg==
X-Gm-Message-State: AFq9FYLeKsJCLYcWjEhoT9MFaUxx2f810XQ7U3CIxg2EaRQC0AlxQMZ8
	AyyB3EGbIYbUywuJy4OrQ9eBzJKXB6cFhXT9lfDT7HAduE1AvQsWPe3/ZaXjrQ==
X-Gm-Gg: AYBFou0i2WD1s/6jE2xcC3f8iEkllbVOEQLs7iiy7DQ0aXOXDYdvWvmZgLQMmIYuryJ
	CDItCpvq1LxdjDKwfi2rz7L5quTgkhNK1IgEFIjfZHUMdi1IlIoWe+oHSTWDi+z3PqHwQhR+MQy
	05aFuOW1GVHxTnF5I0htQC216GOehkceXeehbyNBstUXc7SAxMc6EVz2X+OVc+c8Nt3+vBDQNuG
	roP5whYFEeBpHfmOEB7XXsl6wjMREJGxipaC9vX5goN4zVJLAYsAVxlipk0Um8vMK8VsBYGOG8r
	IVkC5+OnD5XwzEWqKi9YePrUfMHJuhLhZja4PDgtl/wZCTOXwq8rfQyRXwguZy+xuowtxXEQIfh
	6BPaAD+EDbcPy1USg1FcygqTF3xakdp2sLXdBFCfow+lsXK4HHKrYRrmBKuvaniOgDeBnCslnV6
	fVgiLVkDFq0NyxRk+kghb4XpgEwWnLfUYMLx7iCqNGFBIXDjuxZUyR08+AeIa2jxdNgetSDFx2p
	8O0md9HCsIu73L02HQLauZqG2mYzReo8Q==
X-Received: by 2002:a17:903:46c7:b0:2e2:abdf:2084 with SMTP id d9443c01a7336-2e2abdf21famr3262515ad.22.1790553844763;
        Sun, 27 Sep 2026 17:04:04 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913fcbbfsm32347775ad.30.2026.09.27.17.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 17:04:04 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 26/30] python3-pure-eval: upgrade 0.2.3 -> 0.2.4
Date: Mon, 28 Sep 2026 13:02:58 +1300
Message-ID: <20260928000302.2528437-26-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
References: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 00:04:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130413

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-pure-eval_0.2.3.bb => python3-pure-eval_0.2.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pure-eval_0.2.3.bb => python3-pure-eval_0.2.4.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-pure-eval_0.2.3.bb b/meta-python/recipes-devtools/python/python3-pure-eval_0.2.4.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-pure-eval_0.2.3.bb
rename to meta-python/recipes-devtools/python/python3-pure-eval_0.2.4.bb
index 27a6a34f00..6d7ef96216 100644
--- a/meta-python/recipes-devtools/python/python3-pure-eval_0.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pure-eval_0.2.4.bb
@@ -10,7 +10,7 @@ inherit pypi python_setuptools_build_meta
 
 DEPENDS += "python3-wheel-native"
 
-SRC_URI[sha256sum] = "5f4e983f40564c576c7c8635ae88db5956bb2229d7e9237d03b3c0b0190eaf42"
+SRC_URI[sha256sum] = "260c2774686e651b79f8b8e7fc9d80b3599ea6a66334b47d5f4abb69fc2c0ea1"
 
 RDEPENDS:${PN} += " \
     python3-datetime \

