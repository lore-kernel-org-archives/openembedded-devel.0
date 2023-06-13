Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A513CC77B7A
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 08:24:55 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.8475.1686644688488323068
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jun 2023 01:24:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=U7X2AylX;
 spf=pass (domain: mvista.com, ip: 209.85.208.181, mailfrom: vanusuri@mvista.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2b33176880bso17964351fa.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 01:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1686644686; x=1689236686;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yjL5k3phfTim008eTQCNI1mcde0fELAszDBRPVpKDUY=;
        b=U7X2AylX6QMoSnyb6Ukb15ztuvnFdoq24gmfSpjccFlaka5tWxe3RtYZ0uClYepYn5
         Sm7D5JerKi6TJijy0+B6swCFwXBfUPKvuDGAdFiNA4h4pLEZVMzCcyvQbGqw8vl5DKgp
         4fj0YChJ9y/wGaZDEIyez8wwUWVYKV16eb/I0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686644686; x=1689236686;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yjL5k3phfTim008eTQCNI1mcde0fELAszDBRPVpKDUY=;
        b=l9BkfyceLdohVsCGY4WD6MLlKLlbAWiXzLmB8O0bmLYyqee2nxdAOfvvmiloLXqM2Z
         Wqe3gInF8nPz+4xvBlA59rlSRKeY6mAwX5WgdO0NPN1mhMVCz3vuRV1jyraegamR4tUS
         DzCNMGQfzxGV3/BJpW9PMP1vxE+sXBIf/PBGci1QGa8soOZhFquJHTan6OZOFSddGm3/
         m63GMzEjT6YDEMMM/yuliVjVDkVDSI9QrsPVv7/I4x2i7/DznAI8hC9iPXrJuQcEi5VZ
         tTdm7azEikvOK+Jcv6XRTCK/ffFPej4FyEDfn5NMi44A9DCuNTcGHgRo7wIk5Uxeme6e
         eAYw==
X-Gm-Message-State: AC+VfDzcQjVlHea1sNdxMAKeHsBJHzQsDpBRHZG2PrVJvRznfyH7Fls2
	BhxSXRyuNLldH62NrPH7rAfCPLbcyOPSeLeFcVyFFQ==
X-Google-Smtp-Source: ACHHUZ6jNJu/slJyJwhgCZu+5A5+LZZVpu936XDPhtTfGURMV1C/hQXb3TdGiULEVEeaBU4k+3BXSkjWfp1bepJbZVI=
X-Received: by 2002:a2e:86c4:0:b0:2b1:e8f8:e0ff with SMTP id
 n4-20020a2e86c4000000b002b1e8f8e0ffmr4623841ljj.10.1686644686220; Tue, 13 Jun
 2023 01:24:46 -0700 (PDT)
MIME-Version: 1.0
References: <1765B238F36B7A92.7352@lists.openembedded.org>
In-Reply-To: <1765B238F36B7A92.7352@lists.openembedded.org>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Tue, 13 Jun 2023 13:54:34 +0530
Message-ID: <CANQUz18mSykrNnyHYpY3pkCk5FSY1ErknzhWUDwOhR=ddN603A@mail.gmail.com>
Subject: Re: [oe][meta-oe][dunfell][PATCH] openldap: Fix CVE-2023-2953
To: vanusuri@mvista.com, Steve Sakoman <steve@sakoman.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000628ace05fdfe9118"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 08:24:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103263

--000000000000628ace05fdfe9118
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Steve,

Any update on this ?

Thanks & Regards,
Vijay

On Mon, Jun 5, 2023 at 12:49=E2=80=AFPM Vijay Anusuri via lists.openembedde=
d.org
<vanusuri=3Dmvista.com@lists.openembedded.org> wrote:

> From: Vijay Anusuri <vanusuri@mvista.com>
>
> Upstream-Status: Backport
> [
> https://git.openldap.org/openldap/openldap/-/commit/752d320cf96e46f24c090=
0f1a8f6af0a3fc3c4ce
> &
> <https://git.openldap.org/openldap/openldap/-/commit/752d320cf96e46f24c09=
00f1a8f6af0a3fc3c4ce&>
>
> https://git.openldap.org/openldap/openldap/-/commit/6563fab9e2feccb0a684d=
0398e78571d09fb808b
> ]
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../openldap/openldap/CVE-2023-2953-1.patch   | 30 ++++++++
>  .../openldap/openldap/CVE-2023-2953-2.patch   | 76 +++++++++++++++++++
>  .../openldap/openldap_2.4.57.bb               |  2 +
>  3 files changed, 108 insertions(+)
>  create mode 100644
> meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-1.patch
>  create mode 100644
> meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-2.patch
>
> diff --git
> a/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-1.patch
> b/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-1.patch
> new file mode 100644
> index 000000000..f4b4eb95d
> --- /dev/null
> +++ b/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-1.patch
> @@ -0,0 +1,30 @@
> +From 752d320cf96e46f24c0900f1a8f6af0a3fc3c4ce Mon Sep 17 00:00:00 2001
> +From: Howard Chu <hyc@openldap.org>
> +Date: Wed, 24 Aug 2022 14:40:51 +0100
> +Subject: [PATCH] ITS#9904 ldif_open_url: check for ber_strdup failure
> +
> +Code present since 1999, df8f7cbb9b79be3be9205d116d1dd0b263d6861a
> +
> +Upstream-Status: Backport [
> https://git.openldap.org/openldap/openldap/-/commit/752d320cf96e46f24c090=
0f1a8f6af0a3fc3c4ce
> ]
> +CVE: CVE-2023-2953
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + libraries/libldap/fetch.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/libraries/libldap/fetch.c b/libraries/libldap/fetch.c
> +index 9e426dc647..536871bcfe 100644
> +--- a/libraries/libldap/fetch.c
> ++++ b/libraries/libldap/fetch.c
> +@@ -69,6 +69,8 @@ ldif_open_url(
> +               }
> +
> +               p =3D ber_strdup( urlstr );
> ++              if ( p =3D=3D NULL )
> ++                      return NULL;
> +
> +               /* But we should convert to LDAP_DIRSEP before use */
> +               if ( LDAP_DIRSEP[0] !=3D '/' ) {
> +--
> +GitLab
> +
> diff --git
> a/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-2.patch
> b/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-2.patch
> new file mode 100644
> index 000000000..02c43bc44
> --- /dev/null
> +++ b/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-2.patch
> @@ -0,0 +1,76 @@
> +From 6563fab9e2feccb0a684d0398e78571d09fb808b Mon Sep 17 00:00:00 2001
> +From: Howard Chu <hyc@openldap.org>
> +Date: Thu, 25 Aug 2022 16:13:21 +0100
> +Subject: [PATCH] ITS#9904 ldap_url_parsehosts: check for strdup failure
> +
> +Avoid unnecessary strdup in IPv6 addr parsing, check for strdup
> +failure when dup'ing scheme.
> +
> +Code present since 2000, 8da110a9e726dbc612b302feafe0109271e6bc59
> +
> +Upstream-Status: Backport [
> https://git.openldap.org/openldap/openldap/-/commit/6563fab9e2feccb0a684d=
0398e78571d09fb808b
> ]
> +CVE: CVE-2023-2953
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + libraries/libldap/url.c | 21 ++++++++++++---------
> + 1 file changed, 12 insertions(+), 9 deletions(-)
> +
> +diff --git a/libraries/libldap/url.c b/libraries/libldap/url.c
> +index dcf2aac9e8..493fd7ce47 100644
> +--- a/libraries/libldap/url.c
> ++++ b/libraries/libldap/url.c
> +@@ -1385,24 +1385,22 @@ ldap_url_parsehosts(
> +               }
> +               ludp->lud_port =3D port;
> +               ludp->lud_host =3D specs[i];
> +-              specs[i] =3D NULL;
> +               p =3D strchr(ludp->lud_host, ':');
> +               if (p !=3D NULL) {
> +                       /* more than one :, IPv6 address */
> +                       if ( strchr(p+1, ':') !=3D NULL ) {
> +                               /* allow [address] and [address]:port */
> +                               if ( *ludp->lud_host =3D=3D '[' ) {
> +-                                      p =3D LDAP_STRDUP(ludp->lud_host+=
1);
> +-                                      /* copied, make sure we free
> source later */
> +-                                      specs[i] =3D ludp->lud_host;
> +-                                      ludp->lud_host =3D p;
> +-                                      p =3D strchr( ludp->lud_host, ']'=
 );
> ++                                      p =3D strchr( ludp->lud_host+1, '=
]'
> );
> +                                       if ( p =3D=3D NULL ) {
> +                                               LDAP_FREE(ludp);
> +                                               ldap_charray_free(specs);
> +                                               return LDAP_PARAM_ERROR;
> +                                       }
> +-                                      *p++ =3D '\0';
> ++                                      /* Truncate trailing ']' and shif=
t
> hostname down 1 char */
> ++                                      *p =3D '\0';
> ++                                      AC_MEMCPY( ludp->lud_host,
> ludp->lud_host+1, p - ludp->lud_host );
> ++                                      p++;
> +                                       if ( *p !=3D ':' ) {
> +                                               if ( *p !=3D '\0' ) {
> +                                                       LDAP_FREE(ludp);
> +@@ -1428,14 +1426,19 @@ ldap_url_parsehosts(
> +                               }
> +                       }
> +               }
> +-              ldap_pvt_hex_unescape(ludp->lud_host);
> +               ludp->lud_scheme =3D LDAP_STRDUP("ldap");
> ++              if ( ludp->lud_scheme =3D=3D NULL ) {
> ++                      LDAP_FREE(ludp);
> ++                      ldap_charray_free(specs);
> ++                      return LDAP_NO_MEMORY;
> ++              }
> ++              specs[i] =3D NULL;
> ++              ldap_pvt_hex_unescape(ludp->lud_host);
> +               ludp->lud_next =3D *ludlist;
> +               *ludlist =3D ludp;
> +       }
> +
> +       /* this should be an array of NULLs now */
> +-      /* except entries starting with [ */
> +       ldap_charray_free(specs);
> +       return LDAP_SUCCESS;
> + }
> +--
> +GitLab
> +
> diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.57.bb
> b/meta-oe/recipes-support/openldap/openldap_2.4.57.bb
> index e3e9caa1b..1e7e6b3d7 100644
> --- a/meta-oe/recipes-support/openldap/openldap_2.4.57.bb
> +++ b/meta-oe/recipes-support/openldap/openldap_2.4.57.bb
> @@ -24,6 +24,8 @@ SRC_URI =3D "
> http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
>      file://openldap-CVE-2015-3276.patch \
>      file://remove-user-host-pwd-from-version.patch \
>      file://CVE-2022-29155.patch \
> +    file://CVE-2023-2953-1.patch \
> +    file://CVE-2023-2953-2.patch \
>  "
>  SRC_URI[md5sum] =3D "e3349456c3a66e5e6155be7ddc3f042c"
>  SRC_URI[sha256sum] =3D
> "c7ba47e1e6ecb5b436f3d43281df57abeffa99262141aec822628bc220f6b45a"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103107):
> https://lists.openembedded.org/g/openembedded-devel/message/103107
> Mute This Topic: https://lists.openembedded.org/mt/99335615/7301997
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> vanusuri@mvista.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000628ace05fdfe9118
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Steve,</div><div><br></div><div>Any update on this=
 ?</div><div><br></div><div>Thanks &amp; Regards,</div><div>Vijay<br></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Mon, Jun 5, 2023 at 12:49=E2=80=AFPM Vijay Anusuri via <a href=3D"http:/=
/lists.openembedded.org">lists.openembedded.org</a> &lt;vanusuri=3D<a href=
=3D"mailto:mvista.com@lists.openembedded.org">mvista.com@lists.openembedded=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" target=
=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
<br>
Upstream-Status: Backport<br>
[<a href=3D"https://git.openldap.org/openldap/openldap/-/commit/752d320cf96=
e46f24c0900f1a8f6af0a3fc3c4ce&amp;" rel=3D"noreferrer" target=3D"_blank">ht=
tps://git.openldap.org/openldap/openldap/-/commit/752d320cf96e46f24c0900f1a=
8f6af0a3fc3c4ce<br>
&amp;</a><br>
<a href=3D"https://git.openldap.org/openldap/openldap/-/commit/6563fab9e2fe=
ccb0a684d0398e78571d09fb808b" rel=3D"noreferrer" target=3D"_blank">https://=
git.openldap.org/openldap/openldap/-/commit/6563fab9e2feccb0a684d0398e78571=
d09fb808b</a>]<br>
<br>
Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
---<br>
=C2=A0.../openldap/openldap/CVE-2023-2953-1.patch=C2=A0 =C2=A0| 30 ++++++++=
<br>
=C2=A0.../openldap/openldap/CVE-2023-2953-2.patch=C2=A0 =C2=A0| 76 ++++++++=
+++++++++++<br>
=C2=A0.../openldap/<a href=3D"http://openldap_2.4.57.bb" rel=3D"noreferrer"=
 target=3D"_blank">openldap_2.4.57.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +<br>
=C2=A03 files changed, 108 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/openldap/openldap/CVE-2023=
-2953-1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/openldap/openldap/CVE-2023=
-2953-2.patch<br>
<br>
diff --git a/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-1.patc=
h b/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-1.patch<br>
new file mode 100644<br>
index 000000000..f4b4eb95d<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-1.patch<br>
@@ -0,0 +1,30 @@<br>
+From 752d320cf96e46f24c0900f1a8f6af0a3fc3c4ce Mon Sep 17 00:00:00 2001<br>
+From: Howard Chu &lt;<a href=3D"mailto:hyc@openldap.org" target=3D"_blank"=
>hyc@openldap.org</a>&gt;<br>
+Date: Wed, 24 Aug 2022 14:40:51 +0100<br>
+Subject: [PATCH] ITS#9904 ldif_open_url: check for ber_strdup failure<br>
+<br>
+Code present since 1999, df8f7cbb9b79be3be9205d116d1dd0b263d6861a<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://git.openldap.org/openldap/op=
enldap/-/commit/752d320cf96e46f24c0900f1a8f6af0a3fc3c4ce" rel=3D"noreferrer=
" target=3D"_blank">https://git.openldap.org/openldap/openldap/-/commit/752=
d320cf96e46f24c0900f1a8f6af0a3fc3c4ce</a>]<br>
+CVE: CVE-2023-2953<br>
+Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
+---<br>
+ libraries/libldap/fetch.c | 2 ++<br>
+ 1 file changed, 2 insertions(+)<br>
+<br>
+diff --git a/libraries/libldap/fetch.c b/libraries/libldap/fetch.c<br>
+index 9e426dc647..536871bcfe 100644<br>
+--- a/libraries/libldap/fetch.c<br>
++++ b/libraries/libldap/fetch.c<br>
+@@ -69,6 +69,8 @@ ldif_open_url(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p =3D ber_strdup( u=
rlstr );<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( p =3D=3D NULL )<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return NULL;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* But we should co=
nvert to LDAP_DIRSEP before use */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( LDAP_DIRSEP[0]=
 !=3D &#39;/&#39; ) {<br>
+-- <br>
+GitLab<br>
+<br>
diff --git a/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-2.patc=
h b/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-2.patch<br>
new file mode 100644<br>
index 000000000..02c43bc44<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-2.patch<br>
@@ -0,0 +1,76 @@<br>
+From 6563fab9e2feccb0a684d0398e78571d09fb808b Mon Sep 17 00:00:00 2001<br>
+From: Howard Chu &lt;<a href=3D"mailto:hyc@openldap.org" target=3D"_blank"=
>hyc@openldap.org</a>&gt;<br>
+Date: Thu, 25 Aug 2022 16:13:21 +0100<br>
+Subject: [PATCH] ITS#9904 ldap_url_parsehosts: check for strdup failure<br=
>
+<br>
+Avoid unnecessary strdup in IPv6 addr parsing, check for strdup<br>
+failure when dup&#39;ing scheme.<br>
+<br>
+Code present since 2000, 8da110a9e726dbc612b302feafe0109271e6bc59<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://git.openldap.org/openldap/op=
enldap/-/commit/6563fab9e2feccb0a684d0398e78571d09fb808b" rel=3D"noreferrer=
" target=3D"_blank">https://git.openldap.org/openldap/openldap/-/commit/656=
3fab9e2feccb0a684d0398e78571d09fb808b</a>]<br>
+CVE: CVE-2023-2953<br>
+Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
+---<br>
+ libraries/libldap/url.c | 21 ++++++++++++---------<br>
+ 1 file changed, 12 insertions(+), 9 deletions(-)<br>
+<br>
+diff --git a/libraries/libldap/url.c b/libraries/libldap/url.c<br>
+index dcf2aac9e8..493fd7ce47 100644<br>
+--- a/libraries/libldap/url.c<br>
++++ b/libraries/libldap/url.c<br>
+@@ -1385,24 +1385,22 @@ ldap_url_parsehosts(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ludp-&gt;lud_port =
=3D port;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ludp-&gt;lud_host =
=3D specs[i];<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 specs[i] =3D NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p =3D strchr(ludp-&=
gt;lud_host, &#39;:&#39;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (p !=3D NULL) {<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* more than one :, IPv6 address */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if ( strchr(p+1, &#39;:&#39;) !=3D NULL ) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* allow [address] and [address]:port=
 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( *ludp-&gt;lud_host =3D=3D &#39;[=
&#39; ) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D LDAP_STRD=
UP(ludp-&gt;lud_host+1);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* copied, make=
 sure we free source later */<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 specs[i] =3D lu=
dp-&gt;lud_host;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ludp-&gt;lud_ho=
st =3D p;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D strchr( l=
udp-&gt;lud_host, &#39;]&#39; );<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D strchr( l=
udp-&gt;lud_host+1, &#39;]&#39; );<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( p =
=3D=3D NULL ) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0LDAP_FREE(ludp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0ldap_charray_free(specs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0return LDAP_PARAM_ERROR;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *p++ =3D &#39;\=
0&#39;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Truncate tra=
iling &#39;]&#39; and shift hostname down 1 char */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *p =3D &#39;\0&=
#39;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MEMCPY( ludp=
-&gt;lud_host, ludp-&gt;lud_host+1, p - ludp-&gt;lud_host );<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ( *p !=
=3D &#39;:&#39; ) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0if ( *p !=3D &#39;\0&#39; ) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LDAP_FREE(ludp);<br>
+@@ -1428,14 +1426,19 @@ ldap_url_parsehosts(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ldap_pvt_hex_unescape(lu=
dp-&gt;lud_host);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ludp-&gt;lud_scheme=
 =3D LDAP_STRDUP(&quot;ldap&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( ludp-&gt;lud_scheme=
 =3D=3D NULL ) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 LDAP_FREE(ludp);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ldap_charray_free(specs);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return LDAP_NO_MEMORY;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 specs[i] =3D NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ldap_pvt_hex_unescape(lu=
dp-&gt;lud_host);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ludp-&gt;lud_next =
=3D *ludlist;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*ludlist =3D ludp;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* this should be an array of NULLs now */<br>
+-=C2=A0 =C2=A0 =C2=A0 /* except entries starting with [ */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ldap_charray_free(specs);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return LDAP_SUCCESS;<br>
+ }<br>
+-- <br>
+GitLab<br>
+<br>
diff --git a/meta-oe/recipes-support/openldap/<a href=3D"http://openldap_2.=
4.57.bb" rel=3D"noreferrer" target=3D"_blank">openldap_2.4.57.bb</a> b/meta=
-oe/recipes-support/openldap/<a href=3D"http://openldap_2.4.57.bb" rel=3D"n=
oreferrer" target=3D"_blank">openldap_2.4.57.bb</a><br>
index e3e9caa1b..1e7e6b3d7 100644<br>
--- a/meta-oe/recipes-support/openldap/<a href=3D"http://openldap_2.4.57.bb=
" rel=3D"noreferrer" target=3D"_blank">openldap_2.4.57.bb</a><br>
+++ b/meta-oe/recipes-support/openldap/<a href=3D"http://openldap_2.4.57.bb=
" rel=3D"noreferrer" target=3D"_blank">openldap_2.4.57.bb</a><br>
@@ -24,6 +24,8 @@ SRC_URI =3D &quot;<a href=3D"http://www.openldap.org/soft=
ware/download/OpenLDAP/openldap-release/$" rel=3D"noreferrer" target=3D"_bl=
ank">http://www.openldap.org/software/download/OpenLDAP/openldap-release/$<=
/a><br>
=C2=A0 =C2=A0 =C2=A0file://openldap-CVE-2015-3276.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://remove-user-host-pwd-from-version.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://CVE-2022-29155.patch \<br>
+=C2=A0 =C2=A0 file://CVE-2023-2953-1.patch \<br>
+=C2=A0 =C2=A0 file://CVE-2023-2953-2.patch \<br>
=C2=A0&quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;e3349456c3a66e5e6155be7ddc3f042c&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;c7ba47e1e6ecb5b436f3d43281df57abeffa9926=
2141aec822628bc220f6b45a&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#103107): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/103107" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/103107</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99335615/7301=
997" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/99335615/7301997</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000628ace05fdfe9118--

