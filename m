Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8191.1795739678808697069
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:34:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=U4eMiNwU;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-385d8a00598so10996657eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739678; x=1796344478; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iOyHj3LnEA50WVXVqakm47ssjK2/45ObTIT/jMA5BWw=;
        b=U4eMiNwUM/s7j0hBjT4rE4VYqE1WpCUBiNibH5OLjtHkKIcsJfF+lje72NHc25gUX7
         8jddcYew+jLNv5O6VqEc2qMb2t0w5tJHzWtD2vo3hAPbx1f5n89vVVAKwMIxyodjDVSl
         mV811UVRkL9Cek/7qYgj5kwOAggJvTiY3UKsHfxnNiJi8Z6POeAJTmVtjaYWtLT8tfVL
         PEdVWMfNH3bqVISqum0dxuOONISOdnaOabkjNZM2+Aih8Swq45k+hykMbHq4p9Y3h8eB
         935zEWJe0+svTrCFJBDT8tK0H3mJhLkdGw9fpbXAHEulVsYaezI3fx93gObsw9Ctjtc0
         LvpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739678; x=1796344478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iOyHj3LnEA50WVXVqakm47ssjK2/45ObTIT/jMA5BWw=;
        b=YJ7y/dQ8Nd7hJ/XaMSftNzjevXW4g9WvRmsGou4FOx7GVwg16t02JKsa9eAXvfZiEr
         sAlQnl3zUFcs4wUtUv1YZIcmlGBUIAFlrn8DKlxNt3jhNeeKHOz16EfJrxFwN4+ca5jJ
         eJBywOasjn8eiEKGyfmh38BzBT3pMq+lUaRc/bQk+MV0IwmIPnImilvMN9g2ltuD61PO
         T04A3RXFZxpXOI3onRNeAfEpNM+dl36j701bpdZDxGg16CkMAdeCVn6BX4z/LRfc2Yun
         HQUucb1hJ0ye6hMdFg/7GOF6tXG9u18A11dJkIQe5A4jf3VhKXYDz3eucbgIaB5SMKj2
         9RKA==
X-Gm-Message-State: APuU4Z+ffvtGq2Lxo/hv9I2RIMhp/mA54p4kGATzLGnDTNF2HYkerjTc
	sjdrRu4hNI/N3qJ9xokh0SM5pg7sc+d4gwxcXuBvyQ9EUaoTImQlJXJkRBegVGRI
X-Gm-Gg: AZFdTZf1ViF8zs8YJaf1GGqvXSy/rVLFXbAnnjflY8J0Dx5BuXE7QlcSGmXEbUetuBD
	mnfjGGoX9MPxDLcLpiDbO8/kkNVfSuwEP26BoIt3F1+CIEF+qVGcx/UKz2ugQvgkDCVOQeT2jfp
	rfLCvzCfDJfaAq47G3ffFqoX7p/EQEa+4NYSGu7WMIF3j1MPe1IFtry+EM8JR5UG7+yJR/f+B1g
	O/p/CW588l/IyscTGqrxA5gTZ3mLRjN2C5my6ngB//isBFvPdpsO/Oilg8qhO+ndq8kyx5sgDsf
	EzgnBOkRuFKSbFqSPhsUBV/CF+FWIPDTy/aqiUgriWux4Ez9CvlWPoyrsAHmoaedykMrQb8UJDK
	vCzBTnnncTv9YEvQ9b+5GRx0rO0rh6Leg0LVu1MMQTZjMFoL2yEXTf9dqR6FMhfwfH9wAkd9Luc
	mI6S8dBbEAT5Yl7tTGeJcPEGeXEKJ/Hals6DLQ9fe/CSqX+MKOfU4Wycz5WTCDGmYI45O+RiWe3
	N2Z0mTTiZE/ZMh2t5GS0Qin6rt+P09NCfdw3Ten05w8ubzuCCxhKmJYQlyAb94AFovfI0HFPkEZ
	kWuDOfi3ujKEupfLp+4X+jW33dKhjDUh1vBm4lO6E5hfdnBlKkqhYbVKRqVe1CePfkiubeMjfrt
	JCQyeN/CF/bCGyoByy8kOGkKQNhqpaBsRW5GumsAFgsE5z0BiLDKxft4SrTcUp1ra73X1/fUhSC
	zjgKj1WJm+Yhc5hZ+4cV2/eOS04eIIkoLq/ebLgOrZzllwVepHbGrDKWCwKKXoErqUvaRB/KyRd
	/DjM5qVVEpHdVmoiq2uM7AUQMG7dbUnX+PekVnmVqV6PXOM/ndEWeoJCforlvwHDT9SEaYOhlHQ
	WVEG
X-Received: by 2002:a05:7301:d587:b0:381:d92e:ecab with SMTP id 5a478bee46e88-3856f25884emr20959197eec.11.1795739678074;
        Thu, 26 Nov 2026 16:34:38 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:34:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 07/69] cfengine-masterfiles: Fix upstream version check
Date: Thu, 26 Nov 2026 16:33:23 -0800
Message-ID: <20261127003425.2166632-8-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:34:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133107
Content-Type: text/plain; charset="utf-8"

The unanchored regex matched any number on the GitHub releases page
and reported 11.28 from page markup. Match only the release tag links.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-extended/cfengine/cfengine-masterfiles_3.29.0.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.29.0.bb b/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.29.0.bb
index 5c81c414c4..293e192592 100644
--- a/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.29.0.bb
+++ b/meta-oe/recipes-extended/cfengine/cfengine-masterfiles_3.29.0.bb
@@ -25,7 +25,7 @@ SRC_URI = "https://cfengine-package-repos.s3.amazonaws.com/tarballs/${BP}.tar.gz
 SRC_URI[sha256sum] = "db0a97ae7ee1f46430b5ad79127a7594849a222adc1934eeb3e5aa14843ff47e"
 
 UPSTREAM_CHECK_URI = "https://github.com/cfengine/masterfiles/releases"
-UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)$"
 
 inherit autotools
 
