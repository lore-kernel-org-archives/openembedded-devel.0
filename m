Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACE84CC6B2D
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 09:25:58 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9265.1791969954360672836
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 02:25:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=l6bfOgSo;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-89d6bd67045so614096b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 02:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791969954; x=1792574754; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=86l68VtZIrjrD7bMa2gPVGeX8EJdU4udWK0ryG9R8KU=;
        b=l6bfOgSoH14sviang9TsYH70vNJ/SbSxfRcynqh81N2PiLwabOvcFW7dnZgO/yBn7y
         bKyIWJAMChbpRcgcX8Nkt2g2Yd7qyEuLvberD7AkMOSldjTjorntJPYmoJAFzGKevvjX
         t0rZvgFso//cS+QpXsX1u4Xp5B3Uyfo85eurV8OsDtdRQ3yNrn2d5RqjuaMsuZeTgcgm
         TfDHbA8RLrFjl3epob7Iv4rz3t2h/m5LUEN7DbamC+Cm3r/8makMdqWcYrsrwBbjkC0b
         cpNCQQvwfBx1hOwA0bcrrsfYUpu8xtTSM80IoiAvAW4Mx8HW8pcvvRxEhEtOwWWI+pzt
         DLbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969954; x=1792574754;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=86l68VtZIrjrD7bMa2gPVGeX8EJdU4udWK0ryG9R8KU=;
        b=FjfAdjYvaeElMWGX36ZBYKouOzEBT0ZZULtCrYRVfTqvS1UdJAI/i2BQ6BeoCPseDR
         BIErH3PK1H6hBHVkVhXN1iaqg4WqitdSxL+NhyGi06aa4sK32jOWxikSXlzG1kskg3HH
         f/7wAOKW2g4eoultbU59pOU2y7f/lvC5V9hm93fpRXLT0wCsAugo/27rUeCWXofnc7xD
         t0vnvOtHj2xfYKpi2FV9S9r3UzkGnLOf2Pd6m8mhhXsdWQmTpgdwnkCGYNL/mA6DK2Qc
         QRAL55z/F8nnILCSQnts+OK40E9Ks9bIjRzJ5CBQXgGQ5cBIHfjS7/2GD5kKwg8pZEL9
         8LTA==
X-Gm-Message-State: AFq9FYKGw3lxTnXscYK6FB+FT6SeJsDRMi3Zcmyhdytm+5P4rjD5cypg
	zvTMb66aSLaL0jkR+rPwmFhr8C4DlyHI6rbpIMLWwa9/TTWdByOSvBsjPGP+hw==
X-Gm-Gg: AYBFou38R3t01NiuYk5V/BmQXS6TfjUjXs2Zr7PPbsbF7uhippqI+Bnx9/GhF1O2zZx
	5MjrwTSFNnl8jgIIO0F2Yg47DkDyLM96Ztrr40TY+gTXhEVrdU94xCrWnuMMoGE2jnbLl+O22Td
	U5rVto6Eh21JotsXM8Z2hRe3I4EIK7lvzF0TI3t3nrBGe1GXlhk17L2Xi+cxY5lNDN9OazEfltJ
	67yhKXvSAj7TZuejpmGzhGC3T9J1Eedb75MIIUd+NJP6Rp/cgaE76BPoasQ/a6xJEwKXsayABjj
	zU13pfRoy73Olg0/TflY/m0Ofj+GePehDCNUfv675FzMB/EKWcYfphDpq/c7cauNedHZGaQiF+H
	vZ8sIjVzJb8ukmRFrL/mm0/XgD47OKv/kigSDOxMrRtdjPnnwW/P4xigygZ1g3hvIU13YujYg7W
	TfMc6kRP6fDxPyQXtXd+fROJFKLQqaRN3R0ZV45IMpW4geMQSmyhyGdAzjCW7W70DiBAyXCJqkv
	we42V810Ntf3+Soq2oThttouN7gu8UZpBH9LS0=
X-Received: by 2002:a05:6a00:4008:b0:882:be9:b76c with SMTP id d2e1a72fcca58-896898e8282mr9836211b3a.3.1791969953771;
        Wed, 14 Oct 2026 02:25:53 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d804ec645sm865426b3a.43.2026.10.14.02.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:25:53 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 13/17] pv: upgrade 1.11.0 -> 1.12.0
Date: Wed, 14 Oct 2026 22:25:09 +1300
Message-ID: <20261014092514.454505-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014092514.454505-1-ankur.tyagi85@gmail.com>
References: <20261014092514.454505-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 09:25:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130881

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
- New –format string %{progress-conemu}, and option –conemu, to show
  progress in the terminal title tab on terminals with ConEmu OSC 9;4
  support
- Eliminate potential for closure of standard output under a combination of
  error conditions when using –monitor mode

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/pv/{pv_1.11.0.bb => pv_1.12.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/pv/{pv_1.11.0.bb => pv_1.12.0.bb} (95%)

diff --git a/meta-oe/recipes-support/pv/pv_1.11.0.bb b/meta-oe/recipes-support/pv/pv_1.12.0.bb
similarity index 95%
rename from meta-oe/recipes-support/pv/pv_1.11.0.bb
rename to meta-oe/recipes-support/pv/pv_1.12.0.bb
index cd57418b76..1078ca2605 100644
--- a/meta-oe/recipes-support/pv/pv_1.11.0.bb
+++ b/meta-oe/recipes-support/pv/pv_1.12.0.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://www.ivarch.com/programs/sources/${BP}.tar.gz \
            file://pv-test-system-version.patch \
            file://run-ptest \
 "
-SRC_URI[sha256sum] = "fc02c9fc2b82b20a92cc8d98f844be63f22abd98751a8e4abc875e1d803662eb"
+SRC_URI[sha256sum] = "31fdbdb449c7143cd2968567bef7599e9f031950e6158ee7bb76e40aebf6ffb8"
 
 UPSTREAM_CHECK_URI = "http://www.ivarch.com/programs/pv.shtml"
 UPSTREAM_CHECK_REGEX = "pv-(?P<pver>\d+(\.\d+)+).tar"

