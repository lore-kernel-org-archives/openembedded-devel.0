Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFBBEC4332F
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 17:13:51 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web11.9255.1667322827182468325
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Nov 2022 10:13:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ov3sDy8o;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id c18-20020a056830349200b0066c47e192f0so4135389otu.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Nov 2022 10:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oYu27hAhOeg2UxXipki8a0tqlMyus5otme1LffngKp8=;
        b=Ov3sDy8oWCnmQKYFEAqt7TVjdb0RxfYZLftGuWVSWxiuiOcbjkxqzz7RvP8XJO3Gh+
         sjgrGu5GPhbs9oPl8BESxaSArzWfLn96mmaVTuzhlbMFKdNB581ShKLxYRCI987/Ls3u
         OILg5ZXhoc1Qz3OvaQONchPZBZZZ+WkLqmh8k5LDzHLZyECM0cpFH+EYtaLouyLbv1om
         HuRqNzPOXGDHDgPgUhnvsCIZ1YDNt+7s+eRvoKJvZB5p6lq7BuIii5mvTjE86liFs0DS
         kImZQqDCFQJl7TbGpa5Fth4QfluZHIFtJKPThT8YZJx6BBbJ6eojtt8TznnC43gOhoVT
         JuKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oYu27hAhOeg2UxXipki8a0tqlMyus5otme1LffngKp8=;
        b=MsHMfSkKUAcLQFe/RSiflzOhSG3fFJ6BQfO9KqwjHsTz7U8QUcNvC45xf6f/2hNdyX
         ymnwjMSv4/uxseAajEwk8cNZ4mH9CKLC2qBGmbfEi1tX2jmzknHppTMjAa1fWiwgb8/l
         4JA1Ds6QVAtYqrvIPL02mVyri0y0YZsCysNp9QHPBrFCpwH98s9yL8Cj1EwiJkAPrnNL
         lOmrPiJTB+0eMBCVLV10xJirqziQpze+j8FJFGmGqywJnFtZ+zoIfizqBafYAOCjbNB1
         qBuNkzv7ylUk5EdWJWFCmo9HI/TaMEj9dA6LDBSKCrHykoNuzT5g7OFlXXRT4R3jU27p
         cRFQ==
X-Gm-Message-State: ACrzQf1OWac/iQ2Kfizi2vZZP5MPRpNDgOF8NYkTmdOhES0u7gT7u8ki
	qTHE2OcgwZF8hWkQPU3Z5/LneEGuAsX95r+43oU=
X-Google-Smtp-Source: AMsMyM7sIjeFODYegI+iQ8/QjY+uDMjUbAF8R63eG4+ehyoT10QLEQomCILdiY84n1XblLqaGmBIvSbP2FmCeyocLl4=
X-Received: by 2002:a9d:65c9:0:b0:66c:5124:909a with SMTP id
 z9-20020a9d65c9000000b0066c5124909amr6292550oth.111.1667322826020; Tue, 01
 Nov 2022 10:13:46 -0700 (PDT)
MIME-Version: 1.0
References: <20221031150511.1947-1-sakib.sajal@windriver.com>
In-Reply-To: <20221031150511.1947-1-sakib.sajal@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Nov 2022 10:13:19 -0700
Message-ID: <CAMKF1sp+JdYE9MCBZXhbwtaN6JeyhWQBYrLAXuoafSqsO5X2JA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH V4] minio: add recipe for minio client
To: Sakib Sajal <sakib.sajal@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Nov 2022 17:13:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99399

it fails on mips. Perhaps needs some work

https://errors.yoctoproject.org/Errors/Build/154374/

On Mon, Oct 31, 2022 at 8:05 AM Sakib Sajal <sakib.sajal@windriver.com> wro=
te:
>
> MinIO Client (mc) provides a modern alternative to UNIX commands like
> ls, cat, cp, mirror, diff, find etc. It supports filesystems and Amazon
> S3 compatible cloud storage service (AWS Signature v2 and v4).
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  .../recipes-extended/minio/minio/modules.txt  | 208 +++++++
>  meta-oe/recipes-extended/minio/minio_git.bb   | 158 ++++++
>  meta-oe/recipes-extended/minio/src_uri.inc    | 509 ++++++++++++++++++
>  3 files changed, 875 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/minio/minio/modules.txt
>  create mode 100644 meta-oe/recipes-extended/minio/minio_git.bb
>  create mode 100644 meta-oe/recipes-extended/minio/src_uri.inc
>
> diff --git a/meta-oe/recipes-extended/minio/minio/modules.txt b/meta-oe/r=
ecipes-extended/minio/minio/modules.txt
> new file mode 100644
> index 000000000..fbd01e51a
> --- /dev/null
> +++ b/meta-oe/recipes-extended/minio/minio/modules.txt
> @@ -0,0 +1,208 @@
> +# github.com/charmbracelet/bubbletea v0.19.3
> +## explicit
> +# github.com/cheggaaa/pb v1.0.29
> +## explicit
> +# github.com/dustin/go-humanize v1.0.0
> +## explicit
> +# github.com/fatih/color v1.13.0
> +## explicit
> +# github.com/go-ole/go-ole v1.2.6
> +## explicit
> +# github.com/goccy/go-json v0.8.1
> +## explicit
> +# github.com/google/shlex v0.0.0-20191202100458-e7afc7fbc510
> +## explicit
> +# github.com/google/uuid v1.3.0
> +## explicit
> +# github.com/inconshreveable/mousetrap v1.0.0
> +## explicit
> +# github.com/json-iterator/go v1.1.12
> +## explicit
> +# github.com/klauspost/compress v1.13.6
> +## explicit
> +# github.com/mattn/go-ieproxy v0.0.1
> +## explicit
> +# github.com/mattn/go-isatty v0.0.14
> +## explicit
> +# github.com/minio/cli v1.22.0
> +## explicit
> +# github.com/minio/colorjson v1.0.2
> +## explicit
> +# github.com/minio/filepath v1.0.0
> +## explicit
> +# github.com/minio/madmin-go v1.4.3
> +## explicit
> +# github.com/minio/md5-simd v1.1.2
> +## explicit
> +# github.com/minio/minio-go/v7 v7.0.30
> +## explicit
> +# github.com/minio/pkg v1.1.22
> +## explicit
> +# github.com/minio/selfupdate v0.4.0
> +## explicit
> +# github.com/minio/sha256-simd v1.0.0
> +## explicit
> +# github.com/mitchellh/go-homedir v1.1.0
> +## explicit
> +# github.com/pkg/xattr v0.4.4
> +## explicit
> +# github.com/posener/complete v1.2.3
> +## explicit
> +# github.com/prometheus/client_golang v1.12.1
> +## explicit
> +# github.com/prometheus/prom2json v1.3.1
> +## explicit
> +# github.com/rjeczalik/notify v0.9.2
> +## explicit
> +# github.com/rs/xid v1.3.0
> +## explicit
> +# github.com/secure-io/sio-go v0.3.1
> +## explicit
> +# github.com/shirou/gopsutil/v3 v3.21.12
> +## explicit
> +# github.com/tidwall/gjson v1.12.1
> +## explicit
> +# golang.org/x/crypto v0.0.0-20220525230936-793ad666bf5e
> +## explicit
> +# golang.org/x/net v0.0.0-20220225172249-27dd8689420f
> +## explicit
> +# golang.org/x/text v0.3.7
> +## explicit
> +# gopkg.in/check.v1 v1.0.0-20200902074654-038fdea0a05b
> +## explicit
> +# gopkg.in/h2non/filetype.v1 v1.0.5
> +## explicit
> +# gopkg.in/yaml.v2 v2.4.0
> +## explicit
> +# github.com/charmbracelet/bubbles v0.10.0
> +## explicit
> +# github.com/charmbracelet/lipgloss v0.4.1-0.20220204041308-bf2912e703f6
> +## explicit
> +# github.com/gdamore/tcell/v2 v2.4.1-0.20210905002822-f057f0a857a1
> +## explicit
> +# github.com/golang-jwt/jwt/v4 v4.4.1
> +## explicit
> +# github.com/navidys/tvxwidgets v0.1.0
> +## explicit
> +# github.com/olekukonko/tablewriter v0.0.5
> +## explicit
> +# github.com/prometheus/client_model v0.2.0
> +## explicit
> +# github.com/rivo/tview v0.0.0-20211202162923-2a6de950f73b
> +## explicit
> +# github.com/tinylib/msgp v1.1.6
> +## explicit
> +# golang.org/x/term v0.0.0-20210927222741-03fcf44c2211
> +## explicit
> +# github.com/beorn7/perks v1.0.1
> +## explicit
> +# github.com/cespare/xxhash/v2 v2.1.2
> +## explicit
> +# github.com/containerd/console v1.0.2
> +## explicit
> +# github.com/coreos/go-semver v0.3.0
> +## explicit
> +# github.com/coreos/go-systemd/v22 v22.3.2
> +## explicit
> +# github.com/decred/dcrd/dcrec/secp256k1/v4 v4.0.1
> +## explicit
> +# github.com/fatih/structs v1.1.0
> +## explicit
> +# github.com/gdamore/encoding v1.0.0
> +## explicit
> +# github.com/gogo/protobuf v1.3.2
> +## explicit
> +# github.com/golang/protobuf v1.5.2
> +## explicit
> +# github.com/hashicorp/errwrap v1.1.0
> +## explicit
> +# github.com/hashicorp/go-multierror v1.1.1
> +## explicit
> +# github.com/klauspost/cpuid/v2 v2.0.9
> +## explicit
> +# github.com/kr/text v0.2.0
> +## explicit
> +# github.com/lestrrat-go/backoff/v2 v2.0.8
> +## explicit
> +# github.com/lestrrat-go/blackmagic v1.0.0
> +## explicit
> +# github.com/lestrrat-go/httpcc v1.0.0
> +## explicit
> +# github.com/lestrrat-go/iter v1.0.1
> +## explicit
> +# github.com/lestrrat-go/jwx v1.2.14
> +## explicit
> +# github.com/lestrrat-go/option v1.0.0
> +## explicit
> +# github.com/lucasb-eyer/go-colorful v1.2.0
> +## explicit
> +# github.com/lufia/plan9stats v0.0.0-20211012122336-39d0f177ccd0
> +## explicit
> +# github.com/mattn/go-colorable v0.1.12
> +## explicit
> +# github.com/mattn/go-runewidth v0.0.13
> +## explicit
> +# github.com/matttproud/golang_protobuf_extensions v1.0.1
> +## explicit
> +# github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd
> +## explicit
> +# github.com/modern-go/reflect2 v1.0.2
> +## explicit
> +# github.com/muesli/ansi v0.0.0-20211018074035-2e021307bc4b
> +## explicit
> +# github.com/muesli/reflow v0.3.0
> +## explicit
> +# github.com/muesli/termenv v0.11.1-0.20220204035834-5ac8409525e0
> +## explicit
> +# github.com/niemeyer/pretty v0.0.0-20200227124842-a10e7caefd8e
> +## explicit
> +# github.com/philhofer/fwd v1.1.1
> +## explicit
> +# github.com/pkg/errors v0.9.1
> +## explicit
> +# github.com/power-devops/perfstat v0.0.0-20210106213030-5aafc221ea8c
> +## explicit
> +# github.com/prometheus/common v0.33.0
> +## explicit
> +# github.com/prometheus/procfs v0.7.3
> +## explicit
> +# github.com/rivo/uniseg v0.2.0
> +## explicit
> +# github.com/sirupsen/logrus v1.8.1
> +## explicit
> +# github.com/tidwall/match v1.1.1
> +## explicit
> +# github.com/tidwall/pretty v1.2.0
> +## explicit
> +# github.com/tklauser/go-sysconf v0.3.9
> +## explicit
> +# github.com/tklauser/numcpus v0.3.0
> +## explicit
> +# github.com/yusufpapurcu/wmi v1.2.2
> +## explicit
> +# go.etcd.io/etcd/api/v3 v3.5.2
> +## explicit
> +# go.etcd.io/etcd/client/pkg/v3 v3.5.2
> +## explicit
> +# go.etcd.io/etcd/client/v3 v3.5.2
> +## explicit
> +# go.uber.org/atomic v1.9.0
> +## explicit
> +# go.uber.org/multierr v1.7.0
> +## explicit
> +# go.uber.org/zap v1.19.1
> +## explicit
> +# golang.org/x/sync v0.0.0-20210220032951-036812b2e83c
> +## explicit
> +# golang.org/x/sys v0.0.0-20220412211240-33da011f77ad
> +## explicit
> +# google.golang.org/genproto v0.0.0-20211223182754-3ac035c7e7cb
> +## explicit
> +# google.golang.org/grpc v1.43.0
> +## explicit
> +# google.golang.org/protobuf v1.27.1
> +## explicit
> +# gopkg.in/ini.v1 v1.66.3
> +## explicit
> +# gopkg.in/yaml.v3 v3.0.1
> +## explicit
> diff --git a/meta-oe/recipes-extended/minio/minio_git.bb b/meta-oe/recipe=
s-extended/minio/minio_git.bb
> new file mode 100644
> index 000000000..d8f4c2c21
> --- /dev/null
> +++ b/meta-oe/recipes-extended/minio/minio_git.bb
> @@ -0,0 +1,158 @@
> +HOMEPAGE =3D "https://github.com/minio/mc"
> +SUMMARY =3D "MinIO Client is a replacement for ls, cp, mkdir, diff and r=
sync commands for filesystems and object storage."
> +DESCRIPTION =3D "MinIO Client (mc) provides a modern alternative to \
> +               UNIX commands like ls, cat, cp, mirror, diff, find \
> +               etc. It supports filesystems and Amazon S3 compatible \
> +               cloud storage service (AWS Signature v2 and v4). \
> +"
> +
> +SRC_URI =3D "git://github.com/minio/mc;nobranch=3D1;name=3Dmc;protocol=
=3Dhttps \
> +           file://modules.txt \
> +          "
> +
> +include src_uri.inc
> +
> +SRCREV_mc =3D "01b87ecc02ffad47dfe13c2154ac31db3e3115df"
> +
> +GO_IMPORT =3D "import"
> +
> +LICENSE =3D "GPL-3.0-only"
> +LIC_FILES_CHKSUM =3D "file://src/${GO_IMPORT}/LICENSE;md5=3Deb1e647870ad=
d0502f8f010b19de32af"
> +
> +PV =3D "${SRCREV_mc}"
> +
> +inherit go
> +inherit goarch
> +
> +DEPENDS +=3D "rsync-native"
> +
> +do_compile() {
> +
> +    cd ${S}/src/${GO_IMPORT}
> +
> +    export GOFLAGS=3D"-mod=3Dvendor"
> +    export GOPATH=3D"$GOPATH:${S}/src/import/.gopath:${S}/src/import/ven=
dor"
> +    sites=3D"github.com/charmbracelet/bubbletea:github.com/charmbracelet=
/bubbletea \
> +           github.com/cheggaaa/pb:github.com/cheggaaa/pb \
> +           github.com/dustin/go-humanize:github.com/dustin/go-humanize \
> +           github.com/fatih/color:github.com/fatih/color \
> +           github.com/go-ole/go-ole:github.com/go-ole/go-ole \
> +           github.com/goccy/go-json:github.com/goccy/go-json \
> +           github.com/google/shlex:github.com/google/shlex \
> +           github.com/google/uuid:github.com/google/uuid \
> +           github.com/inconshreveable/mousetrap:github.com/inconshreveab=
le/mousetrap \
> +           github.com/json-iterator/go:github.com/json-iterator/go \
> +           github.com/klauspost/compress:github.com/klauspost/compress \
> +           github.com/mattn/go-ieproxy:github.com/mattn/go-ieproxy \
> +           github.com/mattn/go-isatty:github.com/mattn/go-isatty \
> +           github.com/minio/cli:github.com/minio/cli \
> +           github.com/minio/colorjson:github.com/minio/colorjson \
> +           github.com/minio/filepath:github.com/minio/filepath \
> +           github.com/minio/madmin-go:github.com/minio/madmin-go \
> +           github.com/minio/md5-simd:github.com/minio/md5-simd \
> +           github.com/minio/minio-go/v7:github.com/minio/minio-go/v7 \
> +           github.com/minio/pkg:github.com/minio/pkg \
> +           github.com/minio/selfupdate:github.com/minio/selfupdate \
> +           github.com/minio/sha256-simd:github.com/minio/sha256-simd \
> +           github.com/mitchellh/go-homedir:github.com/mitchellh/go-homed=
ir \
> +           github.com/pkg/xattr:github.com/pkg/xattr \
> +           github.com/posener/complete:github.com/posener/complete \
> +           github.com/prometheus/client_golang:github.com/prometheus/cli=
ent_golang \
> +           github.com/prometheus/prom2json:github.com/prometheus/prom2js=
on \
> +           github.com/rjeczalik/notify:github.com/rjeczalik/notify \
> +           github.com/rs/xid:github.com/rs/xid \
> +           github.com/secure-io/sio-go:github.com/secure-io/sio-go \
> +           github.com/shirou/gopsutil/v3:github.com/shirou/gopsutil/v3 \
> +           github.com/tidwall/gjson:github.com/tidwall/gjson \
> +           golang.org/x/crypto:go.googlesource.com/crypto \
> +           golang.org/x/net:go.googlesource.com/net \
> +           golang.org/x/text:go.googlesource.com/text \
> +           gopkg.in/check.v1:gopkg.in/check.v1 \
> +           gopkg.in/h2non/filetype.v1:gopkg.in/h2non/filetype.v1 \
> +           gopkg.in/yaml.v2:gopkg.in/yaml.v2 \
> +           github.com/charmbracelet/bubbles:github.com/charmbracelet/bub=
bles \
> +           github.com/charmbracelet/lipgloss:github.com/charmbracelet/li=
pgloss \
> +           github.com/gdamore/tcell/v2:github.com/gdamore/tcell/v2 \
> +           github.com/golang-jwt/jwt/v4:github.com/golang-jwt/jwt/v4 \
> +           github.com/navidys/tvxwidgets:github.com/navidys/tvxwidgets \
> +           github.com/olekukonko/tablewriter:github.com/olekukonko/table=
writer \
> +           github.com/prometheus/client_model:github.com/prometheus/clie=
nt_model \
> +           github.com/rivo/tview:github.com/rivo/tview \
> +           github.com/tinylib/msgp:github.com/tinylib/msgp \
> +           golang.org/x/term:go.googlesource.com/term \
> +           github.com/beorn7/perks:github.com/beorn7/perks \
> +           github.com/cespare/xxhash/v2:github.com/cespare/xxhash/v2 \
> +           github.com/containerd/console:github.com/containerd/console \
> +           github.com/coreos/go-semver:github.com/coreos/go-semver \
> +           github.com/coreos/go-systemd/v22:github.com/coreos/go-systemd=
/v22 \
> +           github.com/decred/dcrd/dcrec/secp256k1/v4:github.com/decred/d=
crd/dcrec/secp256k1/v4//dcrec/secp256k1 \
> +           github.com/fatih/structs:github.com/fatih/structs \
> +           github.com/gdamore/encoding:github.com/gdamore/encoding \
> +           github.com/gogo/protobuf:github.com/gogo/protobuf \
> +           github.com/golang/protobuf:github.com/golang/protobuf \
> +           github.com/hashicorp/errwrap:github.com/hashicorp/errwrap \
> +           github.com/hashicorp/go-multierror:github.com/hashicorp/go-mu=
ltierror \
> +           github.com/klauspost/cpuid/v2:github.com/klauspost/cpuid/v2 \
> +           github.com/kr/text:github.com/kr/text \
> +           github.com/lestrrat-go/backoff/v2:github.com/lestrrat-go/back=
off/v2 \
> +           github.com/lestrrat-go/blackmagic:github.com/lestrrat-go/blac=
kmagic \
> +           github.com/lestrrat-go/httpcc:github.com/lestrrat-go/httpcc \
> +           github.com/lestrrat-go/iter:github.com/lestrrat-go/iter \
> +           github.com/lestrrat-go/jwx:github.com/lestrrat-go/jwx \
> +           github.com/lestrrat-go/option:github.com/lestrrat-go/option \
> +           github.com/lucasb-eyer/go-colorful:github.com/lucasb-eyer/go-=
colorful \
> +           github.com/lufia/plan9stats:github.com/lufia/plan9stats \
> +           github.com/mattn/go-colorable:github.com/mattn/go-colorable \
> +           github.com/mattn/go-runewidth:github.com/mattn/go-runewidth \
> +           github.com/matttproud/golang_protobuf_extensions:github.com/m=
atttproud/golang_protobuf_extensions \
> +           github.com/modern-go/concurrent:github.com/modern-go/concurre=
nt \
> +           github.com/modern-go/reflect2:github.com/modern-go/reflect2 \
> +           github.com/muesli/ansi:github.com/muesli/ansi \
> +           github.com/muesli/reflow:github.com/muesli/reflow \
> +           github.com/muesli/termenv:github.com/muesli/termenv \
> +           github.com/niemeyer/pretty:github.com/niemeyer/pretty \
> +           github.com/philhofer/fwd:github.com/philhofer/fwd \
> +           github.com/pkg/errors:github.com/pkg/errors \
> +           github.com/power-devops/perfstat:github.com/power-devops/perf=
stat \
> +           github.com/prometheus/common:github.com/prometheus/common \
> +           github.com/prometheus/procfs:github.com/prometheus/procfs \
> +           github.com/rivo/uniseg:github.com/rivo/uniseg \
> +           github.com/sirupsen/logrus:github.com/sirupsen/logrus \
> +           github.com/tidwall/match:github.com/tidwall/match \
> +           github.com/tidwall/pretty:github.com/tidwall/pretty \
> +           github.com/tklauser/go-sysconf:github.com/tklauser/go-sysconf=
 \
> +           github.com/tklauser/numcpus:github.com/tklauser/numcpus \
> +           github.com/yusufpapurcu/wmi:github.com/yusufpapurcu/wmi \
> +           go.etcd.io/etcd/api/v3:github.com/etcd-io/etcd/api/v3//api \
> +           go.etcd.io/etcd/client/pkg/v3:github.com/etcd-io/etcd/api/v3/=
/client/pkg \
> +           go.etcd.io/etcd/client/v3:github.com/etcd-io/etcd/api/v3//cli=
ent/v3 \
> +           go.uber.org/atomic:go.uber.org/atomic \
> +           go.uber.org/multierr:go.uber.org/multierr \
> +           go.uber.org/zap:go.uber.org/zap \
> +           golang.org/x/sync:go.googlesource.com/sync \
> +           golang.org/x/sys:go.googlesource.com/sys \
> +           google.golang.org/genproto:google.golang.org/genproto \
> +           google.golang.org/grpc:google.golang.org/grpc \
> +           google.golang.org/protobuf:google.golang.org/protobuf \
> +           gopkg.in/ini.v1:gopkg.in/ini.v1 \
> +           gopkg.in/yaml.v3:gopkg.in/yaml.v3"
> +    for s in $sites; do
> +        site_dest=3D$(echo $s | cut -d: -f1)
> +        site_source=3D$(echo $s | cut -d: -f2)
> +        mkdir -p vendor.copy/$site_dest
> +        [ -n "$(ls -A vendor.copy/$site_dest/*.go 2> /dev/null)" ] && { =
echo "[INFO] vendor.fetch/$site_source -> $site_dest: go copy skipped (file=
s present)" ; true ; } || { echo "[INFO] $site_dest: copying .go files" ; r=
sync -a --exclude=3D'vendor/' --exclude=3D'.git/' vendor.fetch/$site_source=
/ vendor.copy/$site_dest ; }
> +    done
> +
> +    ln -sf vendor.copy vendor
> +    # these are bad symlinks, go validates them and breaks the build if =
they are present
> +    rm -f vendor/go.etcd.io/etcd/client/v3/example_*
> +
> +    cp ${WORKDIR}/modules.txt vendor/
> +
> +    ${GO} build -trimpath
> +}
> +
> +do_install() {
> +    install -d ${D}/${sbindir}
> +    install ${S}/src/${GO_IMPORT}/mc ${D}/${sbindir}/mc
> +}
> diff --git a/meta-oe/recipes-extended/minio/src_uri.inc b/meta-oe/recipes=
-extended/minio/src_uri.inc
> new file mode 100644
> index 000000000..5cdc69dfc
> --- /dev/null
> +++ b/meta-oe/recipes-extended/minio/src_uri.inc
> @@ -0,0 +1,509 @@
> +#      github.com/charmbracelet/bubbletea v0.19.3
> +# [1] git ls-remote https://github.com/charmbracelet/bubbletea 3dc51789d=
11229a1fb00f137d02b50b04cac372b
> +SRCREV_bubbletea=3D"3dc51789d11229a1fb00f137d02b50b04cac372b"
> +SRC_URI +=3D "git://github.com/charmbracelet/bubbletea;name=3Dbubbletea;=
protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vend=
or.fetch/github.com/charmbracelet/bubbletea"
> +
> +#      github.com/cheggaaa/pb v1.0.29
> +# [1] git ls-remote https://github.com/cheggaaa/pb e2a33cc368a206516cc95=
f7bdd9176db0b83f098
> +SRCREV_pb=3D"e2a33cc368a206516cc95f7bdd9176db0b83f098"
> +SRC_URI +=3D "git://github.com/cheggaaa/pb;name=3Dpb;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com=
/cheggaaa/pb"
> +
> +#      github.com/dustin/go-humanize v1.0.0
> +# [1] git ls-remote https://github.com/dustin/go-humanize e673fa1ffc9121=
3297a60d18a6f513aa74bced52
> +SRCREV_go-humanize=3D"e673fa1ffc91213297a60d18a6f513aa74bced52"
> +SRC_URI +=3D "git://github.com/dustin/go-humanize;name=3Dgo-humanize;pro=
tocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.=
fetch/github.com/dustin/go-humanize"
> +
> +#      github.com/fatih/color v1.13.0
> +# [1] git ls-remote https://github.com/fatih/color a05da93ebe62ca9fc6791=
d3376ec4dad01196448
> +SRCREV_color=3D"a05da93ebe62ca9fc6791d3376ec4dad01196448"
> +SRC_URI +=3D "git://github.com/fatih/color;name=3Dcolor;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.=
com/fatih/color"
> +
> +#      github.com/go-ole/go-ole v1.2.6
> +# [1] git ls-remote https://github.com/go-ole/go-ole 8b1f7f90f6b1728609c=
9694f2cff140d34fd91f8
> +SRCREV_go-ole=3D"8b1f7f90f6b1728609c9694f2cff140d34fd91f8"
> +SRC_URI +=3D "git://github.com/go-ole/go-ole;name=3Dgo-ole;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/go-ole/go-ole"
> +
> +#      github.com/goccy/go-json v0.8.1
> +# [1] git ls-remote https://github.com/goccy/go-json de89bd3db67f2219c61=
83ec6febe2b5f7a6b06fb
> +SRCREV_go-json=3D"de89bd3db67f2219c6183ec6febe2b5f7a6b06fb"
> +SRC_URI +=3D "git://github.com/goccy/go-json;name=3Dgo-json;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/git=
hub.com/goccy/go-json"
> +
> +#      github.com/google/shlex v0.0.0-20191202100458-e7afc7fbc510
> +# [1] git ls-remote https://github.com/google/shlex e7afc7fbc51079733e94=
68cdfd1efcd7d196cd1d
> +SRCREV_shlex=3D"e7afc7fbc51079733e9468cdfd1efcd7d196cd1d"
> +SRC_URI +=3D "git://github.com/google/shlex;name=3Dshlex;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/google/shlex"
> +
> +#      github.com/google/uuid v1.3.0
> +# [1] git ls-remote https://github.com/google/uuid 44b5fee7c49cf3bcdf723=
f106b36d56ef13ccc88
> +SRCREV_uuid=3D"44b5fee7c49cf3bcdf723f106b36d56ef13ccc88"
> +SRC_URI +=3D "git://github.com/google/uuid;name=3Duuid;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/google/uuid"
> +
> +#      github.com/inconshreveable/mousetrap v1.0.0
> +# [1] git ls-remote https://github.com/inconshreveable/mousetrap 76626ae=
9c91c4f2a10f34cad8ce83ea42c93bb75
> +SRCREV_mousetrap=3D"76626ae9c91c4f2a10f34cad8ce83ea42c93bb75"
> +SRC_URI +=3D "git://github.com/inconshreveable/mousetrap;name=3Dmousetra=
p;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/ve=
ndor.fetch/github.com/inconshreveable/mousetrap"
> +
> +#      github.com/json-iterator/go v1.1.12
> +# [1] git ls-remote https://github.com/json-iterator/go 024077e996b04851=
7130b21ea6bf12aa23055d3d
> +SRCREV_go=3D"024077e996b048517130b21ea6bf12aa23055d3d"
> +SRC_URI +=3D "git://github.com/json-iterator/go;name=3Dgo;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/githu=
b.com/json-iterator/go"
> +
> +#      github.com/klauspost/compress v1.13.6
> +# [1] git ls-remote https://github.com/klauspost/compress 38d4ba985ac157=
cb858763e016645e14e74c13c4
> +SRCREV_compress=3D"38d4ba985ac157cb858763e016645e14e74c13c4"
> +SRC_URI +=3D "git://github.com/klauspost/compress;name=3Dcompress;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fet=
ch/github.com/klauspost/compress"
> +
> +#      github.com/mattn/go-ieproxy v0.0.1
> +# [1] git ls-remote https://github.com/mattn/go-ieproxy 439dd0581a2a03b4=
15673a2462ad5c21eaabc588
> +SRCREV_go-ieproxy=3D"439dd0581a2a03b415673a2462ad5c21eaabc588"
> +SRC_URI +=3D "git://github.com/mattn/go-ieproxy;name=3Dgo-ieproxy;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fet=
ch/github.com/mattn/go-ieproxy"
> +
> +#      github.com/mattn/go-isatty v0.0.14
> +# [1] git ls-remote https://github.com/mattn/go-isatty 504425e14f742f1f5=
17c4586048b49b37f829c8e
> +SRCREV_go-isatty=3D"504425e14f742f1f517c4586048b49b37f829c8e"
> +SRC_URI +=3D "git://github.com/mattn/go-isatty;name=3Dgo-isatty;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/mattn/go-isatty"
> +
> +#      github.com/minio/cli v1.22.0
> +# [1] git ls-remote https://github.com/minio/cli 735b30120ed7535d13933b0=
246f8a75cf80b0f74
> +SRCREV_cli=3D"735b30120ed7535d13933b0246f8a75cf80b0f74"
> +SRC_URI +=3D "git://github.com/minio/cli;name=3Dcli;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/=
minio/cli"
> +
> +#      github.com/minio/colorjson v1.0.2
> +# [1] git ls-remote https://github.com/minio/colorjson f964b335cdb6cd51d=
ff32a726d3d6ab9e1db0633
> +SRCREV_colorjson=3D"f964b335cdb6cd51dff32a726d3d6ab9e1db0633"
> +SRC_URI +=3D "git://github.com/minio/colorjson;name=3Dcolorjson;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/minio/colorjson"
> +
> +#      github.com/minio/filepath v1.0.0
> +# [1] git ls-remote https://github.com/minio/filepath a116cb5d2b6396deea=
35d06389e3e9809c887fcf
> +SRCREV_filepath=3D"a116cb5d2b6396deea35d06389e3e9809c887fcf"
> +SRC_URI +=3D "git://github.com/minio/filepath;name=3Dfilepath;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/minio/filepath"
> +
> +#      github.com/minio/madmin-go v1.4.3
> +# [1] git ls-remote https://github.com/minio/madmin-go 4f71c826739af4ebf=
73308e7f9a849a781859f78
> +SRCREV_madmin-go=3D"4f71c826739af4ebf73308e7f9a849a781859f78"
> +SRC_URI +=3D "git://github.com/minio/madmin-go;name=3Dmadmin-go;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/minio/madmin-go"
> +
> +#      github.com/minio/md5-simd v1.1.2
> +# [1] git ls-remote https://github.com/minio/md5-simd 776275e0c9a74ceebb=
d50fe5c1d61b0c80c608df
> +SRCREV_md5-simd=3D"776275e0c9a74ceebbd50fe5c1d61b0c80c608df"
> +SRC_URI +=3D "git://github.com/minio/md5-simd;name=3Dmd5-simd;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/minio/md5-simd"
> +
> +#      github.com/minio/minio-go/v7 v7.0.30
> +# [1] git ls-remote https://github.com/minio/minio-go 81c303325bb4426c89=
776854b2ea4f7936deb11c
> +SRCREV_v7=3D"81c303325bb4426c89776854b2ea4f7936deb11c"
> +SRC_URI +=3D "git://github.com/minio/minio-go;name=3Dv7;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.=
com/minio/minio-go/v7"
> +
> +#      github.com/minio/pkg v1.1.22
> +# [1] git ls-remote https://github.com/minio/pkg 3b76bdaec27995a31d0b0a7=
959bbef55bfe0d364
> +SRCREV_pkg=3D"3b76bdaec27995a31d0b0a7959bbef55bfe0d364"
> +SRC_URI +=3D "git://github.com/minio/pkg;name=3Dpkg;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/=
minio/pkg"
> +
> +#      github.com/minio/selfupdate v0.4.0
> +# [1] git ls-remote https://github.com/minio/selfupdate 9e32fb8d38277355=
add4fa3983edb0b376d12bb5
> +SRCREV_selfupdate=3D"9e32fb8d38277355add4fa3983edb0b376d12bb5"
> +SRC_URI +=3D "git://github.com/minio/selfupdate;name=3Dselfupdate;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fet=
ch/github.com/minio/selfupdate"
> +
> +#      github.com/minio/sha256-simd v1.0.0
> +# [1] git ls-remote https://github.com/minio/sha256-simd 6a57409d8e0fa3a=
e883aee331b71aaa40d5a7dd9
> +SRCREV_sha256-simd=3D"6a57409d8e0fa3ae883aee331b71aaa40d5a7dd9"
> +SRC_URI +=3D "git://github.com/minio/sha256-simd;name=3Dsha256-simd;prot=
ocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.f=
etch/github.com/minio/sha256-simd"
> +
> +#      github.com/mitchellh/go-homedir v1.1.0
> +# [1] git ls-remote https://github.com/mitchellh/go-homedir af06845cf300=
4701891bf4fdb884bfe4920b3727
> +SRCREV_go-homedir=3D"af06845cf3004701891bf4fdb884bfe4920b3727"
> +SRC_URI +=3D "git://github.com/mitchellh/go-homedir;name=3Dgo-homedir;pr=
otocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor=
.fetch/github.com/mitchellh/go-homedir"
> +
> +#      github.com/pkg/xattr v0.4.4
> +# [1] git ls-remote https://github.com/pkg/xattr 8725d4ccc0fcef59c8d9f0e=
af606b3c6f962467a
> +SRCREV_xattr=3D"8725d4ccc0fcef59c8d9f0eaf606b3c6f962467a"
> +SRC_URI +=3D "git://github.com/pkg/xattr;name=3Dxattr;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.co=
m/pkg/xattr"
> +
> +#      github.com/posener/complete v1.2.3
> +# [1] git ls-remote https://github.com/posener/complete 05b68ffc813dd10c=
420993cb1cf927b346c057b8
> +SRCREV_complete=3D"05b68ffc813dd10c420993cb1cf927b346c057b8"
> +SRC_URI +=3D "git://github.com/posener/complete;name=3Dcomplete;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/posener/complete"
> +
> +#      github.com/prometheus/client_golang v1.12.1
> +# [1] git ls-remote https://github.com/prometheus/client_golang 2e1c4818=
ccfdcf953ce399cadad615ff2bed968c
> +SRCREV_client_golang=3D"2e1c4818ccfdcf953ce399cadad615ff2bed968c"
> +SRC_URI +=3D "git://github.com/prometheus/client_golang;name=3Dclient_go=
lang;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import=
/vendor.fetch/github.com/prometheus/client_golang"
> +
> +#      github.com/prometheus/prom2json v1.3.1
> +# [1] git ls-remote https://github.com/prometheus/prom2json ac13972e54fe=
b2f8eafc9a613112cb310f5463dc
> +SRCREV_prom2json=3D"ac13972e54feb2f8eafc9a613112cb310f5463dc"
> +SRC_URI +=3D "git://github.com/prometheus/prom2json;name=3Dprom2json;pro=
tocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.=
fetch/github.com/prometheus/prom2json"
> +
> +#      github.com/rjeczalik/notify v0.9.2
> +# [1] git ls-remote https://github.com/rjeczalik/notify 69d839f37b13a8cb=
7a78366f7633a4071cb43be7
> +SRCREV_notify=3D"69d839f37b13a8cb7a78366f7633a4071cb43be7"
> +SRC_URI +=3D "git://github.com/rjeczalik/notify;name=3Dnotify;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/rjeczalik/notify"
> +
> +#      github.com/rs/xid v1.3.0
> +# [1] git ls-remote https://github.com/rs/xid efa678f304ab65d6d57eedcb08=
6798381ae22206
> +SRCREV_xid=3D"efa678f304ab65d6d57eedcb086798381ae22206"
> +SRC_URI +=3D "git://github.com/rs/xid;name=3Dxid;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/rs/=
xid"
> +
> +#      github.com/secure-io/sio-go v0.3.1
> +# [1] git ls-remote https://github.com/secure-io/sio-go a455d2cd8fcacdfe=
18557d117db15c0629fb7e2c
> +SRCREV_sio-go=3D"a455d2cd8fcacdfe18557d117db15c0629fb7e2c"
> +SRC_URI +=3D "git://github.com/secure-io/sio-go;name=3Dsio-go;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/secure-io/sio-go"
> +
> +#      github.com/shirou/gopsutil/v3 v3.21.12
> +# [1] git ls-remote https://github.com/shirou/gopsutil 2f8da0a39487ceddf=
44cebe53a1b563b0b7173cc
> +SRCREV_v3=3D"2f8da0a39487ceddf44cebe53a1b563b0b7173cc"
> +SRC_URI +=3D "git://github.com/shirou/gopsutil;name=3Dv3;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/shirou/gopsutil/v3"
> +
> +#      github.com/tidwall/gjson v1.12.1
> +# [1] git ls-remote https://github.com/tidwall/gjson db0033701cccc8e2e43=
b77d03e4f509a48b6b2f2
> +SRCREV_gjson=3D"db0033701cccc8e2e43b77d03e4f509a48b6b2f2"
> +SRC_URI +=3D "git://github.com/tidwall/gjson;name=3Dgjson;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/githu=
b.com/tidwall/gjson"
> +
> +#      golang.org/x/crypto v0.0.0-20220525230936-793ad666bf5e
> +# [1] git ls-remote https://go.googlesource.com/crypto 793ad666bf5ec6139=
2092b27061be9618e4e219b
> +SRCREV_crypto=3D"793ad666bf5ec61392092b27061be9618e4e219b"
> +SRC_URI +=3D "git://go.googlesource.com/crypto;name=3Dcrypto;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go=
.googlesource.com/crypto"
> +
> +#      golang.org/x/net v0.0.0-20220225172249-27dd8689420f
> +# [1] git ls-remote https://go.googlesource.com/net 27dd8689420fcde08851=
4397d015e4fea5174e0e
> +SRCREV_net=3D"27dd8689420fcde088514397d015e4fea5174e0e"
> +SRC_URI +=3D "git://go.googlesource.com/net;name=3Dnet;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.googl=
esource.com/net"
> +
> +#      golang.org/x/text v0.3.7
> +# [1] git ls-remote https://go.googlesource.com/text 3cd4007149f3f883d22=
9d707172ed356727aae99
> +SRCREV_text=3D"3cd4007149f3f883d229d707172ed356727aae99"
> +SRC_URI +=3D "git://go.googlesource.com/text;name=3Dtext;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.goo=
glesource.com/text"
> +
> +#      gopkg.in/check.v1 v1.0.0-20200902074654-038fdea0a05b
> +# [1] git ls-remote https://gopkg.in/check.v1 038fdea0a05bc030b0bfda479d=
c2e08d2220ec74
> +SRCREV_check.v1=3D"038fdea0a05bc030b0bfda479dc2e08d2220ec74"
> +SRC_URI +=3D "git://gopkg.in/check.v1;name=3Dcheck.v1;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/=
check.v1"
> +
> +#      gopkg.in/h2non/filetype.v1 v1.0.5
> +# [1] git ls-remote https://gopkg.in/h2non/filetype.v1 8f3142c797f0413f0=
0dadaf1bf97dd0b7b1f8d8b
> +SRCREV_filetype.v1=3D"8f3142c797f0413f00dadaf1bf97dd0b7b1f8d8b"
> +SRC_URI +=3D "git://gopkg.in/h2non/filetype.v1;name=3Dfiletype.v1;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fet=
ch/gopkg.in/h2non/filetype.v1"
> +
> +#      gopkg.in/yaml.v2 v2.4.0
> +# [1] git ls-remote https://gopkg.in/yaml.v2 7649d4548cb53a614db133b2a8a=
c1f31859dda8c
> +SRCREV_yaml.v2=3D"7649d4548cb53a614db133b2a8ac1f31859dda8c"
> +SRC_URI +=3D "git://gopkg.in/yaml.v2;name=3Dyaml.v2;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/ya=
ml.v2"
> +
> +#      github.com/charmbracelet/bubbles v0.10.0
> +# [1] git ls-remote https://github.com/charmbracelet/bubbles 7714089ad7c=
81898564ebeb7b6876b5844e26ccd
> +SRCREV_bubbles=3D"7714089ad7c81898564ebeb7b6876b5844e26ccd"
> +SRC_URI +=3D "git://github.com/charmbracelet/bubbles;name=3Dbubbles;prot=
ocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.f=
etch/github.com/charmbracelet/bubbles"
> +
> +#      github.com/charmbracelet/lipgloss v0.4.1-0.20220204041308-bf2912e=
703f6
> +# [1] git ls-remote https://github.com/charmbracelet/lipgloss bf2912e703=
f6ecf88a1b843472afd47ce5002caf
> +SRCREV_lipgloss=3D"bf2912e703f6ecf88a1b843472afd47ce5002caf"
> +SRC_URI +=3D "git://github.com/charmbracelet/lipgloss;name=3Dlipgloss;pr=
otocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor=
.fetch/github.com/charmbracelet/lipgloss"
> +
> +#      github.com/gdamore/tcell/v2 v2.4.1-0.20210905002822-f057f0a857a1
> +# [1] git ls-remote https://github.com/gdamore/tcell f057f0a857a1b3ac3e4=
fff8c6cfe8126f8387cd1
> +SRCREV_v2=3D"f057f0a857a1b3ac3e4fff8c6cfe8126f8387cd1"
> +SRC_URI +=3D "git://github.com/gdamore/tcell;name=3Dv2;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/gdamore/tcell/v2"
> +
> +#      github.com/golang-jwt/jwt/v4 v4.4.1
> +# [1] git ls-remote https://github.com/golang-jwt/jwt 0972257eba279bb357=
882afc11db8218644ad565
> +SRCREV_v4=3D"0972257eba279bb357882afc11db8218644ad565"
> +SRC_URI +=3D "git://github.com/golang-jwt/jwt;name=3Dv4;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.=
com/golang-jwt/jwt/v4"
> +
> +#      github.com/navidys/tvxwidgets v0.1.0
> +# [1] git ls-remote https://github.com/navidys/tvxwidgets f017cfd5ce6d4b=
d7fb22529305d7a438c3f1369d
> +SRCREV_tvxwidgets=3D"f017cfd5ce6d4bd7fb22529305d7a438c3f1369d"
> +SRC_URI +=3D "git://github.com/navidys/tvxwidgets;name=3Dtvxwidgets;prot=
ocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.f=
etch/github.com/navidys/tvxwidgets"
> +
> +#      github.com/olekukonko/tablewriter v0.0.5
> +# [1] git ls-remote https://github.com/olekukonko/tablewriter c7d2a8a09b=
076b70918308a3cd95464b2ae3b5d8
> +SRCREV_tablewriter=3D"c7d2a8a09b076b70918308a3cd95464b2ae3b5d8"
> +SRC_URI +=3D "git://github.com/olekukonko/tablewriter;name=3Dtablewriter=
;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/ven=
dor.fetch/github.com/olekukonko/tablewriter"
> +
> +#      github.com/prometheus/client_model v0.2.0
> +# [1] git ls-remote https://github.com/prometheus/client_model f44e7adcb=
a5ee54c8a94709e6fc300d83245f171
> +SRCREV_client_model=3D"f44e7adcba5ee54c8a94709e6fc300d83245f171"
> +SRC_URI +=3D "git://github.com/prometheus/client_model;name=3Dclient_mod=
el;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/v=
endor.fetch/github.com/prometheus/client_model"
> +
> +#      github.com/rivo/tview v0.0.0-20211202162923-2a6de950f73b
> +# [1] git ls-remote https://github.com/rivo/tview 2a6de950f73bdc70658f7e=
754d4b5593f15c8408
> +SRCREV_tview=3D"2a6de950f73bdc70658f7e754d4b5593f15c8408"
> +SRC_URI +=3D "git://github.com/rivo/tview;name=3Dtview;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/rivo/tview"
> +
> +#      github.com/tinylib/msgp v1.1.6
> +# [1] git ls-remote https://github.com/tinylib/msgp 205265da651409c54677=
b486e350b4d105da6d8b
> +SRCREV_msgp=3D"205265da651409c54677b486e350b4d105da6d8b"
> +SRC_URI +=3D "git://github.com/tinylib/msgp;name=3Dmsgp;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.=
com/tinylib/msgp"
> +
> +#      golang.org/x/term v0.0.0-20210927222741-03fcf44c2211
> +# [1] git ls-remote https://go.googlesource.com/term 03fcf44c2211dcd5eb7=
7510b5f7c1fb02d6ded50
> +SRCREV_term=3D"03fcf44c2211dcd5eb77510b5f7c1fb02d6ded50"
> +SRC_URI +=3D "git://go.googlesource.com/term;name=3Dterm;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.goo=
glesource.com/term"
> +
> +#      github.com/beorn7/perks v1.0.1
> +# [1] git ls-remote https://github.com/beorn7/perks c49ff274687222a7373c=
4cd83578f1065cf3e143
> +SRCREV_perks=3D"c49ff274687222a7373c4cd83578f1065cf3e143"
> +SRC_URI +=3D "git://github.com/beorn7/perks;name=3Dperks;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/beorn7/perks"
> +
> +#      github.com/cespare/xxhash/v2 v2.1.2
> +# [1] git ls-remote https://github.com/cespare/xxhash 7ae26c41ed6fb1f8a6=
c21e05eeff4d91b5e401c4
> +SRCREV_v21=3D"7ae26c41ed6fb1f8a6c21e05eeff4d91b5e401c4"
> +SRC_URI +=3D "git://github.com/cespare/xxhash;name=3Dv21;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/cespare/xxhash/v2"
> +
> +#      github.com/containerd/console v1.0.2
> +# [1] git ls-remote https://github.com/containerd/console d5efa7d56fd239=
f7f3dad2ab6685db09359a3618
> +SRCREV_console=3D"d5efa7d56fd239f7f3dad2ab6685db09359a3618"
> +SRC_URI +=3D "git://github.com/containerd/console;name=3Dconsole;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetc=
h/github.com/containerd/console"
> +
> +#      github.com/coreos/go-semver v0.3.0
> +# [1] git ls-remote https://github.com/coreos/go-semver 6e25b691b0ebe965=
7dd0ee60d73a9f8716f0c6f5
> +SRCREV_go-semver=3D"6e25b691b0ebe9657dd0ee60d73a9f8716f0c6f5"
> +SRC_URI +=3D "git://github.com/coreos/go-semver;name=3Dgo-semver;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetc=
h/github.com/coreos/go-semver"
> +
> +#      github.com/coreos/go-systemd/v22 v22.3.2
> +# [1] git ls-remote https://github.com/coreos/go-systemd 0b40357fd657602=
43a3eceb80a299772c23c8470
> +SRCREV_v22=3D"0b40357fd65760243a3eceb80a299772c23c8470"
> +SRC_URI +=3D "git://github.com/coreos/go-systemd;name=3Dv22;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/git=
hub.com/coreos/go-systemd/v22"
> +
> +#      github.com/decred/dcrd/dcrec/secp256k1/v4 v4.0.1
> +# [1] git ls-remote https://github.com/decred/dcrd 75f1b4dac2e43133f3281=
ac63a9ef9eb699200e5
> +SRCREV_v41=3D"75f1b4dac2e43133f3281ac63a9ef9eb699200e5"
> +SRC_URI +=3D "git://github.com/decred/dcrd;name=3Dv41;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.co=
m/decred/dcrd/dcrec/secp256k1/v4"
> +
> +#      github.com/fatih/structs v1.1.0
> +# [1] git ls-remote https://github.com/fatih/structs 4966fc68f5b7593aafa=
6cbbba2d65ec6e1416047
> +SRCREV_structs=3D"4966fc68f5b7593aafa6cbbba2d65ec6e1416047"
> +SRC_URI +=3D "git://github.com/fatih/structs;name=3Dstructs;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/git=
hub.com/fatih/structs"
> +
> +#      github.com/gdamore/encoding v1.0.0
> +# [1] git ls-remote https://github.com/gdamore/encoding 79c592247a624846=
8805a0e297f43a7cac979903
> +SRCREV_encoding=3D"79c592247a6248468805a0e297f43a7cac979903"
> +SRC_URI +=3D "git://github.com/gdamore/encoding;name=3Dencoding;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/gdamore/encoding"
> +
> +#      github.com/gogo/protobuf v1.3.2
> +# [1] git ls-remote https://github.com/gogo/protobuf b03c65ea87cdc3521ed=
e29f62fe3ce239267c1bc
> +SRCREV_protobuf=3D"b03c65ea87cdc3521ede29f62fe3ce239267c1bc"
> +SRC_URI +=3D "git://github.com/gogo/protobuf;name=3Dprotobuf;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/gogo/protobuf"
> +
> +#      github.com/golang/protobuf v1.5.2
> +# [1] git ls-remote https://github.com/golang/protobuf ae97035608a719c7a=
1c1c41bed0ae0744bdb0c6f
> +SRCREV_protobuf1=3D"ae97035608a719c7a1c1c41bed0ae0744bdb0c6f"
> +SRC_URI +=3D "git://github.com/golang/protobuf;name=3Dprotobuf1;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/golang/protobuf"
> +
> +#      github.com/hashicorp/errwrap v1.1.0
> +# [1] git ls-remote https://github.com/hashicorp/errwrap 7b00e5db719c64d=
14dd0caaacbd13e76254d02c0
> +SRCREV_errwrap=3D"7b00e5db719c64d14dd0caaacbd13e76254d02c0"
> +SRC_URI +=3D "git://github.com/hashicorp/errwrap;name=3Derrwrap;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/hashicorp/errwrap"
> +
> +#      github.com/hashicorp/go-multierror v1.1.1
> +# [1] git ls-remote https://github.com/hashicorp/go-multierror 9974e9ec5=
7696378079ecc3accd3d6f29401b3a0
> +SRCREV_go-multierror=3D"9974e9ec57696378079ecc3accd3d6f29401b3a0"
> +SRC_URI +=3D "git://github.com/hashicorp/go-multierror;name=3Dgo-multier=
ror;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/=
vendor.fetch/github.com/hashicorp/go-multierror"
> +
> +#      github.com/klauspost/cpuid/v2 v2.0.9
> +# [1] git ls-remote https://github.com/klauspost/cpuid 6903d4066801a7d80=
0d4537ee9eebe81ea97000e
> +SRCREV_v212=3D"6903d4066801a7d800d4537ee9eebe81ea97000e"
> +SRC_URI +=3D "git://github.com/klauspost/cpuid;name=3Dv212;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/klauspost/cpuid/v2"
> +
> +#      github.com/kr/text v0.2.0
> +# [1] git ls-remote https://github.com/kr/text 0e5f52c28dd72ab84daeb81b5=
a51f20fdc35f9c5
> +SRCREV_text1=3D"0e5f52c28dd72ab84daeb81b5a51f20fdc35f9c5"
> +SRC_URI +=3D "git://github.com/kr/text;name=3Dtext1;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/=
kr/text"
> +
> +#      github.com/lestrrat-go/backoff/v2 v2.0.8
> +# [1] git ls-remote https://github.com/lestrrat-go/backoff c3af762cb9d2b=
c8339e1d5099a4550366a675f60
> +SRCREV_v2123=3D"c3af762cb9d2bc8339e1d5099a4550366a675f60"
> +SRC_URI +=3D "git://github.com/lestrrat-go/backoff;name=3Dv2123;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/lestrrat-go/backoff/v2"
> +
> +#      github.com/lestrrat-go/blackmagic v1.0.0
> +# [1] git ls-remote https://github.com/lestrrat-go/blackmagic 370527f88b=
bfd5be3192a38af3148dbd64f0976f
> +SRCREV_blackmagic=3D"370527f88bbfd5be3192a38af3148dbd64f0976f"
> +SRC_URI +=3D "git://github.com/lestrrat-go/blackmagic;name=3Dblackmagic;=
protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vend=
or.fetch/github.com/lestrrat-go/blackmagic"
> +
> +#      github.com/lestrrat-go/httpcc v1.0.0
> +# [1] git ls-remote https://github.com/lestrrat-go/httpcc e7e8fea419e32f=
7549252ad15ecf17f3a3c1a268
> +SRCREV_httpcc=3D"e7e8fea419e32f7549252ad15ecf17f3a3c1a268"
> +SRC_URI +=3D "git://github.com/lestrrat-go/httpcc;name=3Dhttpcc;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/lestrrat-go/httpcc"
> +
> +#      github.com/lestrrat-go/iter v1.0.1
> +# [1] git ls-remote https://github.com/lestrrat-go/iter 628869e97ee3dcc0=
9033086e547a5cab96b0d708
> +SRCREV_iter=3D"628869e97ee3dcc09033086e547a5cab96b0d708"
> +SRC_URI +=3D "git://github.com/lestrrat-go/iter;name=3Diter;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/git=
hub.com/lestrrat-go/iter"
> +
> +#      github.com/lestrrat-go/jwx v1.2.14
> +# [1] git ls-remote https://github.com/lestrrat-go/jwx de7d9bca43812abc4=
f630320f8632108ccfe34bf
> +SRCREV_jwx=3D"de7d9bca43812abc4f630320f8632108ccfe34bf"
> +SRC_URI +=3D "git://github.com/lestrrat-go/jwx;name=3Djwx;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/githu=
b.com/lestrrat-go/jwx"
> +
> +#      github.com/lestrrat-go/option v1.0.0
> +# [1] git ls-remote https://github.com/lestrrat-go/option 7e3467dce320ff=
45667b138ae503367c92deaa0b
> +SRCREV_option=3D"7e3467dce320ff45667b138ae503367c92deaa0b"
> +SRC_URI +=3D "git://github.com/lestrrat-go/option;name=3Doption;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/lestrrat-go/option"
> +
> +#      github.com/lucasb-eyer/go-colorful v1.2.0
> +# [1] git ls-remote https://github.com/lucasb-eyer/go-colorful d2b05a0d8=
3cca9d610425691c3253d5f36d0ad06
> +SRCREV_go-colorful=3D"d2b05a0d83cca9d610425691c3253d5f36d0ad06"
> +SRC_URI +=3D "git://github.com/lucasb-eyer/go-colorful;name=3Dgo-colorfu=
l;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/ve=
ndor.fetch/github.com/lucasb-eyer/go-colorful"
> +
> +#      github.com/lufia/plan9stats v0.0.0-20211012122336-39d0f177ccd0
> +# [1] git ls-remote https://github.com/lufia/plan9stats 39d0f177ccd07bdf=
5eb6f051ab9b09651f05d6f2
> +SRCREV_plan9stats=3D"39d0f177ccd07bdf5eb6f051ab9b09651f05d6f2"
> +SRC_URI +=3D "git://github.com/lufia/plan9stats;name=3Dplan9stats;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fet=
ch/github.com/lufia/plan9stats"
> +
> +#      github.com/mattn/go-colorable v0.1.12
> +# [1] git ls-remote https://github.com/mattn/go-colorable e1bb79c8d53c38=
a60962ad4b8f658226cc983710
> +SRCREV_go-colorable=3D"e1bb79c8d53c38a60962ad4b8f658226cc983710"
> +SRC_URI +=3D "git://github.com/mattn/go-colorable;name=3Dgo-colorable;pr=
otocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor=
.fetch/github.com/mattn/go-colorable"
> +
> +#      github.com/mattn/go-runewidth v0.0.13
> +# [1] git ls-remote https://github.com/mattn/go-runewidth df1ff59654317c=
1b5a3f860ffc47402931932104
> +SRCREV_go-runewidth=3D"df1ff59654317c1b5a3f860ffc47402931932104"
> +SRC_URI +=3D "git://github.com/mattn/go-runewidth;name=3Dgo-runewidth;pr=
otocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor=
.fetch/github.com/mattn/go-runewidth"
> +
> +#      github.com/matttproud/golang_protobuf_extensions v1.0.1
> +# [1] git ls-remote https://github.com/matttproud/golang_protobuf_extens=
ions c12348ce28de40eed0136aa2b644d0ee0650e56c
> +SRCREV_golang_protobuf_extensions=3D"c12348ce28de40eed0136aa2b644d0ee065=
0e56c"
> +SRC_URI +=3D "git://github.com/matttproud/golang_protobuf_extensions;nam=
e=3Dgolang_protobuf_extensions;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$=
{WORKDIR}/${BP}/src/import/vendor.fetch/github.com/matttproud/golang_protob=
uf_extensions"
> +
> +#      github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1d=
d
> +# [1] git ls-remote https://github.com/modern-go/concurrent bacd9c7ef1dd=
9b15be4a9909b8ac7a4e313eec94
> +SRCREV_concurrent=3D"bacd9c7ef1dd9b15be4a9909b8ac7a4e313eec94"
> +SRC_URI +=3D "git://github.com/modern-go/concurrent;name=3Dconcurrent;pr=
otocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor=
.fetch/github.com/modern-go/concurrent"
> +
> +#      github.com/modern-go/reflect2 v1.0.2
> +# [1] git ls-remote https://github.com/modern-go/reflect2 2b33151c9bbc52=
31aea69b8861c540102b087070
> +SRCREV_reflect2=3D"2b33151c9bbc5231aea69b8861c540102b087070"
> +SRC_URI +=3D "git://github.com/modern-go/reflect2;name=3Dreflect2;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fet=
ch/github.com/modern-go/reflect2"
> +
> +#      github.com/muesli/ansi v0.0.0-20211018074035-2e021307bc4b
> +# [1] git ls-remote https://github.com/muesli/ansi 2e021307bc4b4f4766c3f=
b4faf6030b13dc9ec51
> +SRCREV_ansi=3D"2e021307bc4b4f4766c3fb4faf6030b13dc9ec51"
> +SRC_URI +=3D "git://github.com/muesli/ansi;name=3Dansi;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/muesli/ansi"
> +
> +#      github.com/muesli/reflow v0.3.0
> +# [1] git ls-remote https://github.com/muesli/reflow 602e329532049c9e33f=
a8c74e352a46fb9486947
> +SRCREV_reflow=3D"602e329532049c9e33fa8c74e352a46fb9486947"
> +SRC_URI +=3D "git://github.com/muesli/reflow;name=3Dreflow;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/muesli/reflow"
> +
> +#      github.com/muesli/termenv v0.11.1-0.20220204035834-5ac8409525e0
> +# [1] git ls-remote https://github.com/muesli/termenv 5ac8409525e03ee6cd=
96daeae32d47902b88f32a
> +SRCREV_termenv=3D"5ac8409525e03ee6cd96daeae32d47902b88f32a"
> +SRC_URI +=3D "git://github.com/muesli/termenv;name=3Dtermenv;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/muesli/termenv"
> +
> +#      github.com/niemeyer/pretty v0.0.0-20200227124842-a10e7caefd8e
> +# [1] git ls-remote https://github.com/niemeyer/pretty a10e7caefd8e0d600=
cea437f5c3613aeb1553d56
> +SRCREV_pretty=3D"a10e7caefd8e0d600cea437f5c3613aeb1553d56"
> +SRC_URI +=3D "git://github.com/niemeyer/pretty;name=3Dpretty;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/niemeyer/pretty"
> +
> +#      github.com/philhofer/fwd v1.1.1
> +# [1] git ls-remote https://github.com/philhofer/fwd 9bcb9cab1b0394d8516=
a132ec243ba944efdb644
> +SRCREV_fwd=3D"9bcb9cab1b0394d8516a132ec243ba944efdb644"
> +SRC_URI +=3D "git://github.com/philhofer/fwd;name=3Dfwd;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.=
com/philhofer/fwd"
> +
> +#      github.com/pkg/errors v0.9.1
> +# [1] git ls-remote https://github.com/pkg/errors 614d223910a179a466c176=
7a985424175c39b465
> +SRCREV_errors=3D"614d223910a179a466c1767a985424175c39b465"
> +SRC_URI +=3D "git://github.com/pkg/errors;name=3Derrors;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.=
com/pkg/errors"
> +
> +#      github.com/power-devops/perfstat v0.0.0-20210106213030-5aafc221ea=
8c
> +# [1] git ls-remote https://github.com/power-devops/perfstat 5aafc221ea8=
c1ff54b0835cbd5f2386a8410be11
> +SRCREV_perfstat=3D"5aafc221ea8c1ff54b0835cbd5f2386a8410be11"
> +SRC_URI +=3D "git://github.com/power-devops/perfstat;name=3Dperfstat;pro=
tocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.=
fetch/github.com/power-devops/perfstat"
> +
> +#      github.com/prometheus/common v0.33.0
> +# [1] git ls-remote https://github.com/prometheus/common 63e75f51cd23681=
30efbd51b95a4e457e64b444e
> +SRCREV_common=3D"63e75f51cd2368130efbd51b95a4e457e64b444e"
> +SRC_URI +=3D "git://github.com/prometheus/common;name=3Dcommon;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/prometheus/common"
> +
> +#      github.com/prometheus/procfs v0.7.3
> +# [1] git ls-remote https://github.com/prometheus/procfs f436cbb89ece38b=
f080d446b3ca27053b305eaac
> +SRCREV_procfs=3D"f436cbb89ece38bf080d446b3ca27053b305eaac"
> +SRC_URI +=3D "git://github.com/prometheus/procfs;name=3Dprocfs;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/prometheus/procfs"
> +
> +#      github.com/rivo/uniseg v0.2.0
> +# [1] git ls-remote https://github.com/rivo/uniseg 75711fccf6a3e85bc74c2=
41e2dddd06a9bc9e53d
> +SRCREV_uniseg=3D"75711fccf6a3e85bc74c241e2dddd06a9bc9e53d"
> +SRC_URI +=3D "git://github.com/rivo/uniseg;name=3Duniseg;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/rivo/uniseg"
> +
> +#      github.com/sirupsen/logrus v1.8.1
> +# [1] git ls-remote https://github.com/sirupsen/logrus bdc0db8ead3853c56=
b7cd1ac2ba4e11b47d7da6b
> +SRCREV_logrus=3D"bdc0db8ead3853c56b7cd1ac2ba4e11b47d7da6b"
> +SRC_URI +=3D "git://github.com/sirupsen/logrus;name=3Dlogrus;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/sirupsen/logrus"
> +
> +#      github.com/tidwall/match v1.1.1
> +# [1] git ls-remote https://github.com/tidwall/match 4c9fc61b493b7aa0a3d=
347e9190aa78c5bec09cf
> +SRCREV_match=3D"4c9fc61b493b7aa0a3d347e9190aa78c5bec09cf"
> +SRC_URI +=3D "git://github.com/tidwall/match;name=3Dmatch;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/githu=
b.com/tidwall/match"
> +
> +#      github.com/tidwall/pretty v1.2.0
> +# [1] git ls-remote https://github.com/tidwall/pretty aaa765e7476acb0028=
a854b85675801362cbdaa2
> +SRCREV_pretty1=3D"aaa765e7476acb0028a854b85675801362cbdaa2"
> +SRC_URI +=3D "git://github.com/tidwall/pretty;name=3Dpretty1;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/tidwall/pretty"
> +
> +#      github.com/tklauser/go-sysconf v0.3.9
> +# [1] git ls-remote https://github.com/tklauser/go-sysconf 746b19d14e19d=
242c2daa08e0d645c19832c1939
> +SRCREV_go-sysconf=3D"746b19d14e19d242c2daa08e0d645c19832c1939"
> +SRC_URI +=3D "git://github.com/tklauser/go-sysconf;name=3Dgo-sysconf;pro=
tocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.=
fetch/github.com/tklauser/go-sysconf"
> +
> +#      github.com/tklauser/numcpus v0.3.0
> +# [1] git ls-remote https://github.com/tklauser/numcpus cc3fdd5f3955d53d=
50d94380963bddd24bd373e2
> +SRCREV_numcpus=3D"cc3fdd5f3955d53d50d94380963bddd24bd373e2"
> +SRC_URI +=3D "git://github.com/tklauser/numcpus;name=3Dnumcpus;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/tklauser/numcpus"
> +
> +#      github.com/yusufpapurcu/wmi v1.2.2
> +# [1] git ls-remote https://github.com/yusufpapurcu/wmi 253c5f0cb35e666c=
4c0fc42083824e7c89f0cc8d
> +SRCREV_wmi=3D"253c5f0cb35e666c4c0fc42083824e7c89f0cc8d"
> +SRC_URI +=3D "git://github.com/yusufpapurcu/wmi;name=3Dwmi;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/yusufpapurcu/wmi"
> +
> +#      go.etcd.io/etcd/api/v3 v3.5.2
> +# [1] git ls-remote https://github.com/etcd-io/etcd 4591a096d4d3c08e577d=
7269851938db0c1da3d4
> +SRCREV_v31=3D"4591a096d4d3c08e577d7269851938db0c1da3d4"
> +SRC_URI +=3D "git://github.com/etcd-io/etcd;name=3Dv31;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/etcd-io/etcd/api/v3"
> +
> +#      go.uber.org/atomic v1.9.0
> +# [1] git ls-remote https://github.com/uber-go/atomic 135466e2d0c8f8adf4=
d37dc757e3df0ebdd0dfe8
> +SRCREV_atomic=3D"135466e2d0c8f8adf4d37dc757e3df0ebdd0dfe8"
> +SRC_URI +=3D "git://github.com/uber-go/atomic;name=3Datomic;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.=
uber.org/atomic"
> +
> +#      go.uber.org/multierr v1.7.0
> +# [1] git ls-remote https://github.com/uber-go/multierr 19d9fff1d3b66750=
a134671435786579bc994737
> +SRCREV_multierr=3D"19d9fff1d3b66750a134671435786579bc994737"
> +SRC_URI +=3D "git://github.com/uber-go/multierr;name=3Dmultierr;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/go.uber.org/multierr"
> +
> +#      go.uber.org/zap v1.19.1
> +# [1] git ls-remote https://github.com/uber-go/zap 2f61e97148e69cd2dd190=
2b03e89ce07cd1218a1
> +SRCREV_zap=3D"2f61e97148e69cd2dd1902b03e89ce07cd1218a1"
> +SRC_URI +=3D "git://github.com/uber-go/zap;name=3Dzap;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.uber.o=
rg/zap"
> +
> +#      golang.org/x/sync v0.0.0-20210220032951-036812b2e83c
> +# [1] git ls-remote https://go.googlesource.com/sync 036812b2e83c0ddf193=
dd5a34e034151da389d09
> +SRCREV_sync=3D"036812b2e83c0ddf193dd5a34e034151da389d09"
> +SRC_URI +=3D "git://go.googlesource.com/sync;name=3Dsync;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.goo=
glesource.com/sync"
> +
> +#      golang.org/x/sys v0.0.0-20220412211240-33da011f77ad
> +# [1] git ls-remote https://go.googlesource.com/sys 33da011f77ade50ff5b6=
a6fb4a9a1e6d6b285809
> +SRCREV_sys=3D"33da011f77ade50ff5b6a6fb4a9a1e6d6b285809"
> +SRC_URI +=3D "git://go.googlesource.com/sys;name=3Dsys;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.googl=
esource.com/sys"
> +
> +#      google.golang.org/genproto v0.0.0-20211223182754-3ac035c7e7cb
> +# [1] git ls-remote https://github.com/googleapis/go-genproto 3ac035c7e7=
cbd86eb6d8b95be888cf83d73dedd3
> +SRCREV_genproto=3D"3ac035c7e7cbd86eb6d8b95be888cf83d73dedd3"
> +SRC_URI +=3D "git://github.com/googleapis/go-genproto;name=3Dgenproto;pr=
otocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor=
.fetch/google.golang.org/genproto"
> +
> +#      google.golang.org/grpc v1.43.0
> +# [1] git ls-remote https://github.com/grpc/grpc-go 14c11384b76b67f7b1b3=
2a5d18f865762634c0ae
> +SRCREV_grpc=3D"14c11384b76b67f7b1b32a5d18f865762634c0ae"
> +SRC_URI +=3D "git://github.com/grpc/grpc-go;name=3Dgrpc;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/google.=
golang.org/grpc"
> +
> +#      google.golang.org/protobuf v1.27.1
> +# [1] git ls-remote https://github.com/protocolbuffers/protobuf-go b9271=
7ecb630d4a4824b372bf98c729d87311a4d
> +SRCREV_protobuf12=3D"b92717ecb630d4a4824b372bf98c729d87311a4d"
> +SRC_URI +=3D "git://github.com/protocolbuffers/protobuf-go;name=3Dprotob=
uf12;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import=
/vendor.fetch/google.golang.org/protobuf"
> +
> +#      gopkg.in/ini.v1 v1.66.3
> +# [1] git ls-remote https://gopkg.in/ini.v1 fcd6cc399e588727c1231f4ea187=
d1b963536bcc
> +SRCREV_ini.v1=3D"fcd6cc399e588727c1231f4ea187d1b963536bcc"
> +SRC_URI +=3D "git://gopkg.in/ini.v1;name=3Dini.v1;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/ini.=
v1"
> +
> +#      gopkg.in/yaml.v3 v3.0.1
> +# [1] git ls-remote https://gopkg.in/yaml.v3 f6f7691b1fdeb513f56608cd2c3=
2c51f8194bf51
> +SRCREV_yaml.v3=3D"f6f7691b1fdeb513f56608cd2c32c51f8194bf51"
> +SRC_URI +=3D "git://gopkg.in/yaml.v3;name=3Dyaml.v3;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/ya=
ml.v3"
> --
> 2.33.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99378): https://lists.openembedded.org/g/openembedded=
-devel/message/99378
> Mute This Topic: https://lists.openembedded.org/mt/94687258/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

