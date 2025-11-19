Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36CBECF34DE
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 15:43:49 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10124.1763567024531204635
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Nov 2025 07:43:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mMnnetsW;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-29812589890so84597115ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 07:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763567023; x=1764171823; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QgIBwt6Upw+5rZRn97b1c54u/lDK3mzx1tKUgUCY8M=;
        b=mMnnetsW2b4KRZUQvz+M6FIxGWLJcRYcx5k5+eL5BM7ASs4rKwaUshUQL6anBbqu6o
         1Zo7lw7dQma5fnT9Tff29ft2l0ExZrExjRpH4DR0DaT1huUqk2f0juTQp1TwqNyd1xPm
         xxmX2SQvj7zRx37cbdo6Hc3wvAJtzZTVHJqQ9nFx2wig0vNxibaTat3ylZaDbLkmN/ec
         Y2Xi/v65iFxBU+tafa/oGHI4R48TrX9z1FGV17iA0rJ6DYCixxQup1bi90Hv4WasH9fz
         cdO92RWFQVGV6dINM91f52Bvm2yy05FkDX22nU8pjvBdI9uZeAwdMnZg8gcBZGh/KPih
         /nIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567023; x=1764171823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7QgIBwt6Upw+5rZRn97b1c54u/lDK3mzx1tKUgUCY8M=;
        b=M1XfQNcSEWfOAIcQwJH70EW/xv5JDSVymjmqi4lnCO4FnTmYsiXcL4Zpa105N0O/Fo
         GdadCNoI3Amv82d0p3Z+PRBXKclMzemXf3YQ81cVKVVe+Sxc0igdmRhhhUpet1DNJehT
         ar+Byuz6INKuQi8HrxQXDTR4gcJIv5FGNv5SF2Ac1qMN7Ip4lUJwVmnWHi8ouhCs18I5
         Emh0XFUg55UNh5tSI4aQHwp+KJXdz6cMNVqRXs3Z7g3jtsnfnfAssTiEFUYFp4z0LVjT
         RPpSBfeG/8wfCPSCkttFTZc32S4wja8YWHgoFMfrrY0Joi1iRrXJfdLlWyBy4L64jR+2
         Zgdg==
X-Gm-Message-State: AOJu0Yy52+zzQQFesqeoRJBqOmxIPWrkVoGi1St86zKcJRkVwENN37EH
	Ga7Lig1gdRcsyyFMdu1+GhpBeunjAPq5LtUjUZq2cANWh9Bb+u3S56D+LummYNHX
X-Gm-Gg: ASbGncvLPMpgDrnw96GAj7BhYPx4aIzQNmZesafWwGKsJLOycSC6GHi9tVk+fJRZg3B
	ehPzpRJcGYCKtbTJkIyXWfvYxWybKNVP7qFLxfsh7woWO+RTKaP6HXIn351SexCnyVVZKSIIpU6
	tuSoKzGMzz7k3icYHbmpVlOFIzs5ToO3JZBILgZY+JHX8zuplai7ScI7x8T3M8ecHXvYJxxPGB0
	qics9xVCPR3GHYEK6TWalhLTr9wUZ4GtmP5uF1h1nWWJEUVRDv8ZzANDilX/EV0GtGYPgd43hTv
	kkwQjvBF5H5ZSBDU3UbENfRB7R/MXKe8hM1OYzDomU47diRhYkjQeH0GLT2Yd4Km/6XS2Txx8b8
	IZ3RuwzfEsPuxYmMfsHDksrzgz/mJgFvMbtXWbyeTRhb0TIfBsFevoOre/53PWxZFeNUvr20gue
	vAOh+tQSM04Ger+IEhCHlTP3/pQ4iXp3QAEpk2MILOrTyH+cNH6rDrCWUX3lT5EOTlBFD3aac1t
	xZZlIA73k3GF3ECp0lnrKDFhw/Zg4xM
X-Google-Smtp-Source: AGHT+IHzlQmXzC0cbBsfgrp5reWfWMboxtUUx/CaKNQsaSHMG5OfO9nXSCCfvklWWDEPZTARA5mUVw==
X-Received: by 2002:a05:7023:b03:b0:11b:bf3f:5208 with SMTP id a92af1059eb24-11c8d960587mr1190204c88.1.1763567023044;
        Wed, 19 Nov 2025 07:43:43 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11bf23d6967sm34176687c88.3.2025.11.19.07.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:43:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/2] python3-scapy: Upgrade to 2.6.1
Date: Wed, 19 Nov 2025 07:43:40 -0800
Message-ID: <20251119154340.3184696-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251119154340.3184696-1-raj.khem@gmail.com>
References: <20251119154340.3184696-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 15:43:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121909

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{python3-scapy_2.6.0.bb => python3-scapy_2.6.1.bb}       | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-devtools/python/{python3-scapy_2.6.0.bb => python3-scapy_2.6.1.bb} (97%)

diff --git a/meta-networking/recipes-devtools/python/python3-scapy_2.6.0.bb b/meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb
similarity index 97%
rename from meta-networking/recipes-devtools/python/python3-scapy_2.6.0.bb
rename to meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb
index 2086b018d6..5f09fd852a 100644
--- a/meta-networking/recipes-devtools/python/python3-scapy_2.6.0.bb
+++ b/meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb
@@ -16,11 +16,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 # If you want ptest support, use the git repo
 # UTscapy does not exist in the pypi pkg
 #
-SRCREV = "f7a64114b35fd8ee63ce07290f8a2dffd52b215f"
-SRC_URI = "git://github.com/secdev/scapy.git;branch=master;protocol=https \
+SRCREV = "8e08cbf759de6709a5b4af6bea3655d293129bb4"
+SRC_URI = "git://github.com/secdev/scapy.git;branch=master;protocol=https;tag=v${PV} \
            file://run-ptest"

-
 UPSTREAM_CHECK_COMMITS = "1"

 inherit python_setuptools_build_meta ptest

