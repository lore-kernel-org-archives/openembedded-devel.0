Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F0FAC47074
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 03:10:47 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.31844.1704683440456316671
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 19:10:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=GNr0hwEi;
 spf=pass (domain: mvista.com, ip: 209.85.208.177, mailfrom: vanusuri@mvista.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2cd0d05838fso13585431fa.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 19:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1704683438; x=1705288238; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/z2iEazhml5/dYUOABlkHtluI90PbJf8HMyUjDHq6g=;
        b=GNr0hwEiW2anJc4PHkhlSbjgX8bUMkkhuYGBHiexd9P94A/ZpgwgQhLbSuKv0icoEZ
         1lNwRisbRj2Ru4K8zvmMNCpNqSmAV6IVqJMRfPO4xJakKMJuyTS9o7wxIhPLMfET70aa
         LzfIjzduxTLLyfLOatRVgyeuqBRXiVBFZjR5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704683438; x=1705288238;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z/z2iEazhml5/dYUOABlkHtluI90PbJf8HMyUjDHq6g=;
        b=AOcXKTYPO0R6ohKygPs18UJJLzvfyFZrk8lYWgNz3RyiPsUZRSRwpXmAt/cFnn88IA
         8B8+sEMTWfvHwZEX7yFJdfYI9h7q2Fh/k9mI0wEPzs04/iQquaxq0tcKg4KoSu0KiKEi
         NiGHdqGv9CEn5u4c/SwiiFfxIyX4SxJPBxi0N+NRdIbSGi40l6sV8N+CmYR+9EE0PAI4
         k84uVJpAHodOueGKfuEFAX0fM/m2JdCSerkRWSacK9BBah+sUAKCqjsyBEAsETYtkZmp
         VPyEvNeJ+ReArtfO1UaRp9O7nQswkXar27iOinjd5sUQpUFgk/hzAPMofA8D82q0g1/n
         vb1g==
X-Gm-Message-State: AOJu0Yxe4a86F7EHslHQJIBfiCSQg6jCbGpJOpVsAjAADMqX82Ddq4pF
	w9pM5cdp8Ej/aqK5OQrny2J+j+PgwzPcnpX+6/ejjd1mRc1sJw==
X-Google-Smtp-Source: AGHT+IHErBesY+OhTU6/M0KmKrvfOyFCzQi5xZ/KmvzTiK+qJA/k8Fuz96y01KOc6QKFiqAIkuPAF4ELWxwKw36HL7U=
X-Received: by 2002:a2e:9643:0:b0:2cc:3e21:23a with SMTP id
 z3-20020a2e9643000000b002cc3e21023amr1019599ljh.107.1704683438285; Sun, 07
 Jan 2024 19:10:38 -0800 (PST)
MIME-Version: 1.0
References: <20231220085438.97520-1-vanusuri@mvista.com> <422964d0680ba081bec487ebb01ac7d516bd3b1c.camel@intel.com>
 <CANQUz1-W59EEXEhKCUtBEUOkSOmmgnDA+DycdeY51QqfgSk_4w@mail.gmail.com> <01f2945033e4d306a29d91c3d7fb97df7a5a60a9.camel@intel.com>
In-Reply-To: <01f2945033e4d306a29d91c3d7fb97df7a5a60a9.camel@intel.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Mon, 8 Jan 2024 08:40:26 +0530
Message-ID: <CANQUz1-ipmC1h6D8mpXqSZ75biLof2jOnK7VFJEyxC77Bx2J4Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][kirkstone][PATCH v3 1/4] libssh: upgrade 0.8.9 -> 0.10.4
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000cb3663060e668aca"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 03:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108123

--000000000000cb3663060e668aca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Anuj for the information provided

Thanks & Regards,
Vijay

On Mon, Jan 8, 2024 at 8:36=E2=80=AFAM Mittal, Anuj <anuj.mittal@intel.com>=
 wrote:

> On Mon, 2024-01-08 at 08:10 +0530, Vijay Anusuri via
> lists.openembedded.org wrote:
> > Hi Anuj,
> >
> > I thought of updating libssh to 0.10.6 to fix the below security bugs
> >
> > * Fix CVE-2023-6004: Command injection using proxycommand
> > * Fix CVE-2023-48795: Potential downgrade attack using strict kex
> > * Fix CVE-2023-6918: Missing checks for return values of MD functions
> >
> > Ref:
> > https://lists.openembedded.org/g/openembedded-devel/message/107993
> > (libssh update to 0.10.6 for master branch)
> >
> > Now I have to go with backporting the fixes  instead  of upgrading?
>
> Yes, that is the policy.
>
>
> https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS#Stable/LTS_Patc=
h_Acceptance_Policies
>
> Thanks,
>
> Anuj
>
> >
> > Thanks & Regards,
> > Vijay
> >
> >
> >
> > On Mon, Jan 8, 2024 at 7:44=E2=80=AFAM Mittal, Anuj <anuj.mittal@intel.=
com>
> > wrote:
> > > On Wed, 2023-12-20 at 14:24 +0530, Vijay Anusuri via
> > > lists.openembedded.org wrote:
> > > > From: Vijay Anusuri <vanusuri@mvista.com>
> > > >
> > > > ChangeLog:
> > > >
> https://git.libssh.org/projects/libssh.git/tree/CHANGELOG?h=3Dlibssh-0.10=
.4
> > >
> > > I don't think this is allowed as per stable branch policy unless
> > > this
> > > is a bug fix only upgrade.
> > >
> > > Thanks,
> > >
> > > Anuj
> > >
> > > >
> > > > Drop CVE-2020-16135.patch
> > > >
> > > > Ref:
> > > >
> https://git.openembedded.org/meta-openembedded-contrib/commit/?h=3Dstable=
/nanbield-nut&id=3D4b7e4341327e867208bfc3d8ba1954af66641e60
> > > >
> > > > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > > > ---
> > > >  .../libssh/libssh/CVE-2020-16135.patch        | 44 -------------
> > > > ----
> > > > --
> > > >  .../{libssh_0.8.9.bb =3D> libssh_0.10.4.bb}     | 16 ++-----
> > > >  2 files changed, 3 insertions(+), 57 deletions(-)
> > > >  delete mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-
> > > > 2020-
> > > > 16135.patch
> > > >  rename meta-oe/recipes-support/libssh/{libssh_0.8.9.bb =3D>
> > > > libssh_0.10.4.bb} (62%)
> > > >
> > > > diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2020-
> > > > 16135.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2020-
> > > > 16135.patch
> > > > deleted file mode 100644
> > > > index 63b78688d..000000000
> > > > --- a/meta-oe/recipes-support/libssh/libssh/CVE-2020-16135.patch
> > > > +++ /dev/null
> > > > @@ -1,44 +0,0 @@
> > > > -From 0a9268a60f2d3748ca69bde5651f20e72761058c Mon Sep 17
> > > > 00:00:00
> > > > 2001
> > > > -From: Andreas Schneider <asn@cryptomilk.org>
> > > > -Date: Wed, 3 Jun 2020 10:04:09 +0200
> > > > -Subject: CVE-2020-16135: Add missing NULL check for
> > > > ssh_buffer_new()
> > > > -
> > > > -Add a missing NULL check for the pointer returned by
> > > > ssh_buffer_new() in
> > > > -sftpserver.c.
> > > > -
> > > > -Thanks to Ramin Farajpour Cami for spotting this.
> > > > -
> > > > -Fixes T232
> > > > -
> > > > -Signed-off-by: Andreas Schneider <asn@cryptomilk.org>
> > > > -Reviewed-by: Anderson Toshiyuki Sasaki <ansasaki@redhat.com>
> > > > -Reviewed-by: Jakub Jelen <jjelen@redhat.com>
> > > > -(cherry picked from commit
> > > > 533d881b0f4b24c72b35ecc97fa35d295d063e53)
> > > > -
> > > > -Upstream-Status: Backport
> > > > [
> > > > https://git.libssh.org/projects/libssh.git/patch/?id=3D0a9268a60f2d=
3
> > > > 74
> > > > 8ca69bde5651f20e72761058c]
> > > > -CVE: CVE-2020-16135
> > > > -Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> > > > ----
> > > > - src/sftpserver.c | 6 ++++++
> > > > - 1 file changed, 6 insertions(+)
> > > > -
> > > > -diff --git a/src/sftpserver.c b/src/sftpserver.c
> > > > -index 1717aa417..1af8a0e76 100644
> > > > ---- a/src/sftpserver.c
> > > > -+++ b/src/sftpserver.c
> > > > -@@ -64,6 +64,12 @@ sftp_client_message
> > > > sftp_get_client_message(sftp_session sftp) {
> > > > -
> > > > -   /* take a copy of the whole packet */
> > > > -   msg->complete_message =3D ssh_buffer_new();
> > > > -+  if (msg->complete_message =3D=3D NULL) {
> > > > -+      ssh_set_error_oom(session);
> > > > -+      sftp_client_message_free(msg);
> > > > -+      return NULL;
> > > > -+  }
> > > > -+
> > > > -   ssh_buffer_add_data(msg->complete_message,
> > > > -                       ssh_buffer_get(payload),
> > > > -                       ssh_buffer_get_len(payload));
> > > > ---
> > > > -2.25.1
> > > > -
> > > > diff --git a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
> > > > b/meta-
> > > > oe/recipes-support/libssh/libssh_0.10.4.bb
> > > > similarity index 62%
> > > > rename from meta-oe/recipes-support/libssh/libssh_0.8.9.bb
> > > > rename to meta-oe/recipes-support/libssh/libssh_0.10.4.bb
> > > > index 061f13912..3a57a728a 100644
> > > > --- a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
> > > > +++ b/meta-oe/recipes-support/libssh/libssh_0.10.4.bb
> > > > @@ -6,10 +6,8 @@ LIC_FILES_CHKSUM =3D
> > > > "file://COPYING;md5=3Ddabb4958b830e5df11d2b0ed8ea255a0"
> > > >
> > > >  DEPENDS =3D "zlib openssl"
> > > >
> > > > -SRC_URI =3D
> > > > "git://git.libssh.org/projects/libssh.git;protocol=3Dhttps;branch=
=3Ds
> > > > tabl
> > > > e-0.8 \
> > > > -           file://CVE-2020-16135.patch \
> > > > -          "
> > > > -SRCREV =3D "04685a74df9ce1db1bc116a83a0da78b4f4fa1f8"
> > > > +SRC_URI =3D
> > > > "git://git.libssh.org/projects/libssh.git;protocol=3Dhttps;branch=
=3Ds
> > > > tabl
> > > > e-0.10"
> > > > +SRCREV =3D "e8322817a9e5aaef0698d779ddd467a209a85d85"
> > > >
> > > >  S =3D "${WORKDIR}/git"
> > > >
> > > > @@ -25,15 +23,7 @@ EXTRA_OECMAKE =3D " \
> > > >      -DWITH_PCAP=3D1 \
> > > >      -DWITH_SFTP=3D1 \
> > > >      -DWITH_ZLIB=3D1 \
> > > > -    -DLIB_SUFFIX=3D${@d.getVar('baselib').replace('lib', '')} \
> > > > +    -DWITH_EXAMPLES=3D0 \
> > > >      "
> > > >
> > > > -do_configure:prepend () {
> > > > -    # Disable building of examples
> > > > -    sed -i -e '/add_subdirectory(examples)/s/^/#DONOTWANT/'
> > > > ${S}/CMakeLists.txt \
> > > > -        || bbfatal "Failed to disable examples"
> > > > -}
> > > > -
> > > > -TOOLCHAIN =3D "gcc"
> > > > -
> > > >  BBCLASSEXTEND =3D "native nativesdk"
> > > >
> > > >
> > > >
> > >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#108083):
> > https://lists.openembedded.org/g/openembedded-devel/message/108083
> > Mute This Topic: https://lists.openembedded.org/mt/103278127/3616702
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe:
> > https://lists.openembedded.org/g/openembedded-devel/unsub [
> > anuj.mittal@intel.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--000000000000cb3663060e668aca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks Anuj for the information provided</div><div><b=
r></div><div>Thanks &amp; Regards,</div><div>Vijay<br></div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 8, =
2024 at 8:36=E2=80=AFAM Mittal, Anuj &lt;<a href=3D"mailto:anuj.mittal@inte=
l.com">anuj.mittal@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">On Mon, 2024-01-08 at 08:10 +0530, Vijay Anusur=
i via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> wrote:<br>
&gt; Hi Anuj,<br>
&gt; <br>
&gt; I thought of updating libssh to 0.10.6 to fix the below security bugs<=
br>
&gt; <br>
&gt; * Fix CVE-2023-6004: Command injection using proxycommand<br>
&gt; * Fix CVE-2023-48795: Potential downgrade attack using strict kex<br>
&gt; * Fix CVE-2023-6918: Missing checks for return values of MD functions<=
br>
&gt; <br>
&gt; Ref:<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-devel/message=
/107993" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.or=
g/g/openembedded-devel/message/107993</a><br>
&gt; (libssh update to 0.10.6 for master branch)<br>
&gt; <br>
&gt; Now I have to go with backporting the fixes=C2=A0 instead=C2=A0 of upg=
rading?<br>
<br>
Yes, that is the policy.<br>
<br>
<a href=3D"https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS#Stable=
/LTS_Patch_Acceptance_Policies" rel=3D"noreferrer" target=3D"_blank">https:=
//wiki.yoctoproject.org/wiki/Stable_Release_and_LTS#Stable/LTS_Patch_Accept=
ance_Policies</a><br>
<br>
Thanks,<br>
<br>
Anuj<br>
<br>
&gt; <br>
&gt; Thanks &amp; Regards,<br>
&gt; Vijay<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; On Mon, Jan 8, 2024 at 7:44=E2=80=AFAM Mittal, Anuj &lt;<a href=3D"mai=
lto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com</a>&gt;<=
br>
&gt; wrote:<br>
&gt; &gt; On Wed, 2023-12-20 at 14:24 +0530, Vijay Anusuri via<br>
&gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targ=
et=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; &gt; &gt; From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; ChangeLog:<br>
&gt; &gt; &gt; <a href=3D"https://git.libssh.org/projects/libssh.git/tree/C=
HANGELOG?h=3Dlibssh-0.10.4" rel=3D"noreferrer" target=3D"_blank">https://gi=
t.libssh.org/projects/libssh.git/tree/CHANGELOG?h=3Dlibssh-0.10.4</a><br>
&gt; &gt; <br>
&gt; &gt; I don&#39;t think this is allowed as per stable branch policy unl=
ess<br>
&gt; &gt; this<br>
&gt; &gt; is a bug fix only upgrade.<br>
&gt; &gt; <br>
&gt; &gt; Thanks,<br>
&gt; &gt; <br>
&gt; &gt; Anuj<br>
&gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Drop CVE-2020-16135.patch<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Ref:<br>
&gt; &gt; &gt; <a href=3D"https://git.openembedded.org/meta-openembedded-co=
ntrib/commit/?h=3Dstable/nanbield-nut&amp;id=3D4b7e4341327e867208bfc3d8ba19=
54af66641e60" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded=
.org/meta-openembedded-contrib/commit/?h=3Dstable/nanbield-nut&amp;id=3D4b7=
e4341327e867208bfc3d8ba1954af66641e60</a><br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@=
mvista.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt; =C2=A0.../libssh/libssh/CVE-2020-16135.patch=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 44 -------------<br>
&gt; &gt; &gt; ----<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; =C2=A0.../{<a href=3D"http://libssh_0.8.9.bb" rel=3D"norefer=
rer" target=3D"_blank">libssh_0.8.9.bb</a> =3D&gt; <a href=3D"http://libssh=
_0.10.4.bb" rel=3D"noreferrer" target=3D"_blank">libssh_0.10.4.bb</a>}=C2=
=A0=C2=A0=C2=A0=C2=A0 | 16 ++-----<br>
&gt; &gt; &gt; =C2=A02 files changed, 3 insertions(+), 57 deletions(-)<br>
&gt; &gt; &gt; =C2=A0delete mode 100644 meta-oe/recipes-support/libssh/libs=
sh/CVE-<br>
&gt; &gt; &gt; 2020-<br>
&gt; &gt; &gt; 16135.patch<br>
&gt; &gt; &gt; =C2=A0rename meta-oe/recipes-support/libssh/{<a href=3D"http=
://libssh_0.8.9.bb" rel=3D"noreferrer" target=3D"_blank">libssh_0.8.9.bb</a=
> =3D&gt;<br>
&gt; &gt; &gt; <a href=3D"http://libssh_0.10.4.bb" rel=3D"noreferrer" targe=
t=3D"_blank">libssh_0.10.4.bb</a>} (62%)<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2020-=
<br>
&gt; &gt; &gt; 16135.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2020=
-<br>
&gt; &gt; &gt; 16135.patch<br>
&gt; &gt; &gt; deleted file mode 100644<br>
&gt; &gt; &gt; index 63b78688d..000000000<br>
&gt; &gt; &gt; --- a/meta-oe/recipes-support/libssh/libssh/CVE-2020-16135.p=
atch<br>
&gt; &gt; &gt; +++ /dev/null<br>
&gt; &gt; &gt; @@ -1,44 +0,0 @@<br>
&gt; &gt; &gt; -From 0a9268a60f2d3748ca69bde5651f20e72761058c Mon Sep 17<br=
>
&gt; &gt; &gt; 00:00:00<br>
&gt; &gt; &gt; 2001<br>
&gt; &gt; &gt; -From: Andreas Schneider &lt;<a href=3D"mailto:asn@cryptomil=
k.org" target=3D"_blank">asn@cryptomilk.org</a>&gt;<br>
&gt; &gt; &gt; -Date: Wed, 3 Jun 2020 10:04:09 +0200<br>
&gt; &gt; &gt; -Subject: CVE-2020-16135: Add missing NULL check for<br>
&gt; &gt; &gt; ssh_buffer_new()<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -Add a missing NULL check for the pointer returned by<br>
&gt; &gt; &gt; ssh_buffer_new() in<br>
&gt; &gt; &gt; -sftpserver.c.<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -Thanks to Ramin Farajpour Cami for spotting this.<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -Fixes T232<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -Signed-off-by: Andreas Schneider &lt;<a href=3D"mailto:asn@=
cryptomilk.org" target=3D"_blank">asn@cryptomilk.org</a>&gt;<br>
&gt; &gt; &gt; -Reviewed-by: Anderson Toshiyuki Sasaki &lt;<a href=3D"mailt=
o:ansasaki@redhat.com" target=3D"_blank">ansasaki@redhat.com</a>&gt;<br>
&gt; &gt; &gt; -Reviewed-by: Jakub Jelen &lt;<a href=3D"mailto:jjelen@redha=
t.com" target=3D"_blank">jjelen@redhat.com</a>&gt;<br>
&gt; &gt; &gt; -(cherry picked from commit<br>
&gt; &gt; &gt; 533d881b0f4b24c72b35ecc97fa35d295d063e53)<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -Upstream-Status: Backport<br>
&gt; &gt; &gt; [<br>
&gt; &gt; &gt; <a href=3D"https://git.libssh.org/projects/libssh.git/patch/=
?id=3D0a9268a60f2d3" rel=3D"noreferrer" target=3D"_blank">https://git.libss=
h.org/projects/libssh.git/patch/?id=3D0a9268a60f2d3</a><br>
&gt; &gt; &gt; 74<br>
&gt; &gt; &gt; 8ca69bde5651f20e72761058c]<br>
&gt; &gt; &gt; -CVE: CVE-2020-16135<br>
&gt; &gt; &gt; -Signed-off-by: Hitendra Prajapati &lt;<a href=3D"mailto:hpr=
ajapati@mvista.com" target=3D"_blank">hprajapati@mvista.com</a>&gt;<br>
&gt; &gt; &gt; ----<br>
&gt; &gt; &gt; - src/sftpserver.c | 6 ++++++<br>
&gt; &gt; &gt; - 1 file changed, 6 insertions(+)<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -diff --git a/src/sftpserver.c b/src/sftpserver.c<br>
&gt; &gt; &gt; -index 1717aa417..1af8a0e76 100644<br>
&gt; &gt; &gt; ---- a/src/sftpserver.c<br>
&gt; &gt; &gt; -+++ b/src/sftpserver.c<br>
&gt; &gt; &gt; -@@ -64,6 +64,12 @@ sftp_client_message<br>
&gt; &gt; &gt; sftp_get_client_message(sftp_session sftp) {<br>
&gt; &gt; &gt; - <br>
&gt; &gt; &gt; -=C2=A0=C2=A0 /* take a copy of the whole packet */<br>
&gt; &gt; &gt; -=C2=A0=C2=A0 msg-&gt;complete_message =3D ssh_buffer_new();=
<br>
&gt; &gt; &gt; -+=C2=A0 if (msg-&gt;complete_message =3D=3D NULL) {<br>
&gt; &gt; &gt; -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ssh_set_error_oom(session);=
<br>
&gt; &gt; &gt; -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sftp_client_message_free(ms=
g);<br>
&gt; &gt; &gt; -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;<br>
&gt; &gt; &gt; -+=C2=A0 }<br>
&gt; &gt; &gt; -+<br>
&gt; &gt; &gt; -=C2=A0=C2=A0 ssh_buffer_add_data(msg-&gt;complete_message,<=
br>
&gt; &gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ssh_buffer_get(payload),<br>
&gt; &gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ssh_buffer_get_len(payload));<br>
&gt; &gt; &gt; --- <br>
&gt; &gt; &gt; -2.25.1<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; diff --git a/meta-oe/recipes-support/libssh/<a href=3D"http:=
//libssh_0.8.9.bb" rel=3D"noreferrer" target=3D"_blank">libssh_0.8.9.bb</a>=
<br>
&gt; &gt; &gt; b/meta-<br>
&gt; &gt; &gt; oe/recipes-support/libssh/<a href=3D"http://libssh_0.10.4.bb=
" rel=3D"noreferrer" target=3D"_blank">libssh_0.10.4.bb</a><br>
&gt; &gt; &gt; similarity index 62%<br>
&gt; &gt; &gt; rename from meta-oe/recipes-support/libssh/<a href=3D"http:/=
/libssh_0.8.9.bb" rel=3D"noreferrer" target=3D"_blank">libssh_0.8.9.bb</a><=
br>
&gt; &gt; &gt; rename to meta-oe/recipes-support/libssh/<a href=3D"http://l=
ibssh_0.10.4.bb" rel=3D"noreferrer" target=3D"_blank">libssh_0.10.4.bb</a><=
br>
&gt; &gt; &gt; index 061f13912..3a57a728a 100644<br>
&gt; &gt; &gt; --- a/meta-oe/recipes-support/libssh/<a href=3D"http://libss=
h_0.8.9.bb" rel=3D"noreferrer" target=3D"_blank">libssh_0.8.9.bb</a><br>
&gt; &gt; &gt; +++ b/meta-oe/recipes-support/libssh/<a href=3D"http://libss=
h_0.10.4.bb" rel=3D"noreferrer" target=3D"_blank">libssh_0.10.4.bb</a><br>
&gt; &gt; &gt; @@ -6,10 +6,8 @@ LIC_FILES_CHKSUM =3D<br>
&gt; &gt; &gt; &quot;file://COPYING;md5=3Ddabb4958b830e5df11d2b0ed8ea255a0&=
quot;<br>
&gt; &gt; &gt; =C2=A0<br>
&gt; &gt; &gt; =C2=A0DEPENDS =3D &quot;zlib openssl&quot;<br>
&gt; &gt; &gt; =C2=A0<br>
&gt; &gt; &gt; -SRC_URI =3D<br>
&gt; &gt; &gt; &quot;git://<a href=3D"http://git.libssh.org/projects/libssh=
.git;protocol=3Dhttps;branch=3Ds" rel=3D"noreferrer" target=3D"_blank">git.=
libssh.org/projects/libssh.git;protocol=3Dhttps;branch=3Ds</a><br>
&gt; &gt; &gt; tabl<br>
&gt; &gt; &gt; e-0.8 \<br>
&gt; &gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 file://CVE-2020-16135.patch=C2=A0\<br>
&gt; &gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quo=
t;<br>
&gt; &gt; &gt; -SRCREV =3D &quot;04685a74df9ce1db1bc116a83a0da78b4f4fa1f8&q=
uot;<br>
&gt; &gt; &gt; +SRC_URI =3D<br>
&gt; &gt; &gt; &quot;git://<a href=3D"http://git.libssh.org/projects/libssh=
.git;protocol=3Dhttps;branch=3Ds" rel=3D"noreferrer" target=3D"_blank">git.=
libssh.org/projects/libssh.git;protocol=3Dhttps;branch=3Ds</a><br>
&gt; &gt; &gt; tabl<br>
&gt; &gt; &gt; e-0.10&quot;<br>
&gt; &gt; &gt; +SRCREV =3D &quot;e8322817a9e5aaef0698d779ddd467a209a85d85&q=
uot;<br>
&gt; &gt; &gt; =C2=A0<br>
&gt; &gt; &gt; =C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; &gt; &gt; =C2=A0<br>
&gt; &gt; &gt; @@ -25,15 +23,7 @@ EXTRA_OECMAKE =3D &quot; \<br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0 -DWITH_PCAP=3D1 \<br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0 -DWITH_SFTP=3D1 \<br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0 -DWITH_ZLIB=3D1 \<br>
&gt; &gt; &gt; -=C2=A0=C2=A0=C2=A0 -DLIB_SUFFIX=3D${@d.getVar(&#39;baselib&=
#39;).replace(&#39;lib&#39;, &#39;&#39;)} \<br>
&gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0 -DWITH_EXAMPLES=3D0 \<br>
&gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0 &quot;<br>
&gt; &gt; &gt; =C2=A0<br>
&gt; &gt; &gt; -do_configure:prepend () {<br>
&gt; &gt; &gt; -=C2=A0=C2=A0=C2=A0 # Disable building of examples<br>
&gt; &gt; &gt; -=C2=A0=C2=A0=C2=A0 sed -i -e &#39;/add_subdirectory(example=
s)/s/^/#DONOTWANT/&#39;<br>
&gt; &gt; &gt; ${S}/CMakeLists.txt \<br>
&gt; &gt; &gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 || bbfatal &quot=
;Failed to disable examples&quot;<br>
&gt; &gt; &gt; -}<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -TOOLCHAIN =3D &quot;gcc&quot;<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; =C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#108083):<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-devel/message=
/108083" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.or=
g/g/openembedded-devel/message/108083</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10327812=
7/3616702" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/103278127/3616702</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe:<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-devel/unsub" =
rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/opene=
mbedded-devel/unsub</a>=C2=A0[<br>
&gt; <a href=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal=
@intel.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
</blockquote></div>

--000000000000cb3663060e668aca--

