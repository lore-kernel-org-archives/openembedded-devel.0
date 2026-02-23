Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D02F6E98E00
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 08:08:13 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31321.1771834090914184761
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Feb 2026 00:08:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UHpnU4Dx;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43622089851so4064318f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 00:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771834089; x=1772438889; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aKXb6LWr+6Z6mm1YnnjmKTm+geer5NT9xOsEFgMhloQ=;
        b=UHpnU4DxrYOnW5tL/1qPT4QN8/nDhXhi7xEUQLc2VVW3rNSvdh5GGLL17fqSTjz+KV
         UCrhsJc/mo8otYJbYcdRfM8r2SbHe/ZoS15n6p1pQgM4GuAmzkhfrxz2VpmHJx+9Ziu9
         HniwV6xL/BRVaE0IjtB7P3GtGO9EvR7BEYRmlLP4t04jjnbXGBMDXPzO0+IP/K/soGPE
         hRND1ljGIp5lLrRvX9o3uCcOSQs6xE0obNzJKwahevl+YOPKwdOhyCjUEdnjvC8eidiB
         4QruDmNeON9XrFR2RkyXzIXyKXFglexaGX24RnTyMzvD1DBVLwGtLOkG3plKSv5uQ/Oa
         4HcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771834089; x=1772438889;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aKXb6LWr+6Z6mm1YnnjmKTm+geer5NT9xOsEFgMhloQ=;
        b=X8RCU2kcgPUxLOLTMVCPHaRrdw7eEbOctkpKctNyBq2PunbuiT8aonkxXPbMZzqBTu
         boAp9+hrSbquWLnSYLnVKpdZhVaZ2BBzHziti1zd/9SClq/kdyBLW+uj+PXPCNRDDjm5
         BuHROLlof7ig3+EAOtTDakEgxMwND2Nhwkf1dg7Opg8AEicAT4x/hH3KUMn7sV/vA9IT
         w8RjdHOGm/jyqjG88QvBpXVDmbokiNJ2SqnBkz6RSyQyV5zrn7rlJv3fE0s5A3dhwt+E
         qFSOlS7QkYQMKgS8OAyu+TmFzCYHPdc96z1oFFYgfHabGOjv3x48vOFF5G1V83uLGi9q
         lgFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzn8ubzvLjqy00KBQADB2WxI8WAEYKa8fZQQTwdLHrPeyMfSu5GADLQq56w0GquwzfpaUlAWWtDY4N7l7S13YPuTo=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzA+K0OM3LH91Kfg/yKsPOlqj6gBglszrcgr9wsNWKCYT9zQiVb
	H9lzTyRJ2otiKMdA7Ptv+gsT59R02u9YDKEt6wzjX+9UzbtYUOV8QqQ1
X-Gm-Gg: ATEYQzxDtfQcgNxLfw3d2JLaNYF4gC1K0h8CgRqTXyUwC58OA4c2R8bNx8PVBT7eMdH
	e+N02MXYuDNK2H9IuA934EhiQvfz4c1L5fc7oHHPsH3aruGrCJP9HpjsLDq65UEmw7/wqCayKF+
	dFLZdwyJL1OYjn+5ofCKDv2BJbyv4GbsIYAQfIr1v9Ho1GQiwY0gWmYRaUHDtChxfgRY9L9zElq
	mvBr53gYZLeD2i5/brOJmK3WiAlZhvMfgzIlg0eJj43RVKArumMSu2vee3dkkRmGrb9ZmOBQCWp
	U3JWWr36JJVtqHb7H1Oskh5vw9NhXR7WGiTe9b+M+0WNIvqbI0SWr+lYeJo7sBYjFMvz9F5Y84C
	BvNFdXz6+w5rUrgscshhAJAV8ePA5qEm/J5sUpPWAH63SkmjeXOyoSkvKOw1aryKWgcQM9pnFQq
	rKu5xb41CtpdIateeAARf4ByfV8uLMexM=
X-Received: by 2002:a05:6000:290d:b0:437:6906:822f with SMTP id ffacd0b85a97d-4396f1651b3mr14253307f8f.26.1771834088839;
        Mon, 23 Feb 2026 00:08:08 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d401aasm16960463f8f.23.2026.02.23.00.08.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 00:08:08 -0800 (PST)
Message-ID: <ae72e906-e37b-4c5c-a967-e8bf59768773@gmail.com>
Date: Mon, 23 Feb 2026 09:08:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-webserver][kirkstone][PATCH v2] nginx: patch
 CVE-2026-1642
To: peter.marko@siemens.com, openembedded-devel@lists.openembedded.org
References: <20260222225239.3882166-1-peter.marko@siemens.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260222225239.3882166-1-peter.marko@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 08:08:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124540

I wonder, does this patch apply only to 1.24, or does it apply to the
other two recipes also (and it could be just shoved into the .inc file)?

On 2/22/26 23:52, Peter Marko via lists.openembedded.org wrote:
> From: Peter Marko <peter.marko@siemens.com>
>
> Pick patch accorting to [1].
>
> [1] https://security-tracker.debian.org/tracker/CVE-2026-1642
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
> v2: added patch annotations
>
>  .../nginx/files/CVE-2026-1642.patch           | 46 +++++++++++++++++++
>  .../recipes-httpd/nginx/nginx_1.24.0.bb       |  1 +
>  2 files changed, 47 insertions(+)
>  create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-1642.patch
>
> diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2026-1642.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-1642.patch
> new file mode 100644
> index 0000000000..d6c636e54d
> --- /dev/null
> +++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-1642.patch
> @@ -0,0 +1,46 @@
> +From 784fa05025cb8cd0c770f99bc79d2794b9f85b6e Mon Sep 17 00:00:00 2001
> +From: Roman Arutyunyan <arut@nginx.com>
> +Date: Thu, 29 Jan 2026 13:27:32 +0400
> +Subject: [PATCH] Upstream: detect premature plain text response from SSL
> + backend.
> +
> +When connecting to a backend, the connection write event is triggered
> +first in most cases.  However if a response arrives quickly enough, both
> +read and write events can be triggered together within the same event loop
> +iteration.  In this case the read event handler is called first and the
> +write event handler is called after it.
> +
> +SSL initialization for backend connections happens only in the write event
> +handler since SSL handshake starts with sending Client Hello.  Previously,
> +if a backend sent a quick plain text response, it could be parsed by the
> +read event handler prior to starting SSL handshake on the connection.
> +The change adds protection against parsing such responses on SSL-enabled
> +connections.
> +
> +CVE: CVE-2026-1642
> +Upstream-Status: Backport [https://github.com/nginx/nginx/commit/784fa05025cb8cd0c770f99bc79d2794b9f85b6e]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + src/http/ngx_http_upstream.c | 9 +++++++++
> + 1 file changed, 9 insertions(+)
> +
> +diff --git a/src/http/ngx_http_upstream.c b/src/http/ngx_http_upstream.c
> +index df577ad67..cadc74479 100644
> +--- a/src/http/ngx_http_upstream.c
> ++++ b/src/http/ngx_http_upstream.c
> +@@ -2441,6 +2441,15 @@ ngx_http_upstream_process_header(ngx_http_request_t *r, ngx_http_upstream_t *u)
> +             return;
> +         }
> + 
> ++#if (NGX_HTTP_SSL)
> ++        if (u->ssl && c->ssl == NULL) {
> ++            ngx_log_error(NGX_LOG_ERR, c->log, 0,
> ++                          "upstream prematurely sent response");
> ++            ngx_http_upstream_next(r, u, NGX_HTTP_UPSTREAM_FT_ERROR);
> ++            return;
> ++        }
> ++#endif
> ++
> +         u->state->bytes_received += n;
> + 
> +         u->buffer.last += n;
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
> index e288b19da3..93a27ebd56 100644
> --- a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
> +++ b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
> @@ -3,6 +3,7 @@ require nginx.inc
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=175abb631c799f54573dc481454c8632"
>  
>  SRC_URI:append = " file://CVE-2025-23419.patch"
> +SRC_URI:append = " file://CVE-2026-1642.patch"
>  
>  SRC_URI[sha256sum] = "77a2541637b92a621e3ee76776c8b7b40cf6d707e69ba53a940283e30ff2f55d"
>  
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124537): https://lists.openembedded.org/g/openembedded-devel/message/124537
> Mute This Topic: https://lists.openembedded.org/mt/117948481/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


