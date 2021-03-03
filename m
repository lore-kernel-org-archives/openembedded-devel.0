Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.8194.1614785248278331817
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Mar 2021 07:27:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=e7o3aqgP;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: anbelski@linux.microsoft.com)
Received: from [192.168.178.23] (i59F773FD.versanet.de [89.247.115.253])
	by linux.microsoft.com (Postfix) with ESMTPSA id 896EB20B83EA;
	Wed,  3 Mar 2021 07:27:26 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 896EB20B83EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1614785247;
	bh=TtLISjX4Gs3l3T9OeXA12gNYxfL4LwibKlTX8O4Nb2U=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=e7o3aqgP8Iv6FA+vrEh4cXB3fiHeHReAUqtcS7us3JfLfS3W63qA9S4nL51E4tQZR
	 8ptWWJ8/87cH5JUUN6ey2tiUgX0/KbJapnX9px+6Y1OWRmu1ThB1GDXtvbbGROKK+u
	 +7YcLqfwjHgkWQ6a6xc12QNj5g+sINfz4KEujlrM=
Subject: Re: [oe] [meta-oe][PATCH] grpc: Upgrade 1.24.3 -> 1.35.0
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20210219123955.26446-1-anbelski@linux.microsoft.com>
 <CAJiuCcexC-KBndWSa=D++zQNFtxu0zYm9oSs_VLzov5QrOtNLA@mail.gmail.com>
 <4696f493-ee53-f4c5-7172-272ed8271be5@linux.microsoft.com>
 <CAJiuCcd4bvctA_JjL6bx6z+zhwsGiy1QPR9tyzgaB6spLwqPQQ@mail.gmail.com>
 <2543ce50-034e-a21f-2c60-95596e5b7595@linux.microsoft.com>
 <885244a0-e750-4527-3475-edbabd2bc46f@herbrechtsmeier.net>
 <CAJiuCceOvVCRXzKgrzez3NX4i96KK9jjcRteJOCR0eR3jTkFzg@mail.gmail.com>
From: "Anatol Belski" <anbelski@linux.microsoft.com>
Message-ID: <bb4b50d2-cfe8-f704-a462-ba7d59de3764@linux.microsoft.com>
Date: Wed, 3 Mar 2021 16:26:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAJiuCceOvVCRXzKgrzez3NX4i96KK9jjcRteJOCR0eR3jTkFzg@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------591F4EEB3B465B64F6B4CFC5"
Content-Language: en-US

--------------591F4EEB3B465B64F6B4CFC5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

On 3/2/2021 8:13 PM, Cl=C3=A9ment P=C3=A9ron wrote:
> Hi Stefan,
>
> Le mar. 2 mars 2021 =C3=A0 19:38, Stefan Herbrechtsmeier=20
> <stefan@herbrechtsmeier.net <mailto:stefan@herbrechtsmeier.net>> a =C3=A9=
crit=C2=A0:
>
>     Hi,
>
>     Am 02.03.21 um 19:22 schrieb Anatol Belski:
>     >
>     > On 3/2/2021 5:06 PM, Cl=C3=A9ment P=C3=A9ron wrote:
>     >>> I don't use this feature from the grpc package, only linking
>     against the
>     >>> libs. However I don't see why this should be an issue, as all t=
he
>     >>> *.cmake files are packaged. I see that in the RPMs but also in
>     a recipe
>     >>> of a dependent packgae like this
>     >> Yes the cmake file is found but not the grpc_cpp_plugin.
>     >>
>     >> This is due to cmake looking for the grpc_cpp_plugin in the targ=
et
>     >> sysroot instead of the native/host sysroot.
>     >>
>     >>> $ ls -l ./tmp/work/*/*/*/recipe-sysroot/usr/lib/cmake/grpc/*.cm=
ake
>     >>>
>     >>> Or use recipe-sysroot-native depending on the consuming recipe.
>     >>>
>     >>> Just a wild guess here - does your recipe put 'grpc' into
>     DEPENDS or
>     >>> RDEPENDS, etc.
>     >> In my recipe I put 'grpc' and 'grpc-native' into DEPENDS using
>     >> PACKAGECONFIG
>     >> PACKAGECONFIG[grpc] =3D "-DCONFIG_GRPC=3DON,-DCONFIG_GRPC=3DOFF,=
grpc
>     >> grpc-native"
>     >>
>     >>> Also, do you inherit cmake in your recipe?
>     >> Yes i am indeed inheriting cmake and also systemd in my recipe
>     >>
>     >>> It seems to me
>     >>> that it's more about how to use cmake files in=C2=A0 a recipe, =
as the
>     >>> particularly mentioned files are packaged and pulled in a
>     consuming
>     >>> recipe.
>     >> When I look in the files packaged the cmake file is indeed here.
>     >> The issue is coming from the gRPCTargets.cmake
>     >> (https://pastebin.com/bZay7cew)
>     >> Line 159:
>     >> # Create imported target gRPC::grpc_cpp_plugin
>     >> add_executable(gRPC::grpc_cpp_plugin IMPORTED)
>     >>
>
>     [snip]
>
>     > The executables seem only be useful for dev and thus only as
>     native. At
>     > this point it seems it's about going deep into debugging your
>     recipe, as
>     > seems there's no solution laying on the surface.
>
>     This is a knowing issue and I have try to fix grpc but yocto is not=
 a
>     platform grpc officially support:
>     https://github.com/grpc/grpc/pull/22498
>
>
thanks for chiming in, Stefan. So this is a known issue and upstream has=20
refused the patch.

> his patch makes sense to me
>
> Can't we include it in meta-oe ?
>
> I will apply it locally anyway.

Cl=C3=A9ment, is it so far confirmed that your issue is fixed by teh patc=
h?

I could note from my side, that carrying a patch to CMake scripts in=20
general is a pain, as the syntax is not very patch friendly. For GRPC -=20
the CMake script is also huge. But also, i've no use for the pattern so=20
couldn't tell how urgent this scenario would be.


Thanks

Anatol






--------------591F4EEB3B465B64F6B4CFC5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>Hi,</p>
    On 3/2/2021 8:13 PM, Cl=C3=A9ment P=C3=A9ron wrote:<br>
    <blockquote type=3D"cite"
cite=3D"mid:CAJiuCceOvVCRXzKgrzez3NX4i96KK9jjcRteJOCR0eR3jTkFzg@mail.gmai=
l.com">
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DU=
TF-8">
      <div dir=3D"auto">
        <div>Hi Stefan,<br>
          <br>
          <div class=3D"gmail_quote">
            <div dir=3D"ltr" class=3D"gmail_attr">Le mar. 2 mars 2021 =C3=
=A0
              19:38, Stefan Herbrechtsmeier &lt;<a
                href=3D"mailto:stefan@herbrechtsmeier.net"
                moz-do-not-send=3D"true">stefan@herbrechtsmeier.net</a>&g=
t;
              a =C3=A9crit=C2=A0:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi,<br>
              <br>
              Am 02.03.21 um 19:22 schrieb Anatol Belski:<br>
              &gt; <br>
              &gt; On 3/2/2021 5:06 PM, Cl=C3=A9ment P=C3=A9ron wrote:<br=
>
              &gt;&gt;&gt; I don't use this feature from the grpc
              package, only linking against the<br>
              &gt;&gt;&gt; libs. However I don't see why this should be
              an issue, as all the<br>
              &gt;&gt;&gt; *.cmake files are packaged. I see that in the
              RPMs but also in a recipe<br>
              &gt;&gt;&gt; of a dependent packgae like this<br>
              &gt;&gt; Yes the cmake file is found but not the
              grpc_cpp_plugin.<br>
              &gt;&gt;<br>
              &gt;&gt; This is due to cmake looking for the
              grpc_cpp_plugin in the target<br>
              &gt;&gt; sysroot instead of the native/host sysroot.<br>
              &gt;&gt;<br>
              &gt;&gt;&gt; $ ls -l
              ./tmp/work/*/*/*/recipe-sysroot/usr/lib/cmake/grpc/*.cmake<=
br>
              &gt;&gt;&gt;<br>
              &gt;&gt;&gt; Or use recipe-sysroot-native depending on the
              consuming recipe.<br>
              &gt;&gt;&gt;<br>
              &gt;&gt;&gt; Just a wild guess here - does your recipe put
              'grpc' into DEPENDS or<br>
              &gt;&gt;&gt; RDEPENDS, etc.<br>
              &gt;&gt; In my recipe I put 'grpc' and 'grpc-native' into
              DEPENDS using <br>
              &gt;&gt; PACKAGECONFIG<br>
              &gt;&gt; PACKAGECONFIG[grpc] =3D
              "-DCONFIG_GRPC=3DON,-DCONFIG_GRPC=3DOFF,grpc <br>
              &gt;&gt; grpc-native"<br>
              &gt;&gt;<br>
              &gt;&gt;&gt; Also, do you inherit cmake in your recipe?<br>
              &gt;&gt; Yes i am indeed inheriting cmake and also systemd
              in my recipe<br>
              &gt;&gt;<br>
              &gt;&gt;&gt; It seems to me<br>
              &gt;&gt;&gt; that it's more about how to use cmake files
              in=C2=A0 a recipe, as the<br>
              &gt;&gt;&gt; particularly mentioned files are packaged and
              pulled in a consuming <br>
              &gt;&gt;&gt; recipe.<br>
              &gt;&gt; When I look in the files packaged the cmake file
              is indeed here.<br>
              &gt;&gt; The issue is coming from the gRPCTargets.cmake <br=
>
              &gt;&gt; (<a href=3D"https://pastebin.com/bZay7cew"
                rel=3D"noreferrer noreferrer" target=3D"_blank"
                moz-do-not-send=3D"true">https://pastebin.com/bZay7cew</a=
>)<br>
              &gt;&gt; Line 159:<br>
              &gt;&gt; # Create imported target gRPC::grpc_cpp_plugin<br>
              &gt;&gt; add_executable(gRPC::grpc_cpp_plugin IMPORTED)<br>
              &gt;&gt;<br>
              <br>
              [snip]<br>
              <br>
              &gt; The executables seem only be useful for dev and thus
              only as native. At <br>
              &gt; this point it seems it's about going deep into
              debugging your recipe, as <br>
              &gt; seems there's no solution laying on the surface.<br>
              <br>
              This is a knowing issue and I have try to fix grpc but
              yocto is not a <br>
              platform grpc officially support:<br>
              <a href=3D"https://github.com/grpc/grpc/pull/22498"
                rel=3D"noreferrer noreferrer" target=3D"_blank"
                moz-do-not-send=3D"true">https://github.com/grpc/grpc/pul=
l/22498</a></blockquote>
          </div>
        </div>
        <div dir=3D"auto"><br>
        </div>
      </div>
    </blockquote>
    <p>thanks for chiming in, Stefan. So this is a known issue and
      upstream has refused the patch.</p>
    <blockquote type=3D"cite"
cite=3D"mid:CAJiuCceOvVCRXzKgrzez3NX4i96KK9jjcRteJOCR0eR3jTkFzg@mail.gmai=
l.com">
      <div dir=3D"auto">
        <div dir=3D"auto">his patch makes sense to me</div>
        <div dir=3D"auto"><br>
        </div>
        <div dir=3D"auto">Can't we include it in meta-oe ?=C2=A0</div>
        <div dir=3D"auto"><br>
        </div>
        <div dir=3D"auto">I will apply it locally anyway.</div>
      </div>
    </blockquote>
    <p>Cl=C3=A9ment, is it so far confirmed that your issue is fixed by t=
eh
      patch?
    </p>
    <p>I could note from my side, that carrying a patch to CMake scripts
      in general is a pain, as the syntax is not very patch friendly.
      For GRPC - the CMake script is also huge. But also, i've no use
      for the pattern so couldn't tell how urgent this scenario would
      be. <br>
    </p>
    <p><br>
    </p>
    <p>Thanks</p>
    <p>Anatol<br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
  </body>
</html>

--------------591F4EEB3B465B64F6B4CFC5--
