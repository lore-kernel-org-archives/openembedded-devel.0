Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E952DCAC5B0
	for <webhook@archiver.kernel.org>; Sat,  4 Oct 2025 19:09:08 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.15551.1759604948131099099
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Oct 2025 12:09:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CPSC/3bd;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-afcb78ead12so618013066b.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Oct 2025 12:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759604946; x=1760209746; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1pwLWnQnQ8JpPspkV/KcUlLvtVsWJa6bab8XWC7/ZE0=;
        b=CPSC/3bdNprR6ow2UYrf1fnvZMRQtCrWXtq45dR5xQh2lP7XCFZXJQXIyJMmaOA9om
         QiyRuCZdMU8cWGksefNAKF0fvD/ttDqIdxFkWF5FehwH1T3CJbhWwPS7URMX0W5j033r
         CpgeRXrUOMWFrxy4040UKzbkT2KraWEBh58rmY15ILIAz+aRxkiKcJd8+y/fL/1HpgJ+
         tvGANlJbUMEOVFuw8mSDCA39tyK+aYb3/S8Q4A/DalvB+/jU9t6Vxh/ikZtyZmieDKoI
         Ve8pXPx8GTZ+wooVvVoifHnI9oOVZNvpsGNdlr5qYDZ+deNuvXQ1h/qAgkmTceEUmxzO
         DC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759604946; x=1760209746;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1pwLWnQnQ8JpPspkV/KcUlLvtVsWJa6bab8XWC7/ZE0=;
        b=K3jvCeMPIJMLb4cRO+9wLjEBHYMUfN82HdXhAve0nC74C0c3C7mmM6C2RK6zBGbM5h
         KXq/7KKhh1H5kFUEgyNC/Re47T4HYaMrTc34JQdJMMcDE5NJicekNzj0UlAbWyf8riBi
         KVjpEl2WuyjUUJKS8vQaMN5B+dSa8zapHtvrxm62Jkew8t7q1mStiItem5xuEtKKRJeG
         Fs3r//nOOO8/uMsBfErTfsX9rEDADXmD14riSk76ZgT989Oj9MvtCgB+eo2xRUVmLzrz
         VQwuiefT5I+YrWxJcGaVjhx7C0NUcZW3lDrtKadmzuUyELhmjo5/nva1SNTqGDazxK9M
         pr6A==
X-Gm-Message-State: AOJu0YxSxGtQGFyrS30oChF5n+XeyfUhtWD43rmWJjDset86NDE1XqsY
	6XtOUBbiIerM0ffWiWMvC1v45/IKjebMRZwePSUDyaUj5sBxMVaZe1FlFh17GA==
X-Gm-Gg: ASbGnctIROOqC4fMr2RXoTPRuUQ8jK3HrLCluVsWPpPH8nujc2F1EZVWLAiGra24oNp
	z9dzFdv8lr7/tlSrSuAkJApQsXS6DazqqHxcsEvR73sDTWKSeGiMMSaD8weTXeyiB/EUfv3Fwl0
	QIzsLSkOFt8J/e4mv166JmShyh8eyE+5XYz2NsaXQYvwyo6jB2B9m/dO8Y32H763LYuaUJb/E7E
	xqjYYk7CLRqWA4qXT9Lou1cVk0pSC9/ZBz4bjCCWzruibbM6naIbrELGk0qERmMK6DoPreh5Sv2
	pM6jIR3YcCn35aBBhZfy/l+ueyYg1UD75w1ZX2H+8ySBGi44CQp472nPPC6TaPgXR5eGBcctdT4
	eoQEikXUujKxqjNHgL2lObZLFrgeuHWVrPl2iAg/jwXToBlDdUFE5auTJ5g2BMHDhOA==
X-Google-Smtp-Source: AGHT+IG2dGvSN62SKH6Ryj+muEZ+vkRVXDKx5wXynKywH8bOeS5x4U1jGJESHK/fIXLtvVTOSV+dMQ==
X-Received: by 2002:a17:907:8686:b0:b42:f7df:a2f4 with SMTP id a640c23a62f3a-b49c4394856mr799783066b.52.1759604946325;
        Sat, 04 Oct 2025 12:09:06 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b30asm763258566b.59.2025.10.04.12.09.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Oct 2025 12:09:05 -0700 (PDT)
Message-ID: <47d54d9c-b07c-4742-883b-d7d7471965f5@gmail.com>
Date: Sat, 4 Oct 2025 21:09:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH] civetweb: patch CVE-2025-55763
To: openembedded-devel@lists.openembedded.org
References: <186B5EFF559BC318.9538@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <186B5EFF559BC318.9538@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Oct 2025 19:09:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120237

Please ignore this. Just noticed that the project stopped making
releases - will send a patch to update it to the latest revision.

On 10/4/25 21:02, Gyorgy Sarvari via lists.openembedded.org wrote:
> https://nvd.nist.gov/vuln/detail/CVE-2025-55763
>
> Though the original PR has 2 commits, the second one is just
> about minor code-cosmetics.
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  .../civetweb/civetweb/CVE-2025-55763.patch    | 59 +++++++++++++++++++
>  .../civetweb/civetweb_1.16.bb                 |  1 +
>  2 files changed, 60 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/civetweb/civetweb/CVE-2025-55763.patch
>
> diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb/CVE-2025-55763.patch b/meta-networking/recipes-connectivity/civetweb/civetweb/CVE-2025-55763.patch
> new file mode 100644
> index 0000000000..9840a66029
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/civetweb/civetweb/CVE-2025-55763.patch
> @@ -0,0 +1,59 @@
> +From 76e222bcb77ba8452e5da4e82ae6cecd499c25e0 Mon Sep 17 00:00:00 2001
> +From: krispybyte <krispybyte@proton.me>
> +Date: Sat, 21 Jun 2025 23:33:50 +0300
> +Subject: Fix heap overflow in directory URI slash redirection
> +
> +CVE: CVE-2025-55763
> +
> +Upstream-Status: Backport [https://github.com/civetweb/civetweb/commit/c584455624d9a9f6ec72839f61dd3cdb9d8435ba]
> +
> +Signed-off-by: Gyorgy Sarvari <skandigraun@mail.com>
> +
> +---
> + src/civetweb.c | 23 ++++++++++++++++++-----
> + 1 file changed, 18 insertions(+), 5 deletions(-)
> +
> +diff --git a/src/civetweb.c b/src/civetweb.c
> +index bbc9aa8be..e969c939f 100644
> +--- a/src/civetweb.c
> ++++ b/src/civetweb.c
> +@@ -15579,7 +15579,6 @@ handle_request(struct mg_connection *conn)
> + 	/* 12. Directory uris should end with a slash */
> + 	if (file.stat.is_directory && ((uri_len = (int)strlen(ri->local_uri)) > 0)
> + 	    && (ri->local_uri[uri_len - 1] != '/')) {
> +-
> + 		/* Path + server root */
> + 		size_t buflen = UTF8_PATH_MAX * 2 + 2;
> + 		char *new_path;
> +@@ -15592,12 +15591,26 @@ handle_request(struct mg_connection *conn)
> + 			mg_send_http_error(conn, 500, "out or memory");
> + 		} else {
> + 			mg_get_request_link(conn, new_path, buflen - 1);
> +-			strcat(new_path, "/");
> ++
> ++			size_t len = strlen(new_path);
> ++			if (len + 1 < buflen) {
> ++				new_path[len] = '/';
> ++				new_path[len + 1] = '\0';
> ++				len += 1;
> ++			}
> ++
> + 			if (ri->query_string) {
> +-				/* Append ? and query string */
> +-				strcat(new_path, "?");
> +-				strcat(new_path, ri->query_string);
> ++				if (len + 1 < buflen) {
> ++					new_path[len] = '?';
> ++					new_path[len + 1] = '\0';
> ++					len += 1;
> ++				}
> ++
> ++				/* Append with size of space left for query string + null terminator */
> ++				size_t max_append = buflen - len - 1;
> ++				strncat(new_path, ri->query_string, max_append);
> + 			}
> ++
> + 			mg_send_http_redirect(conn, new_path, 301);
> + 			mg_free(new_path);
> + 		}
> +
> diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
> index bbf284474c..97d90dab13 100644
> --- a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
> +++ b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
> @@ -8,6 +8,7 @@ SRCREV = "5864b55a94f4b5238155cbf2baec707f0fa2ba6d"
>  PV .= "+git"
>  SRC_URI = "git://github.com/civetweb/civetweb.git;branch=master;protocol=https \
>             file://0001-Unittest-Link-librt-and-libm-using-l-option.patch \
> +           file://CVE-2025-55763.patch \
>             "
>  
>  
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120236): https://lists.openembedded.org/g/openembedded-devel/message/120236
> Mute This Topic: https://lists.openembedded.org/mt/115591277/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


