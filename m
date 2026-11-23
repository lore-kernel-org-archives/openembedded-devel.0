Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48057.1795411895455200984
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:31:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Y2OXhQus;
 spf=pass (domain: gmail.com, ip: 74.125.82.49, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-14394530ec6so4294192c88.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411895; x=1796016695; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qkax1XUKanCN1FzOIa/QYbIK6hwJ55ZW3PwqE3ucnvI=;
        b=Y2OXhQusZBVN8EjMYeSbnTu8Lq8TINNcMCR0NdbV0q0XOFhStlaC1a8pfAMrOwWYEM
         vifXvS87xxDEgZVvCUKF46+quACcizn74O2ZH7f5HNqZ6wTDJYxGN/kEIF5iyHTq6P8O
         t5leq+dM0EVDhWZsGH6ropt9u9vbU877x8WGwm/tEzxUICqonjvJie1egvROWVBQCSoE
         rz9SqCA01Bxn1Gb+9uIQ8JKt6JQK4MzRUmDrVoTv7xKP7mAYY8fLhSEW4eiS2tiKi6df
         XYD6uqSWSuGVW4RZj9+N4nKt6zyugkGe5nWCmZ9mH38JGud7HyOdvX7GJhTJvfMvATcr
         zQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411895; x=1796016695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qkax1XUKanCN1FzOIa/QYbIK6hwJ55ZW3PwqE3ucnvI=;
        b=WtnzaDopEKcRe6Bu5g/ojZyk4d4aEmJUc6f8N04mRtleottdStn1eOu+qOhgqzbyPp
         AZrkimOh7zxncze4eM/SthnSfKqj5eraw5YHFSU7MgjmgMeDrBkm4qOEO9Gt1AiKvUvX
         48mkbk2jQI7rt4gQST5/vZZX+7FXHkruCoWRHdkJ/FY1ZigtUCoP908sDK2JyTYw/yaF
         vpMl4N+iVdLWhSufzNIp2dcaUlGbXwxyTwGIYtv/fJi5YDsaUDBbU80uV9F9QxJOMHNk
         CH3IbdWB/0pUMLJJIbWbbZUxAt2iA37hu2ZVF7yWxBu3cPizn5M95kjypZ1EPlCMY92b
         kTxg==
X-Gm-Message-State: APuU4Z/+leK426iy0/1q4v3F5KJNzVPsPmsjTL3+eIRl8RxNL5a/OYmn
	zaZ1HQCFzV7IDksuXx+GVD+P2u8h8qC8HYCVnPOIfGR6nDG4xdl0VrqXHTloHystT6E=
X-Gm-Gg: AZFdTZeq3Za/MxVwi1nkJ1Gt8RmWIcUZSw4VwOmjxHv5Q27RJI1JxGYHvDQzxCVjNOB
	ENbrAmANtaKqHrDZOrO36i+du3pAV6cLLFLjhouNnS1z55t8DMO/lEcrQaVqEiY7Y8uXVsl/u9a
	vx4cW8DDubeQI/C0Pwlr+BaHXFTMr0DdvvdnN8RKlTv+/ZtHViV7NPjVvxt5TECorvOVWf712hU
	ReNcJ6s79kX2gd03wlVfMo1pcPV6gZ96XWA5nu+/4wwGmsmk8kbjaS1KQLjyTjpDnUcq3F9XC3Y
	wBgRg2HWYr7GdjZOaR9q+U3M7nkoVfvz0/w/AzOENMIQKuHwfP6gjOAhqYpcLWuSF+uMc9wdzqB
	ITc+raQNIn2BL4DizVFLqYt3QsvQfKu/7EXHt6zbPaQEuzEHti3+AOiDkXTsAGx8YQBYscoyGjU
	TfLo/iBQc/B0Xpbgw1YXJil/qFNuDzbAMTh2zzq3TfVJyTe8s4Tpj002HAY4tnZRn0s5mjJxabH
	eZh7ybJ13Vzy3PE9airGt8lGLAMBerm2MZQvFaKTnCcA/QgK4Sb3M6CygOdcNee0Sloma/F+pAO
	CVIfk/W3P0jE/AVhDrkOw2IvqzQTXw7wPA5yaGr4Vwoja5P7NE8Kaf1QhpxjZNxki6ZatT7bnd2
	ToiObV3HSwiY3L7b6ynPJgZtjm2q/qYVKLsvO4Cohouwko+UNRBY8WflJi6tPQyC94YJ8KcsLb8
	zlPzhTB9yUDoA+84s4EJgzJt6J7D6n3VTkZXj35WCGdV6uq0d/qnPjtciVeBbBRZ8xWPymRM5zH
	RB/Gocl3jdIo0XkCsg1DJgEU7Hyi3n1/v+DGu+MRZuW5yqgw03vvtvw7IDMHOiNZ1qDkeulGNaV
	5AEy
X-Received: by 2002:a05:7300:1486:b0:383:6eb6:5730 with SMTP id 5a478bee46e88-38570e24c0fmr13009831eec.32.1795411894653;
        Sun, 22 Nov 2026 21:31:34 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:31:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 06/16] python3-pydantic-core: upgrade 2.50.4 -> 2.50.5
Date: Sun, 22 Nov 2026 21:29:36 -0800
Message-ID: <20261123052953.3658549-80-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132867
Content-Type: text/plain; charset="utf-8"

Released together with pydantic 2.14.4:
- Bump jiter to 0.19.0, fixing memory issues from the previous release
- Fix more garbage collector tracking issues
- Cache the UTC TzInfo instance
- Respect validation-time strict=True for complex

Regenerate python3-pydantic-core-crates.inc with bitbake -c
update_crates.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-devtools/python/python3-pydantic-core-crates.inc  | 4 ++--
 ...ydantic-core_2.50.4.bb => python3-pydantic-core_2.50.5.bb} | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic-core_2.50.4.bb => python3-pydantic-core_2.50.5.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc b/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
index f2398045ed..f86b1485da 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
@@ -35,7 +35,7 @@ SRC_URI += " \
     crate://crates.io/idna_adapter/1.2.0 \
     crate://crates.io/indexmap/2.14.0 \
     crate://crates.io/itoa/1.0.11 \
-    crate://crates.io/jiter/0.18.0 \
+    crate://crates.io/jiter/0.19.0 \
     crate://crates.io/js-sys/0.3.77 \
     crate://crates.io/lexical-parse-float/1.0.6 \
     crate://crates.io/lexical-parse-integer/1.0.6 \
@@ -138,7 +138,7 @@ SRC_URI[idna-1.1.0.sha256sum] = "3b0875f23caa03898994f6ddc501886a45c7d3d62d04d2d
 SRC_URI[idna_adapter-1.2.0.sha256sum] = "daca1df1c957320b2cf139ac61e7bd64fed304c5040df000a745aa1de3b4ef71"
 SRC_URI[indexmap-2.14.0.sha256sum] = "d466e9454f08e4a911e14806c24e16fba1b4c121d1ea474396f396069cf949d9"
 SRC_URI[itoa-1.0.11.sha256sum] = "49f1f14873335454500d59611f1cf4a4b0f786f9ac11f4312a78e4cf2566695b"
-SRC_URI[jiter-0.18.0.sha256sum] = "49e31424b61d85292bd805dbf643c3ccc44f5f3871fb751209b889ee70585029"
+SRC_URI[jiter-0.19.0.sha256sum] = "4027f86130c7a1997f880ed407580e58514b867af49e7ce44370f80fa6ff999f"
 SRC_URI[js-sys-0.3.77.sha256sum] = "1cfaf33c695fc6e08064efbc1f72ec937429614f25eef83af942d0e227c3a28f"
 SRC_URI[lexical-parse-float-1.0.6.sha256sum] = "52a9f232fbd6f550bc0137dcb5f99ab674071ac2d690ac69704593cb4abbea56"
 SRC_URI[lexical-parse-integer-1.0.6.sha256sum] = "9a7a039f8fb9c19c996cd7b2fcce303c1b2874fe1aca544edc85c4a5f8489b34"
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.50.4.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.50.5.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-pydantic-core_2.50.4.bb
rename to meta-python/recipes-devtools/python/python3-pydantic-core_2.50.5.bb
index a561200f63..0569bc750a 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.50.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.50.5.bb
@@ -13,7 +13,7 @@ require ${BPN}-crates.inc
 SRC_URI += "file://0001-Upgrade-radium-to-1.0.patch;patchdir=${UNPACKDIR}/cargo_home/bitbake/bitvec-1.0.1/"
 SRC_URI += "file://atomic.patch;patchdir=${UNPACKDIR}/cargo_home/bitbake/radium-1.1.0/"
 SRC_URI += "file://0001-cargo.toml-Update-bitvec-to-use-radium-1.x.patch"
-SRC_URI[sha256sum] = "aead3b74b68396bf0feab5d57e050b730ded7df55853c1e048a87e00aaf033c6"
+SRC_URI[sha256sum] = "1e740886083ff95530d694e6a3f09ed914bcf92a496d16acd307c6c3484fc36d"
 
 DEPENDS = "python3-maturin-native python3-typing-extensions"
 
