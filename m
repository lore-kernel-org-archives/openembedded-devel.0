Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B0FC433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 00:44:18 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web09.5073.1645145057539739967
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Feb 2022 16:44:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f7RrDcHE;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id a28so11698005qvb.10
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Feb 2022 16:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K+dPDERMR58IMPFhHspnhM9Z37h3zt+ASkFjJx3L+ZE=;
        b=f7RrDcHE0gMZ7K+CBlHS13pX2B4dhDiVL4ScBlL7gXfBCOt8wy75xMY9xmngA0UFgX
         HYipBCeEw0WL09I2ainZ8Dgq9Ksvy+evl7qpTojQj4b5xJXLIR17NBhcXnYturhYQmhl
         h6gFH5MdIZWwWGwqsa77N89ocQZadd9uMO8OcxezMJP30paycBtVt23WFSRfBTAtNjqv
         BjOsBDdpUKzu4wCjdiwAS5wenZ/V5xExvxy/rPUWheoewe1zOEyhMXe65iW0o4r9+/Jo
         4URQ7a/GgQHu4lT3JE5C4vYCf/eRCsw7EVU9XRhSS6ne50vhfmt1qqd23INkBC6RnNu/
         vsjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K+dPDERMR58IMPFhHspnhM9Z37h3zt+ASkFjJx3L+ZE=;
        b=QDkZa1+TNoNLmHxUXk/0GqIM8soTMFgD54g6AGYN52aFbi8cP1jeISLYt+6ZoMo+Bz
         PmDoastb6dMf6c5e7J4vdnrMbMa/H1MOe/HUs95Kdrdxn3g/e2qCRCXTsPC/v64Sf7Of
         i6lzuthlMi7xm8N//v4zyM/ZkiDY6JnUUKdfQFLIAuXtZ+LNlJ+IZMVIcfFFrpA27B2r
         4S+KANGfF3b1UoegmO7Ave6DoBP9zJvL0A//IIsFO1mO/dU0C6ZpNAzipL0DYWGIhTIX
         5irqAAY3RrJLS3tYI2MsDWnLefjJNpFetiRICLjv5Ak05WHHyCMoDPzmWwbnUnnwuAFW
         9uKA==
X-Gm-Message-State: AOAM533jyWKzOawwF7JQV5RG+Wg6FL86FPORI9qLblRhImAxV6JyL0IR
	aLW4HwW+TKmHLjwLNy/MyLiN3n+F3ek8+mbbvPc=
X-Google-Smtp-Source: 
 ABdhPJwuPjED18XF1bOanEKlwiE5DFl2bkEPYk6mEnCvuw8VAlCFYlh6mJu9NB127fc2Dld2+fKT2iEFn0xz8FudeOo=
X-Received: by 2002:ac8:6ecc:0:b0:2d2:5e75:b28a with SMTP id
 f12-20020ac86ecc000000b002d25e75b28amr4855035qtv.330.1645145056500; Thu, 17
 Feb 2022 16:44:16 -0800 (PST)
MIME-Version: 1.0
References: <20220216165722.25908-1-f_l_k@t-online.de>
 <CAMKF1sqA_Dryp--gMJtnbNtKgbzQ1KCJL31q_ptT54SOG0Ao3g@mail.gmail.com>
 <16D4815E2CBA08CD.19478@lists.openembedded.org>
 <16D4824B2C83E660.30488@lists.openembedded.org>
 <d4f68a6f-547b-dcc2-683f-bb0a4f4195fe@t-online.de>
 <CAMKF1srEf0wQneiNKUqc-2sjqaBjR+KkG6WA3dw_Y7Y6tcj=2w@mail.gmail.com>
 <CAMKF1srtFoy3-xf4UGRYmSveJAJ-ULmDqEtdO-TQUGj2FUAh8w@mail.gmail.com>
 <72d17fbe-1aea-f219-52aa-dbece3d434d8@t-online.de>
In-Reply-To: <72d17fbe-1aea-f219-52aa-dbece3d434d8@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Feb 2022 16:44:05 -0800
Message-ID: 
 <CAMKF1spwJ2ny9pbY8yzZNzgnQERKXVpfJEmxp9memA4w=RZS5Q@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] seahorse: initial add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b25daf05d8402e0d"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Feb 2022 00:44:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95366

--000000000000b25daf05d8402e0d
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 17, 2022 at 4:42 PM Markus Volk <f_l_k@t-online.de> wrote:

> building openssh-native fails on my machine with:
>
> ERROR: Nothing PROVIDES 'libpam-native' (but
> virtual:native:/home/flk/build/poky/meta/recipes-connectivity/openssh/
> openssh_8.8p1.bb
> DEPENDS on or otherwise requires it)
> libpam-native was skipped: missing required distro feature 'pam' (not in
> DISTRO_FEATURES)
> ERROR: Required build target 'openssh-native' has no buildable providers.
> Missing or unbuildable dependency chain was: ['openssh-native',
> 'libpam-native']


Yeah it will be a long trail

>
>
> 'pam' is in DISTRO_FEATURES
>
> This only happens if openssh was built with pam support, but thats kind
> of an issue.
>
> Am 17.02.22 um 23:54 schrieb Khem Raj:
> > On Thu, Feb 17, 2022 at 11:04 AM Khem Raj <raj.khem@gmail.com> wrote:
> >> On Thu, Feb 17, 2022 at 12:17 AM Markus Volk <f_l_k@t-online.de> wrote:
> >>> Apologies. Caused by my testing I had a lingering symlink to ssh-keygen
> >>> in ${TMP}/hosttools. Therefore, I did not have a build error. Since
> >>> 'ssh' is in hosttools, maybe it would be best to add 'ssh-keygen' as
> well?
> >>>
> >>> Without building openssh-native, the only other way I could think of
> >>> would be to use a hardcoded path like this:
> >> adding dependency on openssh-native is ok here.
> > that also needs to enhance openssh recipe, on fedora and debian both
> > ssh and ssh-keygen come from same package, so perhaps unblocking it
> > for build host might be also equally good solution. Please propose
> > needed changes for oe-core first and then see whichever is acceptable
> > way resend this patch once dependencies are accepted in core.
> >
> >>> +--- a/meson.build       2022-02-17 09:03:00.081459067 +0100
> >>> ++++ b/meson.build       2022-02-17 09:02:34.321668809 +0100
> >>> +@@ -44,7 +44,7 @@
> >>> + libpwquality = dependency('pwquality')
> >>> + posix = valac.find_library('posix')
> >>> + ssh_bin = find_program('ssh')
> >>> +-ssh_keygen = find_program('ssh-keygen')
> >>> ++ssh_keygen = find_program('/usr/bin/ssh-keygen')
> >>> + gpg_bin = find_program('gpg2', 'gpg', required:
> get_option('pgp-support'))
> >>> + gpgme_dep = dependency('gpgme', version: '>= 1.14.0', required:
> >>> get_option('pgp-support'))
> >>> +
> >>> +
> >>>
> >>>
> >>> Am 17.02.22 um 08:29 schrieb Markus Volk:
> >>>> Maybe i'm not running into this because i have this in my config ?
> >>>>
> >>>> IMAGE_FEATURES += " ssh-server-openssh"
> >>>>
> >>>> Am 17.02.22 um 08:13 schrieb Markus Volk:
> >>>>> That's strange. I have this error only without using
> >>>>> meson-build-dont-look-for-native-ssh-keygen.patch
> >>>>>
> >>>>>
> >>>>> Native ssh Dependency is fullfilled because we have it in HOSTTOOLS,
> >>>>> probably because the machine fails to build openssh-native. But we
> >>>>> dont provide native ssh-keygen. Adding it to hosttools would help to
> >>>>> fix the issue.
> >>>>> Does it help to add 'openssh' to depends ?
> >>>>>
> >>>>> Am 17.02.22 um 07:59 schrieb Khem Raj:
> >>>>>> seeing configure failure
> >>>>>> https://errors.yoctoproject.org/Errors/Details/625735/
> >>>>>>
> >>>>>> On Wed, Feb 16, 2022 at 8:57 AM Markus Volk <f_l_k@t-online.de>
> wrote:
> >>>>>>> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> >>>>>>> ---
> >>>>>>>    ...uild-dont-look-for-native-ssh-keygen.patch | 15 +++++++++++
> >>>>>>>    .../recipes-gnome/seahorse/seahorse_41.0.bb   | 27
> >>>>>>> +++++++++++++++++++
> >>>>>>>    2 files changed, 42 insertions(+)
> >>>>>>>    create mode 100644
> >>>>>>>
> meta-gnome/recipes-gnome/seahorse/seahorse/meson-build-dont-look-for-native-ssh-keygen.patch
> >>>>>>>    create mode 100644
> >>>>>>> meta-gnome/recipes-gnome/seahorse/seahorse_41.0.bb
> >>>>>>>
> >>>>>>> diff --git
> >>>>>>>
> a/meta-gnome/recipes-gnome/seahorse/seahorse/meson-build-dont-look-for-native-ssh-keygen.patch
> >>>>>>>
> b/meta-gnome/recipes-gnome/seahorse/seahorse/meson-build-dont-look-for-native-ssh-keygen.patch
> >>>>>>>
> >>>>>>> new file mode 100644
> >>>>>>> index 000000000..ac83de486
> >>>>>>> --- /dev/null
> >>>>>>> +++
> >>>>>>>
> b/meta-gnome/recipes-gnome/seahorse/seahorse/meson-build-dont-look-for-native-ssh-keygen.patch
> >>>>>>> @@ -0,0 +1,15 @@
> >>>>>>> +From: Markus Volk <f_l_k@t-online.de>
> >>>>>>> +Date: Tue, 16 Feb 2022 10:38:04 +0100
> >>>>>>> +Subject: [PATCH] meson.build: dont look for native ssh-keygen
> >>>>>>> +
> >>>>>>> +--- a/meson.build      2022-02-16 10:38:04.170081321 +0100
> >>>>>>> ++++ b/meson.build      2022-02-16 10:38:28.257864179 +0100
> >>>>>>> +@@ -44,7 +44,7 @@
> >>>>>>> + libpwquality = dependency('pwquality')
> >>>>>>> + posix = valac.find_library('posix')
> >>>>>>> + ssh_bin = find_program('ssh')
> >>>>>>> +-ssh_keygen = find_program('ssh-keygen')
> >>>>>>> ++ssh_keygen = find_program('ssh-keygen', native : false)
> >>>>>>> + gpg_bin = find_program('gpg2', 'gpg', required:
> >>>>>>> get_option('pgp-support'))
> >>>>>>> + gpgme_dep = dependency('gpgme', version: '>= 1.14.0', required:
> >>>>>>> get_option('pgp-support'))
> >>>>>>> +
> >>>>>>> diff --git a/meta-gnome/recipes-gnome/seahorse/seahorse_41.0.bb
> >>>>>>> b/meta-gnome/recipes-gnome/seahorse/seahorse_41.0.bb
> >>>>>>> new file mode 100644
> >>>>>>> index 000000000..ec1328598
> >>>>>>> --- /dev/null
> >>>>>>> +++ b/meta-gnome/recipes-gnome/seahorse/seahorse_41.0.bb
> >>>>>>> @@ -0,0 +1,27 @@
> >>>>>>> +SUMMARY = "Seahorse is a graphical interface for managing and
> >>>>>>> using encryption keys."
> >>>>>>> +LICENSE="GPLv2"
> >>>>>>> +LIC_FILES_CHKSUM =
> >>>>>>> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> >>>>>>> +
> >>>>>>> +GNOMEBASEBUILDCLASS = "meson"
> >>>>>>> +
> >>>>>>> +DEPENDS = " \
> >>>>>>> +    avahi \
> >>>>>>> +    gcr \
> >>>>>>> +    glib-2.0 \
> >>>>>>> +    gnupg \
> >>>>>>> +    gpgme \
> >>>>>>> +    gtk+3 \
> >>>>>>> +    libhandy \
> >>>>>>> +    libpwquality \
> >>>>>>> +    libsecret \
> >>>>>>> +    libsoup-2.4 \
> >>>>>>> +    openldap \
> >>>>>>> +"
> >>>>>>> +
> >>>>>>> +inherit gnomebase itstool vala
> >>>>>>> +
> >>>>>>> +SRC_URI:append = "
> >>>>>>> file://meson-build-dont-look-for-native-ssh-keygen.patch"
> >>>>>>> +SRC_URI[archive.sha256sum] =
> >>>>>>> "e6eec09e810448295f547f18c1d5772b65c3edc1d9e5a2595f10b5dde68929f5"
> >>>>>>> +
> >>>>>>> +FILES:${PN} += "${datadir}"
> >>>>>>> +
> >>>>>>> --
> >>>>>>> 2.25.1
> >>>>>>>
> >>>>>>>
> >>>>>>>
> >>>>>>>
> >>>>>
> >>>>>
> >>>>
> >>>>
> >>>
> >>>
> >>>
> >>>
> >>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95365):
> https://lists.openembedded.org/g/openembedded-devel/message/95365
> Mute This Topic: https://lists.openembedded.org/mt/89189799/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000b25daf05d8402e0d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Feb 17, 2022 at 4:42 PM Markus Volk &lt;<a href=3D"=
mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">building openssh-native fails on my machine with:<b=
r>
<br>
ERROR: Nothing PROVIDES &#39;libpam-native&#39; (but <br>
virtual:native:/home/flk/build/poky/meta/recipes-connectivity/openssh/<a hr=
ef=3D"http://openssh_8.8p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh=
_8.8p1.bb</a> <br>
DEPENDS on or otherwise requires it)<br>
libpam-native was skipped: missing required distro feature &#39;pam&#39; (n=
ot in <br>
DISTRO_FEATURES)<br>
ERROR: Required build target &#39;openssh-native&#39; has no buildable prov=
iders.<br>
Missing or unbuildable dependency chain was: [&#39;openssh-native&#39;, <br=
>
&#39;libpam-native&#39;]</blockquote><div dir=3D"auto"><br></div><div dir=
=3D"auto">Yeah it will be a long trail=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex" dir=3D"auto"><br>
<br>
&#39;pam&#39; is in DISTRO_FEATURES<br>
<br>
This only happens if openssh was built with pam support, but thats kind <br=
>
of an issue.<br>
<br>
Am 17.02.22 um 23:54 schrieb Khem Raj:<br>
&gt; On Thu, Feb 17, 2022 at 11:04 AM Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt; On Thu, Feb 17, 2022 at 12:17 AM Markus Volk &lt;<a href=3D"mailto=
:f_l_k@t-online.de" target=3D"_blank">f_l_k@t-online.de</a>&gt; wrote:<br>
&gt;&gt;&gt; Apologies. Caused by my testing I had a lingering symlink to s=
sh-keygen<br>
&gt;&gt;&gt; in ${TMP}/hosttools. Therefore, I did not have a build error. =
Since<br>
&gt;&gt;&gt; &#39;ssh&#39; is in hosttools, maybe it would be best to add &=
#39;ssh-keygen&#39; as well?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Without building openssh-native, the only other way I could th=
ink of<br>
&gt;&gt;&gt; would be to use a hardcoded path like this:<br>
&gt;&gt; adding dependency on openssh-native is ok here.<br>
&gt; that also needs to enhance openssh recipe, on fedora and debian both<b=
r>
&gt; ssh and ssh-keygen come from same package, so perhaps unblocking it<br=
>
&gt; for build host might be also equally good solution. Please propose<br>
&gt; needed changes for oe-core first and then see whichever is acceptable<=
br>
&gt; way resend this patch once dependencies are accepted in core.<br>
&gt;<br>
&gt;&gt;&gt; +--- a/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A02022-02-17 09:03:=
00.081459067 +0100<br>
&gt;&gt;&gt; ++++ b/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A02022-02-17 09:02:=
34.321668809 +0100<br>
&gt;&gt;&gt; +@@ -44,7 +44,7 @@<br>
&gt;&gt;&gt; + libpwquality =3D dependency(&#39;pwquality&#39;)<br>
&gt;&gt;&gt; + posix =3D valac.find_library(&#39;posix&#39;)<br>
&gt;&gt;&gt; + ssh_bin =3D find_program(&#39;ssh&#39;)<br>
&gt;&gt;&gt; +-ssh_keygen =3D find_program(&#39;ssh-keygen&#39;)<br>
&gt;&gt;&gt; ++ssh_keygen =3D find_program(&#39;/usr/bin/ssh-keygen&#39;)<b=
r>
&gt;&gt;&gt; + gpg_bin =3D find_program(&#39;gpg2&#39;, &#39;gpg&#39;, requ=
ired: get_option(&#39;pgp-support&#39;))<br>
&gt;&gt;&gt; + gpgme_dep =3D dependency(&#39;gpgme&#39;, version: &#39;&gt;=
=3D 1.14.0&#39;, required:<br>
&gt;&gt;&gt; get_option(&#39;pgp-support&#39;))<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Am 17.02.22 um 08:29 schrieb Markus Volk:<br>
&gt;&gt;&gt;&gt; Maybe i&#39;m not running into this because i have this in=
 my config ?<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; IMAGE_FEATURES +=3D &quot; ssh-server-openssh&quot;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Am 17.02.22 um 08:13 schrieb Markus Volk:<br>
&gt;&gt;&gt;&gt;&gt; That&#39;s strange. I have this error only without usi=
ng<br>
&gt;&gt;&gt;&gt;&gt; meson-build-dont-look-for-native-ssh-keygen.patch<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Native ssh Dependency is fullfilled because we have it=
 in HOSTTOOLS,<br>
&gt;&gt;&gt;&gt;&gt; probably because the machine fails to build openssh-na=
tive. But we<br>
&gt;&gt;&gt;&gt;&gt; dont provide native ssh-keygen. Adding it to hosttools=
 would help to<br>
&gt;&gt;&gt;&gt;&gt; fix the issue.<br>
&gt;&gt;&gt;&gt;&gt; Does it help to add &#39;openssh&#39; to depends ?<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Am 17.02.22 um 07:59 schrieb Khem Raj:<br>
&gt;&gt;&gt;&gt;&gt;&gt; seeing configure failure<br>
&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"https://errors.yoctoproject.org/Errors/=
Details/625735/" rel=3D"noreferrer" target=3D"_blank">https://errors.yoctop=
roject.org/Errors/Details/625735/</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; On Wed, Feb 16, 2022 at 8:57 AM Markus Volk &lt;<a=
 href=3D"mailto:f_l_k@t-online.de" target=3D"_blank">f_l_k@t-online.de</a>&=
gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Signed-off-by: Markus Volk &lt;<a href=3D"mail=
to:f_l_k@t-online.de" target=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 ...uild-dont-look-for-native-ssh-=
keygen.patch | 15 +++++++++++<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 .../recipes-gnome/seahorse/<a hre=
f=3D"http://seahorse_41.0.bb" rel=3D"noreferrer" target=3D"_blank">seahorse=
_41.0.bb</a>=C2=A0 =C2=A0| 27<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +++++++++++++++++++<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 2 files changed, 42 insertions(+)=
<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 create mode 100644<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; meta-gnome/recipes-gnome/seahorse/seahorse/mes=
on-build-dont-look-for-native-ssh-keygen.patch<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 create mode 100644<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; meta-gnome/recipes-gnome/seahorse/<a href=3D"h=
ttp://seahorse_41.0.bb" rel=3D"noreferrer" target=3D"_blank">seahorse_41.0.=
bb</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; diff --git<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; a/meta-gnome/recipes-gnome/seahorse/seahorse/m=
eson-build-dont-look-for-native-ssh-keygen.patch<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; b/meta-gnome/recipes-gnome/seahorse/seahorse/m=
eson-build-dont-look-for-native-ssh-keygen.patch<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; new file mode 100644<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; index 000000000..ac83de486<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; --- /dev/null<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +++<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; b/meta-gnome/recipes-gnome/seahorse/seahorse/m=
eson-build-dont-look-for-native-ssh-keygen.patch<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; @@ -0,0 +1,15 @@<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +From: Markus Volk &lt;<a href=3D"mailto:f_l_k=
@t-online.de" target=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +Date: Tue, 16 Feb 2022 10:38:04 +0100<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +Subject: [PATCH] meson.build: dont look for n=
ative ssh-keygen<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +--- a/meson.build=C2=A0 =C2=A0 =C2=A0 2022-02=
-16 10:38:04.170081321 +0100<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; ++++ b/meson.build=C2=A0 =C2=A0 =C2=A0 2022-02=
-16 10:38:28.257864179 +0100<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +@@ -44,7 +44,7 @@<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; + libpwquality =3D dependency(&#39;pwquality&#=
39;)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; + posix =3D valac.find_library(&#39;posix&#39;=
)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; + ssh_bin =3D find_program(&#39;ssh&#39;)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +-ssh_keygen =3D find_program(&#39;ssh-keygen&=
#39;)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; ++ssh_keygen =3D find_program(&#39;ssh-keygen&=
#39;, native : false)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; + gpg_bin =3D find_program(&#39;gpg2&#39;, &#3=
9;gpg&#39;, required:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; get_option(&#39;pgp-support&#39;))<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; + gpgme_dep =3D dependency(&#39;gpgme&#39;, ve=
rsion: &#39;&gt;=3D 1.14.0&#39;, required:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; get_option(&#39;pgp-support&#39;))<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; diff --git a/meta-gnome/recipes-gnome/seahorse=
/<a href=3D"http://seahorse_41.0.bb" rel=3D"noreferrer" target=3D"_blank">s=
eahorse_41.0.bb</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; b/meta-gnome/recipes-gnome/seahorse/<a href=3D=
"http://seahorse_41.0.bb" rel=3D"noreferrer" target=3D"_blank">seahorse_41.=
0.bb</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; new file mode 100644<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; index 000000000..ec1328598<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; --- /dev/null<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +++ b/meta-gnome/recipes-gnome/seahorse/<a hre=
f=3D"http://seahorse_41.0.bb" rel=3D"noreferrer" target=3D"_blank">seahorse=
_41.0.bb</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; @@ -0,0 +1,27 @@<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +SUMMARY =3D &quot;Seahorse is a graphical int=
erface for managing and<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; using encryption keys.&quot;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +LICENSE=3D&quot;GPLv2&quot;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +LIC_FILES_CHKSUM =3D<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; &quot;file://COPYING;md5=3Db234ee4d69f5fce4486=
a80fdaf4a4263&quot;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +GNOMEBASEBUILDCLASS =3D &quot;meson&quot;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +DEPENDS =3D &quot; \<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 avahi \<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 gcr \<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 glib-2.0 \<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 gnupg \<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 gpgme \<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 gtk+3 \<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 libhandy \<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 libpwquality \<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 libsecret \<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 libsoup-2.4 \<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 openldap \<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +&quot;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +inherit gnomebase itstool vala<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +SRC_URI:append =3D &quot;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; file://meson-build-dont-look-for-native-ssh-ke=
ygen.patch&quot;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +SRC_URI[archive.sha256sum] =3D<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; &quot;e6eec09e810448295f547f18c1d5772b65c3edc1=
d9e5a2595f10b5dde68929f5&quot;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +FILES:${PN} +=3D &quot;${datadir}&quot;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; 2.25.1<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; <br>
&gt;&gt;&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#95365): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/95365" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/95365</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89189799/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/89189799/1997914</a><br>
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

--000000000000b25daf05d8402e0d--

