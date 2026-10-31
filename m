Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.695.1793419076979084004
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2026 20:57:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=NAlY9jma;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3514b90bb89so2582564eec.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 20:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793419076; x=1794023876; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3sFVfBe9TxG0ozxLSjNdk1BlM+5Tf72tl6IPNBAhlo8=;
        b=NAlY9jmatSVcrt3iw8tiEqTVxfRod7JU5iMTUEtp2WBSfzh9VX1vdQNtnR9CQ5hL/J
         RPxPlVaq0SyAS8HE7aiws2iUezUPuGxElYm4wQL88Qros1am/1QlGYbvahWhHeD0D7cl
         vyWJivR9NMWiOR8Oc7EVyTV7QCtIy9uw21BXKqBDnnT/URdXajNecgfYJGuPMG4NbKxz
         +2VuMr3rai4OuZC4JWbtHY13vfymqqtpfVKzFVXYLPJufA7hiolVYJX8CfgESCikVnMm
         nKmPo7z9Lkj5E2kWYXrFtff/cl2UUPx+0ploWar2uzBi5JlgDkAA0cCvME6iLe4ZXg3c
         89NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793419076; x=1794023876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3sFVfBe9TxG0ozxLSjNdk1BlM+5Tf72tl6IPNBAhlo8=;
        b=Ra9V82FOcrEbxxGBYAZBWD4cKeP7DJVmvUj7xsdkbL0XrsRArd5YLGWcOgfiV7C7wJ
         Ev1apumUIL0UrmZCNjEUkBmpzc7RPxOqQSuxcovGQ/XEk7+I2l2d7bz+AHX0bMBJYQtp
         PvPrgkokoM51C/uTVbbBmFezmq3ShlOPqKf/itrc8E3Wu9gW5B3msWeax4u6QHGmQWKZ
         UjP7m+qtInW+iI4f66Z+r03EQ3Dyj479auBVqFIbisvx86PbNWfH9lyzzqxqh2EGqetz
         1rJSpvfOBW7PSz7AI7XKLVtRgqRzcGlnFiSGCwUx6cP0roNSmlbELqzbhIxtvVfaXO3Z
         zb3A==
X-Gm-Message-State: AFq9FYLdCwgfopIQAQ2yO2CahKib7+0Qyzdngmjzivgi/5C7Opdvz13E
	fwcVDO+hqzyCg95YDdQBOXzSfwu/wIV1Sc6GwXnOUAWINbrY61BMuoV/Tl8vPcs7nUo=
X-Gm-Gg: AYBFou1DuXO3nSyE4nXes51ztYSs4q0bxZOaeC7McJQHW6l4EEbjZvZu0VYuSImaMS/
	b+rN4p3uXTHGtsD9/SVJrJJTzjwj3cl1RLQRlLyQ8LDo+U/MMbnfecqZuimlQwslXH7s37SJql7
	vXyXkH6ksUKU1dQwFFDS8W/Mu/Lwsb5bI7Ox8bYPbg2PFYbmVOZY6z8tu3wAZuLEoLwamyDnkTY
	zzGYIBYSr0lDxaqqJdUo+w0G20NdTeQw/S0EmkdYewkdxUSjWpfw0gjs+K4pgIIK763CQfGjq29
	FR4PPrcDcJ75x0EaWomZXUov6JVrDrRiIDqM+5Vtv8zju2bFlAAka6mw0gIc2KWcV5+fAi83PZp
	YEaMpk9iYAfr0lBe1UWwzHXI0MYihfOx9I49Hd5PxYxqAgalaGv2JeCjvUKRJ6pX1b2SHigs8+m
	6iyQ+N9iiV5NDnQJAV926pa/WVu0ygdOlvbobDX+KdPdB6NXiLOrU0CpGhhIPa8HYofhBMckqgV
	Mm49fTvPwqnOD5qS+br5LDovCf+tkoZ34bdO67fwjXqx2oxn861aLt5XEH5q2bd0+11+fVrLVle
	EPhTgYwh+3JMyfUvBDeL2qtvd0WPW6VKltIiQ+wYXkWx5Irx0z9qEqtvHVmicle39m5DerqVR+F
	GhXuo4L3iLIcLDAc+dww+z0dJekKOGSp2mZ02qhqXT0pERPQxVJzK5HneRaWycN/k5IZapxuR20
	j4yAS7YnWKmBecieqikMrlyAqHktszeIa2opHj3Y/Gs3MxdfZbrUt1I3NmG9pJo55fOvyyJDnZ4
	ohvDQqsDcBAkNaelRgIGAqslYsMgkpHugaVlai2iAIuFgBMUx+dAAsuHj1G3LZP5gilDc5vdqXI
	3HNo
X-Received: by 2002:a05:693c:8353:b0:369:5583:bf4c with SMTP id 5a478bee46e88-36a424064a8mr6158200eec.28.1793419076296;
        Fri, 30 Oct 2026 20:57:56 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a5fb97sm13687837eec.23.2026.10.30.20.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 20:57:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 04/10]  python3-opentelemetry-semantic-conventions: Add missing runtime dependencies
Date: Fri, 30 Oct 2026 20:57:41 -0700
Message-ID: <20261031035748.2130261-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261031035748.2130261-1-khem.raj@oss.qualcomm.com>
References: <20261031035748.2130261-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 31 Oct 2026 03:58:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131714
Content-Type: text/plain; charset="utf-8"

From: Khem Raj <raj.khem@gmail.com>

opentelemetry-semantic-conventions requires opentelemetry-api and
typing-extensions.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python3-opentelemetry-semantic-conventions_0.66b1.bb     | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-opentelemetry-semantic-conventions_0.66b1.bb b/meta-python/recipes-devtools/python/python3-opentelemetry-semantic-conventions_0.66b1.bb
index 8684b0e35d..44a333255a 100644
--- a/meta-python/recipes-devtools/python/python3-opentelemetry-semantic-conventions_0.66b1.bb
+++ b/meta-python/recipes-devtools/python/python3-opentelemetry-semantic-conventions_0.66b1.bb
@@ -8,3 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 SRC_URI[sha256sum] = "497ca63bf383723411e8eaf60c8779e9877633c936bb641080adab59d0eb6ec8"
 
 inherit pypi python_hatchling
+
+RDEPENDS:${PN} += " \
+    python3-opentelemetry-api \
+    python3-typing-extensions \
+"
