Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B9AFC25B75
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 05:36:59 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web11.7153.1717652210435346014
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Jun 2024 22:36:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ghVY/ZdC;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5b2e93fddafso238846eaf.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Jun 2024 22:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717652209; x=1718257009; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Nr+1EHlyMFco41P4Qje/1zg+7wavj3qR/SmkmyOQUU=;
        b=ghVY/ZdCcmPg7aIQ3sPqII6nlEmiXHShQDJ95Fk+yng3bCZKuayc0jkY7naxokIyzx
         Ijd6GvzJWhONGjbKosESrKg2ubV4AXuO0K+Kyhdfx76cMKeNYbqBkXrxsqfy2IQehRDt
         l3YJqNC/jRGnX+X/5f31VTnVb2PJhVDo97PDIO2lgLqdeNlYegevf+csqMM8fZNJaxUy
         UR96IG6dYc2L74HV2PybMwA3x/0fazTpYQc0JEl5ikfDLcsGmXMcUtZq8y99v6kn+neX
         5qScMhDGmKTA+XQzOoURUsIrDCHUryk15KsaCsrg21f0EbpNjBkepiMfmbbVGndlwyzR
         TrWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717652209; x=1718257009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Nr+1EHlyMFco41P4Qje/1zg+7wavj3qR/SmkmyOQUU=;
        b=hstzfjY0aGKegn8C3CInZ2kXNhXZjmqnI2ZBNHZKDUN8sGp3r1aTC6G+Kjcq5Gzc34
         Rf7phwvoRRXHx+aEYmv6Ce1NFPr+fU7MBZsjBrnKSOcEb5V3OVCrRIsVX1j+yNv7Yynl
         ZqJ+23U9M95Tc7ACZoOPiv7uUfNFcmn3g4OrYphTQ0UTwPeR9ZUE1TqUNLsWGm73WqcQ
         cMSdEiqN+bP8v/qLEA1aMCdXBLIVNzIWs9ujiqsGQaqegALAO6nydS8LD6h0Y8SS9zCi
         oWLSPgSkTW0Sv0R2825ZFaEChH8sOOPOnmTW5rSimHcZaJsug0mREzSq9VqA5+/TbqSj
         kDkQ==
X-Gm-Message-State: AOJu0YzkCJa4ISuumKHK7G+AR3KrpBxS7NMz07yhTEH+eIftHLdymP2b
	WwXr9Esf7SwhBHiDX4Qz92nJdFVLzvNFfPEGlOs3UMxXYDvBS3zq9zA5swBCHzuILd++Z9M28FV
	WvnjDS7JvOkmdfV38aYfC3X++Rm4LjQ==
X-Google-Smtp-Source: AGHT+IEXRhCnQf3z86je+XYR9RdXNJmPKNCY5Rn9srNvf7VnPT4plpsP3JgJgTJb9lQnfJOEsDbYe4EgqO/dlvO9e58=
X-Received: by 2002:a05:6870:7b46:b0:24f:c144:ea57 with SMTP id
 586e51a60fabf-25440339583mr774036fac.9.1717652209476; Wed, 05 Jun 2024
 22:36:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240606050222.2551532-1-kai.kang@windriver.com>
In-Reply-To: <20240606050222.2551532-1-kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Jun 2024 22:36:23 -0700
Message-ID: <CAMKF1sosZ+7FKSzusqN9VtT0W2Kig1eCua8iSfg506wgprpogw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] usleep: fix compile errors
To: kai.kang@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 05:36:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110708

On Wed, Jun 5, 2024 at 10:02=E2=80=AFPM Kai Kang via lists.openembedded.org
<kai.kang=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> Update usleep.c to fix following compile error:
>
> | usleep.c: In function 'main':
> | usleep.c:47:43: error: passing argument 3 of 'poptGetContext' from inco=
mpatible pointer type [-Wincompatible-pointer-types]
> |    47 |   optCon =3D poptGetContext("usleep", argc, argv, options,0);
> |       |                                           ^~~~
> |       |                                           |
> |       |                                           char **
> | In file included from usleep.c:29:
> | /path_to/tmp-glibc/work/core2-64-wrs-linux/usleep/1.2/recipe-sysroot/us=
r/include/popt.h:217:41: note: expected 'const char **' but argument is of =
type 'char **'
> |   217 |                 int argc, const char ** argv,
> |       |                           ~~~~~~~~~~~~~~^~~~
> | usleep.c:68:12: warning: assignment discards 'const' qualifier from poi=
nter target type [-Wdiscarded-qualifiers]
> |    68 |   countStr =3D poptGetArg(optCon);
> |       |            ^
>

What is the upstream status of this patch ?

> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta-oe/recipes-core/usleep/files/usleep.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-core/usleep/files/usleep.c b/meta-oe/recipes=
-core/usleep/files/usleep.c
> index a5e7d9d715..dfa52ec19a 100644
> --- a/meta-oe/recipes-core/usleep/files/usleep.c
> +++ b/meta-oe/recipes-core/usleep/files/usleep.c
> @@ -34,7 +34,7 @@ int main(int argc, char **argv) {
>    int showVersion =3D 0;
>    int showOot =3D 0;
>    int rc;
> -  char * countStr =3D NULL;
> +  const char * countStr =3D NULL;
>    struct poptOption options[] =3D {
>              { "version", 'v', POPT_ARG_NONE, &showVersion, 0,
>                         "Display the version of this program, and exit" }=
,
> @@ -44,7 +44,7 @@ int main(int argc, char **argv) {
>              { 0, 0, 0, 0, 0 }
>          };
>
> -  optCon =3D poptGetContext("usleep", argc, argv, options,0);
> +  optCon =3D poptGetContext("usleep", argc, (const char **)argv, options=
,0);
>    /*poptReadDefaultConfig(optCon, 1);*/
>    poptSetOtherOptionHelp(optCon, "[microseconds]");
>
> --
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110707): https://lists.openembedded.org/g/openembedde=
d-devel/message/110707
> Mute This Topic: https://lists.openembedded.org/mt/106517953/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

