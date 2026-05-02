Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2F71CD3424
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 08:17:39 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2841.1777709849511556022
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 May 2026 01:17:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nL4IxbBW;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso20210845e9.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 02 May 2026 01:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777709848; x=1778314648; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zq4oXDr1hspUxGkAm53mlWRzTEM/8CZV8gUWVKv1Svw=;
        b=nL4IxbBWuBnznR6+Mk0HkZhLAXNYJLPxdM9ImwGt6bmhStkK89BE9OxLoerGmNkyin
         3vh8ba7zlivEl6s2Q8alniokXmMxVJtYiSdfFODvWjN8e34rZV1bYMmwpiOBMQvF1Xrl
         bk2YeqdMC0yEg01i2TABftA1sr8DFt00soOiTHkiCsiV2+BF+jlCQ54Roamzdnn761AM
         QO/t/WwGz/3qwEYjqhYyrnmW5BXqXrB5b/HXpX26PYPywobjjlsoSypHxeNFF1a5iJUq
         UjFW+uRmFqWwn0Xz99UOQlnFMJBiL+FoUU8q0xCJjJMCXO/aFEorMlI/7rAgZWplHWo7
         f6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777709848; x=1778314648;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zq4oXDr1hspUxGkAm53mlWRzTEM/8CZV8gUWVKv1Svw=;
        b=ljxyAjDiFC6Udfpn1xJlfTrxGgEIhBMWEUFuZc+v0xpt2+7mtLfnq8pQbrSfdyRocS
         5fnJFe3xmy45nCVLmhbbXivpC2JiUvDlFbZrm5CSfbTDSWJwncYClLUBGSi3qdXRd0OK
         ySVpsINuRByiYc8BOD/DRnV0P6VePvdkK0s3Ff65amsWNhHFDqcSrr5PvO1WohGe0wCC
         dT0O8+CoV/1asyPuS4FiCh9FnY6lUM0OOizLkKQ3y74/fgwCQhbM7UqJ0YJ0UpPH/nAO
         DDJo+weV9P7BEhkZtZe50Q9K+L3KQ16WtLmd5tSkbPe9ttO3xbLn/K6SiuAbJr1r1X8h
         Oocg==
X-Forwarded-Encrypted: i=1; AFNElJ9ze6hM1qQHqLeu/gI8/h+qxnwuYg9CScUd0zG+kBx+BzSqsKAHVrLo/5pXMQDU73dqf2QM5mCmclKVhJS+ZhRmRwQ=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz/4Lm2Ra9wVFb+tPrghRSVwRXhbCAee/PyyjlrA4KgHQiTtK9q
	vfebU2w2656D1uR0aGz5rRyFI6IdSMRymCCYfjnb3r3R8WN32fKCzsWI
X-Gm-Gg: AeBDiev1/mOr8ybdocyycn51MpRFfHfPgl31KgntAewbh2RUL9Z9x9j0fzEfZf1nTZv
	X3tMLeGI6hnpwXG5YU2XeRWS5UdNcxNqueBjk6nJ053sKeVLgM5S5MtP0lVoH23rXfofd3Qkg1T
	3gxm+meA+HDzbCGamq+v8w8uBfN5WECI+E3y5TEi9gZxaBIAvZPsqQUFalYGooaCFXgJmCWK4Fm
	mahWAT6WLZSv2a2CIYbs9vPmEWhMQwg720TNhVxEkVUwyd9dkzFKXdkOGKHDEPCX7+QnTiTic6n
	08L2dxpkP6w1vlMxpRKbHlqoAJYau9BlV5wjEaNtHUveC54Oe5Fyk1ZuGkUlJNR7HM0PIrRAcIn
	OfVNH+wfoMqQJx49TalhcofGtlY5Z1wvjwKJxTk4cSvFHW21x2S0MW61AuqjOv7v/qCT/jp4DFN
	yDXsVFHsZXddMKiWkOSK5SoHOZtdVPZSgz5YSegqJreA==
X-Received: by 2002:a05:600c:8590:b0:489:1c1f:35f9 with SMTP id 5b1f17b1804b1-48a98636a93mr24826605e9.9.1777709847620;
        Sat, 02 May 2026 01:17:27 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb69698sm197633715e9.1.2026.05.02.01.17.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 May 2026 01:17:27 -0700 (PDT)
Message-ID: <c7d17e42-e8bd-4152-a0c2-91b38cb52399@gmail.com>
Date: Sat, 2 May 2026 10:17:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-webserver][PATCH 1/1] nginx: upgrade 1.29.7 -> 1.30.0
To: ankur.tyagi85@gmail.com, openembedded-devel@lists.openembedded.org
References: <20260502075925.1861299-1-ankur.tyagi85@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260502075925.1861299-1-ankur.tyagi85@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 02 May 2026 08:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126763

On 5/2/26 09:59, Ankur Tyagi via lists.openembedded.org wrote:
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> 
> 1.30.0 stable version has been released, incorporating new features and bug
> fixes from the 1.29.x mainline branch (https://nginx.org/en/CHANGES-1.30)
> 
> Set v1.30.0 branch as default preference.
> 
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb |  5 +++++
>  meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb | 10 ----------
>  meta-webserver/recipes-httpd/nginx/nginx_1.30.0.bb |  6 ++++++



I think rather the 1.28 recipe should be deleted with this patch. Odd
versions are mainline/bleeding edge releases, and even versions are
stable ones. AFAIK 1.28 isn't supported anymore with the release of
1.30. (I'd expect that there will be a 1.31 release in a week or two, as
a continuation of the 1.29 series)



>  3 files changed, 11 insertions(+), 10 deletions(-)
>  delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
>  create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.30.0.bb
> 
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
> index 9872a6de3b..f2b10a5c69 100644
> --- a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
> +++ b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
> @@ -5,3 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3dc49537b08b14c8b66ad247bb4c4593"
>  SRC_URI[sha256sum] = "2c96a946bfb0882a21744ed429770a2123ae1828c7c48665092993ddee91a918"
>  
>  CVE_STATUS[CVE-2025-53859] = "cpe-stable-backport: Fix is included in 1.28.1"
> +
> +# Set DEFAULT_PREFERENCE so that the 1.30.x stable version is built by
> +# default. To build the 1.28.x branch,
> +# PREFERRED_VERSION_nginx = "1.28.%" can be added to local.conf
> +DEFAULT_PREFERENCE = "-1"
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
> deleted file mode 100644
> index 4d884fcbb3..0000000000
> --- a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -require nginx.inc
> -
> -# 1.28.x branch is the current stable branch, the recommended default
> -# 1.29.x is the current mainline branches containing all new features
> -DEFAULT_PREFERENCE = "-1"
> -
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=79da1c70d587d3a199af9255ad393f99"
> -
> -SRC_URI[sha256sum] = "673f8fb8c0961c44fbd9410d6161831453609b44063d3f2948253fc2b5692139"
> -
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.30.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.30.0.bb
> new file mode 100644
> index 0000000000..139fe24dcd
> --- /dev/null
> +++ b/meta-webserver/recipes-httpd/nginx/nginx_1.30.0.bb
> @@ -0,0 +1,6 @@
> +require nginx.inc
> +
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=79da1c70d587d3a199af9255ad393f99"
> +
> +SRC_URI[sha256sum] = "058188c64bf22baecaa72b809a6318a4f9ba623889c554feab03f7cb853ab31b"
> +
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126762): https://lists.openembedded.org/g/openembedded-devel/message/126762
> Mute This Topic: https://lists.openembedded.org/mt/119112437/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


