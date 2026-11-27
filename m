Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8189.1795739665904524344
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:34:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=gNkjgpLO;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3866a784546so10293157eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739665; x=1796344465; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yh9TyO0+jSma7Xc1qlQPOCLcInY3v0XQHSuDWr2kaBk=;
        b=gNkjgpLO8O19rAOX4UcKECvdJY7xRRWj5WMhyz//gNbOop1uYNrQom+j/Un29lI/sz
         Ak/q1Bfjs6FW+5hTofP3D5sGsc9pqVU5ejVqrhtX97+2LYpnbr3cOsmprGYtW/iFLwYn
         3eDxhGkJxDSKvQlxaC3REi83tqALtCArszcI8jA5pioe3zQTVfZEwcS1fJDd1pIPlaxY
         R8YvJleaOfEvjIN1AbcKorMTD8OoE3reTc4RovA4y64ww6l5K4ccuYHJnI4tu7RZgHHO
         Ycu/0uOuA1vDbjdr26N6iLUy1Lj2g9EOlzMmOiA4S1fe9FSNmqHsonGvIofhD5sYLl0e
         yBiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739665; x=1796344465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yh9TyO0+jSma7Xc1qlQPOCLcInY3v0XQHSuDWr2kaBk=;
        b=skCkX7SlAifKm+Hwnkx5/IWC/aTlB2cxi57WNgoec9a8BvDfws5GthvbTLRI23tb/S
         EedH9zGUpDtu2g5cESEKwT0/eqOeDz+UoYclG+WK1slUFyyFgKWxTJRv4n0YjNR/+fsl
         ZwIozwX838rom0a0EpVVpia4dlF/XvnXegivp6nZPeK1kaPsTkcNh2IsSlYCYvprR0g2
         JN3+7BdpnT/ZBpc9XPyWUPKD570coAfBEKtVToaMnpSm2g5nO+z4P1c3auD0CnfsmPtY
         mDNqk6j8D4xxPKS8ATnwks4PkbJ3G1ORXSaf6sFQyyuf6YRZ3Y1Ji+yGtFUCnfBaU+vy
         FzJA==
X-Gm-Message-State: APuU4Z8xg5yr2EUrsjtBKCK8Kjyj3XdknQZBPlec6FHEOpD01WcH+IX/
	OsfFsdBzN7QXGWynNr8pLon5HL3TGjXTksG1LN9lEJpIiHpgU/FnD5YymRQHQgZ9
X-Gm-Gg: AZFdTZeox7PEfrYMImZ60IaKzi33JQtfSMPnmL3YbXRAzVF23GSBjbz8X3aayeSJDEQ
	2eI5jxhU0z0KPuef2Bg0u9nQfo6ZvTSInMk5urWRsZm9eANl+UmIAVGOocZbyD6z7y+TWgb9wXo
	t0SFy3g1rhZVrdV2kMx9J5HW5X62zdK9Io/vNdbCJx0vQHtfnMSMOUrNiS1yWJf6muSYjCvmM6Z
	ncO4rUPtJuWLXkZ6CJHSsVOHQ8DG+TAydC1bC64HnaR2rI35cthNwB1Oq9Pa4fxkmJ0QCyYvHmx
	GU7OyHLPu/o+JriNSngdHJnGoJpldxEErcr8OOHtrwbyKm3NC7Exx2JeifOpB8tXAabxS+GxQvf
	izrrBFXgLVU6WLTA1ckP94+jZel199WPzBUJRp15zAO2SvkzIXCukME+v6D19HXSJijLzwchV0p
	wKlvu/bo9n2TRslZ2+C130EakBnTewtbJYyZzajQ6hFq6Ppw4IZOf46XnTgFcThf4KJJXomixiD
	DZcpahsk552N9qoIH0yDQBV+AaavswCJ7kXJmwfQvBPZ4EQOufKiFwwbmkXAGKVJG4W7VqBSGIw
	S9E6Ri5u9AGmy4vM9sZ/Vk8522DH3kDMeL4IWcSpluPpQI4bNrerrCyijIy/PrsSxPO5mZe1j9e
	5yT14JpIlC+iXaz7jeZ9VUrGxwjoJzUgljNZakHNxOr1p3kFgIC4BDVPgiNdlyFEgCaMWsHlGkC
	YxWig09ErrSvQVX6hixl6RYHMqG7/Oc0aRebl8Pt0VQbLLpGlyD2i/Id5W0QAeGKlT5zAPm/mh9
	L2G0pVKwbWlLaTmBNCVVRUv/nijLlLIRFgPgijOUqnNOCyH5kmn4dZsbBq5nK1Z3Tb2QA5qQ5IH
	xBz+
X-Received: by 2002:a05:7301:730c:b0:381:2114:99d0 with SMTP id 5a478bee46e88-38571415bdemr21332823eec.39.1795739665079;
        Thu, 26 Nov 2026 16:34:25 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567ea2cc5sm61606022eec.29.2026.11.26.16.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:34:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH] python3-pymongo: Extend to native
Date: Thu, 26 Nov 2026 16:34:21 -0800
Message-ID: <20261127003421.2166077-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:34:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133099
Content-Type: text/plain; charset="utf-8"

The MongoDB 7.0 build runs its IDL compiler, which imports the bson
module from pymongo, so mongodb needs python3-pymongo-native.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-pymongo_4.20.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.20.1.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.20.1.bb
index 98d495ce4a..bb58dd8722 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.20.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.20.1.bb
@@ -36,3 +36,5 @@ RDEPENDS:${PN} += " \
     python3-difflib \
     python3-logging \
 "
+
+BBCLASSEXTEND = "native"
