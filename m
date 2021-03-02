Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.372.1614701177062473211
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Mar 2021 08:06:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ASLI/js4;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: peron.clem@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id dx17so8670733ejb.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Mar 2021 08:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IQ2GwlOUVTgQlc+mqyMKVvncVCurhynO9JHNk5+RPeE=;
        b=ASLI/js4CDRPxcZY6KpQRo0QJAWbyxE08043MgniisMz6OY9uzRBiNjM0BxIYDP2Hj
         79bUcR4xb6XPD7k5WNejHAhxFwf2WZTU2W0P/GA8ZOYK8dsexU1XVD1XnYvMLh2iM3zV
         Y1CpV9CVQHST55Ck95QJTTCQweRl4wFlIRPKZaeSO1jUnLSaSltgTcWNsKPVBLWL1kJW
         9uR/PGQGGCGX68Cxjal9y7XSF81rVx9u3NJvaNdZYaD7Vr2g5wUK/vPGRtLUILHiYfHr
         EDfSsjMrbYOyoFToPISpq6Np6V6xeyOQPoRyuKKNayqMB7g8TqIu0Rl9l68ttvxlKOji
         kl2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IQ2GwlOUVTgQlc+mqyMKVvncVCurhynO9JHNk5+RPeE=;
        b=OhF+Y+gSCNh93XNL5OqWeP6Lok5OwkOOFuejZ+mCjoOONGa3vTAU0JwXXWtQkW87gg
         QSTRxU4IqLgBz6QJNJ2wFWMs8OuaIQ+uNJL64k9yOv8p4TeCfIxGlCD6FsmkIOT0oNr3
         o8Q46pseoqe9HzmiJyegkbgUvIw40tLFEoNof4ZjW+uIyIy8bq/0MCmFJPY1DKzzadKp
         RPG6X8tXImGwE42d3F/7EUTCtlNJBjfgozLwRyz99LjM/3C7q7folIloRRDodXSBI6N9
         MrxEU1H65wyV0rXDJ+gwWjZM0bAlwqwYcbbqjzT0mqN2aopBHLr+KlmOORaQk3p4K8eO
         Eg/w==
X-Gm-Message-State: AOAM533uuzEI1bPqEBXJRJ8dsy2/yJhU+/EOzWrHtEd6LIwEN0JosJP4
	JV2x7On4QMK/mdfOSfwvPYtX2Hphh75K4Yn04+A=
X-Google-Smtp-Source: ABdhPJyya2wPEHa03mMLAZENqUCPjFy2MJFeyQFXGIWq/kXhTqxEEurBGJl+z4N2shVuf6w2hoHRcwL9kLN10Dr96b8=
X-Received: by 2002:a17:906:a44:: with SMTP id x4mr21300727ejf.101.1614701175266;
 Tue, 02 Mar 2021 08:06:15 -0800 (PST)
MIME-Version: 1.0
References: <20210219123955.26446-1-anbelski@linux.microsoft.com>
 <CAJiuCcexC-KBndWSa=D++zQNFtxu0zYm9oSs_VLzov5QrOtNLA@mail.gmail.com> <4696f493-ee53-f4c5-7172-272ed8271be5@linux.microsoft.com>
In-Reply-To: <4696f493-ee53-f4c5-7172-272ed8271be5@linux.microsoft.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Tue, 2 Mar 2021 17:06:04 +0100
Message-ID: <CAJiuCcd4bvctA_JjL6bx6z+zhwsGiy1QPR9tyzgaB6spLwqPQQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] grpc: Upgrade 1.24.3 -> 1.35.0
To: Anatol Belski <anbelski@linux.microsoft.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Anatol

On Tue, 2 Mar 2021 at 14:32, Anatol Belski <anbelski@linux.microsoft.com> w=
rote:
>
> Hi Cl=C3=A9ment,
>
> Thanks for the question.
>
> On 2/22/2021 5:49 PM, Cl=C3=A9ment P=C3=A9ron wrote:
> > Hi Anatol,
> >
> >
> > On Fri, 19 Feb 2021 at 13:40, Anatol Belski
> > <anbelski@linux.microsoft.com> wrote:
> >> This is a really huge jump in versions, but this package has been not
> >> upgraded for quite some time. The previous patches are not necessary
> >> anymore, they're integrated upstream.
> > This version of gRPC generate a new CMake gRPCTargets.cmake
> > recipe-sysroot/usr/lib/cmake/grpc/gRPCTargets.cmake
> >
> > This generate an error in my build:
> > Because this CMake declare a
> > recipe-sysroot/usr/bin/grpc_cpp_plugin
> >
> > but this file does not exist.  Possible reasons include:
> > |
> > |   * The file was deleted, renamed, or moved to another location.
> > |
> > |   * An install or uninstall procedure did not complete successfully.
> > |
> > |   * The installation package was faulty and contained
> >
> > In my project i'm using the CMake example from gRPC
> > https://github.com/grpc/grpc/blob/master/examples/cpp/cmake/common.cmak=
e#L114
> >
> > This error is triggered by:
> > find_package(gRPC 1.35.0 CONFIG REQUIRED)
> >
> > FYI My recipes depends on grpc and grpc-native
> > PACKAGECONFIG[grpc] =3D "-DCONFIG_GRPC=3DON,-DCONFIG_GRPC=3DOFF,grpc gr=
pc-native"
> >
> > Do you have an example of a gRPC recipe?
>
> I don't use this feature from the grpc package, only linking against the
> libs. However I don't see why this should be an issue, as all the
> *.cmake files are packaged. I see that in the RPMs but also in a recipe
> of a dependent packgae like this

Yes the cmake file is found but not the grpc_cpp_plugin.

This is due to cmake looking for the grpc_cpp_plugin in the target
sysroot instead of the native/host sysroot.

>
> $ ls -l ./tmp/work/*/*/*/recipe-sysroot/usr/lib/cmake/grpc/*.cmake
>
> Or use recipe-sysroot-native depending on the consuming recipe.
>
> Just a wild guess here - does your recipe put 'grpc' into DEPENDS or
> RDEPENDS, etc.

In my recipe I put 'grpc' and 'grpc-native' into DEPENDS using PACKAGECONFI=
G
PACKAGECONFIG[grpc] =3D "-DCONFIG_GRPC=3DON,-DCONFIG_GRPC=3DOFF,grpc grpc-n=
ative"

> Also, do you inherit cmake in your recipe?
Yes i am indeed inheriting cmake and also systemd in my recipe

> It seems to me
> that it's more about how to use cmake files in  a recipe, as the
> particularly mentioned files are packaged and pulled in a consuming recip=
e.

When I look in the files packaged the cmake file is indeed here.
The issue is coming from the gRPCTargets.cmake (https://pastebin.com/bZay7c=
ew)
Line 159:
# Create imported target gRPC::grpc_cpp_plugin
add_executable(gRPC::grpc_cpp_plugin IMPORTED)

gRPC is trying to add the grpc_cpp_plugin for the Target which is not
present in the final package.
dpkg -c ./build/tmp/deploy/ipk/aarch64/grpc_1.35.0-r0_aarch64.ipk
drwxr-xr-x root/root         0 2021-02-22 17:43 ./usr/
drwxr-xr-x root/root         0 2021-02-22 17:43 ./usr/lib/
lrwxrwxrwx root/root         0 2021-02-22 17:43
./usr/lib/libaddress_sorting.so.14 -> libaddress_sorting.so.14.0.0
-rwxr-xr-x root/root     10000 2021-02-22 17:43
./usr/lib/libaddress_sorting.so.14.0.0
lrwxrwxrwx root/root         0 2021-02-22 17:43 ./usr/lib/libgpr.so.14
-> libgpr.so.14.0.0
-rwxr-xr-x root/root     59616 2021-02-22 17:43 ./usr/lib/libgpr.so.14.0.0
lrwxrwxrwx root/root         0 2021-02-22 17:43
./usr/lib/libgrpc++.so.1 -> libgrpc++.so.1.35.0
-rwxr-xr-x root/root    501680 2021-02-22 17:43 ./usr/lib/libgrpc++.so.1.35=
.0
lrwxrwxrwx root/root         0 2021-02-22 17:43
./usr/lib/libgrpc++_alts.so.1 -> libgrpc++_alts.so.1.35.0
-rwxr-xr-x root/root     22368 2021-02-22 17:43
./usr/lib/libgrpc++_alts.so.1.35.0
lrwxrwxrwx root/root         0 2021-02-22 17:43
./usr/lib/libgrpc++_error_details.so.1 ->
libgrpc++_error_details.so.1.35.0
-rwxr-xr-x root/root     34896 2021-02-22 17:43
./usr/lib/libgrpc++_error_details.so.1.35.0
lrwxrwxrwx root/root         0 2021-02-22 17:43
./usr/lib/libgrpc++_reflection.so.1 -> libgrpc++_reflection.so.1.35.0
-rwxr-xr-x root/root    284960 2021-02-22 17:43
./usr/lib/libgrpc++_reflection.so.1.35.0
lrwxrwxrwx root/root         0 2021-02-22 17:43
./usr/lib/libgrpc++_unsecure.so.1 -> libgrpc++_unsecure.so.1.35.0
-rwxr-xr-x root/root    415672 2021-02-22 17:43
./usr/lib/libgrpc++_unsecure.so.1.35.0
lrwxrwxrwx root/root         0 2021-02-22 17:43
./usr/lib/libgrpc.so.14 -> libgrpc.so.14.0.0
-rwxr-xr-x root/root   3505864 2021-02-22 17:43 ./usr/lib/libgrpc.so.14.0.0
lrwxrwxrwx root/root         0 2021-02-22 17:43
./usr/lib/libgrpc_plugin_support.so.1 ->
libgrpc_plugin_support.so.1.35.0
-rwxr-xr-x root/root    440528 2021-02-22 17:43
./usr/lib/libgrpc_plugin_support.so.1.35.0
lrwxrwxrwx root/root         0 2021-02-22 17:43
./usr/lib/libgrpc_unsecure.so.14 -> libgrpc_unsecure.so.14.0.0
-rwxr-xr-x root/root   1939384 2021-02-22 17:43
./usr/lib/libgrpc_unsecure.so.14.0.0
lrwxrwxrwx root/root         0 2021-02-22 17:43
./usr/lib/libgrpcpp_channelz.so.1 -> libgrpcpp_channelz.so.1.35.0
-rwxr-xr-x root/root    617784 2021-02-22 17:43
./usr/lib/libgrpcpp_channelz.so.1.35.0
lrwxrwxrwx root/root         0 2021-02-22 17:43 ./usr/lib/libupb.so.14
-> libupb.so.14.0.0
-rwxr-xr-x root/root    141768 2021-02-22 17:43 ./usr/lib/libupb.so.14.0.0
drwxr-xr-x root/root         0 2021-02-22 17:43 ./usr/share/
drwxr-xr-x root/root         0 2021-02-22 17:43 ./usr/share/grpc/
-rw-r--r-- root/root    263903 2021-02-22 17:38 ./usr/share/grpc/roots.pem

Regards,
Clement


>
> Regards
>
> Anatol
>
>
>
>
>
>
