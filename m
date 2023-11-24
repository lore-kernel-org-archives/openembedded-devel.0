Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23147C636BD
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 00:01:12 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.121188.1700784071763013430
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Nov 2023 16:01:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FSaQPs5i;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1cf89e31773so8975385ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Nov 2023 16:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700784071; x=1701388871; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wkPP5Rzk62Lov4LzdYuxGhhJafTi9HwaYWAuXSrgivI=;
        b=FSaQPs5iA3vBQnYbt444yXLV7HL2Sh4FTqj+wyRXTItVvVXa0F4DtI2KvAzJCOkXeb
         oJSRoMjSxCMnSFOItldLj3D5GY7hhdUyU5yiRl7BzQ+n4N1JRsQ0WcrZbbk4UEis4sgY
         akbpI41JoVb/L4RhSPmfMSjyZK9HTss+v+SGP9PeuPnVq8WdC40dlWzwciiLyR+AvQ7w
         LQ4xreR6mNZAUPmtfRBGS1gAEE0UKN8pFADdg3NkupaXoeixhr22sVL7nAAnuxtKOvVI
         /jVQzRnUDY/NrklINpC686+LGZlBHnYUr1cW4+J05d/6ULwlAsyJnVnMJX/Fz7b/E3Tk
         xCGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700784071; x=1701388871;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wkPP5Rzk62Lov4LzdYuxGhhJafTi9HwaYWAuXSrgivI=;
        b=MscZdcYspiVk7VGG9txMn2MaCOHPhMPtacJtYiH42+JdGB84PVwCAz2RS+YvuLdLlY
         nNL8EnOaM1KhCvvRI4s3b0VSoaDHaN1eh1YOla5c8P/OMkhj2q4xu0Mxoz9wiA85+dxo
         UC3DonK3J3b8tPCinB8k2wz3zcadfLTghAGIafAqD4xEi5Scbv41XWxrTW4Z4C0kxEXM
         Go/CbDtgGv2nNgJp/FtKJWoqdTT31Wkb+4nSL4tAOi5nk1LAoGeZqfmcOmxjzB8rm/i2
         3jYb+yGjD2egNwQo+mFKmbuRULk3hdFSd/F6DoF2URR2f7wHmRUkLtpZJpdHywtcQKws
         FfjA==
X-Gm-Message-State: AOJu0YyVR7AHjzYmM1tL+7no3mq7ZXXerbYc642tI32ze4uBlv//4maD
	p7Z3adGklnXDGidlAZbuec2/dSk/6oTYNg==
X-Google-Smtp-Source: AGHT+IHGuuaxHeHKFCbD2YWuIWGVksqr95oKW3dcFBsQG59NNoRKbGw5hN/xJVXGMF0pUzMO02VAkw==
X-Received: by 2002:a17:902:6b41:b0:1cc:32df:40e7 with SMTP id g1-20020a1709026b4100b001cc32df40e7mr1001772plt.66.1700784070926;
        Thu, 23 Nov 2023 16:01:10 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id p12-20020a170902e74c00b001cc3c521affsm1903239plf.300.2023.11.23.16.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 16:01:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700635162-8330-1-git-send-email-wangmy@fujitsu.com>
References: <1700635162-8330-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-networking] [PATCH] strongswan: upgrade 5.9.11 ->
 5.9.12
Message-Id: <170078407013.3118595.18303515335222227055.b4-ty@gmail.com>
Date: Thu, 23 Nov 2023 16:01:10 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Nov 2023 00:01:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107041


On Wed, 22 Nov 2023 14:39:22 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ==========
> - Fixed a vulnerability in charon-tkm related to processing DH public values
>   that can lead to a buffer overflow and potentially remote code execution.
> - The new `pki --ocsp` command produces OCSP responses based on certificate
>   status information provided by plugins.
> - The cert-enroll script handles the initial enrollment of an X.509 host
>   certificate with a PKI server via the EST or SCEP protocols.
> - The --priv argument for charon-cmd allows using any type of private key.
> - Support for nameConstraints of type iPAddress has been added (the openssl
>   plugin previously didn't support nameConstraints at all).
> - SANs of type uniformResourceIdentifier can now be encoded in certificates.
> - Password-less PKCS#12 and PKCS#8 files are supported.
> - A new global option allows preventing peers from authenticating with trusted
>   end-entity certificates (i.e. local certificates).
> - ECDSA public keys that encode curve parameters explicitly are now rejected by
>   all plugins that support ECDSA.
> - charon-nm now actually uses the XFRM interfaces added with 5.9.10, it can
>   also use the name in connection.interface-name.
> - The resolve plugin tries to maintain the order of installed DNS servers.
> - The kernel-libipsec plugin always installs routes even if no address is found
>   in the local traffic selectors.
> - Increased the default receive buffer size for Netlink sockets to 8 MiB and
>   simplified its configuration.
> - Copy the issuer's subjectKeyIdentifier as authorityKeyIdentifier instead of
>   always generating a hash of the subjectPublicKey.
> - Fixed issues while reestablishing multiple CHILD_SAs (e.g. after a DPD
>   timeout) that could cause a reqid to get assigned to multiple CHILD_SAs with
>   unrelated traffic selectors.
> - Fixed a possible infinite loop issue in watcher_t and removed WATCHER_EXCEPT,
>   instead callbacks are always invoked even if only errors are signaled.
> - Fixed a regression in the IKE_SA_INIT tracking code added with 5.9.6 when
>   handling invalid messages.
> - Fixed adding the XFRMA_REPLAY_ESN_VAL attribute twice when updating SAs.
> - Correctly encode SPI from REKEY_SA notify in CHILD_SA_NOT_FOUND notify if
>   CHILD_SA is not found during rekeying.
> - The testing environment is now based on Debian 12 (bookworm), by default.
> 
> [...]

Applied, thanks!

[1/1] strongswan: upgrade 5.9.11 -> 5.9.12
      commit: 077489fda8f27336942457da1eaa022804f327c2

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


