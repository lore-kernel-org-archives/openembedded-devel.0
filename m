Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68A6DEB64D0
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 13:50:07 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.13554.1686664204913091155
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jun 2023 06:50:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=03Us4WG2;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.52, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5184abe9e86so2356396a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 06:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686664203; x=1689256203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qgPQxyantLjFyDnbhORUzG+bnCq3cwO9aFSEUGiM1uY=;
        b=03Us4WG2n2fRC7RsXnqLdKQ1BJRuiB2tcPxuJ7WrUTObBo8fHB67OtB6GTMTCyE2PP
         Q2gR42BWeLJxxQsO6euiYX8VJXX+Vy7RJroQdNnmO4G4KZ4PpxvVR2KNulr2XzTltjob
         rOYjbx4RutVSG48rG43PqdrqULITtjJVqDuSDLv3qYG8Y0Mkr7/yEDr3hBwOqeRtDctw
         A1m6ywGRgMIBWd1pLMonljG343nDi3rdu1jtpnGKiIEZJJnSJcBdUIr3UlVAyMVJJZs/
         oCuGSvhFPHdyhfPIOwIKP3lAVq7xZ+4v2TYlsbUGzbkE/s5tnjLmD5HExSllCyJK6FIz
         L3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686664203; x=1689256203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qgPQxyantLjFyDnbhORUzG+bnCq3cwO9aFSEUGiM1uY=;
        b=YQkZGatcdPPgNkwpf2749R5a48e/WnQapo3l1CNjncGE+jo2WE/5KjFGDx8XEEyYNh
         HYLFccKjbfHfkmLPMQv3an3LvqHfVgDp76IK2h+sB6qA5s6dvnUwfoUeg5rBx/ZJRxlU
         BcNLVuDBecZP0UZC0MExvkeLvJrVb/RsWcEb/DGsWmNF6C5QTgtpgtGzKffSg2VVnM6Z
         nYZrpxxlKTkeEiV+9CWadfii+VIUM/qZpKVqBKxnbeOmo0Cy0tUXFzq7lBFrO8u5DSDQ
         Bsyo34o0tb6IemrQKPlQLEOoeooN4fRLcNGMoD0ZF9Kf65G9a/wuQI2odkTGk8Zrkoho
         ixhg==
X-Gm-Message-State: AC+VfDzpssO8Jj16Bznnv+E96WhqPTsfKX8qjwKPmDzvWJQYJRo+u7o7
	liDnC2SGavFcGP12HvwOrZ6QR2cI33qtPPYy0/Cfiw==
X-Google-Smtp-Source: ACHHUZ6EZ8ocY884P5C1HBeCBJlcyItmMXgvuldbgJiCsBG6GL0775USZqHXYhWE4mwWAkZloM8C7jkEXvWCbOEyYbQ=
X-Received: by 2002:aa7:c708:0:b0:518:67f9:eb93 with SMTP id
 i8-20020aa7c708000000b0051867f9eb93mr2651380edq.34.1686664203106; Tue, 13 Jun
 2023 06:50:03 -0700 (PDT)
MIME-Version: 1.0
References: <1765B238F36B7A92.7352@lists.openembedded.org> <CANQUz18mSykrNnyHYpY3pkCk5FSY1ErknzhWUDwOhR=ddN603A@mail.gmail.com>
In-Reply-To: <CANQUz18mSykrNnyHYpY3pkCk5FSY1ErknzhWUDwOhR=ddN603A@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 13 Jun 2023 03:49:51 -1000
Message-ID: <CAOSpxdax2+ObAQOytUaQ4gEvFvwb3xVCpLJ53xFBFwN-k0VvKA@mail.gmail.com>
Subject: Re: [oe][meta-oe][dunfell][PATCH] openldap: Fix CVE-2023-2953
To: Vijay Anusuri <vanusuri@mvista.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Armin Kuster <akuster808@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 13:50:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103269

On Mon, Jun 12, 2023 at 10:24=E2=80=AFPM Vijay Anusuri <vanusuri@mvista.com=
> wrote:

> Any update on this ?

I'm the maintainer for oe-core and this is a meta-oe patch, so I
believe Armin is the right person for an update :-)

Steve

> On Mon, Jun 5, 2023 at 12:49=E2=80=AFPM Vijay Anusuri via lists.openembed=
ded.org <vanusuri=3Dmvista.com@lists.openembedded.org> wrote:
>>
>> From: Vijay Anusuri <vanusuri@mvista.com>
>>
>> Upstream-Status: Backport
>> [https://git.openldap.org/openldap/openldap/-/commit/752d320cf96e46f24c0=
900f1a8f6af0a3fc3c4ce
>> &
>> https://git.openldap.org/openldap/openldap/-/commit/6563fab9e2feccb0a684=
d0398e78571d09fb808b]
>>
>> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> ---
>>  .../openldap/openldap/CVE-2023-2953-1.patch   | 30 ++++++++
>>  .../openldap/openldap/CVE-2023-2953-2.patch   | 76 +++++++++++++++++++
>>  .../openldap/openldap_2.4.57.bb               |  2 +
>>  3 files changed, 108 insertions(+)
>>  create mode 100644 meta-oe/recipes-support/openldap/openldap/CVE-2023-2=
953-1.patch
>>  create mode 100644 meta-oe/recipes-support/openldap/openldap/CVE-2023-2=
953-2.patch
>>
>> diff --git a/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-1.p=
atch b/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-1.patch
>> new file mode 100644
>> index 000000000..f4b4eb95d
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-1.patch
>> @@ -0,0 +1,30 @@
>> +From 752d320cf96e46f24c0900f1a8f6af0a3fc3c4ce Mon Sep 17 00:00:00 2001
>> +From: Howard Chu <hyc@openldap.org>
>> +Date: Wed, 24 Aug 2022 14:40:51 +0100
>> +Subject: [PATCH] ITS#9904 ldif_open_url: check for ber_strdup failure
>> +
>> +Code present since 1999, df8f7cbb9b79be3be9205d116d1dd0b263d6861a
>> +
>> +Upstream-Status: Backport [https://git.openldap.org/openldap/openldap/-=
/commit/752d320cf96e46f24c0900f1a8f6af0a3fc3c4ce]
>> +CVE: CVE-2023-2953
>> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> +---
>> + libraries/libldap/fetch.c | 2 ++
>> + 1 file changed, 2 insertions(+)
>> +
>> +diff --git a/libraries/libldap/fetch.c b/libraries/libldap/fetch.c
>> +index 9e426dc647..536871bcfe 100644
>> +--- a/libraries/libldap/fetch.c
>> ++++ b/libraries/libldap/fetch.c
>> +@@ -69,6 +69,8 @@ ldif_open_url(
>> +               }
>> +
>> +               p =3D ber_strdup( urlstr );
>> ++              if ( p =3D=3D NULL )
>> ++                      return NULL;
>> +
>> +               /* But we should convert to LDAP_DIRSEP before use */
>> +               if ( LDAP_DIRSEP[0] !=3D '/' ) {
>> +--
>> +GitLab
>> +
>> diff --git a/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-2.p=
atch b/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-2.patch
>> new file mode 100644
>> index 000000000..02c43bc44
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-2.patch
>> @@ -0,0 +1,76 @@
>> +From 6563fab9e2feccb0a684d0398e78571d09fb808b Mon Sep 17 00:00:00 2001
>> +From: Howard Chu <hyc@openldap.org>
>> +Date: Thu, 25 Aug 2022 16:13:21 +0100
>> +Subject: [PATCH] ITS#9904 ldap_url_parsehosts: check for strdup failure
>> +
>> +Avoid unnecessary strdup in IPv6 addr parsing, check for strdup
>> +failure when dup'ing scheme.
>> +
>> +Code present since 2000, 8da110a9e726dbc612b302feafe0109271e6bc59
>> +
>> +Upstream-Status: Backport [https://git.openldap.org/openldap/openldap/-=
/commit/6563fab9e2feccb0a684d0398e78571d09fb808b]
>> +CVE: CVE-2023-2953
>> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> +---
>> + libraries/libldap/url.c | 21 ++++++++++++---------
>> + 1 file changed, 12 insertions(+), 9 deletions(-)
>> +
>> +diff --git a/libraries/libldap/url.c b/libraries/libldap/url.c
>> +index dcf2aac9e8..493fd7ce47 100644
>> +--- a/libraries/libldap/url.c
>> ++++ b/libraries/libldap/url.c
>> +@@ -1385,24 +1385,22 @@ ldap_url_parsehosts(
>> +               }
>> +               ludp->lud_port =3D port;
>> +               ludp->lud_host =3D specs[i];
>> +-              specs[i] =3D NULL;
>> +               p =3D strchr(ludp->lud_host, ':');
>> +               if (p !=3D NULL) {
>> +                       /* more than one :, IPv6 address */
>> +                       if ( strchr(p+1, ':') !=3D NULL ) {
>> +                               /* allow [address] and [address]:port */
>> +                               if ( *ludp->lud_host =3D=3D '[' ) {
>> +-                                      p =3D LDAP_STRDUP(ludp->lud_host=
+1);
>> +-                                      /* copied, make sure we free sou=
rce later */
>> +-                                      specs[i] =3D ludp->lud_host;
>> +-                                      ludp->lud_host =3D p;
>> +-                                      p =3D strchr( ludp->lud_host, ']=
' );
>> ++                                      p =3D strchr( ludp->lud_host+1, =
']' );
>> +                                       if ( p =3D=3D NULL ) {
>> +                                               LDAP_FREE(ludp);
>> +                                               ldap_charray_free(specs)=
;
>> +                                               return LDAP_PARAM_ERROR;
>> +                                       }
>> +-                                      *p++ =3D '\0';
>> ++                                      /* Truncate trailing ']' and shi=
ft hostname down 1 char */
>> ++                                      *p =3D '\0';
>> ++                                      AC_MEMCPY( ludp->lud_host, ludp-=
>lud_host+1, p - ludp->lud_host );
>> ++                                      p++;
>> +                                       if ( *p !=3D ':' ) {
>> +                                               if ( *p !=3D '\0' ) {
>> +                                                       LDAP_FREE(ludp);
>> +@@ -1428,14 +1426,19 @@ ldap_url_parsehosts(
>> +                               }
>> +                       }
>> +               }
>> +-              ldap_pvt_hex_unescape(ludp->lud_host);
>> +               ludp->lud_scheme =3D LDAP_STRDUP("ldap");
>> ++              if ( ludp->lud_scheme =3D=3D NULL ) {
>> ++                      LDAP_FREE(ludp);
>> ++                      ldap_charray_free(specs);
>> ++                      return LDAP_NO_MEMORY;
>> ++              }
>> ++              specs[i] =3D NULL;
>> ++              ldap_pvt_hex_unescape(ludp->lud_host);
>> +               ludp->lud_next =3D *ludlist;
>> +               *ludlist =3D ludp;
>> +       }
>> +
>> +       /* this should be an array of NULLs now */
>> +-      /* except entries starting with [ */
>> +       ldap_charray_free(specs);
>> +       return LDAP_SUCCESS;
>> + }
>> +--
>> +GitLab
>> +
>> diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.57.bb b/meta-=
oe/recipes-support/openldap/openldap_2.4.57.bb
>> index e3e9caa1b..1e7e6b3d7 100644
>> --- a/meta-oe/recipes-support/openldap/openldap_2.4.57.bb
>> +++ b/meta-oe/recipes-support/openldap/openldap_2.4.57.bb
>> @@ -24,6 +24,8 @@ SRC_URI =3D "http://www.openldap.org/software/download=
/OpenLDAP/openldap-release/$
>>      file://openldap-CVE-2015-3276.patch \
>>      file://remove-user-host-pwd-from-version.patch \
>>      file://CVE-2022-29155.patch \
>> +    file://CVE-2023-2953-1.patch \
>> +    file://CVE-2023-2953-2.patch \
>>  "
>>  SRC_URI[md5sum] =3D "e3349456c3a66e5e6155be7ddc3f042c"
>>  SRC_URI[sha256sum] =3D "c7ba47e1e6ecb5b436f3d43281df57abeffa99262141aec=
822628bc220f6b45a"
>> --
>> 2.25.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#103107): https://lists.openembedded.org/g/openembedd=
ed-devel/message/103107
>> Mute This Topic: https://lists.openembedded.org/mt/99335615/7301997
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [=
vanusuri@mvista.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

