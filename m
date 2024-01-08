Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18DF3C47073
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 02:40:46 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.31313.1704681633597863287
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 18:40:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=BxkyDCX6;
 spf=pass (domain: mvista.com, ip: 209.85.208.173, mailfrom: vanusuri@mvista.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ccb4adbffbso14328301fa.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 18:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1704681632; x=1705286432; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/SP/5S6GYwxSvZgWm8YXGZVTbJ7yZyVeyzdy37ZS8p0=;
        b=BxkyDCX64EfLOjlbhIW+A6kH+k5Vfb7gMSiOYtA6RdepbjtlTLj/ahYJfV/2+aizHO
         Z8zT46ZgHoez1ptOva3pB0QVyBvRRvHcBdeR7RX/PZg+X5HxT9ZMCs/G2lEKSUuzPgJt
         tKY9BEXN0DL4PBqOFKMJrZCyho1NCsRLdwaqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704681632; x=1705286432;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/SP/5S6GYwxSvZgWm8YXGZVTbJ7yZyVeyzdy37ZS8p0=;
        b=asIu5b9Z2fGos4tL5IUu5ImQV+ryRgK1RaSC9k8Sk5bE4tC/UN/P+y9AvUdKhCG530
         5pnD6V+12R8VC44oQ6TNdB2/pBDIJE3dXFBTdS0Cgf4vGk1ibPZkLbv4SGQYLDtBGO8V
         cplK4r+SifT6ytmysG/pBksVFVYGynZa2ahksBry0LvcoB/rBG0ne5/BlRCgfPKl9/7k
         pBU6oSvBRu1CvtssJsekP8Mics4MQ2nV2X1N1wmmVIiHBnbq2zlMORkcjt2mabNz+A8o
         F8cwJ0hya6J9td4ZwP1qYacu5xSvw1fqOJPznXBOMpxH/vaztw2OnDUTm/3bhLEt+0zc
         vQbQ==
X-Gm-Message-State: AOJu0YxUM0q8UWnuVwkgu7RFnLtqfaZE4lnttwO7aDlJGZxHeLyQv0X/
	Sk6Fzial1PLUXZ8Z5tI8H2DFeplvj8Jc5XiFe7AJtaaoeFBGTQ==
X-Google-Smtp-Source: AGHT+IEcp2tdKE+pT2mEsfizfYs2v6WvJPLOs4w3B5REwG/j9RnEgPx5tPeTOthpq0nJZh0JnC1JaZXPMJ2BCrYze+c=
X-Received: by 2002:a2e:a7c9:0:b0:2cd:3aff:c02a with SMTP id
 x9-20020a2ea7c9000000b002cd3affc02amr1435669ljp.65.1704681631671; Sun, 07 Jan
 2024 18:40:31 -0800 (PST)
MIME-Version: 1.0
References: <20231220085438.97520-1-vanusuri@mvista.com> <422964d0680ba081bec487ebb01ac7d516bd3b1c.camel@intel.com>
In-Reply-To: <422964d0680ba081bec487ebb01ac7d516bd3b1c.camel@intel.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Mon, 8 Jan 2024 08:10:20 +0530
Message-ID: <CANQUz1-W59EEXEhKCUtBEUOkSOmmgnDA+DycdeY51QqfgSk_4w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][kirkstone][PATCH v3 1/4] libssh: upgrade 0.8.9 -> 0.10.4
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001c7a2b060e661fc4"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 02:40:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108083

--0000000000001c7a2b060e661fc4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Anuj,

I thought of updating libssh to 0.10.6 to fix the below security bugs

* Fix CVE-2023-6004: Command injection using proxycommand
* Fix CVE-2023-48795: Potential downgrade attack using strict kex
* Fix CVE-2023-6918: Missing checks for return values of MD functions

Ref: https://lists.openembedded.org/g/openembedded-devel/message/107993
(libssh update to 0.10.6 for master branch)

Now I have to go with backporting the fixes  instead  of upgrading?

Thanks & Regards,
Vijay



On Mon, Jan 8, 2024 at 7:44=E2=80=AFAM Mittal, Anuj <anuj.mittal@intel.com>=
 wrote:

> On Wed, 2023-12-20 at 14:24 +0530, Vijay Anusuri via
> lists.openembedded.org wrote:
> > From: Vijay Anusuri <vanusuri@mvista.com>
> >
> > ChangeLog:
> >
> https://git.libssh.org/projects/libssh.git/tree/CHANGELOG?h=3Dlibssh-0.10=
.4
>
> I don't think this is allowed as per stable branch policy unless this
> is a bug fix only upgrade.
>
> Thanks,
>
> Anuj
>
> >
> > Drop CVE-2020-16135.patch
> >
> > Ref:
> >
> https://git.openembedded.org/meta-openembedded-contrib/commit/?h=3Dstable=
/nanbield-nut&id=3D4b7e4341327e867208bfc3d8ba1954af66641e60
> >
> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > ---
> >  .../libssh/libssh/CVE-2020-16135.patch        | 44 -----------------
> > --
> >  .../{libssh_0.8.9.bb =3D> libssh_0.10.4.bb}     | 16 ++-----
> >  2 files changed, 3 insertions(+), 57 deletions(-)
> >  delete mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2020-
> > 16135.patch
> >  rename meta-oe/recipes-support/libssh/{libssh_0.8.9.bb =3D>
> > libssh_0.10.4.bb} (62%)
> >
> > diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2020-
> > 16135.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2020-
> > 16135.patch
> > deleted file mode 100644
> > index 63b78688d..000000000
> > --- a/meta-oe/recipes-support/libssh/libssh/CVE-2020-16135.patch
> > +++ /dev/null
> > @@ -1,44 +0,0 @@
> > -From 0a9268a60f2d3748ca69bde5651f20e72761058c Mon Sep 17 00:00:00
> > 2001
> > -From: Andreas Schneider <asn@cryptomilk.org>
> > -Date: Wed, 3 Jun 2020 10:04:09 +0200
> > -Subject: CVE-2020-16135: Add missing NULL check for ssh_buffer_new()
> > -
> > -Add a missing NULL check for the pointer returned by
> > ssh_buffer_new() in
> > -sftpserver.c.
> > -
> > -Thanks to Ramin Farajpour Cami for spotting this.
> > -
> > -Fixes T232
> > -
> > -Signed-off-by: Andreas Schneider <asn@cryptomilk.org>
> > -Reviewed-by: Anderson Toshiyuki Sasaki <ansasaki@redhat.com>
> > -Reviewed-by: Jakub Jelen <jjelen@redhat.com>
> > -(cherry picked from commit 533d881b0f4b24c72b35ecc97fa35d295d063e53)
> > -
> > -Upstream-Status: Backport
> > [https://git.libssh.org/projects/libssh.git/patch/?id=3D0a9268a60f2d374
> > 8ca69bde5651f20e72761058c]
> > -CVE: CVE-2020-16135
> > -Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> > ----
> > - src/sftpserver.c | 6 ++++++
> > - 1 file changed, 6 insertions(+)
> > -
> > -diff --git a/src/sftpserver.c b/src/sftpserver.c
> > -index 1717aa417..1af8a0e76 100644
> > ---- a/src/sftpserver.c
> > -+++ b/src/sftpserver.c
> > -@@ -64,6 +64,12 @@ sftp_client_message
> > sftp_get_client_message(sftp_session sftp) {
> > -
> > -   /* take a copy of the whole packet */
> > -   msg->complete_message =3D ssh_buffer_new();
> > -+  if (msg->complete_message =3D=3D NULL) {
> > -+      ssh_set_error_oom(session);
> > -+      sftp_client_message_free(msg);
> > -+      return NULL;
> > -+  }
> > -+
> > -   ssh_buffer_add_data(msg->complete_message,
> > -                       ssh_buffer_get(payload),
> > -                       ssh_buffer_get_len(payload));
> > ---
> > -2.25.1
> > -
> > diff --git a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb b/meta-
> > oe/recipes-support/libssh/libssh_0.10.4.bb
> > similarity index 62%
> > rename from meta-oe/recipes-support/libssh/libssh_0.8.9.bb
> > rename to meta-oe/recipes-support/libssh/libssh_0.10.4.bb
> > index 061f13912..3a57a728a 100644
> > --- a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
> > +++ b/meta-oe/recipes-support/libssh/libssh_0.10.4.bb
> > @@ -6,10 +6,8 @@ LIC_FILES_CHKSUM =3D
> > "file://COPYING;md5=3Ddabb4958b830e5df11d2b0ed8ea255a0"
> >
> >  DEPENDS =3D "zlib openssl"
> >
> > -SRC_URI =3D
> > "git://git.libssh.org/projects/libssh.git;protocol=3Dhttps;branch=3Dsta=
bl
> > e-0.8 \
> > -           file://CVE-2020-16135.patch \
> > -          "
> > -SRCREV =3D "04685a74df9ce1db1bc116a83a0da78b4f4fa1f8"
> > +SRC_URI =3D
> > "git://git.libssh.org/projects/libssh.git;protocol=3Dhttps;branch=3Dsta=
bl
> > e-0.10"
> > +SRCREV =3D "e8322817a9e5aaef0698d779ddd467a209a85d85"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > @@ -25,15 +23,7 @@ EXTRA_OECMAKE =3D " \
> >      -DWITH_PCAP=3D1 \
> >      -DWITH_SFTP=3D1 \
> >      -DWITH_ZLIB=3D1 \
> > -    -DLIB_SUFFIX=3D${@d.getVar('baselib').replace('lib', '')} \
> > +    -DWITH_EXAMPLES=3D0 \
> >      "
> >
> > -do_configure:prepend () {
> > -    # Disable building of examples
> > -    sed -i -e '/add_subdirectory(examples)/s/^/#DONOTWANT/'
> > ${S}/CMakeLists.txt \
> > -        || bbfatal "Failed to disable examples"
> > -}
> > -
> > -TOOLCHAIN =3D "gcc"
> > -
> >  BBCLASSEXTEND =3D "native nativesdk"
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#107650):
> > https://lists.openembedded.org/g/openembedded-devel/message/107650
> > Mute This Topic: https://lists.openembedded.org/mt/103278127/3616702
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe:
> > https://lists.openembedded.org/g/openembedded-devel/unsub [
> > anuj.mittal@intel.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--0000000000001c7a2b060e661fc4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div>Hi Anuj,<br><br></div>I thought of upd=
ating libssh to 0.10.6 to fix the below security bugs<br><br>* Fix CVE-2023=
-6004: Command injection using proxycommand<br>* Fix CVE-2023-48795: Potent=
ial downgrade attack using strict kex<br>* Fix CVE-2023-6918: Missing check=
s for return values of MD functions<br><br></div>Ref: <a href=3D"https://li=
sts.openembedded.org/g/openembedded-devel/message/107993">https://lists.ope=
nembedded.org/g/openembedded-devel/message/107993</a> (libssh update to 0.1=
0.6 for master branch)<br><br></div>Now I have to go with backporting the f=
ixes=C2=A0 instead=C2=A0 of upgrading?<br><br></div><div>Thanks &amp; Regar=
ds,</div><div>Vijay<br></div><div><div><br><br></div></div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 8, 2=
024 at 7:44=E2=80=AFAM Mittal, Anuj &lt;<a href=3D"mailto:anuj.mittal@intel=
.com">anuj.mittal@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">On Wed, 2023-12-20 at 14:24 +0530, Vijay Anusuri=
 via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> wrote:<br>
&gt; From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" target=
=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; <br>
&gt; ChangeLog:<br>
&gt; <a href=3D"https://git.libssh.org/projects/libssh.git/tree/CHANGELOG?h=
=3Dlibssh-0.10.4" rel=3D"noreferrer" target=3D"_blank">https://git.libssh.o=
rg/projects/libssh.git/tree/CHANGELOG?h=3Dlibssh-0.10.4</a><br>
<br>
I don&#39;t think this is allowed as per stable branch policy unless this<b=
r>
is a bug fix only upgrade.<br>
<br>
Thanks,<br>
<br>
Anuj<br>
<br>
&gt; <br>
&gt; Drop CVE-2020-16135.patch<br>
&gt; <br>
&gt; Ref:<br>
&gt; <a href=3D"https://git.openembedded.org/meta-openembedded-contrib/comm=
it/?h=3Dstable/nanbield-nut&amp;id=3D4b7e4341327e867208bfc3d8ba1954af66641e=
60" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/meta-=
openembedded-contrib/commit/?h=3Dstable/nanbield-nut&amp;id=3D4b7e4341327e8=
67208bfc3d8ba1954af66641e60</a><br>
&gt; <br>
&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com=
" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0.../libssh/libssh/CVE-2020-16135.patch=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 44 -----------------<br>
&gt; --<br>
&gt; =C2=A0.../{<a href=3D"http://libssh_0.8.9.bb" rel=3D"noreferrer" targe=
t=3D"_blank">libssh_0.8.9.bb</a> =3D&gt; <a href=3D"http://libssh_0.10.4.bb=
" rel=3D"noreferrer" target=3D"_blank">libssh_0.10.4.bb</a>}=C2=A0=C2=A0=C2=
=A0=C2=A0 | 16 ++-----<br>
&gt; =C2=A02 files changed, 3 insertions(+), 57 deletions(-)<br>
&gt; =C2=A0delete mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-202=
0-<br>
&gt; 16135.patch<br>
&gt; =C2=A0rename meta-oe/recipes-support/libssh/{<a href=3D"http://libssh_=
0.8.9.bb" rel=3D"noreferrer" target=3D"_blank">libssh_0.8.9.bb</a> =3D&gt;<=
br>
&gt; <a href=3D"http://libssh_0.10.4.bb" rel=3D"noreferrer" target=3D"_blan=
k">libssh_0.10.4.bb</a>} (62%)<br>
&gt; <br>
&gt; diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2020-<br>
&gt; 16135.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2020-<br>
&gt; 16135.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 63b78688d..000000000<br>
&gt; --- a/meta-oe/recipes-support/libssh/libssh/CVE-2020-16135.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,44 +0,0 @@<br>
&gt; -From 0a9268a60f2d3748ca69bde5651f20e72761058c Mon Sep 17 00:00:00<br>
&gt; 2001<br>
&gt; -From: Andreas Schneider &lt;<a href=3D"mailto:asn@cryptomilk.org" tar=
get=3D"_blank">asn@cryptomilk.org</a>&gt;<br>
&gt; -Date: Wed, 3 Jun 2020 10:04:09 +0200<br>
&gt; -Subject: CVE-2020-16135: Add missing NULL check for ssh_buffer_new()<=
br>
&gt; -<br>
&gt; -Add a missing NULL check for the pointer returned by<br>
&gt; ssh_buffer_new() in<br>
&gt; -sftpserver.c.<br>
&gt; -<br>
&gt; -Thanks to Ramin Farajpour Cami for spotting this.<br>
&gt; -<br>
&gt; -Fixes T232<br>
&gt; -<br>
&gt; -Signed-off-by: Andreas Schneider &lt;<a href=3D"mailto:asn@cryptomilk=
.org" target=3D"_blank">asn@cryptomilk.org</a>&gt;<br>
&gt; -Reviewed-by: Anderson Toshiyuki Sasaki &lt;<a href=3D"mailto:ansasaki=
@redhat.com" target=3D"_blank">ansasaki@redhat.com</a>&gt;<br>
&gt; -Reviewed-by: Jakub Jelen &lt;<a href=3D"mailto:jjelen@redhat.com" tar=
get=3D"_blank">jjelen@redhat.com</a>&gt;<br>
&gt; -(cherry picked from commit 533d881b0f4b24c72b35ecc97fa35d295d063e53)<=
br>
&gt; -<br>
&gt; -Upstream-Status: Backport<br>
&gt; [<a href=3D"https://git.libssh.org/projects/libssh.git/patch/?id=3D0a9=
268a60f2d374" rel=3D"noreferrer" target=3D"_blank">https://git.libssh.org/p=
rojects/libssh.git/patch/?id=3D0a9268a60f2d374</a><br>
&gt; 8ca69bde5651f20e72761058c]<br>
&gt; -CVE: CVE-2020-16135<br>
&gt; -Signed-off-by: Hitendra Prajapati &lt;<a href=3D"mailto:hprajapati@mv=
ista.com" target=3D"_blank">hprajapati@mvista.com</a>&gt;<br>
&gt; ----<br>
&gt; - src/sftpserver.c | 6 ++++++<br>
&gt; - 1 file changed, 6 insertions(+)<br>
&gt; -<br>
&gt; -diff --git a/src/sftpserver.c b/src/sftpserver.c<br>
&gt; -index 1717aa417..1af8a0e76 100644<br>
&gt; ---- a/src/sftpserver.c<br>
&gt; -+++ b/src/sftpserver.c<br>
&gt; -@@ -64,6 +64,12 @@ sftp_client_message<br>
&gt; sftp_get_client_message(sftp_session sftp) {<br>
&gt; - <br>
&gt; -=C2=A0=C2=A0 /* take a copy of the whole packet */<br>
&gt; -=C2=A0=C2=A0 msg-&gt;complete_message =3D ssh_buffer_new();<br>
&gt; -+=C2=A0 if (msg-&gt;complete_message =3D=3D NULL) {<br>
&gt; -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ssh_set_error_oom(session);<br>
&gt; -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sftp_client_message_free(msg);<br>
&gt; -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;<br>
&gt; -+=C2=A0 }<br>
&gt; -+<br>
&gt; -=C2=A0=C2=A0 ssh_buffer_add_data(msg-&gt;complete_message,<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ssh_buffer_=
get(payload),<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ssh_buffer_=
get_len(payload));<br>
&gt; --- <br>
&gt; -2.25.1<br>
&gt; -<br>
&gt; diff --git a/meta-oe/recipes-support/libssh/<a href=3D"http://libssh_0=
.8.9.bb" rel=3D"noreferrer" target=3D"_blank">libssh_0.8.9.bb</a> b/meta-<b=
r>
&gt; oe/recipes-support/libssh/<a href=3D"http://libssh_0.10.4.bb" rel=3D"n=
oreferrer" target=3D"_blank">libssh_0.10.4.bb</a><br>
&gt; similarity index 62%<br>
&gt; rename from meta-oe/recipes-support/libssh/<a href=3D"http://libssh_0.=
8.9.bb" rel=3D"noreferrer" target=3D"_blank">libssh_0.8.9.bb</a><br>
&gt; rename to meta-oe/recipes-support/libssh/<a href=3D"http://libssh_0.10=
.4.bb" rel=3D"noreferrer" target=3D"_blank">libssh_0.10.4.bb</a><br>
&gt; index 061f13912..3a57a728a 100644<br>
&gt; --- a/meta-oe/recipes-support/libssh/<a href=3D"http://libssh_0.8.9.bb=
" rel=3D"noreferrer" target=3D"_blank">libssh_0.8.9.bb</a><br>
&gt; +++ b/meta-oe/recipes-support/libssh/<a href=3D"http://libssh_0.10.4.b=
b" rel=3D"noreferrer" target=3D"_blank">libssh_0.10.4.bb</a><br>
&gt; @@ -6,10 +6,8 @@ LIC_FILES_CHKSUM =3D<br>
&gt; &quot;file://COPYING;md5=3Ddabb4958b830e5df11d2b0ed8ea255a0&quot;<br>
&gt; =C2=A0<br>
&gt; =C2=A0DEPENDS =3D &quot;zlib openssl&quot;<br>
&gt; =C2=A0<br>
&gt; -SRC_URI =3D<br>
&gt; &quot;git://<a href=3D"http://git.libssh.org/projects/libssh.git;proto=
col=3Dhttps;branch=3Dstabl" rel=3D"noreferrer" target=3D"_blank">git.libssh=
.org/projects/libssh.git;protocol=3Dhttps;branch=3Dstabl</a><br>
&gt; e-0.8 \<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://C=
VE-2020-16135.patch=C2=A0\<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;<br>
&gt; -SRCREV =3D &quot;04685a74df9ce1db1bc116a83a0da78b4f4fa1f8&quot;<br>
&gt; +SRC_URI =3D<br>
&gt; &quot;git://<a href=3D"http://git.libssh.org/projects/libssh.git;proto=
col=3Dhttps;branch=3Dstabl" rel=3D"noreferrer" target=3D"_blank">git.libssh=
.org/projects/libssh.git;protocol=3Dhttps;branch=3Dstabl</a><br>
&gt; e-0.10&quot;<br>
&gt; +SRCREV =3D &quot;e8322817a9e5aaef0698d779ddd467a209a85d85&quot;<br>
&gt; =C2=A0<br>
&gt; =C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; =C2=A0<br>
&gt; @@ -25,15 +23,7 @@ EXTRA_OECMAKE =3D &quot; \<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0 -DWITH_PCAP=3D1 \<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0 -DWITH_SFTP=3D1 \<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0 -DWITH_ZLIB=3D1 \<br>
&gt; -=C2=A0=C2=A0=C2=A0 -DLIB_SUFFIX=3D${@d.getVar(&#39;baselib&#39;).repl=
ace(&#39;lib&#39;, &#39;&#39;)} \<br>
&gt; +=C2=A0=C2=A0=C2=A0 -DWITH_EXAMPLES=3D0 \<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0 &quot;<br>
&gt; =C2=A0<br>
&gt; -do_configure:prepend () {<br>
&gt; -=C2=A0=C2=A0=C2=A0 # Disable building of examples<br>
&gt; -=C2=A0=C2=A0=C2=A0 sed -i -e &#39;/add_subdirectory(examples)/s/^/#DO=
NOTWANT/&#39;<br>
&gt; ${S}/CMakeLists.txt \<br>
&gt; -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 || bbfatal &quot;Failed to=
 disable examples&quot;<br>
&gt; -}<br>
&gt; -<br>
&gt; -TOOLCHAIN =3D &quot;gcc&quot;<br>
&gt; -<br>
&gt; =C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#107650):<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-devel/message=
/107650" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.or=
g/g/openembedded-devel/message/107650</a><br>
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

--0000000000001c7a2b060e661fc4--

