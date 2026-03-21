Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC6F71094475
	for <webhook@archiver.kernel.org>; Sat, 21 Mar 2026 13:18:26 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10723.1774099099354828708
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Mar 2026 06:18:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Etm2pB58;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43b4fd681c2so2310195f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Mar 2026 06:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774099098; x=1774703898; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IWYOROAjS/clDejbIaU2EY4K/WPHwCmQwOtkcb0lN/Y=;
        b=Etm2pB58wEpiPBceTMzSO3Z81Y1f3DyXsB2Bm8cHu8ry7KKqu2rFgUmEl606Jnx93e
         rGRk4/H2XtQfChXMwj6Gy6Q6O+zyZ15269XN/Iz+FoYh3hoSSrbPDvnLpCwdSYtQwVjU
         cXNcZadWitTFK1eM9+AKPBR5tTnVaAj8SJvtbs51K6Wtr/TBBdp2PHouF503efn+W4O6
         WQdimvK7Us+KE7X4lh+TuDRT4rVx7Ja6LfWCKaE0jpZ6uSHs6AfEjs2+EL9Wyuhkhu1k
         gfbKA2PfzBrDanXPVAHEK9f6j2SvHnJo6HCKAFVm1uvKI8DDgslPBoY4mhZnuYayR01o
         8cug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774099098; x=1774703898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IWYOROAjS/clDejbIaU2EY4K/WPHwCmQwOtkcb0lN/Y=;
        b=jObraVsJylcKxJd9WYlGMLwBPQL+HlHv8gvwZqz5UKeUGhfwDWcSXtgIyO1UsYaClf
         ucCTai9rIxqtbAWjiYrQnWTguJMxgGJmNJuavhZtYP7IihF+1OaiOY58oMI6upEEfYTj
         PrMJxUHkQuV76xLz/3hnJM2UrAHb0ulxHGTWs/yRPdnWF/wa0i7WIf6/vY4CIdNCy1ZX
         1gMvH/GN97hSEGsr64YLPAgAromX8tJ7t8ygFyowfxe5lVj7vV8D0icuYoc5Y7VJz9i/
         Qj7B85xJCqGEELR9k3q28N3FdECHrZj4bpifoXhfZ4UxnMOO6a8F4RUz/WdWjTlCPF6N
         HvHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgLPITSV06xn3A5hYt0GSttu5Zp8F0QXbtw2UkuD/aDyWKkixSxit1UJ4y0bDmy9vFVZoR95BgFoCviHfpuejMtDw=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxMC46eNAG1YcV9aGUjNTu667ynhw/GTYA6cu2Ig0Tb9oKHxYzZ
	KVzspKHlO/wEl1u0o6YxHdiB0HcYUqlo2VOpgNtDsDw9bRahpAjeXPXI
X-Gm-Gg: ATEYQzwp/SwCCocwh/eKzag98+YFY7aEezMK7iGR4IPjE+8Ld3pDIi9tpNmkEqnFDnc
	oCS7B55koUY2OW8J1oZW2yrmZgTnNwdCktC30vPs04+EJljiPyS7D5Xl/gTEiW5DIYTOPZjWJr8
	eDucy0QXEVYW60W/TM72BU2XBu+9Haj1SHslw35Zlu0wYW+ctfjeUP/W1n8RWhoR6wnbgbf+SWm
	16kfvwZvYUDbgIMHlu7UKA0oP3nAJm7UA7wUzNDxdL19z4uQO5yJYkrLnrknEdkqf5IZDycz7r9
	YnHoWtCoMZaGQW7Amb2GA/UHQSXdad7QkphQPCa+jXw2Xf8inTy9Cb5o/odOwQXC15qZt1gTKGO
	2OMNguyaYVFkdnwcwiOpT8C+kTgKmyeVXWHHbGeSUhQWO1QGs5nMPmNDiWrZ/KMXsNAeRdul5qq
	CK7/abXH91xWcu8j8UImCGbFu6/l0fRmM=
X-Received: by 2002:a05:6000:400e:b0:43a:3cc:83e9 with SMTP id ffacd0b85a97d-43b64238731mr10268095f8f.4.1774099096969;
        Sat, 21 Mar 2026 06:18:16 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64717e97sm14934024f8f.35.2026.03.21.06.18.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2026 06:18:16 -0700 (PDT)
Message-ID: <55cae0f6-6ee6-4b10-9573-2277b4802cd5@gmail.com>
Date: Sat, 21 Mar 2026 14:18:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] [WIP #Help #Rust] thin-provisioning-tools: SRC_URI
 update + Update 1.1.0 -> 1.3.1
To: joerg.sommer@navimatix.de, openembedded-devel@lists.openembedded.org
References: <85c2f05ae4003728a18624ad67a0f785335b613f.1774090769.git.joerg.sommer@navimatix.de>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <85c2f05ae4003728a18624ad67a0f785335b613f.1774090769.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Mar 2026 13:18:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125463

This is just a cursory note, which ultimately may or may not be a red
herring.

That last linker -L argument looks suspicious, I wonder how did it get
there:"-L
native=3D/build/tmp/work/x86-64-v3-poky-linux/thin-provisioning-tools/1.3=
=2E1/recipe-sysroot/usr/lib"

It is prefixed as a native search folder, but the above folder is for
class-target. Also the error shows that it is invoking build-rust-ccld
script, which is meant for class-native.

That library folder contains an ld-script for libm.so, which points to
/usr/lib/libm.so and /usr/lib/libmvec.so.1, that seems to trip it up at
the first sight.



On 3/21/26 11:59, J=C3=B6rg Sommer via lists.openembedded.org wrote:
> From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
>=20
> My build fails with this message:
>=20
> ```
> |    Compiling devicemapper v0.34.5
> |     Building [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D> ] 140/145: devicemapper(build.rs)
> |      Running `rustc --crate-name build_script_build --edition=3D2021 =
/build/tmp/work/x86-64-v3-poky-linux/thin-provisioning-tools/1.3.1/source=
s/cargo_home/bitbake/devicemapper-0.34.5/build.rs --error-format=3Djson -=
-json=3Ddiagnostic-rendered-ansi,artifacts,future-incompat --crate-type b=
in --emit=3Ddep-info,link -C embed-bitcode=3Dno -C debuginfo=3D2 --deny=3D=
warnings --deny=3Dunexpected_cfgs '--deny=3Dclippy::all' --deny=3Dfuture_=
incompatible '--deny=3Dclippy::cargo' --deny=3Dunused '--allow=3Dclippy::=
multiple-crate-versions' --deny=3Drust_2018_idioms --deny=3Dnonstandard_s=
tyle --check-cfg 'cfg(devicemapper41supported)' --check-cfg 'cfg(devicema=
pper42supported)' --check-cfg 'cfg(devicemapper437supported)' --check-cfg=
 'cfg(devicemapper441supported)' --check-cfg 'cfg(devicemapper46supported=
)' -C debug-assertions=3Doff --check-cfg 'cfg(docsrs,test)' --check-cfg '=
cfg(feature, values("disable_cargo_metadata"))' -C metadata=3Dcba9daea183=
64fd2 -C extra-filename=3D-b41f072d20778f8f --out-dir /build/tmp/work/x86=
-64-v3-poky-linux/thin-provisioning-tools/1.3.1/build/target/release/buil=
d/devicemapper-b41f072d20778f8f -C linker=3D/build/tmp/work/x86-64-v3-pok=
y-linux/thin-provisioning-tools/1.3.1/wrapper/build-rust-ccld -L dependen=
cy=3D/build/tmp/work/x86-64-v3-poky-linux/thin-provisioning-tools/1.3.1/
> build/target/release/deps --extern devicemapper_sys=3D/build/tmp/work/x=
86-64-v3-poky-linux/thin-provisioning-tools/1.3.1/build/target/release/de=
ps/libdevicemapper_sys-6aed6a4a922755f2.rlib --extern semver=3D/build/tmp=
/work/x86-64-v3-poky-linux/thin-provisioning-tools/1.3.1/build/target/rel=
ease/deps/libsemver-f3c6ab5d9d5b9b08.rlib --cap-lints allow -L native=3D/=
build/tmp/work/x86-64-v3-poky-linux/thin-provisioning-tools/1.3.1/recipe-=
sysroot/usr/lib`
> | error: linking with `/build/tmp/work/x86-64-v3-poky-linux/thin-provis=
ioning-tools/1.3.1/wrapper/build-rust-ccld` failed: exit status: 1
> |   |
> |   =3D note:  "/build/tmp/work/x86-64-v3-poky-linux/thin-provisioning-=
tools/1.3.1/wrapper/build-rust-ccld" "-m64" "/build/tmp/work/x86-64-v3-po=
ky-linux/thin-provisioning-tools/1.3.1/build/target/release/build/devicem=
apper-b41f072d20778f8f/rustcpsVeVd/symbols.o" "<2 object files omitted>" =
"-Wl,--as-needed" "-Wl,-Bstatic" "/build/tmp/work/x86-64-v3-poky-linux/th=
in-provisioning-tools/1.3.1/build/target/release/deps/{libdevicemapper_sy=
s-6aed6a4a922755f2,libsemver-f3c6ab5d9d5b9b08}.rlib" "<sysroot>/lib/rustl=
ib/x86_64-unknown-linux-gnu/lib/{libstd-*,libpanic_unwind-*,libobject-*,l=
ibmemchr-*,libaddr2line-*,libgimli-*,libcfg_if-*,librustc_demangle-*,libs=
td_detect-*,libhashbrown-*,librustc_std_workspace_alloc-*,libminiz_oxide-=
*,libadler2-*,libunwind-*,liblibc-*,librustc_std_workspace_core-*,liballo=
c-*,libcore-*,libcompiler_builtins-*}.rlib" "-Wl,-Bdynamic" "-ldevmapper"=
 "-lgcc_s" "-lutil" "-lrt" "-lpthread" "-lm" "-ldl" "-lc" "-L" "/build/tm=
p/work/x86-64-v3-poky-linux/thin-provisioning-tools/1.3.1/build/target/re=
lease/build/devicemapper-b41f072d20778f8f/rustcpsVeVd/raw-dylibs" "-Wl,--=
eh-frame-hdr" "-Wl,-z,noexecstack" "-L" "/build/tmp/work/x86-64-v3-poky-l=
inux/thin-provisioning-tools/1.3.1/recipe-sysroot/usr/lib" "-L" "<sysroot=
>/lib/rustlib/x86_64-unknown-linux-gnu/lib" "-o" "/build/tmp/work/x86-64-=
v3-poky-linux/thin-provisioning-tools/1.3.1/build/target/release/build/de=
vicemapper-b41f072d20778f8f/build_script_build-b41f072d20778f8f" "-Wl,--g=
c-sections" "-pie" "-Wl,-z,relro,-z,now" "-nodefaultlibs"
> |   =3D note: some arguments are omitted. use `--verbose` to show all l=
inker arguments
> |   =3D note: /build/tmp/hosttools/ld: cannot find /usr/lib/libm.so.6: =
No such file or directory
> |           /build/tmp/hosttools/ld: cannot find /usr/lib/libmvec.so.1:=
 No such file or directory
> |           collect2: error: ld returned 1 exit status
> |
> |
> | error: could not compile `devicemapper` (build script) due to 1 previ=
ous error
> |
> | Caused by:
> |   process didn't exit successfully: `rustc --crate-name build_script_=
build --edition=3D2021 /build/tmp/work/x86-64-v3-poky-linux/thin-provisio=
ning-tools/1.3.1/sources/cargo_home/bitbake/devicemapper-0.34.5/build.rs =
--error-format=3Djson --json=3Ddiagnostic-rendered-ansi,artifacts,future-=
incompat --crate-type bin --emit=3Ddep-info,link -C embed-bitcode=3Dno -C=
 debuginfo=3D2 --deny=3Dwarnings --deny=3Dunexpected_cfgs '--deny=3Dclipp=
y::all' --deny=3Dfuture_incompatible '--deny=3Dclippy::cargo' --deny=3Dun=
used '--allow=3Dclippy::multiple-crate-versions' --deny=3Drust_2018_idiom=
s --deny=3Dnonstandard_style --check-cfg 'cfg(devicemapper41supported)' -=
-check-cfg 'cfg(devicemapper42supported)' --check-cfg 'cfg(devicemapper43=
7supported)' --check-cfg 'cfg(devicemapper441supported)' --check-cfg 'cfg=
(devicemapper46supported)' -C debug-assertions=3Doff --check-cfg 'cfg(doc=
srs,test)' --check-cfg 'cfg(feature, values("disable_cargo_metadata"))' -=
C metadata=3Dcba9daea18364fd2 -C extra-filename=3D-b41f072d20778f8f --out=
-dir /build/tmp/work/x86-64-v3-poky-linux/thin-provisioning-tools/1.3.1/b=
uild/target/release/build/devicemapper-b41f072d20778f8f -C linker=3D/buil=
d/tmp/work/x86-64-v3-poky-linux/thin-provisioning-tools/1.3.1/wrapper/bui=
ld-rust-ccld -L dependency=3D/build/tmp/work/x86-64-v3-poky-linux/thin-pr=
ovisioning-tools/1.3.1/build/target/release/deps --extern devicemapper_sy=
s=3D/build/tmp/work/x86-64-v3-poky-linux/thin-provisioning-tools/1.3.1/bu=
ild/target/release/deps/libdevicemapper_sys-6aed6a4a922755f2.rlib --exter=
n semver=3D/build/tmp/work/x86-64-v3-poky-linux/thin-provisioning-tools/1=
=2E3.1/build/target/release/deps/libsemver-f3c6ab5d9d5b9b08.rlib --cap-li=
nts allow -L native=3D/build/tmp/work/x86-64-v3-poky-linux/thin-provision=
ing-tools/1.3.1/recipe-sysroot/usr/lib` (exit status: 1)
> ```
>=20
> I can fix this with adding `BUILD_LDFLAGS +=3D "-L/usr/lib/x86_64-linux=
-gnu"`,
> but this does not look fine. Has anyone an idea how to tell the linker =
to
> search libm in /usr/lib/x86_64-linux-gnu (Debian)?
>=20
> ------------------------------
>=20
> * https://github.com/jthornber/thin-provisioning-tools#project-hosting =
says:
>=20
>   The upstream repository has been moved to device-mapper-utils[1], an
>   organization established to collect utilities for various device mapp=
er
>   targets. While the original repository remains mirrored, we recommend=

>   cloning from the new location[2] for better long-term maintenance.
>=20
>   [1]: https://github.com/device-mapper-utils/
>   [2]: https://github.com/device-mapper-utils/thin-provisioning-tools
>=20
> * 0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch got m=
erged
>   upstream in rust-lang/libc.
>=20
> * dependency rio got dropped in 1.3.0
>=20
> From thin-provisioning-tools-1.3.1/CHANGES:
>=20
> v1.3.1
> =3D=3D=3D=3D=3D=3D
>=20
> - Improve thin_ls performance using the optimized approach from thin_ch=
eck
>=20
> v1.3.0
> =3D=3D=3D=3D=3D=3D
>=20
> - Improve thin_check performance with an optimized I/O strategy and mor=
e
>   memory-efficient data structures.
> - Rewrite AsyncIoEngine using tokio IoUring, removing the rio dependenc=
y
> - Enhance thin_check with edge-case fixes, including space map boundary=
 checks
> - Update thin_explore to use ratatui, replacing the archived tui crate
>=20
> v1.2.2
> =3D=3D=3D=3D=3D=3D=3D
>=20
> - Fix command line parsing for era_invalidate --metadata-snapshot
>=20
> v1.2.1
> =3D=3D=3D=3D=3D=3D=3D
>=20
> - Fix incorrect number of data blocks in thin_shrink's output superbloc=
k
>=20
> v1.2.0
> =3D=3D=3D=3D=3D=3D=3D
>=20
> - Remove atty and safemem dependencies due to security concerns
> - Remove unused threaded btree walk code
> - Change BTreeWalker constructor to take IoEngine by reference for simp=
licity
>   (breaking change)
> - Update fixedbitset and few other dependencies with required code chan=
ges
>=20
> Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> ---
>  .../thin-provisioning-tools-crates.inc        | 556 +++++++++++-------=

>  .../thin-provisioning-tools-git-crates.inc    |   6 -
>  ...l-codes-on-riscv32gc-unknown-linux-g.patch |  38 --
>  .../0001-Use-portable-atomics-crate.patch     |  30 +-
>  ....0.bb =3D> thin-provisioning-tools_1.3.1.bb} |  12 +-
>  5 files changed, 343 insertions(+), 299 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/thin-provisioning-tools/thi=
n-provisioning-tools-git-crates.inc
>  delete mode 100644 meta-oe/recipes-support/thin-provisioning-tools/thi=
n-provisioning-tools/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-li=
nux-g.patch
>  rename meta-oe/recipes-support/thin-provisioning-tools/{thin-provision=
ing-tools_1.1.0.bb =3D> thin-provisioning-tools_1.3.1.bb} (80%)
>=20
> diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provi=
sioning-tools-crates.inc b/meta-oe/recipes-support/thin-provisioning-tool=
s/thin-provisioning-tools-crates.inc
> index e06fc31905..3876cb88cc 100644
> --- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning=
-tools-crates.inc
> +++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning=
-tools-crates.inc
> @@ -2,281 +2,381 @@
> =20
>  # from Cargo.lock
>  SRC_URI +=3D " \
> -    crate://crates.io/adler/1.0.2 \
> -    crate://crates.io/aho-corasick/1.1.3 \
> -    crate://crates.io/anstream/0.6.15 \
> -    crate://crates.io/anstyle/1.0.8 \
> -    crate://crates.io/anstyle-parse/0.2.5 \
> -    crate://crates.io/anstyle-query/1.1.1 \
> -    crate://crates.io/anstyle-wincon/3.0.4 \
> -    crate://crates.io/anyhow/1.0.86 \
> -    crate://crates.io/atty/0.2.14 \
> -    crate://crates.io/autocfg/1.3.0 \
> +    crate://crates.io/adler2/2.0.1 \
> +    crate://crates.io/aho-corasick/1.1.4 \
> +    crate://crates.io/allocator-api2/0.2.21 \
> +    crate://crates.io/anstream/0.6.21 \
> +    crate://crates.io/anstyle/1.0.13 \
> +    crate://crates.io/anstyle-parse/0.2.7 \
> +    crate://crates.io/anstyle-query/1.1.5 \
> +    crate://crates.io/anstyle-wincon/3.0.11 \
> +    crate://crates.io/anyhow/1.0.100 \
> +    crate://crates.io/autocfg/1.5.0 \
>      crate://crates.io/base64/0.22.1 \
> -    crate://crates.io/bindgen/0.69.4 \
> -    crate://crates.io/bitflags/1.3.2 \
> -    crate://crates.io/bitflags/2.6.0 \
> -    crate://crates.io/bytemuck/1.16.3 \
> +    crate://crates.io/bindgen/0.72.1 \
> +    crate://crates.io/bitflags/2.10.0 \
> +    crate://crates.io/bumpalo/3.19.0 \
> +    crate://crates.io/bytemuck/1.24.0 \
>      crate://crates.io/byteorder/1.5.0 \
>      crate://crates.io/cassowary/0.3.0 \
> +    crate://crates.io/castaway/0.2.4 \
>      crate://crates.io/cexpr/0.6.0 \
> -    crate://crates.io/cfg-if/1.0.0 \
> +    crate://crates.io/cfg-if/1.0.4 \
>      crate://crates.io/cfg_aliases/0.2.1 \
>      crate://crates.io/clang-sys/1.8.1 \
> -    crate://crates.io/clap/4.5.13 \
> -    crate://crates.io/clap_builder/4.5.13 \
> -    crate://crates.io/clap_lex/0.7.2 \
> -    crate://crates.io/colorchoice/1.0.2 \
> -    crate://crates.io/console/0.15.8 \
> +    crate://crates.io/clap/4.5.52 \
> +    crate://crates.io/clap_builder/4.5.52 \
> +    crate://crates.io/clap_lex/0.7.6 \
> +    crate://crates.io/colorchoice/1.0.4 \
> +    crate://crates.io/compact_str/0.8.1 \
> +    crate://crates.io/console/0.16.1 \
>      crate://crates.io/crc32c/0.6.8 \
> -    crate://crates.io/crc32fast/1.4.2 \
> -    crate://crates.io/data-encoding/2.6.0 \
> -    crate://crates.io/devicemapper/0.34.3 \
> -    crate://crates.io/devicemapper-sys/0.3.0 \
> +    crate://crates.io/crc32fast/1.5.0 \
> +    crate://crates.io/darling/0.20.11 \
> +    crate://crates.io/darling_core/0.20.11 \
> +    crate://crates.io/darling_macro/0.20.11 \
> +    crate://crates.io/data-encoding/2.9.0 \
> +    crate://crates.io/devicemapper/0.34.5 \
> +    crate://crates.io/devicemapper-sys/0.3.3 \
>      crate://crates.io/downcast/0.11.0 \
> -    crate://crates.io/duct/0.13.7 \
> -    crate://crates.io/either/1.13.0 \
> -    crate://crates.io/encode_unicode/0.3.6 \
> -    crate://crates.io/env_filter/0.1.2 \
> +    crate://crates.io/duct/1.1.1 \
> +    crate://crates.io/either/1.15.0 \
> +    crate://crates.io/encode_unicode/1.0.0 \
> +    crate://crates.io/env_filter/0.1.4 \
>      crate://crates.io/env_logger/0.8.4 \
> -    crate://crates.io/env_logger/0.11.5 \
> -    crate://crates.io/errno/0.3.9 \
> +    crate://crates.io/env_logger/0.11.8 \
> +    crate://crates.io/equivalent/1.0.2 \
> +    crate://crates.io/errno/0.3.14 \
>      crate://crates.io/exitcode/1.1.2 \
> -    crate://crates.io/fastrand/2.1.0 \
> -    crate://crates.io/fixedbitset/0.4.2 \
> -    crate://crates.io/flate2/1.0.31 \
> -    crate://crates.io/fragile/2.0.0 \
> -    crate://crates.io/getrandom/0.2.15 \
> -    crate://crates.io/glob/0.3.1 \
> -    crate://crates.io/hermit-abi/0.1.19 \
> +    crate://crates.io/fastrand/2.3.0 \
> +    crate://crates.io/fixedbitset/0.5.7 \
> +    crate://crates.io/flate2/1.1.5 \
> +    crate://crates.io/fnv/1.0.7 \
> +    crate://crates.io/foldhash/0.1.5 \
> +    crate://crates.io/fragile/2.0.1 \
> +    crate://crates.io/getrandom/0.2.16 \
> +    crate://crates.io/getrandom/0.3.4 \
> +    crate://crates.io/glob/0.3.3 \
> +    crate://crates.io/hashbrown/0.15.5 \
> +    crate://crates.io/heck/0.5.0 \
>      crate://crates.io/hermit-abi/0.3.9 \
> -    crate://crates.io/humantime/2.1.0 \
> -    crate://crates.io/indicatif/0.17.8 \
> -    crate://crates.io/instant/0.1.13 \
> +    crate://crates.io/hermit-abi/0.5.2 \
> +    crate://crates.io/ident_case/1.0.1 \
> +    crate://crates.io/indicatif/0.18.3 \
> +    crate://crates.io/indoc/2.0.7 \
> +    crate://crates.io/instability/0.3.9 \
> +    crate://crates.io/io-lifetimes/1.0.11 \
> +    crate://crates.io/io-uring/0.7.11 \
>      crate://crates.io/iovec/0.1.4 \
> -    crate://crates.io/is_terminal_polyfill/1.70.1 \
> -    crate://crates.io/itertools/0.12.1 \
> -    crate://crates.io/lazy_static/1.5.0 \
> -    crate://crates.io/lazycell/1.3.0 \
> -    crate://crates.io/libc/0.2.155 \
> -    crate://crates.io/libloading/0.8.5 \
> +    crate://crates.io/is_terminal_polyfill/1.70.2 \
> +    crate://crates.io/itertools/0.13.0 \
> +    crate://crates.io/itoa/1.0.15 \
> +    crate://crates.io/jiff/0.2.16 \
> +    crate://crates.io/jiff-static/0.2.16 \
> +    crate://crates.io/js-sys/0.3.82 \
> +    crate://crates.io/libc/0.2.177 \
> +    crate://crates.io/libloading/0.8.9 \
> +    crate://crates.io/libredox/0.1.10 \
>      crate://crates.io/libudev-sys/0.1.4 \
> -    crate://crates.io/linux-raw-sys/0.4.14 \
> -    crate://crates.io/log/0.4.22 \
> -    crate://crates.io/memchr/2.7.4 \
> +    crate://crates.io/linux-raw-sys/0.11.0 \
> +    crate://crates.io/log/0.4.28 \
> +    crate://crates.io/lru/0.12.5 \
> +    crate://crates.io/memchr/2.7.6 \
>      crate://crates.io/minimal-lexical/0.2.1 \
> -    crate://crates.io/miniz_oxide/0.7.4 \
> -    crate://crates.io/mockall/0.13.0 \
> -    crate://crates.io/mockall_derive/0.13.0 \
> -    crate://crates.io/nix/0.29.0 \
> +    crate://crates.io/miniz_oxide/0.8.9 \
> +    crate://crates.io/mockall/0.13.1 \
> +    crate://crates.io/mockall_derive/0.13.1 \
> +    crate://crates.io/nix/0.30.1 \
>      crate://crates.io/nom/7.1.3 \
> +    crate://crates.io/nom/8.0.0 \
>      crate://crates.io/num-derive/0.4.2 \
>      crate://crates.io/num-traits/0.2.19 \
> -    crate://crates.io/num_cpus/1.16.0 \
> -    crate://crates.io/number_prefix/0.4.0 \
> -    crate://crates.io/numtoa/0.1.0 \
> -    crate://crates.io/once_cell/1.19.0 \
> -    crate://crates.io/os_pipe/1.2.1 \
> -    crate://crates.io/pkg-config/0.3.30 \
> -    crate://crates.io/portable-atomic/1.11.0 \
> -    crate://crates.io/ppv-lite86/0.2.20 \
> -    crate://crates.io/predicates/3.1.2 \
> -    crate://crates.io/predicates-core/1.0.8 \
> -    crate://crates.io/predicates-tree/1.0.11 \
> -    crate://crates.io/proc-macro2/1.0.86 \
> -    crate://crates.io/quick-xml/0.36.1 \
> +    crate://crates.io/num_cpus/1.17.0 \
> +    crate://crates.io/numtoa/0.2.4 \
> +    crate://crates.io/once_cell/1.21.3 \
> +    crate://crates.io/once_cell_polyfill/1.70.2 \
> +    crate://crates.io/os_pipe/1.2.3 \
> +    crate://crates.io/paste/1.0.15 \
> +    crate://crates.io/pkg-config/0.3.32 \
> +    crate://crates.io/portable-atomic/1.11.1 \
> +    crate://crates.io/portable-atomic-util/0.2.4 \
> +    crate://crates.io/ppv-lite86/0.2.21 \
> +    crate://crates.io/predicates/3.1.3 \
> +    crate://crates.io/predicates-core/1.0.9 \
> +    crate://crates.io/predicates-tree/1.0.12 \
> +    crate://crates.io/prettyplease/0.2.37 \
> +    crate://crates.io/proc-macro2/1.0.103 \
> +    crate://crates.io/quick-xml/0.38.4 \
>      crate://crates.io/quickcheck/1.0.3 \
> -    crate://crates.io/quickcheck_macros/1.0.0 \
> -    crate://crates.io/quote/1.0.36 \
> +    crate://crates.io/quickcheck_macros/1.1.0 \
> +    crate://crates.io/quote/1.0.42 \
> +    crate://crates.io/r-efi/5.3.0 \
>      crate://crates.io/rand/0.8.5 \
> -    crate://crates.io/rand_chacha/0.3.1 \
> +    crate://crates.io/rand/0.9.2 \
> +    crate://crates.io/rand_chacha/0.9.0 \
>      crate://crates.io/rand_core/0.6.4 \
> -    crate://crates.io/rangemap/1.5.1 \
> -    crate://crates.io/redox_syscall/0.2.16 \
> +    crate://crates.io/rand_core/0.9.3 \
> +    crate://crates.io/rangemap/1.7.0 \
> +    crate://crates.io/ratatui/0.29.0 \
> +    crate://crates.io/redox_syscall/0.5.18 \
>      crate://crates.io/redox_termios/0.1.3 \
> -    crate://crates.io/regex/1.10.6 \
> -    crate://crates.io/regex-automata/0.4.7 \
> -    crate://crates.io/regex-syntax/0.8.4 \
> -    crate://crates.io/retry/2.0.0 \
> -    crate://crates.io/roaring/0.10.6 \
> -    crate://crates.io/rustc-hash/1.1.0 \
> -    crate://crates.io/rustc_version/0.4.0 \
> -    crate://crates.io/rustix/0.38.34 \
> -    crate://crates.io/safemem/0.3.3 \
> -    crate://crates.io/semver/1.0.23 \
> -    crate://crates.io/serde/1.0.204 \
> -    crate://crates.io/serde_derive/1.0.204 \
> -    crate://crates.io/shared_child/1.0.1 \
> +    crate://crates.io/regex/1.12.2 \
> +    crate://crates.io/regex-automata/0.4.13 \
> +    crate://crates.io/regex-syntax/0.8.8 \
> +    crate://crates.io/retry/2.1.0 \
> +    crate://crates.io/roaring/0.11.2 \
> +    crate://crates.io/rustc-hash/2.1.1 \
> +    crate://crates.io/rustc_version/0.4.1 \
> +    crate://crates.io/rustix/1.1.2 \
> +    crate://crates.io/rustversion/1.0.22 \
> +    crate://crates.io/ryu/1.0.20 \
> +    crate://crates.io/semver/1.0.27 \
> +    crate://crates.io/serde/1.0.228 \
> +    crate://crates.io/serde_core/1.0.228 \
> +    crate://crates.io/serde_derive/1.0.228 \
> +    crate://crates.io/shared_child/1.1.1 \
> +    crate://crates.io/shared_thread/0.2.0 \
>      crate://crates.io/shlex/1.3.0 \
> +    crate://crates.io/sigchld/0.2.4 \
> +    crate://crates.io/signal-hook/0.3.18 \
> +    crate://crates.io/signal-hook-registry/1.4.6 \
> +    crate://crates.io/simd-adler32/0.3.7 \
> +    crate://crates.io/static_assertions/1.1.0 \
>      crate://crates.io/strsim/0.11.1 \
> -    crate://crates.io/syn/1.0.109 \
> -    crate://crates.io/syn/2.0.72 \
> -    crate://crates.io/tempfile/3.11.0 \
> -    crate://crates.io/termion/1.5.6 \
> -    crate://crates.io/termtree/0.4.1 \
> -    crate://crates.io/thiserror/1.0.63 \
> -    crate://crates.io/thiserror-impl/1.0.63 \
> -    crate://crates.io/threadpool/1.8.1 \
> -    crate://crates.io/tui/0.19.0 \
> -    crate://crates.io/udev/0.7.0 \
> -    crate://crates.io/unicode-ident/1.0.12 \
> -    crate://crates.io/unicode-segmentation/1.11.0 \
> -    crate://crates.io/unicode-width/0.1.13 \
> +    crate://crates.io/strum/0.26.3 \
> +    crate://crates.io/strum_macros/0.26.4 \
> +    crate://crates.io/syn/2.0.110 \
> +    crate://crates.io/tempfile/3.23.0 \
> +    crate://crates.io/termion/4.0.5 \
> +    crate://crates.io/termtree/0.5.1 \
> +    crate://crates.io/thiserror/2.0.17 \
> +    crate://crates.io/thiserror-impl/2.0.17 \
> +    crate://crates.io/udev/0.9.3 \
> +    crate://crates.io/unicode-ident/1.0.22 \
> +    crate://crates.io/unicode-segmentation/1.12.0 \
> +    crate://crates.io/unicode-truncate/1.1.0 \
> +    crate://crates.io/unicode-width/0.1.14 \
> +    crate://crates.io/unicode-width/0.2.0 \
> +    crate://crates.io/unit-prefix/0.5.2 \
>      crate://crates.io/utf8parse/0.2.2 \
> -    crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
> -    crate://crates.io/winapi/0.3.9 \
> -    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
> -    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
> -    crate://crates.io/windows-sys/0.52.0 \
> -    crate://crates.io/windows-sys/0.59.0 \
> -    crate://crates.io/windows-targets/0.52.6 \
> -    crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
> -    crate://crates.io/windows_aarch64_msvc/0.52.6 \
> -    crate://crates.io/windows_i686_gnu/0.52.6 \
> -    crate://crates.io/windows_i686_gnullvm/0.52.6 \
> -    crate://crates.io/windows_i686_msvc/0.52.6 \
> -    crate://crates.io/windows_x86_64_gnu/0.52.6 \
> -    crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
> -    crate://crates.io/windows_x86_64_msvc/0.52.6 \
> -    crate://crates.io/zerocopy/0.7.35 \
> -    crate://crates.io/zerocopy-derive/0.7.35 \
> +    crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
> +    crate://crates.io/wasip2/1.0.1+wasi-0.2.4 \
> +    crate://crates.io/wasm-bindgen/0.2.105 \
> +    crate://crates.io/wasm-bindgen-macro/0.2.105 \
> +    crate://crates.io/wasm-bindgen-macro-support/0.2.105 \
> +    crate://crates.io/wasm-bindgen-shared/0.2.105 \
> +    crate://crates.io/web-time/1.1.0 \
> +    crate://crates.io/windows-link/0.2.1 \
> +    crate://crates.io/windows-sys/0.48.0 \
> +    crate://crates.io/windows-sys/0.60.2 \
> +    crate://crates.io/windows-sys/0.61.2 \
> +    crate://crates.io/windows-targets/0.48.5 \
> +    crate://crates.io/windows-targets/0.53.5 \
> +    crate://crates.io/windows_aarch64_gnullvm/0.48.5 \
> +    crate://crates.io/windows_aarch64_gnullvm/0.53.1 \
> +    crate://crates.io/windows_aarch64_msvc/0.48.5 \
> +    crate://crates.io/windows_aarch64_msvc/0.53.1 \
> +    crate://crates.io/windows_i686_gnu/0.48.5 \
> +    crate://crates.io/windows_i686_gnu/0.53.1 \
> +    crate://crates.io/windows_i686_gnullvm/0.53.1 \
> +    crate://crates.io/windows_i686_msvc/0.48.5 \
> +    crate://crates.io/windows_i686_msvc/0.53.1 \
> +    crate://crates.io/windows_x86_64_gnu/0.48.5 \
> +    crate://crates.io/windows_x86_64_gnu/0.53.1 \
> +    crate://crates.io/windows_x86_64_gnullvm/0.48.5 \
> +    crate://crates.io/windows_x86_64_gnullvm/0.53.1 \
> +    crate://crates.io/windows_x86_64_msvc/0.48.5 \
> +    crate://crates.io/windows_x86_64_msvc/0.53.1 \
> +    crate://crates.io/wit-bindgen/0.46.0 \
> +    crate://crates.io/zerocopy/0.8.27 \
> +    crate://crates.io/zerocopy-derive/0.8.27 \
>  "
> =20
> -SRC_URI[adler-1.0.2.sha256sum] =3D "f26201604c87b1e01bd3d98f8d5d9a8fcb=
b815e8cedb41ffccbeb4bf593a35fe"
> -SRC_URI[aho-corasick-1.1.3.sha256sum] =3D "8e60d3430d3a69478ad0993f192=
38d2df97c507009a52b3c10addcd7f6bcb916"
> -SRC_URI[anstream-0.6.15.sha256sum] =3D "64e15c1ab1f89faffbf04a634d5e19=
62e9074f2741eef6d97f3c4e322426d526"
> -SRC_URI[anstyle-1.0.8.sha256sum] =3D "1bec1de6f59aedf83baf9ff929c98f2a=
d654b97c9510f4e70cf6f661d49fd5b1"
> -SRC_URI[anstyle-parse-0.2.5.sha256sum] =3D "eb47de1e80c2b463c735db5b21=
7a0ddc39d612e7ac9e2e96a5aed1f57616c1cb"
> -SRC_URI[anstyle-query-1.1.1.sha256sum] =3D "6d36fc52c7f6c869915e994129=
12f22093507da8d9e942ceaf66fe4b7c14422a"
> -SRC_URI[anstyle-wincon-3.0.4.sha256sum] =3D "5bf74e1b6e971609db8ca7a9c=
e79fd5768ab6ae46441c572e46cf596f59e57f8"
> -SRC_URI[anyhow-1.0.86.sha256sum] =3D "b3d1d046238990b9cf5bcde22a3fb358=
4ee5cf65fb2765f454ed428c7a0063da"
> -SRC_URI[atty-0.2.14.sha256sum] =3D "d9b39be18770d11421cdb1b9947a45dd3f=
37e93092cbf377614828a319d5fee8"
> -SRC_URI[autocfg-1.3.0.sha256sum] =3D "0c4b4d0bd25bd0b74681c0ad21497610=
ce1b7c91b1022cd21c80c6fbdd9476b0"
> +SRC_URI[adler2-2.0.1.sha256sum] =3D "320119579fcad9c21884f5c4861d16174=
d0e06250625266f50fe6898340abefa"
> +SRC_URI[aho-corasick-1.1.4.sha256sum] =3D "ddd31a130427c27518df266943a=
5308ed92d4b226cc639f5a8f1002816174301"
> +SRC_URI[allocator-api2-0.2.21.sha256sum] =3D "683d7910e743518b0e34f118=
6f92494becacb047c7b6bf616c96772180fef923"
> +SRC_URI[anstream-0.6.21.sha256sum] =3D "43d5b281e737544384e969a5ccad3f=
1cdd24b48086a0fc1b2a5262a26b8f4f4a"
> +SRC_URI[anstyle-1.0.13.sha256sum] =3D "5192cca8006f1fd4f7237516f40fa18=
3bb07f8fbdfedaa0036de5ea9b0b45e78"
> +SRC_URI[anstyle-parse-0.2.7.sha256sum] =3D "4e7644824f0aa2c7b938457923=
4ef10eb7efb6a0deb83f9630a49594dd9c15c2"
> +SRC_URI[anstyle-query-1.1.5.sha256sum] =3D "40c48f72fd53cd289104fc6409=
9abca73db4166ad86ea0b4341abe65af83dadc"
> +SRC_URI[anstyle-wincon-3.0.11.sha256sum] =3D "291e6a250ff86cd4a820112f=
b8898808a366d8f9f58ce16d1f538353ad55747d"
> +SRC_URI[anyhow-1.0.100.sha256sum] =3D "a23eb6b1614318a8071c9b2521f36b4=
24b2c83db5eb3a0fead4a6c0809af6e61"
> +SRC_URI[autocfg-1.5.0.sha256sum] =3D "c08606f8c3cbf4ce6ec8e28fb0014a2c=
086708fe954eaa885384a6165172e7e8"
>  SRC_URI[base64-0.22.1.sha256sum] =3D "72b3254f16251a8381aa12e40e3c4d2f=
0199f8c6508fbecb9d91f575e0fbb8c6"
> -SRC_URI[bindgen-0.69.4.sha256sum] =3D "a00dc851838a2120612785d19528747=
5a3ac45514741da670b735818822129a0"
> -SRC_URI[bitflags-1.3.2.sha256sum] =3D "bef38d45163c2f1dde094a7dfd33ccf=
595c92905c8f8f4fdc18d06fb1037718a"
> -SRC_URI[bitflags-2.6.0.sha256sum] =3D "b048fb63fd8b5923fc5aa7b340d8e15=
6aec7ec02f0c78fa8a6ddc2613f6f71de"
> -SRC_URI[bytemuck-1.16.3.sha256sum] =3D "102087e286b4677862ea56cf8fc58b=
b2cdfa8725c40ffb80fe3a008eb7f2fc83"
> +SRC_URI[bindgen-0.72.1.sha256sum] =3D "993776b509cfb49c750f11b8f07a46f=
a23e0a1386ffc01fb1e7d343efc387895"
> +SRC_URI[bitflags-2.10.0.sha256sum] =3D "812e12b5285cc515a9c72a5c1d3b6d=
46a19dac5acfef5265968c166106e31dd3"
> +SRC_URI[bumpalo-3.19.0.sha256sum] =3D "46c5e41b57b8bba42a04676d81cb89e=
9ee8e859a1a66f80a5a72e1cb76b34d43"
> +SRC_URI[bytemuck-1.24.0.sha256sum] =3D "1fbdf580320f38b612e485521afda1=
ee26d10cc9884efaaa750d383e13e3c5f4"
>  SRC_URI[byteorder-1.5.0.sha256sum] =3D "1fd0f2584146f6f2ef48085050886a=
cf353beff7305ebd1ae69500e27c67f64b"
>  SRC_URI[cassowary-0.3.0.sha256sum] =3D "df8670b8c7b9dae1793364eafadf72=
39c40d669904660c5960d74cfd80b46a53"
> +SRC_URI[castaway-0.2.4.sha256sum] =3D "dec551ab6e7578819132c713a93c022=
a05d60159dc86e7a7050223577484c55a"
>  SRC_URI[cexpr-0.6.0.sha256sum] =3D "6fac387a98bb7c37292057cffc56d62ecb=
629900026402633ae9160df93a8766"
> -SRC_URI[cfg-if-1.0.0.sha256sum] =3D "baf1de4339761588bc0619e3cbc0120ee=
582ebb74b53b4efbf79117bd2da40fd"
> +SRC_URI[cfg-if-1.0.4.sha256sum] =3D "9330f8b2ff13f34540b44e946ef351118=
25727b38d33286ef986142615121801"
>  SRC_URI[cfg_aliases-0.2.1.sha256sum] =3D "613afe47fcd5fac7ccf1db93babc=
b082c5994d996f20b8b159f2ad1658eb5724"
>  SRC_URI[clang-sys-1.8.1.sha256sum] =3D "0b023947811758c97c59bf9d1c188f=
d619ad4718dcaa767947df1cadb14f39f4"
> -SRC_URI[clap-4.5.13.sha256sum] =3D "0fbb260a053428790f3de475e304ff84cd=
bc4face759ea7a3e64c1edd938a7fc"
> -SRC_URI[clap_builder-4.5.13.sha256sum] =3D "64b17d7ea74e9f833c7dbf2cbe=
4fb12ff26783eda4782a8975b72f895c9b4d99"
> -SRC_URI[clap_lex-0.7.2.sha256sum] =3D "1462739cb27611015575c0c11df5df7=
601141071f07518d56fcc1be504cbec97"
> -SRC_URI[colorchoice-1.0.2.sha256sum] =3D "d3fd119d74b830634cea2a0f58bb=
d0d54540518a14397557951e79340abc28c0"
> -SRC_URI[console-0.15.8.sha256sum] =3D "0e1f83fc076bd6dd27517eacdf25fef=
6c4dfe5f1d7448bafaaf3a26f13b5e4eb"
> +SRC_URI[clap-4.5.52.sha256sum] =3D "aa8120877db0e5c011242f96806ce3c94e=
0737ab8108532a76a3300a01db2ab8"
> +SRC_URI[clap_builder-4.5.52.sha256sum] =3D "02576b399397b659c26064fbc9=
2a75fede9d18ffd5f80ca1cd74ddab167016e1"
> +SRC_URI[clap_lex-0.7.6.sha256sum] =3D "a1d728cc89cf3aee9ff92b05e62b19e=
e65a02b5702cff7d5a377e32c6ae29d8d"
> +SRC_URI[colorchoice-1.0.4.sha256sum] =3D "b05b61dc5112cbb17e4b6cd61790=
d9845d13888356391624cbe7e41efeac1e75"
> +SRC_URI[compact_str-0.8.1.sha256sum] =3D "3b79c4069c6cad78e2e0cdfcbd26=
275770669fb39fd308a752dc110e83b9af32"
> +SRC_URI[console-0.16.1.sha256sum] =3D "b430743a6eb14e9764d4260d4c0d812=
3087d504eeb9c48f2b2a5e810dd369df4"
>  SRC_URI[crc32c-0.6.8.sha256sum] =3D "3a47af21622d091a8f0fb295b88bc886a=
c74efcc613efc19f5d0b21de5c89e47"
> -SRC_URI[crc32fast-1.4.2.sha256sum] =3D "a97769d94ddab943e4510d13815016=
9a2758b5ef3eb191a9ee688de3e23ef7b3"
> -SRC_URI[data-encoding-2.6.0.sha256sum] =3D "e8566979429cf69b49a5c740c6=
0791108e86440e8be149bbea4fe54d2c32d6e2"
> -SRC_URI[devicemapper-0.34.3.sha256sum] =3D "59209790c5d189070a52937581=
950947207e740fadc87f68af14f34d0eb333df"
> -SRC_URI[devicemapper-sys-0.3.0.sha256sum] =3D "3d6681f5413e2094480381a=
97b8299f548c0579f07095ee20fe58e0a28cb34b5"
> +SRC_URI[crc32fast-1.5.0.sha256sum] =3D "9481c1c90cbf2ac953f07c8d4a58aa=
3945c425b7185c9154d67a65e4230da511"
> +SRC_URI[darling-0.20.11.sha256sum] =3D "fc7f46116c46ff9ab3eb1597a45688=
b6715c6e628b5c133e288e709a29bcb4ee"
> +SRC_URI[darling_core-0.20.11.sha256sum] =3D "0d00b9596d185e565c2207a0b=
01f8bd1a135483d02d9b7b0a54b11da8d53412e"
> +SRC_URI[darling_macro-0.20.11.sha256sum] =3D "fc34b93ccb385b40dc71c6fc=
eac4b2ad23662c7eeb248cf10d529b7e055b6ead"
> +SRC_URI[data-encoding-2.9.0.sha256sum] =3D "2a2330da5de22e8a3cb63252ce=
2abb30116bf5265e89c0e01bc17015ce30a476"
> +SRC_URI[devicemapper-0.34.5.sha256sum] =3D "f8ca2baf05e507adafc3524fb6=
87aa15f2f9953de808c6a4cbd57a7f2e5aa883"
> +SRC_URI[devicemapper-sys-0.3.3.sha256sum] =3D "06421aaad10b53bd5d1fe00=
4c26efddfaaeaa4438ff52b84a0f660b3c87d63e6"
>  SRC_URI[downcast-0.11.0.sha256sum] =3D "1435fa1053d8b2fbbe9be7e97eca7f=
33d37b28409959813daefc1446a14247f1"
> -SRC_URI[duct-0.13.7.sha256sum] =3D "e4ab5718d1224b63252cd0c6f74f6480f9=
ffeb117438a2e0f5cf6d9a4798929c"
> -SRC_URI[either-1.13.0.sha256sum] =3D "60b1af1c220855b6ceac025d3f6ecdd2=
b7c4894bfe9cd9bda4fbb4bc7c0d4cf0"
> -SRC_URI[encode_unicode-0.3.6.sha256sum] =3D "a357d28ed41a50f9c765dbfe5=
6cbc04a64e53e5fc58ba79fbc34c10ef3df831f"
> -SRC_URI[env_filter-0.1.2.sha256sum] =3D "4f2c92ceda6ceec50f43169f9ee84=
24fe2db276791afde7b2cd8bc084cb376ab"
> +SRC_URI[duct-1.1.1.sha256sum] =3D "7e66e9c0c03d094e1a0ba1be130b849034a=
a80c3a2ab8ee94316bc809f3fa684"
> +SRC_URI[either-1.15.0.sha256sum] =3D "48c757948c5ede0e46177b7add2e6715=
5f70e33c07fea8284df6576da70b3719"
> +SRC_URI[encode_unicode-1.0.0.sha256sum] =3D "34aa73646ffb006b8f5147f3d=
c182bd4bcb190227ce861fc4a4844bf8e3cb2c0"
> +SRC_URI[env_filter-0.1.4.sha256sum] =3D "1bf3c259d255ca70051b30e2e95b5=
446cdb8949ac4cd22c0d7fd634d89f568e2"
>  SRC_URI[env_logger-0.8.4.sha256sum] =3D "a19187fea3ac7e84da7dacf48de0c=
45d63c6a76f9490dae389aead16c243fce3"
> -SRC_URI[env_logger-0.11.5.sha256sum] =3D "e13fa619b91fb2381732789fc5de=
83b45675e882f66623b7d8cb4f643017018d"
> -SRC_URI[errno-0.3.9.sha256sum] =3D "534c5cf6194dfab3db3242765c03bbe257=
cf92f22b38f6bc0c58d59108a820ba"
> +SRC_URI[env_logger-0.11.8.sha256sum] =3D "13c863f0904021b108aa8b2f5504=
6443e6b1ebde8fd4a15c399893aae4fa069f"
> +SRC_URI[equivalent-1.0.2.sha256sum] =3D "877a4ace8713b0bcf2a4e7eec8252=
9c029f1d0619886d18145fea96c3ffe5c0f"
> +SRC_URI[errno-0.3.14.sha256sum] =3D "39cab71617ae0d63f51a36d69f8663917=
35b51691dbda63cf6f96d042b63efeb"
>  SRC_URI[exitcode-1.1.2.sha256sum] =3D "de853764b47027c2e862a995c34978f=
fa63c1501f2e15f987ba11bd4f9bba193"
> -SRC_URI[fastrand-2.1.0.sha256sum] =3D "9fc0510504f03c51ada170672ac806f=
1f105a88aa97a5281117e1ddc3368e51a"
> -SRC_URI[fixedbitset-0.4.2.sha256sum] =3D "0ce7134b9999ecaf8bcd65542e43=
6736ef32ddca1b3e06094cb6ec5755203b80"
> -SRC_URI[flate2-1.0.31.sha256sum] =3D "7f211bbe8e69bbd0cfdea405084f128a=
e8b4aaa6b0b522fc8f2b009084797920"
> -SRC_URI[fragile-2.0.0.sha256sum] =3D "6c2141d6d6c8512188a7891b4b01590a=
45f6dac67afb4f255c4124dbb86d4eaa"
> -SRC_URI[getrandom-0.2.15.sha256sum] =3D "c4567c8db10ae91089c99af84c68c=
38da3ec2f087c3f82960bcdbf3656b6f4d7"
> -SRC_URI[glob-0.3.1.sha256sum] =3D "d2fabcfbdc87f4758337ca535fb41a6d701=
b65693ce38287d856d1674551ec9b"
> -SRC_URI[hermit-abi-0.1.19.sha256sum] =3D "62b467343b94ba476dcb2500d242=
dadbb39557df889310ac77c5d99100aaac33"
> +SRC_URI[fastrand-2.3.0.sha256sum] =3D "37909eebbb50d72f9059c3b6d82c046=
3f2ff062c9e95845c43a6c9c0355411be"
> +SRC_URI[fixedbitset-0.5.7.sha256sum] =3D "1d674e81391d1e1ab681a28d99df=
07927c6d4aa5b027d7da16ba32d1d21ecd99"
> +SRC_URI[flate2-1.1.5.sha256sum] =3D "bfe33edd8e85a12a67454e37f8c75e730=
830d83e313556ab9ebf9ee7fbeb3bfb"
> +SRC_URI[fnv-1.0.7.sha256sum] =3D "3f9eec918d3f24069decb9af1554cad7c880=
e2da24a9afd88aca000531ab82c1"
> +SRC_URI[foldhash-0.1.5.sha256sum] =3D "d9c4f5dac5e15c24eb999c26181a6ca=
40b39fe946cbe4c263c7209467bc83af2"
> +SRC_URI[fragile-2.0.1.sha256sum] =3D "28dd6caf6059519a65843af8fe2a3ae2=
98b14b80179855aeb4adc2c1934ee619"
> +SRC_URI[getrandom-0.2.16.sha256sum] =3D "335ff9f135e4384c8150d6f27c6da=
ed433577f86b4750418338c01a1a2528592"
> +SRC_URI[getrandom-0.3.4.sha256sum] =3D "899def5c37c4fd7b2664648c28120e=
cec138e4d395b459e5ca34f9cce2dd77fd"
> +SRC_URI[glob-0.3.3.sha256sum] =3D "0cc23270f6e1808e30a928bdc84dea0b9b4=
136a8bc82338574f23baf47bbd280"
> +SRC_URI[hashbrown-0.15.5.sha256sum] =3D "9229cfe53dfd69f0609a49f65461b=
d93001ea1ef889cd5529dd176593f5338a1"
> +SRC_URI[heck-0.5.0.sha256sum] =3D "2304e00983f87ffb38b55b444b5e3b60a88=
4b5d30c0fca7d82fe33449bbe55ea"
>  SRC_URI[hermit-abi-0.3.9.sha256sum] =3D "d231dfb89cfffdbc30e7fc41579ed=
6066ad03abda9e567ccafae602b97ec5024"
> -SRC_URI[humantime-2.1.0.sha256sum] =3D "9a3a5bfb195931eeb336b2a7b4d761=
daec841b97f947d34394601737a7bba5e4"
> -SRC_URI[indicatif-0.17.8.sha256sum] =3D "763a5a8f45087d6bcea4222e7b72c=
291a054edf80e4ef6efd2a4979878c7bea3"
> -SRC_URI[instant-0.1.13.sha256sum] =3D "e0242819d153cba4b4b05a5a8f2a7e9=
bbf97b6055b2a002b395c96b5ff3c0222"
> +SRC_URI[hermit-abi-0.5.2.sha256sum] =3D "fc0fef456e4baa96da950455cd02c=
081ca953b141298e41db3fc7e36b1da849c"
> +SRC_URI[ident_case-1.0.1.sha256sum] =3D "b9e0384b61958566e926dc5066032=
1d12159025e767c18e043daf26b70104c39"
> +SRC_URI[indicatif-0.18.3.sha256sum] =3D "9375e112e4b463ec1b1c6c0119535=
45c65a30164fbab5b581df32b3abf0dcb88"
> +SRC_URI[indoc-2.0.7.sha256sum] =3D "79cf5c93f93228cf8efb3ba362535fb111=
99ac548a09ce117c9b1adc3030d706"
> +SRC_URI[instability-0.3.9.sha256sum] =3D "435d80800b936787d62688c927b6=
490e887c7ef5ff9ce922c6c6050fca75eb9a"
> +SRC_URI[io-lifetimes-1.0.11.sha256sum] =3D "eae7b9aee968036d54dce06ceb=
aefd919e4472e753296daccd6d344e3e2df0c2"
> +SRC_URI[io-uring-0.7.11.sha256sum] =3D "fdd7bddefd0a8833b88a4b68f90dae=
22c7450d11b354198baee3874fd811b344"
>  SRC_URI[iovec-0.1.4.sha256sum] =3D "b2b3ea6ff95e175473f8ffe6a7eb7c00d0=
54240321b84c57051175fe3c1e075e"
> -SRC_URI[is_terminal_polyfill-1.70.1.sha256sum] =3D "7943c866cc5cd64cbc=
25b2e01621d07fa8eb2a1a23160ee81ce38704e97b8ecf"
> -SRC_URI[itertools-0.12.1.sha256sum] =3D "ba291022dbbd398a455acf126c1e3=
41954079855bc60dfdda641363bd6922569"
> -SRC_URI[lazy_static-1.5.0.sha256sum] =3D "bbd2bcb4c963f2ddae06a2efc7e9=
f3591312473c50c6685e1f298068316e66fe"
> -SRC_URI[lazycell-1.3.0.sha256sum] =3D "830d08ce1d1d941e6b30645f1a0eb56=
43013d835ce3779a5fc208261dbe10f55"
> -SRC_URI[libc-0.2.155.sha256sum] =3D "97b3888a4aecf77e811145cadf6eef590=
1f4782c53886191b2f693f24761847c"
> -SRC_URI[libloading-0.8.5.sha256sum] =3D "4979f22fdb869068da03c9f7528f8=
297c6fd2606bc3a4affe42e6a823fdb8da4"
> +SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] =3D "a6cb138bb79a146c1b=
d460005623e142ef0181e3d0219cb493e02f7d08a35695"
> +SRC_URI[itertools-0.13.0.sha256sum] =3D "413ee7dfc52ee1a4949ceeb7dbc8a=
33f2d6c088194d9f922fb8318faf1f01186"
> +SRC_URI[itoa-1.0.15.sha256sum] =3D "4a5f13b858c8d314ee3e8f639011f7ccef=
e71f97f96e50151fb991f267928e2c"
> +SRC_URI[jiff-0.2.16.sha256sum] =3D "49cce2b81f2098e7e3efc35bc2e0a6b7ab=
ec9d34128283d7a26fa8f32a6dbb35"
> +SRC_URI[jiff-static-0.2.16.sha256sum] =3D "980af8b43c3ad5d8d349ace167e=
c8170839f753a42d233ba19e08afe1850fa69"
> +SRC_URI[js-sys-0.3.82.sha256sum] =3D "b011eec8cc36da2aab2d5cff675ec184=
54fad408585853910a202391cf9f8e65"
> +SRC_URI[libc-0.2.177.sha256sum] =3D "2874a2af47a2325c2001a6e6fad9b16a5=
3b802102b528163885171cf92b15976"
> +SRC_URI[libloading-0.8.9.sha256sum] =3D "d7c4b02199fee7c5d21a5ae7d8cfa=
79a6ef5bb2fc834d6e9058e89c825efdc55"
> +SRC_URI[libredox-0.1.10.sha256sum] =3D "416f7e718bdb06000964960ffa43b4=
335ad4012ae8b99060261aa4a8088d5ccb"
>  SRC_URI[libudev-sys-0.1.4.sha256sum] =3D "3c8469b4a23b962c1396b9b451dd=
a50ef5b283e8dd309d69033475fa9b334324"
> -SRC_URI[linux-raw-sys-0.4.14.sha256sum] =3D "78b3ae25bc7c8c38cec158d1f=
2757ee79e9b3740fbc7ccf0e59e4b08d793fa89"
> -SRC_URI[log-0.4.22.sha256sum] =3D "a7a70ba024b9dc04c27ea2f0c0548feb474=
ec5c54bba33a7f72f873a39d07b24"
> -SRC_URI[memchr-2.7.4.sha256sum] =3D "78ca9ab1a0babb1e7d5695e3530886289=
c18cf2f87ec19a575a0abdce112e3a3"
> +SRC_URI[linux-raw-sys-0.11.0.sha256sum] =3D "df1d3c3b53da64cf576048227=
3a98e575c651a67eec7f77df96b5b642de8f039"
> +SRC_URI[log-0.4.28.sha256sum] =3D "34080505efa8e45a4b816c349525ebe327c=
eaa8559756f0356cba97ef3bf7432"
> +SRC_URI[lru-0.12.5.sha256sum] =3D "234cf4f4a04dc1f57e24b96cc0cd600cf2a=
f460d4161ac5ecdd0af8e1f3b2a38"
> +SRC_URI[memchr-2.7.6.sha256sum] =3D "f52b00d39961fc5b2736ea853c9cc8623=
8e165017a493d1d5c8eac6bdc4cc273"
>  SRC_URI[minimal-lexical-0.2.1.sha256sum] =3D "68354c5c6bd36d73ff3feceb=
05efa59b6acb7626617f4962be322a825e61f79a"
> -SRC_URI[miniz_oxide-0.7.4.sha256sum] =3D "b8a240ddb74feaf34a79a7add65a=
741f3167852fba007066dcac1ca548d89c08"
> -SRC_URI[mockall-0.13.0.sha256sum] =3D "d4c28b3fb6d753d28c20e826cd46ee6=
11fda1cf3cde03a443a974043247c065a"
> -SRC_URI[mockall_derive-0.13.0.sha256sum] =3D "341014e7f530314e9a1fdbc7=
400b244efea7122662c96bfa248c31da5bfb2020"
> -SRC_URI[nix-0.29.0.sha256sum] =3D "71e2746dc3a24dd78b3cfcb7be93368c6de=
9963d30f43a6a73998a9cf4b17b46"
> +SRC_URI[miniz_oxide-0.8.9.sha256sum] =3D "1fa76a2c86f704bdb222d66965fb=
3d63269ce38518b83cb0575fca855ebb6316"
> +SRC_URI[mockall-0.13.1.sha256sum] =3D "39a6bfcc6c8c7eed5ee98b9c3e33adc=
726054389233e201c95dab2d41a3839d2"
> +SRC_URI[mockall_derive-0.13.1.sha256sum] =3D "25ca3004c2efe9011bd4e461=
bd8256445052b9615405b4f7ea43fc8ca5c20898"
> +SRC_URI[nix-0.30.1.sha256sum] =3D "74523f3a35e05aba87a1d978330aef40f67=
b0304ac79c1c00b294c9830543db6"
>  SRC_URI[nom-7.1.3.sha256sum] =3D "d273983c5a657a70a3e8f2a01329822f3b8c=
8172b73826411a55751e404a0a4a"
> +SRC_URI[nom-8.0.0.sha256sum] =3D "df9761775871bdef83bee530e60050f7e54b=
1105350d6884eb0fb4f46c2f9405"
>  SRC_URI[num-derive-0.4.2.sha256sum] =3D "ed3955f1a9c7c0c15e092f9c887db=
08b1fc683305fdf6eb6684f22555355e202"
>  SRC_URI[num-traits-0.2.19.sha256sum] =3D "071dfc062690e90b734c0b2273ce=
72ad0ffa95f0c74596bc250dcfd960262841"
> -SRC_URI[num_cpus-1.16.0.sha256sum] =3D "4161fcb6d602d4d2081af7c3a45852=
d875a03dd337a6bfdd6e06407b61342a43"
> -SRC_URI[number_prefix-0.4.0.sha256sum] =3D "830b246a0e5f20af87141b25c1=
73cd1b609bd7779a4617d6ec582abaf90870f3"
> -SRC_URI[numtoa-0.1.0.sha256sum] =3D "b8f8bdf33df195859076e54ab11ee78a1=
b208382d3a26ec40d142ffc1ecc49ef"
> -SRC_URI[once_cell-1.19.0.sha256sum] =3D "3fdb12b2476b595f9358c5161aa46=
7c2438859caa136dec86c26fdd2efe17b92"
> -SRC_URI[os_pipe-1.2.1.sha256sum] =3D "5ffd2b0a5634335b135d5728d84c5e0f=
d726954b87111f7506a61c502280d982"
> -SRC_URI[pkg-config-0.3.30.sha256sum] =3D "d231b230927b5e4ad203db57bbcb=
ee2802f6bce620b1e4a9024a07d94e2907ec"
> -SRC_URI[portable-atomic-1.11.0.sha256sum] =3D "350e9b48cbc6b0e028b0473=
b114454c6316e57336ee184ceab6e53f72c178b3e"
> -SRC_URI[ppv-lite86-0.2.20.sha256sum] =3D "77957b295656769bb8ad2b6a6b09=
d897d94f05c41b069aede1fcdaa675eaea04"
> -SRC_URI[predicates-3.1.2.sha256sum] =3D "7e9086cc7640c29a356d1a29fd134=
380bee9d8f79a17410aa76e7ad295f42c97"
> -SRC_URI[predicates-core-1.0.8.sha256sum] =3D "ae8177bee8e75d6846599c6b=
9ff679ed51e882816914eec639944d7c9aa11931"
> -SRC_URI[predicates-tree-1.0.11.sha256sum] =3D "41b740d195ed3166cd147c8=
047ec98db0e22ec019eb8eeb76d343b795304fb13"
> -SRC_URI[proc-macro2-1.0.86.sha256sum] =3D "5e719e8df665df0d1c8fbfd2380=
15744736151d4445ec0836b8e628aae103b77"
> -SRC_URI[quick-xml-0.36.1.sha256sum] =3D "96a05e2e8efddfa51a84ca47cec30=
3fac86c8541b686d37cac5efc0e094417bc"
> +SRC_URI[num_cpus-1.17.0.sha256sum] =3D "91df4bbde75afed763b708b7eee1e8=
e7651e02d97f6d5dd763e89367e957b23b"
> +SRC_URI[numtoa-0.2.4.sha256sum] =3D "6aa2c4e539b869820a2b82e1aef6ff40a=
a85e65decdd5185e83fb4b1249cd00f"
> +SRC_URI[once_cell-1.21.3.sha256sum] =3D "42f5e15c9953c5e4ccceeb2e7382a=
716482c34515315f7b03532b8b4e8393d2d"
> +SRC_URI[once_cell_polyfill-1.70.2.sha256sum] =3D "384b8ab6d37215f3c530=
1a95a4accb5d64aa607f1fcb26a11b5303878451b4fe"
> +SRC_URI[os_pipe-1.2.3.sha256sum] =3D "7d8fae84b431384b68627d0f9b3b1245=
fcf9f46f6c0e3dc902e9dce64edd1967"
> +SRC_URI[paste-1.0.15.sha256sum] =3D "57c0d7b74b563b49d38dae00a0c37d4d6=
de9b432382b2892f0574ddcae73fd0a"
> +SRC_URI[pkg-config-0.3.32.sha256sum] =3D "7edddbd0b52d732b21ad9a5fab5c=
704c14cd949e5e9a1ec5929a24fded1b904c"
> +SRC_URI[portable-atomic-1.11.1.sha256sum] =3D "f84267b20a16ea918e43c6a=
88433c2d54fa145c92a811b5b047ccbe153674483"
> +SRC_URI[portable-atomic-util-0.2.4.sha256sum] =3D "d8a2f0d8d040d7848a7=
09caf78912debcc3f33ee4b3cac47d73d1e1069e83507"
> +SRC_URI[ppv-lite86-0.2.21.sha256sum] =3D "85eae3c4ed2f50dcfe72643da4be=
fc30deadb458a9b590d720cde2f2b1e97da9"
> +SRC_URI[predicates-3.1.3.sha256sum] =3D "a5d19ee57562043d37e82899fade9=
a22ebab7be9cef5026b07fda9cdd4293573"
> +SRC_URI[predicates-core-1.0.9.sha256sum] =3D "727e462b119fe9c93fd0eb14=
29a5f7647394014cf3c04ab2c0350eeb09095ffa"
> +SRC_URI[predicates-tree-1.0.12.sha256sum] =3D "72dd2d6d381dfb73a193c7f=
ca536518d7caee39fc8503f74e7dc0be0531b425c"
> +SRC_URI[prettyplease-0.2.37.sha256sum] =3D "479ca8adacdd7ce8f1fb39ce9e=
cccbfe93a3f1344b3d0d97f20bc0196208f62b"
> +SRC_URI[proc-macro2-1.0.103.sha256sum] =3D "5ee95bc4ef87b8d5ba32e8b771=
4ccc834865276eab0aed5c9958d00ec45f49e8"
> +SRC_URI[quick-xml-0.38.4.sha256sum] =3D "b66c2058c55a409d601666cffe35f=
04333cf1013010882cec174a7467cd4e21c"
>  SRC_URI[quickcheck-1.0.3.sha256sum] =3D "588f6378e4dd99458b60ec275b447=
7add41ce4fa9f64dcba6f15adccb19b50d6"
> -SRC_URI[quickcheck_macros-1.0.0.sha256sum] =3D "b22a693222d716a9587786=
f37ac3f6b4faedb5b80c23914e7303ff5a1d8016e9"
> -SRC_URI[quote-1.0.36.sha256sum] =3D "0fa76aaf39101c457836aec0ce2316dbd=
c3ab723cdda1c6bd4e6ad4208acaca7"
> +SRC_URI[quickcheck_macros-1.1.0.sha256sum] =3D "f71ee38b42f8459a88d336=
2be6f9b841ad2d5421844f61eb1c59c11bff3ac14a"
> +SRC_URI[quote-1.0.42.sha256sum] =3D "a338cc41d27e6cc6dce6cefc13a0729df=
bb81c262b1f519331575dd80ef3067f"
> +SRC_URI[r-efi-5.3.0.sha256sum] =3D "69cdb34c158ceb288df11e18b4bd39de99=
4f6657d83847bdffdbd7f346754b0f"
>  SRC_URI[rand-0.8.5.sha256sum] =3D "34af8d1a0e25924bc5b7c43c079c942339d=
8f0a8b57c39049bef581b46327404"
> -SRC_URI[rand_chacha-0.3.1.sha256sum] =3D "e6c10a63a0fa32252be49d21e770=
9d4d4baf8d231c2dbce1eaa8141b9b127d88"
> +SRC_URI[rand-0.9.2.sha256sum] =3D "6db2770f06117d490610c7488547d543617=
b21bfa07796d7a12f6f1bd53850d1"
> +SRC_URI[rand_chacha-0.9.0.sha256sum] =3D "d3022b5f1df60f26e1ffddd6c66e=
8aa15de382ae63b3a0c1bfc0e4d3e3f325cb"
>  SRC_URI[rand_core-0.6.4.sha256sum] =3D "ec0be4795e2f6a28069bec0b5ff3e2=
ac9bafc99e6a9a7dc3547996c5c816922c"
> -SRC_URI[rangemap-1.5.1.sha256sum] =3D "f60fcc7d6849342eff22c4350c8b9a9=
89ee8ceabc4b481253e8946b9fe83d684"
> -SRC_URI[redox_syscall-0.2.16.sha256sum] =3D "fb5a58c1855b4b6819d590121=
55603f0b22ad30cad752600aadfcb695265519a"
> +SRC_URI[rand_core-0.9.3.sha256sum] =3D "99d9a13982dcf210057a8a78572b22=
17b667c3beacbf3a0d8b454f6f82837d38"
> +SRC_URI[rangemap-1.7.0.sha256sum] =3D "acbbbbea733ec66275512d0b9694f34=
102e7d5406fdbe2ad8d21b28dce92887c"
> +SRC_URI[ratatui-0.29.0.sha256sum] =3D "eabd94c2f37801c20583fc49dd5cd6b=
0ba68c716787c2dd6ed18571e1e63117b"
> +SRC_URI[redox_syscall-0.5.18.sha256sum] =3D "ed2bf2547551a7053d6fdfafd=
a3f938979645c44812fbfcda098faae3f1a362d"
>  SRC_URI[redox_termios-0.1.3.sha256sum] =3D "20145670ba436b55d91fc92d25=
e71160fbfbdd57831631c8d7d36377a476f1cb"
> -SRC_URI[regex-1.10.6.sha256sum] =3D "4219d74c6b67a3654a9fbebc4b419e221=
26d13d2f3c4a07ee0cb61ff79a79619"
> -SRC_URI[regex-automata-0.4.7.sha256sum] =3D "38caf58cc5ef2fed281f89292=
ef23f6365465ed9a41b7a7754eb4e26496c92df"
> -SRC_URI[regex-syntax-0.8.4.sha256sum] =3D "7a66a03ae7c801facd77a29370b=
4faec201768915ac14a721ba36f20bc9c209b"
> -SRC_URI[retry-2.0.0.sha256sum] =3D "9166d72162de3575f950507683fac47e30=
f6f2c3836b71b7fbc61aa517c9c5f4"
> -SRC_URI[roaring-0.10.6.sha256sum] =3D "8f4b84ba6e838ceb47b41de5194a602=
44fac43d9fe03b71dbe8c5a201081d6d1"
> -SRC_URI[rustc-hash-1.1.0.sha256sum] =3D "08d43f7aa6b08d49f382cde6a7982=
047c3426db949b1424bc4b7ec9ae12c6ce2"
> -SRC_URI[rustc_version-0.4.0.sha256sum] =3D "bfa0f585226d2e68097d4f95d1=
13b15b83a82e819ab25717ec0590d9584ef366"
> -SRC_URI[rustix-0.38.34.sha256sum] =3D "70dc5ec042f7a43c4a73241207cecc9=
873a06d45debb38b329f8541d85c2730f"
> -SRC_URI[safemem-0.3.3.sha256sum] =3D "ef703b7cb59335eae2eb93ceb664c0eb=
7ea6bf567079d843e09420219668e072"
> -SRC_URI[semver-1.0.23.sha256sum] =3D "61697e0a1c7e512e84a621326239844a=
24d8207b4669b41bc18b32ea5cbf988b"
> -SRC_URI[serde-1.0.204.sha256sum] =3D "bc76f558e0cbb2a839d37354c575f1dc=
3fdc6546b5be373ba43d95f231bf7c12"
> -SRC_URI[serde_derive-1.0.204.sha256sum] =3D "e0cd7e117be63d3c367877675=
3929474f3b04a43a080c744d6b0ae2a8c28e222"
> -SRC_URI[shared_child-1.0.1.sha256sum] =3D "09fa9338aed9a1df411814a5b22=
52f7cd206c55ae9bf2fa763f8de84603aa60c"
> +SRC_URI[regex-1.12.2.sha256sum] =3D "843bc0191f75f3e22651ae5f1e72939ab=
2f72a4bc30fa80a066bd66edefc24d4"
> +SRC_URI[regex-automata-0.4.13.sha256sum] =3D "5276caf25ac86c8d810222b3=
dbb938e512c55c6831a10f3e6ed1c93b84041f1c"
> +SRC_URI[regex-syntax-0.8.8.sha256sum] =3D "7a2d987857b319362043e95f535=
3c0535c1f58eec5336fdfcf626430af7def58"
> +SRC_URI[retry-2.1.0.sha256sum] =3D "a1e211f878258887b3e65dd3c8ff9f530f=
e109f441a117ee0cdc27f341355032"
> +SRC_URI[roaring-0.11.2.sha256sum] =3D "f08d6a905edb32d74a5d5737a0c9d7e=
950c312f3c46cb0ca0a2ca09ea11878a0"
> +SRC_URI[rustc-hash-2.1.1.sha256sum] =3D "357703d41365b4b27c590e3ed91ea=
bb1b663f07c4c084095e60cbed4362dff0d"
> +SRC_URI[rustc_version-0.4.1.sha256sum] =3D "cfcb3a22ef46e85b45de6ee7e7=
9d063319ebb6594faafcf1c225ea92ab6e9b92"
> +SRC_URI[rustix-1.1.2.sha256sum] =3D "cd15f8a2c5551a84d56efdc1cd049089e=
409ac19a3072d5037a17fd70719ff3e"
> +SRC_URI[rustversion-1.0.22.sha256sum] =3D "b39cdef0fa800fc44525c84ccb5=
4a029961a8215f9619753635a9c0d2538d46d"
> +SRC_URI[ryu-1.0.20.sha256sum] =3D "28d3b2b1366ec20994f1fd18c3c594f05c5=
dd4bc44d8bb0c1c632c8d6829481f"
> +SRC_URI[semver-1.0.27.sha256sum] =3D "d767eb0aabc880b29956c35734170f26=
ed551a859dbd361d140cdbeca61ab1e2"
> +SRC_URI[serde-1.0.228.sha256sum] =3D "9a8e94ea7f378bd32cbbd37198a4a914=
36180c5bb472411e48b5ec2e2124ae9e"
> +SRC_URI[serde_core-1.0.228.sha256sum] =3D "41d385c7d4ca58e59fc732af25c=
3983b67ac852c1a25000afe1175de458b67ad"
> +SRC_URI[serde_derive-1.0.228.sha256sum] =3D "d540f220d3187173da220f885=
ab66608367b6574e925011a9353e4badda91d79"
> +SRC_URI[shared_child-1.1.1.sha256sum] =3D "1e362d9935bc50f019969e2f9ec=
d66786612daae13e8f277be7bfb66e8bed3f7"
> +SRC_URI[shared_thread-0.2.0.sha256sum] =3D "52b86057fcb5423f5018e331ac=
04623e32d6b5ce85e33300f92c79a1973928b0"
>  SRC_URI[shlex-1.3.0.sha256sum] =3D "0fda2ff0d084019ba4d7c6f371c95d8fd7=
5ce3524c3cb8fb653a3023f6323e64"
> +SRC_URI[sigchld-0.2.4.sha256sum] =3D "47106eded3c154e70176fc83df973733=
5c94ce22f821c32d17ed1db1f83badb1"
> +SRC_URI[signal-hook-0.3.18.sha256sum] =3D "d881a16cf4426aa584979d30bd8=
2cb33429027e42122b169753d6ef1085ed6e2"
> +SRC_URI[signal-hook-registry-1.4.6.sha256sum] =3D "b2a4719bff48cee6b39=
d12c020eeb490953ad2443b7055bd0b21fca26bd8c28b"
> +SRC_URI[simd-adler32-0.3.7.sha256sum] =3D "d66dc143e6b11c1eddc06d5c423=
cfc97062865baf299914ab64caa38182078fe"
> +SRC_URI[static_assertions-1.1.0.sha256sum] =3D "a2eb9349b6444b326872e1=
40eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
>  SRC_URI[strsim-0.11.1.sha256sum] =3D "7da8b5736845d9f2fcb837ea5d9e2628=
564b3b043a70948a3f0b778838c5fb4f"
> -SRC_URI[syn-1.0.109.sha256sum] =3D "72b64191b275b66ffe2469e8af2c1cfe3b=
afa67b529ead792a6d0160888b4237"
> -SRC_URI[syn-2.0.72.sha256sum] =3D "dc4b9b9bf2add8093d3f2c0204471e951b2=
285580335de42f9d2534f3ae7a8af"
> -SRC_URI[tempfile-3.11.0.sha256sum] =3D "b8fcd239983515c23a32fb82099f97=
d0b11b8c72f654ed659363a95c3dad7a53"
> -SRC_URI[termion-1.5.6.sha256sum] =3D "077185e2eac69c3f8379a4298e1e07cd=
36beb962290d4a51199acf0fdc10607e"
> -SRC_URI[termtree-0.4.1.sha256sum] =3D "3369f5ac52d5eb6ab48c6b4ffdc8efb=
cad6b89c765749064ba298f2c68a16a76"
> -SRC_URI[thiserror-1.0.63.sha256sum] =3D "c0342370b38b6a11b6cc11d6a8055=
69958d54cfa061a29969c3b5ce2ea405724"
> -SRC_URI[thiserror-impl-1.0.63.sha256sum] =3D "a4558b58466b9ad7ca0f1028=
65eccc95938dca1a74a856f2b57b6629050da261"
> -SRC_URI[threadpool-1.8.1.sha256sum] =3D "d050e60b33d41c19108b32cea3216=
4033a9013fe3b46cbd4457559bfbf77afaa"
> -SRC_URI[tui-0.19.0.sha256sum] =3D "ccdd26cbd674007e649a272da4475fb666d=
3aa0ad0531da7136db6fab0e5bad1"
> -SRC_URI[udev-0.7.0.sha256sum] =3D "4ebdbbd670373442a12fe9ef7aeb53aec41=
47a5a27a00bbc3ab639f08f48191a"
> -SRC_URI[unicode-ident-1.0.12.sha256sum] =3D "3354b9ac3fae1ff6755cb6db5=
3683adb661634f67557942dea4facebec0fee4b"
> -SRC_URI[unicode-segmentation-1.11.0.sha256sum] =3D "d4c87d22b6e3f4a18d=
4d40ef354e97c90fcb14dd91d7dc0aa9d8a1172ebf7202"
> -SRC_URI[unicode-width-0.1.13.sha256sum] =3D "0336d538f7abc86d282a41896=
14dfaa90810dfc2c6f6427eaf88e16311dd225d"
> +SRC_URI[strum-0.26.3.sha256sum] =3D "8fec0f0aef304996cf250b31b5a10dee7=
980c85da9d759361292b8bca5a18f06"
> +SRC_URI[strum_macros-0.26.4.sha256sum] =3D "4c6bee85a5a24955dc44038679=
5aa378cd9cf82acd5f764469152d2270e581be"
> +SRC_URI[syn-2.0.110.sha256sum] =3D "a99801b5bd34ede4cf3fc688c5919368fe=
a4e4814a4664359503e6015b280aea"
> +SRC_URI[tempfile-3.23.0.sha256sum] =3D "2d31c77bdf42a745371d260a26ca71=
63f1e0924b64afa0b688e61b5a9fa02f16"
> +SRC_URI[termion-4.0.5.sha256sum] =3D "3669a69de26799d6321a5aa713f55f7e=
2cd37bd47be044b50f2acafc42c122bb"
> +SRC_URI[termtree-0.5.1.sha256sum] =3D "8f50febec83f5ee1df3015341d8bd42=
9f2d1cc62bcba7ea2076759d315084683"
> +SRC_URI[thiserror-2.0.17.sha256sum] =3D "f63587ca0f12b72a0600bcba1d400=
81f830876000bb46dd2337a3051618f4fc8"
> +SRC_URI[thiserror-impl-2.0.17.sha256sum] =3D "3ff15c8ecd7de3849db632e1=
4d18d2571fa09dfc5ed93479bc4485c7a517c913"
> +SRC_URI[udev-0.9.3.sha256sum] =3D "af4e37e9ea4401fc841ff54b9ddfc9be107=
9b1e89434c1a6a865dd68980f7e9f"
> +SRC_URI[unicode-ident-1.0.22.sha256sum] =3D "9312f7c4f6ff9069b16549823=
4ce8be658059c6728633667c526e27dc2cf1df5"
> +SRC_URI[unicode-segmentation-1.12.0.sha256sum] =3D "f6ccf251212114b544=
33ec949fd6a7841275f9ada20dddd2f29e9ceea4501493"
> +SRC_URI[unicode-truncate-1.1.0.sha256sum] =3D "b3644627a5af5fa321c95b9=
b235a72fd24cd29c648c2c379431e6628655627bf"
> +SRC_URI[unicode-width-0.1.14.sha256sum] =3D "7dd6e30e90baa6f7241172066=
5d41d89b9a3d039dc45b8faea1ddd07f617f6af"
> +SRC_URI[unicode-width-0.2.0.sha256sum] =3D "1fc81956842c57dac11422a97c=
3b8195a1ff727f06e85c84ed2e8aa277c9a0fd"
> +SRC_URI[unit-prefix-0.5.2.sha256sum] =3D "81e544489bf3d8ef66c953931f56=
617f423cd4b5494be343d9b9d3dda037b9a3"
>  SRC_URI[utf8parse-0.2.2.sha256sum] =3D "06abde3611657adf66d383f00b093d=
7faecc7fa57071cce2578660c9f1010821"
> -SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] =3D "9c8d87e72b6=
4a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
> -SRC_URI[winapi-0.3.9.sha256sum] =3D "5c839a674fcd7a98952e593242ea400ab=
e93992746761e38641405d28b00f419"
> -SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] =3D "ac3b87c636204=
26dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
> -SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] =3D "712e227841d=
057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
> -SRC_URI[windows-sys-0.52.0.sha256sum] =3D "282be5f36a8ce781fad8c8ae18f=
a3f9beff57ec1b52cb3de0789201425d9a33d"
> -SRC_URI[windows-sys-0.59.0.sha256sum] =3D "1e38bc4d79ed67fd075bcc251a1=
c39b32a1776bbe92e5bef1f0bf1f8c531853b"
> -SRC_URI[windows-targets-0.52.6.sha256sum] =3D "9b724f72796e036ab90c102=
1d4780d4d3d648aca59e491e6b98e725b84e99973"
> -SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] =3D "32a4622180e7a0e=
c044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
> -SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] =3D "09ec2a7bb152e2252b=
53fa7803150007879548bc709c039df7627cabbd05d469"
> -SRC_URI[windows_i686_gnu-0.52.6.sha256sum] =3D "8e9b5ad5ab802e97eb8e29=
5ac6720e509ee4c243f69d781394014ebfe8bbfa0b"
> -SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] =3D "0eee52d38c090b3caa=
76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
> -SRC_URI[windows_i686_msvc-0.52.6.sha256sum] =3D "240948bc05c5e7c6dabba=
28bf89d89ffce3e303022809e73deaefe4f6ec56c66"
> -SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] =3D "147a5c80aabfbf0c7d90=
1cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
> -SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] =3D "24d5b23dc4174126=
79681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
> -SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] =3D "589f6da84c646204747=
d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
> -SRC_URI[zerocopy-0.7.35.sha256sum] =3D "1b9b4fd18abc82b8136838da5d50ba=
e7bdea537c574d8dc1a34ed098d6c166f0"
> -SRC_URI[zerocopy-derive-0.7.35.sha256sum] =3D "fa4f8080344d4671fb4e831=
a13ad1e68092748387dfc4f55e356242fae12ce3e"
> +SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] =3D "ccf3ec651a8=
47eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
> +SRC_URI[wasip2-1.0.1+wasi-0.2.4.sha256sum] =3D "0562428422c63773dad2c3=
45a1882263bbf4d65cf3f42e90921f787ef5ad58e7"
> +SRC_URI[wasm-bindgen-0.2.105.sha256sum] =3D "da95793dfc411fbbd93f5be77=
15b0578ec61fe87cb1a42b12eb625caa5c5ea60"
> +SRC_URI[wasm-bindgen-macro-0.2.105.sha256sum] =3D "04264334509e04a7bf8=
690f2384ef5265f05143a4bff3889ab7a3269adab59c2"
> +SRC_URI[wasm-bindgen-macro-support-0.2.105.sha256sum] =3D "420bc339d9f=
322e562942d52e115d57e950d12d88983a14c79b86859ee6c7ebc"
> +SRC_URI[wasm-bindgen-shared-0.2.105.sha256sum] =3D "76f218a38c84bcb33c=
25ec7059b07847d465ce0e0a76b995e134a45adcb6af76"
> +SRC_URI[web-time-1.1.0.sha256sum] =3D "5a6580f308b1fad9207618087a65c04=
e7a10bc77e02c8e84e9b00dd4b12fa0bb"
> +SRC_URI[windows-link-0.2.1.sha256sum] =3D "f0805222e57f7521d6a62e36fa9=
163bc891acd422f971defe97d64e70d0a4fe5"
> +SRC_URI[windows-sys-0.48.0.sha256sum] =3D "677d2418bec65e3338edb076e80=
6bc1ec15693c5d0104683f2efe857f61056a9"
> +SRC_URI[windows-sys-0.60.2.sha256sum] =3D "f2f500e4d28234f72040990ec9d=
39e3a6b950f9f22d3dba18416c35882612bcb"
> +SRC_URI[windows-sys-0.61.2.sha256sum] =3D "ae137229bcbd6cdf0f7b80a31df=
61766145077ddf49416a728b02cb3921ff3fc"
> +SRC_URI[windows-targets-0.48.5.sha256sum] =3D "9a2fa6e2155d7247be68c09=
6456083145c183cbbbc2764150dda45a87197940c"
> +SRC_URI[windows-targets-0.53.5.sha256sum] =3D "4945f9f551b88e0d65f3db0=
bc25c33b8acea4d9e41163edf90dcd0b19f9069f3"
> +SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] =3D "2b38e32f0abccf9=
987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
> +SRC_URI[windows_aarch64_gnullvm-0.53.1.sha256sum] =3D "a9d8416fa8b42f5=
c947f8482c43e7d89e73a173cead56d044f6a56104a6d1b53"
> +SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] =3D "dc35310971f3b2dbbf=
3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc"
> +SRC_URI[windows_aarch64_msvc-0.53.1.sha256sum] =3D "b9d782e804c2f632e3=
95708e99a94275910eb9100b2114651e04744e9b125006"
> +SRC_URI[windows_i686_gnu-0.48.5.sha256sum] =3D "a75915e7def60c94dcef72=
200b9a8e58e5091744960da64ec734a6c6e9b3743e"
> +SRC_URI[windows_i686_gnu-0.53.1.sha256sum] =3D "960e6da069d81e09becb0c=
a57a65220ddff016ff2d6af6a223cf372a506593a3"
> +SRC_URI[windows_i686_gnullvm-0.53.1.sha256sum] =3D "fa7359d10048f68ab8=
b09fa71c3daccfb0e9b559aed648a8f95469c27057180c"
> +SRC_URI[windows_i686_msvc-0.48.5.sha256sum] =3D "8f55c233f70c4b27f66c5=
23580f78f1004e8b5a8b659e05a4eb49d4166cca406"
> +SRC_URI[windows_i686_msvc-0.53.1.sha256sum] =3D "1e7ac75179f18232fe9c2=
85163565a57ef8d3c89254a30685b57d83a38d326c2"
> +SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] =3D "53d40abd2583d23e4718=
fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e"
> +SRC_URI[windows_x86_64_gnu-0.53.1.sha256sum] =3D "9c3842cdd74a865a8066=
ab39c8a7a473c0778a3f29370b5fd6b4b9aa7df4a499"
> +SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] =3D "0b7b52767868a23d=
5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
> +SRC_URI[windows_x86_64_gnullvm-0.53.1.sha256sum] =3D "0ffa179e2d07eee8=
ad8f57493436566c7cc30ac536a3379fdf008f47f6bb7ae1"
> +SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] =3D "ed94fce61571a400685=
2b7389a063ab983c02eb1bb37b47f8272ce92d06d9538"
> +SRC_URI[windows_x86_64_msvc-0.53.1.sha256sum] =3D "d6bbff5f0aada427a1e=
5a6da5f1f98158182f26556f345ac9e04d36d0ebed650"
> +SRC_URI[wit-bindgen-0.46.0.sha256sum] =3D "f17a85883d4e6d00e8a97c586de=
764dabcc06133f7f1d55dce5cdc070ad7fe59"
> +SRC_URI[zerocopy-0.8.27.sha256sum] =3D "0894878a5fa3edfd6da3f88c4805f4=
c8558e2b996227a3d864f47fe11e38282c"
> +SRC_URI[zerocopy-derive-0.8.27.sha256sum] =3D "88d2b8d9c68ad2b9e4340d7=
832716a4d21a22a1154777ad56ea55c51a9cf3831"
> diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provi=
sioning-tools-git-crates.inc b/meta-oe/recipes-support/thin-provisioning-=
tools/thin-provisioning-tools-git-crates.inc
> deleted file mode 100644
> index ceea67c364..0000000000
> --- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning=
-tools-git-crates.inc
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -SRC_URI +=3D "\
> -    git://github.com/jthornber/rio;protocol=3Dhttps;nobranch=3D1;name=3D=
rio;destsuffix=3Drio;type=3Dgit-dependency \
> -"
> -
> -SRCREV_FORMAT .=3D "_rio"
> -SRCREV_rio =3D "2979a720f671e836302c01546f9cc9f7988610c8"
> diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provi=
sioning-tools/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.p=
atch b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-=
tools/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch
> deleted file mode 100644
> index ed5f40a881..0000000000
> --- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning=
-tools/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From 11c494b418570a3fbdfbbbdfbbc4db0108743cc7 Mon Sep 17 00:00:00 2001=

> -From: Dan Gohman <dev@sunfishcode.online>
> -Date: Sun, 6 Apr 2025 05:22:49 -0700
> -Subject: [PATCH] Define more ioctl codes on riscv32gc-unknown-linux-gn=
u
> -
> -Define ioctl codes including `FICLONE` and `FS_IOC32_GETVERSION` on
> -riscv32gc-unknown-linux-gnu.
> -
> -Upstream-Status: Submitted [https://github.com/rust-lang/libc/pull/438=
2]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - src/unix/linux_like/linux/arch/generic/mod.rs | 6 +++++-
> - 1 file changed, 5 insertions(+), 1 deletion(-)
> -
> -diff --git a/src/unix/linux_like/linux/arch/generic/mod.rs b/src/unix/=
linux_like/linux/arch/generic/mod.rs
> -index 2f437e1..db1f1e7 100644
> ---- a/src/unix/linux_like/linux/arch/generic/mod.rs
> -+++ b/src/unix/linux_like/linux/arch/generic/mod.rs
> -@@ -114,6 +114,7 @@ cfg_if! {
> -                  target_arch =3D "x86_64",
> -                  target_arch =3D "arm",
> -                  target_arch =3D "aarch64",
> -+                 target_arch =3D "riscv32",
> -                  target_arch =3D "riscv64",
> -                  target_arch =3D "s390x",
> -                  target_arch =3D "csky",
> -@@ -218,7 +219,10 @@ cfg_if! {
> -     // where S stands for size (int, long, struct...)
> -     // where T stands for type ('f','v','X'...)
> -     // where N stands for NR (NumbeR)
> --    if #[cfg(any(target_arch =3D "x86", target_arch =3D "arm", target=
_arch =3D "csky"))] {
> -+    if #[cfg(any(target_arch =3D "x86",
> -+                 target_arch =3D "arm",
> -+                 target_arch =3D "riscv32",
> -+                 target_arch =3D "csky"))] {
> -         pub const FS_IOC_GETFLAGS: ::Ioctl =3D 0x80046601;
> -         pub const FS_IOC_SETFLAGS: ::Ioctl =3D 0x40046602;
> -         pub const FS_IOC_GETVERSION: ::Ioctl =3D 0x80047601;
> diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provi=
sioning-tools/0001-Use-portable-atomics-crate.patch b/meta-oe/recipes-sup=
port/thin-provisioning-tools/thin-provisioning-tools/0001-Use-portable-at=
omics-crate.patch
> index 54d4fb4ae3..05d6d9b1a4 100644
> --- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning=
-tools/0001-Use-portable-atomics-crate.patch
> +++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning=
-tools/0001-Use-portable-atomics-crate.patch
> @@ -22,27 +22,15 @@ error[E0432]: unresolved import `std::sync::atomic:=
:AtomicU64`
>  Upstream-Status: Submitted [https://github.com/jthornber/thin-provisio=
ning-tools/pull/321]
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> - Cargo.lock             | 5 +++--
> + Cargo.lock             | 1 +
>   Cargo.toml             | 1 +
>   src/cache/writeback.rs | 2 +-
>   src/thin/stat.rs       | 2 +-
> - 4 files changed, 6 insertions(+), 4 deletions(-)
> + 4 files changed, 4 insertions(+), 2 deletions(-)
> =20
>  --- a/Cargo.lock
>  +++ b/Cargo.lock
> -@@ -649,9 +649,9 @@ checksum =3D "d231b230927b5e4ad203db57bbcb
> -=20
> - [[package]]
> - name =3D "portable-atomic"
> --version =3D "1.7.0"
> -+version =3D "1.11.0"
> - source =3D "registry+https://github.com/rust-lang/crates.io-index"
> --checksum =3D "da544ee218f0d287a911e9c99a39a8c9bc8fcad3cb8db5959940044=
ecfc67265"
> -+checksum =3D "350e9b48cbc6b0e028b0473b114454c6316e57336ee184ceab6e53f=
72c178b3e"
> -=20
> - [[package]]
> - name =3D "ppv-lite86"
> -@@ -1000,6 +1000,7 @@ dependencies =3D [
> +@@ -1329,6 +1329,7 @@ dependencies =3D [
>    "num-derive",
>    "num-traits",
>    "num_cpus",
> @@ -52,14 +40,14 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>    "quickcheck_macros",
>  --- a/Cargo.toml
>  +++ b/Cargo.toml
> -@@ -30,6 +30,7 @@ nom =3D "7.1"
> - num_cpus =3D "1.16"
> +@@ -30,6 +30,7 @@ nom =3D "8.0"
> + num_cpus =3D "1.17"
>   num-derive =3D "0.4"
>   num-traits =3D "0.2"
>  +portable-atomic =3D "1.11"
> - quick-xml =3D "0.36"
> - rand =3D "0.8"
> - rangemap =3D "1.5"
> + quick-xml =3D "0.38"
> + rand =3D "0.9"
> + rangemap =3D "1.6"
>  --- a/src/cache/writeback.rs
>  +++ b/src/cache/writeback.rs
>  @@ -1,9 +1,9 @@
> @@ -81,6 +69,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   use std::collections::BTreeMap;
>   use std::path::Path;
>  -use std::sync::atomic::{AtomicU64, Ordering};
> - use std::sync::{Arc, Mutex};
> + use std::sync::Mutex;
>   use std::vec::Vec;
>  =20
> diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provi=
sioning-tools_1.1.0.bb b/meta-oe/recipes-support/thin-provisioning-tools/=
thin-provisioning-tools_1.3.1.bb
> similarity index 80%
> rename from meta-oe/recipes-support/thin-provisioning-tools/thin-provis=
ioning-tools_1.1.0.bb
> rename to meta-oe/recipes-support/thin-provisioning-tools/thin-provisio=
ning-tools_1.3.1.bb
> index 317794defb..50f69f945d 100644
> --- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning=
-tools_1.1.0.bb
> +++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning=
-tools_1.3.1.bb
> @@ -1,19 +1,17 @@
>  SUMMARY =3D "Tools of dm-thin device-mapper"
>  DESCRIPTION =3D "A suite of tools for manipulating the metadata of the=
 dm-thin device-mapper target."
> -HOMEPAGE =3D "https://github.com/jthornber/thin-provisioning-tools"
> +HOMEPAGE =3D "https://github.com/device-mapper-utils/thin-provisioning=
-tools"
>  LICENSE =3D "GPL-3.0-only"
>  SECTION =3D "devel"
> =20
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af26da5dc08a4e4=
40464"
> =20
>  SRC_URI =3D " \
> -    git://github.com/jthornber/thin-provisioning-tools;branch=3Dmain;p=
rotocol=3Dhttps \
> -    file://0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.p=
atch;patchdir=3D${CARGO_VENDORING_DIRECTORY}/libc-0.2.155 \
> +    git://github.com/device-mapper-utils/thin-provisioning-tools;branc=
h=3Dmain;protocol=3Dhttps;tag=3Dv${PV} \
>      file://0001-Use-portable-atomics-crate.patch \
>      "
> =20
> -# v1.1.0
> -SRCREV =3D "b745ab35057bdd0a4f1406938916621dcf2b7ef6"
> +SRCREV =3D "8b663fb4c6fb8e52ca06cea57b986c5ba45f668d"
>  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
> =20
>  inherit cargo cargo-update-recipe-crates
> @@ -21,6 +19,9 @@ inherit pkgconfig
> =20
>  DEPENDS +=3D "udev libdevmapper libdevmapper-native clang-native"
> =20
> +# TODO: replace this path
> +BUILD_LDFLAGS +=3D "-L/usr/lib/x86_64-linux-gnu"
> +
>  export LIBCLANG_PATH =3D "${STAGING_LIBDIR_NATIVE}"
>  # Remove octeontx2 specific CPU flags that may cause issues with bindg=
en
>  BINDGEN_EXTRA_CLANG_ARGS =3D "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} --ta=
rget=3D${TARGET_SYS}"
> @@ -28,7 +29,6 @@ BINDGEN_EXTRA_CLANG_ARGS:remove =3D "-mcpu=3Docteontx=
2+crypto"
>  export BINDGEN_EXTRA_CLANG_ARGS
> =20
>  require ${BPN}-crates.inc
> -require ${BPN}-git-crates.inc
> =20
>  do_install:append() {
>  	install -d ${D}${sbindir}
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125459): https://lists.openembedded.org/g/openembed=
ded-devel/message/125459
> Mute This Topic: https://lists.openembedded.org/mt/118431884/6084445
> Mute #help:https://lists.openembedded.org/g/openembedded-devel/mutehash=
tag/help
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[skandigraun@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


