Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C81FAECAAD8
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 06:55:47 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web11.3257.1663311341287551574
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Sep 2022 23:55:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cooFmGXS;
 spf=pass (domain: gmail.com, ip: 209.85.167.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id r125so5094954oia.8
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Sep 2022 23:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=VZxFFVBI5+pgUeQ0881MSRMUgfiirHm7gzrMwXc8fL4=;
        b=cooFmGXSbVTnZJ69UkjriejJfdBP+GTmOa3Gz8P1BGFyxb0Z2ryFBweSX8914mu2Zp
         VSIDD5PZLlvbJG06+2FYI5en/BvzztaxYVaJXKW05GxzJyDW5cdBCAI9VMuzZRANBhf+
         vrhLS840qg4B64b5YK1K1iGbUI8gYjdl7KnGIO2ukAVYUQFagQKaXJDGdB9kuKJBebfe
         aid3GvFpU1l5d+GUL249d2U0wtBsoHPqt25sUvwWpTyw5YVGCcXb2qSGgKWe4OwZyE42
         EQfII0U02gF3zQ1bEl8Tukfe30kKCffJ1+JA/e1VJgxkPoxDjUbLGagN/hLQ1aCkvSoT
         tncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=VZxFFVBI5+pgUeQ0881MSRMUgfiirHm7gzrMwXc8fL4=;
        b=KIIU5QGaUJhJPT0sKfy0fBrjlZrV9Pxe4mF8kjQzArG7ysKJy+OPMfrlug2S9bF0Mv
         BmUG9kNcAsXHPJNJURjOF7hXQ+1Ub3g18xiRElUNAhYnMZ9ILLAibTQYMOEsEmV4U+CS
         iDXHHHYei9iGvp9sCBC65Pl7j/zFr826C9829VvpaRRzRW7tuxEXgqZCwYaO6zjh1PHe
         R6EiD8FgoETEaZQxDcPVwz+wyE6Ms8DhGUBacNgpTUYwfDvgUywbB1xDgvAoshB+TUre
         unOhuPTuNjJ6dh1GUsLDTrGp8+OWy3G3ZI+6rlI6NW7aC7ZJ8+4ICcLpBhJbYJF/08P0
         abCg==
X-Gm-Message-State: ACgBeo1lsJPV6tZ1xzaDxU+jTzNN/wA6Wupf00He1ZXKMH0f2Teg0ILf
	uBvuqf9U7cl+PBjNdvyO2NVXQbyYWLtq+EmrSIo=
X-Google-Smtp-Source: 
 AA6agR4tzqQcOtJGxlzsFtno+9oS0fUk8AmDVAWk5EBtW4Na/0F8fXwqTwjuZSDQ3/0vR0f3Bw1M4VCoMWuoWikE+S8=
X-Received: by 2002:a05:6808:1988:b0:34f:de19:411c with SMTP id
 bj8-20020a056808198800b0034fde19411cmr5832270oib.262.1663311340408; Thu, 15
 Sep 2022 23:55:40 -0700 (PDT)
MIME-Version: 1.0
References: <1663310379-31652-1-git-send-email-leimaohui@fujitsu.com>
In-Reply-To: <1663310379-31652-1-git-send-email-leimaohui@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 15 Sep 2022 23:55:14 -0700
Message-ID: 
 <CAMKF1srbKWWa893zyBVON+ig9LT+vPC7gmwcWrHnQdsqB2D90Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] mariadb: Fix buildpaths warning.
To: leimaohui <leimaohui@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Sep 2022 06:55:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98830

On Thu, Sep 15, 2022 at 11:39 PM leimaohui <leimaohui@fujitsu.com> wrote:
>
> WARNING: mariadb-10.8.3-r0 do_package_qa: QA Issue: File /usr/src/debug/mariadb/10.8.3-r0/sql/yy_oracle.hh in package mariadb-src contains reference to TMPDIR
> File /usr/src/debug/mariadb/10.8.3-r0/sql/yy_mariadb.cc in package mariadb-src contains reference to TMPDIR
> File /usr/src/debug/mariadb/10.8.3-r0/sql/yy_mariadb.hh in package mariadb-src contains reference to TMPDIR
> File /usr/src/debug/mariadb/10.8.3-r0/sql/yy_oracle.cc in package mariadb-src contains reference to TMPDIR [buildpaths]
>
> Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> ---
>  meta-oe/recipes-dbs/mysql/mariadb.inc | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
> index c63d511..7bd4ac0 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> @@ -224,6 +224,17 @@ RDEPENDS:${PN}-setupdb = "coreutils"
>  # Allow old code to link to the backward compatible library
>  RDEPENDS:libmysqlclient-dev = "libmysqlclient-r-dev"
>
> +PACKAGE_PREPROCESS_FUNCS += "src_package_preprocess"
> +src_package_preprocess () {
> +        # Trim build paths from comments in generated sources to ensure reproducibility

how are these sources generated ?
some generation tools like lex/yacc we can control the paths by
running those tools in specific source directories and provided
relative
paths to sources as inputs during generation.

> +        sed -i -e "s,${S}/sql/,,g" \
> +               -e "s,${B}/sql/,,g" \
> +            ${B}/sql/yy_oracle.hh \
> +            ${B}/sql/yy_mariadb.cc \
> +            ${B}/sql/yy_mariadb.hh \
> +            ${B}/sql/yy_oracle.cc
> +}
> +
>  FILES:libmysqlclient = "\
>      ${libdir}/libmysqlclient.so.* \
>      ${libdir}/libmariadb.so.* \
> --
> 1.8.3.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98829): https://lists.openembedded.org/g/openembedded-devel/message/98829
> Mute This Topic: https://lists.openembedded.org/mt/93717522/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

