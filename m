Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8219.1795739727581461212
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:35:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=m99DfvKw;
 spf=pass (domain: gmail.com, ip: 74.125.82.50, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b3acec6677so11441570c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739727; x=1796344527; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ju2tkuZCsp3FhvRMbbCq94QuAe5RSZnAcZzl/JvUQK4=;
        b=m99DfvKwYoLlL5ahBOlfxNkhisoKR0n2nLm5RB92VvBBhKTE4gpOcNoFN3Fj5Mqo8e
         cgSYJmM4rMFUW0aoxhRqx9siDBzQF4sLYd6KSqASzjARe/EOnMDAhfsK3DsYKTeFWMFk
         kt2JMBk5Wd1HFLLdLQsUWA3oFmx9+Z5yxe0Ee5TbadTyP/b5xFP+aqmXpIyuD9EhAmuD
         GyxlG+XOH3L033eyz4IU8Glr05KEGab8/Qilidg8Hi1WsXY28QlpFc1KguhaAYTGvdQq
         Ngt4dQOLOKu/q8IvKgRYt8m1o8RIEihyhCGMcFmLfPH3oLpYCypjfZpY64f9mlTmhCK+
         Kf/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739727; x=1796344527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ju2tkuZCsp3FhvRMbbCq94QuAe5RSZnAcZzl/JvUQK4=;
        b=WmFLZcgZLSrAbs4fzL9meUpnbdX/WVWajna6FwD2oU4D3UEO9WgCAiZ7V6EH/4kmLq
         IFgi63N+MKX/qFxkKSDQERrGhwB4YkPZ1nI6atctI1EoCYn9l6VRSVVZBZeIEKmf9bFN
         d2FvcZfzOKfJnMgu8G+SaCZXVaxuyjSAjnIulJAMDBp+OtgpnT9sI5oiQT8IKZ/lLYko
         MviAPLes/+WATYBzmWkQUcqPNbfZ6Z2bUo2sBTAZAv0x/E+fPHEQ+XE+85qlhIROCPni
         NXdggp03QBWShov/Cp5ADcZ82TzNW2VGbTh/CAYHdaU7DsbYXYccDn3er/Y+x/0r+81t
         QG9A==
X-Gm-Message-State: APuU4Z+r3KCoXuDFAf3s+X+lx9P1pAf5qdfHao8djOjRK25zJKvvgfgp
	nQyOwHSs+kzQZ3S5HVAFLRN47BDpIwy+3r9q/7PstgdyuduYcEzpRlOU6OsSGAem
X-Gm-Gg: AZFdTZfhRwHOa+KFn1tmJaqMzDpo4jmRx4cCcPNVBEuvO43ziwFNdkbjpZazayZE8CO
	o06Vx4RtRqrfeoNlqtSA8gMq9yHnvu13lF5eowU0Gt/lGnSZ96uVk8R10wsc0spj1De5HLuob8W
	t2q1DsvXS/DFhbyAFYZwVZ3V8OAtkm1EXlarIy6noUlOJr33lZ0O89ZcpLwFPmQa9ZI7htqQ10v
	iVznAMfXHtg0troqt6prYM5MTnJFc0Am5Plug5LQerrBSIjwa+9231sZJTqcjKHhsmFHuils4Re
	Ih8YqSgoYrdIKLY0SDMT0orKYmIHXV64wNHfYxPQ7hdZixeBU5RaGfklGOaWcCEHwnIueJ1ma3U
	ZcIMqwcW/9D3o5USioLcoV32qZBtT6upkid7ij3vzEo9XLx88WJPgOhROGpmg358OUj2S8yWNdE
	7k+242fMPXymwFpqVJlBxLcy4yZdNlUZhj47DmxfOB0qAWuTwuq7hzFh1HI6VP0x393DnLIXJZ+
	pH6Kity60hj6HVxe4KSLKgYF9ENNGasgUqCq2S+FJ8nrxeqi67XZIX5ys0L/GkpOVQD1i4MawrZ
	BbVF4EpgQyrZk9egikXJ6BqmGErUjHt/9eoQ+ix5butZP61FCnqcuVQTZYJqISgq+V0YjWsUEwE
	EkO8joZROeWUK0vhnONElsZZ00Sb7fw5m/Aj3NU7rCSTFCKy6aCEwf38KHpU6+OfjXABnqPB52W
	0ao4vnfhZ9fn2BeXDIKNYD0Hl//JyL3BF2PQUU+yHUSHGwuKPxG6iQ4MMjc5KY2YSoLbV6ZL0Aw
	wWkmMkLz7rsjK/KF0BmpmkkOvz5dtM7qz36bMIK7vA9tYg5It4jz+xFI+bkFV57FJXQCw40vOY9
	YRVI
X-Received: by 2002:a05:693c:8843:b0:386:b526:251e with SMTP id 5a478bee46e88-386b52637c1mr12079495eec.10.1795739726819;
        Thu, 26 Nov 2026 16:35:26 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:35:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 54/69] portaudio-v19: Fix upstream version check
Date: Thu, 26 Nov 2026 16:34:10 -0800
Message-ID: <20261127003425.2166632-55-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133154
Content-Type: text/plain; charset="utf-8"

The default tag regex matched old snapshot tags such as
pa_stable_v190600_20161030 and reported 190600.20161030. Only consider
v<version> release tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb b/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb
index 7376f7ca77..1a03a6d8e1 100644
--- a/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb
+++ b/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=26107732c2ab637c5710446fcfaf02df"
 SRC_URI = "git://github.com/PortAudio/portaudio.git;branch=master;protocol=https \
         file://0001-allow-build-with-cmake-4.patch"
 SRCREV = "929e2e8f7af281c5eb4fa07758930d542ec43d97"
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 
 inherit cmake pkgconfig
 
