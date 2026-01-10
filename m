Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EBBED277E1
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 10:37:53 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6317.1768041468996359497
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Jan 2026 02:37:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TYsvr/N5;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7b8eff36e3bso4970213b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Jan 2026 02:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768041468; x=1768646268; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rpOIJUNgKMOao3yGoKSKSxUmk5vshlUHbOULnNa+7Fw=;
        b=TYsvr/N5B8asidH4cBYY9PGMP+NlvPZOhwW527zIUjUgGsjWblO2nvRjwDOek4uwS/
         09ApOWePI6hMSHIykraeakL3FK0NWnUMY946LxNfitRYtol+Dcdo1q93y/M4KpGUD71+
         13vcAdnKQakfOkyL5t/3OKnZY/wee/Z4ygPmlSnCjh2tz2VBQGsdjuGhVIqjN3Kry27Y
         Y9ZD8NbYMo+D/PWIjgrNgzhf7uXU5XWlQFAovKkrwYU31/whi1rJQO4oV7Vnxqpwwj8c
         MscEAwCjRz1ILrStR0ni5h2Zt/BxMPziWfqE3v3jrCuXhzT8EA2Gn/jk66C7w8R09HPf
         56IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768041468; x=1768646268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rpOIJUNgKMOao3yGoKSKSxUmk5vshlUHbOULnNa+7Fw=;
        b=FdpTbE5JO1p52QtJKMt7Q/d2VXpbjpbaVqi4c3a2ZZqzMgRBp/hw8hOKYDg26+nb1E
         Vdv1bGQ5eyHJ4qyPbmiGJDCYiJJ0ON4xmx8skTQIQxWdTvDvXXdJilQnIgL7ZobfICva
         DSzqqcxic+uDHtjXS3x+9600euD9thSNsjiwOLVOceIm1kocy1NTNzaibo9+r1mjCum3
         0Qgr5U2cqrDm48f2HuBKo0Li1berbjw1bgZOZrovDhf+MuqKs5g3fX8o31g3ex9LAPgc
         3wd+eHG2sijiJYR3J1M6TbPK0Z3WtvsW2sWTowFVFA1K8mDVWsD3ryyIoFKTjwxXNQ9Q
         JdDA==
X-Gm-Message-State: AOJu0Yy9ngISKYhayWP0FFHqvrfJGO4R+JCgzCkb1Q0D0JcGszAC8fIq
	KJd+cs+5u6eW/nX3KG4YRfgmF/hWP8ggj+Es7KYf6to8yGf2Mx5qPikna1WFZw==
X-Gm-Gg: AY/fxX5j8DVeeUDJ9IqBCc1tQUAk7d4dJZNsfsaxPf8jgQskBw7rcwMNqUXC4/3e4bS
	5L/dPcgRomeZz4+VtoSi/MWr4ChMwAyK0KE+G+XxWcWmsjyX8P/aydL63kHjevdoBGCVb/vRM01
	BEmysTO7Qz1Cm69ouo7+ct/HjfIP9mygERGJGy3lBTkAizXPBVOvnLjTgrWOBKcZO5oBJVDVtYW
	6qFYwdlmWKiIKcTV4fx69hNr90UimFFAcLfb7LKOzQUQCsRktnwQiITSmcXsAAQ6RrIJijCAxIa
	uOtkcoqO3APWapKuDHMFh0GLJmYVJAhIGBs6sJQdSeP206w6ZspeTvRyJcUvB9aZ2XQiaE+aM8R
	mjkW8kNQWEAdEPf3c2ZlHTjqTapwHih16o/+134dswbsvcTV46NHCLlyGbSqRM7lMvjiq1vxDvK
	f4cnxO6PSRtm9sH64a4zr3LmM=
X-Google-Smtp-Source: AGHT+IFu54m/qKvk5NI+pZ/5lcoabrNI5Or8B5GFVODSTM0T1ucTkcYSKtFSmErrJrFpSyscOr3Eeg==
X-Received: by 2002:a05:6a00:6c9b:b0:7aa:e5f2:617d with SMTP id d2e1a72fcca58-81b7e448eb2mr11774893b3a.30.1768041468227;
        Sat, 10 Jan 2026 02:37:48 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f46882d19sm375715b3a.63.2026.01.10.02.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 02:37:47 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 5/5] libwebsockets: ignore CVE-2025-1866
Date: Sat, 10 Jan 2026 23:37:16 +1300
Message-ID: <20260110103716.3470419-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260110103716.3470419-1-ankur.tyagi85@gmail.com>
References: <20260110103716.3470419-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Jan 2026 10:37:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123324

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Only affects Windows and can be ignored.

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-1866
---
 .../recipes-connectivity/libwebsockets/libwebsockets_4.3.3.bb   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.3.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.3.bb
index 90ac0c3eb3..413226ced2 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.3.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.3.bb
@@ -68,3 +68,5 @@ RDEPENDS:${PN}-dev += " ${@bb.utils.contains('PACKAGECONFIG', 'static', '${PN}-s
 SSTATE_SCAN_FILES += "*.cmake"
 
 BBCLASSEXTEND = "native"
+
+CVE_STATUS[CVE-2025-1866] = "not-applicable-platform: only affects Windows"

