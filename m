Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1529CEDF176
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 15:42:44 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.74774.1770997355776150450
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Feb 2026 07:42:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j2UWNPpU;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43590777e22so701229f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 07:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770997354; x=1771602154; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NwamhEF9e9fOqWIKqkbGsUlcYoHeqMjwOxyAzLniHxE=;
        b=j2UWNPpU2paw3iMb13Wrpa6tbCOhK87TWRWWfQnvCe/M1cSgxibvS9qirZ71iuAMzl
         70QsJN8ZIhbGEhMPhjqpyFuLxT779DAa+IOqcInBxo1yOD12qYzC+2tRwpTr6/6K6qW4
         Ot1qGmDRjXLbIWN+RDs8tEm3faRlwdsc1oOe3A74U2J5Y/Q7KiTcmu7lUsxJxyjFuR38
         JI17agbRLMgg+LiVYn4lHOyK2fYLeb2kNP9S7gO2WHhWitNJtCy7ETWr6ykAlQyYFv9G
         45/CdiSRx+SeTTMxl+pu6h1KS7FGYLt+RNq3W6pSfxoQ0qEo91s1jX2/d+stnXs7KJ9A
         6uRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770997354; x=1771602154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NwamhEF9e9fOqWIKqkbGsUlcYoHeqMjwOxyAzLniHxE=;
        b=LSSS5I/5Cef7ove2SUWJBPkykKUY4ZV7Qqfo21eDCSNSrYSv5DfLpf/X6khYZD4b87
         X8jBrrWXPZraMqa+ffDzAewTXyYGo9T2+U4Cvz7pe1GNwJYdtLvfZq+/PVNIEKpJwX3U
         5IN3Wu+sk60FkZKiJaLzRELa/0LLyXy4D8b68mwbXHO+n+Xwvp43p9PAJin/NEeGPFn6
         wPhGOJ2VCuDMLuHBDjqQeG3L0b73PulSE0y5RSTW7ClIoDeJKgPAzuODBssUoaGvzTZe
         LxtGX4gBCm/1tmi/COOHdvQ/xLTmM5evvZ0hUcR2peXgy0HGvENcsdH0BXI+q5QOVa0e
         z1zQ==
X-Gm-Message-State: AOJu0YyVSkOhVCZRhCtd39GR2IBQXkPXcK6X6n2MUSrO2VohJJUQqM9V
	Omx3Sc4KEbc231r0A58pS/++KXp5kGjsk51MsgUhcH3MablxpOQeOPOVv516Rg==
X-Gm-Gg: AZuq6aIWeoyMt6A/t/oBGhgI4kY9GU5bDm4l3XHhx14bb7UEssSLwnC+vnb1Kq7hQS+
	/HMQmAG/gZbfH+mB6M4yQl2Olc9y6aEnEM2qtrZ8i4YGcIf/h55EOA1UVQlWtjUjcAyzM9fWnj0
	V8/+IpQYydFL8ZZBze5VBY1f6HEsNv89xDluk4XvXnk2bjZPfpKbreNZlzm0UhE6qnakvhOm2SH
	PmFQcKWErPwLmefc6Q8CW33gWyoFAK8DhCsGyJG2cyf5y8qQZFgCEYQU6pl34K/jy10gOcVLqTa
	sLp70KK/F1sWreu6nK9fXLF4KMMDsSSckOlBqIfWEThXmgojPGDgAL1viQrwV/aTiInaNbC3JOP
	eCfmus0S/Q2XRFfmG/fSaNmezUFLMecMmpzNjzJd2vspEIq3TNPkft1xTe96lqoCNCR+SEVdeF3
	WUddWUdqUVax8LDEaqSwtX
X-Received: by 2002:a5d:5846:0:b0:436:1b1:6cbd with SMTP id ffacd0b85a97d-437978c5dd2mr3956104f8f.6.1770997354011;
        Fri, 13 Feb 2026 07:42:34 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a6c1b4sm5807957f8f.14.2026.02.13.07.42.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 07:42:33 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 5/5] poppler: mark CVE-2022-38171 patched
Date: Fri, 13 Feb 2026 16:42:29 +0100
Message-ID: <20260213154229.1329476-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260213154229.1329476-1-skandigraun@gmail.com>
References: <20260213154229.1329476-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 15:42:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124394

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-38171

This is the same as CVE-2021-30860, but that one was primarily filed
against Apple software (and some other related projects).

The patch that fixes this vulenrability is already added to the recipe,
just extend its CVE tag

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../poppler/0001-JBIG2Stream-Fix-crash-on-broken-file.patch     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/poppler/poppler/0001-JBIG2Stream-Fix-crash-on-broken-file.patch b/meta-oe/recipes-support/poppler/poppler/0001-JBIG2Stream-Fix-crash-on-broken-file.patch
index 4a8ea233c8..3990f4766b 100644
--- a/meta-oe/recipes-support/poppler/poppler/0001-JBIG2Stream-Fix-crash-on-broken-file.patch
+++ b/meta-oe/recipes-support/poppler/poppler/0001-JBIG2Stream-Fix-crash-on-broken-file.patch
@@ -7,7 +7,7 @@ https://github.com/jeffssh/CVE-2021-30860
 
 Thanks to David Warren for the heads up
 
-CVE: CVE-2021-30860
+CVE: CVE-2021-30860 CVE-2022-38171
 
 References:
 https://nvd.nist.gov/vuln/detail/CVE-2021-30860

