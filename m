Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1FD1C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 17:29:41 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web12.8514.1648229380408674634
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Mar 2022 10:29:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Vu1PvalB;
 spf=pass (domain: gmail.com, ip: 209.85.218.49,
 mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id bq8so2766249ejb.10
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Mar 2022 10:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bj7buEMSL6KuphNJYTx9RIiAHoCmhwxEB0d7YdCfp24=;
        b=Vu1PvalBf+ecyVzOVTLoek0lHsHRLyummv9RlEGglQ3gh/G4dzW62QB2Sh4cyEDICS
         O/wcfXeCHZBCnN7hNCqilcl+28dblxmYYAJmnIBHuuvjA2wkVD+SN47gw8nFZOlmb0RS
         gtJFm8HMdqyrU6pUe5Sj4M1HZjBhr2DLo9VJGt9KMZ2gftcFq8gL6CYvQz4rH74X5SOg
         Pxvz2DFnvWkE6DMHtdXnJdfE/RQO9PkYEtiSWT+0CHcBEHm01x4JgdFNZ0pOACXkFdvl
         gm0qhXjqtHbcTl1XhzQy5Pvf8OpdwDhu+qO2d57N38H26Z2sszIyns/ZY4yKHqVsdl/6
         trsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bj7buEMSL6KuphNJYTx9RIiAHoCmhwxEB0d7YdCfp24=;
        b=EJC6N2zHrPHClrjYP30kC8slvZOnttLwb79oP8s/xSNlhovzKg2haxdRd9OM6jlnMl
         6pmNRK7hA0ZXaPyOuyYK7gV/F23yo3+Ntn72a9RLvesgE7TV4emtRASfx1yrTly/PL5Q
         1kv+z74T+nsQ6ZZcxK/VjAZDhSBFqIESp9vzzb+K7LXkb5usMjnSiODjBYw7LF4XcfKZ
         Lm79qzQMPwcqqmcH55c0kGcqaEfgoRjqXevujL0KPQdRHGXdvTyf1rJcAuw6uTSTRP0I
         MHmPIacLzWubSE2fDVVkKQpVHmd5zzakOdmAqRisv1XJwl93qvfBYMUGMOWBbPWGOX9x
         Rm5A==
X-Gm-Message-State: AOAM5300WoTUOnbBnMSVysIbGRfu2s4RjQhYv+4zp1Q88xjcgNqxMi7i
	ac/8ZeHmNFBnZsV+XSl8Hu0ssABbynAuPfs/mHDLXv7D
X-Google-Smtp-Source: 
 ABdhPJz7kdhNaj8pNhZa+FeGgFBJOM5RbQiTsOG2Er3KAQf6AfzijMhA4GyEv4NxbGfXOxyEwbIsvrAEoVhQ7UdYPJw=
X-Received: by 2002:a17:906:1603:b0:6ce:362:c938 with SMTP id
 m3-20020a170906160300b006ce0362c938mr12840739ejd.253.1648229378614; Fri, 25
 Mar 2022 10:29:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220301123043.1084-1-ranjitsinhrathod1991@gmail.com>
In-Reply-To: <20220301123043.1084-1-ranjitsinhrathod1991@gmail.com>
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Date: Fri, 25 Mar 2022 22:59:25 +0530
Message-ID: 
 <CACpMEhM+QJZ-+YREz9JpCXtxXvffV-sXVA=kgWK+7KUJDZpS1A@mail.gmail.com>
Subject: Re: [meta-oe][dunfell][PATCH] polkit: Fix for CVE-2021-4115
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com, Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Content-Type: multipart/alternative; boundary="0000000000009eea1805db0e4e85"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Mar 2022 17:29:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96209

--0000000000009eea1805db0e4e85
Content-Type: text/plain; charset="UTF-8"

May I know by when this fix will be available in the dunfell branch??

I can see it is available in the testing branch since many days.

Thanks,
Ranjitsinh Rathod

On Tue, 1 Mar, 2022, 6:01 pm Ranjitsinh Rathod, <
ranjitsinhrathod1991@gmail.com> wrote:

> From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
>
> Add patch to fix CVE-2021-4115
> Also, add a support patch to cleanly apply CVE patch
> Link: https://gitlab.freedesktop.org/polkit/polkit/-/merge_requests/109
>
> Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
> ---
>  ...thentication-bypass-vulnerability-in.patch | 32 +++++++
>  .../polkit/files/CVE-2021-4115.patch          | 87 +++++++++++++++++++
>  .../recipes-extended/polkit/polkit_0.116.bb   |  2 +
>  3 files changed, 121 insertions(+)
>  create mode 100644
> meta-oe/recipes-extended/polkit/files/0001-GHSL-2021-074-authentication-bypass-vulnerability-in.patch
>  create mode 100644
> meta-oe/recipes-extended/polkit/files/CVE-2021-4115.patch
>
> diff --git
> a/meta-oe/recipes-extended/polkit/files/0001-GHSL-2021-074-authentication-bypass-vulnerability-in.patch
> b/meta-oe/recipes-extended/polkit/files/0001-GHSL-2021-074-authentication-bypass-vulnerability-in.patch
> new file mode 100644
> index 000000000..2a2373ed5
> --- /dev/null
> +++
> b/meta-oe/recipes-extended/polkit/files/0001-GHSL-2021-074-authentication-bypass-vulnerability-in.patch
> @@ -0,0 +1,32 @@
> +From a04d13affe0fa53ff618e07aa8f57f4c0e3b9b81 Mon Sep 17 00:00:00 2001
> +From: Jan Rybar <jrybar@redhat.com>
> +Date: Wed, 2 Jun 2021 15:43:38 +0200
> +Subject: [PATCH] GHSL-2021-074: authentication bypass vulnerability in
> polkit
> +
> +initial values returned if error caught
> +
> +Upstream-Status: Backport [
> https://gitlab.freedesktop.org/polkit/polkit/-/commit/a04d13affe0fa53ff618e07aa8f57f4c0e3b9b81.patch
> ]
> +CVE: CVE-2021-4115
> +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> +
> +---
> + src/polkit/polkitsystembusname.c | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/src/polkit/polkitsystembusname.c
> b/src/polkit/polkitsystembusname.c
> +index 8daa12c..8ed1363 100644
> +--- a/src/polkit/polkitsystembusname.c
> ++++ b/src/polkit/polkitsystembusname.c
> +@@ -435,6 +435,9 @@ polkit_system_bus_name_get_creds_sync
> (PolkitSystemBusName           *system_bus
> +   while (!((data.retrieved_uid && data.retrieved_pid) ||
> data.caught_error))
> +     g_main_context_iteration (tmp_context, TRUE);
> +
> ++  if (data.caught_error)
> ++    goto out;
> ++
> +   if (out_uid)
> +     *out_uid = data.uid;
> +   if (out_pid)
> +--
> +GitLab
> +
> diff --git a/meta-oe/recipes-extended/polkit/files/CVE-2021-4115.patch
> b/meta-oe/recipes-extended/polkit/files/CVE-2021-4115.patch
> new file mode 100644
> index 000000000..37e0d6063
> --- /dev/null
> +++ b/meta-oe/recipes-extended/polkit/files/CVE-2021-4115.patch
> @@ -0,0 +1,87 @@
> +From 41cb093f554da8772362654a128a84dd8a5542a7 Mon Sep 17 00:00:00 2001
> +From: Jan Rybar <jrybar@redhat.com>
> +Date: Mon, 21 Feb 2022 08:29:05 +0000
> +Subject: [PATCH] CVE-2021-4115 (GHSL-2021-077) fix
> +
> +Upstream-Status: Backport [
> https://gitlab.freedesktop.org/polkit/polkit/-/commit/41cb093f554da8772362654a128a84dd8a5542a7.patch
> ]
> +CVE: CVE-2021-4115
> +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> +
> +---
> + src/polkit/polkitsystembusname.c | 38 ++++++++++++++++++++++++++++----
> + 1 file changed, 34 insertions(+), 4 deletions(-)
> +
> +diff --git a/src/polkit/polkitsystembusname.c
> b/src/polkit/polkitsystembusname.c
> +index 8ed1363..2fbf5f1 100644
> +--- a/src/polkit/polkitsystembusname.c
> ++++ b/src/polkit/polkitsystembusname.c
> +@@ -62,6 +62,10 @@ enum
> +   PROP_NAME,
> + };
> +
> ++
> ++guint8 dbus_call_respond_fails;      // has to be global because of
> callback
> ++
> ++
> + static void subject_iface_init (PolkitSubjectIface *subject_iface);
> +
> + G_DEFINE_TYPE_WITH_CODE (PolkitSystemBusName, polkit_system_bus_name,
> G_TYPE_OBJECT,
> +@@ -364,6 +368,7 @@ on_retrieved_unix_uid_pid (GObject              *src,
> +   if (!v)
> +     {
> +       data->caught_error = TRUE;
> ++      dbus_call_respond_fails += 1;
> +     }
> +   else
> +     {
> +@@ -405,6 +410,8 @@ polkit_system_bus_name_get_creds_sync
> (PolkitSystemBusName           *system_bus
> +   tmp_context = g_main_context_new ();
> +   g_main_context_push_thread_default (tmp_context);
> +
> ++  dbus_call_respond_fails = 0;
> ++
> +   /* Do two async calls as it's basically as fast as one sync call.
> +    */
> +   g_dbus_connection_call (connection,
> +@@ -432,11 +439,34 @@ polkit_system_bus_name_get_creds_sync
> (PolkitSystemBusName           *system_bus
> +                         on_retrieved_unix_uid_pid,
> +                         &data);
> +
> +-  while (!((data.retrieved_uid && data.retrieved_pid) ||
> data.caught_error))
> +-    g_main_context_iteration (tmp_context, TRUE);
> ++  while (TRUE)
> ++  {
> ++    /* If one dbus call returns error, we must wait until the other call
> ++     * calls _call_finish(), otherwise fd leak is possible.
> ++     * Resolves: GHSL-2021-077
> ++    */
> +
> +-  if (data.caught_error)
> +-    goto out;
> ++    if ( (dbus_call_respond_fails > 1) )
> ++    {
> ++      // we got two faults, we can leave
> ++      goto out;
> ++    }
> ++
> ++    if ((data.caught_error && (data.retrieved_pid ||
> data.retrieved_uid)))
> ++    {
> ++      // we got one fault and the other call finally finished, we can
> leave
> ++      goto out;
> ++    }
> ++
> ++    if ( !(data.retrieved_uid && data.retrieved_pid) )
> ++    {
> ++      g_main_context_iteration (tmp_context, TRUE);
> ++    }
> ++    else
> ++    {
> ++      break;
> ++    }
> ++  }
> +
> +   if (out_uid)
> +     *out_uid = data.uid;
> +--
> +GitLab
> +
> diff --git a/meta-oe/recipes-extended/polkit/polkit_0.116.bb
> b/meta-oe/recipes-extended/polkit/polkit_0.116.bb
> index 77288b008..aceb68699 100644
> --- a/meta-oe/recipes-extended/polkit/polkit_0.116.bb
> +++ b/meta-oe/recipes-extended/polkit/polkit_0.116.bb
> @@ -26,6 +26,8 @@ SRC_URI = "
> http://www.freedesktop.org/software/polkit/releases/polkit-${PV}.tar.
>             ${@bb.utils.contains('DISTRO_FEATURES', 'pam',
> '${PAM_SRC_URI}', '', d)} \
>             file://0003-make-netgroup-support-optional.patch \
>             file://CVE-2021-4034.patch \
> +
>  file://0001-GHSL-2021-074-authentication-bypass-vulnerability-in.patch \
> +           file://CVE-2021-4115.patch \
>             "
>  SRC_URI[md5sum] = "4b37258583393e83069a0e2e89c0162a"
>  SRC_URI[sha256sum] =
> "88170c9e711e8db305a12fdb8234fac5706c61969b94e084d0f117d8ec5d34b1"
> --
> 2.17.1
>
>

--0000000000009eea1805db0e4e85
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">May I know by when this fix will be available in the dunf=
ell branch??<div dir=3D"auto"><br></div><div dir=3D"auto">I can see it is a=
vailable in the testing branch since many days.</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Thanks,</div><div dir=3D"auto">Ranjitsinh Rathod</d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Tue, 1 Mar, 2022, 6:01 pm Ranjitsinh Rathod, &lt;<a href=3D"mailto:ra=
njitsinhrathod1991@gmail.com">ranjitsinhrathod1991@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">From: Ranjitsinh Rathod &lt;<a hre=
f=3D"mailto:ranjitsinh.rathod@kpit.com" target=3D"_blank" rel=3D"noreferrer=
">ranjitsinh.rathod@kpit.com</a>&gt;<br>
<br>
Add patch to fix CVE-2021-4115<br>
Also, add a support patch to cleanly apply CVE patch<br>
Link: <a href=3D"https://gitlab.freedesktop.org/polkit/polkit/-/merge_reque=
sts/109" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gitlab.fre=
edesktop.org/polkit/polkit/-/merge_requests/109</a><br>
<br>
Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rathod@kp=
it.com" target=3D"_blank" rel=3D"noreferrer">ranjitsinh.rathod@kpit.com</a>=
&gt;<br>
Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinhrathod1991=
@gmail.com" target=3D"_blank" rel=3D"noreferrer">ranjitsinhrathod1991@gmail=
.com</a>&gt;<br>
---<br>
=C2=A0...thentication-bypass-vulnerability-in.patch | 32 +++++++<br>
=C2=A0.../polkit/files/CVE-2021-4115.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 87 +++++++++++++++++++<br>
=C2=A0.../recipes-extended/polkit/<a href=3D"http://polkit_0.116.bb" rel=3D=
"noreferrer noreferrer" target=3D"_blank">polkit_0.116.bb</a>=C2=A0 =C2=A0|=
=C2=A0 2 +<br>
=C2=A03 files changed, 121 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/polkit/files/0001-GHSL-20=
21-074-authentication-bypass-vulnerability-in.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/polkit/files/CVE-2021-411=
5.patch<br>
<br>
diff --git a/meta-oe/recipes-extended/polkit/files/0001-GHSL-2021-074-authe=
ntication-bypass-vulnerability-in.patch b/meta-oe/recipes-extended/polkit/f=
iles/0001-GHSL-2021-074-authentication-bypass-vulnerability-in.patch<br>
new file mode 100644<br>
index 000000000..2a2373ed5<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-extended/polkit/files/0001-GHSL-2021-074-authenticati=
on-bypass-vulnerability-in.patch<br>
@@ -0,0 +1,32 @@<br>
+From a04d13affe0fa53ff618e07aa8f57f4c0e3b9b81 Mon Sep 17 00:00:00 2001<br>
+From: Jan Rybar &lt;<a href=3D"mailto:jrybar@redhat.com" target=3D"_blank"=
 rel=3D"noreferrer">jrybar@redhat.com</a>&gt;<br>
+Date: Wed, 2 Jun 2021 15:43:38 +0200<br>
+Subject: [PATCH] GHSL-2021-074: authentication bypass vulnerability in pol=
kit<br>
+<br>
+initial values returned if error caught<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://gitlab.freedesktop.org/polki=
t/polkit/-/commit/a04d13affe0fa53ff618e07aa8f57f4c0e3b9b81.patch" rel=3D"no=
referrer noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/polki=
t/polkit/-/commit/a04d13affe0fa53ff618e07aa8f57f4c0e3b9b81.patch</a>]<br>
+CVE: CVE-2021-4115<br>
+Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rathod@k=
pit.com" target=3D"_blank" rel=3D"noreferrer">ranjitsinh.rathod@kpit.com</a=
>&gt;<br>
+<br>
+---<br>
+ src/polkit/polkitsystembusname.c | 3 +++<br>
+ 1 file changed, 3 insertions(+)<br>
+<br>
+diff --git a/src/polkit/polkitsystembusname.c b/src/polkit/polkitsystembus=
name.c<br>
+index 8daa12c..8ed1363 100644<br>
+--- a/src/polkit/polkitsystembusname.c<br>
++++ b/src/polkit/polkitsystembusname.c<br>
+@@ -435,6 +435,9 @@ polkit_system_bus_name_get_creds_sync (PolkitSystemBus=
Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*system_bus<br>
+=C2=A0 =C2=A0while (!((data.retrieved_uid &amp;&amp; data.retrieved_pid) |=
| data.caught_error))<br>
+=C2=A0 =C2=A0 =C2=A0g_main_context_iteration (tmp_context, TRUE);<br>
+ <br>
++=C2=A0 if (data.caught_error)<br>
++=C2=A0 =C2=A0 goto out;<br>
++<br>
+=C2=A0 =C2=A0if (out_uid)<br>
+=C2=A0 =C2=A0 =C2=A0*out_uid =3D data.uid;<br>
+=C2=A0 =C2=A0if (out_pid)<br>
+-- <br>
+GitLab<br>
+<br>
diff --git a/meta-oe/recipes-extended/polkit/files/CVE-2021-4115.patch b/me=
ta-oe/recipes-extended/polkit/files/CVE-2021-4115.patch<br>
new file mode 100644<br>
index 000000000..37e0d6063<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-extended/polkit/files/CVE-2021-4115.patch<br>
@@ -0,0 +1,87 @@<br>
+From 41cb093f554da8772362654a128a84dd8a5542a7 Mon Sep 17 00:00:00 2001<br>
+From: Jan Rybar &lt;<a href=3D"mailto:jrybar@redhat.com" target=3D"_blank"=
 rel=3D"noreferrer">jrybar@redhat.com</a>&gt;<br>
+Date: Mon, 21 Feb 2022 08:29:05 +0000<br>
+Subject: [PATCH] CVE-2021-4115 (GHSL-2021-077) fix<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://gitlab.freedesktop.org/polki=
t/polkit/-/commit/41cb093f554da8772362654a128a84dd8a5542a7.patch" rel=3D"no=
referrer noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/polki=
t/polkit/-/commit/41cb093f554da8772362654a128a84dd8a5542a7.patch</a>]<br>
+CVE: CVE-2021-4115<br>
+Signed-off-by: Ranjitsinh Rathod &lt;<a href=3D"mailto:ranjitsinh.rathod@k=
pit.com" target=3D"_blank" rel=3D"noreferrer">ranjitsinh.rathod@kpit.com</a=
>&gt;<br>
+<br>
+---<br>
+ src/polkit/polkitsystembusname.c | 38 ++++++++++++++++++++++++++++----<br=
>
+ 1 file changed, 34 insertions(+), 4 deletions(-)<br>
+<br>
+diff --git a/src/polkit/polkitsystembusname.c b/src/polkit/polkitsystembus=
name.c<br>
+index 8ed1363..2fbf5f1 100644<br>
+--- a/src/polkit/polkitsystembusname.c<br>
++++ b/src/polkit/polkitsystembusname.c<br>
+@@ -62,6 +62,10 @@ enum<br>
+=C2=A0 =C2=A0PROP_NAME,<br>
+ };<br>
+ <br>
++<br>
++guint8 dbus_call_respond_fails;=C2=A0 =C2=A0 =C2=A0 // has to be global b=
ecause of callback<br>
++<br>
++<br>
+ static void subject_iface_init (PolkitSubjectIface *subject_iface);<br>
+ <br>
+ G_DEFINE_TYPE_WITH_CODE (PolkitSystemBusName, polkit_system_bus_name, G_T=
YPE_OBJECT,<br>
+@@ -364,6 +368,7 @@ on_retrieved_unix_uid_pid (GObject=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *src,<br>
+=C2=A0 =C2=A0if (!v)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;caught_error =3D TRUE;<br>
++=C2=A0 =C2=A0 =C2=A0 dbus_call_respond_fails +=3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+@@ -405,6 +410,8 @@ polkit_system_bus_name_get_creds_sync (PolkitSystemBus=
Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*system_bus<br>
+=C2=A0 =C2=A0tmp_context =3D g_main_context_new ();<br>
+=C2=A0 =C2=A0g_main_context_push_thread_default (tmp_context);<br>
+ <br>
++=C2=A0 dbus_call_respond_fails =3D 0;<br>
++<br>
+=C2=A0 =C2=A0/* Do two async calls as it&#39;s basically as fast as one sy=
nc call.<br>
+=C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0g_dbus_connection_call (connection,<br>
+@@ -432,11 +439,34 @@ polkit_system_bus_name_get_creds_sync (PolkitSystemB=
usName=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*system_bus<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0on_retrieved_unix_uid_pid,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&amp;data);<br>
+ <br>
+-=C2=A0 while (!((data.retrieved_uid &amp;&amp; data.retrieved_pid) || dat=
a.caught_error))<br>
+-=C2=A0 =C2=A0 g_main_context_iteration (tmp_context, TRUE);<br>
++=C2=A0 while (TRUE)<br>
++=C2=A0 {<br>
++=C2=A0 =C2=A0 /* If one dbus call returns error, we must wait until the o=
ther call<br>
++=C2=A0 =C2=A0 =C2=A0* calls _call_finish(), otherwise fd leak is possible=
.<br>
++=C2=A0 =C2=A0 =C2=A0* Resolves: GHSL-2021-077<br>
++=C2=A0 =C2=A0 */<br>
+ <br>
+-=C2=A0 if (data.caught_error)<br>
+-=C2=A0 =C2=A0 goto out;<br>
++=C2=A0 =C2=A0 if ( (dbus_call_respond_fails &gt; 1) )<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 // we got two faults, we can leave<br>
++=C2=A0 =C2=A0 =C2=A0 goto out;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 if ((data.caught_error &amp;&amp; (data.retrieved_pid || da=
ta.retrieved_uid)))<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 // we got one fault and the other call finally finis=
hed, we can leave<br>
++=C2=A0 =C2=A0 =C2=A0 goto out;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 if ( !(data.retrieved_uid &amp;&amp; data.retrieved_pid) )<=
br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 g_main_context_iteration (tmp_context, TRUE);<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 }<br>
+ <br>
+=C2=A0 =C2=A0if (out_uid)<br>
+=C2=A0 =C2=A0 =C2=A0*out_uid =3D data.uid;<br>
+-- <br>
+GitLab<br>
+<br>
diff --git a/meta-oe/recipes-extended/polkit/<a href=3D"http://polkit_0.116=
.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">polkit_0.116.bb</a> b/=
meta-oe/recipes-extended/polkit/<a href=3D"http://polkit_0.116.bb" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">polkit_0.116.bb</a><br>
index 77288b008..aceb68699 100644<br>
--- a/meta-oe/recipes-extended/polkit/<a href=3D"http://polkit_0.116.bb" re=
l=3D"noreferrer noreferrer" target=3D"_blank">polkit_0.116.bb</a><br>
+++ b/meta-oe/recipes-extended/polkit/<a href=3D"http://polkit_0.116.bb" re=
l=3D"noreferrer noreferrer" target=3D"_blank">polkit_0.116.bb</a><br>
@@ -26,6 +26,8 @@ SRC_URI =3D &quot;<a href=3D"http://www.freedesktop.org/s=
oftware/polkit/releases/polkit-$%7BPV%7D.tar" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">http://www.freedesktop.org/software/polkit/releases/polk=
it-${PV}.tar</a>.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_=
FEATURES&#39;, &#39;pam&#39;, &#39;${PAM_SRC_URI}&#39;, &#39;&#39;, d)} \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-make-netgroup-support=
-optional.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2021-4034.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-GHSL-2021-074-authent=
ication-bypass-vulnerability-in.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2021-4115.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;4b37258583393e83069a0e2e89c0162a&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;88170c9e711e8db305a12fdb8234fac5706c6196=
9b94e084d0f117d8ec5d34b1&quot;<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div>

--0000000000009eea1805db0e4e85--

