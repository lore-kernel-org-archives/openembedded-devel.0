Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8089.1795739733456153691
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:35:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=LvUe8qYu;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-386ab9ab619so10131429eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739733; x=1796344533; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S3tR7QEjMDZBtI8GSUrmMzrufPvo/bq0G/di4M/hdlI=;
        b=LvUe8qYusAp2rN5pzFveE9QYhYU3Bo3YNFUuy01DtqjJ5zp4d6gPwQF+R8FELU/+L2
         /O7SuLFRcOG8ljIGlsIPAwtG7HT87lEL4n3CY5dxHOUS33Gglpx7FOUGefhsPrLW+Buz
         wC4/LFzwgiGsWUbxHJOOXsb277yTbZ03Qp2JkNTFaMREV9W7SjOGpD+X8rUiw0qEig9Q
         zUhLW3bW56Digrhlm3BEBwKikzQCeIHYp3q+sKY2zVnnHjUTOhp/UOIdt2W9gIzhSiJF
         ImywEi5KPvZnR2kcCun9yYQ9wgkdpU1X1TIaNKCq/ebQOUJVOVywJn7gaETBOOj71Tar
         2Wsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739733; x=1796344533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S3tR7QEjMDZBtI8GSUrmMzrufPvo/bq0G/di4M/hdlI=;
        b=KfVMJBKb+XwNDMkoBvdu8GprWyaoiC77upeXxp+VTinOW/Iawr2VuHBuX2xdWc8VQi
         CqoroBLsHfuATjv8bODc3eNUeWgC3oC9du/i5waC4SRe7RXRlVh/tSdoPuBfFkRqw3KH
         IJZawe6RdrynkHobkYtBoGr4RsfCCaH+DobwfeiMkTPUsB8QVv1wLMkdIJ4y5K9a7pJ9
         qrgwwHitUZ3e2lSRNc28PM+sg7gYdoSqk0x/IKw+zuRthOnyuJSZ6jnonyGsVjehKXKm
         ag6bTxtcfheLWOJV2EAZRZbFFrF/x6NJrbuyEi9BPXAAl5NW0jEowtDsJaLQ2pekImlK
         gDPA==
X-Gm-Message-State: APuU4Z8Rt4X20apMDUKrr5HMAJIWUfu0olBd2A4fQDICtCYT8sljzLKF
	BDFCRbrhRfHJbgg/xq41Jpd6Tkik2mG5AzC8gtsh/VfCHlllR6g3O/jnZBg4hwLY
X-Gm-Gg: AZFdTZcHY2C1+ekRmLaKYce/6mxsXFjaSt4TeXnMLmLnUIEMZBFNbrWsCAHNKL9IjVp
	4jJsMgjIDkuhRlwaTl23RgUq62SWDYINUECka6Wpz5OBpi+Y2vGmWgTHDB7lWrkDzYjEseSiWGt
	qYrOGpjhBkYWE8fHDDWQyB/rtxsIFvi0kTceZAL/SAJRHo3RWAzSvn/AfhS35YLh4j0xyz6A23N
	AMrs+j2VEAmNpT7rraZGDtPiMCRy/kZHrqMIep8uAUkELo+VghKfBgbP0Uktp4nNnBd82aLsYwx
	Y53vClkSvwAaT/4ujQTnWz7UMWDHIpwATVyTIl34FoGD3MfbgfZX0PdXFqIhjGbApWB86koFMS5
	jCPPf1DAKiUqsGJcmOHU2MSYTjPfF8gOkwDjY7N69jeTZ4U4ueU3g12eJR9rknuE1YEHSz05IeQ
	Usthx8YfpXh16VRZyLSpvO9XxCoDZdxKsrMQJ7bwSV8SgJSp3e/sHgPSnNdOwEX7o0ux+XRfOpz
	gb3z/GQn+nRH/s1nMoypBjyBoSgcEj3qXVKsJonQ5HtL1Fi12y9PtrY4SsTPY4ZPWn2yc5jSLMg
	W3TvhYPrJfn2K2T9OYNlrO6dD8JstgLqriRUvs+vxwFPpRaTIwiGmNxzh2gJ94I3pSQkK8T4Dzm
	98Jghv4S3gb5lRFETJ3BB8JXFzvrr5au0WYhd5S9VTmbcvFN7k3KHLEmhppElQDeigZ3L5aSbIi
	huI48z3xzld3bWvMGBAIiljUqeR7DHnOjSmzoHrU1iCkkp+yqrO89DKbqw12kAHYeZy0udtc3j3
	5CDgMHbdbNXY9IPDJyv0tboZ0nSyqessd7WBMxInMzlC/5DJYOXAQj38T5b8v6PBkHZQsBkCczW
	xkTa
X-Received: by 2002:a05:7300:50c4:b0:386:121c:c275 with SMTP id 5a478bee46e88-386121cc3c8mr21366894eec.10.1795739732083;
        Thu, 26 Nov 2026 16:35:32 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:35:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 59/69] lcov: Fix upstream version check
Date: Thu, 26 Nov 2026 16:34:15 -0800
Message-ID: <20261127003425.2166632-60-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133159
Content-Type: text/plain; charset="utf-8"

The unanchored regex matched numbers anywhere in the GitHub releases
page markup and reported 11.28. Match only release tag links.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/lcov/lcov_2.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lcov/lcov_2.6.bb b/meta-oe/recipes-support/lcov/lcov_2.6.bb
index cd37a6cce5..17276ddcdf 100755
--- a/meta-oe/recipes-support/lcov/lcov_2.6.bb
+++ b/meta-oe/recipes-support/lcov/lcov_2.6.bb
@@ -63,7 +63,7 @@ SRC_URI = "https://github.com/linux-test-project/lcov/releases/download/v${PV}/l
 SRC_URI[sha256sum] = "67a45db99b8ef0260c3fac9a2e3749fd8fa350a15e235dd3c29b356d97755c75"
 
 UPSTREAM_CHECK_URI = "https://github.com/linux-test-project/lcov/releases"
-UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)$"
 
 do_install() {
     # Pass the runtime PREFIX and the staging DESTDIR separately. lcov's
