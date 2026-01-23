Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DA25D7788C
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 17:02:39 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.117.1769187751381531048
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 09:02:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CH5AuKho;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47ee4539adfso26381265e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 09:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769187750; x=1769792550; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K1NMCFHW+cpRclBn3AxC8comnPFaU5ZvS3aph2AzpD0=;
        b=CH5AuKhobkPaZwXkhncdXds1523eAdiR+ONIkjNfNw69fJR4y0frm2uR7iJX+jVxH9
         lwTQ8KDvdHDULwm7eoXGXk1sygWyFlU8+WAOqs0JGnIgBCm/tpHI7Hrf/4CCQ5snMWhK
         kQZjXon74S+aHwwE0zhaZkh4HPpkhMnR9Ld6ABOcAZCSIoc1VRvm9cjyMCOaXFWzAtHA
         uIGYCeBr66eYitVCrAiUSQmS0va7tzhHXm/M+Go47bWejWzo0hNAzK96AUWnlSvyX7wX
         KXgijkjk0yf6a1V7VIf3j7KLExC5hVKDoOzmOVDH3EKJTzgSKIgKw8SHCF11MSOmq8Wz
         XmHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769187750; x=1769792550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K1NMCFHW+cpRclBn3AxC8comnPFaU5ZvS3aph2AzpD0=;
        b=IS/zYccYxX1xh9ifZ9xDbX4R4/K7R/2yxq+FgN64tpU95tB0rexvP53gLKnVYJsJhe
         hqSZzDJFnfq0bSGjFljsuh60gWxPLf5YTOdZ/M5cj4LsRiR9GRk/yCVKe6wA3a0FO/KH
         Gdvuwff9cPkW+qzuu498Bte5olqO7yw60+t1IdRtjqafrfyQhfgsQnkpU4oTCDe8Mf4v
         n3tKxgTh7++J14fCJ12jJ5eJrnK/lk994gqpVwCJfKmJgsokFFv0+TECS43C4hulQfDO
         tSpDTNulk2JIVuAVDtclXARjLaVZzIYYoOotC0j4nsylBYtsWdTZx3bS5eVz70vPhDx+
         L4pA==
X-Gm-Message-State: AOJu0YwCL2BjtDG8p0BIqiWdzaqsfY/1YuXadzQuAZ3zO/igxoDLxfFC
	V/uDGPeY/PV24awWSmCyuCCOuRdqcragIXYvL9rlLg4Sv+CYzUqu19/Yf5NOJA==
X-Gm-Gg: AZuq6aJFqteaJqzLpCDs+Vorl9CqUuzQMrA5v3DZ+g4L1HmpzeMeHljU4PJaZfJUSyM
	Uljiip4NOcQdiXDLqj8m+YgngvzFSzveuZjfAKlNxNnCWfc0Pt1usiBsFXOYnzyRN5thZ+kPTg2
	H5o5uP1Gm6QAR6p5cTCb39foHBu2HVbsVnUwfNedphyi+0djkc+22ab2A+s2r8N/eKpaacJSA5/
	/qLaa8/4iRcVI0r7RLjitUUIqn2SK4faOiP+QxjZfceXL4FM8cykVUm8vm3D9ockbKQU6HgCkmE
	pacwkS3yLO/MFC+SCKbrA//wHiuX/JBngEJ4Pipy5lW8Y/auxg76qJADNQPrwupUj880i182oQs
	Z3qfRCVT60kTeQwd3mHeIoprJLVDqeLrrfMiEtkwXCXzp1xJ+dnh1cH/gCmwzDNPuulQqSXiVJ1
	KaN25i3ZR0
X-Received: by 2002:a05:600c:3b0c:b0:475:e067:f23d with SMTP id 5b1f17b1804b1-4804c9c09bfmr59497395e9.25.1769187749579;
        Fri, 23 Jan 2026 09:02:29 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804dbd4630sm25455165e9.17.2026.01.23.09.02.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 09:02:29 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][scarthgap][PATCH 08/10] python3-m2crypto: mark CVE-2020-25657 as patched
Date: Fri, 23 Jan 2026 18:02:19 +0100
Message-ID: <20260123170221.671471-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260123170221.671471-1-skandigraun@gmail.com>
References: <20260123170221.671471-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 17:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123793

Details: https://nvd.nist.gov/vuln/detail/CVE-2020-25657

The commit[1] that fixes the vulnerability has been part of the
package since version 0.39.0

[1]: https://git.sr.ht/~mcepl/m2crypto/commit/84c53958def0f510e92119fca14d74f94215827a

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ba6468f7a09bf8e268ea5ac7939925c362ead876)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb
index 95c57d5d48..736399c9d2 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb
@@ -17,6 +17,7 @@ PYPI_PACKAGE = "M2Crypto"
 inherit pypi siteinfo setuptools3
 
 CVE_STATUS[CVE-2009-0127] = "disputed: upstream claims there is no bug"
+CVE_STATUS[CVE-2020-25657] = "fixed-version: the used version (0.40.1) contains the fix already"
 
 DEPENDS += "openssl swig-native"
 RDEPENDS:${PN} += "\

