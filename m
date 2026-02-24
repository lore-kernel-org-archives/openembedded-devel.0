Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFF53E9B255
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 11:44:39 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18698.1771933478147496162
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Feb 2026 03:44:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=SfXrnQJ6;
 spf=pass (domain: konsulko.com, ip: 209.85.221.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4377174e1ebso4164079f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 03:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1771933476; x=1772538276; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19oLTQkkTApQn/KUyHyhzlj6NL4iJOneQlbs7fQztec=;
        b=SfXrnQJ6MQQB/qjsBKr2Wbzr3a0NmUh/jCVs60XuU2DhwodHL8yDX+UgiM6I6aTAdo
         xeMOhvhiIWNZi9TKVPlc54B0ltkB/5XFTHdEPtts6VKnJnvw0noCvK6ufGx43/1pyVEr
         1FX9zSFZKGO/PguGqylEUQzLk2h8LU/1EeNy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771933476; x=1772538276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=19oLTQkkTApQn/KUyHyhzlj6NL4iJOneQlbs7fQztec=;
        b=aQrGWNnQBcZEeSnm42EIFiGhOcAtEfsQgra0PZ+aM8tPv/EZqM2pwPwvmxYFt/9YIQ
         B8wksgit8/Rc+m8krWMXqggv8R4jbjSH5verlK3+sQ4Tmuhg0cOMslj45BZBn1dsAT2X
         jfrBieA/Gm/0tWxY+KIWigOycVlRpu0zjohgRJ42e9+p0bJY1J7Z9AeVjNUItfQQhOEd
         enGMjlRwh4Rp2XjGhPns9aKSjxHGEJHzwRcTwRvfNGhA10j6eL5jYtSIrWX+2EcjHpeO
         ztVfhjVJet0hb0/2Ihjgcv4wMq46094HLc905WG2plPh2OtXIWBROSEH5tjMs5X4F5w7
         hIhA==
X-Gm-Message-State: AOJu0Yz2oF69jYXZ0lRrBkFnUz8O85fmY+3vrtOOVvYQ86gQikQ24av6
	epXHD1Bgn/2rBnZMrcgB06iRaZow+iMp8/U2jWyg2RbVLLL/OteJlelhZewLfnsSmFH0ScBupWe
	uZc1R
X-Gm-Gg: ATEYQzwYJyCfgauq/Qz3qRvEPsm49a1elOdIlRdaUW6o3oxXEn97U1RUrdWz5yduGL1
	NfJatXj+HmitYr8qZ/VBDxbB1hazGMBD5ZdpkzaPeFrTk2THLpD4teNarHlqQfOPMRfitdFHZ2G
	s8GxGcUqnTdxuxxt/H5zaD4T8pZVflZMQWvMRGx9LN8qyNs5XuvRqyMGHOnlX4T8wEsud1UGqca
	YGn6W7hano2EAUrajxEv3ZX17tgoR1Y1xIbehWCGPx6MHKRF1huuITDtWzDcT/m7p5efQK+jCAD
	NRNXM5lSYjdKx699X3lp4MLBFDvQ2+fhcyCtiqExXHvI9BJd+8vdIehnS9k3YOgjdG0d04h1Xa4
	R7vZ6Yzdt/aGUtu0A6ikQ/Wc9CWuuYDnU3lcR80vfDrEGzza8afhSynl8dune9WlgS7n5ISx1LC
	pfnQdh7dsNf0v6/OiuNT6Rs242w3oqx4G6HfVs
X-Received: by 2002:a05:6000:420c:b0:435:8f88:7235 with SMTP id ffacd0b85a97d-4396f182ea4mr22644513f8f.33.1771933476210;
        Tue, 24 Feb 2026 03:44:36 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00d0csm26721126f8f.11.2026.02.24.03.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 03:44:35 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/8] python3-flask: Upgrade 3.1.2 -> 3.1.3
Date: Tue, 24 Feb 2026 13:43:43 +0200
Message-ID: <20260224114407.1760757-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260224114407.1760757-1-leon.anavi@konsulko.com>
References: <20260224114407.1760757-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 11:44:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124576

Upgrade to release 3.1.3:

- The session is marked as accessed for operations that only access
  the keys but not the values, such as in and len.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-flask_3.1.2.bb => python3-flask_3.1.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask_3.1.2.bb => python3-flask_3.1.3.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-flask_3.1.2.bb b/meta-python/recipes-devtools/python/python3-flask_3.1.3.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-flask_3.1.2.bb
rename to meta-python/recipes-devtools/python/python3-flask_3.1.3.bb
index 1b289c7227..559f781e7e 100644
--- a/meta-python/recipes-devtools/python/python3-flask_3.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-flask_3.1.3.bb
@@ -1,12 +1,12 @@
 SUMMARY = "A microframework based on Werkzeug, Jinja2 and good intentions"
 DESCRIPTION = "\
 Flask is a microframework for Python based on Werkzeug, Jinja 2 and good \
-intentions. And before you ask: It’s BSD licensed!"
+intentions. And before you ask: It is BSD licensed!"
 HOMEPAGE = "https://github.com/pallets/flask"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[sha256sum] = "bf656c15c80190ed628ad08cdfd3aaa35beb087855e2f494910aa3774cc4fd87"
+SRC_URI[sha256sum] = "0ef0e52b8a9cd932855379197dd8f94047b359ca0a78695144304cb45f87c9eb"
 
 CVE_PRODUCT = "flask"
 
-- 
2.47.3


