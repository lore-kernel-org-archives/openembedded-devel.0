Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2D35FD2D68
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 12:18:17 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38538.1773145094879659088
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Mar 2026 05:18:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J7S/LW8h;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439d8df7620so2853821f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 05:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773145093; x=1773749893; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b4plU8vCauYKTS/gGCb1C1KKooghxnTrKYvkTsmnAuc=;
        b=J7S/LW8hHLlGt+UF7KJF+JeE2dlU9A6pj7RTyF5Cv7NBOKqkSdKZn/STiTGjzqtp0s
         1UolNwuBZMMaA+IAul5SOpISBXnpLx9J+NiLp1KJfHpE7OwJvnhQgkR7NAHU9d6Qr+LF
         qzcUmxoQ2atU46J8VVaApshkPSZH11ePN00eQkJGeDq/F8/eYC615ffO7FXGhFu3OPZH
         XetmYST21bNU4mZDo+07NUkYedGf0IJeZxjbh3svWM5xX7OY75fXuFvrUOG32G2s+L04
         jvMPUpXltUhbT/QuCm3e4wOo4Zslmtj1AzamX5hN5aJ4kunESjUC9AukL2aGs/iGHti2
         94sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773145093; x=1773749893;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b4plU8vCauYKTS/gGCb1C1KKooghxnTrKYvkTsmnAuc=;
        b=eT79ezEb8YNfrLzuA+1l5Z70PvJdVEC+b1pyBOD/ZktmrlpM0v0vJdEpOYB0jzinrs
         sdh6mG83CeAcIYrxSjWstMhCgITRUmjQ4hA3yHwla1rmopvIc7cqnpNoDkj9m0+ZsCQX
         vyN6UGu+IW9mvor+hVHRN05CsbQ+wBeUkeSTBnnZYC1YiVhvh3i8dd6yvbXlzRCrMTze
         2L/LElBc5EY9AM9Iw2Q15Xa+5HtE7RcJYWYBv+a9nH0x9vCGRbXz5W3Jakds355R9tWb
         2M2M45szYvVEbxpaHyGBLFYfjUmkqHon34vvskgrcKRbUmC1zomsoDk6z9B2lkgFPYRj
         KxxA==
X-Forwarded-Encrypted: i=1; AJvYcCVQgeX/eywY6d46N3J1k6GmRvEyB2O61OSxgitOLXj1b3E3379A2MNQ8JlPbw30/kBqkI4jsTDlBI6AtA3FGSp8QK4=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyjtQXxszXiaIvA4gWXXAIXKtcjtXagEanpIDk03vCMxfTnNP+4
	6gGu6jCyWQDs1tFuiCyLPZz3Ggf5Ndy3L0INIMDBAfV3ihnwz+Cl0axr
X-Gm-Gg: ATEYQzwmlin688NOw+8oxH61bBQsZFCrsLEoZHK/uB41ke9vuaEC++UdADCWRDYXZ/y
	ZfOSScCKnfFO2QVZrjKsIxRT6IpCNCPDBnQueQoAaHA2JstP2yCAP/w6E/pEz2BoBmD2M9sSPLq
	59LCWNnwU8dJnRaofXOgm/wZRxpFP7eJlOu0S1jXs8JmEOmcFaCxxbjIbWDTVooeoBgrqlBSM8x
	+TL0FgUQ7y468/yWKhaui6HrXdTQGffiHK6p2mZ7mezsApUnFmqSa0NTL79wsILMqJDZPr6LUF3
	PRdKQESat8D3/hCvvlbrAtqBxDsCxQhv/di6/a1/757paVaklDkQbFi+POB5DX1aFJpsQfuDZCT
	m/9pX81OGFduElZwNshsJje3+3KZkZID6h8agTUeyU7MWYrzZX6CEdqazaTl185FgmYsrL7RWnI
	hmFxoUs0CoDzlxM0PmMJBjWqxCjinnr6heIgKEcaMKpQ==
X-Received: by 2002:a5d:62d2:0:b0:439:f605:b001 with SMTP id ffacd0b85a97d-439f605b389mr133693f8f.51.1773145092857;
        Tue, 10 Mar 2026 05:18:12 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae45786sm40103553f8f.32.2026.03.10.05.18.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 05:18:12 -0700 (PDT)
Message-ID: <f6cdce97-d5cb-4d6d-889f-584aa8c51877@gmail.com>
Date: Tue, 10 Mar 2026 13:18:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-openembedded][master][PATCH] libssh 0.11.3: Fix
 CVE-2026-3731
To: deeratho@cisco.com, openembedded-devel@lists.openembedded.org
References: <20260310121417.194408-1-deeratho@cisco.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260310121417.194408-1-deeratho@cisco.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 12:18:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125028

Why not upgrade it to 0.11.4 in master, instead of patching it?

On 3/10/26 13:14, Deepak Rathore via lists.openembedded.org wrote:
> From: Deepak Rathore <deeratho@cisco.com>
>
> Upstream Repository: https://git.libssh.org/projects/libssh.git
>
> Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2026-3731
> Type: Security Fix
> CVE: CVE-2026-3731
> Score: 9.8
> Patch: https://git.libssh.org/projects/libssh.git/commit/?id=855a0853ad3a
>
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
>
> diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-3731.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2026-3731.patch
> new file mode 100644
> index 0000000000..88e6ff1c48
> --- /dev/null
> +++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-3731.patch
> @@ -0,0 +1,43 @@
> +From e46f096ad5294428509077c887233554d62ead0e Mon Sep 17 00:00:00 2001
> +From: Jakub Jelen <jjelen@redhat.com>
> +Date: Thu, 11 Dec 2025 13:22:44 +0100
> +Subject: [PATCH] sftp: Fix out-of-bound read from sftp extensions
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +CVE: CVE-2026-3731
> +Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=855a0853ad3a]
> +
> +Signed-off-by: Jakub Jelen <jjelen@redhat.com>
> +Reviewed-by: Pavol Žáčik <pzacik@redhat.com>
> +(cherry picked from commit 855a0853ad3abd4a6cd85ce06fce6d8d4c7a0b60)
> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +---
> + src/sftp.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/sftp.c b/src/sftp.c
> +index 37b4133b..cbcdb066 100644
> +--- a/src/sftp.c
> ++++ b/src/sftp.c
> +@@ -583,7 +583,7 @@ const char *sftp_extensions_get_name(sftp_session sftp, unsigned int idx) {
> +     return NULL;
> +   }
> +
> +-  if (idx > sftp->ext->count) {
> ++  if (idx >= sftp->ext->count) {
> +     ssh_set_error_invalid(sftp->session);
> +     return NULL;
> +   }
> +@@ -599,7 +599,7 @@ const char *sftp_extensions_get_data(sftp_session sftp, unsigned int idx) {
> +     return NULL;
> +   }
> +
> +-  if (idx > sftp->ext->count) {
> ++  if (idx >= sftp->ext->count) {
> +     ssh_set_error_invalid(sftp->session);
> +     return NULL;
> +   }
> +--
> +2.51.0
> diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb b/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
> index 5928581312..9f66736b29 100644
> --- a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
> +++ b/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
> @@ -9,6 +9,7 @@ DEPENDS = "zlib openssl"
>  SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable-0.11;tag=${BPN}-${PV} \
>             file://0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch \
>             file://run-ptest \
> +           file://CVE-2026-3731.patch \
>            "
>  
>  SRC_URI:append:toolchain-clang = " file://0001-CompilerChecks.cmake-drop-Wunused-variable-flag.patch"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125024): https://lists.openembedded.org/g/openembedded-devel/message/125024
> Mute This Topic: https://lists.openembedded.org/mt/118239463/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


