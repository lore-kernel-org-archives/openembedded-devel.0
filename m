Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23069C5B562
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:50:55 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web11.43599.1700452248643596901
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:50:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RKoJ9BC7;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-da3b4b7c6bdso3788257276.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452248; x=1701057048; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=btOjf4ojzsmK/PhkVa/0EgflTUDtlfS6X+v/KZiLHyQ=;
        b=RKoJ9BC7mlRKq21RacFOsqKB6QL+lpzjLHdo/F3FEMve7DsIoCzRBSUPhPHKIhvBtT
         C7TFPaFnlZEaMMeGuR37NDL5lpry9ahgn1YRcxMo50oHM7oxB1LCxsh/Vve7Q+3hex6R
         oREgcbB3/0dIwWxFPAvl7mBmZ3iZH4+g0LuWdrpzTKQQMKDwxAsOBxkVNf18/+3PKtHs
         TLBMAiBoYjaNSQOQ4pOInFj9ym9IUZJecZZf0v/jv4ibHZM876ZS0R6V2WYaXF3ggaTZ
         McwMsI/WnNrX6hrPdL8+TSq0zSEgPyeWNmFLGgqi5mz4CvbaOZz7TYOKO0mBHB0nuvrh
         WJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452248; x=1701057048;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=btOjf4ojzsmK/PhkVa/0EgflTUDtlfS6X+v/KZiLHyQ=;
        b=fEuyz7PoE+bsIdP2p3sA1ci+nM9j0jzy7Mc4FsvLezkQksAYolEwiU+XAQwTKHVh2G
         Sv66g7nzq4YPAdvfHe4l4U2fHlknJs63PAWGeB72CDRnssorEYsPEn2kQvmxaSUuUL1Q
         SyN98wxovz8L+Dx/LPFQLhsBdF/7+Pt1U9DTofNJ1Dh/Dm1JWdVz8e2HOFS0ic61Xnbp
         NJEju+QDFRH5qo0dxfsqs8U/aL1MCnx77YH9RjZSX+PapwdmZQkect6s/4NuKG/mUrcj
         NUUnn9U+dFUuco21CxhBKk4ZKiPL0IA3qM+nRpySHl2E2fTnJggncgS2BUQQRk2I1YrR
         GejA==
X-Gm-Message-State: AOJu0Yy/aFBcaSh9i0QogfKrj9SVJwZ9XEgA3Wz+Xeuo+aIHN3N64Pki
	xi6IAFzuufEsGsODgJ1uJek=
X-Google-Smtp-Source: AGHT+IHq5LwBDUFICzEwj7PDZaA+hSu4oLqHkHK19fYwRGV4PaR6gV1WwLEszuiuqCnJeJOnJ2i/ZA==
X-Received: by 2002:a25:3788:0:b0:da0:442f:988e with SMTP id e130-20020a253788000000b00da0442f988emr5313473yba.19.1700452247688;
        Sun, 19 Nov 2023 19:50:47 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:50:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700122060-21795-1-git-send-email-wangmy@fujitsu.com>
References: <1700122060-21795-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-networking] [PATCH] openvpn: upgrade 2.6.6 -> 2.6.7
Message-Id: <170045224689.1416826.11527857974835435851.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:50:46 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:50:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106905


On Thu, 16 Nov 2023 16:07:40 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ============
>  dco: fix crash when --multihome is used with --proto tcp
>  Mock openvpn_exece on win32 also for test_tls_crypt
>  Add warning for the --show-groups command that some groups are missing
>  Print peer temporary key details
>  Add warning if a p2p NCP client connects to a p2mp server
>  Remove openssl engine method for loading the key
>  Remove saving initial frame code
>  Double check that we do not use a freed buffer when freeing a session
>  Fix using to_link buffer after freed
>  GHA: do not trigger builds in openvpn-build anymore
>  GHA: new workflow to submit scan to Coverity Scan service
>  buffer: use memcpy in buf_catrunc
>  vcpkg-ports/pkcs11-helper: Backport MinGW series from master to release/2.6
>  CMake: backport CMake buildsystem from master to release/2.6
>  Remove all traces of the previous MSVC build system
>  doc: fix argument name in --route-delay documentation
>  dns option: remove support for exclude-domains
>  Warn user if INFO control command is too long
>  dco-win: get driver version
>  dco: warn if DATA_V1 packets are sent to userspace
>  Make cert_data.h and test_cryptoapi/pkcs11.c MSVC compliant
>  Log OpenSSL errors on failure to set certificate
>  configure: disable engines if OPENSSL_NO_ENGINE is defined
> 
> [...]

Applied, thanks!

[1/1] openvpn: upgrade 2.6.6 -> 2.6.7
      commit: b4ec1dc4688dc90f6d8b4d5247b214626fc4ff8b

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


