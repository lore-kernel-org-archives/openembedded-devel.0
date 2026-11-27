Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11812.1795762994482859715
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:03:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=m+vOTzap;
 spf=pass (domain: gmail.com, ip: 74.125.82.41, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b563e5cbc3so684387c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762994; x=1796367794; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e63cXemV+OWt+viQcCBzyH/aB3ZHpf6LTeT7Maj3R34=;
        b=m+vOTzapgd7PUM849MGz2EpAWyfi0vLYlqNwn2ODrYm9GVrLhtS/BQ3qr9HOfzIMK6
         kQ6LNs/326vOxH2nwPU0dR3FDM6oN7AYJmC6QTdrlGEE2UOSNiGZMmoRR2g/HWHrM2DT
         joqrvbtt9uNslNkOCBxTRVaxwoD1ilkuM5XU01DXx1IHZMkUQGMQ2OaT6EI/pi+6z7Tn
         crplCDHQR+aAiTK3i4FvdRCmFmoFtPFQvJx4vDrvjR7yJPJG5jaDiqG8bKXt3PLyHwRY
         W+o6J7j/HwlWaYdrFQnXzD9dIcv01HNof3GwQmuTbNjSe6NdHSpUA0lwrIBd9Db/BsUL
         5Fqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762994; x=1796367794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e63cXemV+OWt+viQcCBzyH/aB3ZHpf6LTeT7Maj3R34=;
        b=ASQIwtHpcFKUb+uCa//J330Z1Eel1piA4HPL1RECfhPkalHgHSFmpskAgVEk9Nd5xa
         biy5HhEvms5Wb61iW5s9KKLlt3M7SKH4HomO9YwBmBs7StYvVmvaf/aHRodSsy01Jg9+
         c+6jsSPxoKIx9ixNntHrW9+05u1o9QmrNnkd1et2nH18oANASan6gFv6p/CoX1PbjHGj
         0ueFzmcsHfVMpW8EXSZf9QAXzlSXzOHWi4S/5H03sKiuVivxz+xGyHNJkZ4PEEeetPOm
         6EVMobKFw9ybzQBkdG6Whcm20CW+ZFmbLZkppu7yiDd7j/UXxGuUKiJLkN4mK1bhruY9
         KXdw==
X-Gm-Message-State: APuU4Z99A16Ht0exdboDpq04/Ij99GY5MXa9hxWX6BN6wbdUKB8z/h5D
	aog7BX54NLmYxzWF6MKYbiP0iP2F46zDatetdLT2MAMefFZOsisRhPJAyYsRMpWL
X-Gm-Gg: AZFdTZfnnzQVctYybCNgftWeg/Ae/pahB/xBMspeqmSKXEVdPO8YVdD4x57OjsTG3Sj
	Bc0xl92xoYwC0N+z8E2vlpHttW4FfMHazYOLdM0E4EnRCtgoHi7YUMlZvUIyBlr/M+18gObyBxH
	7HLCtjGNtv3cR3F9Y+HMuMRIihbFnDKmvuoOmxxOP2u32vKM2grexiqGS7Raj77JEzlwl3fbMlP
	ZaHtc0ejEazQhtTVeu8fm4bfA226uTapD6nWJ6YwPLrpgiKZHAN1hsTnkshW6LVqzebuY7/4vp2
	qkx/MPIwqn8Q4LJMU1stdQAT3MqZL+tRR8CUsRa9aJuq7zopegl7pWXYNd3XHJy4ZaKCCuKfTB8
	c/cN8OjhZRx3YjBUxIEwI+bYrsGIj5wX4vcEU+/CD5ms+Inm8j/XIF7W49+wDRC3ioePxUY3hB7
	WpISDtlfovoW091+PMUJRl7O5uPNlj8TmwXIk8k01NeyVAsFuux0Ke5suF3Zwf5JjGMOIWpQM8Z
	Yvx5d6vALlbbvJPik2y1TMQV81o558NWLGKvaTOD6qDRVRAUyWeXAALrTGnYQUwdg8AwCnpY5qs
	W8YLbhPq0HyMM2mLCqbbcvEKcWmhp+H+Sc0I3f1pZIJwaGi+cPwcbW79Gh3LEnHyRxjwID91Orc
	QOPbZ0JOhROpA+8ZuMTwTtFuShJcXwhTVdb4soywk4jnUJOogNztvI15D/Qhqwglx+q3ZmcXTCH
	I2PQz+xfi/FdcrJfQ0u8kfnEh/+3gRiNl2rUaECVtshYi3y31AeD2CtyHaGmf0rdSR2f27wLZad
	EMIJpk6KSXIGq+4HEoN7gHkbkHGD8+PY4uNythhhA4rQSTh+GnNBbwykHzY/UOe2lGvUkROpepr
	Kw8Y
X-Received: by 2002:a05:701b:2603:b0:1b2:5ecf:9bd1 with SMTP id a92af1059eb24-1b55249484cmr23587850c88.7.1795762993717;
        Thu, 26 Nov 2026 23:03:13 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e2bd1sm52671117c88.3.2026.11.26.23.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:03:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 2/4] libmodule-pluggable-perl: Fix upstream version check
Date: Thu, 26 Nov 2026 23:03:06 -0800
Message-ID: <20261127070308.2377122-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070308.2377122-1-khem.raj@oss.qualcomm.com>
References: <20261127070308.2377122-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:03:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133357
Content-Type: text/plain; charset="utf-8"

metacpan.org/release now serves a bot challenge page, so the check
found nothing. Use the default CPAN author directory listing and
anchor the regex on the tarball name.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-perl/libmodule/libmodule-pluggable-perl_6.4.bb     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_6.4.bb b/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_6.4.bb
index 2035f13508..4ee02d1c11 100644
--- a/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_6.4.bb
+++ b/meta-perl/recipes-perl/libmodule/libmodule-pluggable-perl_6.4.bb
@@ -20,8 +20,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/S/SI/SIMONW/${SRCNAME}-${PV}.tar.gz"
 SRC_URI[sha256sum] = "970fd13accd3d538e637db080ebbd9898020c8b5591837c8493a39edd737922d"
 
 
-UPSTREAM_CHECK_REGEX = "Module\-Pluggable\-(?P<pver>(\d+\.\d+))"
-UPSTREAM_CHECK_URI = "https://metacpan.org/release/${SRCNAME}"
+UPSTREAM_CHECK_REGEX = "Module-Pluggable-(?P<pver>\d+\.\d+)\.tar\.gz"
 
 S = "${UNPACKDIR}/${SRCNAME}-${PV}"
 
