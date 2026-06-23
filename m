Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20073CDB480
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 09:41:42 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17028.1782207693632244863
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Jun 2026 02:41:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Bo7j9YYg;
 spf=pass (domain: konsulko.com, ip: 209.85.221.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45ef29c5561so3033765f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jun 2026 02:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1782207692; x=1782812492; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2JPuxxkJ4uzV/ZGRcNQEo4VahGFu8VMF9jYu+cI/MZ4=;
        b=Bo7j9YYgTHmkdyFXf/GjkAUwStn0JC/dhTw9LldMbFHes06lpZ3Gc6djk3P0Pn0NPl
         ld6AqnkvjDAsfUMXA4GgT0mY+/9VyysZJygNEHEbQ4sx8OKl4AKnRKYtmIv6NYmPcRTo
         4J6a7KSBHe0on5ZdGQ5fEqu1r/BBhbL9pGNyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782207692; x=1782812492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2JPuxxkJ4uzV/ZGRcNQEo4VahGFu8VMF9jYu+cI/MZ4=;
        b=kSFfxDcx8tOYSIao+NkF6m7TWkRF0x4AdmrmlsNrOU7GS28toWfiIGljsZdOqmPICk
         bZG6apySQ/5b5Gb4HRzkNKWvuPzeQ8gC9p/pGgLK8KgDu3SEndpNuw7wyCq3iRq0e3nG
         PRDrfbcgnwQOfgeqfDEPy7CHlXJ68Adu3w4jp4j4WzdDpNpgnpmpTvY4R1Sitt/HcsVx
         qZfqouI1fzDxoBTKcy8lRQ2GfNTWHwrJY3ey9zFmxo3XdVVBcTs/Y2CZv2iMUu9K9odB
         1Dz12d2ivtEUdIJaL44p4E8LICAKX8kFMCmT9Va/+hwCMxfbN8inm+EDXgbOO2STEt44
         VmUg==
X-Gm-Message-State: AOJu0YwMdL+NF0QtDrflQZVsnh9uuMaYCm7lUxc3x5U38lu3qfJLidN4
	i1yLy/ofX043I6klYYvrN2eP9xwP+0VOOVsRm625GRVAS71sgapOSxRmv4Mh0uKA8dCDD4r6nJv
	2qVGR
X-Gm-Gg: AfdE7cl340nKYb6Usx4RCU1fpxZ6djqHDI0qvbnS8OzP3jAZ/JIx8uiVDVRdp5e0gQR
	ClHnZ2lWZxXG4aKUnCHDssncF6XfSZpRxsoLGabH/a/omwZLoR+JMhcmxxHR9ZL7DSO/44zY8Bs
	0KqkDp4X3k1cmt2CNi1l//Xyht9l9T9V+j5kNrclRNl5BpZeGu8ZjiEPli2NSyuipaN4fzgAs5Z
	NadBOxDcReV1Ict+FJqUiotxDKdWk4+sVgIoiKIVrwkmzKDF2vj8k7Vi02IYsdArYfgU/JVl4qz
	VIUZk/F8OfatN/s5D1+ToGTJnskOHapmMWZds0QfjQXOWxco74uHc9DlgvCOBmQ9JiJ4A2PGvTH
	CqB1GZ81a3acGGRPpyABPYNBKQBCJ4XdMypAfoS2pTK2kaY+BVkPeOGttIqVh2CM/hsf4WikBTV
	j4VsU+LQ9+MO+KLtPz6cGLkceUHA==
X-Received: by 2002:a05:6000:2581:b0:45e:e5d1:8a72 with SMTP id ffacd0b85a97d-46add3713f5mr3455224f8f.28.1782207691825;
        Tue, 23 Jun 2026 02:41:31 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466648c4fd2sm33581597f8f.14.2026.06.23.02.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 02:41:31 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/4] python3-jalali-core: Add recipe
Date: Tue, 23 Jun 2026 12:41:25 +0300
Message-ID: <20260623094127.1592848-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260623094127.1592848-1-leon.anavi@konsulko.com>
References: <20260623094127.1592848-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jun 2026 09:41:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127698

Add a new recipe for jalali-core release 1.0.0.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-jalali-core_1.0.0.bb                | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-jalali-core_1.0.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-jalali-core_1.0.0.bb b/meta-python/recipes-devtools/python/python3-jalali-core_1.0.0.bb
new file mode 100644
index 0000000000..e3a7b02e40
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-jalali-core_1.0.0.bb
@@ -0,0 +1,10 @@
+DESCRIPTION = "A Gregorian to Jalali and inverse date convertor"
+HOMEPAGE = "https://github.com/slashmili/jalali-core"
+LICENSE = "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a88966a0e5f4057719d2cc2766c6e091"
+
+SRC_URI[sha256sum] = "f4287c70c630323dcf0a3ab26df905ba4d451e230ac1f65b3bb2f77797894a2b"
+
+PYPI_PACKAGE = "jalali_core"
+
+inherit pypi setuptools3
-- 
2.47.3


