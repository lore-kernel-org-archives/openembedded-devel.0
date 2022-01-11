Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33BB6C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 16:27:45 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web09.9874.1641918463798958238
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 08:27:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SF1WlOmf;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id kc16so18966900qvb.3
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 08:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZWzvFZZIA9iYnRrNMSRy+ziWvHWWjK4+byIPtTqarjY=;
        b=SF1WlOmfW8rnwmU+RLK/lAilXJlJJaJYMQf7eHnXdZyBPkoVPQWWinr6a6vnHRX7iZ
         g2YQqmGmVDsTKHV8pRm+eTMrUyu+vNlgnXNINUsa64M+NchP5/DmQoXGmkJseK7nW/jx
         roKrAXPROgDAOB8WCMDQTPYHvIDE77zYVxoACpQZnNwpUUXvpNyzR1DSnKf70/V+XRPh
         Vqe4xpaIMQLz3Plvp2v/f4A3qzwUJSkVySlm374CjawCvXN5yZMs+Cij9sUxG9abgRPo
         T+54o8hST0tzos0LEg0jRg/0Wj3VEQXp+lxPVW6jC7gE/EGldwDyvZp2JxAIDseysJ2g
         A0vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZWzvFZZIA9iYnRrNMSRy+ziWvHWWjK4+byIPtTqarjY=;
        b=PknhGP+aM8drzD4dZogpoAYMlnpIRKuj1Md87hsotwsmyCs4s81/+GeRW04wvmo2P4
         ahu/xfCX9Tas/eB1GljRxKq8bFMKq7wrc5PMTgCs1yTwwEIYBvo0HC07r45UgylJmN9N
         CEBl7j3L0QQUK3DOFRUi6CQPOr1AKRXk1TLHPF9QjwiFUPwJDw6vufE5dBDIXvUgcD7f
         WXiH0hLhzAWvwxYBpP/W11Wlo09V89rUryYEnRxhqVRONAW+FGk7j3srAjc8q2tIdwcE
         OVigUvtCTES6ggSFuLVtshOFUkG6J1dfzCstnWxd0SRjvfZiwtuHw6rJxNZy3r4i9r1S
         2SjA==
X-Gm-Message-State: AOAM531i13WhQ/00a07e++qPmyxekRllmUdIRAfaZogpuYusGkPvFtrE
	/qNVOWCLNsutqZfWrefc71R9gLw5Pc1OjEvqVQ8=
X-Google-Smtp-Source: 
 ABdhPJzWu0UQRNNGVlKSlkwefmTX9BiADFsuuBT0YL/NXsufOgwRzd3079dkId1AB6bmMMNk4PleHJpXnP93k2fnmzw=
X-Received: by 2002:a05:6214:268e:: with SMTP id
 gm14mr4452378qvb.24.1641918462801;
 Tue, 11 Jan 2022 08:27:42 -0800 (PST)
MIME-Version: 1.0
References: <20220111134202.9622-1-ubely@ilbers.de>
In-Reply-To: <20220111134202.9622-1-ubely@ilbers.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Jan 2022 08:27:32 -0800
Message-ID: 
 <CAMKF1spQJzs5zipTtG_CeMXxGLJbRCMN3dA1fth52wT54YNEpQ@mail.gmail.com>
Subject: Re: [oe] [PATCH v2] buildstats: support of custom disk usage command
To: Uladzimir Bely <ubely@ilbers.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b9c21205d550ee29"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jan 2022 16:27:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94750

--000000000000b9c21205d550ee29
Content-Type: text/plain; charset="UTF-8"

Thanks for this patch however it needs to be sent to openembedded-core
mailing list

On Tue, Jan 11, 2022 at 5:42 AM Uladzimir Bely <ubely@ilbers.de> wrote:

> This helps to make buildstats code usage easier in third-party
> projects like Isar (https://github.com/ilbers/isar/). In Isar
> rootfs is created using 'sudo' and some subpaths like '/proc'
> may be mounted. So, "du -sh" on rootfs produces incorrect result
> with  multiple 'Permission denied' warnings.
>
> Customizable disk usage command allows to deal with these issues
> (e.g., "-x" option or "sudo" can be added) in such cases.
>
> Signed-off-by: Uladzimir Bely <ubely@ilbers.de>
> ---
> Changes in v2:
> - Removed wrong [meta-oe] prefix from previously sent patch
>
>  meta/classes/buildstats.bbclass | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/buildstats.bbclass
> b/meta/classes/buildstats.bbclass
> index 0de605200a..9f80cbd75c 100644
> --- a/meta/classes/buildstats.bbclass
> +++ b/meta/classes/buildstats.bbclass
> @@ -8,6 +8,8 @@ BUILDSTATS_BASE = "${TMPDIR}/buildstats/"
>  #
>
>  ################################################################################
>
> +BUILDSTATS_DISK_USAGE_CMD ??= "du -sh"
> +
>  def get_buildprocess_cputime(pid):
>      with open("/proc/%d/stat" % pid, "r") as f:
>          fields = f.readline().rstrip().split()
> @@ -244,7 +246,8 @@ python run_buildstats () {
>                  rootfs = d.getVar('IMAGE_ROOTFS')
>                  if os.path.isdir(rootfs):
>                      try:
> -                        rootfs_size = subprocess.check_output(["du",
> "-sh", rootfs],
> +                        rootfs_size = subprocess.check_output(
> +
> d.getVar('BUILDSTATS_DISK_USAGE_CMD').split() + [rootfs],
>                                  stderr=subprocess.STDOUT).decode('utf-8')
>                          f.write("Uncompressed Rootfs size: %s" %
> rootfs_size)
>                      except subprocess.CalledProcessError as err:
> --
> 2.20.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94745):
> https://lists.openembedded.org/g/openembedded-devel/message/94745
> Mute This Topic: https://lists.openembedded.org/mt/88348508/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000b9c21205d550ee29
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks for this patch however it needs to be sent to open=
embedded-core mailing list=C2=A0</div><div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 11, 2022 at 5:42 AM Uladzi=
mir Bely &lt;<a href=3D"mailto:ubely@ilbers.de">ubely@ilbers.de</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">This helps to make buildstats c=
ode usage easier in third-party<br>
projects like Isar (<a href=3D"https://github.com/ilbers/isar/" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/ilbers/isar/</a>). In Isar<br>
rootfs is created using &#39;sudo&#39; and some subpaths like &#39;/proc&#3=
9;<br>
may be mounted. So, &quot;du -sh&quot; on rootfs produces incorrect result<=
br>
with=C2=A0 multiple &#39;Permission denied&#39; warnings.<br>
<br>
Customizable disk usage command allows to deal with these issues<br>
(e.g., &quot;-x&quot; option or &quot;sudo&quot; can be added) in such case=
s.<br>
<br>
Signed-off-by: Uladzimir Bely &lt;<a href=3D"mailto:ubely@ilbers.de" target=
=3D"_blank">ubely@ilbers.de</a>&gt;<br>
---<br>
Changes in v2:<br>
- Removed wrong [meta-oe] prefix from previously sent patch<br>
<br>
=C2=A0meta/classes/buildstats.bbclass | 5 ++++-<br>
=C2=A01 file changed, 4 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbcl=
ass<br>
index 0de605200a..9f80cbd75c 100644<br>
--- a/meta/classes/buildstats.bbclass<br>
+++ b/meta/classes/buildstats.bbclass<br>
@@ -8,6 +8,8 @@ BUILDSTATS_BASE =3D &quot;${TMPDIR}/buildstats/&quot;<br>
=C2=A0#<br>
=C2=A0#####################################################################=
###########<br>
<br>
+BUILDSTATS_DISK_USAGE_CMD ??=3D &quot;du -sh&quot;<br>
+<br>
=C2=A0def get_buildprocess_cputime(pid):<br>
=C2=A0 =C2=A0 =C2=A0with open(&quot;/proc/%d/stat&quot; % pid, &quot;r&quot=
;) as f:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fields =3D f.readline().rstrip().split()<=
br>
@@ -244,7 +246,8 @@ python run_buildstats () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rootfs =3D d.=
getVar(&#39;IMAGE_ROOTFS&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.is=
dir(rootfs):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0try:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 rootfs_size =3D subprocess.check_output([&quot;du&quot;, &quot;-=
sh&quot;, rootfs],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 rootfs_size =3D subprocess.check_output(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.getVar(&#39;BUILDSTATS_DISK_USAGE_=
CMD&#39;).split() + [rootfs],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stderr=3Dsubprocess.STDOUT).de=
code(&#39;utf-8&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0f.write(&quot;Uncompressed Rootfs size: %s&quot; % rootfs_=
size)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0except subprocess.CalledProcessError as err:<br>
-- <br>
2.20.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#94745): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/94745" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/94745</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88348508/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/88348508/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000b9c21205d550ee29--

