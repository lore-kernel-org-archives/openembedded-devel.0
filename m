Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37958.1795594132498743397
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:08:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=OFbFIOaD;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-386c71feeeaso1724899eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594132; x=1796198932; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z+JX6/nauHhX55zu2xnvQSUS8Jjfpn1QBe6lnnZEifM=;
        b=OFbFIOaD8VrlQ4fC01PL85lmHy8f/wv1pMa8vxtDZTOdR+Li8cM3Df0IQYO2M2Jpsx
         RFJoJSMz+Fnm0zqxFsy+EenRR24/JUjERJOmbQbkJOk/ChOChL9E5CiEps8K5KtgFprI
         2Q8G9WCp6WeurfVKg+Nh0B5/VKw8/duBjKlmPwK+Mxkht14YUdPUToSL+nV4F94PpSMU
         zCCHj/CDWI++AqJ/1ZWHUlIY4bDx1/xrhDRDCdibG5nyznJVe0P23FPYnE4IfhHfL6E1
         oYTknS20yLIBt425TelnWVatbXhsqpbhLlW+4ZTXswZI4FMSODIRO7kkQZIwzFatE3AD
         AR+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594132; x=1796198932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z+JX6/nauHhX55zu2xnvQSUS8Jjfpn1QBe6lnnZEifM=;
        b=UyaQUAxS7ZA7dEIwcy2DPv+9nUA52ijny695r0yIBf89jlmj+CVBsS52gr/6FHL3EV
         94uWBUKnMbUq71xkYbfsRJocusYBHqvSgAo3nwyd5ppz+94FslVVQnPgfCP6G9rIuHQT
         BWx+yb+z4+xfUBYXlPou2+SBclKeOzII+A+C4l61KUNrR5yKY/dyy4e2dYamyGXsV0UV
         qYHH2YbcP1vH50BW5sINGBU0PfSeiTp0AE0IWn3mRF0eqlUmrT7LKKVsguiXp5GYioME
         36DHhs6po+NreZu7VYeUXBk3a74R2i2+7A6EgcXL0ZdHYFhL6SKluTHAHQmTtmNIOZfV
         fLyA==
X-Gm-Message-State: APuU4Z8Yn7176PK7OvXJPH3PVMz83NFQ3M6Hn2cFpnsFa95zPV0PvZYw
	TbbSdkAyE/L1WNhUd9IS5iYfG+mpRrZ88UXpgOJSB3E1MzmP3I42wWHf4/HMQrs5
X-Gm-Gg: AZFdTZdZ5qU+ld+8NIEpDiOjnjoibVfQMJS/MSVQJPE2m1dsC1X0HZ4qwF3f9xTnm12
	UYl7Ui7xhICB8vwfBB2KEWvTCF4EIP8L2ejjBIaM80wdHDuq2ijVNiEKvlsZ0S6y3LstVPAuF9b
	CD7kfegwEauOu5jw67g2moLTFbr5rWcFcE+o9i6/zBMVLV8aqrBdu3iHReROO7lTT4pnt2hHHun
	a9JPgFvJo+3mbJvtGT3d7P37dcvIJbGv8gasiFC8XSHGeh6nTvKRMkLAYjuuIsc2Czz53jTlsbN
	NZ94da6lvDjDWYysolMim0l1tOdGf/v6+Z6gkiATH+rqT4QO5XiH6pcYiqx5h7pwXUpFriadziF
	6Hf2KrSPt6bOfNgZnMXD+8+1zAdDbBFXZbunmRgmQnurRFI7REwJV5nyDMUs4gYQxYKETnEx7hM
	LtR+yJVwGcRwuwvIz2iZ2NPEjnRHeIIkkBjlEDPxcRhOYIwfE+UoxfbHnVt15l8Qw1DJUxZm0cv
	w4ckJVZIugnOmsfbrOdLORJUiy2flQmUe1VACY7mFOAGod6mZASwBI4Mum5YC6TtH6x/H4sC1c6
	CZEWuOZlLSH0q/TuAus1+KE5wS3BdR/Df4wstbwyEi3tHNHFo7UEAlvqKtPd2qeILR6KsEcUoJv
	bFrro/RDVHmdDFp+JjIIf5iKjoksiAP1sg2huCNV4YbwEjIuQUQka598+DrEcksEpffUz00EOQR
	V+lWXZt0t6qSKFpOpVKllt4RhPr+JvPjYOxfZhQOwVR8Wa0PIxZWtqCd0oVt2y+5vd0SczSTpuV
	tQhj7gkNJivJJU8bL8BGwL4ISuonYhh53+xiPpp9wfBMKRSKYmwaqP75fkQhlwsVlRrIgWnR+qR
	V57F
X-Received: by 2002:a05:7301:160c:b0:382:c1cf:163b with SMTP id 5a478bee46e88-38571419d38mr17066261eec.32.1795594131872;
        Wed, 25 Nov 2026 00:08:51 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:08:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 01/14] python3-rstr: upgrade 3.2.2 -> 4.0.0
Date: Wed, 25 Nov 2026 00:07:12 -0800
Message-ID: <20261125080732.2419614-62-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133059
Content-Type: text/plain; charset="utf-8"

- Xeger and Rstr are now distinct classes; Xeger no longer inherits from
  the base class
- Default to the SystemRandom() CSPRNG
- Expose star_plus_limit on Xeger and fix errors with repeats larger
  than it; explicit repeats like a{1000} are no longer limited by it
- Require Python 3.11 or newer; support up to Python 3.16

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python/{python3-rstr_3.2.2.bb => python3-rstr_4.0.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-rstr_3.2.2.bb => python3-rstr_4.0.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-rstr_3.2.2.bb b/meta-python/recipes-devtools/python/python3-rstr_4.0.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-rstr_3.2.2.bb
rename to meta-python/recipes-devtools/python/python3-rstr_4.0.0.bb
index 01c27127a8..f9803ab15b 100644
--- a/meta-python/recipes-devtools/python/python3-rstr_3.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-rstr_4.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/leapfrogonline/rstr"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5c15c04f1cdbd42c6152066f0b02102a"
 
-SRC_URI[sha256sum] = "c4a564d4dfb4472d931d145c43d1cf1ad78c24592142e7755b8866179eeac012"
+SRC_URI[sha256sum] = "1a1e7f304b0291edbc12955a9cb4093bfe1c7c1d48e0797e752bb3bf2a24574a"
 
 inherit pypi python_setuptools_build_meta
 
