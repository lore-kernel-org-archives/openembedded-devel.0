Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48549.1795411891378476231
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:31:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=mhaoIFP8;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-38692f62b22so1251521eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411891; x=1796016691; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i6Uu0DNxIU/peSHAntkB6ZDMyBGctaz4fYzW0EDujlY=;
        b=mhaoIFP8Di8uwZqJYo8kCT2gJ7D0cLI84ARInKH3SD/Ad2dW+I90oD6mUX11aVGC+o
         JxhTkJFxhEC37ZJKHXgYpW6ofhgtzpm/XwRtaXHbh/JkRL9VDgmLSgz9x4el+AViUg8U
         rtw8MwmCC+WMAL8YRiAzSoI0xXToh0dzxTDygXdnEEegZCM211pCUHwo7ePGHmJGIi/3
         yhzJwjzjQ1F6JUm/5uJaWgjHbwtxwYhhD7O3IlNtAIAol97WUOVzuA53QY+yYr1WEqcj
         IcMXGmoF1ABLG/V9ruInKuwvvbhSBWL66dle5tt0glvOGeHRlVR3ZmUPZr4nHmSAceEX
         7Bgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411891; x=1796016691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i6Uu0DNxIU/peSHAntkB6ZDMyBGctaz4fYzW0EDujlY=;
        b=kM1x360W+0siVF+onLBWolhIGXwJw7CgpKBRtYmMfqWB5vrY6/wyYJajUINXI4XZJG
         HHVxGCLGRzrfn9FRhJeWUDT9viqiPYR+vy0ty34YIbRxenJ1JbHrnn56jXFf/T2fhVCt
         s0aEodUqJVU7uC5oNrUbW7kYFR8m27G2iz/qlBnLvTyaqFgAcIITmMI38XODhAz+BX/8
         +lSGxNTDMA3+LBfg2QmX4TnY21Et1Yt5925/Mm2jc22UD8jeU7zj4wa5Vpon0hpscI+d
         UVZ7LDYah8FXkvC9dC54BnbEFPxVCG3jbBASMiHc/KtGeodjws3GXyC0kz+LYsVXpOR9
         Ezzg==
X-Gm-Message-State: APuU4Z/x5iSS1XbdglJ9c+pc3Vy55QaNyB60Mb5Xi/SPA4r7VW0vmgua
	Ip5lrTGOdzdR+XZmXsqAP2BitTGFvWS1KSdK2Pm5JnqN0Owxprgm/kjM6IaFIEsNDkA=
X-Gm-Gg: AZFdTZfNa+gMSnNx6njwKQsiCKzd/X/5Nq+28UGbt/loyNqYYE4J4+RBq4Wdsh3KXJq
	syN9qAx/lCSiNDNj0XDZDa1J2Cin5SASSSpplI3axza0AGDB1i49Fyt8g4ljKe3bExjTMM2prwM
	2yMbIZkxq6QRbH8nC7sq9LtGCiexn/e95dzO/IF5+DkRjEwiifbnuXwCzPSvxFKX7PJ4lGDfsgD
	DSBm0yC2cafWLfk42hynsuWvReIyjSvfDGstY/ke1R/G7KrkU7dTe8guuuDb8RGiUIDBVNnd3JQ
	lTFPxfkISn4PggCLLtY4+MIf6qzyW+Jf+Q+fNLZRtG2lmJJFSM4sbRHA312FCg2ZraZJRx5XcWo
	WF/sOUfkBp+LZPdf6BDiUiXsoCOh2pfk1NkPU5EuArON5R/kcdrL73uiNoFiAMbd0zFgyGGqt1I
	7TmMcKdop5UbuZPEgMVaZJ3K5P56T4O+p/a8UT1pTyKDJzlaAZJutNi9jeqcEkc1Y9jwOpHD7TK
	s3b3lIeyTJaLtKvWYAX8mC56TQjeEk7Z0zc2yPJjdpAzolyCKSjgRBDXcPGxTA+NFOhSC2uMjdV
	jY1Al16MMVuR1OPSXDR4onVDSzZb9BbFEdCuCdZZdZxt9mZ/KZ0LGMT4g91u5yN1C2z1LxUDzwk
	DRuPDE/wFMn7vnKE8B+myz1yr1PH8upxKCcukEoAruFTWAidhC9yg+cv6ho9t2qPtJkNXFRyNxR
	Vdpj6ktF4FfRD5BW/mdWLlkuSpluZIQrSlilHFLa8ikSQmN0Z3LA8h+ABivEVmFqCLXjKTCxVxT
	liIucihVjO2uR3u3dfdX857cb4oeT8/LKsFmD2yUGhfa2p4SX5ljZPbQ2ZO89l7kKpEi9FiRw9d
	PMbs
X-Received: by 2002:a05:7300:8188:b0:382:61d0:f375 with SMTP id 5a478bee46e88-3856e63b050mr16742232eec.7.1795411890662;
        Sun, 22 Nov 2026 21:31:30 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:31:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 03/16] python3-faker: upgrade 40.54.0 -> 40.63.0
Date: Sun, 22 Nov 2026 21:29:33 -0800
Message-ID: <20261123052953.3658549-77-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132864
Content-Type: text/plain; charset="utf-8"

- Add es_AR (DNI, CUIL, CUIT) and es_VE (cedula, RIF) SSN providers
- Use the seeded generator in passport and several es_ES, es_MX,
  sv_SE, el_GR, th_TH and uk_UA providers
- Fix unique random_elements on OrderedDict with zero weights
- Reject nonpositive max_value for positive pyfloat
- Update zh_CN mobile prefixes and IANA timezone names
- Faster random_elements; binary() uses randbytes when seeded

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{python3-faker_40.54.0.bb => python3-faker_40.63.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-faker_40.54.0.bb => python3-faker_40.63.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-faker_40.54.0.bb b/meta-python/recipes-devtools/python/python3-faker_40.63.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-faker_40.54.0.bb
rename to meta-python/recipes-devtools/python/python3-faker_40.63.0.bb
index 99631f46a1..b1d283a42d 100644
--- a/meta-python/recipes-devtools/python/python3-faker_40.54.0.bb
+++ b/meta-python/recipes-devtools/python/python3-faker_40.63.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/joke2k/faker"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=53360c4126f7d03b63cb79b0dab9e9e1"
 
-SRC_URI[sha256sum] = "38fba73e32699a9f1071724d67e5a66a84bf057987cffb27c9d0c979fda3f135"
+SRC_URI[sha256sum] = "6c5a09bfb17b3a5fa29f349a2ea86ec5af959df95ec71adc831268adfccc9d62"
 
 inherit pypi setuptools3 ptest-python-pytest
 
