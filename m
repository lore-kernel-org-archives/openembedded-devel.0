Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C834CCEACEF
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 08:53:01 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5420.1763369573843197272
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 00:52:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H/P7h9UH;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4775ae77516so45158415e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 00:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763369572; x=1763974372; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZfLfo9HCpUCweYEguwLiLz98FdPwujVkjV8X+zoJTV0=;
        b=H/P7h9UHYF6LtMcwmaIYKqhYI4fTGEbuIUDlAevRVdciqvEKtWg9WqAr9mPb3MV2/l
         3L1COVvWkx2L2PjjwoQx5D4fvFFAkm4i6vUyILtA+OG7bAOjRoUU6V2n0wgobIdwCYPk
         Zz5aPoUMMk3LN9BXIKHWswUnrQnIJ/FeL1sZ9yy5/A8kHHNHNhPkQWG3VsJiGN/195qu
         JsmmBRr5+n22aav7kibzzBFXNxLqH2PQn0iOG/isorJTXUI14CoNd2uSXUsP0OF+jee8
         VD6XeTbL1MvoLBYQNEF1hhNM9E5Jd63xGOWT/PMsctEw6VuuGcAo0HFBqRDnHAIVJ2SK
         oADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763369572; x=1763974372;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZfLfo9HCpUCweYEguwLiLz98FdPwujVkjV8X+zoJTV0=;
        b=GgHGkaOQ1a0Gov91JNSc/dxrkQP3ahANwlt4NWs50x+hm3rk82vfD+A+2f2WLgQa7w
         IpEJBNUGVdCGalQqZawl6RMa6ivHm7BHrIlRAP9Ls2DwTO+tsuZ4OIRwNDhu08s0HAFo
         DAUAPh8bClyw6AsSVz4SxBoP9LIj3upQtUJdVnzpzWfiqcAniIL9kMbhdVNK2xaIE9fP
         Owq/n2RegT5rSay4CD6+4647jgDhOxYdUWY9lpX233nW58pLjaoGKsHrCAhU7dYPVD6p
         +HPYZrBsFDYcp4dkEWhuAEpI6Q4b47RjDK4mCBv0r9ivb0r9M2MyB9GtAxYmkscczlVB
         pNeg==
X-Gm-Message-State: AOJu0YwZKY+tQ9ucPoyBxIy+w9/n51CspgQt+NgL/9UOIr/kV7waWVvy
	DglHeWG4KdU95uQ/i7LKqa4ebbF/dBuLwsPqWiXO7enFzTjIRKbOQ0EfFmKHE9lU
X-Gm-Gg: ASbGncuOMcwhN+hx1W/NaHyl53Dx0Uoq7IHyodZwf0af5t6/gFqkKe3I9bf68WacMrc
	ZU2yv062qnV8RATXku4ySKoJxthWXEorWi6rJMseZ0auAWxH5D8mmC93/ZmP3Aaehrjd/6oJ0aY
	wmQevGeJG4y6imBwd4TOY8AK2Zaak0ZqZ8Hpn3aBzWmofUuBGvm+6RMDXWHQR8z2I/5W7zlQwwc
	xEbySybLCTTseUEsQQKr+9R5DI01AYEa67qPLmdD3vVlaqmBRpRWpECeHfwx3WQBxKGguVQTq0x
	mbHXBPJr07+SPPljjDSfCnAyYAkVB0tmjKOSf8Hz+eGJl1bpREYNFo0Y6ih2r8JW+OU8OH6hRwT
	3e4XMOID9a8t7IrDOV5EI1CZTSTJLcgUWKxEMytHtf9RiPOdkurhzDPU1ChWApAhuy118bRpmp/
	7M1nCYVxYj7kqpbYvtwCk=
X-Google-Smtp-Source: AGHT+IFDZ2V6rK9QSf3fV+46kOAmaWGGPt2Ibuk/Wm26Fc1t+pH8hv4A9rdak7kZ/0AG9EiusnG7sQ==
X-Received: by 2002:a05:600c:4f53:b0:477:8985:4038 with SMTP id 5b1f17b1804b1-4778fe5e5a9mr90127545e9.13.1763369572040;
        Mon, 17 Nov 2025 00:52:52 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778bd0f761sm109493395e9.4.2025.11.17.00.52.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 00:52:51 -0800 (PST)
Message-ID: <5748b43a-d6a6-482c-850c-5ccb03ecd05f@gmail.com>
Date: Mon, 17 Nov 2025 09:52:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][scarthgap][PATCH 4/4] rsyslog: set status for
 CVE-2015-3243
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20251115130000.1121405-1-skandigraun@gmail.com>
 <20251115130000.1121405-4-skandigraun@gmail.com>
 <CA+s=J=xgkjKkQ+rC83CALXWCXoWhcj1a7RXbRm68=UTfJm1-wQ@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CA+s=J=xgkjKkQ+rC83CALXWCXoWhcj1a7RXbRm68=UTfJm1-wQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 08:53:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121766

On 11/17/25 06:50, Anuj Mittal wrote:
>
>
>
> On Sat, Nov 15, 2025 at 9:00 PM Gyorgy Sarvari via
> lists.openembedded.org <http://lists.openembedded.org>
> <skandigraun=gmail.com@lists.openembedded.org> wrote:
>
>     Details: https://nvd.nist.gov/vuln/detail/CVE-2015-3243
>
>     The issue is about file permissions: by default rsyslog creates
>     world-readable
>     files. In case a log message contains some sensitive information,
>     then that's
>     exposed to every user on the system.
>
>     However the rsyslog.conf file that is shipped with the recipe
>     solves it: it
>     already sets non-world-readable default permissions on all files,
>     so this
>     vulnerability is fixed in the default OE recipe.
>
>     See also this package in OpenSuse[1], where it is solved the same way.
>
>     [1]: https://build.opensuse.org/requests/619439/changes
>     (rsyslog.conf.in <http://rsyslog.conf.in>)
>
>     Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>     ---
>      meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf | 3 ++-
>      meta-oe/recipes-extended/rsyslog/rsyslog_8.2402.0.bb
>     <http://rsyslog_8.2402.0.bb>  | 2 ++
>      2 files changed, 4 insertions(+), 1 deletion(-)
>
>     diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf
>     b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf
>     index dbfefb7597..6316efb629 100644
>     --- a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf
>     +++ b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf
>     @@ -13,7 +13,8 @@ $ModLoad imklog   # kernel logging (formerly
>     provided by rklogd)
>
>      #
>      # Set the default permissions
>     -#
>     +# Setting the $FileCreateMode not world readable fixes CVE-2015-3243
>     +#
>      $FileOwner root
>      $FileGroup adm
>      $FileCreateMode 0640
>     diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2402.0.bb
>     <http://rsyslog_8.2402.0.bb>
>     b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2402.0.bb
>     <http://rsyslog_8.2402.0.bb>
>     index af46cc14d7..59944cd70c 100644
>     --- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2402.0.bb
>     <http://rsyslog_8.2402.0.bb>
>     +++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2402.0.bb
>     <http://rsyslog_8.2402.0.bb>
>     @@ -37,6 +37,8 @@ SRC_URI[sha256sum] =
>     "acbdd8579489df36b4a383dc6909a61b7623807f0aff54c062115f2de7
>      UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/releases"
>      UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
>
>     +CVE_STATUS[CVE-2015-3243] = "fix-file-included: The shipped
>     default rsyslog.conf contains the fix"
>     +
>
>
>  fix-file-included isn't available in scarthgap so we will have to use
> something else.

Right, it seems there isn't any that would really fit... will pick a
"Patched" status in a few moments.

