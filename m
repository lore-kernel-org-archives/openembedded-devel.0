Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.732.1614712442811006437
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Mar 2021 11:14:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z7acQTQ/;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: peron.clem@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id p8so11074537ejb.10
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Mar 2021 11:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WMECciuEO+o4sFRWDJM/dyhxSy2n5+HRL8SFZpDyOj4=;
        b=Z7acQTQ/ukVqTUvN7u8VssPkkzk/htYnMBXJPOuJkosRgKGz8rnm4Z8NecE7N0JRfp
         jp3UuLPJprf+9JU2Jj+ok8r7/stbxFFS5Lw5tx92ryHm+2ml8sXzpXRdFuUwY4IRLU/d
         iu6gkkVbR7dEOuN/AY/jALRUvAPXBoStgajZ0Y/14Cp84vyiAoHyLnA4h76UXizTunhM
         AOcPXscFNR/xBKOI4tr8Wsl4Xuk4yVQV8MwqqxAeMjAPcd5OmY3Am7Qyq+ZqkCwLgzOi
         u6AqrYxH3mW3pbqxvhg4ZbG1qrog/NJkFOHhUQ8GX/nvXdZLXTmwPEb/BSRqpRs9pqKu
         17Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WMECciuEO+o4sFRWDJM/dyhxSy2n5+HRL8SFZpDyOj4=;
        b=B4yEFXAxOLoTkXh+2Iqn+DwYOPw0V/IyOnvHb5RkLQRO12Ilgsic0MQwqaIAK4ed5c
         K36npK4qkp7qUmwfbcVFiFRFWO/srWU+1DYdRrDytroVFTVfsJXyX5p5/ry4pqDmt0K9
         Zv8STv2CiPwtZVf0QHog6f+3qFDd9BD1cXsyWQ8JTdg+C38Iw21fbuxO/rDAo1efECo5
         d9huwyaD9VLtkdaq1hpNxmq9ICrPWZmGPO7Qg0vsLT/4G1UU4HVGMQXYHlkw8CqAfkp9
         +OsEfl+blKFrmWfZ3O0eMOqpQ2LVTkl2NkVYbUF+rY9wDDpgrCz/KA24lXBWxjSliQTr
         hZ1Q==
X-Gm-Message-State: AOAM531gOdBJIC6tEKm5QZ9TE0ggyEwB1aTLYOJjtNHBmvrn9bAe+P3W
	gV1qrC6qO9CWRTIvl1dJ4fEDGz63mNZZzE/3YGI=
X-Google-Smtp-Source: ABdhPJyH1+XiRrS54SpZWqWK8qG25WWashMw7Z7esG/HdnB6CY30NZ2fwpIta0rOA0FdPo/AvU5hB0kMw5ZX6CRqCzQ=
X-Received: by 2002:a17:907:c27:: with SMTP id ga39mr22866308ejc.68.1614712441185;
 Tue, 02 Mar 2021 11:14:01 -0800 (PST)
MIME-Version: 1.0
References: <20210219123955.26446-1-anbelski@linux.microsoft.com>
 <CAJiuCcexC-KBndWSa=D++zQNFtxu0zYm9oSs_VLzov5QrOtNLA@mail.gmail.com>
 <4696f493-ee53-f4c5-7172-272ed8271be5@linux.microsoft.com>
 <CAJiuCcd4bvctA_JjL6bx6z+zhwsGiy1QPR9tyzgaB6spLwqPQQ@mail.gmail.com>
 <2543ce50-034e-a21f-2c60-95596e5b7595@linux.microsoft.com> <885244a0-e750-4527-3475-edbabd2bc46f@herbrechtsmeier.net>
In-Reply-To: <885244a0-e750-4527-3475-edbabd2bc46f@herbrechtsmeier.net>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Tue, 2 Mar 2021 20:13:48 +0100
Message-ID: <CAJiuCceOvVCRXzKgrzez3NX4i96KK9jjcRteJOCR0eR3jTkFzg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] grpc: Upgrade 1.24.3 -> 1.35.0
To: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Cc: Anatol Belski <anbelski@linux.microsoft.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000078a88005bc9289f3"

--00000000000078a88005bc9289f3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

Le mar. 2 mars 2021 =C3=A0 19:38, Stefan Herbrechtsmeier <
stefan@herbrechtsmeier.net> a =C3=A9crit :

> Hi,
>
> Am 02.03.21 um 19:22 schrieb Anatol Belski:
> >
> > On 3/2/2021 5:06 PM, Cl=C3=A9ment P=C3=A9ron wrote:
> >>> I don't use this feature from the grpc package, only linking against
> the
> >>> libs. However I don't see why this should be an issue, as all the
> >>> *.cmake files are packaged. I see that in the RPMs but also in a reci=
pe
> >>> of a dependent packgae like this
> >> Yes the cmake file is found but not the grpc_cpp_plugin.
> >>
> >> This is due to cmake looking for the grpc_cpp_plugin in the target
> >> sysroot instead of the native/host sysroot.
> >>
> >>> $ ls -l ./tmp/work/*/*/*/recipe-sysroot/usr/lib/cmake/grpc/*.cmake
> >>>
> >>> Or use recipe-sysroot-native depending on the consuming recipe.
> >>>
> >>> Just a wild guess here - does your recipe put 'grpc' into DEPENDS or
> >>> RDEPENDS, etc.
> >> In my recipe I put 'grpc' and 'grpc-native' into DEPENDS using
> >> PACKAGECONFIG
> >> PACKAGECONFIG[grpc] =3D "-DCONFIG_GRPC=3DON,-DCONFIG_GRPC=3DOFF,grpc
> >> grpc-native"
> >>
> >>> Also, do you inherit cmake in your recipe?
> >> Yes i am indeed inheriting cmake and also systemd in my recipe
> >>
> >>> It seems to me
> >>> that it's more about how to use cmake files in  a recipe, as the
> >>> particularly mentioned files are packaged and pulled in a consuming
> >>> recipe.
> >> When I look in the files packaged the cmake file is indeed here.
> >> The issue is coming from the gRPCTargets.cmake
> >> (https://pastebin.com/bZay7cew)
> >> Line 159:
> >> # Create imported target gRPC::grpc_cpp_plugin
> >> add_executable(gRPC::grpc_cpp_plugin IMPORTED)
> >>
>
> [snip]
>
> > The executables seem only be useful for dev and thus only as native. At
> > this point it seems it's about going deep into debugging your recipe, a=
s
> > seems there's no solution laying on the surface.
>
> This is a knowing issue and I have try to fix grpc but yocto is not a
> platform grpc officially support:
> https://github.com/grpc/grpc/pull/22498


This patch makes sense to me

Can't we include it in meta-oe ?

I will apply it locally anyway.

Thanks for your help
Clement



>
> The cmake package only works if you install the binaries but yocto
> doesn't install binaries for the target because otherwise cmake couldn't
> find the native binaries.
>
> Regards
>    Stefan
>

--00000000000078a88005bc9289f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Stefan,<br><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">Le mar. 2 mars 2021 =C3=A0 19:38, Stefan Her=
brechtsmeier &lt;<a href=3D"mailto:stefan@herbrechtsmeier.net">stefan@herbr=
echtsmeier.net</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">Hi,<br>
<br>
Am 02.03.21 um 19:22 schrieb Anatol Belski:<br>
&gt; <br>
&gt; On 3/2/2021 5:06 PM, Cl=C3=A9ment P=C3=A9ron wrote:<br>
&gt;&gt;&gt; I don&#39;t use this feature from the grpc package, only linki=
ng against the<br>
&gt;&gt;&gt; libs. However I don&#39;t see why this should be an issue, as =
all the<br>
&gt;&gt;&gt; *.cmake files are packaged. I see that in the RPMs but also in=
 a recipe<br>
&gt;&gt;&gt; of a dependent packgae like this<br>
&gt;&gt; Yes the cmake file is found but not the grpc_cpp_plugin.<br>
&gt;&gt;<br>
&gt;&gt; This is due to cmake looking for the grpc_cpp_plugin in the target=
<br>
&gt;&gt; sysroot instead of the native/host sysroot.<br>
&gt;&gt;<br>
&gt;&gt;&gt; $ ls -l ./tmp/work/*/*/*/recipe-sysroot/usr/lib/cmake/grpc/*.c=
make<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Or use recipe-sysroot-native depending on the consuming recipe=
.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Just a wild guess here - does your recipe put &#39;grpc&#39; i=
nto DEPENDS or<br>
&gt;&gt;&gt; RDEPENDS, etc.<br>
&gt;&gt; In my recipe I put &#39;grpc&#39; and &#39;grpc-native&#39; into D=
EPENDS using <br>
&gt;&gt; PACKAGECONFIG<br>
&gt;&gt; PACKAGECONFIG[grpc] =3D &quot;-DCONFIG_GRPC=3DON,-DCONFIG_GRPC=3DO=
FF,grpc <br>
&gt;&gt; grpc-native&quot;<br>
&gt;&gt;<br>
&gt;&gt;&gt; Also, do you inherit cmake in your recipe?<br>
&gt;&gt; Yes i am indeed inheriting cmake and also systemd in my recipe<br>
&gt;&gt;<br>
&gt;&gt;&gt; It seems to me<br>
&gt;&gt;&gt; that it&#39;s more about how to use cmake files in=C2=A0 a rec=
ipe, as the<br>
&gt;&gt;&gt; particularly mentioned files are packaged and pulled in a cons=
uming <br>
&gt;&gt;&gt; recipe.<br>
&gt;&gt; When I look in the files packaged the cmake file is indeed here.<b=
r>
&gt;&gt; The issue is coming from the gRPCTargets.cmake <br>
&gt;&gt; (<a href=3D"https://pastebin.com/bZay7cew" rel=3D"noreferrer noref=
errer" target=3D"_blank">https://pastebin.com/bZay7cew</a>)<br>
&gt;&gt; Line 159:<br>
&gt;&gt; # Create imported target gRPC::grpc_cpp_plugin<br>
&gt;&gt; add_executable(gRPC::grpc_cpp_plugin IMPORTED)<br>
&gt;&gt;<br>
<br>
[snip]<br>
<br>
&gt; The executables seem only be useful for dev and thus only as native. A=
t <br>
&gt; this point it seems it&#39;s about going deep into debugging your reci=
pe, as <br>
&gt; seems there&#39;s no solution laying on the surface.<br>
<br>
This is a knowing issue and I have try to fix grpc but yocto is not a <br>
platform grpc officially support:<br>
<a href=3D"https://github.com/grpc/grpc/pull/22498" rel=3D"noreferrer noref=
errer" target=3D"_blank">https://github.com/grpc/grpc/pull/22498</a></block=
quote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">This patch =
makes sense to me</div><div dir=3D"auto"><br></div><div dir=3D"auto">Can&#3=
9;t we include it in meta-oe ?=C2=A0</div><div dir=3D"auto"><br></div><div =
dir=3D"auto">I will apply it locally anyway.</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">Thanks for your help=C2=A0</div><div dir=3D"auto">Clem=
ent=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div=
 dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br=
>
<br>
The cmake package only works if you install the binaries but yocto <br>
doesn&#39;t install binaries for the target because otherwise cmake couldn&=
#39;t <br>
find the native binaries.<br>
<br>
Regards<br>
=C2=A0 =C2=A0Stefan<br>
</blockquote></div></div></div>

--00000000000078a88005bc9289f3--
