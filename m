Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.8296.1630738507355360283
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Sep 2021 23:55:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RilkC8De;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id u19so1953909edb.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Sep 2021 23:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wIeRVmpef58Sa5Cl7L5y4cmjW7k8Ibh712mMK+IHj3Q=;
        b=RilkC8DeFBeocLWNr6mRBm4AnYkBV1z8k1rtAMBUsAZdIvezDea2K+coMWjGjEM5kw
         eLUgwNwjYZJKva5fJ8RsaOE3WIHXVVpfoWLho5zD7WgqZy4FZ+vw++nD4IK6JidM9IJA
         c4/ivrtTkWcOsSaxBSfSr2/FVuAlSwv5Us+P8WK5GWqqdq1Idx1BzslYXbMZzfWWsloy
         pKTrfafTYucH9uW5eXnb6LmnLPwPbau/d2hZwBbRabob2xBiNrF4kbocFeSiDwyJL2zL
         6mvB+IIBtw20ee+LWFKhjULcViJyGzHO0YsRrG2ov71LKbzzvgwUgs6eIXw/s+SCbvBw
         5k/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wIeRVmpef58Sa5Cl7L5y4cmjW7k8Ibh712mMK+IHj3Q=;
        b=KoQhW8DWS5IPoNxVTyThLILMO9H3psGXZ0orCe4imgEoAFezEFUzU5DG61hfO1I1/b
         Yf15RZG2jd6MYCQQJPGFIIiAi6vGutQotEOKRprZ0AwcWgiLDSe9jRfEgSxxbkKMquoX
         hz8Wm6k8Jzxp5aJzCI2T2Kjhh5DpxL/xU93h72ZndoeSzikoWnq6YXVDhL89bRaGwk5I
         7znAeOe3hGwIrepxkSITO2i6kdacoGjUanL37BzK2ozmSEPEeC6jYJpeh0qN8pByuuR1
         UmNGPw70U5Jh2fBeaRI4SoimvXNUMEeji3MWctKL6zVOxSPSGJOTSrxLmrxmdaXPTgka
         xu5Q==
X-Gm-Message-State: AOAM533+132hxjCW1L9YgAVCsHBBsCT99ieo/c4PbLfFc0KB4lAhdGZB
	Vgr8rmQ+dNN9SEEHieY4pZzUGV9JrckT1/s5sM4=
X-Google-Smtp-Source: ABdhPJx2HZsxQU5FbBcv3rdIsOUIcDAPn+u/VPnjxZJIBb9okZ3Ck0enMWiJZ/6atAWtW+OOGv60qgEbK7dqzmpJvYg=
X-Received: by 2002:aa7:c245:: with SMTP id y5mr2899196edo.20.1630738505808;
 Fri, 03 Sep 2021 23:55:05 -0700 (PDT)
MIME-Version: 1.0
References: <YPWj.1629947089031625845.Nxxr@lists.openembedded.org> <bd46a4b1-2635-a88c-412b-9a3019933ea9@gmail.com>
In-Reply-To: <bd46a4b1-2635-a88c-412b-9a3019933ea9@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Sat, 4 Sep 2021 08:54:54 +0200
Message-ID: <CA+chaQehdLF_Fa2AUrQtnzaWuU0bPcvSjKTGrB3vENUBAE5Lgw@mail.gmail.com>
Subject: Re: [oe] [meta-python][RFC] python3-kivy
To: Khem Raj <raj.khem@gmail.com>
Cc: William Huang <whuang8933@gmail.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005c3d2b05cb25e5eb"

--0000000000005c3d2b05cb25e5eb
Content-Type: text/plain; charset="UTF-8"

The recipe should have x11 and opengl in REQUIRED_DISTRO_FEATURES as it
depends on libsdl2-ttf with such restriction:
https://git.openembedded.org/meta-openembedded/commit/?h=master-next&id=c9a07b63e3268e4b8d04c6917d8cd131e019e65c

Now world builds without opengl fail with:
ERROR: Nothing PROVIDES 'libsdl2-ttf' (but
meta-openembedded/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb
DEPENDS on or otherwise requires it)
libsdl2-ttf was skipped: missing required distro feature 'opengl' (not in
DISTRO_FEATURES)
ERROR: Nothing RPROVIDES 'python3-kivy-dev' (but
meta-openembedded/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'python3-kivy-dev'
NOTE: Runtime target 'python3-kivy-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-kivy-dev']
ERROR: Nothing RPROVIDES 'python3-kivy' (but
meta-openembedded/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'python3-kivy'
NOTE: Runtime target 'python3-kivy' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-kivy']

I can send a patch for this (and similar restriction in packagegroup in
master-next
https://git.openembedded.org/meta-openembedded/commit/?h=master-next&id=55a8f21bb495c3f7ec726faade6bf61baea7dff0)
on Monday unless someone else beats me to it.

On Thu, Aug 26, 2021 at 7:17 PM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 8/25/21 8:04 PM, William Huang wrote:
> > Hello,
> > I would like to request for comments on a Kivy recipe. Not sure how I
> > should include the recipe but I added it as an attachment for now. I've
> > also included a recipe that installs example programs into
> > /usr/share/kivy-examples/examples.
> >
> > I managed to get it running on a Rockchip rk3399 in a X environment, as
> > well as on a imx8 in a Wayland environment, although I did need to
> > reconfigure libsdl2 to use GLES libraries and remove X11 package in the
> > case of the imx8.
> >
> > Any feedback would be great! Not sure if the recipe would be good enough
> > to be included in the meta-python layer as well.
> >
>
> These looks ok on quick look. You could perhaps merge them into a single
> recipe and use PACKAGES to separate out examples into its own output
> package.
>
> Please format it into a patch and email the patch if you want to
> consider it to include into meta-python
>
> > Thanks,
> > William Huang
> >
> >
> >
> >
>
> 
>
>

--0000000000005c3d2b05cb25e5eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The recipe should have x11 and opengl in REQUIRED_DISTRO_F=
EATURES as it depends on=C2=A0libsdl2-ttf with such restriction:<div><a hre=
f=3D"https://git.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next=
&amp;id=3Dc9a07b63e3268e4b8d04c6917d8cd131e019e65c">https://git.openembedde=
d.org/meta-openembedded/commit/?h=3Dmaster-next&amp;id=3Dc9a07b63e3268e4b8d=
04c6917d8cd131e019e65c</a><br><div><br></div><div>Now world builds without =
opengl fail with:</div><div>ERROR: Nothing PROVIDES &#39;libsdl2-ttf&#39; (=
but meta-openembedded/meta-python/recipes-devtools/python/<a href=3D"http:/=
/python3-kivy_2.0.0.bb">python3-kivy_2.0.0.bb</a> DEPENDS on or otherwise r=
equires it)<br>libsdl2-ttf was skipped: missing required distro feature &#3=
9;opengl&#39; (not in DISTRO_FEATURES)<br>ERROR: Nothing RPROVIDES &#39;pyt=
hon3-kivy-dev&#39; (but meta-openembedded/meta-python/recipes-devtools/pyth=
on/<a href=3D"http://python3-kivy_2.0.0.bb">python3-kivy_2.0.0.bb</a> RDEPE=
NDS on or otherwise requires it)<br>No eligible RPROVIDERs exist for &#39;p=
ython3-kivy-dev&#39;<br>NOTE: Runtime target &#39;python3-kivy-dev&#39; is =
unbuildable, removing...<br>Missing or unbuildable dependency chain was: [&=
#39;python3-kivy-dev&#39;]<br>ERROR: Nothing RPROVIDES &#39;python3-kivy&#3=
9; (but meta-openembedded/meta-python/recipes-devtools/python/<a href=3D"ht=
tp://python3-kivy_2.0.0.bb">python3-kivy_2.0.0.bb</a> RDEPENDS on or otherw=
ise requires it)<br>No eligible RPROVIDERs exist for &#39;python3-kivy&#39;=
<br>NOTE: Runtime target &#39;python3-kivy&#39; is unbuildable, removing...=
<br>Missing or unbuildable dependency chain was: [&#39;python3-kivy&#39;]<b=
r></div><div><br></div><div>I can send a patch for this (and similar restri=
ction in packagegroup in master-next <a href=3D"https://git.openembedded.or=
g/meta-openembedded/commit/?h=3Dmaster-next&amp;id=3D55a8f21bb495c3f7ec726f=
aade6bf61baea7dff0">https://git.openembedded.org/meta-openembedded/commit/?=
h=3Dmaster-next&amp;id=3D55a8f21bb495c3f7ec726faade6bf61baea7dff0</a>) on M=
onday unless someone else beats me to it.</div></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 26, 2021=
 at 7:17 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><br>
<br>
On 8/25/21 8:04 PM, William Huang wrote:<br>
&gt; Hello,<br>
&gt; I would like to request for comments on a Kivy recipe. Not sure how I =
<br>
&gt; should include the recipe but I added it as an attachment for now. I&#=
39;ve <br>
&gt; also included a recipe that installs example programs into <br>
&gt; /usr/share/kivy-examples/examples.<br>
&gt; <br>
&gt; I managed to get it running on a Rockchip rk3399 in a X environment, a=
s <br>
&gt; well as on a imx8 in a Wayland environment, although I did need to <br=
>
&gt; reconfigure libsdl2 to use GLES libraries and remove X11 package in th=
e <br>
&gt; case of the imx8.<br>
&gt; <br>
&gt; Any feedback would be great! Not sure if the recipe would be good enou=
gh <br>
&gt; to be included in the meta-python layer as well.<br>
&gt; <br>
<br>
These looks ok on quick look. You could perhaps merge them into a single <b=
r>
recipe and use PACKAGES to separate out examples into its own output <br>
package.<br>
<br>
Please format it into a patch and email the patch if you want to <br>
consider it to include into meta-python<br>
<br>
&gt; Thanks,<br>
&gt; William Huang<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
<br>
</blockquote></div>

--0000000000005c3d2b05cb25e5eb--
