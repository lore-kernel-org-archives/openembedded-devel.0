Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11814.1795762996682768707
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:03:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=PNU8jv4u;
 spf=pass (domain: gmail.com, ip: 74.125.82.41, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1a3c08d6928so11577284c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762996; x=1796367796; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O8xHDVSwTyGO23ss18EqkaZgN1M29E0tOIZ1IdClyaI=;
        b=PNU8jv4uvc0ysRTvHs2boyAuC5m8AINN6dKDZSYGYPGvpJVz3VQUDGtCqgsMWLHGP9
         sLu9jWygdA26XizD6ZRriZjneseCTXdLz5QsuVlzlKzVmyDC2VbD1H4DFbIYiC2AFknc
         D6MnZD6wsd1eXrPkYwJvtbSL0dFweKoonU8El98T1H5bwsDaCzrSYF5Ih0y6V8RkKYTm
         nXa7AXzVdXdbuLEZ0BQnXmVkJnNjjChQsiBwnZeY1+t5o5TsxiC3AWDRLxwcFzIGJSEY
         VNoeLVdfYtoUX3cGnIwkoyIs3eEdLHsmnBi4zA2SLELQH3jWRItzHeihmVzUmOdu8qr2
         aY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762996; x=1796367796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O8xHDVSwTyGO23ss18EqkaZgN1M29E0tOIZ1IdClyaI=;
        b=MLYTcK41a/5rX1BcZdjAgI4UHJoD8abPoaVXEz2At4NdtSFUFq+lJqMzWIMByN8VqQ
         IjHrYqYosPLzm5/wquSLQXKB+8iZEWa16GqfhjENFy1JW5mF/OVdMBf5xib3SNReDKDA
         HfW0lQqALf9pKg8GEZBEFinIi2+mZwpDazfmeY2tZjQ/pNsg9gSIYWlgHI+kqiRClDwp
         k7OxN/L23ZZsE2sS1IHpeziQrFFhoGxfUNHkqVk0+hMsM8YyF8y+77w0ZC6HAjN2gbgN
         1kUEfH4+4DU/49D3vSbKaPBfqWTY+pP41n4prwq8kbLd7nmUUpNM6jBKJvTNgCqQqOLP
         10MA==
X-Gm-Message-State: APuU4Z9LYdpvfrMcTVxXe/3oLxnCyPuHJ6WGeMYbukGUDZmDyw37ZHkG
	6rf6gtzcUvw8cUoj5hEkyz35HbecNsVin/cEpVj08AZHOGkLH4PItF/EaW+F6NZ0
X-Gm-Gg: AZFdTZfSG11uqWmraV9P501ge+goe0htgaNqbwzAOiOd40OwULi8tY9omZi0GpH94YO
	LUV/MVEadL7sP/8baoCVUr4EHxHzSa0tOEJq8LAC+m4h7AUUIQW/QemXSg/RIDeJovJXc06PLTq
	gyaR9n5Wx79ZQhzSZpuaIFV59LgJPKwxiyc82PpuV3K50ZyKp7CFnp3bPtIkSRVJifTd64E7zzh
	hJqEv/hqzNytsGT40TRnAT/Ie2szLAwMKdv191uW1uWXIf39Q7WmEA/bg9J3JGfZJh9KOQDdx5w
	skptJWnDWDCRIXcyNGRThFCS7Hoq18x/bVC/LoMTgAZQo07ogF8A66I5xKEisVWLj4CPktOaB60
	DDy9mou3UCUco+uqwMzIvkppxlZPgKvpHAiOFSXR4/DHJRaERNmuDf4HkTMFUvxnd27dvyPmMiu
	skUzY23lZUdnVH78KwN81sTAQiTRrjhw5kseoHJULsEyzkeeruRb6fg/YhzEv/ncwXd8pDX8h7X
	MiEDnXONjvdvqfha6VVMn5uw/7uFaMAbH5YmKOKhSku53ih2anXnnBzMsorxMObPKSG4V4GoxhB
	fgTZg53MTTtQBUSWBymf1HUYRJcNRHjq2p9fSsS9SabmO4KEQAdsZy6nl+kph+BRDhAyjFBdVi6
	ndEFI0uE8mxPKwd263ze0G43/crd1SKXjWbEYhVU+uOF8MGsdlTMky0MCCHH6zYzwPNkLNSWrEE
	1BZOX+E4rdwP5C64umyauNKAcYaaBgKmVmVA/MuJ3ItyelqdW1C5BQTOlI+y6wUhsax/2x9qXID
	fxzClonKUAu10LdT9v3XwgLD4ss213tB2V4bidmniKeE4Rc0mn7HzR4ZqmXP+WOkMi9JD75ycZH
	VOAc
X-Received: by 2002:a05:701b:240c:b0:1b5:7111:5c4a with SMTP id a92af1059eb24-1b571115c94mr13799057c88.26.1795762995764;
        Thu, 26 Nov 2026 23:03:15 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e2bd1sm52671117c88.3.2026.11.26.23.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:03:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 4/4] libxml-libxml-perl: Fix upstream version check
Date: Thu, 26 Nov 2026 23:03:08 -0800
Message-ID: <20261127070308.2377122-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070308.2377122-1-khem.raj@oss.qualcomm.com>
References: <20261127070308.2377122-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:03:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133359
Content-Type: text/plain; charset="utf-8"

The default cpan regex is built from the SRC_URI entry including
its ;name=libxml parameter, so it never matched. Set the tarball
regex explicitly.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0213.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0213.bb b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0213.bb
index b3d09629cb..91bfaafb07 100644
--- a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0213.bb
+++ b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0213.bb
@@ -32,6 +32,8 @@ SRC_URI[libxml.sha256sum] = "2af21c5d61ac34ea26a5fabf15ba5a5841e648f7189db3e33b6
 
 S = "${UNPACKDIR}/XML-LibXML-${PV}"
 
+UPSTREAM_CHECK_REGEX = "XML-LibXML-(?P<pver>\d+\.\d+)\.tar\.gz"
+
 inherit cpan ptest-perl pkgconfig
 
 BBCLASSEXTEND = "native"
