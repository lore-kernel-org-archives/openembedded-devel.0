Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8940.1793358212318442321
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2026 04:03:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=qRROhy6I;
 spf=pass (domain: konsulko.com, ip: 209.85.221.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48c4d870d54so333761f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 04:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793358210; x=1793963010; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FEWUHBrF6xFc/jwAJbRcNyakpQ+b9Z3ELuwngkAH/44=;
        b=qRROhy6IbJko4Ls5s9paFnCQ5frbIdkmG+/3qMLMJLZ8xbf8TI1QwJxyN1r9wRpoj8
         Y9CzeNTklymTX2aSnB54irPCtfqNYXsaeSsxOjFHhVR1QUno223kCKEDDLBg+TpPJtoW
         9mceLy4kCQtiLRCDMGlZJ0fV7dJrTsAUywZ1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358210; x=1793963010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FEWUHBrF6xFc/jwAJbRcNyakpQ+b9Z3ELuwngkAH/44=;
        b=tOkgbhbnEyX+vcPEH7sSC66DrvDfnU+UuxKY1rl0UGRyO2Xa8b8HGQz6Tf38s4ROQ3
         UM0/ri7L73U0RI7za4fgw2Pl/YLC0mQVu5hezi6lTqB1jYIVONK84JmM2/a/WBxLgMja
         JKuuNkw51ghqjFbaMjjn4RaUXjDQpnwIvr/XCnTKN2rKElVRDlFtnk48IAXualEzMaUG
         W5Eeek3t4j84NeTAHPbBG3mGxWBjzLyLK7q/4RqLkqOtpF6ZtWm4jXTBbmQnMb29pJnH
         4zvKUh+J1Zf5JoPPcBJPs/HYSYRLqSalueGqrIbQ6SBeZfsK83udVdPAB5l3kdvHGCvg
         Ol+Q==
X-Gm-Message-State: AFq9FYJkjxM1RAKD+x2DqiG+VrepusqpBF4A2YlL2d/LSVIJ+zH2uiDg
	rgArxiSqaGMaf8vc20H0PKVdLAzLdtN3hbjpPuaIYzfUuyLZDYETvQ+m8G8O+v9VuliBEvzBW+V
	UY32O
X-Gm-Gg: AYBFou0WnYmELvwFMz/GpmuXQf0wnvd+GxIyhOGPGPTVosR9CNVPef93oQmLU9HLIwL
	37XVjSGJjarSqRMbpTDArCWU5m3LU9nyCNEuHtskp30gjSS2NTpdM3WLmPo8sWZ1ROgCNkpPXE/
	WyeqfaaZIv5GiC7TYSlKZdOZpWwt2STLeFSjXKTAIWN/5Ds7y/wVbCLBdGacO5loLcmzJAie21k
	nqg0iFAnlLKkEUSFkyzLpl9LtSt54on0nZzu9hrwmrV5lj/r3qxGx+fMjm5oDtjO70d2K7UDQnR
	QpdZIKt4tz6Q+sQUNTGQwlQyv0z4RoTE2c/2tLDiV5GE3TRdORTO9ZtWGDEi2K4Yc8/AriMFFns
	z1mKfeapMJJQgcFpNfQn8tRJWWCvY+NzqoMqqAdBeO2buiA/AS+INEJGMHoa5SqGVVwS1CFYTyE
	yKE4voPTrWdPWMTdt3ETcC7ImKa2dUXetUimwQU9AnND1yeDfwjvHRsQ2pSbheQMYSgD8b+ASOm
	LwPeAqh8k5wjm1eEnWzCvHKwBciX5TnBp+y5OP54FCF/8IId/mD24R4sp7Yodg1CLDuV9eeObrR
	rCsa5YSdS8W7wqDEJTNf16UQyyQi1Sn/BpbS9k/Cw80AsBLwGdZgpctZdCfLU9TfGGIDsUN/xzs
	D3ArytYqVPFc/871J1wCn+Q7nKbks95mDoUfaCp1Jc7nwAnJ4ygialb8=
X-Received: by 2002:a05:6000:4b04:b0:48e:6f84:2e8e with SMTP id ffacd0b85a97d-48e6f842efemr4041762f8f.39.1793358210434;
        Fri, 30 Oct 2026 04:03:30 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm2642151f8f.23.2026.10.30.04.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:03:29 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 15/25] python3-pytz: Upgrade 2026.5 -> 2026.6
Date: Fri, 30 Oct 2026 13:02:59 +0200
Message-ID: <20261030110309.1124614-15-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030110309.1124614-1-leon.anavi@konsulko.com>
References: <20261030110309.1124614-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 11:03:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131696
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2026.6:

- IANA 2026f
- tz changes for Brazil
- Northwestern Ontario is expected to follow Manitoba

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-pytz_2026.5.bb => python3-pytz_2026.6.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytz_2026.5.bb => python3-pytz_2026.6.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pytz_2026.5.bb b/meta-python/recipes-devtools/python/python3-pytz_2026.6.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pytz_2026.5.bb
rename to meta-python/recipes-devtools/python/python3-pytz_2026.6.bb
index 4e210050df..69cfa530ca 100644
--- a/meta-python/recipes-devtools/python/python3-pytz_2026.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pytz_2026.6.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3 ptest-python-pytest
 
 PTEST_PYTEST_DIR = "pytz/tests"
 
-SRC_URI[sha256sum] = "fa23724b9c486543b9ff54a327ee7569ac83ade54bb9afd0fc18676620401c86"
+SRC_URI[sha256sum] = "3b0fc2727707663d6e517936f444fd8a8b240f1fc32f4bf7ee03274245945284"
 
 RDEPENDS:${PN}:class-target += "\
     python3-datetime \
-- 
2.47.3

