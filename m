Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10340.1795753012124387590
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:16:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=UQuTdsOl;
 spf=pass (domain: gmail.com, ip: 74.125.82.49, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b3ada81853so8911329c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753011; x=1796357811; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jyYmXkx2KpEWQkZ2x0XlrQUCzHPatSuOJhAn2glufZk=;
        b=UQuTdsOldiWiAd1YQ/wdGSZhe5CskopTidviX6QBMsxYgGUcoNIonWlNowqi0Ek5nO
         OLT8+GceXPcKXkiA2HlyCR6GbkqDRDmBLjCMSMybrl5Xn4uenMJj7OYI542Fc4kZDgQu
         paqhstNYAkBWoBs1BWzZxy55hDd2woLJmzrWDXy2DMxFbsz3+yvUDMsBIhES1PfHQZrO
         Q6k9Er+LVN94p1cCO3Ku9Owu5HRmmxlVtoL45qKDF4P6EuMLVCi6EP944qFA8NPfUoHy
         w2KSi7ZSE8fC1OnzgHQEous1+g3W6pD/VFsNqT0IYCWHb2lfSPN5tP3jSt0k9SP2DFsT
         GI0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753011; x=1796357811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jyYmXkx2KpEWQkZ2x0XlrQUCzHPatSuOJhAn2glufZk=;
        b=s9HF8tweDO6fRJbueFPC8LiAvbYp/m2tmaSlgc4gGeTvRa85mTifC6/eJ9KhWmJXxH
         f8F3yV38D0PaQ7SAtzrIZLNW/Bpuu3Rd3uxO5o6wxD4o3p1kgEQzqlPYxgUyT7syUxzW
         KDr7w97Yts2DLvv7/H6DH5ckrmx+kBZo/rM0ZFNiwRfUV4C/4mbd/aK51wAbw4QIweCO
         ZXG+ylWzpJWRK6F0RVktJC8Y/xjo6MG3+3aBl3s2Epl6gkho6DCl7XDCgy70KEIEFWji
         Juq/6Hey7WYynsIGKN4AD8ghVXF+Ki2Q/zWKkgD+JTEZ/5Te6mVR6uvlxz5X5vhRT9Ce
         LY2A==
X-Gm-Message-State: APuU4Z8rfpEIf/FCB0dqVhlGlbb2ZFmNGYgIhtS05sTF5tTB0Ldx7CyR
	xFidFQfjIVzv2/VDD7OUq5a7jFKazV5vchwCs+ptL4OFm3Mu4BJNGnPo9ljU8pHj
X-Gm-Gg: AZFdTZeY7YV1UkmoQ5DttGB7lrXBjFv79xAduNj9IG16VKUV/juABwxybKqQmQRQ3yY
	IP052kucpJngMyclogPnPkOigNe7VaLUnJWj9+psSnVjAl5KS5Fht+WfFk77bOUvsg3kusamv1z
	7hyEIVUbagduUri6z3YGcyS9U4+KNS1qzsMJppUQ3yf6XocgHvumHug2zg83GlspovW/t0nvU/i
	KCRwIf+r2p5KoL06ruk0qb2xFdi1/IEYKblwQ1x5o3yMjMGwL7fjkBCzZCZ3C2Zf/z/k9dLUlBY
	j8FnZC8iNbZOQbk54WcboALT1C7T4j6qieB2xITickXBysEIgiXdR0NmX8UYR9HSycRs0bB2nx7
	OrJWcvTBWF20ffRWLBfiHGktq+4jdJ5aitRLbqwu4l42X5fcvVOFefmkag4wh9dgQcCAINvk7xv
	RHR2S4grPR4MOyRFKoVdL3/tU4A8UelyrZdhYYVuJE4lMipWteN3uG4yc8hRXyH8bARMUWBnLpF
	kNcBSwNEIfKqSOd86Oee54Fpmvh4wDAOlIhpMuTvSCG8/21+OVZU9/lU0ahBNJpUvNWBaujPpJg
	cPiqyMW4CBlkGuZPEku8CMs7C9HfYITd9xqwFLIWJ+KnMbw0X799bK9UGUUyY9qAaJph+1nt3Gz
	m23fk1OxmF/hpZq9tuqYxHpYCkPFphUhZYEn1/7AR4z3FcB572JvlNS9k8aameZto/s0HzX4A5m
	7mC3fkYXMT/XwmQKGfL9bF5Ex8nN4RgWCrAZE3i27KeoWsf/ArhRAIfqlK//hdqAtdGzzRuezJE
	BrT201FsgL+OoSzknWY7r3AlWKT70sT+bVTI+knlh1/GqWrsn4+pCxBIsOkt3k4hYPH+QGGMtN7
	+VGoOoEM08zs2sIuo1nhj09F0w==
X-Received: by 2002:a05:7022:28a:b0:18d:5988:8d3 with SMTP id a92af1059eb24-1b5567c1243mr22869043c88.3.1795753011449;
        Thu, 26 Nov 2026 20:16:51 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm52062757c88.2.2026.11.26.20.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:16:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 32/32] python3-javaobj-py3: Build with python_setuptools_build_meta
Date: Thu, 26 Nov 2026 20:16:14 -0800
Message-ID: <20261127041614.1775064-33-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
References: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:16:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133251
Content-Type: text/plain; charset="utf-8"

pyproject.toml uses the setuptools.build_meta backend, so the
pep517-backend QA check warns about setuptools3:

  QA Issue: inherits setuptools3 but has pyproject.toml specifying
  backend setuptools.build_meta, use the correct class [pep517-backend]

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-devtools/python/python3-javaobj-py3_0.6.1.bb        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-javaobj-py3_0.6.1.bb b/meta-python/recipes-devtools/python/python3-javaobj-py3_0.6.1.bb
index 15301e1d67..6804c141c2 100644
--- a/meta-python/recipes-devtools/python/python3-javaobj-py3_0.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-javaobj-py3_0.6.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI[sha256sum] = "088ff086c6aa2912f342754c43b0ca3a504fb869bb5e6f13395131e87744ef3c"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 
 BBCLASSEXTEND = "native nativesdk"
