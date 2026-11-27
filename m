Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8192.1795739680723968550
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:34:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=XfUhhais;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-38692f62b22so9876151eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739680; x=1796344480; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8+xJNpFJlrAha1JpIQvIkz6ps+6ATD1auQnootpXp54=;
        b=XfUhhaisCzcb0aRc5iCI7/ODYMhvAjVuC7Vyyc1AlzmQQk/QJuoV/hvaR2Z1V13wJK
         GGd0Ljrc9+6aFRNdrGGbE2Djv64ecJOR3b+fWNluloXz8ES8APV7zlazg5O6EAVTZGH9
         Wc1BG2FE1n+ETEYmh5nB5r8YgZXWKex2LP4gb7Er3zuNK2hMT7mtBVJaPbGm0R6i7PG0
         8HYFnQWbFL8qeNFFCgJzI6C4lyGzRSDbvWIONEW8nKPEqy1HXN0qAf2H8xHtHpzG/MZe
         HNQ53vbiu3ETPP3gFg7ZazbPLceX+n2k8L0ZVtk43gUVZB6vPAioAXdWdqkBoCxSnJz+
         XtMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739680; x=1796344480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8+xJNpFJlrAha1JpIQvIkz6ps+6ATD1auQnootpXp54=;
        b=nbvrtFWVNo5dKH3uq/O7kld9DYFkraJwJk6EIfjuS/fpQhmnHEbIVe+qHCDm6dZ9kw
         iLZFUKQaMBzradDUjKyKDP3K8Nw05s6e1zKaaLNTsOF5lJEBtq4jMtD65yenhvF7dp5Y
         68BrQpi8llDCobuT4VaJKlgbZKj9YjL+lqQrMELEUoZowyU4T69FeQ0tU9J5W18ijp5Y
         3gqVYQpMxzvCMDzQZKjWgnnOz3aVwsPKyG7KSi+e4j8BAMaINfy6Fb1w7xe4djB2Bfux
         sivA12JzWujHCCrAnbB2Eh2G39aoeLfNEjXI2ZMpgFzIiaGiYZOkWDm22MR8KVZrmW0c
         YR/Q==
X-Gm-Message-State: APuU4Z8BS5AXvS0uvhEM4BKOcW2GDs+ckPnyHfMDOvNjdVBxxTX9Nh6P
	KF3EAlx+ADs3ejJgfmwd/Y4aR9roj57i9kOnunXMLAFBm0xHns8dgidwT2ZS7ZVC
X-Gm-Gg: AZFdTZdcE+7jOC+Pxb6af376bckNyEWgUYpAiOc1gTdgDjuINfsu+P5eZdsCBv00O2H
	fXF4CeuZ23Nkm4dSEMh6C7DXGZGb05KjtszQLepZy01Udqoynh17+D+1NU+cmWJ5lN0ghn57q6+
	HtkU2GEGN9zenKWx2bwwGT4LILNIW6ALTJ5LSxys+2ZOq1heHfdl/pnLg0yXq6+bbvNjVN1YxJa
	WOdVLLw8Iud3WuIUm41WWn4ldABVQR6aXqpNyVL/4ZzJbZq52FIflGg+fbTnPwABc/qlVw/Ypc2
	bmgC0Ss25TGcAUwlw50dNMYStuuC/4PSNZBsoqPnPiEiE62OcF+PbBOjPcyHpUXfldqHsQsEZwV
	WptMBwrOV4H4id6Kgvf+/myC+piS2ZqrldjJLSm35jAna8dPLLx5ffxt8lRehp6QsnCRhgoZ281
	jSUdRmT582xDBIOLdqbZ6GfS8DNwJhCoy5DssWUmsSj1q4FQ7JsnqAdZLcvPjubHHcUvQWgRlP8
	Qcwl3D+GCCErmECxU8WG62d8asj3oHymdhenJj8lCbENf0ejKlbfPd60q03NXndPwK9gUADXhls
	zKD0vvnoMzNdXeZr6IRfYoQru2LSqmmm1I9yO7GmKjPKCVSN4UFS+ixRqXnwVvMBTq4MDW0JulC
	vklbIN423WIsWsIMTfW2A3X5yw1KMzTiUNSsU1gDtt9bzwbrrRasB+Z/XWxL8TEi4zS15VJkFYq
	UEs33lo81/CrF0e8WIenvECixZOyVotesJPUF5g6PTfj5a1WXT+FKlJXB9vsE/qkgH2Bi7z0r7X
	rRDepevxfWYsYDAUAAfShkVdbxftYZpY5P6SdIsUuwlxQaMWOyuAsIdYE77zawr6zYlxxxuHyTX
	ZTvqdjP7DuqXkAuff8u9/zkUJA==
X-Received: by 2002:a05:7301:4718:b0:380:9c6f:ad0a with SMTP id 5a478bee46e88-3856e63b224mr22072134eec.10.1795739680085;
        Thu, 26 Nov 2026 16:34:40 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:34:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 09/69] gmime: Fix upstream version check
Date: Thu, 26 Nov 2026 16:33:25 -0800
Message-ID: <20261127003425.2166632-10-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133109
Content-Type: text/plain; charset="utf-8"

The unanchored regex matched any number on the GitHub releases page
and reported 11.28 from page markup. Match only the release tag links.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-gnome/gmime/gmime_3.2.15.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-gnome/gmime/gmime_3.2.15.bb b/meta-oe/recipes-gnome/gmime/gmime_3.2.15.bb
index 1f84c5e20a..fa27eab370 100644
--- a/meta-oe/recipes-gnome/gmime/gmime_3.2.15.bb
+++ b/meta-oe/recipes-gnome/gmime/gmime_3.2.15.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://github.com/jstedfast/${BPN}/releases/download/${PV}/${BP}.tar
 SRC_URI[sha256sum] = "84cd2a481a27970ec39b5c95f72db026722904a2ccf3fdbd57b280cf2d02b5c4"
 
 UPSTREAM_CHECK_URI = "https://github.com/jstedfast/gmime/releases"
-UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)$"
 
 EXTRA_OECONF += "--enable-largefile"
 
