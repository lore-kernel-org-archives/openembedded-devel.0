Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web08.25577.1612728623462494089
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Feb 2021 12:10:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mNvjw9gR;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id w2so21332573ejk.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Feb 2021 12:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aRq0gvrC7NNo+buJQdB8xYA6JguusW4NoX9uJz8YWBc=;
        b=mNvjw9gR2UsEtZYKwpsPe8dPHpuuBjQr46gAC/SOqOC7omh7dvK/+k+AXExc20qPf4
         Y8g7cOCiCVOx3R5VTNzPW54vnq7FquFnquHDrrzYI6sBnpeI8jsihsvwrrK0S7CEOh+v
         YIYFxAU6+KWCJuFxTTJsV0PsC+cCkQsJK5dMUzzABHnId4kgk4yQgDuvS5mROW1cLYtp
         zLt1r+xvMxvySWRVN3sL8fKU4b0Aktl2vCH+7Py2bB9P7gI/wLLDhPDcm1whEseIVvWk
         47qKNZQTZAg4xMor8lMfAWB3UlsSFZjTAE9ixtEd3TCIHPkql3uMpA2y+fsT0GcvsPm1
         6Z9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aRq0gvrC7NNo+buJQdB8xYA6JguusW4NoX9uJz8YWBc=;
        b=HeYr15wKDTSPmFiHKrWEowP4BFtSv0gJ0geV24fvzCJ7KQ+RX4qwipWs/EMIFJmd7o
         K741lSIAuSOUSzqRZiJED+sK9HYS7HT+dsaXN5IzKvJpmo5CIHrdQIh/mLLZO86E/EDY
         kG4aq16m6VRQNcAfw4to+eDVWLXKxCiCKOEXd7R3PHRe5jMIZxn4OP9z7/XvCr/O+xVp
         aEYj+LROkSbrA+Bn5vF0vFnJ4CtIKtVm40DeuqqT21B1D3ap0GMMQcwF0SyDTpHst2FF
         cE0WrCJkyFL+wtDAhCea8W1H5o+WBBPWlAkhlsCaJH5w9o2fb7GXHOFlB/4U48fPcjSr
         kAvA==
X-Gm-Message-State: AOAM532ocXMYLrPD0kv1ZmVmJ3OCUpCFahZmk/OIYAE2m8syLASFxfp+
	XJmzQqIIcuruEJHbT3lLr6OY9exx2Xxg04uNMk4=
X-Google-Smtp-Source: ABdhPJxIPqrkUfQUkxJf7YxFpMkmktPjyuic3HqdV/Pamd9joQN58geaZit25xb4pxwoJ9NxN3ztLVpi6o+827j0XiY=
X-Received: by 2002:a17:906:c0d7:: with SMTP id bn23mr13764986ejb.94.1612728621975;
 Sun, 07 Feb 2021 12:10:21 -0800 (PST)
MIME-Version: 1.0
References: <20210207192056.30420-1-akuster808@gmail.com> <CA+chaQde30a46vvvQUBzdx-gwj_RBmBpfaP37Va_6DMnNdgPLw@mail.gmail.com>
 <3653db74-3737-37aa-6607-d0841a9c59ba@gmail.com>
In-Reply-To: <3653db74-3737-37aa-6607-d0841a9c59ba@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Sun, 7 Feb 2021 21:10:10 +0100
Message-ID: <CA+chaQcySAxayZ8U1Zv3hJWfsFeSK6amNYf4mJbxyJ1_pyD5rA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] meta-oe/README: add Ubuntu 20 req.
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a1ce7505bac4a47f"

--000000000000a1ce7505bac4a47f
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 7, 2021 at 9:08 PM akuster808 <akuster808@gmail.com> wrote:

>
>
> On 2/7/21 11:28 AM, Martin Jansa wrote:
> > On Sun, Feb 7, 2021 at 8:21 PM akuster <akuster808@gmail.com
> > <mailto:akuster808@gmail.com>> wrote:
> >
> >     When building on Ubuntu 20.04, luajit needs 32bit support
> >     so install 'gcc-multilib'
> >
> >     Signed-off-by: Armin Kuster <akuster808@gmail.com
> >     <mailto:akuster808@gmail.com>>
> >     ---
> >      meta-oe/README | 3 +++
> >      1 file changed, 3 insertions(+)
> >
> >     diff --git a/meta-oe/README b/meta-oe/README
> >     index 8d787df68b..9034342643 100644
> >     --- a/meta-oe/README
> >     +++ b/meta-oe/README
> >     @@ -14,6 +14,9 @@ e.g. on archlinux based distributions install
> >     prerequisites like below
> >
> >      pacman -S lib32-gcc-libs lib32-glibc
> >
> >     +Ubuntu 20.05
> >     +sudo apt-get install gcc-multilib
> >
> >
> > This is true for older ubuntu versions as well, so I would drop the
> > version here (or fix the typo in it)
> thanks, will do.
>
> >
> > Also I don't see this in master branch.
> What don't you see in master?
>

This patch (it should be backport, right?)
https://git.openembedded.org/meta-openembedded/log/meta-oe/README?h=master-next


>
> -armin
> >
> >     +
> >      Send pull requests to openembedded-devel@lists.openembedded.org
> >     <mailto:openembedded-devel@lists.openembedded.org> with
> >     '[meta-oe]' in the subject'
> >
> >      When sending single patches, please use something like:
> >     --
> >     2.17.1
> >
> >
> >     
> >
>
>

--000000000000a1ce7505bac4a47f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, Feb 7, 2021 at 9:08 PM akuster808=
 &lt;<a href=3D"mailto:akuster808@gmail.com">akuster808@gmail.com</a>&gt; w=
rote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><br>
<br>
On 2/7/21 11:28 AM, Martin Jansa wrote:<br>
&gt; On Sun, Feb 7, 2021 at 8:21 PM akuster &lt;<a href=3D"mailto:akuster8=
08@gmail.com" target=3D"_blank">akuster808@gmail.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:akuster808@gmail.com" target=3D"_blank">=
akuster808@gmail.com</a>&gt;&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0When building on Ubuntu 20.04, luajit needs 32bit =
support<br>
&gt;=C2=A0 =C2=A0 =C2=A0so install &#39;gcc-multilib&#39;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:=
akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:akuster808@gmail.com"=
 target=3D"_blank">akuster808@gmail.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0meta-oe/README | 3 +++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A01 file changed, 3 insertions(+)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta-oe/README b/meta-oe/README<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 8d787df68b..9034342643 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/meta-oe/README<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/meta-oe/README<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -14,6 +14,9 @@ e.g. on archlinux based distribu=
tions install<br>
&gt;=C2=A0 =C2=A0 =C2=A0prerequisites like below<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0pacman -S lib32-gcc-libs lib32-glibc<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Ubuntu 20.05<br>
&gt;=C2=A0 =C2=A0 =C2=A0+sudo apt-get install gcc-multilib<br>
&gt;<br>
&gt;<br>
&gt; This is true for older ubuntu versions as well, so I would drop the<b=
r>
&gt; version here (or fix the typo in it)<br>
thanks, will do.<br>
<br>
&gt;<br>
&gt; Also I don&#39;t see this in master branch.<br>
What don&#39;t you see in master?<br></blockquote><div><br></div><div>This=
 patch (it should be backport, right?)</div><div><a href=3D"https://git.ope=
nembedded.org/meta-openembedded/log/meta-oe/README?h=3Dmaster-next">https:/=
/git.openembedded.org/meta-openembedded/log/meta-oe/README?h=3Dmaster-next<=
/a></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
<br>
-armin<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0Send pull requests to <a href=3D"mailto:open=
embedded-devel@lists.openembedded.org" target=3D"_blank">openembedded-devel=
@lists.openembedded.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:openembedded-devel@li=
sts.openembedded.org" target=3D"_blank">openembedded-devel@lists.openembedd=
ed.org</a>&gt; with<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;[meta-oe]&#39; in the subject&#39;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0When sending single patches, please use some=
thing like:<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A02.17.1<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt;<br>
<br>
</blockquote></div></div>

--000000000000a1ce7505bac4a47f--
