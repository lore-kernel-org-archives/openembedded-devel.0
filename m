Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3273FC5AC67
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 05:51:09 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12940.1786600263556125100
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2026 22:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=EvY6zhy5;
 spf=pass (domain: mvista.com, ip: 209.85.216.52, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38dd55ad76cso693123a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2026 22:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1786600263; x=1787205063; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sz9YkumYUHpqmbPqTJsRAd7i9QCZPwXC7euU+5+2MR8=;
        b=EvY6zhy5S1yhDRZtcg+FnRhSTzulMaQG/Jec8v/IgmFBPeQi4YKKstgGjkQjEgrA4X
         ahfgAL7rGZOAVZhs97O/UxLHpsHd1WV2sqZK/FiNyb7vzoLi8UrIfQREviHVsK52FBGB
         tqnhHLC+shDOLNFrnzwsW3rq67jdk5dT3thls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786600263; x=1787205063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sz9YkumYUHpqmbPqTJsRAd7i9QCZPwXC7euU+5+2MR8=;
        b=Vj4nIp1e8Q8vzDCVOrEyCNtqTkIo0tRk+3FIi0FLOE3QY4jgEk2q1BW/HWYwtVDSpX
         pW9LYJjCp8SUrK4EHwlEIDm30FAxTlRWJwihPBwKAZgMYRPhm6c2q6B/NrfEQeEHmhKU
         kLVfS93MVWefr0VrkPsRVwMthR+PoL+GybqQABuSAUzzPfjFRWCAYl8eC30b+LHXqFhK
         osTF2yVXz2Hm0fcogjdlnEswdAZwKAsjGN43LXN6d+7NnJkrXm+VHJFi6WEZ/pwK8oC3
         gw+2X+kkVJFCffU7ag2BQw7AxQFSqFiQGb20J9IFcPiT6Uap2zGZ6NXKdCqmuBaDgA7J
         3EaQ==
X-Gm-Message-State: AOJu0YxkbAMgRacR4gdW7u6XXauPArw6SdmNSunLXfRV0ycppIzuhAG6
	uJ7JUV9+/2TvBvxRjWbJMAL+YFMEReiM5rNSwBqguyr31k7pW5rtkYZcHqoW9wvDkxWuFs9wW0e
	t+KhMXMQ=
X-Gm-Gg: AR+sD12ChkNhC/CnFC6sZ1rKONdhwA4V20bT/dzbZE9cW1YOY+2w2de9OyNRT57/K8E
	AYXTa+J/Xtbf7mJD8RatvWa3dldTRqmYlSJDhLxfpQ56r3i5XB7NxjSQ50xbpSm1ga442pUuCNu
	jwgOpD5EyhobRU2EaYyzJazF5yCSO6VQL5jJxgldsH/e7MTWGtmyo6p6btY11GhZ0C6Gx7D9cmz
	veet4KGAJrXfkR9RQ1T3ejJOetVhMFpng1fnx/OfxCeH0Pwyyr1yJRwqzLAW75lwfgfc7H+diWX
	bcMNxvPm+LjYBbL1l+tnOfZGdVH9NiIM4lMfyYabJd+gsAxLOYGoFkqaL/KpN1ZiqVvuQJhpTPj
	MX2F2nA58hCWyrqKgAp62yvuxBmsKSCnBrJcMtTPPT327toQoj8MkV6L/wc890vhahrMEl5ymQk
	6eKwhxDPEpiAfMZKKlV/vjp3gPumegEn0cYqEnAV+jT0pSIsCmkjz28QYPTneKnzMsjnUx5CrEj
	g==
X-Received: by 2002:a17:90b:39ac:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-3931f446ef4mr1971553a91.4.1786600262624;
        Wed, 12 Aug 2026 22:51:02 -0700 (PDT)
Received: from MVIN00013.mvista.com ([150.129.170.209])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1412da6a1aasm5876820c88.12.2026.08.12.22.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 22:51:02 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-oe][scarthgap][PATCH 2/2] libssh: set status for CVE-2026-59842
Date: Thu, 13 Aug 2026 11:20:42 +0530
Message-ID: <20260813055042.91413-2-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260813055042.91413-1-hprajapati@mvista.com>
References: <20260813055042.91413-1-hprajapati@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 05:51:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128935

Analysis:
  - CVE-2026-59842 affects information disclosure via short GSSAPI Curve25519 public key.
  - This vulnerable code is not present in the current libssh 0.10.6.
  - Hence ignoring the CVE for this version.

Reference:
1. https://www.cve.org/CVERecord?id=CVE-2026-59842
2. https://www.libssh.org/security/advisories/CVE-2026-59842.txt
3. https://security-tracker.debian.org/tracker/CVE-2026-59842

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 meta-oe/recipes-support/libssh/libssh_0.10.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
index 13e01ff9fc..63854ef5fd 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
@@ -72,3 +72,4 @@ BBCLASSEXTEND = "native nativesdk"
 CVE_STATUS[CVE-2025-14821] = "not-applicable-platform: only affects Windows due to loading configuration from C:\etc"
 #Reference: https://www.libssh.org/security/advisories/CVE-2026-15370.txt
 CVE_STATUS[CVE-2026-15370] = "fixed-version: vulnerable SFTP server longname construction handling was introduced in 0.11.0 and is not present in 0.10.6"
+CVE_STATUS[CVE-2026-59842] = "fixed-version: vulnerable information disclosure via short GSSAPI Curve25519 public key in 0.12.0 and is not present in 0.10.6"
-- 
2.50.1


