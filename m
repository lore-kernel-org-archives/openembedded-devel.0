Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA35F9D0FC
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 09:27:31 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14987.1776245242251720927
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 02:27:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XPplk9QA;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-404254ffe8aso4262661fac.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 02:27:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776245241; cv=none;
        d=google.com; s=arc-20240605;
        b=AGrsivPs4mUg5CuaXxN3zz3yKxV2zlSmOO+A+7yYCKLYYZozCbEhgnLbRIRmDRYZn6
         s3wZA2e9X22jcyOxmWXW497ATFu8xLGRoA4R7c8AbZDQ9iSGeoU93Y2Te5ctvQaOCP2g
         ai7CxPhyBHMJeOlXs/+8AsLTBdbXyP7DCvUfHWrFM8RVMhSe19VCsaNg8EJqVfcuvaNf
         DqwKd48WKJveo5679WFlejrXX/WKKDJX+sr3kmN+QfTtt3rvWXWEUpRPi9WkbXqR/3Ww
         Xn8Esh3JtkySyzrwnOq81CNS4Cd4QzBcT5nSmGKys0bthKBUTuvKY4e4Zx9aKdSgbPO5
         bRyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HqNZydvZbSsN2cOZ5TTDvT/rBv0WRM7IO6sVCHVPcKU=;
        fh=i0UEVGX6XKvJAmzXVKuwop3O/ShkJNeDIU5NtFbZzgQ=;
        b=TUFx0HZW3SaPCDFZAtudq6iD/6EacsAWmCmUwN6eE8eujsda1JrG6j93zeHQwOy1/t
         SqDuVck7F83rbM1P/kewUTljyB4b4qbZ8DgRy41ndn7r8KuScvL+2ZwL8gatN3LMqAsP
         2bcao01Fty2EEZBlldmK6oYYCBt0JiBy8Xg2TZ+dLarmwuuX6ZsxeG/C+MNaLdF6Bp42
         k6WKfSHPRtEaxWCC4nmh30JOWhscyJMkvC7nBLHS6V+IEikxNUxeMFMEoldvYYNNAHkB
         U0pq4EnY+ExYk3MQ/4+scf5OWmJMsu1JZkrhMyATq4BOMAYiqHpHkF6SkyWWsyfUH0vm
         ORJw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776245241; x=1776850041; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HqNZydvZbSsN2cOZ5TTDvT/rBv0WRM7IO6sVCHVPcKU=;
        b=XPplk9QAHIel1+uogwVh7cs/Md317+mK1BptM+7j7ZcBZ/8FIJAfTKIpLXNqeBHg5W
         2tzn8mwIS4HgDIawkWXgzid7vBojjXZKnMjAg4uPrWjkY0m1qvtzXrtJM4/egb/f8yqp
         kwC4FmfFh458RluA7bL1FkZm1c68ju4GOfzyGZTDX1fSY3XKjWAT4Q+1LIUt/krlWUXm
         ITbOcXSUxTIOJUvrnZ+HeRTcY8X8aKhtrWX6aYf+Qf5oQuhsdt21Z+DeUoNKpRueCtGX
         5W+ILPWzaKjIv9VgzXKoJ+eymTCko/Ht9zrWS7nh6ciBYDYLJxwVqTgA2acgLGoTSOC6
         aM/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776245241; x=1776850041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HqNZydvZbSsN2cOZ5TTDvT/rBv0WRM7IO6sVCHVPcKU=;
        b=JtHTPRoJRr7ouZ1Q6jFOTREFwTlzQRgpyuMjGpfO2ZcqLsGRGHY8e9b6SIIb+MrpV0
         e68eIkiFMnwPeBhde3fseiuTaeO+r/X2TKtLcW6wUd0Rc2UpEGRugW9YzlB5+oeRlX/y
         36PaqiY1EU3ZXX/nwDi6KBWVdc6rirS3jW+1Ghn2pJ/8N2a1uNG5ieLG0prokxbGL+Za
         IBdKw1wrpTF2X7D54OB+Qw8CRS4QZVTpvF7lfwpYBqTRxbhpIQx9JektM+nUmcGYAt3/
         3S+wtHxTSwVhf621CFzdG2mIMUkoAl5R2su4JZHDmuGuHfIFEWYvSFXx7itpma9FCQid
         FJZA==
X-Gm-Message-State: AOJu0YxEGhPaRfrH+3JRm13Hy4yH/BSzbeSTkF+xrGs9pfs6JCrvOp9Y
	ewpLGl8WtyBRAVicfWYiYPLqVHXy5BP2KeIRtdWciGKdrEnbLv1wLPZQTSmZREdyl+2nWh71V6Z
	W0zIdwGfJ4by2gWHvKSPEMRfYDxBhc4O5ix14
X-Gm-Gg: AeBDietBOGUm2gYl+kojhPmi8r1uVTcfY7bUghKWBB6XK8tJsRn1l+Z2Pc4kiOOqUM1
	4GAHhI56tscjcojiIPHcI2IO8PCbdJIgRnuBQo9IAzuBAZonPFJmygfoUpLNfxLBxZ7aRJYQKee
	HJu1bK65ZW5eeaazdHsk6LJEVMN6WS8hFgRr72kcJOj1BOaERdVFr/wwV0mfFH6QlYJ01F4Uakz
	yOrfUf7P0qdUFDNKzRALzY56y8sgGtS3aENnBjPe2YxwBH1DdezO7u5TaZtKCe4sQUypy1O6THb
	DphnQzZpqwZgCp60UFNg
X-Received: by 2002:a05:6871:c945:b0:417:3930:1b93 with SMTP id
 586e51a60fabf-423e1b77cd1mr10823976fac.6.1776245241223; Wed, 15 Apr 2026
 02:27:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260409112208.1119823-1-ankur.tyagi85@gmail.com>
 <20260409112208.1119823-8-ankur.tyagi85@gmail.com> <CA+s=J=zOjo=epSeHkT9TxynpEM8VH3zM51wFdBTvz2bZsY_yfQ@mail.gmail.com>
In-Reply-To: <CA+s=J=zOjo=epSeHkT9TxynpEM8VH3zM51wFdBTvz2bZsY_yfQ@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 15 Apr 2026 21:27:09 +1200
X-Gm-Features: AQROBzC53hGipIyo_BY2vWgt_kDMnK1Fsqj3UHidKl3V06jX7APl9GPnt1dpvrI
Message-ID: <CADySD0EYu+qwXvVWWUcTiANoXZPt6GJqeBHYje-VPaM+Dh_oww@mail.gmail.com>
Subject: Re: [oe][meta-webserver][scarthgap][PATCH 8/8] nginx: fix CVE-2026-32647
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 09:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126353

On Mon, Apr 13, 2026 at 11:41=E2=80=AFPM Anuj Mittal
<anuj.mittal@oss.qualcomm.com> wrote:
>
> On Thu, Apr 9, 2026 at 7:23=E2=80=AFPM Ankur Tyagi via lists.openembedded=
.org
> <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >
> > As per the advisory[1] mentioned in NVD[2], version 1.28.3 contains the=
 fix.
> > Backport the commits[3][4] from 1.28.3 changelog matching the descripti=
on.
> >
> > [1] https://my.f5.com/manage/s/article/K000160366
> > [2] https://nvd.nist.gov/vuln/detail/CVE-2026-32647
> > [3] https://github.com/nginx/nginx/commit/a172c880cb51f882a5dc999437e8b=
3a4f87630cc
> > [4] https://github.com/nginx/nginx/commit/b23ac73b00313d159a99636c21ef7=
1b828781018
> >
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  .../nginx/nginx-1.24.0/CVE-2026-32647-1.patch | 77 ++++++++++++++++
> >  .../nginx/nginx-1.24.0/CVE-2026-32647-2.patch | 87 +++++++++++++++++++
> >  .../recipes-httpd/nginx/nginx_1.24.0.bb       |  2 +
> >  3 files changed, 166 insertions(+)
> >  create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE=
-2026-32647-1.patch
> >  create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE=
-2026-32647-2.patch
> >
> > diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-3=
2647-1.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-326=
47-1.patch
> > new file mode 100644
> > index 0000000000..506a3fb887
> > --- /dev/null
> > +++ b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-32647-1.=
patch
> > @@ -0,0 +1,77 @@
> > +From c694db97c62f33d621e73937a63e7b5c206c16c9 Mon Sep 17 00:00:00 2001
> > +From: Roman Arutyunyan <arut@nginx.com>
> > +Date: Sat, 21 Feb 2026 12:04:36 +0400
> > +Subject: [PATCH] Mp4: avoid zero size buffers in output.
> > +
> > +Previously, data validation checks did not cover the cases when the ou=
tput
> > +contained empty buffers.  Such buffers are considered illegal and prod=
uce
> > +"zero size buf in output" alerts.  The change rejects the mp4 files wh=
ich
> > +produce such alerts.
> > +
> > +Also, the change fixes possible buffer overread and overwrite that cou=
ld
> > +happen while processing empty stco and co64 atoms, as reported by
> > +Pavel Kohout (Aisle Research) and Tim Becker.
> > +
> > +(cherry picked from commit a172c880cb51f882a5dc999437e8b3a4f87630cc)
> > +
> > +CVE: CVE-2026-32647
> > +Upstream-Status: Backport [https://github.com/nginx/nginx/commit/a172c=
880cb51f882a5dc999437e8b3a4f87630cc]
> > +Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > +---
> > + src/http/modules/ngx_http_mp4_module.c | 15 +++++++++------
> > + 1 file changed, 9 insertions(+), 6 deletions(-)
> > +
> > +diff --git a/src/http/modules/ngx_http_mp4_module.c b/src/http/modules=
/ngx_http_mp4_module.c
> > +index 041ad263b..13d87cd6a 100644
> > +--- a/src/http/modules/ngx_http_mp4_module.c
> > ++++ b/src/http/modules/ngx_http_mp4_module.c
> > +@@ -901,8 +901,11 @@ ngx_http_mp4_process(ngx_http_mp4_file_t *mp4)
> > +         }
> > +     }
> > +
> > +-    if (end_offset < start_offset) {
> > +-        end_offset =3D start_offset;
> > ++    if (end_offset <=3D start_offset) {
> > ++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
> > ++                      "no data between start time and end time in \"%=
s\"",
> > ++                      mp4->file.name.data);
> > ++        return NGX_ERROR;
> > +     }
> > +
> > +     mp4->moov_size +=3D 8;
> > +@@ -913,7 +916,7 @@ ngx_http_mp4_process(ngx_http_mp4_file_t *mp4)
> > +
> > +     *prev =3D &mp4->mdat_atom;
> > +
> > +-    if (start_offset > mp4->mdat_data.buf->file_last) {
> > ++    if (start_offset >=3D mp4->mdat_data.buf->file_last) {
> > +         ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
> > +                       "start time is out mp4 mdat atom in \"%s\"",
> > +                       mp4->file.name.data);
> > +@@ -3416,7 +3419,7 @@ ngx_http_mp4_update_stsz_atom(ngx_http_mp4_file_=
t *mp4,
> > +     if (data) {
> > +         entries =3D trak->sample_sizes_entries;
> > +
> > +-        if (trak->start_sample > entries) {
> > ++        if (trak->start_sample >=3D entries) {
> > +             ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
> > +                           "start time is out mp4 stsz samples in \"%s=
\"",
> > +                           mp4->file.name.data);
> > +@@ -3591,7 +3594,7 @@ ngx_http_mp4_update_stco_atom(ngx_http_mp4_file_=
t *mp4,
> > +         return NGX_ERROR;
> > +     }
> > +
> > +-    if (trak->start_chunk > trak->chunks) {
> > ++    if (trak->start_chunk >=3D trak->chunks) {
> > +         ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
> > +                       "start time is out mp4 stco chunks in \"%s\"",
> > +                       mp4->file.name.data);
> > +@@ -3806,7 +3809,7 @@ ngx_http_mp4_update_co64_atom(ngx_http_mp4_file_=
t *mp4,
> > +         return NGX_ERROR;
> > +     }
> > +
> > +-    if (trak->start_chunk > trak->chunks) {
> > ++    if (trak->start_chunk >=3D trak->chunks) {
> > +         ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
> > +                       "start time is out mp4 co64 chunks in \"%s\"",
> > +                       mp4->file.name.data);
> > diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-3=
2647-2.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-326=
47-2.patch
> > new file mode 100644
> > index 0000000000..80bf94f5f1
> > --- /dev/null
> > +++ b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-32647-2.=
patch
> > @@ -0,0 +1,87 @@
> > +From 1742d7fe92ed355ffa5aa68609b96f00f582f3d6 Mon Sep 17 00:00:00 2001
> > +From: Roman Arutyunyan <arut@nginx.com>
> > +Date: Mon, 2 Mar 2026 21:12:34 +0400
> > +Subject: [PATCH] Mp4: fixed possible integer overflow on 32-bit platfo=
rms.
> > +
>
> This is same as:
> https://lists.openembedded.org/g/openembedded-devel/message/126024
> sent earlier for a different CVE. Can you please check and resend?

Thanks for the review Anuj.
Both CVE are related and unlike advisory, debian clearly tracks them
separately which I missed:
https://security-tracker.debian.org/tracker/CVE-2026-27784
https://security-tracker.debian.org/tracker/CVE-2026-32647

Please drop this patch and I will resend once the patch for
CVE-2026-27784 is merged.

cheers
Ankur

