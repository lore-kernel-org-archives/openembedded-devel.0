Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33CCDCC6B3F
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:44:08 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32821.1792043047634025821
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:44:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SiS5T/4P;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e96502e447so1394305ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043047; x=1792647847; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mJjzH92AJS/YH2ce8fGIUYLPv66ZYgIjH7lmFkApzEQ=;
        b=SiS5T/4PwcLz/zHHOj9ybPT4EBxKC510YFhDu4ivXAmJxd2pJz1EKwzDgkofzGKRid
         fetzFms9dS4jNoQEa4TyWAeQj9eVfMQRQz8RKZs3EiuVIWbkg+vMaUEYz3OtGzFjzro5
         7SaR3zGoJOLSaCAeaMQQxAZyZ/+d30r6R5/c+trsqAF/W6Mhottowkn+6dWGPxh5Z71F
         9gNVDMc2Lw0wQU74JvAyatQmfAu9CNxB0rE1oVI4A3W37pXF8wc0ubzvCFOHltPCcE/0
         MOvWnmZeLlCjnbhxDSsIjwVBpz8iw2+JGBfROTnKxwhXsi3tRNbY3yqoHo86aK+T4fs7
         0L/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043047; x=1792647847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mJjzH92AJS/YH2ce8fGIUYLPv66ZYgIjH7lmFkApzEQ=;
        b=i5m6A9UGMGOFIAy4IRjHrmTsCWyMOXjH+swnCZfOVJsSVJiiLLxJ6UQibep23S7nIZ
         5K36jJRGa9h9kwsehgjIhjJOsTfae8P9gPAHT2M4VWw7gVnqMRxvxcZW3zHbmFN+Y0Dk
         q5wHogi42TtRrQM7g1Lqp8D71kPaMKbz14zm+H4H2Y0mII0x+XRpYtaKwOnu/7R7OCaP
         OY1q85HIwWj+EGK6Ym7ZcWzqNVt8DPk+uzQy7gBN4bU20kf7JPE6jr2mBX4NXKwcp19o
         B8sxW1M8MrzADgnjv9S2Z6Qb+AKqTO3uVmOPKDQk1kgYbfAuXbl8be0X0Tv9hcFRDcbb
         X1Vw==
X-Gm-Message-State: AFq9FYJ/1t9EKZJFkcUcadKNQIBp+yBrMPUk+zSo35m2F2+6giFTFNqv
	SwgRsQY4w3UWdwxtNCXc7q4vojP38u+heWd3Yc/OYXaiZDdtArR1KfbgwO+J9Q==
X-Gm-Gg: AYBFou1S1khEKs8n3hzEhB3AptNyYNtU+27rGRMqRI1sx9wmDqOtadN95rvZ5fppu+G
	1VDkwjPXjWoXusU11DiI6J88oiAqc/7Qb2VQ7C9euuUU4c8TLIPKYUFQelNxVowebscNYEKxCON
	SlvQdPPF4S89XpHvX+hQoJmTyCanbr2h/WX8sNCsemMYYVswfkypBamK5/r+gupXuaj5+4Wdvju
	LH+wph6gM3z8ZPpmpT+oPNAuJ2Q+ATk13lhMiaxuSSFd2SzswcA+iC3m4X7aMcmxX1FTPz3lgWz
	rBge5n9oLPRYShbI7bjD5Le5foqRmyeah4S61KTJtO0DE+1deEj5J7C3YvOowgVSdZKNs4VIcgr
	93M4TXMRqzR88erSUQiFVTuYZfHTdPSgUbiwHoQMRzMMBU5TYwxwc0XeqoHMz9pQL0jIpaLlW88
	yp4Ndm4jcs0ETP5zpI0XTDUg4JoxGW16TWHw2O7d0k+8DORWUY2D0hp0pLbfLWkp1tlms7TnDCN
	Wm25KZAFQWIIo7w0wbXe0g=
X-Received: by 2002:a17:902:ea05:b0:2dd:ad73:c93e with SMTP id d9443c01a7336-2e842abf8a8mr163539315ad.31.1792043046952;
        Wed, 14 Oct 2026 22:44:06 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.44.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:44:06 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 36/82] libssh: ignore CVE-2026-59851
Date: Thu, 15 Oct 2026 18:41:24 +1300
Message-ID: <dc56cbbc023c67b7700cc51cd3e5b86b3e3c9904.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:44:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130956

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

GSSAPI Key Exchange was introduced in v0.12.0[1].
Debian also confirmed the same[2].

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-59851

[1]https://git.libssh.org/projects/libssh.git/tag/?h=libssh-0.12.0
[2]https://security-tracker.debian.org/tracker/CVE-2026-59851

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/libssh/libssh_0.11.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.5.bb b/meta-oe/recipes-support/libssh/libssh_0.11.5.bb
index a99c4ee788..a67956df88 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.11.5.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.11.5.bb
@@ -56,3 +56,4 @@ CVE_STATUS[CVE-2026-59845] = "fixed-version: fixed in v0.11.5"
 CVE_STATUS[CVE-2026-59846] = "fixed-version: fixed in v0.11.5"
 CVE_STATUS[CVE-2026-59848] = "fixed-version: fixed in v0.11.5"
 CVE_STATUS[CVE-2026-59850] = "fixed-version: fixed in v0.11.5"
+CVE_STATUS[CVE-2026-59851] = "cpe-incorrect: vulnerability doesn't exist in v0.11.5"

