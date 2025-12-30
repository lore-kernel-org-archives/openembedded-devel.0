Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D92F0EE4988
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 15:49:13 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.66629.1767109751818551449
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 07:49:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EnQFlGKq;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47a95efd2ceso91088945e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 07:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767109750; x=1767714550; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X++EXbQTAbXj8QWXccc9REMLSSAZzZUfFbalUYkbXYI=;
        b=EnQFlGKqgfrorSHuME+rm5UtEzi4rpfJCG1g9p+0WClSURJzKgwGickgP9QbWTCBrd
         QyACM3jYBAyWWXP315AMyTjtqrqc1lMpDa0Vr/8hXF9vlVuJUDI2uGYH/3fqJQBLbMfQ
         Zi0cBpeaPqFOFCMQ3yEfrVP88ubpIA2VMJuSN9iD6x7JY+kehea9n0t4R+jz+CV7oFg2
         ku3IRce0fHBNJqF8DBvkEjO97cNWoQrxWOurdwTJ9ap3QxdHkLdZtSzB/OHAvDc+X2mp
         Q6dBDwRcJ6Ocs8U3pSrxYZEJimLq/vz92KTWnuao+I7+cFQiSAREPAkYHHdFWG42gsDv
         h8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767109750; x=1767714550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X++EXbQTAbXj8QWXccc9REMLSSAZzZUfFbalUYkbXYI=;
        b=dBiMnZsEideGiWfU3QoQ9alO28reCVq1TTvnWAq7fuMXENbKfdNRHphLpCKqjRItxx
         h6fqLs9O7aFUPMuuSva55KgijpeV5aJoufVecLgZbBfl39Oe6wOi/K0GFAEyRSZSP+fh
         o4l/m9Wa2N0cXMroQqh7o/qMFExxF4qIw/ciox1fGEoYOhI3fjhL0k/khSad4AAROcOb
         JeZJCsjjB+QerIQOud0njAZ1lKgum4s6L1OsBrCO/8zci3UkoCV7xNFIMXHwxbeGEAoM
         N5jWDn4NcrWmZhUQ7ylc6ZMiqMNX4m4uij87PiP+EvlIhrf9rTBZ80M6Rw5uZKej/w7A
         cCbw==
X-Gm-Message-State: AOJu0YzmCutP/jkarYKyjemzO1JN2vyyep58MsWlHDIhA6YHuQvK+Z3k
	ejQB/L3nI6ySogIsiLEXmt1arTYbuaRukjQWckPClZ824wC07hdi1g1354JAJw==
X-Gm-Gg: AY/fxX6SIpz75WYcSCAbc9GN+RKHd2JreCWZZZrBwyKXgAHWQwL6Z2PrdcaiZDsnU89
	sxkIPryernRU+4dbTV3PYAjqVIKPEfIr+4mZFMjCkw2noVTcVCNtjPo676siaVlCP0S5che2HMn
	+rQLMHixfeU6VLBCwytM+brXen17OmzPQiRr4qCgMzJJBKa5oB+iuwA8TfUtsXeoNBhh+lD/JO5
	jI5Yx4BwlHNLD4ua+TPInMeRoLUx4Ac53HqQQ7MSvEgIEvNO4A2jcahenUDWKTmhANn6MvxDUDH
	Ow7m6N8OV5AODOo3lMef2ssV+5sYvKslcsd9WOVST/AcCdAL0YQQP0yX4lOwv87y17ktHpGVt9W
	rEwNpzXSN119UbBH7pg819HECcVBNIEkmLBjKH6b+1BMju+KFIeIDbalCvIjg+u7Xh84KmxAAPO
	inMNboWf0C
X-Google-Smtp-Source: AGHT+IGi/+xIzHlwJ0WC48KMYAKcy3hGTavC2vJcMt7lpSMhU39bE2E9dGNOydTYEF4X0FU1ERht9w==
X-Received: by 2002:a05:600c:8216:b0:47d:403e:90c9 with SMTP id 5b1f17b1804b1-47d403e9114mr210442185e9.11.1767109750070;
        Tue, 30 Dec 2025 07:49:10 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a210e7sm253051225e9.3.2025.12.30.07.49.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 07:49:09 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 08/10] python3-validators: set CVE_PRODUCT
Date: Tue, 30 Dec 2025 16:49:01 +0100
Message-ID: <20251230154903.736590-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230154903.736590-1-skandigraun@gmail.com>
References: <20251230154903.736590-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 15:49:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123034

The CVEs related to this project are tracked using the validators_project:validators
CPE, which doesn't match the default python:validators CPE.

See CVE db query:
sqlite> select * from products where product like 'validators';
CVE-2019-19588|validators_project|validators|0.12.2|>=|0.12.5|<=
CVE-2023-45813|validators_project|validators|0.11.0|=||
CVE-2023-45813|validators_project|validators|0.20.0|=||

Set the CVE_PRODUCT so it matches relevant entries.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-devtools/python/python3-validators_0.35.0.bb        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-validators_0.35.0.bb b/meta-python/recipes-devtools/python/python3-validators_0.35.0.bb
index d598cdc97c..79950f945c 100644
--- a/meta-python/recipes-devtools/python/python3-validators_0.35.0.bb
+++ b/meta-python/recipes-devtools/python/python3-validators_0.35.0.bb
@@ -5,6 +5,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=78327e3919fcd4e9a4a07299899c634c"
 SRC_URI[sha256sum] = "992d6c48a4e77c81f1b4daba10d16c3a9bb0dbb79b3a19ea847ff0928e70497a"
 
+CVE_PRODUCT = "validators"
+
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 RDEPENDS:${PN}-ptest += " \

