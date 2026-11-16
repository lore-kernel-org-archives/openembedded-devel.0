Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2.1794851751564661659
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=I7BblJjE;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3791619605cso7087811eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851751; x=1795456551; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/OsnvGDDw//hRbB4prBiJuJvMGLzq64jizt8Insikz8=;
        b=I7BblJjERQ+oqsyi9av1WFq+GGuWQNUq+1ux0sKOG6Ks8L3RhvH/15JNpGp5svwK9F
         wWmQA48flN5mjnD88oQKXnczrwLcyjj2lqS6lQO04G4OucwYgWyTZ/srzwZmFVF5qZKC
         Rf8zNNSqLDM+Cf3EU+JSFenNKk7pp0u80QhNtqg6DzaHJMQvLUZF6qBER1mV4JzJsKhI
         vVzTI3F0NZplhTNrA3bPy3wXTleRER1CQTiGgj4m34dgJ8eCSZReugtO8m9GWJSHqnoU
         MX5EF6gw9NGPrFlO7Atvw0f1hrModgx+KIi3zA+RHyY0Ryv8OkkWvPpa6qFdc/Bm5Ybz
         7liA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851751; x=1795456551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/OsnvGDDw//hRbB4prBiJuJvMGLzq64jizt8Insikz8=;
        b=2nraTqnT1TrQshPbaC6riVR4VwnGNA+0CtKu702+Za1SsjPPrEm1VWA3VhzLuuE1OG
         NJxeaQ+5TTcXkTgDmIHyZ0o/WtGv9CZKswf2xzplVQ+Cg9aA+Jl1ykIab2x2ca3MFU4y
         BdWJ+N/Wr3bOG7jt20wICdgSTO/gjHBTRGcJk76zxCcJtzMnvvDnE0SVf3qckoK4xZpA
         mnQu2Ov0KdSuUZD4D9T7pYPTUIYZLt4J9a9ce0A3fBmxtUVVQDOT0x59pLxegF5df04F
         xfAg05bIGrViwnJ0ZA2iY+ojfMT/ZxTrMRqgqu1X3VvC+lEMlBn2Kvt8V7sT3i8fMZ0a
         bXOw==
X-Gm-Message-State: APuU4Z+/IIX7s66RGSP2ZtWZIgfAdCvky3RxN+qnzXPpcC0HhVjFmg0I
	5wvYv+kEU/o1E84uu408B1L/I77nDaoiX2aLnR6aOc2ur20Nkwzc3q/hbjJvlNxg
X-Gm-Gg: AZFdTZefcJHwBO1Q19kmqZr9c5Gp9SxLKraYDOAj1az4VCPQwULBqzimp8ZiZ2JfvkV
	6uv/dbpDFyZdth+S6i33m6YNumTZ1IMBteoJd4vvqjeBVQi6CuKCBx8geG+CMDvhqIg21bX7okA
	nDX+ZV2xmehP/+997SupSpu4Jpafuu2P5mndZaS+9x6b7pBaH2I23u7PK5TgmzVYx0VX/0PIzmJ
	Rbj1uLPyXL9iFBGXfOM8zY+LXpxdmXzwTmr6zT09qll3bdYw5LqMLNidoRdCkzZaVNezj+ZeHx+
	in3/iHFUmuK5e9Ama7G/YvPkrD/FnvpXPztGqqs/f86x9dB3oBu4m1U2XNsdreN+mpa1XookH8G
	vCB4N4LItIhnLXSonEuZdAnpBKl4v2fsk3K4mAZZBGzgEL0m6V8iavFM/hQm2/lobYIDroFFm2f
	IPZiO/+QiJ93lpaWaKjeiV4+8Ns9Hay5gcoyevt2InkQj9jzn4M8Jug1zOeB1J69DTeyAtbAWe7
	feIlXgmjcWYVUpICQzZrEJqJk91i+2FUZ7WfiJYb7eLCI+l8AKpmZ5QzWOiZR1BNtNAMLzevRtZ
	/ChlEs4kmWzG4HE1qfBfdtLvAnLMIwTxmY7aV9AZl4xwQ/EvNRjHr4XdgaHl8B/hhNDJejqVCDQ
	1p2ZZFG1AZxpraEzSFAqzCTupAuwYlq60dmFaVuWwWLNVPo/3XuwLN/uOMvPKcqNxhzvxasg0xe
	tvXfb0opgHlBQeo18y/F+Txx2Dkswcl+dYAZXQY2jYM5GQ4sN4LzpVUeETuKbEbtDf7e1NAGq9X
	2/5PlD5uWFinIBuGy4sSHVJ1hV+RqeeG5/u4d7Pm2vIrRtMFGZTVS6+LyvrMuNnBd8Aw4FLuC+J
	sM8YTLozH1FriSpyj9VSGdmm7PU=
X-Received: by 2002:a05:7300:fd0f:b0:36c:da71:37e0 with SMTP id 5a478bee46e88-37963564bc7mr15288133eec.2.1794851750870;
        Mon, 16 Nov 2026 09:55:50 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 080/105] python3-pyzmq: upgrade 27.2.0 -> 27.3.0
Date: Mon, 16 Nov 2026 09:53:32 -0800
Message-ID: <20261116175359.342679-80-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:56:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132535
Content-Type: text/plain; charset="utf-8"

Changes:
- Fix default compiler flags for bundled libsodium/libzmq in wheels
  on mac and linux, greatly improving CURVE performance.
- More type coverage.
- Wheel changes: PyPy 3.12 wheels added, i686 wheels target
  manylinux_2_28, PyPy wheels target pp80.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python/{python3-pyzmq_27.2.0.bb => python3-pyzmq_27.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyzmq_27.2.0.bb => python3-pyzmq_27.3.0.bb} (96%)

diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_27.2.0.bb b/meta-python/recipes-devtools/python/python3-pyzmq_27.3.0.bb
similarity index 96%
rename from meta-python/recipes-devtools/python/python3-pyzmq_27.2.0.bb
rename to meta-python/recipes-devtools/python/python3-pyzmq_27.3.0.bb
index 539d610317..3fafb923e1 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_27.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_27.3.0.bb
@@ -31,7 +31,7 @@ SRC_URI:append = " \
     file://0001-test_log-wait-for-subscriptions-instead-of-sleeping.patch \
     file://run-ptest \
 "
-SRC_URI[sha256sum] = "54d4259d1bfae24ecdb5ca79f7acc2eac6c286a02d6a0ae617797cb45f0726d3"
+SRC_URI[sha256sum] = "bbedb3d1d99babc625f1dd9d7438acefd442b36b75073fd6bc1ef7c0a4b96d56"
 
 inherit pypi pkgconfig python_setuptools_build_meta ptest cython
 
