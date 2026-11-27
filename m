Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8202.1795739700929619809
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:35:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ujvNLw/J;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-38699cf08dfso9290603eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739700; x=1796344500; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ee+yjL1XQZUwbZkfjFx4FBpuGJBkFJHNG+miQNA+V08=;
        b=ujvNLw/JE87xEJTHUmndjt7scfpVhn4fW+pd2Civ4EGA0F/eauqkRbIsqXy2dBEM7O
         VJK349dO12AxZfLX1SHTRbqFNgT8iOvP8Simih+jxDcGqs3gsLwemwvFl5G9B+Lpo1OP
         nHnmnBCcCzF5NpkHcy0tXo0ukjTOHgoayqXuQNGjVTMn9BzVCVI4Q8cYiSFAQxQkELHf
         b/Y04aXI8C0i4av007Z68/w4V3jttcoocJnaEbzIgWTxAK0Zea9eNvT5QRat5ReesXQw
         vBpOJUGNE8uGTcHGew1+gsavXQ8vaSTo/xtuNqOT7zYbF3F7zSfjg5h/bu0dHtNcEdIp
         yEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739700; x=1796344500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ee+yjL1XQZUwbZkfjFx4FBpuGJBkFJHNG+miQNA+V08=;
        b=zmngc00Lg2ODZ3TNWf8HQWaQnmizYWSZ4cqLLDRCyWtoIrj72BlsaxUa0LlXAllW/M
         dMk0gGgexjzL8NmTHaIfL7sdN3SkOfcFQs9wBKUK5in6Cy93F4mqHTwq1xU2FZI00fJk
         7S3CCdYN4lcfmcI3xjDfANuwCVFMipAX482NDsYlVOeS4bSRVyEG0AOM4L34hjd8713b
         cuCkynGbTaePbeOnCHFgVbF8Ke6peOtd0i2BFgdOUZpX55RU3QkqTUA8kvEdt9SKHw0o
         0UduoPeeGn+ySbzFM5+407PNOz6XhZWuQqJxYZK137/EaqI4D8I5RkPfcDKD6TymmSf/
         AcMw==
X-Gm-Message-State: APuU4Z80x8azYxo0KCh4zfi6x4ZsmEo/SvdDP237Pwjaom02sLTuhEtL
	29nZHOvb7NoiOOLanKYJ/+v7tpjqHEOVttS7iZ6DONU+4QSF3Cv3E+Lav0H3haoA
X-Gm-Gg: AZFdTZevvEckFXSPjHTlTwThKyXDVkEovZi5kU+vdNfDHJ40uItUazY9r07FREgOnFM
	VrJNLNNpVfPgAd3OmOG6GrQt500x/NF1VOsq5ekhLk5jafnuIMZZJ7sqkCQdBcIWeRYK9mhoBbe
	TbUgmLXVmIsWWLrfttdE4FEhnFBw9sRk9NFgqYXbVnvMrKskCJKUmgNWIE3BGZBOGVUjabKlw5z
	h0zkod4REJX0Y5Qg8fPOOedqobcrmzTY0Kp84wbRhrVRd3y/nFbiuMep1XRWRfbt9uocfYYdN/o
	5K1unehpIs+9yv9ClpnFqUnz6ZwybWHhE4MnEqaLNxzXTy58hz10MmNRR6BAdplojbTjlJAuadT
	lphtsXxt0d1eVmQDQPx24EENKW2Ed9WmEAFH6ZwnJpoqBc9en7RghvgijwtqmO7E8up0uVYOvvZ
	2uIjXRgIIjOxDEGt87Rt+Fi+mXD02epTtXLa9spavBq2J3hC4yP9nOvi5a/fIu5GRx13x26NQh8
	IWH+WwybCDBbJPd/EP7RF5I7+JYlj0pWtakgBXtQQVDdV9ojl0vtAZfG8jLaqACqSXtCJr6rdER
	tEzo4BPFdSC//KJjeT8FfMKt7tuwOpzudXk5vbW90oNMHgQIW9wxAaaiSqMtX2AsByo4iyIF88+
	iC0PUWkYvHgFqljmcCovJQesLdgf1o9BTwq3k6pTV34QntcmBIsLzf9KmkdA/V/1gidQ9QKYU9H
	aLrZ3unqdWQBv6aM7GbkhPFzHwuxHhawkrYFI+elVu6Q6delNMmlqv7zqlUqxpuJcoo88ssJCEe
	YLBCNDA7J/ctYHvqE4hwPOncS7qQX/RXOWoX+pWgmEIEaSse3QUwqX5EPrSuX35I739t4UV5kog
	kOsk
X-Received: by 2002:a05:7301:909:b0:386:a3fe:44f3 with SMTP id 5a478bee46e88-386a3fe48d9mr18058343eec.4.1795739700256;
        Thu, 26 Nov 2026 16:35:00 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:34:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 29/69] cairomm: Restrict upstream check to the 1.14 series
Date: Thu, 26 Nov 2026 16:33:45 -0800
Message-ID: <20261127003425.2166632-30-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133129
Content-Type: text/plain; charset="utf-8"

The check reported 1.19.1 from the newer cairomm API series, which
is packaged separately as cairomm-1.16. Only match 1.14.x tarballs.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-graphics/cairo/cairomm_1.14.6.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-graphics/cairo/cairomm_1.14.6.bb b/meta-oe/recipes-graphics/cairo/cairomm_1.14.6.bb
index b5e337e9b5..a4e30d40ec 100644
--- a/meta-oe/recipes-graphics/cairo/cairomm_1.14.6.bb
+++ b/meta-oe/recipes-graphics/cairo/cairomm_1.14.6.bb
@@ -10,6 +10,9 @@ DEPENDS += "boost cairo libsigc++-2.0"
 SRC_URI = "https://www.cairographics.org/releases/${BP}.tar.xz"
 SRC_URI[sha256sum] = "7e0d5c7f29175d573a03ab5c45aef63f48dd91a5caf335a404cd763e4b7cea4a"
 
+# 1.16+ is packaged as cairomm-1.16
+UPSTREAM_CHECK_REGEX = "cairomm-(?P<pver>1\.14(\.\d+)+)\.tar"
+
 FILES:${PN}-doc += "${datadir}/devhelp"
 FILES:${PN}-dev += "${libdir}/cairomm-*/"
 
