Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web08.38029.1614011772464136284
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Feb 2021 08:36:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q74oGBHl;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id t62so13153240qke.7
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Feb 2021 08:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eDpG4XqlG/r+IZZ9z1vdJ2BbnYkXfMKVgin7+vuqHEE=;
        b=Q74oGBHljRZxnyIFiAL3QPue2hAGHWKTC1g4QvkHaiTAzwjqJTkQBr35/JB73vjS8X
         22UY+cm54mQn7fR+LqsJCQf5SPdU5qzeiFlEuJTwYC0dXoyP0AkeKZwj1t3jJJ2hKkhi
         aPy+14FZhB7V8rRbxDtmZi5A0g8O4DqPwZuIa6mwYGTwuNmVkflHwhXkz9YnSKlKEPS0
         yYIme6EHI/In3b0LwMBBiColHbmGXLA2+q339abREPsb9LfYI3BExzFQBNr9V6NB7lRF
         KozBVv+0OBf0pvcpqoJd2pr4hQPb0aiUGBenxJuips1E5kUhJ8+WHH/eqU0179yseQVN
         8Y0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eDpG4XqlG/r+IZZ9z1vdJ2BbnYkXfMKVgin7+vuqHEE=;
        b=OS9WPzCA/2gOHp4ZIRhaQjfl6445hvyFMfpa4t2T94bM2d+j2owiBq3HLlrAK/5ccP
         dielk2VO8Wk/mDlxpFOGc6t3vd2srOVntxxZDv8QKY49wvXcLe1quLnzT/08fjQ+Qr3y
         W57GWzGwi5C2KMHYixP/+BYIbnxQF+5p2BXevmC040+dAsUqaKIhEZvPaAkjkZZV983e
         UrwDDp7UFSYUWQbRGpDOzDlgduY6G9ZqEgfGhqxbsdHv2aCEFk5V+cUHtlX+EY0IzO8p
         9flbNZY6YeRs11UOHEipH5sg7egtsZuc/8T3f+DWDUOBvzMVLKreVm3ejpGkSvCX9Un1
         zTsw==
X-Gm-Message-State: AOAM531R4M7VsTF67lb5jsXWd1I66oNl1aOp6cjjaZXKs3LVkzHVEsKc
	69X+bE+qN0XmvdPvzOKlDl1zNb+0R2SIO0PM9Kg=
X-Google-Smtp-Source: ABdhPJxYzfGmZr3BTwzEHL0CGKgfAamVbXryWxQyeCFINXk4qFIy1Tx494kK5jO/QxpUKDUr6PgQ/wGb/TJxxqOmroo=
X-Received: by 2002:a37:e13:: with SMTP id 19mr21669368qko.119.1614011771467;
 Mon, 22 Feb 2021 08:36:11 -0800 (PST)
MIME-Version: 1.0
References: <1613979905-44185-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1613979905-44185-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 22 Feb 2021 08:35:45 -0800
Message-ID: <CAMKF1sozuJefqk5nfeJXEJXzv1cF8zy07HKYSku_Ht7+tRZPBA@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] postgresql: upgrade 13.1 -> 13.2
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

I am seeing

postgresql-13.2: Patch log indicates that patches do not apply
cleanly. [patch-fuzz]

On Sun, Feb 21, 2021 at 11:45 PM zhengruoqin
<zhengrq.fnst@cn.fujitsu.com> wrote:
>
> -License-Update: Copyright year updated to 2021.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../postgresql/{postgresql_13.1.bb => postgresql_13.2.bb}     | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-dbs/postgresql/{postgresql_13.1.bb => postgresql_13.2.bb} (59%)
>
> diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_13.1.bb b/meta-oe/recipes-dbs/postgresql/postgresql_13.2.bb
> similarity index 59%
> rename from meta-oe/recipes-dbs/postgresql/postgresql_13.1.bb
> rename to meta-oe/recipes-dbs/postgresql/postgresql_13.2.bb
> index f2a29a59d9..ca8a6c7cee 100644
> --- a/meta-oe/recipes-dbs/postgresql/postgresql_13.1.bb
> +++ b/meta-oe/recipes-dbs/postgresql/postgresql_13.2.bb
> @@ -1,6 +1,6 @@
>  require postgresql.inc
>
> -LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=fc4ce21960f0c561460d750bc270d11f"
> +LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=255f15687738db8068fbe9b938c90217"
>
>  SRC_URI += "\
>     file://not-check-libperl.patch \
> @@ -9,4 +9,4 @@ SRC_URI += "\
>     file://0001-configure.in-bypass-autoconf-2.69-version-check.patch \
>  "
>
> -SRC_URI[sha256sum] = "12345c83b89aa29808568977f5200d6da00f88a035517f925293355432ffe61f"
> +SRC_URI[sha256sum] = "5fd7fcd08db86f5b2aed28fcfaf9ae0aca8e9428561ac547764c2a2b0f41adfc"
> --
> 2.25.1
>
>
>
>
> 
>
