Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DCC7C44529
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 06:07:59 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16595.1784614076526854293
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 23:07:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TfWN9N7l;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38deea72eebso8913723a91.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 23:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784614076; x=1785218876; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u84udp6lHFDHbSMxiOVMovPY2jrsUoSJg0ab9zE7HB8=;
        b=TfWN9N7lHRdl/A20D7GysAQAP1/pyV6QzK+fs6YUO8K162wmT8XUpwWH/UjoCDyc9+
         ri3E7xe/3KPl4eXPdPL4CBFXAl7Qg2Jl69IwYdC3YgR3kyKCcKEYogjFtRB47QTkGC/H
         +BGHedNMaWNhExU9RP1L0sJ+r97YS8zqkeLSZj8exSKKdPWkgUCad1mXq1JrVQWziOmk
         pPKPbdgiyHr4N8BN4CpmWiF+ivnHLg9A5UDMo8XaTmEx8dDcE/NSpRQL2E/ThuhVyhNU
         eNN+TNq9e7KDXhswOyEvxyeMM/v67p0D0kJqHXdEPxpvXlyto34Lt6DaL/DHvpP1u2YL
         Ptfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784614076; x=1785218876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u84udp6lHFDHbSMxiOVMovPY2jrsUoSJg0ab9zE7HB8=;
        b=Gc2OUyTMOktXV2g8CnFfnQBmXB/NSvX3EngPYcgs5TxzqCGr/NT/PkZTudvI36DKOx
         f1lGgqowIdAHfN50ViPqCei8f7UT2owo8i0xAc+QIPapXhq80pC3mOhMJqaOmT3BJQG2
         ZLYviVOus6kxFvS4dkL3PItUm+0Ro9LNa9+UVUZ73Oa3KePH5IWpXdfLpyjcLuw5wz/g
         WEnByD2VRaMQItajFoUzS7GS0EKJXInkT5df/YAwV9NKh1lUEjJZtAEU+U53iZw/nRVp
         rnQMNwZ7dz1U0EIYRHynKhNKt31XVHX+GiLLwyhwtuM6e39AVUaO6vx9x4JZo0CKpaBS
         JDsw==
X-Gm-Message-State: AOJu0YwAFOmbfJuEN817z42jG3wTpYbL6sTr5jQirAlZ6M0VONKW4ycI
	7metMZ62GKSgUDixx8/QbJe6Cdy0BbvozecXT7yaKPIbm+JbFV+CPn/wRg8eWg==
X-Gm-Gg: AfdE7cm8HX1VCYbb05H5FxzlKjVJJnLqdB+xgsDdMw/e4I0eMQqS32Ia590s/6CX/Av
	typ38Y38UvIKV4JTlVVdp2RmFQyCEXZVnucf55N1vjqhSe26w4H6hqwPJluXV9zgkSs8rRB5plW
	0UvI1nXUdFrSnqYVdN/PerjzjDSFWiiUL/DMctGCZhC4elpn7DCw8vVKOC47bXC/VyPhy/giabH
	af4n4kyeRwxNcN6P+32sUVHbf84qVN9z8c+UqSgO6SoUNs7U+VdMbc1GCkmWTpCOD5UZoxn+rwa
	YChQyPFyhTpjXaMRy+8sbBzACPHbo3fSnYO6zy8yfxmYslEJFZeFmpTpg52uFIg752myHKCKmfO
	zKiq0EhQ/7yHjEeSVCHtqyZqCoHhaNgRs1lCFQZUlAuixIkBXKy/paHdrRhxYNy7WKWMSlp0r8j
	lTpW9u4e9rYJfmUUWFHoyHncqHBxWJ4SW5+0TiiMOsvuxj3AwCU5fVRh2QasTMJl4wV/2jEhQV7
	BwKslVi6M1f07q5e20Pl2g/wJclEr6IB4jvtLYpw0dFaPnXVQy3tkjnow9CA8RXcoQ5314M/FC0
	9dnpzFq4nfXnL92rLP4=
X-Received: by 2002:a05:6300:95:b0:3b4:75c0:3ec0 with SMTP id adf61e73a8af0-3c3ad8368b3mr17941180637.30.1784614075792;
        Mon, 20 Jul 2026 23:07:55 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bb77csm48026026eec.18.2026.07.20.23.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:07:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH] python3-wxgtk4: Use valid SPDX identifier for the wxWindows license
Date: Mon, 20 Jul 2026 23:07:52 -0700
Message-ID: <20260721060752.2591565-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2026 06:07:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128339

"wxWindows" is not a valid SPDX license identifier and has no generic
license file, so do_populate_lic fails the license-exists QA check:

  No generic license file exists for: wxWindows in any provider

Spell it as the current SPDX expression, matching the wxwidgets recipe
this binds to: LGPL-2.0-or-later WITH WxWindows-exception-3.1.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.5.bb     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.5.bb b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.5.bb
index 1ee6e5b93b..a84648266e 100644
--- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.5.bb
+++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.5.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Python3 interface to the wxWidgets Cross-platform C++ GUI toolkit."
 HOMEPAGE = "https://www.wxpython.org"

-LICENSE = "BSD-2-Clause AND LGPL-2.0-only AND wxWindows"
+LICENSE = "BSD-2-Clause AND LGPL-2.0-only AND LGPL-2.0-or-later WITH WxWindows-exception-3.1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=102f37a0d23aa258e59e4cc8b5380b35"

 DEPENDS = "python3-attrdict3-native python3-six-native wxwidgets-native \

