Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 187A0C3DA60
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 18:49:11 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.916.1721242140641379577
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jul 2024 11:49:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zWzwGn5n;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-36799fb93baso28344f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jul 2024 11:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1721242139; x=1721846939; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XVS4qzXtrt0CxaC/LiB15Ak4rV2RJqZHVv0XI/OT1P8=;
        b=zWzwGn5n/IsauYkckg6FElbAQEM3wgGCQDiB4H2pEQCZyXeUvaJsbT084Q0uoT3BRK
         TNY61AMUPzg3PruyOX8uvnxKWav8XxQq7D+Vpf+kUHDOqq5YihGSYpyGWU7p6BqU+yCL
         9riZyZ+VAvHlDwB3fNVCGRcZiLtT3EXATD7X4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721242139; x=1721846939;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XVS4qzXtrt0CxaC/LiB15Ak4rV2RJqZHVv0XI/OT1P8=;
        b=PqYMiYdWL1zdvlkSYDUqNep2oB8HzZLTGWJE1ys0dalG/sB93fsaYmaqxGIV8JBtj/
         iq0sMgthMngwe60cuqrcL3ieo1A9THGaXM65KOUfaZ1Z9MyqxHfYHbFGnyJZePru1Kp7
         S37PpYjSO44K0sObrWI4pOuJbIooYhnbue93jUlcQ3kjpjGaJ60Tk1yQXun3xvglg2M4
         9N6Jue9nAmyXaE6UBOkmhYMGhccsxLfGRHHK5gCXubU908Rj+UDVqK/8UZ/ARuX8VJgd
         QyZrWjww79TOcFOBC6UoXIto6QK0qFmrQ7LPw3mmZgjG5BB9ba1jNW6kMuF65M4sW3ug
         bAWA==
X-Forwarded-Encrypted: i=1; AJvYcCWL8D5UiMpCbPMHC67L4TQDCRag562kaGGscGBtl/gtrhYorgJRiPaJL1hCQybn1m3bP31iA58HgNnxpOoWaKG38w+3lrAgyh+4+LOnD28+7Ts2pObXLfJ9/g==
X-Gm-Message-State: AOJu0YzFPkw6xKLJGIQIyn8iY9+InBeKtwNGGSqy+5QcRtq0JF+oTPmj
	oJlVaWbntm0vJgQ2nfD0F9wzgux7hoJ+6wTkUk1vP+/36qtKscgXIYZWDMYSdxIyZaJwYoLUVWc
	gB+Euij7RzG4wTe06aoEmQ2LluVeLQ3W4SZuV4g==
X-Google-Smtp-Source: AGHT+IGIqbdhHttr7S7uNf5v4sOP/Sk7F8aS9jQv4vut47yJB35Dp3imSBpQJTAecQxcFhgjX9H+Q1M9UOWElfByK00=
X-Received: by 2002:adf:e58c:0:b0:367:8a2f:a6dc with SMTP id
 ffacd0b85a97d-368316f9cc7mr1749804f8f.44.1721242138807; Wed, 17 Jul 2024
 11:48:58 -0700 (PDT)
MIME-Version: 1.0
References: <44e317f2-4858-4031-b95c-052d67ce3969@gmail.com> <CAMKF1sp=q+YD8yJR1K6vKf7Nwm8sCZQuFcjN=R0JtGbGZMffPw@mail.gmail.com>
In-Reply-To: <CAMKF1sp=q+YD8yJR1K6vKf7Nwm8sCZQuFcjN=R0JtGbGZMffPw@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 17 Jul 2024 20:48:32 +0200
Message-ID: <CAMSfU+7qHYJCJGqesipRoQ+Cj84WGNcJT-gCyo-RroOpYO5ikQ@mail.gmail.com>
Subject: Re: [oe] scathgap merge request: July 17th
To: raj.khem@gmail.com
Cc: akuster808 <akuster808@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000041a567061d75ead6"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jul 2024 18:49:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111383

--00000000000041a567061d75ead6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I sent 2 backport requests for scarthgap that were not in this merge
request:
[meta-oe][scarthgap][PATCH] packagegroup-meta-oe: fix lvgl inclusion
https://lists.openembedded.org/g/openembedded-devel/message/111364
[meta-oe][scarthgap][PATCH] openbox: fix crash on alt+tab with fullscreen
app  https://lists.openembedded.org/g/openembedded-devel/message/111369

Armin, can you tell me if those will be considered for the next
merge-request ?
No pressure, I'm just ensuring that they are not lost somewhere.

Thank you!


Le mer. 17 juil. 2024 =C3=A0 18:35, Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :

> merged, thanks Armin.
>
> On Wed, Jul 17, 2024 at 6:00=E2=80=AFAM akuster808 <akuster808@gmail.com>=
 wrote:
> >
> > The following changes since commit
> 78a14731cf0cf38a19ff8bd0e9255b319afaf3a7:
> >
> >    php: Upgrade to 8.2.20 (2024-06-26 07:33:55 -0400)
> >
> > are available in the Git repository at:
> >
> >    https://git.openembedded.org/meta-openembedded scarthgap-next
> >
> > for you to fetch changes up to 18f939a5fb37528a5415b05077ece383c346a119=
:
> >
> >    libdbd-mysql-perl: avoid invoking assert_lib at do_configure stage
> > (2024-07-09 08:18:46 -0400)
> >
> > ----------------------------------------------------------------
> > BINDU (1):
> >        flatbuffers: adapt for cross-compilation environments
> >
> > Chen Qi (1):
> >        libdbd-mysql-perl: avoid invoking assert_lib at do_configure sta=
ge
> >
> > Libo Chen (1):
> >        thin-provisioning-tools: install missed thin_shrink and era_repa=
ir
> >
> > Randy MacLeod (1):
> >        python3-pyyaml-include: support native and nativesdk build
> >
> > Siddharth Doshi (1):
> >        apache2: Upgrade 2.4.59 -> 2.4.60
> >
> > Vijay Anusuri (1):
> >        krb5: upgrade 1.21.2 -> 1.21.3
> >
> > Wentao Zhang (1):
> >        meta-oe/conf/layer.conf: remove libbpf from NON_MULTILIB_RECIPES
> > for x86 and x86-64
> >
> >   meta-oe/conf/layer.conf                                         | 3 +=
++
> >   .../krb5/{krb5_1.21.2.bb =3D> krb5_1.21.3.bb} |  4 +--
> >   meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb             | 5
> ++++
> >   ...0001-Makefile.PL-avoid-running-assert_lib-at-configure.patch | 40
> > +++++++++++++++++++++++++++++
> >   meta-oe/recipes-devtools/perl/libdbd-mysql-perl_4.050.bb        | 4
> ++-
> >   .../thin-provisioning-tools/thin-provisioning-tools_1.0.12.bb   | 8
> +++---
> >   .../recipes-devtools/python/python3-pyyaml-include_1.3.2.bb     | 2 +=
-
> >   .../apache2/{apache2_2.4.59.bb =3D> apache2_2.4.60.bb} |  2 +-
> >   8 files changed, 60 insertions(+), 8 deletions(-)
> >   rename meta-oe/recipes-connectivity/krb5/{krb5_1.21.2.bb =3D>
> > krb5_1.21.3.bb} (97%)
> >   create mode 100644
> >
> meta-oe/recipes-devtools/perl/libdbd-mysql-perl/0001-Makefile.PL-avoid-ru=
nning-assert_lib-at-configure.patch
> >   rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.59.bb =3D>
> > apache2_2.4.60.bb} (99%)
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111382):
> https://lists.openembedded.org/g/openembedded-devel/message/111382
> Mute This Topic: https://lists.openembedded.org/mt/107270241/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS - Tech expert

--00000000000041a567061d75ead6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>I sent 2 backport req=
uests for scarthgap that were not in this merge request:<br>[meta-oe][scart=
hgap][PATCH] packagegroup-meta-oe: fix lvgl inclusion=C2=A0 <a href=3D"http=
s://lists.openembedded.org/g/openembedded-devel/message/111364">https://lis=
ts.openembedded.org/g/openembedded-devel/message/111364</a><br>[meta-oe][sc=
arthgap][PATCH] openbox: fix crash on alt+tab with fullscreen app=C2=A0 <a =
href=3D"https://lists.openembedded.org/g/openembedded-devel/message/111369"=
>https://lists.openembedded.org/g/openembedded-devel/message/111369</a></di=
v><div><br></div><div>Armin, can you tell me if those will be considered fo=
r the next merge-request ?</div><div>No pressure, I&#39;m just ensuring tha=
t they are not lost somewhere. <br></div><div><br></div><div>Thank you!<br>=
</div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Le=C2=A0mer. 17 juil. 2024 =C3=A0=C2=A018:35, Khem Raj=
 via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &=
lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com=
@lists.openembedded.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">merged, thanks Armin.<br>
<br>
On Wed, Jul 17, 2024 at 6:00=E2=80=AFAM akuster808 &lt;<a href=3D"mailto:ak=
uster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt; wrote:<b=
r>
&gt;<br>
&gt; The following changes since commit 78a14731cf0cf38a19ff8bd0e9255b319af=
af3a7:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 php: Upgrade to 8.2.20 (2024-06-26 07:33:55 -0400)<br>
&gt;<br>
&gt; are available in the Git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded=
" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/meta-op=
enembedded</a> scarthgap-next<br>
&gt;<br>
&gt; for you to fetch changes up to 18f939a5fb37528a5415b05077ece383c346a11=
9:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 libdbd-mysql-perl: avoid invoking assert_lib at do_config=
ure stage<br>
&gt; (2024-07-09 08:18:46 -0400)<br>
&gt;<br>
&gt; ----------------------------------------------------------------<br>
&gt; BINDU (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 flatbuffers: adapt for cross-compilation en=
vironments<br>
&gt;<br>
&gt; Chen Qi (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 libdbd-mysql-perl: avoid invoking assert_li=
b at do_configure stage<br>
&gt;<br>
&gt; Libo Chen (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 thin-provisioning-tools: install missed thi=
n_shrink and era_repair<br>
&gt;<br>
&gt; Randy MacLeod (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-pyyaml-include: support native and =
nativesdk build<br>
&gt;<br>
&gt; Siddharth Doshi (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 apache2: Upgrade 2.4.59 -&gt; 2.4.60<br>
&gt;<br>
&gt; Vijay Anusuri (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 krb5: upgrade 1.21.2 -&gt; 1.21.3<br>
&gt;<br>
&gt; Wentao Zhang (1):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 meta-oe/conf/layer.conf: remove libbpf from=
 NON_MULTILIB_RECIPES<br>
&gt; for x86 and x86-64<br>
&gt;<br>
&gt;=C2=A0 =C2=A0meta-oe/conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 +++<br>
&gt;=C2=A0 =C2=A0.../krb5/{<a href=3D"http://krb5_1.21.2.bb" rel=3D"norefer=
rer" target=3D"_blank">krb5_1.21.2.bb</a> =3D&gt; <a href=3D"http://krb5_1.=
21.3.bb" rel=3D"noreferrer" target=3D"_blank">krb5_1.21.3.bb</a>} |=C2=A0 4=
 +--<br>
&gt;=C2=A0 =C2=A0meta-oe/recipes-devtools/flatbuffers/<a href=3D"http://fla=
tbuffers.bb" rel=3D"noreferrer" target=3D"_blank">flatbuffers.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 5 ++++<br>
&gt;=C2=A0 =C2=A0...0001-Makefile.PL-avoid-running-assert_lib-at-configure.=
patch | 40<br>
&gt; +++++++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0meta-oe/recipes-devtools/perl/<a href=3D"http://libdbd-mys=
ql-perl_4.050.bb" rel=3D"noreferrer" target=3D"_blank">libdbd-mysql-perl_4.=
050.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++-<br>
&gt;=C2=A0 =C2=A0.../thin-provisioning-tools/<a href=3D"http://thin-provisi=
oning-tools_1.0.12.bb" rel=3D"noreferrer" target=3D"_blank">thin-provisioni=
ng-tools_1.0.12.bb</a>=C2=A0 =C2=A0| 8 +++---<br>
&gt;=C2=A0 =C2=A0.../recipes-devtools/python/<a href=3D"http://python3-pyya=
ml-include_1.3.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pyyaml-in=
clude_1.3.2.bb</a>=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0.../apache2/{<a href=3D"http://apache2_2.4.59.bb" rel=3D"n=
oreferrer" target=3D"_blank">apache2_2.4.59.bb</a> =3D&gt; <a href=3D"http:=
//apache2_2.4.60.bb" rel=3D"noreferrer" target=3D"_blank">apache2_2.4.60.bb=
</a>} |=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A08 files changed, 60 insertions(+), 8 deletions(-)<br>
&gt;=C2=A0 =C2=A0rename meta-oe/recipes-connectivity/krb5/{<a href=3D"http:=
//krb5_1.21.2.bb" rel=3D"noreferrer" target=3D"_blank">krb5_1.21.2.bb</a> =
=3D&gt;<br>
&gt; <a href=3D"http://krb5_1.21.3.bb" rel=3D"noreferrer" target=3D"_blank"=
>krb5_1.21.3.bb</a>} (97%)<br>
&gt;=C2=A0 =C2=A0create mode 100644<br>
&gt; meta-oe/recipes-devtools/perl/libdbd-mysql-perl/0001-Makefile.PL-avoid=
-running-assert_lib-at-configure.patch<br>
&gt;=C2=A0 =C2=A0rename meta-webserver/recipes-httpd/apache2/{<a href=3D"ht=
tp://apache2_2.4.59.bb" rel=3D"noreferrer" target=3D"_blank">apache2_2.4.59=
.bb</a> =3D&gt;<br>
&gt; <a href=3D"http://apache2_2.4.60.bb" rel=3D"noreferrer" target=3D"_bla=
nk">apache2_2.4.60.bb</a>} (99%)<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#111382): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/111382" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/111382</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/107270241/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/107270241/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" t=
arget=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><font face=3D"Raleway, regular">Yoann Congal</font><div><font face=3D"R=
aleway, regular">Smile ECS - Tech expert<br></font></div></div></div>

--00000000000041a567061d75ead6--

