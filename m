Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBA7BC83F17
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 02:18:20 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.5363.1752545893533903490
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Jul 2025 19:18:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Loapxbv/;
 spf=pass (domain: mvista.com, ip: 209.85.218.54, mailfrom: vanusuri@mvista.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ae6fa02d8feso587823466b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 19:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1752545891; x=1753150691; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FZYAgZO9mMQ+s3eQtdQMgUUB/t2II7RrJZFLJdEngQk=;
        b=Loapxbv/J3KYNaQnaQ7v6+uz/8kbsqzLJkRGAPHFIQ8OStsDEHO8DyaCe85iQj7hV7
         vVQ3a0/EL9ShXqJYX86hj69hZ7laXI06Z/T5ySLIqBIsXL1gETBYzVWcqQQ77FsOBruc
         DndSrgIw7yXCGCMd04FMp9Tq01oBF6JLtvkPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752545891; x=1753150691;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FZYAgZO9mMQ+s3eQtdQMgUUB/t2II7RrJZFLJdEngQk=;
        b=hLD7ry/Ioa0MhB4vHyQUbWvjtTmPleLt971EoM0BiX3vF3iVgG8J9xF2KHQnbN1YiT
         GZlIKh1+EPgkzVFKPKRyd/Py/H+T+ic/5DCHCB+FPSufGfkvpKxSHzP5TAAoCtkH/P5Z
         68virt1sD+9OhMXVeaq4c2T+16Pk+aqFtZzJrp/osHTWkglvdEdQCtD7N/mxIOIvWbA2
         WL26nUIcC6/qnRtuMPVtU0Sh53QAduKXzAKWMJnq0x9/cKE4INFc1eylFqLYYx6GsaKL
         gqPbAdCjL3D+Wngx5MWFUxsFGbB10OwmttRX3dOqNE4H3/6vVgJcGUzFiFXbLuCrenX3
         AZ3w==
X-Gm-Message-State: AOJu0Yz+qgEcILTeZwuwwY7TXJ2L3cSnGdMnGjC8qSqE2hVpk6+dSrn+
	8XX5gGchoCuOQuWz5eWbqnUlzgNdwcgV225/P7TUTKgv7nw8xh0ch/ZnUwrQoiE0O0WKDutkZXF
	R8tOObOyeqw6QrCkN2+JRoPeT9WHCMYsmTTARLhzxuV8MNJuAErroTlk=
X-Gm-Gg: ASbGncudH1XvoQal3+Zz0fcqAZj4XWBfi1JBG8bD73jrH5I93exDZntIOtDCJpZoIwo
	Lthf7gYmexAE0ZSFkObkhmMZFbHnAEQKGMgMsn/jHIy6zJ4szDDC7y44TzKVjQffvsw6QfOA6Fw
	IY4iHoYrKW+1XOmA1LRP6NZdRsaoN5QTsLciRwFRCQyKu6NsiUU5Ezojku8NIJ/crW7DME4RpQh
	ULncA==
X-Google-Smtp-Source: AGHT+IH7o+b0vqrtUAVBiA/NeE5wtjiR3uUwXoCwa766NZtIylbWfILY2KS9huj3vfdGbALKnO3tVKyIaczRVWLdh6c=
X-Received: by 2002:a17:907:6093:b0:ae3:4f57:2110 with SMTP id
 a640c23a62f3a-ae6fcc78a72mr1578665466b.54.1752545891287; Mon, 14 Jul 2025
 19:18:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250606062020.6004-1-vanusuri@mvista.com>
In-Reply-To: <20250606062020.6004-1-vanusuri@mvista.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Tue, 15 Jul 2025 07:47:59 +0530
X-Gm-Features: Ac12FXwMHVAOdN7nsYgc4vK60Dk3Tmv1822gfox_lphWfDBWIqpNVVf359fH1fc
Message-ID: <CANQUz18XUWDzc5bY2LW4Qa7ptrazrKV64MZTohDJJOs18Q4MgA@mail.gmail.com>
Subject: Re: [oe][meta-networking][scarthgap][PATCH] proftpd: Fix CVE-2023-51713
To: openembedded-devel@lists.openembedded.org, 
	Armin Kuster <akuster808@gmail.com>, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000004d98b50639ee63a3"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Jul 2025 02:18:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118548

--0000000000004d98b50639ee63a3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Team,

Any update regarding the patch for CVE-2023-51713 ?


Thanks,
Vijay


On Fri, Jun 6, 2025 at 11:50=E2=80=AFAM <vanusuri@mvista.com> wrote:

> From: Vijay Anusuri <vanusuri@mvista.com>
>
> Upstream-Status: Backport from
> https://github.com/proftpd/proftpd/commit/97bbe68363ccf2de0c07f67170ec64a=
8b4d62592
>
> Link:
> https://git.openembedded.org/meta-openembedded/commit/?h=3Dkirkstone&id=
=3D730e44900a0a86265bad93a16b5a5ff344a07266
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../proftpd/files/CVE-2023-51713.patch        | 278 ++++++++++++++++++
>  .../recipes-daemons/proftpd/proftpd_1.3.7c.bb |   1 +
>  2 files changed, 279 insertions(+)
>  create mode 100644
> meta-networking/recipes-daemons/proftpd/files/CVE-2023-51713.patch
>
> diff --git
> a/meta-networking/recipes-daemons/proftpd/files/CVE-2023-51713.patch
> b/meta-networking/recipes-daemons/proftpd/files/CVE-2023-51713.patch
> new file mode 100644
> index 0000000000..377d8a74ec
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/proftpd/files/CVE-2023-51713.patch
> @@ -0,0 +1,278 @@
> +From 97bbe68363ccf2de0c07f67170ec64a8b4d62592 Mon Sep 17 00:00:00 2001
> +From: TJ Saunders <tj@castaglia.org>
> +Date: Sun, 6 Aug 2023 13:16:26 -0700
> +Subject: [PATCH] Issue #1683: Avoid an edge case when handling
> unexpectedly
> + formatted input text from client, caused by quote/backslash semantics, =
by
> + skipping those semantics.
> +
> +Upstream-Status: Backport [
> https://github.com/proftpd/proftpd/commit/97bbe68363ccf2de0c07f67170ec64a=
8b4d62592
> ]
> +CVE: CVE-2023-51713
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + include/str.h   |  3 ++-
> + src/main.c      | 34 +++++++++++++++++++++++++++++----
> + src/str.c       | 22 +++++++++++++---------
> + tests/api/str.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++++-
> + 4 files changed, 94 insertions(+), 15 deletions(-)
> +
> +diff --git a/include/str.h b/include/str.h
> +index f08398017..1261ae2c2 100644
> +--- a/include/str.h
> ++++ b/include/str.h
> +@@ -1,6 +1,6 @@
> + /*
> +  * ProFTPD - FTP server daemon
> +- * Copyright (c) 2008-2020 The ProFTPD Project team
> ++ * Copyright (c) 2008-2023 The ProFTPD Project team
> +  *
> +  * This program is free software; you can redistribute it and/or modify
> +  * it under the terms of the GNU General Public License as published by
> +@@ -131,6 +131,7 @@ const char *pr_gid2str(pool *, gid_t);
> + #define PR_STR_FL_PRESERVE_COMMENTS           0x0001
> + #define PR_STR_FL_PRESERVE_WHITESPACE         0x0002
> + #define PR_STR_FL_IGNORE_CASE                 0x0004
> ++#define PR_STR_FL_IGNORE_QUOTES                       0x0008
> +
> + char *pr_str_get_token(char **, char *);
> + char *pr_str_get_token2(char **, char *, size_t *);
> +diff --git a/src/main.c b/src/main.c
> +index ee9c1eecb..e6b70731d 100644
> +--- a/src/main.c
> ++++ b/src/main.c
> +@@ -811,8 +811,24 @@ static cmd_rec *make_ftp_cmd(pool *p, char *buf,
> size_t buflen, int flags) {
> +     return NULL;
> +   }
> +
> ++  /* By default, pr_str_get_word will handle quotes and backslashes for
> ++   * escaping characters.  This can produce words which are shorter, us=
e
> ++   * fewer bytes than the corresponding input buffer.
> ++   *
> ++   * In this particular situation, we use the length of this initial wo=
rd
> ++   * for determining the length of the remaining buffer bytes, assumed =
to
> ++   * contain the FTP command arguments.  If this initial word is thus
> ++   * unexpectedly "shorter", due to nonconformant FTP text, it can lead
> ++   * the subsequent buffer scan, looking for CRNUL sequencees, to acces=
s
> ++   * unexpected memory addresses (Issue #1683).
> ++   *
> ++   * Thus for this particular situation, we tell the function to
> ignore/skip
> ++   * such quote/backslash semantics, and treat them as any other
> character
> ++   * using the IGNORE_QUOTES flag.
> ++   */
> ++
> +   ptr =3D buf;
> +-  wrd =3D pr_str_get_word(&ptr, str_flags);
> ++  wrd =3D pr_str_get_word(&ptr, str_flags|PR_STR_FL_IGNORE_QUOTES);
> +   if (wrd =3D=3D NULL) {
> +     /* Nothing there...bail out. */
> +     pr_trace_msg("ctrl", 5, "command '%s' is empty, ignoring", buf);
> +@@ -820,6 +836,11 @@ static cmd_rec *make_ftp_cmd(pool *p, char *buf,
> size_t buflen, int flags) {
> +     return NULL;
> +   }
> +
> ++  /* Note that this first word is the FTP command.  This is why we make
> ++   * use of the ptr buffer, which advances through the input buffer as
> ++   * we read words from the buffer.
> ++   */
> ++
> +   subpool =3D make_sub_pool(p);
> +   pr_pool_tag(subpool, "make_ftp_cmd pool");
> +   cmd =3D pcalloc(subpool, sizeof(cmd_rec));
> +@@ -846,6 +867,7 @@ static cmd_rec *make_ftp_cmd(pool *p, char *buf,
> size_t buflen, int flags) {
> +   arg_len =3D buflen - strlen(wrd);
> +   arg =3D pcalloc(cmd->pool, arg_len + 1);
> +
> ++  /* Remember that ptr here is advanced past the first word. */
> +   for (i =3D 0, j =3D 0; i < arg_len; i++) {
> +     pr_signals_handle();
> +     if (i > 1 &&
> +@@ -854,14 +876,13 @@ static cmd_rec *make_ftp_cmd(pool *p, char *buf,
> size_t buflen, int flags) {
> +
> +       /* Strip out the NUL by simply not copying it into the new buffer=
.
> */
> +       have_crnul =3D TRUE;
> ++
> +     } else {
> +       arg[j++] =3D ptr[i];
> +     }
> +   }
> +
> +-  cmd->arg =3D arg;
> +-
> +-  if (have_crnul) {
> ++  if (have_crnul =3D=3D TRUE) {
> +     char *dup_arg;
> +
> +     /* Now make a copy of the stripped argument; this is what we need t=
o
> +@@ -871,6 +892,11 @@ static cmd_rec *make_ftp_cmd(pool *p, char *buf,
> size_t buflen, int flags) {
> +     ptr =3D dup_arg;
> +   }
> +
> ++  cmd->arg =3D arg;
> ++
> ++  /* Now we can read the remamining words, as command arguments, from t=
he
> ++   * input buffer.
> ++   */
> +   while ((wrd =3D pr_str_get_word(&ptr, str_flags)) !=3D NULL) {
> +     pr_signals_handle();
> +     *((char **) push_array(tarr)) =3D pstrdup(cmd->pool, wrd);
> +diff --git a/src/str.c b/src/str.c
> +index bcca4ae4d..a2ff74daf 100644
> +--- a/src/str.c
> ++++ b/src/str.c
> +@@ -1,6 +1,6 @@
> + /*
> +  * ProFTPD - FTP server daemon
> +- * Copyright (c) 2008-2017 The ProFTPD Project team
> ++ * Copyright (c) 2008-2023 The ProFTPD Project team
> +  *
> +  * This program is free software; you can redistribute it and/or modify
> +  * it under the terms of the GNU General Public License as published by
> +@@ -1209,7 +1209,7 @@ int pr_str_get_nbytes(const char *str, const char
> *units, off_t *nbytes) {
> +
> + char *pr_str_get_word(char **cp, int flags) {
> +   char *res, *dst;
> +-  char quote_mode =3D 0;
> ++  int quote_mode =3D FALSE;
> +
> +   if (cp =3D=3D NULL ||
> +      !*cp ||
> +@@ -1238,24 +1238,28 @@ char *pr_str_get_word(char **cp, int flags) {
> +     }
> +   }
> +
> +-  if (**cp =3D=3D '\"') {
> +-    quote_mode++;
> +-    (*cp)++;
> ++  if (!(flags & PR_STR_FL_IGNORE_QUOTES)) {
> ++    if (**cp =3D=3D '\"') {
> ++      quote_mode =3D TRUE;
> ++      (*cp)++;
> ++    }
> +   }
> +
> +   while (**cp && (quote_mode ? (**cp !=3D '\"') : !PR_ISSPACE(**cp))) {
> +     pr_signals_handle();
> +
> +-    if (**cp =3D=3D '\\' && quote_mode) {
> +-
> ++    if (**cp =3D=3D '\\' &&
> ++        quote_mode =3D=3D TRUE) {
> +       /* Escaped char */
> +       if (*((*cp)+1)) {
> +-        *dst =3D *(++(*cp));
> ++        *dst++ =3D *(++(*cp));
> ++        (*cp)++;
> ++        continue;
> +       }
> +     }
> +
> +     *dst++ =3D **cp;
> +-    ++(*cp);
> ++    (*cp)++;
> +   }
> +
> +   if (**cp) {
> +diff --git a/tests/api/str.c b/tests/api/str.c
> +index 050f5c563..bc64f0fb0 100644
> +--- a/tests/api/str.c
> ++++ b/tests/api/str.c
> +@@ -1,6 +1,6 @@
> + /*
> +  * ProFTPD - FTP server testsuite
> +- * Copyright (c) 2008-2017 The ProFTPD Project team
> ++ * Copyright (c) 2008-2023 The ProFTPD Project team
> +  *
> +  * This program is free software; you can redistribute it and/or modify
> +  * it under the terms of the GNU General Public License as published by
> +@@ -695,19 +695,23 @@ END_TEST
> + START_TEST (get_word_test) {
> +   char *ok, *res, *str;
> +
> ++  mark_point();
> +   res =3D pr_str_get_word(NULL, 0);
> +   fail_unless(res =3D=3D NULL, "Failed to handle null arguments");
> +   fail_unless(errno =3D=3D EINVAL, "Failed to set errno to EINVAL");
> +
> ++  mark_point();
> +   str =3D NULL;
> +   res =3D pr_str_get_word(&str, 0);
> +   fail_unless(res =3D=3D NULL, "Failed to handle null str argument");
> +   fail_unless(errno =3D=3D EINVAL, "Failed to set errno to EINVAL");
> +
> ++  mark_point();
> +   str =3D pstrdup(p, "  ");
> +   res =3D pr_str_get_word(&str, 0);
> +   fail_unless(res =3D=3D NULL, "Failed to handle whitespace argument");
> +
> ++  mark_point();
> +   str =3D pstrdup(p, " foo");
> +   res =3D pr_str_get_word(&str, PR_STR_FL_PRESERVE_WHITESPACE);
> +   fail_unless(res !=3D NULL, "Failed to handle whitespace argument: %s"=
,
> +@@ -723,6 +727,7 @@ START_TEST (get_word_test) {
> +   ok =3D "foo";
> +   fail_unless(strcmp(res, ok) =3D=3D 0, "Expected '%s', got '%s'", ok, =
res);
> +
> ++  mark_point();
> +   str =3D pstrdup(p, "  # foo");
> +   res =3D pr_str_get_word(&str, 0);
> +   fail_unless(res =3D=3D NULL, "Failed to handle commented argument");
> +@@ -742,6 +747,8 @@ START_TEST (get_word_test) {
> +   fail_unless(strcmp(res, ok) =3D=3D 0, "Expected '%s', got '%s'", ok, =
res);
> +
> +   /* Test multiple embedded quotes. */
> ++
> ++  mark_point();
> +   str =3D pstrdup(p, "foo \"bar baz\" qux \"quz norf\"");
> +   res =3D pr_str_get_word(&str, 0);
> +   fail_unless(res !=3D NULL, "Failed to handle quoted argument: %s",
> +@@ -770,6 +777,47 @@ START_TEST (get_word_test) {
> +
> +   ok =3D "quz norf";
> +   fail_unless(strcmp(res, ok) =3D=3D 0, "Expected '%s', got '%s'", ok, =
res);
> ++
> ++
> ++  /* Test embedded quotes with backslashes (Issue #1683). */
> ++  mark_point();
> ++
> ++  str =3D pstrdup(p, "\"\\\\SYST\"");
> ++  res =3D pr_str_get_word(&str, 0);
> ++  fail_unless(res !=3D NULL, "Failed to handle quoted argument: %s",
> ++    strerror(errno));
> ++
> ++  ok =3D "\\SYST";
> ++  fail_unless(strcmp(res, ok) =3D=3D 0, "Expected '%s', got '%s'", ok, =
res);
> ++
> ++  mark_point();
> ++  str =3D pstrdup(p, "\"\"\\\\SYST");
> ++  res =3D pr_str_get_word(&str, 0);
> ++  fail_unless(res !=3D NULL, "Failed to handle quoted argument: %s",
> ++    strerror(errno));
> ++
> ++  /* Note that pr_str_get_word() is intended to be called multiple time=
s
> ++   * on an advancing buffer, effectively tokenizing the buffer.  This i=
s
> ++   * why the function does NOT decrement its quote mode.
> ++   */
> ++  ok =3D "";
> ++  fail_unless(strcmp(res, ok) =3D=3D 0, "Expected '%s', got '%s'", ok, =
res);
> ++
> ++  /* Now do the same tests with the IGNORE_QUOTES flag */
> ++  mark_point();
> ++
> ++  str =3D ok =3D pstrdup(p, "\"\\\\SYST\"");
> ++  res =3D pr_str_get_word(&str, PR_STR_FL_IGNORE_QUOTES);
> ++  fail_unless(res !=3D NULL, "Failed to handle quoted argument: %s",
> ++    strerror(errno));
> ++  fail_unless(strcmp(res, ok) =3D=3D 0, "Expected '%s', got '%s'", ok, =
res);
> ++
> ++  mark_point();
> ++  str =3D ok =3D pstrdup(p, "\"\"\\\\SYST");
> ++  res =3D pr_str_get_word(&str, PR_STR_FL_IGNORE_QUOTES);
> ++  fail_unless(res !=3D NULL, "Failed to handle quoted argument: %s",
> ++    strerror(errno));
> ++  fail_unless(strcmp(res, ok) =3D=3D 0, "Expected '%s', got '%s'", ok, =
res);
> + }
> + END_TEST
> +
> +--
> +2.25.1
> +
> diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
> b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
> index b45cb6aaec..ec38fb54e1 100644
> --- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
> +++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.7c.bb
> @@ -15,6 +15,7 @@ SRC_URI =3D "git://
> github.com/proftpd/proftpd.git;branch=3D${BRANCH};protocol=3Dhttps
> <http://github.com/proftpd/proftpd.git;branch=3D$%7BBRANCH%7D;protocol=3D=
https>
>             file://contrib.patch  \
>             file://build_fixup.patch \
>             file://proftpd.service \
> +           file://CVE-2023-51713.patch \
>             file://CVE-2024-57392.patch \
>             "
>
> --
> 2.25.1
>
>

--0000000000004d98b50639ee63a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Team,<div><br></div><div>Any update regarding the patch=
 for CVE-2023-51713 ?</div><div><br></div><div><br></div><div>Thanks,</div>=
<div>Vijay</div><div><br></div></div><br><div class=3D"gmail_quote gmail_qu=
ote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 6, 2025 at=
 11:50=E2=80=AFAM &lt;<a href=3D"mailto:vanusuri@mvista.com">vanusuri@mvist=
a.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" target=
=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
<br>
Upstream-Status: Backport from <a href=3D"https://github.com/proftpd/proftp=
d/commit/97bbe68363ccf2de0c07f67170ec64a8b4d62592" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/proftpd/proftpd/commit/97bbe68363ccf2de0c07=
f67170ec64a8b4d62592</a><br>
<br>
Link: <a href=3D"https://git.openembedded.org/meta-openembedded/commit/?h=
=3Dkirkstone&amp;id=3D730e44900a0a86265bad93a16b5a5ff344a07266" rel=3D"nore=
ferrer" target=3D"_blank">https://git.openembedded.org/meta-openembedded/co=
mmit/?h=3Dkirkstone&amp;id=3D730e44900a0a86265bad93a16b5a5ff344a07266</a><b=
r>
<br>
Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
---<br>
=C2=A0.../proftpd/files/CVE-2023-51713.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2=
78 ++++++++++++++++++<br>
=C2=A0.../recipes-daemons/proftpd/<a href=3D"http://proftpd_1.3.7c.bb" rel=
=3D"noreferrer" target=3D"_blank">proftpd_1.3.7c.bb</a> |=C2=A0 =C2=A01 +<b=
r>
=C2=A02 files changed, 279 insertions(+)<br>
=C2=A0create mode 100644 meta-networking/recipes-daemons/proftpd/files/CVE-=
2023-51713.patch<br>
<br>
diff --git a/meta-networking/recipes-daemons/proftpd/files/CVE-2023-51713.p=
atch b/meta-networking/recipes-daemons/proftpd/files/CVE-2023-51713.patch<b=
r>
new file mode 100644<br>
index 0000000000..377d8a74ec<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-daemons/proftpd/files/CVE-2023-51713.patch<br=
>
@@ -0,0 +1,278 @@<br>
+From 97bbe68363ccf2de0c07f67170ec64a8b4d62592 Mon Sep 17 00:00:00 2001<br>
+From: TJ Saunders &lt;<a href=3D"mailto:tj@castaglia.org" target=3D"_blank=
">tj@castaglia.org</a>&gt;<br>
+Date: Sun, 6 Aug 2023 13:16:26 -0700<br>
+Subject: [PATCH] Issue #1683: Avoid an edge case when handling unexpectedl=
y<br>
+ formatted input text from client, caused by quote/backslash semantics, by=
<br>
+ skipping those semantics.<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/proftpd/proftpd/c=
ommit/97bbe68363ccf2de0c07f67170ec64a8b4d62592" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/proftpd/proftpd/commit/97bbe68363ccf2de0c07f=
67170ec64a8b4d62592</a>]<br>
+CVE: CVE-2023-51713<br>
+Signed-off-by: Hitendra Prajapati &lt;<a href=3D"mailto:hprajapati@mvista.=
com" target=3D"_blank">hprajapati@mvista.com</a>&gt;<br>
+Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
+---<br>
+ include/str.h=C2=A0 =C2=A0|=C2=A0 3 ++-<br>
+ src/main.c=C2=A0 =C2=A0 =C2=A0 | 34 +++++++++++++++++++++++++++++----<br>
+ src/str.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 22 +++++++++++++---------<br>
+ tests/api/str.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++++-<br=
>
+ 4 files changed, 94 insertions(+), 15 deletions(-)<br>
+<br>
+diff --git a/include/str.h b/include/str.h<br>
+index f08398017..1261ae2c2 100644<br>
+--- a/include/str.h<br>
++++ b/include/str.h<br>
+@@ -1,6 +1,6 @@<br>
+ /*<br>
+=C2=A0 * ProFTPD - FTP server daemon<br>
+- * Copyright (c) 2008-2020 The ProFTPD Project team<br>
++ * Copyright (c) 2008-2023 The ProFTPD Project team<br>
+=C2=A0 *<br>
+=C2=A0 * This program is free software; you can redistribute it and/or mod=
ify<br>
+=C2=A0 * it under the terms of the GNU General Public License as published=
 by<br>
+@@ -131,6 +131,7 @@ const char *pr_gid2str(pool *, gid_t);<br>
+ #define PR_STR_FL_PRESERVE_COMMENTS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00x0001<br>
+ #define PR_STR_FL_PRESERVE_WHITESPACE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x=
0002<br>
+ #define PR_STR_FL_IGNORE_CASE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00x0004<br>
++#define PR_STR_FL_IGNORE_QUOTES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0008<br>
+ <br>
+ char *pr_str_get_token(char **, char *);<br>
+ char *pr_str_get_token2(char **, char *, size_t *);<br>
+diff --git a/src/main.c b/src/main.c<br>
+index ee9c1eecb..e6b70731d 100644<br>
+--- a/src/main.c<br>
++++ b/src/main.c<br>
+@@ -811,8 +811,24 @@ static cmd_rec *make_ftp_cmd(pool *p, char *buf, size=
_t buflen, int flags) {<br>
+=C2=A0 =C2=A0 =C2=A0return NULL;<br>
+=C2=A0 =C2=A0}<br>
+ <br>
++=C2=A0 /* By default, pr_str_get_word will handle quotes and backslashes =
for<br>
++=C2=A0 =C2=A0* escaping characters.=C2=A0 This can produce words which ar=
e shorter, use<br>
++=C2=A0 =C2=A0* fewer bytes than the corresponding input buffer.<br>
++=C2=A0 =C2=A0*<br>
++=C2=A0 =C2=A0* In this particular situation, we use the length of this in=
itial word<br>
++=C2=A0 =C2=A0* for determining the length of the remaining buffer bytes, =
assumed to<br>
++=C2=A0 =C2=A0* contain the FTP command arguments.=C2=A0 If this initial w=
ord is thus<br>
++=C2=A0 =C2=A0* unexpectedly &quot;shorter&quot;, due to nonconformant FTP=
 text, it can lead<br>
++=C2=A0 =C2=A0* the subsequent buffer scan, looking for CRNUL sequencees, =
to access<br>
++=C2=A0 =C2=A0* unexpected memory addresses (Issue #1683).<br>
++=C2=A0 =C2=A0*<br>
++=C2=A0 =C2=A0* Thus for this particular situation, we tell the function t=
o ignore/skip<br>
++=C2=A0 =C2=A0* such quote/backslash semantics, and treat them as any othe=
r character<br>
++=C2=A0 =C2=A0* using the IGNORE_QUOTES flag.<br>
++=C2=A0 =C2=A0*/<br>
++<br>
+=C2=A0 =C2=A0ptr =3D buf;<br>
+-=C2=A0 wrd =3D pr_str_get_word(&amp;ptr, str_flags);<br>
++=C2=A0 wrd =3D pr_str_get_word(&amp;ptr, str_flags|PR_STR_FL_IGNORE_QUOTE=
S);<br>
+=C2=A0 =C2=A0if (wrd =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0/* Nothing there...bail out. */<br>
+=C2=A0 =C2=A0 =C2=A0pr_trace_msg(&quot;ctrl&quot;, 5, &quot;command &#39;%=
s&#39; is empty, ignoring&quot;, buf);<br>
+@@ -820,6 +836,11 @@ static cmd_rec *make_ftp_cmd(pool *p, char *buf, size=
_t buflen, int flags) {<br>
+=C2=A0 =C2=A0 =C2=A0return NULL;<br>
+=C2=A0 =C2=A0}<br>
+ <br>
++=C2=A0 /* Note that this first word is the FTP command.=C2=A0 This is why=
 we make<br>
++=C2=A0 =C2=A0* use of the ptr buffer, which advances through the input bu=
ffer as<br>
++=C2=A0 =C2=A0* we read words from the buffer.<br>
++=C2=A0 =C2=A0*/<br>
++<br>
+=C2=A0 =C2=A0subpool =3D make_sub_pool(p);<br>
+=C2=A0 =C2=A0pr_pool_tag(subpool, &quot;make_ftp_cmd pool&quot;);<br>
+=C2=A0 =C2=A0cmd =3D pcalloc(subpool, sizeof(cmd_rec));<br>
+@@ -846,6 +867,7 @@ static cmd_rec *make_ftp_cmd(pool *p, char *buf, size_=
t buflen, int flags) {<br>
+=C2=A0 =C2=A0arg_len =3D buflen - strlen(wrd);<br>
+=C2=A0 =C2=A0arg =3D pcalloc(cmd-&gt;pool, arg_len + 1);<br>
+ <br>
++=C2=A0 /* Remember that ptr here is advanced past the first word. */<br>
+=C2=A0 =C2=A0for (i =3D 0, j =3D 0; i &lt; arg_len; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0pr_signals_handle();<br>
+=C2=A0 =C2=A0 =C2=A0if (i &gt; 1 &amp;&amp;<br>
+@@ -854,14 +876,13 @@ static cmd_rec *make_ftp_cmd(pool *p, char *buf, siz=
e_t buflen, int flags) {<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Strip out the NUL by simply not copying it i=
nto the new buffer. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0have_crnul =3D TRUE;<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0arg[j++] =3D ptr[i];<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 cmd-&gt;arg =3D arg;<br>
+-<br>
+-=C2=A0 if (have_crnul) {<br>
++=C2=A0 if (have_crnul =3D=3D TRUE) {<br>
+=C2=A0 =C2=A0 =C2=A0char *dup_arg;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0/* Now make a copy of the stripped argument; this is w=
hat we need to<br>
+@@ -871,6 +892,11 @@ static cmd_rec *make_ftp_cmd(pool *p, char *buf, size=
_t buflen, int flags) {<br>
+=C2=A0 =C2=A0 =C2=A0ptr =3D dup_arg;<br>
+=C2=A0 =C2=A0}<br>
+ <br>
++=C2=A0 cmd-&gt;arg =3D arg;<br>
++<br>
++=C2=A0 /* Now we can read the remamining words, as command arguments, fro=
m the<br>
++=C2=A0 =C2=A0* input buffer.<br>
++=C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0while ((wrd =3D pr_str_get_word(&amp;ptr, str_flags)) !=3D NU=
LL) {<br>
+=C2=A0 =C2=A0 =C2=A0pr_signals_handle();<br>
+=C2=A0 =C2=A0 =C2=A0*((char **) push_array(tarr)) =3D pstrdup(cmd-&gt;pool=
, wrd);<br>
+diff --git a/src/str.c b/src/str.c<br>
+index bcca4ae4d..a2ff74daf 100644<br>
+--- a/src/str.c<br>
++++ b/src/str.c<br>
+@@ -1,6 +1,6 @@<br>
+ /*<br>
+=C2=A0 * ProFTPD - FTP server daemon<br>
+- * Copyright (c) 2008-2017 The ProFTPD Project team<br>
++ * Copyright (c) 2008-2023 The ProFTPD Project team<br>
+=C2=A0 *<br>
+=C2=A0 * This program is free software; you can redistribute it and/or mod=
ify<br>
+=C2=A0 * it under the terms of the GNU General Public License as published=
 by<br>
+@@ -1209,7 +1209,7 @@ int pr_str_get_nbytes(const char *str, const char *u=
nits, off_t *nbytes) {<br>
+ <br>
+ char *pr_str_get_word(char **cp, int flags) {<br>
+=C2=A0 =C2=A0char *res, *dst;<br>
+-=C2=A0 char quote_mode =3D 0;<br>
++=C2=A0 int quote_mode =3D FALSE;<br>
+ <br>
+=C2=A0 =C2=A0if (cp =3D=3D NULL ||<br>
+=C2=A0 =C2=A0 =C2=A0 !*cp ||<br>
+@@ -1238,24 +1238,28 @@ char *pr_str_get_word(char **cp, int flags) {<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 if (**cp =3D=3D &#39;\&quot;&#39;) {<br>
+-=C2=A0 =C2=A0 quote_mode++;<br>
+-=C2=A0 =C2=A0 (*cp)++;<br>
++=C2=A0 if (!(flags &amp; PR_STR_FL_IGNORE_QUOTES)) {<br>
++=C2=A0 =C2=A0 if (**cp =3D=3D &#39;\&quot;&#39;) {<br>
++=C2=A0 =C2=A0 =C2=A0 quote_mode =3D TRUE;<br>
++=C2=A0 =C2=A0 =C2=A0 (*cp)++;<br>
++=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0while (**cp &amp;&amp; (quote_mode ? (**cp !=3D &#39;\&quot;&=
#39;) : !PR_ISSPACE(**cp))) {<br>
+=C2=A0 =C2=A0 =C2=A0pr_signals_handle();<br>
+ <br>
+-=C2=A0 =C2=A0 if (**cp =3D=3D &#39;\\&#39; &amp;&amp; quote_mode) {<br>
+-<br>
++=C2=A0 =C2=A0 if (**cp =3D=3D &#39;\\&#39; &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 quote_mode =3D=3D TRUE) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Escaped char */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (*((*cp)+1)) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *dst =3D *(++(*cp));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 *dst++ =3D *(++(*cp));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 (*cp)++;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0*dst++ =3D **cp;<br>
+-=C2=A0 =C2=A0 ++(*cp);<br>
++=C2=A0 =C2=A0 (*cp)++;<br>
+=C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0if (**cp) {<br>
+diff --git a/tests/api/str.c b/tests/api/str.c<br>
+index 050f5c563..bc64f0fb0 100644<br>
+--- a/tests/api/str.c<br>
++++ b/tests/api/str.c<br>
+@@ -1,6 +1,6 @@<br>
+ /*<br>
+=C2=A0 * ProFTPD - FTP server testsuite<br>
+- * Copyright (c) 2008-2017 The ProFTPD Project team<br>
++ * Copyright (c) 2008-2023 The ProFTPD Project team<br>
+=C2=A0 *<br>
+=C2=A0 * This program is free software; you can redistribute it and/or mod=
ify<br>
+=C2=A0 * it under the terms of the GNU General Public License as published=
 by<br>
+@@ -695,19 +695,23 @@ END_TEST<br>
+ START_TEST (get_word_test) {<br>
+=C2=A0 =C2=A0char *ok, *res, *str;<br>
+ <br>
++=C2=A0 mark_point();<br>
+=C2=A0 =C2=A0res =3D pr_str_get_word(NULL, 0);<br>
+=C2=A0 =C2=A0fail_unless(res =3D=3D NULL, &quot;Failed to handle null argu=
ments&quot;);<br>
+=C2=A0 =C2=A0fail_unless(errno =3D=3D EINVAL, &quot;Failed to set errno to=
 EINVAL&quot;);<br>
+ <br>
++=C2=A0 mark_point();<br>
+=C2=A0 =C2=A0str =3D NULL;<br>
+=C2=A0 =C2=A0res =3D pr_str_get_word(&amp;str, 0);<br>
+=C2=A0 =C2=A0fail_unless(res =3D=3D NULL, &quot;Failed to handle null str =
argument&quot;);<br>
+=C2=A0 =C2=A0fail_unless(errno =3D=3D EINVAL, &quot;Failed to set errno to=
 EINVAL&quot;);<br>
+ <br>
++=C2=A0 mark_point();<br>
+=C2=A0 =C2=A0str =3D pstrdup(p, &quot;=C2=A0 &quot;);<br>
+=C2=A0 =C2=A0res =3D pr_str_get_word(&amp;str, 0);<br>
+=C2=A0 =C2=A0fail_unless(res =3D=3D NULL, &quot;Failed to handle whitespac=
e argument&quot;);<br>
+ <br>
++=C2=A0 mark_point();<br>
+=C2=A0 =C2=A0str =3D pstrdup(p, &quot; foo&quot;);<br>
+=C2=A0 =C2=A0res =3D pr_str_get_word(&amp;str, PR_STR_FL_PRESERVE_WHITESPA=
CE);<br>
+=C2=A0 =C2=A0fail_unless(res !=3D NULL, &quot;Failed to handle whitespace =
argument: %s&quot;,<br>
+@@ -723,6 +727,7 @@ START_TEST (get_word_test) {<br>
+=C2=A0 =C2=A0ok =3D &quot;foo&quot;;<br>
+=C2=A0 =C2=A0fail_unless(strcmp(res, ok) =3D=3D 0, &quot;Expected &#39;%s&=
#39;, got &#39;%s&#39;&quot;, ok, res);<br>
+ <br>
++=C2=A0 mark_point();<br>
+=C2=A0 =C2=A0str =3D pstrdup(p, &quot;=C2=A0 # foo&quot;);<br>
+=C2=A0 =C2=A0res =3D pr_str_get_word(&amp;str, 0);<br>
+=C2=A0 =C2=A0fail_unless(res =3D=3D NULL, &quot;Failed to handle commented=
 argument&quot;);<br>
+@@ -742,6 +747,8 @@ START_TEST (get_word_test) {<br>
+=C2=A0 =C2=A0fail_unless(strcmp(res, ok) =3D=3D 0, &quot;Expected &#39;%s&=
#39;, got &#39;%s&#39;&quot;, ok, res);<br>
+ <br>
+=C2=A0 =C2=A0/* Test multiple embedded quotes. */<br>
++<br>
++=C2=A0 mark_point();<br>
+=C2=A0 =C2=A0str =3D pstrdup(p, &quot;foo \&quot;bar baz\&quot; qux \&quot=
;quz norf\&quot;&quot;);<br>
+=C2=A0 =C2=A0res =3D pr_str_get_word(&amp;str, 0);<br>
+=C2=A0 =C2=A0fail_unless(res !=3D NULL, &quot;Failed to handle quoted argu=
ment: %s&quot;,<br>
+@@ -770,6 +777,47 @@ START_TEST (get_word_test) {<br>
+ <br>
+=C2=A0 =C2=A0ok =3D &quot;quz norf&quot;;<br>
+=C2=A0 =C2=A0fail_unless(strcmp(res, ok) =3D=3D 0, &quot;Expected &#39;%s&=
#39;, got &#39;%s&#39;&quot;, ok, res);<br>
++<br>
++<br>
++=C2=A0 /* Test embedded quotes with backslashes (Issue #1683). */<br>
++=C2=A0 mark_point();<br>
++<br>
++=C2=A0 str =3D pstrdup(p, &quot;\&quot;\\\\SYST\&quot;&quot;);<br>
++=C2=A0 res =3D pr_str_get_word(&amp;str, 0);<br>
++=C2=A0 fail_unless(res !=3D NULL, &quot;Failed to handle quoted argument:=
 %s&quot;,<br>
++=C2=A0 =C2=A0 strerror(errno));<br>
++<br>
++=C2=A0 ok =3D &quot;\\SYST&quot;;<br>
++=C2=A0 fail_unless(strcmp(res, ok) =3D=3D 0, &quot;Expected &#39;%s&#39;,=
 got &#39;%s&#39;&quot;, ok, res);<br>
++<br>
++=C2=A0 mark_point();<br>
++=C2=A0 str =3D pstrdup(p, &quot;\&quot;\&quot;\\\\SYST&quot;);<br>
++=C2=A0 res =3D pr_str_get_word(&amp;str, 0);<br>
++=C2=A0 fail_unless(res !=3D NULL, &quot;Failed to handle quoted argument:=
 %s&quot;,<br>
++=C2=A0 =C2=A0 strerror(errno));<br>
++<br>
++=C2=A0 /* Note that pr_str_get_word() is intended to be called multiple t=
imes<br>
++=C2=A0 =C2=A0* on an advancing buffer, effectively tokenizing the buffer.=
=C2=A0 This is<br>
++=C2=A0 =C2=A0* why the function does NOT decrement its quote mode.<br>
++=C2=A0 =C2=A0*/<br>
++=C2=A0 ok =3D &quot;&quot;;<br>
++=C2=A0 fail_unless(strcmp(res, ok) =3D=3D 0, &quot;Expected &#39;%s&#39;,=
 got &#39;%s&#39;&quot;, ok, res);<br>
++<br>
++=C2=A0 /* Now do the same tests with the IGNORE_QUOTES flag */<br>
++=C2=A0 mark_point();<br>
++<br>
++=C2=A0 str =3D ok =3D pstrdup(p, &quot;\&quot;\\\\SYST\&quot;&quot;);<br>
++=C2=A0 res =3D pr_str_get_word(&amp;str, PR_STR_FL_IGNORE_QUOTES);<br>
++=C2=A0 fail_unless(res !=3D NULL, &quot;Failed to handle quoted argument:=
 %s&quot;,<br>
++=C2=A0 =C2=A0 strerror(errno));<br>
++=C2=A0 fail_unless(strcmp(res, ok) =3D=3D 0, &quot;Expected &#39;%s&#39;,=
 got &#39;%s&#39;&quot;, ok, res);<br>
++<br>
++=C2=A0 mark_point();<br>
++=C2=A0 str =3D ok =3D pstrdup(p, &quot;\&quot;\&quot;\\\\SYST&quot;);<br>
++=C2=A0 res =3D pr_str_get_word(&amp;str, PR_STR_FL_IGNORE_QUOTES);<br>
++=C2=A0 fail_unless(res !=3D NULL, &quot;Failed to handle quoted argument:=
 %s&quot;,<br>
++=C2=A0 =C2=A0 strerror(errno));<br>
++=C2=A0 fail_unless(strcmp(res, ok) =3D=3D 0, &quot;Expected &#39;%s&#39;,=
 got &#39;%s&#39;&quot;, ok, res);<br>
+ }<br>
+ END_TEST<br>
+ <br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta-networking/recipes-daemons/proftpd/<a href=3D"http://prof=
tpd_1.3.7c.bb" rel=3D"noreferrer" target=3D"_blank">proftpd_1.3.7c.bb</a> b=
/meta-networking/recipes-daemons/proftpd/<a href=3D"http://proftpd_1.3.7c.b=
b" rel=3D"noreferrer" target=3D"_blank">proftpd_1.3.7c.bb</a><br>
index b45cb6aaec..ec38fb54e1 100644<br>
--- a/meta-networking/recipes-daemons/proftpd/<a href=3D"http://proftpd_1.3=
.7c.bb" rel=3D"noreferrer" target=3D"_blank">proftpd_1.3.7c.bb</a><br>
+++ b/meta-networking/recipes-daemons/proftpd/<a href=3D"http://proftpd_1.3=
.7c.bb" rel=3D"noreferrer" target=3D"_blank">proftpd_1.3.7c.bb</a><br>
@@ -15,6 +15,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/prof=
tpd/proftpd.git;branch=3D$%7BBRANCH%7D;protocol=3Dhttps" rel=3D"noreferrer"=
 target=3D"_blank">github.com/proftpd/proftpd.git;branch=3D${BRANCH};protoc=
ol=3Dhttps</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://contrib.patch=C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://build_fixup.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://proftpd.service \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-51713.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2024-57392.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--0000000000004d98b50639ee63a3--

