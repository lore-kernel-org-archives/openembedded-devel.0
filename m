Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7513.1792574997083594322
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:29:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jMHpqKFb;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33fb4680717so1308017eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 02:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792574996; x=1793179796; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=stkMjPhXPiD4icmfR7fy1+pxA66CHinTvvxhxWi0vng=;
        b=jMHpqKFbUTE3buDyISG8VtWOGvs8Rq7ioP7IHr0p/5p+hdXpUDUdSx8pZtp5UaXBEP
         4P4xPhcEPQR68JQJsvvm1EWkrkxt4mjZb+CVJRqxE88Ol5dlOx2Fuw2iEA7xYvsVClGK
         FZs2/X9t9yHp8DhZyy5MExOe+nBWPsGJKOEq/hhlbV6KSNOTSasuasRf/gBSnEf6IwHg
         g3/O/v33ooVYv9tX2zgDgPktmyd4FxQ02B6x84IY6MCio0IfJUwC60n2I67dYqSogGex
         zCrZFwJL6+6/vunbwrO8Uch0y2x58/NdcPgZKfeb4bkmLWnhFoXnmPf3TysHcs0dEWDJ
         UwYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574996; x=1793179796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=stkMjPhXPiD4icmfR7fy1+pxA66CHinTvvxhxWi0vng=;
        b=MVhPbyKeEhstU6yYNHeZMQ4btmxHfevQY9ktWIpLKw3L8s+l2r/fwLcRIsdRz/+MOI
         01R8QNPLOZb92gb4HMBRsWEHs7As4IU5EvySWK6Ev2vQ+XCZDd2YPox4MKACuUvtt8gL
         DgrJoMZSUHXr7u7Jj96OJzupFuQufFq9+zsANq86XbTjcSd8WZWhLWkmOWUoHbzcU0KD
         1/55zrkhhv0b0ZWG9DkrInteGuFtk/pGFAITOfvNqQLoB5Xx8zw6GYAvcruPIdgknNmN
         2ZdEVVVMZ77HdbT7sAaJ/YC/IA02vT0QrfTjYqomfPjQhub6zxkRwCcZmt2TNE1KB2nd
         6Qrg==
X-Gm-Message-State: AFq9FYIgnt2JSMeW/Msfn2qXmyeACi1/cXUPFQMNsqoW+SJhwFI9pxB7
	C3EHjJZ6aiGR1aR/8zOEAmEn0Lttf7he0WjqfKVLJPdNu/mZ8eYDTnKhOWcMnQ==
X-Gm-Gg: AYBFou0FdhLtPYhJpdl2Gfb+Ko2Jrr8A4JPE448q4emw3PRFdIiogfoR13K4JbdEq/1
	pwyEa5BmCrK5x4MWfrZSiWRgGP/pStLVAMVxIWBc/qzAY3MVObX0Mwf2dYxrAKy+rEOhNkCc6NO
	DAlagwUkX6Yr5a9gTVNUTb1/ycnAgYLmcuX2fkQyifQOdTlEYg1zLjqILNzraS/M6JFrfk4Rp5L
	VB1fbS4w1OhaoX4/WGqncY+xx0873/R7J9onb3ia6xFPMRO/FQ6P1MXmvTZQgtQnCozU0VJKzgS
	G2u+cmOgygTLG8Ar2Tsdbd/7jtQYrD5PcZGRj1Nf1EDFuFt+7MfcaNPqQD4Ot+C0NarVLJDkyMs
	c38vR0quPmaUmwu6aFZG1WtSf4qba64pk3j471Md2ZprOl0UNxZ4KiLINbn697jffyPe/Wryz6E
	prQUd/qyQ6nB5K9GU2zPO3Ca1eMv5VesDaPhW6YGsuWbsTtCMRRdl5ajrQY7WfVWwQ6y9xPBAcE
	Z/WEESh2LiL+orJExVJbvyuRMyZvWVC9A+95NDaX/VbveNrk868zQD5gCcKcwZKW8SOzrzsk1mT
	LOg8z1N7hYzY4lkyqfNvzY7A+rn+1P8=
X-Received: by 2002:a05:7022:929:b0:14c:be8e:69fe with SMTP id a92af1059eb24-190a051dd50mr2649423c88.5.1792574996321;
        Wed, 21 Oct 2026 02:29:56 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm4716458c88.3.2026.10.21.02.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:29:55 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][blacksail][PATCH 23/44] pjproject: mark CVE-2026-26967 fixed
Date: Wed, 21 Oct 2026 22:28:36 +1300
Message-ID: <20261021092857.3585453-23-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
References: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 09:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131210
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-26967

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb b/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
index 8aa7775205..59684ac7c7 100644
--- a/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
+++ b/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
@@ -118,3 +118,5 @@ RDEPENDS:python3-pjsua2 = "python3-core"
 # and ${PN}-staticdev (the .a files) by bitbake's own default FILES
 # patterns - ${PN} itself ships nothing.
 ALLOW_EMPTY:${PN} = "1"
+
+CVE_STATUS[CVE-2026-26967] = "fixed-version: fixed in v2.17"
