Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A77C77B7C
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 09:26:06 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.25873.1685265959066094825
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 May 2023 02:25:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=T/2tQUWz;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-30ae69ef78aso272904f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 May 2023 02:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685265957; x=1687857957;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZ7vKvAuG2UlTIj53OT0sHv4/cw58XkkwvTD9mT3HOI=;
        b=T/2tQUWzmwcb+SVkZ8kJpALDdvI6MUBWnn0WRcp10wLgOeg/rflaSoQ6hhJzx69hI6
         BSMaF0ZAff9DKjCeXOKEEtS0VRH+L081Q3WUl2pvgFon5tuzpj/eJZ+ywYJdR6oOgnd+
         BiPj38RqIlkJgxdceyrd0ulOTg/QDF+c9HvkbBJ/yPoCSTD1H3qfCGAMywLU9vEo2JsC
         9AUcLCRH3HeDmyVNiMpaMk/G8LGpDP4EFZtZkJGTwVYboc0jvsQ3JIKTZMkv4bJWoHow
         hSyrilByVWjnV+nVwBosvpW3i+PGrXv4a9b2AhLHVsye5Ghje4ZjQqi8Gb0mkn2yrL6O
         xucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685265957; x=1687857957;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZZ7vKvAuG2UlTIj53OT0sHv4/cw58XkkwvTD9mT3HOI=;
        b=MYb+X8rDDYB7hjbB/nY5cGkJZ8BWQIA2B6mbM00vk5hHLGA8xspOiQ+vzMKmPJXFAR
         FSupa9lTBPqtt420Pyl89CkkUrFVsQIFpfuGfLXobJ29jrQmXyUW3493NDwNffK0rfO/
         8ycmrj0HI9UmyUMXH4GxqNWGaoDkKT/6nmOfyQjS83XoyF9G5omga6JG2lWH6XAtkhJ4
         qQ/p+RkaLur6GxxcohQJJptebDaY1DJkI5qSn6vpERmhPCA3RG5ZEIWphblnrcz1+Q0l
         cI379epipUi8jqzgx/LVANrJjxEhYEcrsPy7WfSQ7TPpoadY6jAIkIcK7PcGUbtaFOKG
         0aGw==
X-Gm-Message-State: AC+VfDy0oVjAFQhvlFXXWoSDVNzA4u9NJceBrYzLeQEUS5PlENCInlrW
	89erNxkqUt7IjGFpTEm861y5giXrKIyc/Y8RgJ8=
X-Google-Smtp-Source: ACHHUZ7jz4GI7p7DaOOYJyJDcFzNXzeAUqb+oepV1Em2ejTJZ4w+lVSS1cyNbP0icVP+YssN8usPAlCO7OpIgQjTa9A=
X-Received: by 2002:adf:fe92:0:b0:307:869c:99ce with SMTP id
 l18-20020adffe92000000b00307869c99cemr4220568wrr.21.1685265956689; Sun, 28
 May 2023 02:25:56 -0700 (PDT)
MIME-Version: 1.0
References: <20221102211419.29493-1-sakib.sajal@windriver.com>
In-Reply-To: <20221102211419.29493-1-sakib.sajal@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 28 May 2023 11:25:45 +0200
Message-ID: <CA+chaQcg3DSGa54JJQt_iVKyh+WcYx+Q=sth4s0LBej7H5Skcw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH V5] minio: add recipe for minio client
To: Sakib Sajal <sakib.sajal@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b35af905fcbd8e4c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 May 2023 09:26:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102887

--000000000000b35af905fcbd8e4c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

the go upgrade to 1.20.4 in
https://git.openembedded.org/openembedded-core/commit/?id=3De043bfb42156c59=
c93c6a4816528a63cfdaccc3e
broke minio package_qa:
ERROR: QA Issue: minio: ELF binary /usr/sbin/mc has relocations in .text
[textrel]

I don't use minio, I've just noticed it as new issue in my world builds, I
didn't look much deeper than confirming that reverting go upgrade fixes
this textrel.

Regards,

On Wed, Nov 2, 2022 at 10:18=E2=80=AFPM Sakib Sajal <sakib.sajal@windriver.=
com>
wrote:

> MinIO Client (mc) provides a modern alternative to UNIX commands like
> ls, cat, cp, mirror, diff, find etc. It supports filesystems and Amazon
> S3 compatible cloud storage service (AWS Signature v2 and v4).
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  .../recipes-extended/minio/minio/modules.txt  | 208 +++++++
>  meta-oe/recipes-extended/minio/minio_git.bb   | 160 ++++++
>  meta-oe/recipes-extended/minio/src_uri.inc    | 509 ++++++++++++++++++
>  3 files changed, 877 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/minio/minio/modules.txt
>  create mode 100644 meta-oe/recipes-extended/minio/minio_git.bb
>  create mode 100644 meta-oe/recipes-extended/minio/src_uri.inc
>
> diff --git a/meta-oe/recipes-extended/minio/minio/modules.txt
> b/meta-oe/recipes-extended/minio/minio/modules.txt
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
> diff --git a/meta-oe/recipes-extended/minio/minio_git.bb
> b/meta-oe/recipes-extended/minio/minio_git.bb
> new file mode 100644
> index 000000000..e88ea632f
> --- /dev/null
> +++ b/meta-oe/recipes-extended/minio/minio_git.bb
> @@ -0,0 +1,160 @@
> +HOMEPAGE =3D "https://github.com/minio/mc"
> +SUMMARY =3D "MinIO Client is a replacement for ls, cp, mkdir, diff and
> rsync commands for filesystems and object storage."
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
> +LIC_FILES_CHKSUM =3D
> "file://src/${GO_IMPORT}/LICENSE;md5=3Deb1e647870add0502f8f010b19de32af"
> +
> +PV =3D "${SRCREV_mc}"
> +
> +inherit go
> +inherit goarch
> +
> +CGO_LDFLAGS:append:mips =3D " -no-pie"
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
> +    sites=3D"
> github.com/charmbracelet/bubbletea:github.com/charmbracelet/bubbletea \
> +           github.com/cheggaaa/pb:github.com/cheggaaa/pb \
> +           github.com/dustin/go-humanize:github.com/dustin/go-humanize \
> +           github.com/fatih/color:github.com/fatih/color \
> +           github.com/go-ole/go-ole:github.com/go-ole/go-ole \
> +           github.com/goccy/go-json:github.com/goccy/go-json \
> +           github.com/google/shlex:github.com/google/shlex \
> +           github.com/google/uuid:github.com/google/uuid \
> +
> github.com/inconshreveable/mousetrap:github.com/inconshreveable/mousetrap
> \
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
> +
> github.com/mitchellh/go-homedir:github.com/mitchellh/go-homedir \
> +           github.com/pkg/xattr:github.com/pkg/xattr \
> +           github.com/posener/complete:github.com/posener/complete \
> +
> github.com/prometheus/client_golang:github.com/prometheus/client_golang \
> +
> github.com/prometheus/prom2json:github.com/prometheus/prom2json \
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
> +
> github.com/charmbracelet/bubbles:github.com/charmbracelet/bubbles \
> +
> github.com/charmbracelet/lipgloss:github.com/charmbracelet/lipgloss \
> +           github.com/gdamore/tcell/v2:github.com/gdamore/tcell/v2 \
> +           github.com/golang-jwt/jwt/v4:github.com/golang-jwt/jwt/v4 \
> +           github.com/navidys/tvxwidgets:github.com/navidys/tvxwidgets \
> +
> github.com/olekukonko/tablewriter:github.com/olekukonko/tablewriter \
> +
> github.com/prometheus/client_model:github.com/prometheus/client_model \
> +           github.com/rivo/tview:github.com/rivo/tview \
> +           github.com/tinylib/msgp:github.com/tinylib/msgp \
> +           golang.org/x/term:go.googlesource.com/term \
> +           github.com/beorn7/perks:github.com/beorn7/perks \
> +           github.com/cespare/xxhash/v2:github.com/cespare/xxhash/v2 \
> +           github.com/containerd/console:github.com/containerd/console \
> +           github.com/coreos/go-semver:github.com/coreos/go-semver \
> +
> github.com/coreos/go-systemd/v22:github.com/coreos/go-systemd/v22 \
> +
> github.com/decred/dcrd/dcrec/secp256k1/v4:github.com/decred/dcrd/dcrec/se=
cp256k1/v4//dcrec/secp256k1
> \
> +           github.com/fatih/structs:github.com/fatih/structs \
> +           github.com/gdamore/encoding:github.com/gdamore/encoding \
> +           github.com/gogo/protobuf:github.com/gogo/protobuf \
> +           github.com/golang/protobuf:github.com/golang/protobuf \
> +           github.com/hashicorp/errwrap:github.com/hashicorp/errwrap \
> +
> github.com/hashicorp/go-multierror:github.com/hashicorp/go-multierror \
> +           github.com/klauspost/cpuid/v2:github.com/klauspost/cpuid/v2 \
> +           github.com/kr/text:github.com/kr/text \
> +
> github.com/lestrrat-go/backoff/v2:github.com/lestrrat-go/backoff/v2 \
> +
> github.com/lestrrat-go/blackmagic:github.com/lestrrat-go/blackmagic \
> +           github.com/lestrrat-go/httpcc:github.com/lestrrat-go/httpcc \
> +           github.com/lestrrat-go/iter:github.com/lestrrat-go/iter \
> +           github.com/lestrrat-go/jwx:github.com/lestrrat-go/jwx \
> +           github.com/lestrrat-go/option:github.com/lestrrat-go/option \
> +
> github.com/lucasb-eyer/go-colorful:github.com/lucasb-eyer/go-colorful \
> +           github.com/lufia/plan9stats:github.com/lufia/plan9stats \
> +           github.com/mattn/go-colorable:github.com/mattn/go-colorable \
> +           github.com/mattn/go-runewidth:github.com/mattn/go-runewidth \
> +
> github.com/matttproud/golang_protobuf_extensions:github.com/matttproud/go=
lang_protobuf_extensions
> \
> +
> github.com/modern-go/concurrent:github.com/modern-go/concurrent \
> +           github.com/modern-go/reflect2:github.com/modern-go/reflect2 \
> +           github.com/muesli/ansi:github.com/muesli/ansi \
> +           github.com/muesli/reflow:github.com/muesli/reflow \
> +           github.com/muesli/termenv:github.com/muesli/termenv \
> +           github.com/niemeyer/pretty:github.com/niemeyer/pretty \
> +           github.com/philhofer/fwd:github.com/philhofer/fwd \
> +           github.com/pkg/errors:github.com/pkg/errors \
> +
> github.com/power-devops/perfstat:github.com/power-devops/perfstat \
> +           github.com/prometheus/common:github.com/prometheus/common \
> +           github.com/prometheus/procfs:github.com/prometheus/procfs \
> +           github.com/rivo/uniseg:github.com/rivo/uniseg \
> +           github.com/sirupsen/logrus:github.com/sirupsen/logrus \
> +           github.com/tidwall/match:github.com/tidwall/match \
> +           github.com/tidwall/pretty:github.com/tidwall/pretty \
> +           github.com/tklauser/go-sysconf:github.com/tklauser/go-sysconf
> \
> +           github.com/tklauser/numcpus:github.com/tklauser/numcpus \
> +           github.com/yusufpapurcu/wmi:github.com/yusufpapurcu/wmi \
> +           go.etcd.io/etcd/api/v3:github.com/etcd-io/etcd/api/v3//api \
> +
> go.etcd.io/etcd/client/pkg/v3:github.com/etcd-io/etcd/api/v3//client/pkg =
\
> +
> go.etcd.io/etcd/client/v3:github.com/etcd-io/etcd/api/v3//client/v3 \
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
> +        [ -n "$(ls -A vendor.copy/$site_dest/*.go 2> /dev/null)" ] && {
> echo "[INFO] vendor.fetch/$site_source -> $site_dest: go copy skipped
> (files present)" ; true ; } || { echo "[INFO] $site_dest: copying .go
> files" ; rsync -a --exclude=3D'vendor/' --exclude=3D'.git/'
> vendor.fetch/$site_source/ vendor.copy/$site_dest ; }
> +    done
> +
> +    ln -sf vendor.copy vendor
> +    # these are bad symlinks, go validates them and breaks the build if
> they are present
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
> diff --git a/meta-oe/recipes-extended/minio/src_uri.inc
> b/meta-oe/recipes-extended/minio/src_uri.inc
> new file mode 100644
> index 000000000..5cdc69dfc
> --- /dev/null
> +++ b/meta-oe/recipes-extended/minio/src_uri.inc
> @@ -0,0 +1,509 @@
> +#      github.com/charmbracelet/bubbletea v0.19.3
> +# [1] git ls-remote https://github.com/charmbracelet/bubbletea
> 3dc51789d11229a1fb00f137d02b50b04cac372b
> +SRCREV_bubbletea=3D"3dc51789d11229a1fb00f137d02b50b04cac372b"
> +SRC_URI +=3D "git://
> github.com/charmbracelet/bubbletea;name=3Dbubbletea;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/c=
harmbracelet/bubbletea
> <http://github.com/charmbracelet/bubbletea;name=3Dbubbletea;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fe=
tch/github.com/charmbracelet/bubbletea>
> "
> +
> +#      github.com/cheggaaa/pb v1.0.29
> +# [1] git ls-remote https://github.com/cheggaaa/pb
> e2a33cc368a206516cc95f7bdd9176db0b83f098
> +SRCREV_pb=3D"e2a33cc368a206516cc95f7bdd9176db0b83f098"
> +SRC_URI +=3D "git://
> github.com/cheggaaa/pb;name=3Dpb;protocol=3Dhttps;nobranch=3D1;destsuffix=
=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/cheggaaa/pb
> <http://github.com/cheggaaa/pb;name=3Dpb;protocol=3Dhttps;nobranch=3D1;de=
stsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/cheg=
gaaa/pb>
> "
> +
> +#      github.com/dustin/go-humanize v1.0.0
> +# [1] git ls-remote https://github.com/dustin/go-humanize
> e673fa1ffc91213297a60d18a6f513aa74bced52
> +SRCREV_go-humanize=3D"e673fa1ffc91213297a60d18a6f513aa74bced52"
> +SRC_URI +=3D "git://
> github.com/dustin/go-humanize;name=3Dgo-humanize;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/dust=
in/go-humanize
> <http://github.com/dustin/go-humanize;name=3Dgo-humanize;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch=
/github.com/dustin/go-humanize>
> "
> +
> +#      github.com/fatih/color v1.13.0
> +# [1] git ls-remote https://github.com/fatih/color
> a05da93ebe62ca9fc6791d3376ec4dad01196448
> +SRCREV_color=3D"a05da93ebe62ca9fc6791d3376ec4dad01196448"
> +SRC_URI +=3D "git://
> github.com/fatih/color;name=3Dcolor;protocol=3Dhttps;nobranch=3D1;destsuf=
fix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/fatih/color
> <http://github.com/fatih/color;name=3Dcolor;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/f=
atih/color>
> "
> +
> +#      github.com/go-ole/go-ole v1.2.6
> +# [1] git ls-remote https://github.com/go-ole/go-ole
> 8b1f7f90f6b1728609c9694f2cff140d34fd91f8
> +SRCREV_go-ole=3D"8b1f7f90f6b1728609c9694f2cff140d34fd91f8"
> +SRC_URI +=3D "git://
> github.com/go-ole/go-ole;name=3Dgo-ole;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/go-ole/go-ole
> <http://github.com/go-ole/go-ole;name=3Dgo-ole;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.c=
om/go-ole/go-ole>
> "
> +
> +#      github.com/goccy/go-json v0.8.1
> +# [1] git ls-remote https://github.com/goccy/go-json
> de89bd3db67f2219c6183ec6febe2b5f7a6b06fb
> +SRCREV_go-json=3D"de89bd3db67f2219c6183ec6febe2b5f7a6b06fb"
> +SRC_URI +=3D "git://
> github.com/goccy/go-json;name=3Dgo-json;protocol=3Dhttps;nobranch=3D1;des=
tsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/goccy/go-json
> <http://github.com/goccy/go-json;name=3Dgo-json;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.c=
om/goccy/go-json>
> "
> +
> +#      github.com/google/shlex v0.0.0-20191202100458-e7afc7fbc510
> +# [1] git ls-remote https://github.com/google/shlex
> e7afc7fbc51079733e9468cdfd1efcd7d196cd1d
> +SRCREV_shlex=3D"e7afc7fbc51079733e9468cdfd1efcd7d196cd1d"
> +SRC_URI +=3D "git://
> github.com/google/shlex;name=3Dshlex;protocol=3Dhttps;nobranch=3D1;destsu=
ffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/google/shlex
> <http://github.com/google/shlex;name=3Dshlex;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/=
google/shlex>
> "
> +
> +#      github.com/google/uuid v1.3.0
> +# [1] git ls-remote https://github.com/google/uuid
> 44b5fee7c49cf3bcdf723f106b36d56ef13ccc88
> +SRCREV_uuid=3D"44b5fee7c49cf3bcdf723f106b36d56ef13ccc88"
> +SRC_URI +=3D "git://
> github.com/google/uuid;name=3Duuid;protocol=3Dhttps;nobranch=3D1;destsuff=
ix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/google/uuid
> <http://github.com/google/uuid;name=3Duuid;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/go=
ogle/uuid>
> "
> +
> +#      github.com/inconshreveable/mousetrap v1.0.0
> +# [1] git ls-remote https://github.com/inconshreveable/mousetrap
> 76626ae9c91c4f2a10f34cad8ce83ea42c93bb75
> +SRCREV_mousetrap=3D"76626ae9c91c4f2a10f34cad8ce83ea42c93bb75"
> +SRC_URI +=3D "git://
> github.com/inconshreveable/mousetrap;name=3Dmousetrap;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com=
/inconshreveable/mousetrap
> <http://github.com/inconshreveable/mousetrap;name=3Dmousetrap;protocol=3D=
https;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.=
fetch/github.com/inconshreveable/mousetrap>
> "
> +
> +#      github.com/json-iterator/go v1.1.12
> +# [1] git ls-remote https://github.com/json-iterator/go
> 024077e996b048517130b21ea6bf12aa23055d3d
> +SRCREV_go=3D"024077e996b048517130b21ea6bf12aa23055d3d"
> +SRC_URI +=3D "git://
> github.com/json-iterator/go;name=3Dgo;protocol=3Dhttps;nobranch=3D1;dests=
uffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/json-iterator/g=
o
> <http://github.com/json-iterator/go;name=3Dgo;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.c=
om/json-iterator/go>
> "
> +
> +#      github.com/klauspost/compress v1.13.6
> +# [1] git ls-remote https://github.com/klauspost/compress
> 38d4ba985ac157cb858763e016645e14e74c13c4
> +SRCREV_compress=3D"38d4ba985ac157cb858763e016645e14e74c13c4"
> +SRC_URI +=3D "git://
> github.com/klauspost/compress;name=3Dcompress;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/klaus=
post/compress
> <http://github.com/klauspost/compress;name=3Dcompress;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/gi=
thub.com/klauspost/compress>
> "
> +
> +#      github.com/mattn/go-ieproxy v0.0.1
> +# [1] git ls-remote https://github.com/mattn/go-ieproxy
> 439dd0581a2a03b415673a2462ad5c21eaabc588
> +SRCREV_go-ieproxy=3D"439dd0581a2a03b415673a2462ad5c21eaabc588"
> +SRC_URI +=3D "git://
> github.com/mattn/go-ieproxy;name=3Dgo-ieproxy;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mattn=
/go-ieproxy
> <http://github.com/mattn/go-ieproxy;name=3Dgo-ieproxy;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/gi=
thub.com/mattn/go-ieproxy>
> "
> +
> +#      github.com/mattn/go-isatty v0.0.14
> +# [1] git ls-remote https://github.com/mattn/go-isatty
> 504425e14f742f1f517c4586048b49b37f829c8e
> +SRCREV_go-isatty=3D"504425e14f742f1f517c4586048b49b37f829c8e"
> +SRC_URI +=3D "git://
> github.com/mattn/go-isatty;name=3Dgo-isatty;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mattn/go-=
isatty
> <http://github.com/mattn/go-isatty;name=3Dgo-isatty;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/gith=
ub.com/mattn/go-isatty>
> "
> +
> +#      github.com/minio/cli v1.22.0
> +# [1] git ls-remote https://github.com/minio/cli
> 735b30120ed7535d13933b0246f8a75cf80b0f74
> +SRCREV_cli=3D"735b30120ed7535d13933b0246f8a75cf80b0f74"
> +SRC_URI +=3D "git://
> github.com/minio/cli;name=3Dcli;protocol=3Dhttps;nobranch=3D1;destsuffix=
=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/minio/cli
> <http://github.com/minio/cli;name=3Dcli;protocol=3Dhttps;nobranch=3D1;des=
tsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/minio=
/cli>
> "
> +
> +#      github.com/minio/colorjson v1.0.2
> +# [1] git ls-remote https://github.com/minio/colorjson
> f964b335cdb6cd51dff32a726d3d6ab9e1db0633
> +SRCREV_colorjson=3D"f964b335cdb6cd51dff32a726d3d6ab9e1db0633"
> +SRC_URI +=3D "git://
> github.com/minio/colorjson;name=3Dcolorjson;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/minio/col=
orjson
> <http://github.com/minio/colorjson;name=3Dcolorjson;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/gith=
ub.com/minio/colorjson>
> "
> +
> +#      github.com/minio/filepath v1.0.0
> +# [1] git ls-remote https://github.com/minio/filepath
> a116cb5d2b6396deea35d06389e3e9809c887fcf
> +SRCREV_filepath=3D"a116cb5d2b6396deea35d06389e3e9809c887fcf"
> +SRC_URI +=3D "git://
> github.com/minio/filepath;name=3Dfilepath;protocol=3Dhttps;nobranch=3D1;d=
estsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/minio/filep=
ath
> <http://github.com/minio/filepath;name=3Dfilepath;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github=
.com/minio/filepath>
> "
> +
> +#      github.com/minio/madmin-go v1.4.3
> +# [1] git ls-remote https://github.com/minio/madmin-go
> 4f71c826739af4ebf73308e7f9a849a781859f78
> +SRCREV_madmin-go=3D"4f71c826739af4ebf73308e7f9a849a781859f78"
> +SRC_URI +=3D "git://
> github.com/minio/madmin-go;name=3Dmadmin-go;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/minio/mad=
min-go
> <http://github.com/minio/madmin-go;name=3Dmadmin-go;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/gith=
ub.com/minio/madmin-go>
> "
> +
> +#      github.com/minio/md5-simd v1.1.2
> +# [1] git ls-remote https://github.com/minio/md5-simd
> 776275e0c9a74ceebbd50fe5c1d61b0c80c608df
> +SRCREV_md5-simd=3D"776275e0c9a74ceebbd50fe5c1d61b0c80c608df"
> +SRC_URI +=3D "git://
> github.com/minio/md5-simd;name=3Dmd5-simd;protocol=3Dhttps;nobranch=3D1;d=
estsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/minio/md5-s=
imd
> <http://github.com/minio/md5-simd;name=3Dmd5-simd;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github=
.com/minio/md5-simd>
> "
> +
> +#      github.com/minio/minio-go/v7 v7.0.30
> +# [1] git ls-remote https://github.com/minio/minio-go
> 81c303325bb4426c89776854b2ea4f7936deb11c
> +SRCREV_v7=3D"81c303325bb4426c89776854b2ea4f7936deb11c"
> +SRC_URI +=3D "git://
> github.com/minio/minio-go;name=3Dv7;protocol=3Dhttps;nobranch=3D1;destsuf=
fix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/minio/minio-go/v7
> <http://github.com/minio/minio-go;name=3Dv7;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/m=
inio/minio-go/v7>
> "
> +
> +#      github.com/minio/pkg v1.1.22
> +# [1] git ls-remote https://github.com/minio/pkg
> 3b76bdaec27995a31d0b0a7959bbef55bfe0d364
> +SRCREV_pkg=3D"3b76bdaec27995a31d0b0a7959bbef55bfe0d364"
> +SRC_URI +=3D "git://
> github.com/minio/pkg;name=3Dpkg;protocol=3Dhttps;nobranch=3D1;destsuffix=
=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/minio/pkg
> <http://github.com/minio/pkg;name=3Dpkg;protocol=3Dhttps;nobranch=3D1;des=
tsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/minio=
/pkg>
> "
> +
> +#      github.com/minio/selfupdate v0.4.0
> +# [1] git ls-remote https://github.com/minio/selfupdate
> 9e32fb8d38277355add4fa3983edb0b376d12bb5
> +SRCREV_selfupdate=3D"9e32fb8d38277355add4fa3983edb0b376d12bb5"
> +SRC_URI +=3D "git://
> github.com/minio/selfupdate;name=3Dselfupdate;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/minio=
/selfupdate
> <http://github.com/minio/selfupdate;name=3Dselfupdate;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/gi=
thub.com/minio/selfupdate>
> "
> +
> +#      github.com/minio/sha256-simd v1.0.0
> +# [1] git ls-remote https://github.com/minio/sha256-simd
> 6a57409d8e0fa3ae883aee331b71aaa40d5a7dd9
> +SRCREV_sha256-simd=3D"6a57409d8e0fa3ae883aee331b71aaa40d5a7dd9"
> +SRC_URI +=3D "git://
> github.com/minio/sha256-simd;name=3Dsha256-simd;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/minio=
/sha256-simd
> <http://github.com/minio/sha256-simd;name=3Dsha256-simd;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/=
github.com/minio/sha256-simd>
> "
> +
> +#      github.com/mitchellh/go-homedir v1.1.0
> +# [1] git ls-remote https://github.com/mitchellh/go-homedir
> af06845cf3004701891bf4fdb884bfe4920b3727
> +SRCREV_go-homedir=3D"af06845cf3004701891bf4fdb884bfe4920b3727"
> +SRC_URI +=3D "git://
> github.com/mitchellh/go-homedir;name=3Dgo-homedir;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mit=
chellh/go-homedir
> <http://github.com/mitchellh/go-homedir;name=3Dgo-homedir;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetc=
h/github.com/mitchellh/go-homedir>
> "
> +
> +#      github.com/pkg/xattr v0.4.4
> +# [1] git ls-remote https://github.com/pkg/xattr
> 8725d4ccc0fcef59c8d9f0eaf606b3c6f962467a
> +SRCREV_xattr=3D"8725d4ccc0fcef59c8d9f0eaf606b3c6f962467a"
> +SRC_URI +=3D "git://
> github.com/pkg/xattr;name=3Dxattr;protocol=3Dhttps;nobranch=3D1;destsuffi=
x=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/pkg/xattr
> <http://github.com/pkg/xattr;name=3Dxattr;protocol=3Dhttps;nobranch=3D1;d=
estsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/pkg=
/xattr>
> "
> +
> +#      github.com/posener/complete v1.2.3
> +# [1] git ls-remote https://github.com/posener/complete
> 05b68ffc813dd10c420993cb1cf927b346c057b8
> +SRCREV_complete=3D"05b68ffc813dd10c420993cb1cf927b346c057b8"
> +SRC_URI +=3D "git://
> github.com/posener/complete;name=3Dcomplete;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/posener/c=
omplete
> <http://github.com/posener/complete;name=3Dcomplete;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/gith=
ub.com/posener/complete>
> "
> +
> +#      github.com/prometheus/client_golang v1.12.1
> +# [1] git ls-remote https://github.com/prometheus/client_golang
> 2e1c4818ccfdcf953ce399cadad615ff2bed968c
> +SRCREV_client_golang=3D"2e1c4818ccfdcf953ce399cadad615ff2bed968c"
> +SRC_URI +=3D "git://
> github.com/prometheus/client_golang;name=3Dclient_golang;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.=
com/prometheus/client_golang
> <http://github.com/prometheus/client_golang;name=3Dclient_golang;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vend=
or.fetch/github.com/prometheus/client_golang>
> "
> +
> +#      github.com/prometheus/prom2json v1.3.1
> +# [1] git ls-remote https://github.com/prometheus/prom2json
> ac13972e54feb2f8eafc9a613112cb310f5463dc
> +SRCREV_prom2json=3D"ac13972e54feb2f8eafc9a613112cb310f5463dc"
> +SRC_URI +=3D "git://
> github.com/prometheus/prom2json;name=3Dprom2json;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/prom=
etheus/prom2json
> <http://github.com/prometheus/prom2json;name=3Dprom2json;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch=
/github.com/prometheus/prom2json>
> "
> +
> +#      github.com/rjeczalik/notify v0.9.2
> +# [1] git ls-remote https://github.com/rjeczalik/notify
> 69d839f37b13a8cb7a78366f7633a4071cb43be7
> +SRCREV_notify=3D"69d839f37b13a8cb7a78366f7633a4071cb43be7"
> +SRC_URI +=3D "git://
> github.com/rjeczalik/notify;name=3Dnotify;protocol=3Dhttps;nobranch=3D1;d=
estsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/rjeczalik/n=
otify
> <http://github.com/rjeczalik/notify;name=3Dnotify;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github=
.com/rjeczalik/notify>
> "
> +
> +#      github.com/rs/xid v1.3.0
> +# [1] git ls-remote https://github.com/rs/xid
> efa678f304ab65d6d57eedcb086798381ae22206
> +SRCREV_xid=3D"efa678f304ab65d6d57eedcb086798381ae22206"
> +SRC_URI +=3D "git://
> github.com/rs/xid;name=3Dxid;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$=
{WORKDIR}/${BP}/src/import/vendor.fetch/github.com/rs/xid
> <http://github.com/rs/xid;name=3Dxid;protocol=3Dhttps;nobranch=3D1;destsu=
ffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/rs/xid>
> "
> +
> +#      github.com/secure-io/sio-go v0.3.1
> +# [1] git ls-remote https://github.com/secure-io/sio-go
> a455d2cd8fcacdfe18557d117db15c0629fb7e2c
> +SRCREV_sio-go=3D"a455d2cd8fcacdfe18557d117db15c0629fb7e2c"
> +SRC_URI +=3D "git://
> github.com/secure-io/sio-go;name=3Dsio-go;protocol=3Dhttps;nobranch=3D1;d=
estsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/secure-io/s=
io-go
> <http://github.com/secure-io/sio-go;name=3Dsio-go;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github=
.com/secure-io/sio-go>
> "
> +
> +#      github.com/shirou/gopsutil/v3 v3.21.12
> +# [1] git ls-remote https://github.com/shirou/gopsutil
> 2f8da0a39487ceddf44cebe53a1b563b0b7173cc
> +SRCREV_v3=3D"2f8da0a39487ceddf44cebe53a1b563b0b7173cc"
> +SRC_URI +=3D "git://
> github.com/shirou/gopsutil;name=3Dv3;protocol=3Dhttps;nobranch=3D1;destsu=
ffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/shirou/gopsutil/=
v3
> <http://github.com/shirou/gopsutil;name=3Dv3;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/=
shirou/gopsutil/v3>
> "
> +
> +#      github.com/tidwall/gjson v1.12.1
> +# [1] git ls-remote https://github.com/tidwall/gjson
> db0033701cccc8e2e43b77d03e4f509a48b6b2f2
> +SRCREV_gjson=3D"db0033701cccc8e2e43b77d03e4f509a48b6b2f2"
> +SRC_URI +=3D "git://
> github.com/tidwall/gjson;name=3Dgjson;protocol=3Dhttps;nobranch=3D1;dests=
uffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/tidwall/gjson
> <http://github.com/tidwall/gjson;name=3Dgjson;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.c=
om/tidwall/gjson>
> "
> +
> +#      golang.org/x/crypto v0.0.0-20220525230936-793ad666bf5e
> +# [1] git ls-remote https://go.googlesource.com/crypto
> 793ad666bf5ec61392092b27061be9618e4e219b
> +SRCREV_crypto=3D"793ad666bf5ec61392092b27061be9618e4e219b"
> +SRC_URI +=3D "git://
> go.googlesource.com/crypto;name=3Dcrypto;protocol=3Dhttps;nobranch=3D1;de=
stsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.googlesource.com/cry=
pto
> <http://go.googlesource.com/crypto;name=3Dcrypto;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/go.goog=
lesource.com/crypto>
> "
> +
> +#      golang.org/x/net v0.0.0-20220225172249-27dd8689420f
> +# [1] git ls-remote https://go.googlesource.com/net
> 27dd8689420fcde088514397d015e4fea5174e0e
> +SRCREV_net=3D"27dd8689420fcde088514397d015e4fea5174e0e"
> +SRC_URI +=3D "git://
> go.googlesource.com/net;name=3Dnet;protocol=3Dhttps;nobranch=3D1;destsuff=
ix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.googlesource.com/net
> <http://go.googlesource.com/net;name=3Dnet;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/go.googlesour=
ce.com/net>
> "
> +
> +#      golang.org/x/text v0.3.7
> +# [1] git ls-remote https://go.googlesource.com/text
> 3cd4007149f3f883d229d707172ed356727aae99
> +SRCREV_text=3D"3cd4007149f3f883d229d707172ed356727aae99"
> +SRC_URI +=3D "git://
> go.googlesource.com/text;name=3Dtext;protocol=3Dhttps;nobranch=3D1;destsu=
ffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.googlesource.com/text
> <http://go.googlesource.com/text;name=3Dtext;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/go.googleso=
urce.com/text>
> "
> +
> +#      gopkg.in/check.v1 v1.0.0-20200902074654-038fdea0a05b
> +# [1] git ls-remote https://gopkg.in/check.v1
> 038fdea0a05bc030b0bfda479dc2e08d2220ec74
> +SRCREV_check.v1=3D"038fdea0a05bc030b0bfda479dc2e08d2220ec74"
> +SRC_URI +=3D "git://
> gopkg.in/check.v1;name=3Dcheck.v1;protocol=3Dhttps;nobranch=3D1;destsuffi=
x=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/check.v1
> <http://gopkg.in/check.v1;name=3Dcheck.v1;protocol=3Dhttps;nobranch=3D1;d=
estsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/gopkg.in/check=
.v1>
> "
> +
> +#      gopkg.in/h2non/filetype.v1 v1.0.5
> +# [1] git ls-remote https://gopkg.in/h2non/filetype.v1
> 8f3142c797f0413f00dadaf1bf97dd0b7b1f8d8b
> +SRCREV_filetype.v1=3D"8f3142c797f0413f00dadaf1bf97dd0b7b1f8d8b"
> +SRC_URI +=3D "git://
> gopkg.in/h2non/filetype.v1;name=3Dfiletype.v1;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/h2non/f=
iletype.v1
> <http://gopkg.in/h2non/filetype.v1;name=3Dfiletype.v1;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/go=
pkg.in/h2non/filetype.v1>
> "
> +
> +#      gopkg.in/yaml.v2 v2.4.0
> +# [1] git ls-remote https://gopkg.in/yaml.v2
> 7649d4548cb53a614db133b2a8ac1f31859dda8c
> +SRCREV_yaml.v2=3D"7649d4548cb53a614db133b2a8ac1f31859dda8c"
> +SRC_URI +=3D "git://
> gopkg.in/yaml.v2;name=3Dyaml.v2;protocol=3Dhttps;nobranch=3D1;destsuffix=
=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/yaml.v2
> <http://gopkg.in/yaml.v2;name=3Dyaml.v2;protocol=3Dhttps;nobranch=3D1;des=
tsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/gopkg.in/yaml.v2=
>
> "
> +
> +#      github.com/charmbracelet/bubbles v0.10.0
> +# [1] git ls-remote https://github.com/charmbracelet/bubbles
> 7714089ad7c81898564ebeb7b6876b5844e26ccd
> +SRCREV_bubbles=3D"7714089ad7c81898564ebeb7b6876b5844e26ccd"
> +SRC_URI +=3D "git://
> github.com/charmbracelet/bubbles;name=3Dbubbles;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/charm=
bracelet/bubbles
> <http://github.com/charmbracelet/bubbles;name=3Dbubbles;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/=
github.com/charmbracelet/bubbles>
> "
> +
> +#      github.com/charmbracelet/lipgloss
> v0.4.1-0.20220204041308-bf2912e703f6
> +# [1] git ls-remote https://github.com/charmbracelet/lipgloss
> bf2912e703f6ecf88a1b843472afd47ce5002caf
> +SRCREV_lipgloss=3D"bf2912e703f6ecf88a1b843472afd47ce5002caf"
> +SRC_URI +=3D "git://
> github.com/charmbracelet/lipgloss;name=3Dlipgloss;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/cha=
rmbracelet/lipgloss
> <http://github.com/charmbracelet/lipgloss;name=3Dlipgloss;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetc=
h/github.com/charmbracelet/lipgloss>
> "
> +
> +#      github.com/gdamore/tcell/v2 v2.4.1-0.20210905002822-f057f0a857a1
> +# [1] git ls-remote https://github.com/gdamore/tcell
> f057f0a857a1b3ac3e4fff8c6cfe8126f8387cd1
> +SRCREV_v2=3D"f057f0a857a1b3ac3e4fff8c6cfe8126f8387cd1"
> +SRC_URI +=3D "git://
> github.com/gdamore/tcell;name=3Dv2;protocol=3Dhttps;nobranch=3D1;destsuff=
ix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/gdamore/tcell/v2
> <http://github.com/gdamore/tcell;name=3Dv2;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/gd=
amore/tcell/v2>
> "
> +
> +#      github.com/golang-jwt/jwt/v4 v4.4.1
> +# [1] git ls-remote https://github.com/golang-jwt/jwt
> 0972257eba279bb357882afc11db8218644ad565
> +SRCREV_v4=3D"0972257eba279bb357882afc11db8218644ad565"
> +SRC_URI +=3D "git://
> github.com/golang-jwt/jwt;name=3Dv4;protocol=3Dhttps;nobranch=3D1;destsuf=
fix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/golang-jwt/jwt/v4
> <http://github.com/golang-jwt/jwt;name=3Dv4;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/g=
olang-jwt/jwt/v4>
> "
> +
> +#      github.com/navidys/tvxwidgets v0.1.0
> +# [1] git ls-remote https://github.com/navidys/tvxwidgets
> f017cfd5ce6d4bd7fb22529305d7a438c3f1369d
> +SRCREV_tvxwidgets=3D"f017cfd5ce6d4bd7fb22529305d7a438c3f1369d"
> +SRC_URI +=3D "git://
> github.com/navidys/tvxwidgets;name=3Dtvxwidgets;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/navid=
ys/tvxwidgets
> <http://github.com/navidys/tvxwidgets;name=3Dtvxwidgets;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/=
github.com/navidys/tvxwidgets>
> "
> +
> +#      github.com/olekukonko/tablewriter v0.0.5
> +# [1] git ls-remote https://github.com/olekukonko/tablewriter
> c7d2a8a09b076b70918308a3cd95464b2ae3b5d8
> +SRCREV_tablewriter=3D"c7d2a8a09b076b70918308a3cd95464b2ae3b5d8"
> +SRC_URI +=3D "git://
> github.com/olekukonko/tablewriter;name=3Dtablewriter;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/=
olekukonko/tablewriter
> <http://github.com/olekukonko/tablewriter;name=3Dtablewriter;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.f=
etch/github.com/olekukonko/tablewriter>
> "
> +
> +#      github.com/prometheus/client_model v0.2.0
> +# [1] git ls-remote https://github.com/prometheus/client_model
> f44e7adcba5ee54c8a94709e6fc300d83245f171
> +SRCREV_client_model=3D"f44e7adcba5ee54c8a94709e6fc300d83245f171"
> +SRC_URI +=3D "git://
> github.com/prometheus/client_model;name=3Dclient_model;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.co=
m/prometheus/client_model
> <http://github.com/prometheus/client_model;name=3Dclient_model;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vend=
or.fetch/github.com/prometheus/client_model>
> "
> +
> +#      github.com/rivo/tview v0.0.0-20211202162923-2a6de950f73b
> +# [1] git ls-remote https://github.com/rivo/tview
> 2a6de950f73bdc70658f7e754d4b5593f15c8408
> +SRCREV_tview=3D"2a6de950f73bdc70658f7e754d4b5593f15c8408"
> +SRC_URI +=3D "git://
> github.com/rivo/tview;name=3Dtview;protocol=3Dhttps;nobranch=3D1;destsuff=
ix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/rivo/tview
> <http://github.com/rivo/tview;name=3Dtview;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/ri=
vo/tview>
> "
> +
> +#      github.com/tinylib/msgp v1.1.6
> +# [1] git ls-remote https://github.com/tinylib/msgp
> 205265da651409c54677b486e350b4d105da6d8b
> +SRCREV_msgp=3D"205265da651409c54677b486e350b4d105da6d8b"
> +SRC_URI +=3D "git://
> github.com/tinylib/msgp;name=3Dmsgp;protocol=3Dhttps;nobranch=3D1;destsuf=
fix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/tinylib/msgp
> <http://github.com/tinylib/msgp;name=3Dmsgp;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/t=
inylib/msgp>
> "
> +
> +#      golang.org/x/term v0.0.0-20210927222741-03fcf44c2211
> +# [1] git ls-remote https://go.googlesource.com/term
> 03fcf44c2211dcd5eb77510b5f7c1fb02d6ded50
> +SRCREV_term=3D"03fcf44c2211dcd5eb77510b5f7c1fb02d6ded50"
> +SRC_URI +=3D "git://
> go.googlesource.com/term;name=3Dterm;protocol=3Dhttps;nobranch=3D1;destsu=
ffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.googlesource.com/term
> <http://go.googlesource.com/term;name=3Dterm;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/go.googleso=
urce.com/term>
> "
> +
> +#      github.com/beorn7/perks v1.0.1
> +# [1] git ls-remote https://github.com/beorn7/perks
> c49ff274687222a7373c4cd83578f1065cf3e143
> +SRCREV_perks=3D"c49ff274687222a7373c4cd83578f1065cf3e143"
> +SRC_URI +=3D "git://
> github.com/beorn7/perks;name=3Dperks;protocol=3Dhttps;nobranch=3D1;destsu=
ffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/beorn7/perks
> <http://github.com/beorn7/perks;name=3Dperks;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/=
beorn7/perks>
> "
> +
> +#      github.com/cespare/xxhash/v2 v2.1.2
> +# [1] git ls-remote https://github.com/cespare/xxhash
> 7ae26c41ed6fb1f8a6c21e05eeff4d91b5e401c4
> +SRCREV_v21=3D"7ae26c41ed6fb1f8a6c21e05eeff4d91b5e401c4"
> +SRC_URI +=3D "git://
> github.com/cespare/xxhash;name=3Dv21;protocol=3Dhttps;nobranch=3D1;destsu=
ffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/cespare/xxhash/v=
2
> <http://github.com/cespare/xxhash;name=3Dv21;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/=
cespare/xxhash/v2>
> "
> +
> +#      github.com/containerd/console v1.0.2
> +# [1] git ls-remote https://github.com/containerd/console
> d5efa7d56fd239f7f3dad2ab6685db09359a3618
> +SRCREV_console=3D"d5efa7d56fd239f7f3dad2ab6685db09359a3618"
> +SRC_URI +=3D "git://
> github.com/containerd/console;name=3Dconsole;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containe=
rd/console
> <http://github.com/containerd/console;name=3Dconsole;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/git=
hub.com/containerd/console>
> "
> +
> +#      github.com/coreos/go-semver v0.3.0
> +# [1] git ls-remote https://github.com/coreos/go-semver
> 6e25b691b0ebe9657dd0ee60d73a9f8716f0c6f5
> +SRCREV_go-semver=3D"6e25b691b0ebe9657dd0ee60d73a9f8716f0c6f5"
> +SRC_URI +=3D "git://
> github.com/coreos/go-semver;name=3Dgo-semver;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/coreos/g=
o-semver
> <http://github.com/coreos/go-semver;name=3Dgo-semver;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/git=
hub.com/coreos/go-semver>
> "
> +
> +#      github.com/coreos/go-systemd/v22 v22.3.2
> +# [1] git ls-remote https://github.com/coreos/go-systemd
> 0b40357fd65760243a3eceb80a299772c23c8470
> +SRCREV_v22=3D"0b40357fd65760243a3eceb80a299772c23c8470"
> +SRC_URI +=3D "git://
> github.com/coreos/go-systemd;name=3Dv22;protocol=3Dhttps;nobranch=3D1;des=
tsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/coreos/go-sys=
temd/v22
> <http://github.com/coreos/go-systemd;name=3Dv22;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.c=
om/coreos/go-systemd/v22>
> "
> +
> +#      github.com/decred/dcrd/dcrec/secp256k1/v4 v4.0.1
> +# [1] git ls-remote https://github.com/decred/dcrd
> 75f1b4dac2e43133f3281ac63a9ef9eb699200e5
> +SRCREV_v41=3D"75f1b4dac2e43133f3281ac63a9ef9eb699200e5"
> +SRC_URI +=3D "git://
> github.com/decred/dcrd;name=3Dv41;protocol=3Dhttps;nobranch=3D1;destsuffi=
x=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/decred/dcrd/dcrec/s=
ecp256k1/v4
> <http://github.com/decred/dcrd;name=3Dv41;protocol=3Dhttps;nobranch=3D1;d=
estsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/dec=
red/dcrd/dcrec/secp256k1/v4>
> "
> +
> +#      github.com/fatih/structs v1.1.0
> +# [1] git ls-remote https://github.com/fatih/structs
> 4966fc68f5b7593aafa6cbbba2d65ec6e1416047
> +SRCREV_structs=3D"4966fc68f5b7593aafa6cbbba2d65ec6e1416047"
> +SRC_URI +=3D "git://
> github.com/fatih/structs;name=3Dstructs;protocol=3Dhttps;nobranch=3D1;des=
tsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/fatih/structs
> <http://github.com/fatih/structs;name=3Dstructs;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.c=
om/fatih/structs>
> "
> +
> +#      github.com/gdamore/encoding v1.0.0
> +# [1] git ls-remote https://github.com/gdamore/encoding
> 79c592247a6248468805a0e297f43a7cac979903
> +SRCREV_encoding=3D"79c592247a6248468805a0e297f43a7cac979903"
> +SRC_URI +=3D "git://
> github.com/gdamore/encoding;name=3Dencoding;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/gdamore/e=
ncoding
> <http://github.com/gdamore/encoding;name=3Dencoding;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/gith=
ub.com/gdamore/encoding>
> "
> +
> +#      github.com/gogo/protobuf v1.3.2
> +# [1] git ls-remote https://github.com/gogo/protobuf
> b03c65ea87cdc3521ede29f62fe3ce239267c1bc
> +SRCREV_protobuf=3D"b03c65ea87cdc3521ede29f62fe3ce239267c1bc"
> +SRC_URI +=3D "git://
> github.com/gogo/protobuf;name=3Dprotobuf;protocol=3Dhttps;nobranch=3D1;de=
stsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/gogo/protobu=
f
> <http://github.com/gogo/protobuf;name=3Dprotobuf;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.=
com/gogo/protobuf>
> "
> +
> +#      github.com/golang/protobuf v1.5.2
> +# [1] git ls-remote https://github.com/golang/protobuf
> ae97035608a719c7a1c1c41bed0ae0744bdb0c6f
> +SRCREV_protobuf1=3D"ae97035608a719c7a1c1c41bed0ae0744bdb0c6f"
> +SRC_URI +=3D "git://
> github.com/golang/protobuf;name=3Dprotobuf1;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/golang/pr=
otobuf
> <http://github.com/golang/protobuf;name=3Dprotobuf1;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/gith=
ub.com/golang/protobuf>
> "
> +
> +#      github.com/hashicorp/errwrap v1.1.0
> +# [1] git ls-remote https://github.com/hashicorp/errwrap
> 7b00e5db719c64d14dd0caaacbd13e76254d02c0
> +SRCREV_errwrap=3D"7b00e5db719c64d14dd0caaacbd13e76254d02c0"
> +SRC_URI +=3D "git://
> github.com/hashicorp/errwrap;name=3Derrwrap;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/hashicorp=
/errwrap
> <http://github.com/hashicorp/errwrap;name=3Derrwrap;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/gith=
ub.com/hashicorp/errwrap>
> "
> +
> +#      github.com/hashicorp/go-multierror v1.1.1
> +# [1] git ls-remote https://github.com/hashicorp/go-multierror
> 9974e9ec57696378079ecc3accd3d6f29401b3a0
> +SRCREV_go-multierror=3D"9974e9ec57696378079ecc3accd3d6f29401b3a0"
> +SRC_URI +=3D "git://
> github.com/hashicorp/go-multierror;name=3Dgo-multierror;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/hashicorp/go-multierror
> <http://github.com/hashicorp/go-multierror;name=3Dgo-multierror;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vend=
or.fetch/github.com/hashicorp/go-multierror>
> "
> +
> +#      github.com/klauspost/cpuid/v2 v2.0.9
> +# [1] git ls-remote https://github.com/klauspost/cpuid
> 6903d4066801a7d800d4537ee9eebe81ea97000e
> +SRCREV_v212=3D"6903d4066801a7d800d4537ee9eebe81ea97000e"
> +SRC_URI +=3D "git://
> github.com/klauspost/cpuid;name=3Dv212;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/klauspost/cpui=
d/v2
> <http://github.com/klauspost/cpuid;name=3Dv212;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.c=
om/klauspost/cpuid/v2>
> "
> +
> +#      github.com/kr/text v0.2.0
> +# [1] git ls-remote https://github.com/kr/text
> 0e5f52c28dd72ab84daeb81b5a51f20fdc35f9c5
> +SRCREV_text1=3D"0e5f52c28dd72ab84daeb81b5a51f20fdc35f9c5"
> +SRC_URI +=3D "git://
> github.com/kr/text;name=3Dtext1;protocol=3Dhttps;nobranch=3D1;destsuffix=
=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/kr/text
> <http://github.com/kr/text;name=3Dtext1;protocol=3Dhttps;nobranch=3D1;des=
tsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/kr/te=
xt>
> "
> +
> +#      github.com/lestrrat-go/backoff/v2 v2.0.8
> +# [1] git ls-remote https://github.com/lestrrat-go/backoff
> c3af762cb9d2bc8339e1d5099a4550366a675f60
> +SRCREV_v2123=3D"c3af762cb9d2bc8339e1d5099a4550366a675f60"
> +SRC_URI +=3D "git://
> github.com/lestrrat-go/backoff;name=3Dv2123;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/lestrrat-=
go/backoff/v2
> <http://github.com/lestrrat-go/backoff;name=3Dv2123;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/gith=
ub.com/lestrrat-go/backoff/v2>
> "
> +
> +#      github.com/lestrrat-go/blackmagic v1.0.0
> +# [1] git ls-remote https://github.com/lestrrat-go/blackmagic
> 370527f88bbfd5be3192a38af3148dbd64f0976f
> +SRCREV_blackmagic=3D"370527f88bbfd5be3192a38af3148dbd64f0976f"
> +SRC_URI +=3D "git://
> github.com/lestrrat-go/blackmagic;name=3Dblackmagic;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/l=
estrrat-go/blackmagic
> <http://github.com/lestrrat-go/blackmagic;name=3Dblackmagic;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fe=
tch/github.com/lestrrat-go/blackmagic>
> "
> +
> +#      github.com/lestrrat-go/httpcc v1.0.0
> +# [1] git ls-remote https://github.com/lestrrat-go/httpcc
> e7e8fea419e32f7549252ad15ecf17f3a3c1a268
> +SRCREV_httpcc=3D"e7e8fea419e32f7549252ad15ecf17f3a3c1a268"
> +SRC_URI +=3D "git://
> github.com/lestrrat-go/httpcc;name=3Dhttpcc;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/lestrrat-=
go/httpcc
> <http://github.com/lestrrat-go/httpcc;name=3Dhttpcc;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/gith=
ub.com/lestrrat-go/httpcc>
> "
> +
> +#      github.com/lestrrat-go/iter v1.0.1
> +# [1] git ls-remote https://github.com/lestrrat-go/iter
> 628869e97ee3dcc09033086e547a5cab96b0d708
> +SRCREV_iter=3D"628869e97ee3dcc09033086e547a5cab96b0d708"
> +SRC_URI +=3D "git://
> github.com/lestrrat-go/iter;name=3Diter;protocol=3Dhttps;nobranch=3D1;des=
tsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/lestrrat-go/i=
ter
> <http://github.com/lestrrat-go/iter;name=3Diter;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.c=
om/lestrrat-go/iter>
> "
> +
> +#      github.com/lestrrat-go/jwx v1.2.14
> +# [1] git ls-remote https://github.com/lestrrat-go/jwx
> de7d9bca43812abc4f630320f8632108ccfe34bf
> +SRCREV_jwx=3D"de7d9bca43812abc4f630320f8632108ccfe34bf"
> +SRC_URI +=3D "git://
> github.com/lestrrat-go/jwx;name=3Djwx;protocol=3Dhttps;nobranch=3D1;dests=
uffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/lestrrat-go/jwx
> <http://github.com/lestrrat-go/jwx;name=3Djwx;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.c=
om/lestrrat-go/jwx>
> "
> +
> +#      github.com/lestrrat-go/option v1.0.0
> +# [1] git ls-remote https://github.com/lestrrat-go/option
> 7e3467dce320ff45667b138ae503367c92deaa0b
> +SRCREV_option=3D"7e3467dce320ff45667b138ae503367c92deaa0b"
> +SRC_URI +=3D "git://
> github.com/lestrrat-go/option;name=3Doption;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/lestrrat-=
go/option
> <http://github.com/lestrrat-go/option;name=3Doption;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/gith=
ub.com/lestrrat-go/option>
> "
> +
> +#      github.com/lucasb-eyer/go-colorful v1.2.0
> +# [1] git ls-remote https://github.com/lucasb-eyer/go-colorful
> d2b05a0d83cca9d610425691c3253d5f36d0ad06
> +SRCREV_go-colorful=3D"d2b05a0d83cca9d610425691c3253d5f36d0ad06"
> +SRC_URI +=3D "git://
> github.com/lucasb-eyer/go-colorful;name=3Dgo-colorful;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com=
/lucasb-eyer/go-colorful
> <http://github.com/lucasb-eyer/go-colorful;name=3Dgo-colorful;protocol=3D=
https;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.=
fetch/github.com/lucasb-eyer/go-colorful>
> "
> +
> +#      github.com/lufia/plan9stats v0.0.0-20211012122336-39d0f177ccd0
> +# [1] git ls-remote https://github.com/lufia/plan9stats
> 39d0f177ccd07bdf5eb6f051ab9b09651f05d6f2
> +SRCREV_plan9stats=3D"39d0f177ccd07bdf5eb6f051ab9b09651f05d6f2"
> +SRC_URI +=3D "git://
> github.com/lufia/plan9stats;name=3Dplan9stats;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/lufia=
/plan9stats
> <http://github.com/lufia/plan9stats;name=3Dplan9stats;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/gi=
thub.com/lufia/plan9stats>
> "
> +
> +#      github.com/mattn/go-colorable v0.1.12
> +# [1] git ls-remote https://github.com/mattn/go-colorable
> e1bb79c8d53c38a60962ad4b8f658226cc983710
> +SRCREV_go-colorable=3D"e1bb79c8d53c38a60962ad4b8f658226cc983710"
> +SRC_URI +=3D "git://
> github.com/mattn/go-colorable;name=3Dgo-colorable;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mat=
tn/go-colorable
> <http://github.com/mattn/go-colorable;name=3Dgo-colorable;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetc=
h/github.com/mattn/go-colorable>
> "
> +
> +#      github.com/mattn/go-runewidth v0.0.13
> +# [1] git ls-remote https://github.com/mattn/go-runewidth
> df1ff59654317c1b5a3f860ffc47402931932104
> +SRCREV_go-runewidth=3D"df1ff59654317c1b5a3f860ffc47402931932104"
> +SRC_URI +=3D "git://
> github.com/mattn/go-runewidth;name=3Dgo-runewidth;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mat=
tn/go-runewidth
> <http://github.com/mattn/go-runewidth;name=3Dgo-runewidth;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetc=
h/github.com/mattn/go-runewidth>
> "
> +
> +#      github.com/matttproud/golang_protobuf_extensions v1.0.1
> +# [1] git ls-remote
> https://github.com/matttproud/golang_protobuf_extensions
> c12348ce28de40eed0136aa2b644d0ee0650e56c
>
> +SRCREV_golang_protobuf_extensions=3D"c12348ce28de40eed0136aa2b644d0ee065=
0e56c"
> +SRC_URI +=3D "git://
> github.com/matttproud/golang_protobuf_extensions;name=3Dgolang_protobuf_e=
xtensions;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/i=
mport/vendor.fetch/github.com/matttproud/golang_protobuf_extensions
> <http://github.com/matttproud/golang_protobuf_extensions;name=3Dgolang_pr=
otobuf_extensions;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D=
/$%7BBP%7D/src/import/vendor.fetch/github.com/matttproud/golang_protobuf_ex=
tensions>
> "
> +
> +#      github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1d=
d
> +# [1] git ls-remote https://github.com/modern-go/concurrent
> bacd9c7ef1dd9b15be4a9909b8ac7a4e313eec94
> +SRCREV_concurrent=3D"bacd9c7ef1dd9b15be4a9909b8ac7a4e313eec94"
> +SRC_URI +=3D "git://
> github.com/modern-go/concurrent;name=3Dconcurrent;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mod=
ern-go/concurrent
> <http://github.com/modern-go/concurrent;name=3Dconcurrent;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetc=
h/github.com/modern-go/concurrent>
> "
> +
> +#      github.com/modern-go/reflect2 v1.0.2
> +# [1] git ls-remote https://github.com/modern-go/reflect2
> 2b33151c9bbc5231aea69b8861c540102b087070
> +SRCREV_reflect2=3D"2b33151c9bbc5231aea69b8861c540102b087070"
> +SRC_URI +=3D "git://
> github.com/modern-go/reflect2;name=3Dreflect2;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moder=
n-go/reflect2
> <http://github.com/modern-go/reflect2;name=3Dreflect2;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/gi=
thub.com/modern-go/reflect2>
> "
> +
> +#      github.com/muesli/ansi v0.0.0-20211018074035-2e021307bc4b
> +# [1] git ls-remote https://github.com/muesli/ansi
> 2e021307bc4b4f4766c3fb4faf6030b13dc9ec51
> +SRCREV_ansi=3D"2e021307bc4b4f4766c3fb4faf6030b13dc9ec51"
> +SRC_URI +=3D "git://
> github.com/muesli/ansi;name=3Dansi;protocol=3Dhttps;nobranch=3D1;destsuff=
ix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/muesli/ansi
> <http://github.com/muesli/ansi;name=3Dansi;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/mu=
esli/ansi>
> "
> +
> +#      github.com/muesli/reflow v0.3.0
> +# [1] git ls-remote https://github.com/muesli/reflow
> 602e329532049c9e33fa8c74e352a46fb9486947
> +SRCREV_reflow=3D"602e329532049c9e33fa8c74e352a46fb9486947"
> +SRC_URI +=3D "git://
> github.com/muesli/reflow;name=3Dreflow;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/muesli/reflow
> <http://github.com/muesli/reflow;name=3Dreflow;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.c=
om/muesli/reflow>
> "
> +
> +#      github.com/muesli/termenv v0.11.1-0.20220204035834-5ac8409525e0
> +# [1] git ls-remote https://github.com/muesli/termenv
> 5ac8409525e03ee6cd96daeae32d47902b88f32a
> +SRCREV_termenv=3D"5ac8409525e03ee6cd96daeae32d47902b88f32a"
> +SRC_URI +=3D "git://
> github.com/muesli/termenv;name=3Dtermenv;protocol=3Dhttps;nobranch=3D1;de=
stsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/muesli/terme=
nv
> <http://github.com/muesli/termenv;name=3Dtermenv;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.=
com/muesli/termenv>
> "
> +
> +#      github.com/niemeyer/pretty v0.0.0-20200227124842-a10e7caefd8e
> +# [1] git ls-remote https://github.com/niemeyer/pretty
> a10e7caefd8e0d600cea437f5c3613aeb1553d56
> +SRCREV_pretty=3D"a10e7caefd8e0d600cea437f5c3613aeb1553d56"
> +SRC_URI +=3D "git://
> github.com/niemeyer/pretty;name=3Dpretty;protocol=3Dhttps;nobranch=3D1;de=
stsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/niemeyer/pre=
tty
> <http://github.com/niemeyer/pretty;name=3Dpretty;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.=
com/niemeyer/pretty>
> "
> +
> +#      github.com/philhofer/fwd v1.1.1
> +# [1] git ls-remote https://github.com/philhofer/fwd
> 9bcb9cab1b0394d8516a132ec243ba944efdb644
> +SRCREV_fwd=3D"9bcb9cab1b0394d8516a132ec243ba944efdb644"
> +SRC_URI +=3D "git://
> github.com/philhofer/fwd;name=3Dfwd;protocol=3Dhttps;nobranch=3D1;destsuf=
fix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/philhofer/fwd
> <http://github.com/philhofer/fwd;name=3Dfwd;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/p=
hilhofer/fwd>
> "
> +
> +#      github.com/pkg/errors v0.9.1
> +# [1] git ls-remote https://github.com/pkg/errors
> 614d223910a179a466c1767a985424175c39b465
> +SRCREV_errors=3D"614d223910a179a466c1767a985424175c39b465"
> +SRC_URI +=3D "git://
> github.com/pkg/errors;name=3Derrors;protocol=3Dhttps;nobranch=3D1;destsuf=
fix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/pkg/errors
> <http://github.com/pkg/errors;name=3Derrors;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/p=
kg/errors>
> "
> +
> +#      github.com/power-devops/perfstat
> v0.0.0-20210106213030-5aafc221ea8c
> +# [1] git ls-remote https://github.com/power-devops/perfstat
> 5aafc221ea8c1ff54b0835cbd5f2386a8410be11
> +SRCREV_perfstat=3D"5aafc221ea8c1ff54b0835cbd5f2386a8410be11"
> +SRC_URI +=3D "git://
> github.com/power-devops/perfstat;name=3Dperfstat;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/powe=
r-devops/perfstat
> <http://github.com/power-devops/perfstat;name=3Dperfstat;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch=
/github.com/power-devops/perfstat>
> "
> +
> +#      github.com/prometheus/common v0.33.0
> +# [1] git ls-remote https://github.com/prometheus/common
> 63e75f51cd2368130efbd51b95a4e457e64b444e
> +SRCREV_common=3D"63e75f51cd2368130efbd51b95a4e457e64b444e"
> +SRC_URI +=3D "git://
> github.com/prometheus/common;name=3Dcommon;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/prometheus=
/common
> <http://github.com/prometheus/common;name=3Dcommon;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/githu=
b.com/prometheus/common>
> "
> +
> +#      github.com/prometheus/procfs v0.7.3
> +# [1] git ls-remote https://github.com/prometheus/procfs
> f436cbb89ece38bf080d446b3ca27053b305eaac
> +SRCREV_procfs=3D"f436cbb89ece38bf080d446b3ca27053b305eaac"
> +SRC_URI +=3D "git://
> github.com/prometheus/procfs;name=3Dprocfs;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/prometheus=
/procfs
> <http://github.com/prometheus/procfs;name=3Dprocfs;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/githu=
b.com/prometheus/procfs>
> "
> +
> +#      github.com/rivo/uniseg v0.2.0
> +# [1] git ls-remote https://github.com/rivo/uniseg
> 75711fccf6a3e85bc74c241e2dddd06a9bc9e53d
> +SRCREV_uniseg=3D"75711fccf6a3e85bc74c241e2dddd06a9bc9e53d"
> +SRC_URI +=3D "git://
> github.com/rivo/uniseg;name=3Duniseg;protocol=3Dhttps;nobranch=3D1;destsu=
ffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/rivo/uniseg
> <http://github.com/rivo/uniseg;name=3Duniseg;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/=
rivo/uniseg>
> "
> +
> +#      github.com/sirupsen/logrus v1.8.1
> +# [1] git ls-remote https://github.com/sirupsen/logrus
> bdc0db8ead3853c56b7cd1ac2ba4e11b47d7da6b
> +SRCREV_logrus=3D"bdc0db8ead3853c56b7cd1ac2ba4e11b47d7da6b"
> +SRC_URI +=3D "git://
> github.com/sirupsen/logrus;name=3Dlogrus;protocol=3Dhttps;nobranch=3D1;de=
stsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/sirupsen/log=
rus
> <http://github.com/sirupsen/logrus;name=3Dlogrus;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.=
com/sirupsen/logrus>
> "
> +
> +#      github.com/tidwall/match v1.1.1
> +# [1] git ls-remote https://github.com/tidwall/match
> 4c9fc61b493b7aa0a3d347e9190aa78c5bec09cf
> +SRCREV_match=3D"4c9fc61b493b7aa0a3d347e9190aa78c5bec09cf"
> +SRC_URI +=3D "git://
> github.com/tidwall/match;name=3Dmatch;protocol=3Dhttps;nobranch=3D1;dests=
uffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/tidwall/match
> <http://github.com/tidwall/match;name=3Dmatch;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.c=
om/tidwall/match>
> "
> +
> +#      github.com/tidwall/pretty v1.2.0
> +# [1] git ls-remote https://github.com/tidwall/pretty
> aaa765e7476acb0028a854b85675801362cbdaa2
> +SRCREV_pretty1=3D"aaa765e7476acb0028a854b85675801362cbdaa2"
> +SRC_URI +=3D "git://
> github.com/tidwall/pretty;name=3Dpretty1;protocol=3Dhttps;nobranch=3D1;de=
stsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/tidwall/pret=
ty
> <http://github.com/tidwall/pretty;name=3Dpretty1;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.=
com/tidwall/pretty>
> "
> +
> +#      github.com/tklauser/go-sysconf v0.3.9
> +# [1] git ls-remote https://github.com/tklauser/go-sysconf
> 746b19d14e19d242c2daa08e0d645c19832c1939
> +SRCREV_go-sysconf=3D"746b19d14e19d242c2daa08e0d645c19832c1939"
> +SRC_URI +=3D "git://
> github.com/tklauser/go-sysconf;name=3Dgo-sysconf;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/tkla=
user/go-sysconf
> <http://github.com/tklauser/go-sysconf;name=3Dgo-sysconf;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch=
/github.com/tklauser/go-sysconf>
> "
> +
> +#      github.com/tklauser/numcpus v0.3.0
> +# [1] git ls-remote https://github.com/tklauser/numcpus
> cc3fdd5f3955d53d50d94380963bddd24bd373e2
> +SRCREV_numcpus=3D"cc3fdd5f3955d53d50d94380963bddd24bd373e2"
> +SRC_URI +=3D "git://
> github.com/tklauser/numcpus;name=3Dnumcpus;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/tklauser/n=
umcpus
> <http://github.com/tklauser/numcpus;name=3Dnumcpus;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/githu=
b.com/tklauser/numcpus>
> "
> +
> +#      github.com/yusufpapurcu/wmi v1.2.2
> +# [1] git ls-remote https://github.com/yusufpapurcu/wmi
> 253c5f0cb35e666c4c0fc42083824e7c89f0cc8d
> +SRCREV_wmi=3D"253c5f0cb35e666c4c0fc42083824e7c89f0cc8d"
> +SRC_URI +=3D "git://
> github.com/yusufpapurcu/wmi;name=3Dwmi;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/yusufpapurcu/w=
mi
> <http://github.com/yusufpapurcu/wmi;name=3Dwmi;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.c=
om/yusufpapurcu/wmi>
> "
> +
> +#      go.etcd.io/etcd/api/v3 v3.5.2
> +# [1] git ls-remote https://github.com/etcd-io/etcd
> 4591a096d4d3c08e577d7269851938db0c1da3d4
> +SRCREV_v31=3D"4591a096d4d3c08e577d7269851938db0c1da3d4"
> +SRC_URI +=3D "git://
> github.com/etcd-io/etcd;name=3Dv31;protocol=3Dhttps;nobranch=3D1;destsuff=
ix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/etcd-io/etcd/api/v=
3
> <http://github.com/etcd-io/etcd;name=3Dv31;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/et=
cd-io/etcd/api/v3>
> "
> +
> +#      go.uber.org/atomic v1.9.0
> +# [1] git ls-remote https://github.com/uber-go/atomic
> 135466e2d0c8f8adf4d37dc757e3df0ebdd0dfe8
> +SRCREV_atomic=3D"135466e2d0c8f8adf4d37dc757e3df0ebdd0dfe8"
> +SRC_URI +=3D "git://
> github.com/uber-go/atomic;name=3Datomic;protocol=3Dhttps;nobranch=3D1;des=
tsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.uber.org/atomic
> <http://github.com/uber-go/atomic;name=3Datomic;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/go.uber.=
org/atomic>
> "
> +
> +#      go.uber.org/multierr v1.7.0
> +# [1] git ls-remote https://github.com/uber-go/multierr
> 19d9fff1d3b66750a134671435786579bc994737
> +SRCREV_multierr=3D"19d9fff1d3b66750a134671435786579bc994737"
> +SRC_URI +=3D "git://
> github.com/uber-go/multierr;name=3Dmultierr;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.uber.org/multierr
> <http://github.com/uber-go/multierr;name=3Dmultierr;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/go.u=
ber.org/multierr>
> "
> +
> +#      go.uber.org/zap v1.19.1
> +# [1] git ls-remote https://github.com/uber-go/zap
> 2f61e97148e69cd2dd1902b03e89ce07cd1218a1
> +SRCREV_zap=3D"2f61e97148e69cd2dd1902b03e89ce07cd1218a1"
> +SRC_URI +=3D "git://
> github.com/uber-go/zap;name=3Dzap;protocol=3Dhttps;nobranch=3D1;destsuffi=
x=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.uber.org/zap
> <http://github.com/uber-go/zap;name=3Dzap;protocol=3Dhttps;nobranch=3D1;d=
estsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/go.uber.org/za=
p>
> "
> +
> +#      golang.org/x/sync v0.0.0-20210220032951-036812b2e83c
> +# [1] git ls-remote https://go.googlesource.com/sync
> 036812b2e83c0ddf193dd5a34e034151da389d09
> +SRCREV_sync=3D"036812b2e83c0ddf193dd5a34e034151da389d09"
> +SRC_URI +=3D "git://
> go.googlesource.com/sync;name=3Dsync;protocol=3Dhttps;nobranch=3D1;destsu=
ffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.googlesource.com/sync
> <http://go.googlesource.com/sync;name=3Dsync;protocol=3Dhttps;nobranch=3D=
1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/go.googleso=
urce.com/sync>
> "
> +
> +#      golang.org/x/sys v0.0.0-20220412211240-33da011f77ad
> +# [1] git ls-remote https://go.googlesource.com/sys
> 33da011f77ade50ff5b6a6fb4a9a1e6d6b285809
> +SRCREV_sys=3D"33da011f77ade50ff5b6a6fb4a9a1e6d6b285809"
> +SRC_URI +=3D "git://
> go.googlesource.com/sys;name=3Dsys;protocol=3Dhttps;nobranch=3D1;destsuff=
ix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.googlesource.com/sys
> <http://go.googlesource.com/sys;name=3Dsys;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/go.googlesour=
ce.com/sys>
> "
> +
> +#      google.golang.org/genproto v0.0.0-20211223182754-3ac035c7e7cb
> +# [1] git ls-remote https://github.com/googleapis/go-genproto
> 3ac035c7e7cbd86eb6d8b95be888cf83d73dedd3
> +SRCREV_genproto=3D"3ac035c7e7cbd86eb6d8b95be888cf83d73dedd3"
> +SRC_URI +=3D "git://
> github.com/googleapis/go-genproto;name=3Dgenproto;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/google.golang.=
org/genproto
> <http://github.com/googleapis/go-genproto;name=3Dgenproto;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetc=
h/google.golang.org/genproto>
> "
> +
> +#      google.golang.org/grpc v1.43.0
> +# [1] git ls-remote https://github.com/grpc/grpc-go
> 14c11384b76b67f7b1b32a5d18f865762634c0ae
> +SRCREV_grpc=3D"14c11384b76b67f7b1b32a5d18f865762634c0ae"
> +SRC_URI +=3D "git://
> github.com/grpc/grpc-go;name=3Dgrpc;protocol=3Dhttps;nobranch=3D1;destsuf=
fix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/google.golang.org/grpc
> <http://github.com/grpc/grpc-go;name=3Dgrpc;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/google.golan=
g.org/grpc>
> "
> +
> +#      google.golang.org/protobuf v1.27.1
> +# [1] git ls-remote https://github.com/protocolbuffers/protobuf-go
> b92717ecb630d4a4824b372bf98c729d87311a4d
> +SRCREV_protobuf12=3D"b92717ecb630d4a4824b372bf98c729d87311a4d"
> +SRC_URI +=3D "git://
> github.com/protocolbuffers/protobuf-go;name=3Dprotobuf12;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/google.=
golang.org/protobuf
> <http://github.com/protocolbuffers/protobuf-go;name=3Dprotobuf12;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vend=
or.fetch/google.golang.org/protobuf>
> "
> +
> +#      gopkg.in/ini.v1 v1.66.3
> +# [1] git ls-remote https://gopkg.in/ini.v1
> fcd6cc399e588727c1231f4ea187d1b963536bcc
> +SRCREV_ini.v1=3D"fcd6cc399e588727c1231f4ea187d1b963536bcc"
> +SRC_URI +=3D "git://
> gopkg.in/ini.v1;name=3Dini.v1;protocol=3Dhttps;nobranch=3D1;destsuffix=3D=
${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/ini.v1
> <http://gopkg.in/ini.v1;name=3Dini.v1;protocol=3Dhttps;nobranch=3D1;dests=
uffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/gopkg.in/ini.v1>
> "
> +
> +#      gopkg.in/yaml.v3 v3.0.1
> +# [1] git ls-remote https://gopkg.in/yaml.v3
> f6f7691b1fdeb513f56608cd2c32c51f8194bf51
> +SRCREV_yaml.v3=3D"f6f7691b1fdeb513f56608cd2c32c51f8194bf51"
> +SRC_URI +=3D "git://
> gopkg.in/yaml.v3;name=3Dyaml.v3;protocol=3Dhttps;nobranch=3D1;destsuffix=
=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/yaml.v3
> <http://gopkg.in/yaml.v3;name=3Dyaml.v3;protocol=3Dhttps;nobranch=3D1;des=
tsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/gopkg.in/yaml.v3=
>
> "
> --
> 2.33.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99423):
> https://lists.openembedded.org/g/openembedded-devel/message/99423
> Mute This Topic: https://lists.openembedded.org/mt/94744076/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b35af905fcbd8e4c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>the go upgrade to 1.20.4 in</div=
><div><a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=
=3De043bfb42156c59c93c6a4816528a63cfdaccc3e">https://git.openembedded.org/o=
penembedded-core/commit/?id=3De043bfb42156c59c93c6a4816528a63cfdaccc3e</a><=
br></div><div>broke minio package_qa:</div><div>ERROR: QA Issue: minio: ELF=
 binary /usr/sbin/mc has relocations in .text [textrel]<br></div><div><br><=
/div><div>I don&#39;t use minio, I&#39;ve just noticed it as new issue in m=
y world builds, I didn&#39;t look much deeper than confirming that revertin=
g go upgrade fixes this textrel.</div><div><br></div><div>Regards,</div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Wed, Nov 2, 2022 at 10:18=E2=80=AFPM Sakib Sajal &lt;<a href=3D"mailto:saki=
b.sajal@windriver.com">sakib.sajal@windriver.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">MinIO Client (mc) provides =
a modern alternative to UNIX commands like<br>
ls, cat, cp, mirror, diff, find etc. It supports filesystems and Amazon<br>
S3 compatible cloud storage service (AWS Signature v2 and v4).<br>
<br>
Signed-off-by: Sakib Sajal &lt;<a href=3D"mailto:sakib.sajal@windriver.com"=
 target=3D"_blank">sakib.sajal@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-extended/minio/minio/modules.txt=C2=A0 | 208 +++++++<br>
=C2=A0meta-oe/recipes-extended/minio/<a href=3D"http://minio_git.bb" rel=3D=
"noreferrer" target=3D"_blank">minio_git.bb</a>=C2=A0 =C2=A0| 160 ++++++<br=
>
=C2=A0meta-oe/recipes-extended/minio/src_uri.inc=C2=A0 =C2=A0 | 509 +++++++=
+++++++++++<br>
=C2=A03 files changed, 877 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-extended/minio/minio/modules.txt<b=
r>
=C2=A0create mode 100644 meta-oe/recipes-extended/minio/<a href=3D"http://m=
inio_git.bb" rel=3D"noreferrer" target=3D"_blank">minio_git.bb</a><br>
=C2=A0create mode 100644 meta-oe/recipes-extended/minio/src_uri.inc<br>
<br>
diff --git a/meta-oe/recipes-extended/minio/minio/modules.txt b/meta-oe/rec=
ipes-extended/minio/minio/modules.txt<br>
new file mode 100644<br>
index 000000000..fbd01e51a<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-extended/minio/minio/modules.txt<br>
@@ -0,0 +1,208 @@<br>
+# <a href=3D"http://github.com/charmbracelet/bubbletea" rel=3D"noreferrer"=
 target=3D"_blank">github.com/charmbracelet/bubbletea</a> v0.19.3<br>
+## explicit<br>
+# <a href=3D"http://github.com/cheggaaa/pb" rel=3D"noreferrer" target=3D"_=
blank">github.com/cheggaaa/pb</a> v1.0.29<br>
+## explicit<br>
+# <a href=3D"http://github.com/dustin/go-humanize" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/dustin/go-humanize</a> v1.0.0<br>
+## explicit<br>
+# <a href=3D"http://github.com/fatih/color" rel=3D"noreferrer" target=3D"_=
blank">github.com/fatih/color</a> v1.13.0<br>
+## explicit<br>
+# <a href=3D"http://github.com/go-ole/go-ole" rel=3D"noreferrer" target=3D=
"_blank">github.com/go-ole/go-ole</a> v1.2.6<br>
+## explicit<br>
+# <a href=3D"http://github.com/goccy/go-json" rel=3D"noreferrer" target=3D=
"_blank">github.com/goccy/go-json</a> v0.8.1<br>
+## explicit<br>
+# <a href=3D"http://github.com/google/shlex" rel=3D"noreferrer" target=3D"=
_blank">github.com/google/shlex</a> v0.0.0-20191202100458-e7afc7fbc510<br>
+## explicit<br>
+# <a href=3D"http://github.com/google/uuid" rel=3D"noreferrer" target=3D"_=
blank">github.com/google/uuid</a> v1.3.0<br>
+## explicit<br>
+# <a href=3D"http://github.com/inconshreveable/mousetrap" rel=3D"noreferre=
r" target=3D"_blank">github.com/inconshreveable/mousetrap</a> v1.0.0<br>
+## explicit<br>
+# <a href=3D"http://github.com/json-iterator/go" rel=3D"noreferrer" target=
=3D"_blank">github.com/json-iterator/go</a> v1.1.12<br>
+## explicit<br>
+# <a href=3D"http://github.com/klauspost/compress" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/klauspost/compress</a> v1.13.6<br>
+## explicit<br>
+# <a href=3D"http://github.com/mattn/go-ieproxy" rel=3D"noreferrer" target=
=3D"_blank">github.com/mattn/go-ieproxy</a> v0.0.1<br>
+## explicit<br>
+# <a href=3D"http://github.com/mattn/go-isatty" rel=3D"noreferrer" target=
=3D"_blank">github.com/mattn/go-isatty</a> v0.0.14<br>
+## explicit<br>
+# <a href=3D"http://github.com/minio/cli" rel=3D"noreferrer" target=3D"_bl=
ank">github.com/minio/cli</a> v1.22.0<br>
+## explicit<br>
+# <a href=3D"http://github.com/minio/colorjson" rel=3D"noreferrer" target=
=3D"_blank">github.com/minio/colorjson</a> v1.0.2<br>
+## explicit<br>
+# <a href=3D"http://github.com/minio/filepath" rel=3D"noreferrer" target=
=3D"_blank">github.com/minio/filepath</a> v1.0.0<br>
+## explicit<br>
+# <a href=3D"http://github.com/minio/madmin-go" rel=3D"noreferrer" target=
=3D"_blank">github.com/minio/madmin-go</a> v1.4.3<br>
+## explicit<br>
+# <a href=3D"http://github.com/minio/md5-simd" rel=3D"noreferrer" target=
=3D"_blank">github.com/minio/md5-simd</a> v1.1.2<br>
+## explicit<br>
+# <a href=3D"http://github.com/minio/minio-go/v7" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/minio/minio-go/v7</a> v7.0.30<br>
+## explicit<br>
+# <a href=3D"http://github.com/minio/pkg" rel=3D"noreferrer" target=3D"_bl=
ank">github.com/minio/pkg</a> v1.1.22<br>
+## explicit<br>
+# <a href=3D"http://github.com/minio/selfupdate" rel=3D"noreferrer" target=
=3D"_blank">github.com/minio/selfupdate</a> v0.4.0<br>
+## explicit<br>
+# <a href=3D"http://github.com/minio/sha256-simd" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/minio/sha256-simd</a> v1.0.0<br>
+## explicit<br>
+# <a href=3D"http://github.com/mitchellh/go-homedir" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/mitchellh/go-homedir</a> v1.1.0<br>
+## explicit<br>
+# <a href=3D"http://github.com/pkg/xattr" rel=3D"noreferrer" target=3D"_bl=
ank">github.com/pkg/xattr</a> v0.4.4<br>
+## explicit<br>
+# <a href=3D"http://github.com/posener/complete" rel=3D"noreferrer" target=
=3D"_blank">github.com/posener/complete</a> v1.2.3<br>
+## explicit<br>
+# <a href=3D"http://github.com/prometheus/client_golang" rel=3D"noreferrer=
" target=3D"_blank">github.com/prometheus/client_golang</a> v1.12.1<br>
+## explicit<br>
+# <a href=3D"http://github.com/prometheus/prom2json" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/prometheus/prom2json</a> v1.3.1<br>
+## explicit<br>
+# <a href=3D"http://github.com/rjeczalik/notify" rel=3D"noreferrer" target=
=3D"_blank">github.com/rjeczalik/notify</a> v0.9.2<br>
+## explicit<br>
+# <a href=3D"http://github.com/rs/xid" rel=3D"noreferrer" target=3D"_blank=
">github.com/rs/xid</a> v1.3.0<br>
+## explicit<br>
+# <a href=3D"http://github.com/secure-io/sio-go" rel=3D"noreferrer" target=
=3D"_blank">github.com/secure-io/sio-go</a> v0.3.1<br>
+## explicit<br>
+# <a href=3D"http://github.com/shirou/gopsutil/v3" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/shirou/gopsutil/v3</a> v3.21.12<br>
+## explicit<br>
+# <a href=3D"http://github.com/tidwall/gjson" rel=3D"noreferrer" target=3D=
"_blank">github.com/tidwall/gjson</a> v1.12.1<br>
+## explicit<br>
+# <a href=3D"http://golang.org/x/crypto" rel=3D"noreferrer" target=3D"_bla=
nk">golang.org/x/crypto</a> v0.0.0-20220525230936-793ad666bf5e<br>
+## explicit<br>
+# <a href=3D"http://golang.org/x/net" rel=3D"noreferrer" target=3D"_blank"=
>golang.org/x/net</a> v0.0.0-20220225172249-27dd8689420f<br>
+## explicit<br>
+# <a href=3D"http://golang.org/x/text" rel=3D"noreferrer" target=3D"_blank=
">golang.org/x/text</a> v0.3.7<br>
+## explicit<br>
+# <a href=3D"http://gopkg.in/check.v1" rel=3D"noreferrer" target=3D"_blank=
">gopkg.in/check.v1</a> v1.0.0-20200902074654-038fdea0a05b<br>
+## explicit<br>
+# <a href=3D"http://gopkg.in/h2non/filetype.v1" rel=3D"noreferrer" target=
=3D"_blank">gopkg.in/h2non/filetype.v1</a> v1.0.5<br>
+## explicit<br>
+# <a href=3D"http://gopkg.in/yaml.v2" rel=3D"noreferrer" target=3D"_blank"=
>gopkg.in/yaml.v2</a> v2.4.0<br>
+## explicit<br>
+# <a href=3D"http://github.com/charmbracelet/bubbles" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/charmbracelet/bubbles</a> v0.10.0<br>
+## explicit<br>
+# <a href=3D"http://github.com/charmbracelet/lipgloss" rel=3D"noreferrer" =
target=3D"_blank">github.com/charmbracelet/lipgloss</a> v0.4.1-0.2022020404=
1308-bf2912e703f6<br>
+## explicit<br>
+# <a href=3D"http://github.com/gdamore/tcell/v2" rel=3D"noreferrer" target=
=3D"_blank">github.com/gdamore/tcell/v2</a> v2.4.1-0.20210905002822-f057f0a=
857a1<br>
+## explicit<br>
+# <a href=3D"http://github.com/golang-jwt/jwt/v4" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/golang-jwt/jwt/v4</a> v4.4.1<br>
+## explicit<br>
+# <a href=3D"http://github.com/navidys/tvxwidgets" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/navidys/tvxwidgets</a> v0.1.0<br>
+## explicit<br>
+# <a href=3D"http://github.com/olekukonko/tablewriter" rel=3D"noreferrer" =
target=3D"_blank">github.com/olekukonko/tablewriter</a> v0.0.5<br>
+## explicit<br>
+# <a href=3D"http://github.com/prometheus/client_model" rel=3D"noreferrer"=
 target=3D"_blank">github.com/prometheus/client_model</a> v0.2.0<br>
+## explicit<br>
+# <a href=3D"http://github.com/rivo/tview" rel=3D"noreferrer" target=3D"_b=
lank">github.com/rivo/tview</a> v0.0.0-20211202162923-2a6de950f73b<br>
+## explicit<br>
+# <a href=3D"http://github.com/tinylib/msgp" rel=3D"noreferrer" target=3D"=
_blank">github.com/tinylib/msgp</a> v1.1.6<br>
+## explicit<br>
+# <a href=3D"http://golang.org/x/term" rel=3D"noreferrer" target=3D"_blank=
">golang.org/x/term</a> v0.0.0-20210927222741-03fcf44c2211<br>
+## explicit<br>
+# <a href=3D"http://github.com/beorn7/perks" rel=3D"noreferrer" target=3D"=
_blank">github.com/beorn7/perks</a> v1.0.1<br>
+## explicit<br>
+# <a href=3D"http://github.com/cespare/xxhash/v2" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/cespare/xxhash/v2</a> v2.1.2<br>
+## explicit<br>
+# <a href=3D"http://github.com/containerd/console" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/containerd/console</a> v1.0.2<br>
+## explicit<br>
+# <a href=3D"http://github.com/coreos/go-semver" rel=3D"noreferrer" target=
=3D"_blank">github.com/coreos/go-semver</a> v0.3.0<br>
+## explicit<br>
+# <a href=3D"http://github.com/coreos/go-systemd/v22" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/coreos/go-systemd/v22</a> v22.3.2<br>
+## explicit<br>
+# <a href=3D"http://github.com/decred/dcrd/dcrec/secp256k1/v4" rel=3D"nore=
ferrer" target=3D"_blank">github.com/decred/dcrd/dcrec/secp256k1/v4</a> v4.=
0.1<br>
+## explicit<br>
+# <a href=3D"http://github.com/fatih/structs" rel=3D"noreferrer" target=3D=
"_blank">github.com/fatih/structs</a> v1.1.0<br>
+## explicit<br>
+# <a href=3D"http://github.com/gdamore/encoding" rel=3D"noreferrer" target=
=3D"_blank">github.com/gdamore/encoding</a> v1.0.0<br>
+## explicit<br>
+# <a href=3D"http://github.com/gogo/protobuf" rel=3D"noreferrer" target=3D=
"_blank">github.com/gogo/protobuf</a> v1.3.2<br>
+## explicit<br>
+# <a href=3D"http://github.com/golang/protobuf" rel=3D"noreferrer" target=
=3D"_blank">github.com/golang/protobuf</a> v1.5.2<br>
+## explicit<br>
+# <a href=3D"http://github.com/hashicorp/errwrap" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/hashicorp/errwrap</a> v1.1.0<br>
+## explicit<br>
+# <a href=3D"http://github.com/hashicorp/go-multierror" rel=3D"noreferrer"=
 target=3D"_blank">github.com/hashicorp/go-multierror</a> v1.1.1<br>
+## explicit<br>
+# <a href=3D"http://github.com/klauspost/cpuid/v2" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/klauspost/cpuid/v2</a> v2.0.9<br>
+## explicit<br>
+# <a href=3D"http://github.com/kr/text" rel=3D"noreferrer" target=3D"_blan=
k">github.com/kr/text</a> v0.2.0<br>
+## explicit<br>
+# <a href=3D"http://github.com/lestrrat-go/backoff/v2" rel=3D"noreferrer" =
target=3D"_blank">github.com/lestrrat-go/backoff/v2</a> v2.0.8<br>
+## explicit<br>
+# <a href=3D"http://github.com/lestrrat-go/blackmagic" rel=3D"noreferrer" =
target=3D"_blank">github.com/lestrrat-go/blackmagic</a> v1.0.0<br>
+## explicit<br>
+# <a href=3D"http://github.com/lestrrat-go/httpcc" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/lestrrat-go/httpcc</a> v1.0.0<br>
+## explicit<br>
+# <a href=3D"http://github.com/lestrrat-go/iter" rel=3D"noreferrer" target=
=3D"_blank">github.com/lestrrat-go/iter</a> v1.0.1<br>
+## explicit<br>
+# <a href=3D"http://github.com/lestrrat-go/jwx" rel=3D"noreferrer" target=
=3D"_blank">github.com/lestrrat-go/jwx</a> v1.2.14<br>
+## explicit<br>
+# <a href=3D"http://github.com/lestrrat-go/option" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/lestrrat-go/option</a> v1.0.0<br>
+## explicit<br>
+# <a href=3D"http://github.com/lucasb-eyer/go-colorful" rel=3D"noreferrer"=
 target=3D"_blank">github.com/lucasb-eyer/go-colorful</a> v1.2.0<br>
+## explicit<br>
+# <a href=3D"http://github.com/lufia/plan9stats" rel=3D"noreferrer" target=
=3D"_blank">github.com/lufia/plan9stats</a> v0.0.0-20211012122336-39d0f177c=
cd0<br>
+## explicit<br>
+# <a href=3D"http://github.com/mattn/go-colorable" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/mattn/go-colorable</a> v0.1.12<br>
+## explicit<br>
+# <a href=3D"http://github.com/mattn/go-runewidth" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/mattn/go-runewidth</a> v0.0.13<br>
+## explicit<br>
+# <a href=3D"http://github.com/matttproud/golang_protobuf_extensions" rel=
=3D"noreferrer" target=3D"_blank">github.com/matttproud/golang_protobuf_ext=
ensions</a> v1.0.1<br>
+## explicit<br>
+# <a href=3D"http://github.com/modern-go/concurrent" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/modern-go/concurrent</a> v0.0.0-20180306012644-b=
acd9c7ef1dd<br>
+## explicit<br>
+# <a href=3D"http://github.com/modern-go/reflect2" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/modern-go/reflect2</a> v1.0.2<br>
+## explicit<br>
+# <a href=3D"http://github.com/muesli/ansi" rel=3D"noreferrer" target=3D"_=
blank">github.com/muesli/ansi</a> v0.0.0-20211018074035-2e021307bc4b<br>
+## explicit<br>
+# <a href=3D"http://github.com/muesli/reflow" rel=3D"noreferrer" target=3D=
"_blank">github.com/muesli/reflow</a> v0.3.0<br>
+## explicit<br>
+# <a href=3D"http://github.com/muesli/termenv" rel=3D"noreferrer" target=
=3D"_blank">github.com/muesli/termenv</a> v0.11.1-0.20220204035834-5ac84095=
25e0<br>
+## explicit<br>
+# <a href=3D"http://github.com/niemeyer/pretty" rel=3D"noreferrer" target=
=3D"_blank">github.com/niemeyer/pretty</a> v0.0.0-20200227124842-a10e7caefd=
8e<br>
+## explicit<br>
+# <a href=3D"http://github.com/philhofer/fwd" rel=3D"noreferrer" target=3D=
"_blank">github.com/philhofer/fwd</a> v1.1.1<br>
+## explicit<br>
+# <a href=3D"http://github.com/pkg/errors" rel=3D"noreferrer" target=3D"_b=
lank">github.com/pkg/errors</a> v0.9.1<br>
+## explicit<br>
+# <a href=3D"http://github.com/power-devops/perfstat" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/power-devops/perfstat</a> v0.0.0-20210106213030=
-5aafc221ea8c<br>
+## explicit<br>
+# <a href=3D"http://github.com/prometheus/common" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/prometheus/common</a> v0.33.0<br>
+## explicit<br>
+# <a href=3D"http://github.com/prometheus/procfs" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/prometheus/procfs</a> v0.7.3<br>
+## explicit<br>
+# <a href=3D"http://github.com/rivo/uniseg" rel=3D"noreferrer" target=3D"_=
blank">github.com/rivo/uniseg</a> v0.2.0<br>
+## explicit<br>
+# <a href=3D"http://github.com/sirupsen/logrus" rel=3D"noreferrer" target=
=3D"_blank">github.com/sirupsen/logrus</a> v1.8.1<br>
+## explicit<br>
+# <a href=3D"http://github.com/tidwall/match" rel=3D"noreferrer" target=3D=
"_blank">github.com/tidwall/match</a> v1.1.1<br>
+## explicit<br>
+# <a href=3D"http://github.com/tidwall/pretty" rel=3D"noreferrer" target=
=3D"_blank">github.com/tidwall/pretty</a> v1.2.0<br>
+## explicit<br>
+# <a href=3D"http://github.com/tklauser/go-sysconf" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/tklauser/go-sysconf</a> v0.3.9<br>
+## explicit<br>
+# <a href=3D"http://github.com/tklauser/numcpus" rel=3D"noreferrer" target=
=3D"_blank">github.com/tklauser/numcpus</a> v0.3.0<br>
+## explicit<br>
+# <a href=3D"http://github.com/yusufpapurcu/wmi" rel=3D"noreferrer" target=
=3D"_blank">github.com/yusufpapurcu/wmi</a> v1.2.2<br>
+## explicit<br>
+# <a href=3D"http://go.etcd.io/etcd/api/v3" rel=3D"noreferrer" target=3D"_=
blank">go.etcd.io/etcd/api/v3</a> v3.5.2<br>
+## explicit<br>
+# <a href=3D"http://go.etcd.io/etcd/client/pkg/v3" rel=3D"noreferrer" targ=
et=3D"_blank">go.etcd.io/etcd/client/pkg/v3</a> v3.5.2<br>
+## explicit<br>
+# <a href=3D"http://go.etcd.io/etcd/client/v3" rel=3D"noreferrer" target=
=3D"_blank">go.etcd.io/etcd/client/v3</a> v3.5.2<br>
+## explicit<br>
+# <a href=3D"http://go.uber.org/atomic" rel=3D"noreferrer" target=3D"_blan=
k">go.uber.org/atomic</a> v1.9.0<br>
+## explicit<br>
+# <a href=3D"http://go.uber.org/multierr" rel=3D"noreferrer" target=3D"_bl=
ank">go.uber.org/multierr</a> v1.7.0<br>
+## explicit<br>
+# <a href=3D"http://go.uber.org/zap" rel=3D"noreferrer" target=3D"_blank">=
go.uber.org/zap</a> v1.19.1<br>
+## explicit<br>
+# <a href=3D"http://golang.org/x/sync" rel=3D"noreferrer" target=3D"_blank=
">golang.org/x/sync</a> v0.0.0-20210220032951-036812b2e83c<br>
+## explicit<br>
+# <a href=3D"http://golang.org/x/sys" rel=3D"noreferrer" target=3D"_blank"=
>golang.org/x/sys</a> v0.0.0-20220412211240-33da011f77ad<br>
+## explicit<br>
+# <a href=3D"http://google.golang.org/genproto" rel=3D"noreferrer" target=
=3D"_blank">google.golang.org/genproto</a> v0.0.0-20211223182754-3ac035c7e7=
cb<br>
+## explicit<br>
+# <a href=3D"http://google.golang.org/grpc" rel=3D"noreferrer" target=3D"_=
blank">google.golang.org/grpc</a> v1.43.0<br>
+## explicit<br>
+# <a href=3D"http://google.golang.org/protobuf" rel=3D"noreferrer" target=
=3D"_blank">google.golang.org/protobuf</a> v1.27.1<br>
+## explicit<br>
+# <a href=3D"http://gopkg.in/ini.v1" rel=3D"noreferrer" target=3D"_blank">=
gopkg.in/ini.v1</a> v1.66.3<br>
+## explicit<br>
+# <a href=3D"http://gopkg.in/yaml.v3" rel=3D"noreferrer" target=3D"_blank"=
>gopkg.in/yaml.v3</a> v3.0.1<br>
+## explicit<br>
diff --git a/meta-oe/recipes-extended/minio/<a href=3D"http://minio_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">minio_git.bb</a> b/meta-oe/recipes-ex=
tended/minio/<a href=3D"http://minio_git.bb" rel=3D"noreferrer" target=3D"_=
blank">minio_git.bb</a><br>
new file mode 100644<br>
index 000000000..e88ea632f<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-extended/minio/<a href=3D"http://minio_git.bb" rel=3D=
"noreferrer" target=3D"_blank">minio_git.bb</a><br>
@@ -0,0 +1,160 @@<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/minio/mc" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/minio/mc</a>&quot;<br>
+SUMMARY =3D &quot;MinIO Client is a replacement for ls, cp, mkdir, diff an=
d rsync commands for filesystems and object storage.&quot;<br>
+DESCRIPTION =3D &quot;MinIO Client (mc) provides a modern alternative to \=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0UNIX commands like =
ls, cat, cp, mirror, diff, find \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0etc. It supports fi=
lesystems and Amazon S3 compatible \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cloud storage servi=
ce (AWS Signature v2 and v4). \<br>
+&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/minio/mc;nobranch=3D1=
;name=3Dmc;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.co=
m/minio/mc;nobranch=3D1;name=3Dmc;protocol=3Dhttps</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://modules.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+<br>
+include src_uri.inc<br>
+<br>
+SRCREV_mc =3D &quot;01b87ecc02ffad47dfe13c2154ac31db3e3115df&quot;<br>
+<br>
+GO_IMPORT =3D &quot;import&quot;<br>
+<br>
+LICENSE =3D &quot;GPL-3.0-only&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://src/${GO_IMPORT}/LICENSE;md5=3Deb1e64787=
0add0502f8f010b19de32af&quot;<br>
+<br>
+PV =3D &quot;${SRCREV_mc}&quot;<br>
+<br>
+inherit go<br>
+inherit goarch<br>
+<br>
+CGO_LDFLAGS:append:mips =3D &quot; -no-pie&quot;<br>
+<br>
+DEPENDS +=3D &quot;rsync-native&quot;<br>
+<br>
+do_compile() {<br>
+ <br>
+=C2=A0 =C2=A0 cd ${S}/src/${GO_IMPORT}<br>
+<br>
+=C2=A0 =C2=A0 export GOFLAGS=3D&quot;-mod=3Dvendor&quot;<br>
+=C2=A0 =C2=A0 export GOPATH=3D&quot;$GOPATH:${S}/src/import/.gopath:${S}/s=
rc/import/vendor&quot;<br>
+=C2=A0 =C2=A0 sites=3D&quot;<a href=3D"http://github.com/charmbracelet/bub=
bletea:github.com/charmbracelet/bubbletea" rel=3D"noreferrer" target=3D"_bl=
ank">github.com/charmbracelet/bubbletea:github.com/charmbracelet/bubbletea<=
/a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/cheg=
gaaa/pb:github.com/cheggaaa/pb" rel=3D"noreferrer" target=3D"_blank">github=
.com/cheggaaa/pb:github.com/cheggaaa/pb</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/dust=
in/go-humanize:github.com/dustin/go-humanize" rel=3D"noreferrer" target=3D"=
_blank">github.com/dustin/go-humanize:github.com/dustin/go-humanize</a> \<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/fati=
h/color:github.com/fatih/color" rel=3D"noreferrer" target=3D"_blank">github=
.com/fatih/color:github.com/fatih/color</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/go-o=
le/go-ole:github.com/go-ole/go-ole" rel=3D"noreferrer" target=3D"_blank">gi=
thub.com/go-ole/go-ole:github.com/go-ole/go-ole</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/gocc=
y/go-json:github.com/goccy/go-json" rel=3D"noreferrer" target=3D"_blank">gi=
thub.com/goccy/go-json:github.com/goccy/go-json</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/goog=
le/shlex:github.com/google/shlex" rel=3D"noreferrer" target=3D"_blank">gith=
ub.com/google/shlex:github.com/google/shlex</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/goog=
le/uuid:github.com/google/uuid" rel=3D"noreferrer" target=3D"_blank">github=
.com/google/uuid:github.com/google/uuid</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/inco=
nshreveable/mousetrap:github.com/inconshreveable/mousetrap" rel=3D"noreferr=
er" target=3D"_blank">github.com/inconshreveable/mousetrap:github.com/incon=
shreveable/mousetrap</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/json=
-iterator/go:github.com/json-iterator/go" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/json-iterator/go:github.com/json-iterator/go</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/klau=
spost/compress:github.com/klauspost/compress" rel=3D"noreferrer" target=3D"=
_blank">github.com/klauspost/compress:github.com/klauspost/compress</a> \<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/matt=
n/go-ieproxy:github.com/mattn/go-ieproxy" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/mattn/go-ieproxy:github.com/mattn/go-ieproxy</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/matt=
n/go-isatty:github.com/mattn/go-isatty" rel=3D"noreferrer" target=3D"_blank=
">github.com/mattn/go-isatty:github.com/mattn/go-isatty</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/mini=
o/cli:github.com/minio/cli" rel=3D"noreferrer" target=3D"_blank">github.com=
/minio/cli:github.com/minio/cli</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/mini=
o/colorjson:github.com/minio/colorjson" rel=3D"noreferrer" target=3D"_blank=
">github.com/minio/colorjson:github.com/minio/colorjson</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/mini=
o/filepath:github.com/minio/filepath" rel=3D"noreferrer" target=3D"_blank">=
github.com/minio/filepath:github.com/minio/filepath</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/mini=
o/madmin-go:github.com/minio/madmin-go" rel=3D"noreferrer" target=3D"_blank=
">github.com/minio/madmin-go:github.com/minio/madmin-go</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/mini=
o/md5-simd:github.com/minio/md5-simd" rel=3D"noreferrer" target=3D"_blank">=
github.com/minio/md5-simd:github.com/minio/md5-simd</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/mini=
o/minio-go/v7:github.com/minio/minio-go/v7" rel=3D"noreferrer" target=3D"_b=
lank">github.com/minio/minio-go/v7:github.com/minio/minio-go/v7</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/mini=
o/pkg:github.com/minio/pkg" rel=3D"noreferrer" target=3D"_blank">github.com=
/minio/pkg:github.com/minio/pkg</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/mini=
o/selfupdate:github.com/minio/selfupdate" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/minio/selfupdate:github.com/minio/selfupdate</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/mini=
o/sha256-simd:github.com/minio/sha256-simd" rel=3D"noreferrer" target=3D"_b=
lank">github.com/minio/sha256-simd:github.com/minio/sha256-simd</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/mitc=
hellh/go-homedir:github.com/mitchellh/go-homedir" rel=3D"noreferrer" target=
=3D"_blank">github.com/mitchellh/go-homedir:github.com/mitchellh/go-homedir=
</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/pkg/=
xattr:github.com/pkg/xattr" rel=3D"noreferrer" target=3D"_blank">github.com=
/pkg/xattr:github.com/pkg/xattr</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/pose=
ner/complete:github.com/posener/complete" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/posener/complete:github.com/posener/complete</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/prom=
etheus/client_golang:github.com/prometheus/client_golang" rel=3D"noreferrer=
" target=3D"_blank">github.com/prometheus/client_golang:github.com/promethe=
us/client_golang</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/prom=
etheus/prom2json:github.com/prometheus/prom2json" rel=3D"noreferrer" target=
=3D"_blank">github.com/prometheus/prom2json:github.com/prometheus/prom2json=
</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/rjec=
zalik/notify:github.com/rjeczalik/notify" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/rjeczalik/notify:github.com/rjeczalik/notify</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/rs/x=
id:github.com/rs/xid" rel=3D"noreferrer" target=3D"_blank">github.com/rs/xi=
d:github.com/rs/xid</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/secu=
re-io/sio-go:github.com/secure-io/sio-go" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/secure-io/sio-go:github.com/secure-io/sio-go</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/shir=
ou/gopsutil/v3:github.com/shirou/gopsutil/v3" rel=3D"noreferrer" target=3D"=
_blank">github.com/shirou/gopsutil/v3:github.com/shirou/gopsutil/v3</a> \<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/tidw=
all/gjson:github.com/tidwall/gjson" rel=3D"noreferrer" target=3D"_blank">gi=
thub.com/tidwall/gjson:github.com/tidwall/gjson</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/cr=
ypto:go.googlesource.com/crypto" rel=3D"noreferrer" target=3D"_blank">golan=
g.org/x/crypto:go.googlesource.com/crypto</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/ne=
t:go.googlesource.com/net" rel=3D"noreferrer" target=3D"_blank">golang.org/=
x/net:go.googlesource.com/net</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/te=
xt:go.googlesource.com/text" rel=3D"noreferrer" target=3D"_blank">golang.or=
g/x/text:go.googlesource.com/text</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://gopkg.in/check.=
v1:gopkg.in/check.v1" rel=3D"noreferrer" target=3D"_blank">gopkg.in/check.v=
1:gopkg.in/check.v1</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://gopkg.in/h2non/=
filetype.v1:gopkg.in/h2non/filetype.v1" rel=3D"noreferrer" target=3D"_blank=
">gopkg.in/h2non/filetype.v1:gopkg.in/h2non/filetype.v1</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://gopkg.in/yaml.v=
2:gopkg.in/yaml.v2" rel=3D"noreferrer" target=3D"_blank">gopkg.in/yaml.v2:g=
opkg.in/yaml.v2</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/char=
mbracelet/bubbles:github.com/charmbracelet/bubbles" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/charmbracelet/bubbles:github.com/charmbracelet/bub=
bles</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/char=
mbracelet/lipgloss:github.com/charmbracelet/lipgloss" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/charmbracelet/lipgloss:github.com/charmbracelet/=
lipgloss</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/gdam=
ore/tcell/v2:github.com/gdamore/tcell/v2" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/gdamore/tcell/v2:github.com/gdamore/tcell/v2</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/gola=
ng-jwt/jwt/v4:github.com/golang-jwt/jwt/v4" rel=3D"noreferrer" target=3D"_b=
lank">github.com/golang-jwt/jwt/v4:github.com/golang-jwt/jwt/v4</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/navi=
dys/tvxwidgets:github.com/navidys/tvxwidgets" rel=3D"noreferrer" target=3D"=
_blank">github.com/navidys/tvxwidgets:github.com/navidys/tvxwidgets</a> \<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/olek=
ukonko/tablewriter:github.com/olekukonko/tablewriter" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/olekukonko/tablewriter:github.com/olekukonko/tab=
lewriter</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/prom=
etheus/client_model:github.com/prometheus/client_model" rel=3D"noreferrer" =
target=3D"_blank">github.com/prometheus/client_model:github.com/prometheus/=
client_model</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/rivo=
/tview:github.com/rivo/tview" rel=3D"noreferrer" target=3D"_blank">github.c=
om/rivo/tview:github.com/rivo/tview</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/tiny=
lib/msgp:github.com/tinylib/msgp" rel=3D"noreferrer" target=3D"_blank">gith=
ub.com/tinylib/msgp:github.com/tinylib/msgp</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/te=
rm:go.googlesource.com/term" rel=3D"noreferrer" target=3D"_blank">golang.or=
g/x/term:go.googlesource.com/term</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/beor=
n7/perks:github.com/beorn7/perks" rel=3D"noreferrer" target=3D"_blank">gith=
ub.com/beorn7/perks:github.com/beorn7/perks</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/cesp=
are/xxhash/v2:github.com/cespare/xxhash/v2" rel=3D"noreferrer" target=3D"_b=
lank">github.com/cespare/xxhash/v2:github.com/cespare/xxhash/v2</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/cont=
ainerd/console:github.com/containerd/console" rel=3D"noreferrer" target=3D"=
_blank">github.com/containerd/console:github.com/containerd/console</a> \<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/core=
os/go-semver:github.com/coreos/go-semver" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/coreos/go-semver:github.com/coreos/go-semver</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/core=
os/go-systemd/v22:github.com/coreos/go-systemd/v22" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/coreos/go-systemd/v22:github.com/coreos/go-systemd=
/v22</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/decr=
ed/dcrd/dcrec/secp256k1/v4:github.com/decred/dcrd/dcrec/secp256k1/v4//dcrec=
/secp256k1" rel=3D"noreferrer" target=3D"_blank">github.com/decred/dcrd/dcr=
ec/secp256k1/v4:github.com/decred/dcrd/dcrec/secp256k1/v4//dcrec/secp256k1<=
/a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/fati=
h/structs:github.com/fatih/structs" rel=3D"noreferrer" target=3D"_blank">gi=
thub.com/fatih/structs:github.com/fatih/structs</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/gdam=
ore/encoding:github.com/gdamore/encoding" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/gdamore/encoding:github.com/gdamore/encoding</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/gogo=
/protobuf:github.com/gogo/protobuf" rel=3D"noreferrer" target=3D"_blank">gi=
thub.com/gogo/protobuf:github.com/gogo/protobuf</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/gola=
ng/protobuf:github.com/golang/protobuf" rel=3D"noreferrer" target=3D"_blank=
">github.com/golang/protobuf:github.com/golang/protobuf</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/hash=
icorp/errwrap:github.com/hashicorp/errwrap" rel=3D"noreferrer" target=3D"_b=
lank">github.com/hashicorp/errwrap:github.com/hashicorp/errwrap</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/hash=
icorp/go-multierror:github.com/hashicorp/go-multierror" rel=3D"noreferrer" =
target=3D"_blank">github.com/hashicorp/go-multierror:github.com/hashicorp/g=
o-multierror</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/klau=
spost/cpuid/v2:github.com/klauspost/cpuid/v2" rel=3D"noreferrer" target=3D"=
_blank">github.com/klauspost/cpuid/v2:github.com/klauspost/cpuid/v2</a> \<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/kr/t=
ext:github.com/kr/text" rel=3D"noreferrer" target=3D"_blank">github.com/kr/=
text:github.com/kr/text</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/lest=
rrat-go/backoff/v2:github.com/lestrrat-go/backoff/v2" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/lestrrat-go/backoff/v2:github.com/lestrrat-go/ba=
ckoff/v2</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/lest=
rrat-go/blackmagic:github.com/lestrrat-go/blackmagic" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/lestrrat-go/blackmagic:github.com/lestrrat-go/bl=
ackmagic</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/lest=
rrat-go/httpcc:github.com/lestrrat-go/httpcc" rel=3D"noreferrer" target=3D"=
_blank">github.com/lestrrat-go/httpcc:github.com/lestrrat-go/httpcc</a> \<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/lest=
rrat-go/iter:github.com/lestrrat-go/iter" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/lestrrat-go/iter:github.com/lestrrat-go/iter</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/lest=
rrat-go/jwx:github.com/lestrrat-go/jwx" rel=3D"noreferrer" target=3D"_blank=
">github.com/lestrrat-go/jwx:github.com/lestrrat-go/jwx</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/lest=
rrat-go/option:github.com/lestrrat-go/option" rel=3D"noreferrer" target=3D"=
_blank">github.com/lestrrat-go/option:github.com/lestrrat-go/option</a> \<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/luca=
sb-eyer/go-colorful:github.com/lucasb-eyer/go-colorful" rel=3D"noreferrer" =
target=3D"_blank">github.com/lucasb-eyer/go-colorful:github.com/lucasb-eyer=
/go-colorful</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/lufi=
a/plan9stats:github.com/lufia/plan9stats" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/lufia/plan9stats:github.com/lufia/plan9stats</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/matt=
n/go-colorable:github.com/mattn/go-colorable" rel=3D"noreferrer" target=3D"=
_blank">github.com/mattn/go-colorable:github.com/mattn/go-colorable</a> \<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/matt=
n/go-runewidth:github.com/mattn/go-runewidth" rel=3D"noreferrer" target=3D"=
_blank">github.com/mattn/go-runewidth:github.com/mattn/go-runewidth</a> \<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/matt=
tproud/golang_protobuf_extensions:github.com/matttproud/golang_protobuf_ext=
ensions" rel=3D"noreferrer" target=3D"_blank">github.com/matttproud/golang_=
protobuf_extensions:github.com/matttproud/golang_protobuf_extensions</a> \<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/mode=
rn-go/concurrent:github.com/modern-go/concurrent" rel=3D"noreferrer" target=
=3D"_blank">github.com/modern-go/concurrent:github.com/modern-go/concurrent=
</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/mode=
rn-go/reflect2:github.com/modern-go/reflect2" rel=3D"noreferrer" target=3D"=
_blank">github.com/modern-go/reflect2:github.com/modern-go/reflect2</a> \<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/mues=
li/ansi:github.com/muesli/ansi" rel=3D"noreferrer" target=3D"_blank">github=
.com/muesli/ansi:github.com/muesli/ansi</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/mues=
li/reflow:github.com/muesli/reflow" rel=3D"noreferrer" target=3D"_blank">gi=
thub.com/muesli/reflow:github.com/muesli/reflow</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/mues=
li/termenv:github.com/muesli/termenv" rel=3D"noreferrer" target=3D"_blank">=
github.com/muesli/termenv:github.com/muesli/termenv</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/niem=
eyer/pretty:github.com/niemeyer/pretty" rel=3D"noreferrer" target=3D"_blank=
">github.com/niemeyer/pretty:github.com/niemeyer/pretty</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/phil=
hofer/fwd:github.com/philhofer/fwd" rel=3D"noreferrer" target=3D"_blank">gi=
thub.com/philhofer/fwd:github.com/philhofer/fwd</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/pkg/=
errors:github.com/pkg/errors" rel=3D"noreferrer" target=3D"_blank">github.c=
om/pkg/errors:github.com/pkg/errors</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/powe=
r-devops/perfstat:github.com/power-devops/perfstat" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/power-devops/perfstat:github.com/power-devops/perf=
stat</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/prom=
etheus/common:github.com/prometheus/common" rel=3D"noreferrer" target=3D"_b=
lank">github.com/prometheus/common:github.com/prometheus/common</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/prom=
etheus/procfs:github.com/prometheus/procfs" rel=3D"noreferrer" target=3D"_b=
lank">github.com/prometheus/procfs:github.com/prometheus/procfs</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/rivo=
/uniseg:github.com/rivo/uniseg" rel=3D"noreferrer" target=3D"_blank">github=
.com/rivo/uniseg:github.com/rivo/uniseg</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/siru=
psen/logrus:github.com/sirupsen/logrus" rel=3D"noreferrer" target=3D"_blank=
">github.com/sirupsen/logrus:github.com/sirupsen/logrus</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/tidw=
all/match:github.com/tidwall/match" rel=3D"noreferrer" target=3D"_blank">gi=
thub.com/tidwall/match:github.com/tidwall/match</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/tidw=
all/pretty:github.com/tidwall/pretty" rel=3D"noreferrer" target=3D"_blank">=
github.com/tidwall/pretty:github.com/tidwall/pretty</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/tkla=
user/go-sysconf:github.com/tklauser/go-sysconf" rel=3D"noreferrer" target=
=3D"_blank">github.com/tklauser/go-sysconf:github.com/tklauser/go-sysconf</=
a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/tkla=
user/numcpus:github.com/tklauser/numcpus" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/tklauser/numcpus:github.com/tklauser/numcpus</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://github.com/yusu=
fpapurcu/wmi:github.com/yusufpapurcu/wmi" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/yusufpapurcu/wmi:github.com/yusufpapurcu/wmi</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://go.etcd.io/etcd=
/api/v3:github.com/etcd-io/etcd/api/v3//api" rel=3D"noreferrer" target=3D"_=
blank">go.etcd.io/etcd/api/v3:github.com/etcd-io/etcd/api/v3//api</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://go.etcd.io/etcd=
/client/pkg/v3:github.com/etcd-io/etcd/api/v3//client/pkg" rel=3D"noreferre=
r" target=3D"_blank">go.etcd.io/etcd/client/pkg/v3:github.com/etcd-io/etcd/=
api/v3//client/pkg</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://go.etcd.io/etcd=
/client/v3:github.com/etcd-io/etcd/api/v3//client/v3" rel=3D"noreferrer" ta=
rget=3D"_blank">go.etcd.io/etcd/client/v3:github.com/etcd-io/etcd/api/v3//c=
lient/v3</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://go.uber.org/ato=
mic:go.uber.org/atomic" rel=3D"noreferrer" target=3D"_blank">go.uber.org/at=
omic:go.uber.org/atomic</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://go.uber.org/mul=
tierr:go.uber.org/multierr" rel=3D"noreferrer" target=3D"_blank">go.uber.or=
g/multierr:go.uber.org/multierr</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://go.uber.org/zap=
:go.uber.org/zap" rel=3D"noreferrer" target=3D"_blank">go.uber.org/zap:go.u=
ber.org/zap</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/sy=
nc:go.googlesource.com/sync" rel=3D"noreferrer" target=3D"_blank">golang.or=
g/x/sync:go.googlesource.com/sync</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://golang.org/x/sy=
s:go.googlesource.com/sys" rel=3D"noreferrer" target=3D"_blank">golang.org/=
x/sys:go.googlesource.com/sys</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://google.golang.o=
rg/genproto:google.golang.org/genproto" rel=3D"noreferrer" target=3D"_blank=
">google.golang.org/genproto:google.golang.org/genproto</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://google.golang.o=
rg/grpc:google.golang.org/grpc" rel=3D"noreferrer" target=3D"_blank">google=
.golang.org/grpc:google.golang.org/grpc</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://google.golang.o=
rg/protobuf:google.golang.org/protobuf" rel=3D"noreferrer" target=3D"_blank=
">google.golang.org/protobuf:google.golang.org/protobuf</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://gopkg.in/ini.v1=
:gopkg.in/ini.v1" rel=3D"noreferrer" target=3D"_blank">gopkg.in/ini.v1:gopk=
g.in/ini.v1</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://gopkg.in/yaml.v=
3:gopkg.in/yaml.v3" rel=3D"noreferrer" target=3D"_blank">gopkg.in/yaml.v3:g=
opkg.in/yaml.v3</a>&quot;<br>
+=C2=A0 =C2=A0 for s in $sites; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 site_dest=3D$(echo $s | cut -d: -f1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 site_source=3D$(echo $s | cut -d: -f2)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p vendor.copy/$site_dest<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ -n &quot;$(ls -A vendor.copy/$site_dest/*.go=
 2&gt; /dev/null)&quot; ] &amp;&amp; { echo &quot;[INFO] vendor.fetch/$site=
_source -&gt; $site_dest: go copy skipped (files present)&quot; ; true ; } =
|| { echo &quot;[INFO] $site_dest: copying .go files&quot; ; rsync -a --exc=
lude=3D&#39;vendor/&#39; --exclude=3D&#39;.git/&#39; vendor.fetch/$site_sou=
rce/ vendor.copy/$site_dest ; }<br>
+=C2=A0 =C2=A0 done<br>
+<br>
+=C2=A0 =C2=A0 ln -sf vendor.copy vendor<br>
+=C2=A0 =C2=A0 # these are bad symlinks, go validates them and breaks the b=
uild if they are present<br>
+=C2=A0 =C2=A0 rm -f vendor/<a href=3D"http://go.etcd.io/etcd/client/v3/exa=
mple_*" rel=3D"noreferrer" target=3D"_blank">go.etcd.io/etcd/client/v3/exam=
ple_*</a><br>
+<br>
+=C2=A0 =C2=A0 cp ${WORKDIR}/modules.txt vendor/<br>
+<br>
+=C2=A0 =C2=A0 ${GO} build -trimpath<br>
+}<br>
+<br>
+do_install() {<br>
+=C2=A0 =C2=A0 install -d ${D}/${sbindir}<br>
+=C2=A0 =C2=A0 install ${S}/src/${GO_IMPORT}/mc ${D}/${sbindir}/mc<br>
+}<br>
diff --git a/meta-oe/recipes-extended/minio/src_uri.inc b/meta-oe/recipes-e=
xtended/minio/src_uri.inc<br>
new file mode 100644<br>
index 000000000..5cdc69dfc<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-extended/minio/src_uri.inc<br>
@@ -0,0 +1,509 @@<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/charmbracelet/bubbletea=
" rel=3D"noreferrer" target=3D"_blank">github.com/charmbracelet/bubbletea</=
a> v0.19.3<br>
+# [1] git ls-remote <a href=3D"https://github.com/charmbracelet/bubbletea"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/charmbracelet/bubb=
letea</a> 3dc51789d11229a1fb00f137d02b50b04cac372b <br>
+SRCREV_bubbletea=3D&quot;3dc51789d11229a1fb00f137d02b50b04cac372b&quot;<br=
>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/charmbracelet/bubble=
tea;name=3Dbubbletea;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR=
%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/charmbracelet/bubbletea" r=
el=3D"noreferrer" target=3D"_blank">github.com/charmbracelet/bubbletea;name=
=3Dbubbletea;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/sr=
c/import/vendor.fetch/github.com/charmbracelet/bubbletea</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/cheggaaa/pb" rel=3D"nor=
eferrer" target=3D"_blank">github.com/cheggaaa/pb</a> v1.0.29<br>
+# [1] git ls-remote <a href=3D"https://github.com/cheggaaa/pb" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/cheggaaa/pb</a> e2a33cc368a206=
516cc95f7bdd9176db0b83f098 <br>
+SRCREV_pb=3D&quot;e2a33cc368a206516cc95f7bdd9176db0b83f098&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/cheggaaa/pb;name=3Dp=
b;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/i=
mport/vendor.fetch/github.com/cheggaaa/pb" rel=3D"noreferrer" target=3D"_bl=
ank">github.com/cheggaaa/pb;name=3Dpb;protocol=3Dhttps;nobranch=3D1;destsuf=
fix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/cheggaaa/pb</a>&q=
uot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/dustin/go-humanize" rel=
=3D"noreferrer" target=3D"_blank">github.com/dustin/go-humanize</a> v1.0.0<=
br>
+# [1] git ls-remote <a href=3D"https://github.com/dustin/go-humanize" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/dustin/go-humanize</a>=
 e673fa1ffc91213297a60d18a6f513aa74bced52 <br>
+SRCREV_go-humanize=3D&quot;e673fa1ffc91213297a60d18a6f513aa74bced52&quot;<=
br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/dustin/go-humanize;n=
ame=3Dgo-humanize;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D=
/$%7BBP%7D/src/import/vendor.fetch/github.com/dustin/go-humanize" rel=3D"no=
referrer" target=3D"_blank">github.com/dustin/go-humanize;name=3Dgo-humaniz=
e;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/ve=
ndor.fetch/github.com/dustin/go-humanize</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/fatih/color" rel=3D"nor=
eferrer" target=3D"_blank">github.com/fatih/color</a> v1.13.0<br>
+# [1] git ls-remote <a href=3D"https://github.com/fatih/color" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/fatih/color</a> a05da93ebe62ca=
9fc6791d3376ec4dad01196448 <br>
+SRCREV_color=3D&quot;a05da93ebe62ca9fc6791d3376ec4dad01196448&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/fatih/color;name=3Dc=
olor;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/sr=
c/import/vendor.fetch/github.com/fatih/color" rel=3D"noreferrer" target=3D"=
_blank">github.com/fatih/color;name=3Dcolor;protocol=3Dhttps;nobranch=3D1;d=
estsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/fatih/color=
</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/go-ole/go-ole" rel=3D"n=
oreferrer" target=3D"_blank">github.com/go-ole/go-ole</a> v1.2.6<br>
+# [1] git ls-remote <a href=3D"https://github.com/go-ole/go-ole" rel=3D"no=
referrer" target=3D"_blank">https://github.com/go-ole/go-ole</a> 8b1f7f90f6=
b1728609c9694f2cff140d34fd91f8 <br>
+SRCREV_go-ole=3D&quot;8b1f7f90f6b1728609c9694f2cff140d34fd91f8&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/go-ole/go-ole;name=
=3Dgo-ole;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%=
7D/src/import/vendor.fetch/github.com/go-ole/go-ole" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/go-ole/go-ole;name=3Dgo-ole;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/g=
o-ole/go-ole</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/goccy/go-json" rel=3D"n=
oreferrer" target=3D"_blank">github.com/goccy/go-json</a> v0.8.1<br>
+# [1] git ls-remote <a href=3D"https://github.com/goccy/go-json" rel=3D"no=
referrer" target=3D"_blank">https://github.com/goccy/go-json</a> de89bd3db6=
7f2219c6183ec6febe2b5f7a6b06fb <br>
+SRCREV_go-json=3D&quot;de89bd3db67f2219c6183ec6febe2b5f7a6b06fb&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/goccy/go-json;name=
=3Dgo-json;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP=
%7D/src/import/vendor.fetch/github.com/goccy/go-json" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/goccy/go-json;name=3Dgo-json;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com=
/goccy/go-json</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/google/shlex" rel=3D"no=
referrer" target=3D"_blank">github.com/google/shlex</a> v0.0.0-201912021004=
58-e7afc7fbc510<br>
+# [1] git ls-remote <a href=3D"https://github.com/google/shlex" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/google/shlex</a> e7afc7fbc510=
79733e9468cdfd1efcd7d196cd1d <br>
+SRCREV_shlex=3D&quot;e7afc7fbc51079733e9468cdfd1efcd7d196cd1d&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/google/shlex;name=3D=
shlex;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/s=
rc/import/vendor.fetch/github.com/google/shlex" rel=3D"noreferrer" target=
=3D"_blank">github.com/google/shlex;name=3Dshlex;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/googl=
e/shlex</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/google/uuid" rel=3D"nor=
eferrer" target=3D"_blank">github.com/google/uuid</a> v1.3.0<br>
+# [1] git ls-remote <a href=3D"https://github.com/google/uuid" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/google/uuid</a> 44b5fee7c49cf3=
bcdf723f106b36d56ef13ccc88 <br>
+SRCREV_uuid=3D&quot;44b5fee7c49cf3bcdf723f106b36d56ef13ccc88&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/google/uuid;name=3Du=
uid;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src=
/import/vendor.fetch/github.com/google/uuid" rel=3D"noreferrer" target=3D"_=
blank">github.com/google/uuid;name=3Duuid;protocol=3Dhttps;nobranch=3D1;des=
tsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/google/uuid</=
a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/inconshreveable/mousetr=
ap" rel=3D"noreferrer" target=3D"_blank">github.com/inconshreveable/mousetr=
ap</a> v1.0.0<br>
+# [1] git ls-remote <a href=3D"https://github.com/inconshreveable/mousetra=
p" rel=3D"noreferrer" target=3D"_blank">https://github.com/inconshreveable/=
mousetrap</a> 76626ae9c91c4f2a10f34cad8ce83ea42c93bb75 <br>
+SRCREV_mousetrap=3D&quot;76626ae9c91c4f2a10f34cad8ce83ea42c93bb75&quot;<br=
>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/inconshreveable/mous=
etrap;name=3Dmousetrap;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKD=
IR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/inconshreveable/mousetra=
p" rel=3D"noreferrer" target=3D"_blank">github.com/inconshreveable/mousetra=
p;name=3Dmousetrap;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${=
BP}/src/import/vendor.fetch/github.com/inconshreveable/mousetrap</a>&quot;<=
br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/json-iterator/go" rel=
=3D"noreferrer" target=3D"_blank">github.com/json-iterator/go</a> v1.1.12<b=
r>
+# [1] git ls-remote <a href=3D"https://github.com/json-iterator/go" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/json-iterator/go</a> 0240=
77e996b048517130b21ea6bf12aa23055d3d <br>
+SRCREV_go=3D&quot;024077e996b048517130b21ea6bf12aa23055d3d&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/json-iterator/go;nam=
e=3Dgo;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/=
src/import/vendor.fetch/github.com/json-iterator/go" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/json-iterator/go;name=3Dgo;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/js=
on-iterator/go</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/klauspost/compress" rel=
=3D"noreferrer" target=3D"_blank">github.com/klauspost/compress</a> v1.13.6=
<br>
+# [1] git ls-remote <a href=3D"https://github.com/klauspost/compress" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/klauspost/compress</a>=
 38d4ba985ac157cb858763e016645e14e74c13c4 <br>
+SRCREV_compress=3D&quot;38d4ba985ac157cb858763e016645e14e74c13c4&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/klauspost/compress;n=
ame=3Dcompress;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%=
7BBP%7D/src/import/vendor.fetch/github.com/klauspost/compress" rel=3D"noref=
errer" target=3D"_blank">github.com/klauspost/compress;name=3Dcompress;prot=
ocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.f=
etch/github.com/klauspost/compress</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/mattn/go-ieproxy" rel=
=3D"noreferrer" target=3D"_blank">github.com/mattn/go-ieproxy</a> v0.0.1<br=
>
+# [1] git ls-remote <a href=3D"https://github.com/mattn/go-ieproxy" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/mattn/go-ieproxy</a> 439d=
d0581a2a03b415673a2462ad5c21eaabc588 <br>
+SRCREV_go-ieproxy=3D&quot;439dd0581a2a03b415673a2462ad5c21eaabc588&quot;<b=
r>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/mattn/go-ieproxy;nam=
e=3Dgo-ieproxy;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%=
7BBP%7D/src/import/vendor.fetch/github.com/mattn/go-ieproxy" rel=3D"norefer=
rer" target=3D"_blank">github.com/mattn/go-ieproxy;name=3Dgo-ieproxy;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fet=
ch/github.com/mattn/go-ieproxy</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/mattn/go-isatty" rel=3D=
"noreferrer" target=3D"_blank">github.com/mattn/go-isatty</a> v0.0.14<br>
+# [1] git ls-remote <a href=3D"https://github.com/mattn/go-isatty" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/mattn/go-isatty</a> 504425=
e14f742f1f517c4586048b49b37f829c8e <br>
+SRCREV_go-isatty=3D&quot;504425e14f742f1f517c4586048b49b37f829c8e&quot;<br=
>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/mattn/go-isatty;name=
=3Dgo-isatty;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7B=
BP%7D/src/import/vendor.fetch/github.com/mattn/go-isatty" rel=3D"noreferrer=
" target=3D"_blank">github.com/mattn/go-isatty;name=3Dgo-isatty;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/mattn/go-isatty</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/minio/cli" rel=3D"noref=
errer" target=3D"_blank">github.com/minio/cli</a> v1.22.0<br>
+# [1] git ls-remote <a href=3D"https://github.com/minio/cli" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/minio/cli</a> 735b30120ed7535d13=
933b0246f8a75cf80b0f74 <br>
+SRCREV_cli=3D&quot;735b30120ed7535d13933b0246f8a75cf80b0f74&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/minio/cli;name=3Dcli=
;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/im=
port/vendor.fetch/github.com/minio/cli" rel=3D"noreferrer" target=3D"_blank=
">github.com/minio/cli;name=3Dcli;protocol=3Dhttps;nobranch=3D1;destsuffix=
=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/minio/cli</a>&quot;<=
br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/minio/colorjson" rel=3D=
"noreferrer" target=3D"_blank">github.com/minio/colorjson</a> v1.0.2<br>
+# [1] git ls-remote <a href=3D"https://github.com/minio/colorjson" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/minio/colorjson</a> f964b3=
35cdb6cd51dff32a726d3d6ab9e1db0633 <br>
+SRCREV_colorjson=3D&quot;f964b335cdb6cd51dff32a726d3d6ab9e1db0633&quot;<br=
>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/minio/colorjson;name=
=3Dcolorjson;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7B=
BP%7D/src/import/vendor.fetch/github.com/minio/colorjson" rel=3D"noreferrer=
" target=3D"_blank">github.com/minio/colorjson;name=3Dcolorjson;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/minio/colorjson</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/minio/filepath" rel=3D"=
noreferrer" target=3D"_blank">github.com/minio/filepath</a> v1.0.0<br>
+# [1] git ls-remote <a href=3D"https://github.com/minio/filepath" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/minio/filepath</a> a116cb5d=
2b6396deea35d06389e3e9809c887fcf <br>
+SRCREV_filepath=3D&quot;a116cb5d2b6396deea35d06389e3e9809c887fcf&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/minio/filepath;name=
=3Dfilepath;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BB=
P%7D/src/import/vendor.fetch/github.com/minio/filepath" rel=3D"noreferrer" =
target=3D"_blank">github.com/minio/filepath;name=3Dfilepath;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/minio/filepath</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/minio/madmin-go" rel=3D=
"noreferrer" target=3D"_blank">github.com/minio/madmin-go</a> v1.4.3<br>
+# [1] git ls-remote <a href=3D"https://github.com/minio/madmin-go" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/minio/madmin-go</a> 4f71c8=
26739af4ebf73308e7f9a849a781859f78 <br>
+SRCREV_madmin-go=3D&quot;4f71c826739af4ebf73308e7f9a849a781859f78&quot;<br=
>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/minio/madmin-go;name=
=3Dmadmin-go;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7B=
BP%7D/src/import/vendor.fetch/github.com/minio/madmin-go" rel=3D"noreferrer=
" target=3D"_blank">github.com/minio/madmin-go;name=3Dmadmin-go;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/minio/madmin-go</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/minio/md5-simd" rel=3D"=
noreferrer" target=3D"_blank">github.com/minio/md5-simd</a> v1.1.2<br>
+# [1] git ls-remote <a href=3D"https://github.com/minio/md5-simd" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/minio/md5-simd</a> 776275e0=
c9a74ceebbd50fe5c1d61b0c80c608df <br>
+SRCREV_md5-simd=3D&quot;776275e0c9a74ceebbd50fe5c1d61b0c80c608df&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/minio/md5-simd;name=
=3Dmd5-simd;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BB=
P%7D/src/import/vendor.fetch/github.com/minio/md5-simd" rel=3D"noreferrer" =
target=3D"_blank">github.com/minio/md5-simd;name=3Dmd5-simd;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/minio/md5-simd</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/minio/minio-go/v7" rel=
=3D"noreferrer" target=3D"_blank">github.com/minio/minio-go/v7</a> v7.0.30<=
br>
+# [1] git ls-remote <a href=3D"https://github.com/minio/minio-go" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/minio/minio-go</a> 81c30332=
5bb4426c89776854b2ea4f7936deb11c <br>
+SRCREV_v7=3D&quot;81c303325bb4426c89776854b2ea4f7936deb11c&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/minio/minio-go;name=
=3Dv7;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/s=
rc/import/vendor.fetch/github.com/minio/minio-go/v7" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/minio/minio-go;name=3Dv7;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mini=
o/minio-go/v7</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/minio/pkg" rel=3D"noref=
errer" target=3D"_blank">github.com/minio/pkg</a> v1.1.22<br>
+# [1] git ls-remote <a href=3D"https://github.com/minio/pkg" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/minio/pkg</a> 3b76bdaec27995a31d=
0b0a7959bbef55bfe0d364 <br>
+SRCREV_pkg=3D&quot;3b76bdaec27995a31d0b0a7959bbef55bfe0d364&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/minio/pkg;name=3Dpkg=
;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/im=
port/vendor.fetch/github.com/minio/pkg" rel=3D"noreferrer" target=3D"_blank=
">github.com/minio/pkg;name=3Dpkg;protocol=3Dhttps;nobranch=3D1;destsuffix=
=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/minio/pkg</a>&quot;<=
br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/minio/selfupdate" rel=
=3D"noreferrer" target=3D"_blank">github.com/minio/selfupdate</a> v0.4.0<br=
>
+# [1] git ls-remote <a href=3D"https://github.com/minio/selfupdate" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/minio/selfupdate</a> 9e32=
fb8d38277355add4fa3983edb0b376d12bb5 <br>
+SRCREV_selfupdate=3D&quot;9e32fb8d38277355add4fa3983edb0b376d12bb5&quot;<b=
r>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/minio/selfupdate;nam=
e=3Dselfupdate;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%=
7BBP%7D/src/import/vendor.fetch/github.com/minio/selfupdate" rel=3D"norefer=
rer" target=3D"_blank">github.com/minio/selfupdate;name=3Dselfupdate;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fet=
ch/github.com/minio/selfupdate</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/minio/sha256-simd" rel=
=3D"noreferrer" target=3D"_blank">github.com/minio/sha256-simd</a> v1.0.0<b=
r>
+# [1] git ls-remote <a href=3D"https://github.com/minio/sha256-simd" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/minio/sha256-simd</a> =
6a57409d8e0fa3ae883aee331b71aaa40d5a7dd9 <br>
+SRCREV_sha256-simd=3D&quot;6a57409d8e0fa3ae883aee331b71aaa40d5a7dd9&quot;<=
br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/minio/sha256-simd;na=
me=3Dsha256-simd;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/=
$%7BBP%7D/src/import/vendor.fetch/github.com/minio/sha256-simd" rel=3D"nore=
ferrer" target=3D"_blank">github.com/minio/sha256-simd;name=3Dsha256-simd;p=
rotocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendo=
r.fetch/github.com/minio/sha256-simd</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/mitchellh/go-homedir" r=
el=3D"noreferrer" target=3D"_blank">github.com/mitchellh/go-homedir</a> v1.=
1.0<br>
+# [1] git ls-remote <a href=3D"https://github.com/mitchellh/go-homedir" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/mitchellh/go-homedir<=
/a> af06845cf3004701891bf4fdb884bfe4920b3727 <br>
+SRCREV_go-homedir=3D&quot;af06845cf3004701891bf4fdb884bfe4920b3727&quot;<b=
r>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/mitchellh/go-homedir=
;name=3Dgo-homedir;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7=
D/$%7BBP%7D/src/import/vendor.fetch/github.com/mitchellh/go-homedir" rel=3D=
"noreferrer" target=3D"_blank">github.com/mitchellh/go-homedir;name=3Dgo-ho=
medir;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/impor=
t/vendor.fetch/github.com/mitchellh/go-homedir</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/pkg/xattr" rel=3D"noref=
errer" target=3D"_blank">github.com/pkg/xattr</a> v0.4.4<br>
+# [1] git ls-remote <a href=3D"https://github.com/pkg/xattr" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/pkg/xattr</a> 8725d4ccc0fcef59c8=
d9f0eaf606b3c6f962467a <br>
+SRCREV_xattr=3D&quot;8725d4ccc0fcef59c8d9f0eaf606b3c6f962467a&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/pkg/xattr;name=3Dxat=
tr;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/=
import/vendor.fetch/github.com/pkg/xattr" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/pkg/xattr;name=3Dxattr;protocol=3Dhttps;nobranch=3D1;destsuf=
fix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/pkg/xattr</a>&quo=
t;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/posener/complete" rel=
=3D"noreferrer" target=3D"_blank">github.com/posener/complete</a> v1.2.3<br=
>
+# [1] git ls-remote <a href=3D"https://github.com/posener/complete" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/posener/complete</a> 05b6=
8ffc813dd10c420993cb1cf927b346c057b8 <br>
+SRCREV_complete=3D&quot;05b68ffc813dd10c420993cb1cf927b346c057b8&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/posener/complete;nam=
e=3Dcomplete;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7B=
BP%7D/src/import/vendor.fetch/github.com/posener/complete" rel=3D"noreferre=
r" target=3D"_blank">github.com/posener/complete;name=3Dcomplete;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/posener/complete</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/prometheus/client_golan=
g" rel=3D"noreferrer" target=3D"_blank">github.com/prometheus/client_golang=
</a> v1.12.1<br>
+# [1] git ls-remote <a href=3D"https://github.com/prometheus/client_golang=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/prometheus/client=
_golang</a> 2e1c4818ccfdcf953ce399cadad615ff2bed968c <br>
+SRCREV_client_golang=3D&quot;2e1c4818ccfdcf953ce399cadad615ff2bed968c&quot=
;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/prometheus/client_go=
lang;name=3Dclient_golang;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWO=
RKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/prometheus/client_gol=
ang" rel=3D"noreferrer" target=3D"_blank">github.com/prometheus/client_gola=
ng;name=3Dclient_golang;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDI=
R}/${BP}/src/import/vendor.fetch/github.com/prometheus/client_golang</a>&qu=
ot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/prometheus/prom2json" r=
el=3D"noreferrer" target=3D"_blank">github.com/prometheus/prom2json</a> v1.=
3.1<br>
+# [1] git ls-remote <a href=3D"https://github.com/prometheus/prom2json" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/prometheus/prom2json<=
/a> ac13972e54feb2f8eafc9a613112cb310f5463dc <br>
+SRCREV_prom2json=3D&quot;ac13972e54feb2f8eafc9a613112cb310f5463dc&quot;<br=
>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/prometheus/prom2json=
;name=3Dprom2json;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D=
/$%7BBP%7D/src/import/vendor.fetch/github.com/prometheus/prom2json" rel=3D"=
noreferrer" target=3D"_blank">github.com/prometheus/prom2json;name=3Dprom2j=
son;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/=
vendor.fetch/github.com/prometheus/prom2json</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/rjeczalik/notify" rel=
=3D"noreferrer" target=3D"_blank">github.com/rjeczalik/notify</a> v0.9.2<br=
>
+# [1] git ls-remote <a href=3D"https://github.com/rjeczalik/notify" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/rjeczalik/notify</a> 69d8=
39f37b13a8cb7a78366f7633a4071cb43be7 <br>
+SRCREV_notify=3D&quot;69d839f37b13a8cb7a78366f7633a4071cb43be7&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/rjeczalik/notify;nam=
e=3Dnotify;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP=
%7D/src/import/vendor.fetch/github.com/rjeczalik/notify" rel=3D"noreferrer"=
 target=3D"_blank">github.com/rjeczalik/notify;name=3Dnotify;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/githu=
b.com/rjeczalik/notify</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/rs/xid" rel=3D"noreferr=
er" target=3D"_blank">github.com/rs/xid</a> v1.3.0<br>
+# [1] git ls-remote <a href=3D"https://github.com/rs/xid" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/rs/xid</a> efa678f304ab65d6d57eedcb=
086798381ae22206 <br>
+SRCREV_xid=3D&quot;efa678f304ab65d6d57eedcb086798381ae22206&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/rs/xid;name=3Dxid;pr=
otocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/impor=
t/vendor.fetch/github.com/rs/xid" rel=3D"noreferrer" target=3D"_blank">gith=
ub.com/rs/xid;name=3Dxid;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKD=
IR}/${BP}/src/import/vendor.fetch/github.com/rs/xid</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/secure-io/sio-go" rel=
=3D"noreferrer" target=3D"_blank">github.com/secure-io/sio-go</a> v0.3.1<br=
>
+# [1] git ls-remote <a href=3D"https://github.com/secure-io/sio-go" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/secure-io/sio-go</a> a455=
d2cd8fcacdfe18557d117db15c0629fb7e2c <br>
+SRCREV_sio-go=3D&quot;a455d2cd8fcacdfe18557d117db15c0629fb7e2c&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/secure-io/sio-go;nam=
e=3Dsio-go;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP=
%7D/src/import/vendor.fetch/github.com/secure-io/sio-go" rel=3D"noreferrer"=
 target=3D"_blank">github.com/secure-io/sio-go;name=3Dsio-go;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/githu=
b.com/secure-io/sio-go</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/shirou/gopsutil/v3" rel=
=3D"noreferrer" target=3D"_blank">github.com/shirou/gopsutil/v3</a> v3.21.1=
2<br>
+# [1] git ls-remote <a href=3D"https://github.com/shirou/gopsutil" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/shirou/gopsutil</a> 2f8da0=
a39487ceddf44cebe53a1b563b0b7173cc <br>
+SRCREV_v3=3D&quot;2f8da0a39487ceddf44cebe53a1b563b0b7173cc&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/shirou/gopsutil;name=
=3Dv3;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/s=
rc/import/vendor.fetch/github.com/shirou/gopsutil/v3" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/shirou/gopsutil;name=3Dv3;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/sh=
irou/gopsutil/v3</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/tidwall/gjson" rel=3D"n=
oreferrer" target=3D"_blank">github.com/tidwall/gjson</a> v1.12.1<br>
+# [1] git ls-remote <a href=3D"https://github.com/tidwall/gjson" rel=3D"no=
referrer" target=3D"_blank">https://github.com/tidwall/gjson</a> db0033701c=
ccc8e2e43b77d03e4f509a48b6b2f2 <br>
+SRCREV_gjson=3D&quot;db0033701cccc8e2e43b77d03e4f509a48b6b2f2&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/tidwall/gjson;name=
=3Dgjson;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7=
D/src/import/vendor.fetch/github.com/tidwall/gjson" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/tidwall/gjson;name=3Dgjson;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/tid=
wall/gjson</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://golang.org/x/crypto" rel=3D"norefe=
rrer" target=3D"_blank">golang.org/x/crypto</a> v0.0.0-20220525230936-793ad=
666bf5e<br>
+# [1] git ls-remote <a href=3D"https://go.googlesource.com/crypto" rel=3D"=
noreferrer" target=3D"_blank">https://go.googlesource.com/crypto</a> 793ad6=
66bf5ec61392092b27061be9618e4e219b <br>
+SRCREV_crypto=3D&quot;793ad666bf5ec61392092b27061be9618e4e219b&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.com/crypto;name=
=3Dcrypto;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%=
7D/src/import/vendor.fetch/go.googlesource.com/crypto" rel=3D"noreferrer" t=
arget=3D"_blank">go.googlesource.com/crypto;name=3Dcrypto;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.googl=
esource.com/crypto</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://golang.org/x/net" rel=3D"noreferre=
r" target=3D"_blank">golang.org/x/net</a> v0.0.0-20220225172249-27dd8689420=
f<br>
+# [1] git ls-remote <a href=3D"https://go.googlesource.com/net" rel=3D"nor=
eferrer" target=3D"_blank">https://go.googlesource.com/net</a> 27dd8689420f=
cde088514397d015e4fea5174e0e <br>
+SRCREV_net=3D&quot;27dd8689420fcde088514397d015e4fea5174e0e&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.com/net;name=3D=
net;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src=
/import/vendor.fetch/go.googlesource.com/net" rel=3D"noreferrer" target=3D"=
_blank">go.googlesource.com/net;name=3Dnet;protocol=3Dhttps;nobranch=3D1;de=
stsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.googlesource.com/net=
</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://golang.org/x/text" rel=3D"noreferr=
er" target=3D"_blank">golang.org/x/text</a> v0.3.7<br>
+# [1] git ls-remote <a href=3D"https://go.googlesource.com/text" rel=3D"no=
referrer" target=3D"_blank">https://go.googlesource.com/text</a> 3cd4007149=
f3f883d229d707172ed356727aae99 <br>
+SRCREV_text=3D&quot;3cd4007149f3f883d229d707172ed356727aae99&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.com/text;name=
=3Dtext;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D=
/src/import/vendor.fetch/go.googlesource.com/text" rel=3D"noreferrer" targe=
t=3D"_blank">go.googlesource.com/text;name=3Dtext;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.googlesource.=
com/text</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://gopkg.in/check.v1" rel=3D"noreferr=
er" target=3D"_blank">gopkg.in/check.v1</a> v1.0.0-20200902074654-038fdea0a=
05b<br>
+# [1] git ls-remote <a href=3D"https://gopkg.in/check.v1" rel=3D"noreferre=
r" target=3D"_blank">https://gopkg.in/check.v1</a> 038fdea0a05bc030b0bfda47=
9dc2e08d2220ec74 <br>
+SRCREV_check.v1=3D&quot;038fdea0a05bc030b0bfda479dc2e08d2220ec74&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://gopkg.in/check.v1;name=3Dcheck.=
v1;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/=
import/vendor.fetch/gopkg.in/check.v1" rel=3D"noreferrer" target=3D"_blank"=
>gopkg.in/check.v1;name=3Dcheck.v1;protocol=3Dhttps;nobranch=3D1;destsuffix=
=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/check.v1</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://gopkg.in/h2non/filetype.v1" rel=3D=
"noreferrer" target=3D"_blank">gopkg.in/h2non/filetype.v1</a> v1.0.5<br>
+# [1] git ls-remote <a href=3D"https://gopkg.in/h2non/filetype.v1" rel=3D"=
noreferrer" target=3D"_blank">https://gopkg.in/h2non/filetype.v1</a> 8f3142=
c797f0413f00dadaf1bf97dd0b7b1f8d8b <br>
+SRCREV_filetype.v1=3D&quot;8f3142c797f0413f00dadaf1bf97dd0b7b1f8d8b&quot;<=
br>
+SRC_URI +=3D &quot;git://<a href=3D"http://gopkg.in/h2non/filetype.v1;name=
=3Dfiletype.v1;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%=
7BBP%7D/src/import/vendor.fetch/gopkg.in/h2non/filetype.v1" rel=3D"noreferr=
er" target=3D"_blank">gopkg.in/h2non/filetype.v1;name=3Dfiletype.v1;protoco=
l=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetc=
h/gopkg.in/h2non/filetype.v1</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://gopkg.in/yaml.v2" rel=3D"noreferre=
r" target=3D"_blank">gopkg.in/yaml.v2</a> v2.4.0<br>
+# [1] git ls-remote <a href=3D"https://gopkg.in/yaml.v2" rel=3D"noreferrer=
" target=3D"_blank">https://gopkg.in/yaml.v2</a> 7649d4548cb53a614db133b2a8=
ac1f31859dda8c <br>
+SRCREV_yaml.v2=3D&quot;7649d4548cb53a614db133b2a8ac1f31859dda8c&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://gopkg.in/yaml.v2;name=3Dyaml.v2=
;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/im=
port/vendor.fetch/gopkg.in/yaml.v2" rel=3D"noreferrer" target=3D"_blank">go=
pkg.in/yaml.v2;name=3Dyaml.v2;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${=
WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/yaml.v2</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/charmbracelet/bubbles" =
rel=3D"noreferrer" target=3D"_blank">github.com/charmbracelet/bubbles</a> v=
0.10.0<br>
+# [1] git ls-remote <a href=3D"https://github.com/charmbracelet/bubbles" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/charmbracelet/bubble=
s</a> 7714089ad7c81898564ebeb7b6876b5844e26ccd <br>
+SRCREV_bubbles=3D&quot;7714089ad7c81898564ebeb7b6876b5844e26ccd&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/charmbracelet/bubble=
s;name=3Dbubbles;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/=
$%7BBP%7D/src/import/vendor.fetch/github.com/charmbracelet/bubbles" rel=3D"=
noreferrer" target=3D"_blank">github.com/charmbracelet/bubbles;name=3Dbubbl=
es;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/v=
endor.fetch/github.com/charmbracelet/bubbles</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/charmbracelet/lipgloss"=
 rel=3D"noreferrer" target=3D"_blank">github.com/charmbracelet/lipgloss</a>=
 v0.4.1-0.20220204041308-bf2912e703f6<br>
+# [1] git ls-remote <a href=3D"https://github.com/charmbracelet/lipgloss" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/charmbracelet/lipgl=
oss</a> bf2912e703f6ecf88a1b843472afd47ce5002caf <br>
+SRCREV_lipgloss=3D&quot;bf2912e703f6ecf88a1b843472afd47ce5002caf&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/charmbracelet/lipglo=
ss;name=3Dlipgloss;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7=
D/$%7BBP%7D/src/import/vendor.fetch/github.com/charmbracelet/lipgloss" rel=
=3D"noreferrer" target=3D"_blank">github.com/charmbracelet/lipgloss;name=3D=
lipgloss;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/im=
port/vendor.fetch/github.com/charmbracelet/lipgloss</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/gdamore/tcell/v2" rel=
=3D"noreferrer" target=3D"_blank">github.com/gdamore/tcell/v2</a> v2.4.1-0.=
20210905002822-f057f0a857a1<br>
+# [1] git ls-remote <a href=3D"https://github.com/gdamore/tcell" rel=3D"no=
referrer" target=3D"_blank">https://github.com/gdamore/tcell</a> f057f0a857=
a1b3ac3e4fff8c6cfe8126f8387cd1 <br>
+SRCREV_v2=3D&quot;f057f0a857a1b3ac3e4fff8c6cfe8126f8387cd1&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/gdamore/tcell;name=
=3Dv2;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/s=
rc/import/vendor.fetch/github.com/gdamore/tcell/v2" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/gdamore/tcell;name=3Dv2;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/gdamo=
re/tcell/v2</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/golang-jwt/jwt/v4" rel=
=3D"noreferrer" target=3D"_blank">github.com/golang-jwt/jwt/v4</a> v4.4.1<b=
r>
+# [1] git ls-remote <a href=3D"https://github.com/golang-jwt/jwt" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/golang-jwt/jwt</a> 0972257e=
ba279bb357882afc11db8218644ad565 <br>
+SRCREV_v4=3D&quot;0972257eba279bb357882afc11db8218644ad565&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/golang-jwt/jwt;name=
=3Dv4;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/s=
rc/import/vendor.fetch/github.com/golang-jwt/jwt/v4" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/golang-jwt/jwt;name=3Dv4;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/gola=
ng-jwt/jwt/v4</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/navidys/tvxwidgets" rel=
=3D"noreferrer" target=3D"_blank">github.com/navidys/tvxwidgets</a> v0.1.0<=
br>
+# [1] git ls-remote <a href=3D"https://github.com/navidys/tvxwidgets" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/navidys/tvxwidgets</a>=
 f017cfd5ce6d4bd7fb22529305d7a438c3f1369d <br>
+SRCREV_tvxwidgets=3D&quot;f017cfd5ce6d4bd7fb22529305d7a438c3f1369d&quot;<b=
r>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/navidys/tvxwidgets;n=
ame=3Dtvxwidgets;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/=
$%7BBP%7D/src/import/vendor.fetch/github.com/navidys/tvxwidgets" rel=3D"nor=
eferrer" target=3D"_blank">github.com/navidys/tvxwidgets;name=3Dtvxwidgets;=
protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vend=
or.fetch/github.com/navidys/tvxwidgets</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/olekukonko/tablewriter"=
 rel=3D"noreferrer" target=3D"_blank">github.com/olekukonko/tablewriter</a>=
 v0.0.5<br>
+# [1] git ls-remote <a href=3D"https://github.com/olekukonko/tablewriter" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/olekukonko/tablewri=
ter</a> c7d2a8a09b076b70918308a3cd95464b2ae3b5d8 <br>
+SRCREV_tablewriter=3D&quot;c7d2a8a09b076b70918308a3cd95464b2ae3b5d8&quot;<=
br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/olekukonko/tablewrit=
er;name=3Dtablewriter;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDI=
R%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/olekukonko/tablewriter" r=
el=3D"noreferrer" target=3D"_blank">github.com/olekukonko/tablewriter;name=
=3Dtablewriter;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/=
src/import/vendor.fetch/github.com/olekukonko/tablewriter</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/prometheus/client_model=
" rel=3D"noreferrer" target=3D"_blank">github.com/prometheus/client_model</=
a> v0.2.0<br>
+# [1] git ls-remote <a href=3D"https://github.com/prometheus/client_model"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/prometheus/client_=
model</a> f44e7adcba5ee54c8a94709e6fc300d83245f171 <br>
+SRCREV_client_model=3D&quot;f44e7adcba5ee54c8a94709e6fc300d83245f171&quot;=
<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/prometheus/client_mo=
del;name=3Dclient_model;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORK=
DIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/prometheus/client_model=
" rel=3D"noreferrer" target=3D"_blank">github.com/prometheus/client_model;n=
ame=3Dclient_model;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${=
BP}/src/import/vendor.fetch/github.com/prometheus/client_model</a>&quot;<br=
>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/rivo/tview" rel=3D"nore=
ferrer" target=3D"_blank">github.com/rivo/tview</a> v0.0.0-20211202162923-2=
a6de950f73b<br>
+# [1] git ls-remote <a href=3D"https://github.com/rivo/tview" rel=3D"noref=
errer" target=3D"_blank">https://github.com/rivo/tview</a> 2a6de950f73bdc70=
658f7e754d4b5593f15c8408 <br>
+SRCREV_tview=3D&quot;2a6de950f73bdc70658f7e754d4b5593f15c8408&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/rivo/tview;name=3Dtv=
iew;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src=
/import/vendor.fetch/github.com/rivo/tview" rel=3D"noreferrer" target=3D"_b=
lank">github.com/rivo/tview;name=3Dtview;protocol=3Dhttps;nobranch=3D1;dest=
suffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/rivo/tview</a>=
&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/tinylib/msgp" rel=3D"no=
referrer" target=3D"_blank">github.com/tinylib/msgp</a> v1.1.6<br>
+# [1] git ls-remote <a href=3D"https://github.com/tinylib/msgp" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/tinylib/msgp</a> 205265da6514=
09c54677b486e350b4d105da6d8b <br>
+SRCREV_msgp=3D&quot;205265da651409c54677b486e350b4d105da6d8b&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/tinylib/msgp;name=3D=
msgp;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/sr=
c/import/vendor.fetch/github.com/tinylib/msgp" rel=3D"noreferrer" target=3D=
"_blank">github.com/tinylib/msgp;name=3Dmsgp;protocol=3Dhttps;nobranch=3D1;=
destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/tinylib/ms=
gp</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://golang.org/x/term" rel=3D"noreferr=
er" target=3D"_blank">golang.org/x/term</a> v0.0.0-20210927222741-03fcf44c2=
211<br>
+# [1] git ls-remote <a href=3D"https://go.googlesource.com/term" rel=3D"no=
referrer" target=3D"_blank">https://go.googlesource.com/term</a> 03fcf44c22=
11dcd5eb77510b5f7c1fb02d6ded50 <br>
+SRCREV_term=3D&quot;03fcf44c2211dcd5eb77510b5f7c1fb02d6ded50&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.com/term;name=
=3Dterm;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D=
/src/import/vendor.fetch/go.googlesource.com/term" rel=3D"noreferrer" targe=
t=3D"_blank">go.googlesource.com/term;name=3Dterm;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.googlesource.=
com/term</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/beorn7/perks" rel=3D"no=
referrer" target=3D"_blank">github.com/beorn7/perks</a> v1.0.1<br>
+# [1] git ls-remote <a href=3D"https://github.com/beorn7/perks" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/beorn7/perks</a> c49ff2746872=
22a7373c4cd83578f1065cf3e143 <br>
+SRCREV_perks=3D&quot;c49ff274687222a7373c4cd83578f1065cf3e143&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/beorn7/perks;name=3D=
perks;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/s=
rc/import/vendor.fetch/github.com/beorn7/perks" rel=3D"noreferrer" target=
=3D"_blank">github.com/beorn7/perks;name=3Dperks;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/beorn=
7/perks</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/cespare/xxhash/v2" rel=
=3D"noreferrer" target=3D"_blank">github.com/cespare/xxhash/v2</a> v2.1.2<b=
r>
+# [1] git ls-remote <a href=3D"https://github.com/cespare/xxhash" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/cespare/xxhash</a> 7ae26c41=
ed6fb1f8a6c21e05eeff4d91b5e401c4 <br>
+SRCREV_v21=3D&quot;7ae26c41ed6fb1f8a6c21e05eeff4d91b5e401c4&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/cespare/xxhash;name=
=3Dv21;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/=
src/import/vendor.fetch/github.com/cespare/xxhash/v2" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/cespare/xxhash;name=3Dv21;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/ce=
spare/xxhash/v2</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/containerd/console" rel=
=3D"noreferrer" target=3D"_blank">github.com/containerd/console</a> v1.0.2<=
br>
+# [1] git ls-remote <a href=3D"https://github.com/containerd/console" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/containerd/console</a>=
 d5efa7d56fd239f7f3dad2ab6685db09359a3618 <br>
+SRCREV_console=3D&quot;d5efa7d56fd239f7f3dad2ab6685db09359a3618&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/containerd/console;n=
ame=3Dconsole;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7=
BBP%7D/src/import/vendor.fetch/github.com/containerd/console" rel=3D"norefe=
rrer" target=3D"_blank">github.com/containerd/console;name=3Dconsole;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fet=
ch/github.com/containerd/console</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/coreos/go-semver" rel=
=3D"noreferrer" target=3D"_blank">github.com/coreos/go-semver</a> v0.3.0<br=
>
+# [1] git ls-remote <a href=3D"https://github.com/coreos/go-semver" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/coreos/go-semver</a> 6e25=
b691b0ebe9657dd0ee60d73a9f8716f0c6f5 <br>
+SRCREV_go-semver=3D&quot;6e25b691b0ebe9657dd0ee60d73a9f8716f0c6f5&quot;<br=
>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/coreos/go-semver;nam=
e=3Dgo-semver;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7=
BBP%7D/src/import/vendor.fetch/github.com/coreos/go-semver" rel=3D"noreferr=
er" target=3D"_blank">github.com/coreos/go-semver;name=3Dgo-semver;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/coreos/go-semver</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/coreos/go-systemd/v22" =
rel=3D"noreferrer" target=3D"_blank">github.com/coreos/go-systemd/v22</a> v=
22.3.2<br>
+# [1] git ls-remote <a href=3D"https://github.com/coreos/go-systemd" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/coreos/go-systemd</a> =
0b40357fd65760243a3eceb80a299772c23c8470 <br>
+SRCREV_v22=3D&quot;0b40357fd65760243a3eceb80a299772c23c8470&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/coreos/go-systemd;na=
me=3Dv22;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7=
D/src/import/vendor.fetch/github.com/coreos/go-systemd/v22" rel=3D"noreferr=
er" target=3D"_blank">github.com/coreos/go-systemd;name=3Dv22;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/coreos/go-systemd/v22</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/decred/dcrd/dcrec/secp2=
56k1/v4" rel=3D"noreferrer" target=3D"_blank">github.com/decred/dcrd/dcrec/=
secp256k1/v4</a> v4.0.1<br>
+# [1] git ls-remote <a href=3D"https://github.com/decred/dcrd" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/decred/dcrd</a> 75f1b4dac2e431=
33f3281ac63a9ef9eb699200e5 <br>
+SRCREV_v41=3D&quot;75f1b4dac2e43133f3281ac63a9ef9eb699200e5&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/decred/dcrd;name=3Dv=
41;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/=
import/vendor.fetch/github.com/decred/dcrd/dcrec/secp256k1/v4" rel=3D"noref=
errer" target=3D"_blank">github.com/decred/dcrd;name=3Dv41;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.=
com/decred/dcrd/dcrec/secp256k1/v4</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/fatih/structs" rel=3D"n=
oreferrer" target=3D"_blank">github.com/fatih/structs</a> v1.1.0<br>
+# [1] git ls-remote <a href=3D"https://github.com/fatih/structs" rel=3D"no=
referrer" target=3D"_blank">https://github.com/fatih/structs</a> 4966fc68f5=
b7593aafa6cbbba2d65ec6e1416047 <br>
+SRCREV_structs=3D&quot;4966fc68f5b7593aafa6cbbba2d65ec6e1416047&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/fatih/structs;name=
=3Dstructs;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP=
%7D/src/import/vendor.fetch/github.com/fatih/structs" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/fatih/structs;name=3Dstructs;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com=
/fatih/structs</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/gdamore/encoding" rel=
=3D"noreferrer" target=3D"_blank">github.com/gdamore/encoding</a> v1.0.0<br=
>
+# [1] git ls-remote <a href=3D"https://github.com/gdamore/encoding" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/gdamore/encoding</a> 79c5=
92247a6248468805a0e297f43a7cac979903 <br>
+SRCREV_encoding=3D&quot;79c592247a6248468805a0e297f43a7cac979903&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/gdamore/encoding;nam=
e=3Dencoding;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7B=
BP%7D/src/import/vendor.fetch/github.com/gdamore/encoding" rel=3D"noreferre=
r" target=3D"_blank">github.com/gdamore/encoding;name=3Dencoding;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/gdamore/encoding</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/gogo/protobuf" rel=3D"n=
oreferrer" target=3D"_blank">github.com/gogo/protobuf</a> v1.3.2<br>
+# [1] git ls-remote <a href=3D"https://github.com/gogo/protobuf" rel=3D"no=
referrer" target=3D"_blank">https://github.com/gogo/protobuf</a> b03c65ea87=
cdc3521ede29f62fe3ce239267c1bc <br>
+SRCREV_protobuf=3D&quot;b03c65ea87cdc3521ede29f62fe3ce239267c1bc&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/gogo/protobuf;name=
=3Dprotobuf;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BB=
P%7D/src/import/vendor.fetch/github.com/gogo/protobuf" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/gogo/protobuf;name=3Dprotobuf;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/gogo/protobuf</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/golang/protobuf" rel=3D=
"noreferrer" target=3D"_blank">github.com/golang/protobuf</a> v1.5.2<br>
+# [1] git ls-remote <a href=3D"https://github.com/golang/protobuf" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/golang/protobuf</a> ae9703=
5608a719c7a1c1c41bed0ae0744bdb0c6f <br>
+SRCREV_protobuf1=3D&quot;ae97035608a719c7a1c1c41bed0ae0744bdb0c6f&quot;<br=
>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/golang/protobuf;name=
=3Dprotobuf1;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7B=
BP%7D/src/import/vendor.fetch/github.com/golang/protobuf" rel=3D"noreferrer=
" target=3D"_blank">github.com/golang/protobuf;name=3Dprotobuf1;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/golang/protobuf</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/hashicorp/errwrap" rel=
=3D"noreferrer" target=3D"_blank">github.com/hashicorp/errwrap</a> v1.1.0<b=
r>
+# [1] git ls-remote <a href=3D"https://github.com/hashicorp/errwrap" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/hashicorp/errwrap</a> =
7b00e5db719c64d14dd0caaacbd13e76254d02c0 <br>
+SRCREV_errwrap=3D&quot;7b00e5db719c64d14dd0caaacbd13e76254d02c0&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/hashicorp/errwrap;na=
me=3Derrwrap;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7B=
BP%7D/src/import/vendor.fetch/github.com/hashicorp/errwrap" rel=3D"noreferr=
er" target=3D"_blank">github.com/hashicorp/errwrap;name=3Derrwrap;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/hashicorp/errwrap</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/hashicorp/go-multierror=
" rel=3D"noreferrer" target=3D"_blank">github.com/hashicorp/go-multierror</=
a> v1.1.1<br>
+# [1] git ls-remote <a href=3D"https://github.com/hashicorp/go-multierror"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/hashicorp/go-multi=
error</a> 9974e9ec57696378079ecc3accd3d6f29401b3a0 <br>
+SRCREV_go-multierror=3D&quot;9974e9ec57696378079ecc3accd3d6f29401b3a0&quot=
;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/hashicorp/go-multier=
ror;name=3Dgo-multierror;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWOR=
KDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/hashicorp/go-multierro=
r" rel=3D"noreferrer" target=3D"_blank">github.com/hashicorp/go-multierror;=
name=3Dgo-multierror;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/=
${BP}/src/import/vendor.fetch/github.com/hashicorp/go-multierror</a>&quot;<=
br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/klauspost/cpuid/v2" rel=
=3D"noreferrer" target=3D"_blank">github.com/klauspost/cpuid/v2</a> v2.0.9<=
br>
+# [1] git ls-remote <a href=3D"https://github.com/klauspost/cpuid" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/klauspost/cpuid</a> 6903d4=
066801a7d800d4537ee9eebe81ea97000e <br>
+SRCREV_v212=3D&quot;6903d4066801a7d800d4537ee9eebe81ea97000e&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/klauspost/cpuid;name=
=3Dv212;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D=
/src/import/vendor.fetch/github.com/klauspost/cpuid/v2" rel=3D"noreferrer" =
target=3D"_blank">github.com/klauspost/cpuid;name=3Dv212;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.co=
m/klauspost/cpuid/v2</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/kr/text" rel=3D"norefer=
rer" target=3D"_blank">github.com/kr/text</a> v0.2.0<br>
+# [1] git ls-remote <a href=3D"https://github.com/kr/text" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/kr/text</a> 0e5f52c28dd72ab84daeb8=
1b5a51f20fdc35f9c5 <br>
+SRCREV_text1=3D&quot;0e5f52c28dd72ab84daeb81b5a51f20fdc35f9c5&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/kr/text;name=3Dtext1=
;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/im=
port/vendor.fetch/github.com/kr/text" rel=3D"noreferrer" target=3D"_blank">=
github.com/kr/text;name=3Dtext1;protocol=3Dhttps;nobranch=3D1;destsuffix=3D=
${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/kr/text</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/lestrrat-go/backoff/v2"=
 rel=3D"noreferrer" target=3D"_blank">github.com/lestrrat-go/backoff/v2</a>=
 v2.0.8<br>
+# [1] git ls-remote <a href=3D"https://github.com/lestrrat-go/backoff" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/lestrrat-go/backoff</a=
> c3af762cb9d2bc8339e1d5099a4550366a675f60 <br>
+SRCREV_v2123=3D&quot;c3af762cb9d2bc8339e1d5099a4550366a675f60&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/lestrrat-go/backoff;=
name=3Dv2123;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7B=
BP%7D/src/import/vendor.fetch/github.com/lestrrat-go/backoff/v2" rel=3D"nor=
eferrer" target=3D"_blank">github.com/lestrrat-go/backoff;name=3Dv2123;prot=
ocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.f=
etch/github.com/lestrrat-go/backoff/v2</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/lestrrat-go/blackmagic"=
 rel=3D"noreferrer" target=3D"_blank">github.com/lestrrat-go/blackmagic</a>=
 v1.0.0<br>
+# [1] git ls-remote <a href=3D"https://github.com/lestrrat-go/blackmagic" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/lestrrat-go/blackma=
gic</a> 370527f88bbfd5be3192a38af3148dbd64f0976f <br>
+SRCREV_blackmagic=3D&quot;370527f88bbfd5be3192a38af3148dbd64f0976f&quot;<b=
r>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/lestrrat-go/blackmag=
ic;name=3Dblackmagic;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR=
%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/lestrrat-go/blackmagic" re=
l=3D"noreferrer" target=3D"_blank">github.com/lestrrat-go/blackmagic;name=
=3Dblackmagic;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/s=
rc/import/vendor.fetch/github.com/lestrrat-go/blackmagic</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/lestrrat-go/httpcc" rel=
=3D"noreferrer" target=3D"_blank">github.com/lestrrat-go/httpcc</a> v1.0.0<=
br>
+# [1] git ls-remote <a href=3D"https://github.com/lestrrat-go/httpcc" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/lestrrat-go/httpcc</a>=
 e7e8fea419e32f7549252ad15ecf17f3a3c1a268 <br>
+SRCREV_httpcc=3D&quot;e7e8fea419e32f7549252ad15ecf17f3a3c1a268&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/lestrrat-go/httpcc;n=
ame=3Dhttpcc;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7B=
BP%7D/src/import/vendor.fetch/github.com/lestrrat-go/httpcc" rel=3D"norefer=
rer" target=3D"_blank">github.com/lestrrat-go/httpcc;name=3Dhttpcc;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/lestrrat-go/httpcc</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/lestrrat-go/iter" rel=
=3D"noreferrer" target=3D"_blank">github.com/lestrrat-go/iter</a> v1.0.1<br=
>
+# [1] git ls-remote <a href=3D"https://github.com/lestrrat-go/iter" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/lestrrat-go/iter</a> 6288=
69e97ee3dcc09033086e547a5cab96b0d708 <br>
+SRCREV_iter=3D&quot;628869e97ee3dcc09033086e547a5cab96b0d708&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/lestrrat-go/iter;nam=
e=3Diter;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7=
D/src/import/vendor.fetch/github.com/lestrrat-go/iter" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/lestrrat-go/iter;name=3Diter;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.co=
m/lestrrat-go/iter</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/lestrrat-go/jwx" rel=3D=
"noreferrer" target=3D"_blank">github.com/lestrrat-go/jwx</a> v1.2.14<br>
+# [1] git ls-remote <a href=3D"https://github.com/lestrrat-go/jwx" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/lestrrat-go/jwx</a> de7d9b=
ca43812abc4f630320f8632108ccfe34bf <br>
+SRCREV_jwx=3D&quot;de7d9bca43812abc4f630320f8632108ccfe34bf&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/lestrrat-go/jwx;name=
=3Djwx;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/=
src/import/vendor.fetch/github.com/lestrrat-go/jwx" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/lestrrat-go/jwx;name=3Djwx;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/les=
trrat-go/jwx</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/lestrrat-go/option" rel=
=3D"noreferrer" target=3D"_blank">github.com/lestrrat-go/option</a> v1.0.0<=
br>
+# [1] git ls-remote <a href=3D"https://github.com/lestrrat-go/option" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/lestrrat-go/option</a>=
 7e3467dce320ff45667b138ae503367c92deaa0b <br>
+SRCREV_option=3D&quot;7e3467dce320ff45667b138ae503367c92deaa0b&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/lestrrat-go/option;n=
ame=3Doption;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7B=
BP%7D/src/import/vendor.fetch/github.com/lestrrat-go/option" rel=3D"norefer=
rer" target=3D"_blank">github.com/lestrrat-go/option;name=3Doption;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/lestrrat-go/option</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/lucasb-eyer/go-colorful=
" rel=3D"noreferrer" target=3D"_blank">github.com/lucasb-eyer/go-colorful</=
a> v1.2.0<br>
+# [1] git ls-remote <a href=3D"https://github.com/lucasb-eyer/go-colorful"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/lucasb-eyer/go-col=
orful</a> d2b05a0d83cca9d610425691c3253d5f36d0ad06 <br>
+SRCREV_go-colorful=3D&quot;d2b05a0d83cca9d610425691c3253d5f36d0ad06&quot;<=
br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/lucasb-eyer/go-color=
ful;name=3Dgo-colorful;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKD=
IR%7D/$%7BBP%7D/src/import/vendor.fetch/github.com/lucasb-eyer/go-colorful"=
 rel=3D"noreferrer" target=3D"_blank">github.com/lucasb-eyer/go-colorful;na=
me=3Dgo-colorful;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP=
}/src/import/vendor.fetch/github.com/lucasb-eyer/go-colorful</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/lufia/plan9stats" rel=
=3D"noreferrer" target=3D"_blank">github.com/lufia/plan9stats</a> v0.0.0-20=
211012122336-39d0f177ccd0<br>
+# [1] git ls-remote <a href=3D"https://github.com/lufia/plan9stats" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/lufia/plan9stats</a> 39d0=
f177ccd07bdf5eb6f051ab9b09651f05d6f2 <br>
+SRCREV_plan9stats=3D&quot;39d0f177ccd07bdf5eb6f051ab9b09651f05d6f2&quot;<b=
r>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/lufia/plan9stats;nam=
e=3Dplan9stats;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%=
7BBP%7D/src/import/vendor.fetch/github.com/lufia/plan9stats" rel=3D"norefer=
rer" target=3D"_blank">github.com/lufia/plan9stats;name=3Dplan9stats;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fet=
ch/github.com/lufia/plan9stats</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/mattn/go-colorable" rel=
=3D"noreferrer" target=3D"_blank">github.com/mattn/go-colorable</a> v0.1.12=
<br>
+# [1] git ls-remote <a href=3D"https://github.com/mattn/go-colorable" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/mattn/go-colorable</a>=
 e1bb79c8d53c38a60962ad4b8f658226cc983710 <br>
+SRCREV_go-colorable=3D&quot;e1bb79c8d53c38a60962ad4b8f658226cc983710&quot;=
<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/mattn/go-colorable;n=
ame=3Dgo-colorable;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7=
D/$%7BBP%7D/src/import/vendor.fetch/github.com/mattn/go-colorable" rel=3D"n=
oreferrer" target=3D"_blank">github.com/mattn/go-colorable;name=3Dgo-colora=
ble;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/=
vendor.fetch/github.com/mattn/go-colorable</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/mattn/go-runewidth" rel=
=3D"noreferrer" target=3D"_blank">github.com/mattn/go-runewidth</a> v0.0.13=
<br>
+# [1] git ls-remote <a href=3D"https://github.com/mattn/go-runewidth" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/mattn/go-runewidth</a>=
 df1ff59654317c1b5a3f860ffc47402931932104 <br>
+SRCREV_go-runewidth=3D&quot;df1ff59654317c1b5a3f860ffc47402931932104&quot;=
<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/mattn/go-runewidth;n=
ame=3Dgo-runewidth;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7=
D/$%7BBP%7D/src/import/vendor.fetch/github.com/mattn/go-runewidth" rel=3D"n=
oreferrer" target=3D"_blank">github.com/mattn/go-runewidth;name=3Dgo-runewi=
dth;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/=
vendor.fetch/github.com/mattn/go-runewidth</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/matttproud/golang_proto=
buf_extensions" rel=3D"noreferrer" target=3D"_blank">github.com/matttproud/=
golang_protobuf_extensions</a> v1.0.1<br>
+# [1] git ls-remote <a href=3D"https://github.com/matttproud/golang_protob=
uf_extensions" rel=3D"noreferrer" target=3D"_blank">https://github.com/matt=
tproud/golang_protobuf_extensions</a> c12348ce28de40eed0136aa2b644d0ee0650e=
56c <br>
+SRCREV_golang_protobuf_extensions=3D&quot;c12348ce28de40eed0136aa2b644d0ee=
0650e56c&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/matttproud/golang_pr=
otobuf_extensions;name=3Dgolang_protobuf_extensions;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/github=
.com/matttproud/golang_protobuf_extensions" rel=3D"noreferrer" target=3D"_b=
lank">github.com/matttproud/golang_protobuf_extensions;name=3Dgolang_protob=
uf_extensions;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/s=
rc/import/vendor.fetch/github.com/matttproud/golang_protobuf_extensions</a>=
&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/modern-go/concurrent" r=
el=3D"noreferrer" target=3D"_blank">github.com/modern-go/concurrent</a> v0.=
0.0-20180306012644-bacd9c7ef1dd<br>
+# [1] git ls-remote <a href=3D"https://github.com/modern-go/concurrent" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/modern-go/concurrent<=
/a> bacd9c7ef1dd9b15be4a9909b8ac7a4e313eec94 <br>
+SRCREV_concurrent=3D&quot;bacd9c7ef1dd9b15be4a9909b8ac7a4e313eec94&quot;<b=
r>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/modern-go/concurrent=
;name=3Dconcurrent;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7=
D/$%7BBP%7D/src/import/vendor.fetch/github.com/modern-go/concurrent" rel=3D=
"noreferrer" target=3D"_blank">github.com/modern-go/concurrent;name=3Dconcu=
rrent;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/impor=
t/vendor.fetch/github.com/modern-go/concurrent</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/modern-go/reflect2" rel=
=3D"noreferrer" target=3D"_blank">github.com/modern-go/reflect2</a> v1.0.2<=
br>
+# [1] git ls-remote <a href=3D"https://github.com/modern-go/reflect2" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/modern-go/reflect2</a>=
 2b33151c9bbc5231aea69b8861c540102b087070 <br>
+SRCREV_reflect2=3D&quot;2b33151c9bbc5231aea69b8861c540102b087070&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/modern-go/reflect2;n=
ame=3Dreflect2;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%=
7BBP%7D/src/import/vendor.fetch/github.com/modern-go/reflect2" rel=3D"noref=
errer" target=3D"_blank">github.com/modern-go/reflect2;name=3Dreflect2;prot=
ocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.f=
etch/github.com/modern-go/reflect2</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/muesli/ansi" rel=3D"nor=
eferrer" target=3D"_blank">github.com/muesli/ansi</a> v0.0.0-20211018074035=
-2e021307bc4b<br>
+# [1] git ls-remote <a href=3D"https://github.com/muesli/ansi" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/muesli/ansi</a> 2e021307bc4b4f=
4766c3fb4faf6030b13dc9ec51 <br>
+SRCREV_ansi=3D&quot;2e021307bc4b4f4766c3fb4faf6030b13dc9ec51&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/muesli/ansi;name=3Da=
nsi;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src=
/import/vendor.fetch/github.com/muesli/ansi" rel=3D"noreferrer" target=3D"_=
blank">github.com/muesli/ansi;name=3Dansi;protocol=3Dhttps;nobranch=3D1;des=
tsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/muesli/ansi</=
a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/muesli/reflow" rel=3D"n=
oreferrer" target=3D"_blank">github.com/muesli/reflow</a> v0.3.0<br>
+# [1] git ls-remote <a href=3D"https://github.com/muesli/reflow" rel=3D"no=
referrer" target=3D"_blank">https://github.com/muesli/reflow</a> 602e329532=
049c9e33fa8c74e352a46fb9486947 <br>
+SRCREV_reflow=3D&quot;602e329532049c9e33fa8c74e352a46fb9486947&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/muesli/reflow;name=
=3Dreflow;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%=
7D/src/import/vendor.fetch/github.com/muesli/reflow" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/muesli/reflow;name=3Dreflow;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/m=
uesli/reflow</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/muesli/termenv" rel=3D"=
noreferrer" target=3D"_blank">github.com/muesli/termenv</a> v0.11.1-0.20220=
204035834-5ac8409525e0<br>
+# [1] git ls-remote <a href=3D"https://github.com/muesli/termenv" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/muesli/termenv</a> 5ac84095=
25e03ee6cd96daeae32d47902b88f32a <br>
+SRCREV_termenv=3D&quot;5ac8409525e03ee6cd96daeae32d47902b88f32a&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/muesli/termenv;name=
=3Dtermenv;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP=
%7D/src/import/vendor.fetch/github.com/muesli/termenv" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/muesli/termenv;name=3Dtermenv;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/muesli/termenv</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/niemeyer/pretty" rel=3D=
"noreferrer" target=3D"_blank">github.com/niemeyer/pretty</a> v0.0.0-202002=
27124842-a10e7caefd8e<br>
+# [1] git ls-remote <a href=3D"https://github.com/niemeyer/pretty" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/niemeyer/pretty</a> a10e7c=
aefd8e0d600cea437f5c3613aeb1553d56 <br>
+SRCREV_pretty=3D&quot;a10e7caefd8e0d600cea437f5c3613aeb1553d56&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/niemeyer/pretty;name=
=3Dpretty;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%=
7D/src/import/vendor.fetch/github.com/niemeyer/pretty" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/niemeyer/pretty;name=3Dpretty;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/niemeyer/pretty</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/philhofer/fwd" rel=3D"n=
oreferrer" target=3D"_blank">github.com/philhofer/fwd</a> v1.1.1<br>
+# [1] git ls-remote <a href=3D"https://github.com/philhofer/fwd" rel=3D"no=
referrer" target=3D"_blank">https://github.com/philhofer/fwd</a> 9bcb9cab1b=
0394d8516a132ec243ba944efdb644 <br>
+SRCREV_fwd=3D&quot;9bcb9cab1b0394d8516a132ec243ba944efdb644&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/philhofer/fwd;name=
=3Dfwd;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/=
src/import/vendor.fetch/github.com/philhofer/fwd" rel=3D"noreferrer" target=
=3D"_blank">github.com/philhofer/fwd;name=3Dfwd;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/philh=
ofer/fwd</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/pkg/errors" rel=3D"nore=
ferrer" target=3D"_blank">github.com/pkg/errors</a> v0.9.1<br>
+# [1] git ls-remote <a href=3D"https://github.com/pkg/errors" rel=3D"noref=
errer" target=3D"_blank">https://github.com/pkg/errors</a> 614d223910a179a4=
66c1767a985424175c39b465 <br>
+SRCREV_errors=3D&quot;614d223910a179a466c1767a985424175c39b465&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/pkg/errors;name=3Der=
rors;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/sr=
c/import/vendor.fetch/github.com/pkg/errors" rel=3D"noreferrer" target=3D"_=
blank">github.com/pkg/errors;name=3Derrors;protocol=3Dhttps;nobranch=3D1;de=
stsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/pkg/errors</=
a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/power-devops/perfstat" =
rel=3D"noreferrer" target=3D"_blank">github.com/power-devops/perfstat</a> v=
0.0.0-20210106213030-5aafc221ea8c<br>
+# [1] git ls-remote <a href=3D"https://github.com/power-devops/perfstat" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/power-devops/perfsta=
t</a> 5aafc221ea8c1ff54b0835cbd5f2386a8410be11 <br>
+SRCREV_perfstat=3D&quot;5aafc221ea8c1ff54b0835cbd5f2386a8410be11&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/power-devops/perfsta=
t;name=3Dperfstat;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D=
/$%7BBP%7D/src/import/vendor.fetch/github.com/power-devops/perfstat" rel=3D=
"noreferrer" target=3D"_blank">github.com/power-devops/perfstat;name=3Dperf=
stat;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import=
/vendor.fetch/github.com/power-devops/perfstat</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/prometheus/common" rel=
=3D"noreferrer" target=3D"_blank">github.com/prometheus/common</a> v0.33.0<=
br>
+# [1] git ls-remote <a href=3D"https://github.com/prometheus/common" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/prometheus/common</a> =
63e75f51cd2368130efbd51b95a4e457e64b444e <br>
+SRCREV_common=3D&quot;63e75f51cd2368130efbd51b95a4e457e64b444e&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/prometheus/common;na=
me=3Dcommon;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BB=
P%7D/src/import/vendor.fetch/github.com/prometheus/common" rel=3D"noreferre=
r" target=3D"_blank">github.com/prometheus/common;name=3Dcommon;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/prometheus/common</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/prometheus/procfs" rel=
=3D"noreferrer" target=3D"_blank">github.com/prometheus/procfs</a> v0.7.3<b=
r>
+# [1] git ls-remote <a href=3D"https://github.com/prometheus/procfs" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/prometheus/procfs</a> =
f436cbb89ece38bf080d446b3ca27053b305eaac <br>
+SRCREV_procfs=3D&quot;f436cbb89ece38bf080d446b3ca27053b305eaac&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/prometheus/procfs;na=
me=3Dprocfs;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BB=
P%7D/src/import/vendor.fetch/github.com/prometheus/procfs" rel=3D"noreferre=
r" target=3D"_blank">github.com/prometheus/procfs;name=3Dprocfs;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/prometheus/procfs</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/rivo/uniseg" rel=3D"nor=
eferrer" target=3D"_blank">github.com/rivo/uniseg</a> v0.2.0<br>
+# [1] git ls-remote <a href=3D"https://github.com/rivo/uniseg" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/rivo/uniseg</a> 75711fccf6a3e8=
5bc74c241e2dddd06a9bc9e53d <br>
+SRCREV_uniseg=3D&quot;75711fccf6a3e85bc74c241e2dddd06a9bc9e53d&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/rivo/uniseg;name=3Du=
niseg;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/s=
rc/import/vendor.fetch/github.com/rivo/uniseg" rel=3D"noreferrer" target=3D=
"_blank">github.com/rivo/uniseg;name=3Duniseg;protocol=3Dhttps;nobranch=3D1=
;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/rivo/unis=
eg</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/sirupsen/logrus" rel=3D=
"noreferrer" target=3D"_blank">github.com/sirupsen/logrus</a> v1.8.1<br>
+# [1] git ls-remote <a href=3D"https://github.com/sirupsen/logrus" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/sirupsen/logrus</a> bdc0db=
8ead3853c56b7cd1ac2ba4e11b47d7da6b <br>
+SRCREV_logrus=3D&quot;bdc0db8ead3853c56b7cd1ac2ba4e11b47d7da6b&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/sirupsen/logrus;name=
=3Dlogrus;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%=
7D/src/import/vendor.fetch/github.com/sirupsen/logrus" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/sirupsen/logrus;name=3Dlogrus;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/sirupsen/logrus</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/tidwall/match" rel=3D"n=
oreferrer" target=3D"_blank">github.com/tidwall/match</a> v1.1.1<br>
+# [1] git ls-remote <a href=3D"https://github.com/tidwall/match" rel=3D"no=
referrer" target=3D"_blank">https://github.com/tidwall/match</a> 4c9fc61b49=
3b7aa0a3d347e9190aa78c5bec09cf <br>
+SRCREV_match=3D&quot;4c9fc61b493b7aa0a3d347e9190aa78c5bec09cf&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/tidwall/match;name=
=3Dmatch;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7=
D/src/import/vendor.fetch/github.com/tidwall/match" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/tidwall/match;name=3Dmatch;protocol=3Dhttps;nobran=
ch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/tid=
wall/match</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/tidwall/pretty" rel=3D"=
noreferrer" target=3D"_blank">github.com/tidwall/pretty</a> v1.2.0<br>
+# [1] git ls-remote <a href=3D"https://github.com/tidwall/pretty" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/tidwall/pretty</a> aaa765e7=
476acb0028a854b85675801362cbdaa2 <br>
+SRCREV_pretty1=3D&quot;aaa765e7476acb0028a854b85675801362cbdaa2&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/tidwall/pretty;name=
=3Dpretty1;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP=
%7D/src/import/vendor.fetch/github.com/tidwall/pretty" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/tidwall/pretty;name=3Dpretty1;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/tidwall/pretty</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/tklauser/go-sysconf" re=
l=3D"noreferrer" target=3D"_blank">github.com/tklauser/go-sysconf</a> v0.3.=
9<br>
+# [1] git ls-remote <a href=3D"https://github.com/tklauser/go-sysconf" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/tklauser/go-sysconf</a=
> 746b19d14e19d242c2daa08e0d645c19832c1939 <br>
+SRCREV_go-sysconf=3D&quot;746b19d14e19d242c2daa08e0d645c19832c1939&quot;<b=
r>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/tklauser/go-sysconf;=
name=3Dgo-sysconf;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D=
/$%7BBP%7D/src/import/vendor.fetch/github.com/tklauser/go-sysconf" rel=3D"n=
oreferrer" target=3D"_blank">github.com/tklauser/go-sysconf;name=3Dgo-sysco=
nf;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/v=
endor.fetch/github.com/tklauser/go-sysconf</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/tklauser/numcpus" rel=
=3D"noreferrer" target=3D"_blank">github.com/tklauser/numcpus</a> v0.3.0<br=
>
+# [1] git ls-remote <a href=3D"https://github.com/tklauser/numcpus" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/tklauser/numcpus</a> cc3f=
dd5f3955d53d50d94380963bddd24bd373e2 <br>
+SRCREV_numcpus=3D&quot;cc3fdd5f3955d53d50d94380963bddd24bd373e2&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/tklauser/numcpus;nam=
e=3Dnumcpus;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BB=
P%7D/src/import/vendor.fetch/github.com/tklauser/numcpus" rel=3D"noreferrer=
" target=3D"_blank">github.com/tklauser/numcpus;name=3Dnumcpus;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/git=
hub.com/tklauser/numcpus</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://github.com/yusufpapurcu/wmi" rel=
=3D"noreferrer" target=3D"_blank">github.com/yusufpapurcu/wmi</a> v1.2.2<br=
>
+# [1] git ls-remote <a href=3D"https://github.com/yusufpapurcu/wmi" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/yusufpapurcu/wmi</a> 253c=
5f0cb35e666c4c0fc42083824e7c89f0cc8d <br>
+SRCREV_wmi=3D&quot;253c5f0cb35e666c4c0fc42083824e7c89f0cc8d&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/yusufpapurcu/wmi;nam=
e=3Dwmi;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D=
/src/import/vendor.fetch/github.com/yusufpapurcu/wmi" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/yusufpapurcu/wmi;name=3Dwmi;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/=
yusufpapurcu/wmi</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://go.etcd.io/etcd/api/v3" rel=3D"nor=
eferrer" target=3D"_blank">go.etcd.io/etcd/api/v3</a> v3.5.2<br>
+# [1] git ls-remote <a href=3D"https://github.com/etcd-io/etcd" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/etcd-io/etcd</a> 4591a096d4d3=
c08e577d7269851938db0c1da3d4 <br>
+SRCREV_v31=3D&quot;4591a096d4d3c08e577d7269851938db0c1da3d4&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/etcd-io/etcd;name=3D=
v31;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src=
/import/vendor.fetch/github.com/etcd-io/etcd/api/v3" rel=3D"noreferrer" tar=
get=3D"_blank">github.com/etcd-io/etcd;name=3Dv31;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/etcd-=
io/etcd/api/v3</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://go.uber.org/atomic" rel=3D"norefer=
rer" target=3D"_blank">go.uber.org/atomic</a> v1.9.0<br>
+# [1] git ls-remote <a href=3D"https://github.com/uber-go/atomic" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/uber-go/atomic</a> 135466e2=
d0c8f8adf4d37dc757e3df0ebdd0dfe8 <br>
+SRCREV_atomic=3D&quot;135466e2d0c8f8adf4d37dc757e3df0ebdd0dfe8&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/uber-go/atomic;name=
=3Datomic;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%=
7D/src/import/vendor.fetch/go.uber.org/atomic" rel=3D"noreferrer" target=3D=
"_blank">github.com/uber-go/atomic;name=3Datomic;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.uber.org/atom=
ic</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://go.uber.org/multierr" rel=3D"noref=
errer" target=3D"_blank">go.uber.org/multierr</a> v1.7.0<br>
+# [1] git ls-remote <a href=3D"https://github.com/uber-go/multierr" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/uber-go/multierr</a> 19d9=
fff1d3b66750a134671435786579bc994737 <br>
+SRCREV_multierr=3D&quot;19d9fff1d3b66750a134671435786579bc994737&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/uber-go/multierr;nam=
e=3Dmultierr;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7B=
BP%7D/src/import/vendor.fetch/go.uber.org/multierr" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/uber-go/multierr;name=3Dmultierr;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.uber.=
org/multierr</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://go.uber.org/zap" rel=3D"noreferrer=
" target=3D"_blank">go.uber.org/zap</a> v1.19.1<br>
+# [1] git ls-remote <a href=3D"https://github.com/uber-go/zap" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/uber-go/zap</a> 2f61e97148e69c=
d2dd1902b03e89ce07cd1218a1 <br>
+SRCREV_zap=3D&quot;2f61e97148e69cd2dd1902b03e89ce07cd1218a1&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/uber-go/zap;name=3Dz=
ap;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/=
import/vendor.fetch/go.uber.org/zap" rel=3D"noreferrer" target=3D"_blank">g=
ithub.com/uber-go/zap;name=3Dzap;protocol=3Dhttps;nobranch=3D1;destsuffix=
=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.uber.org/zap</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://golang.org/x/sync" rel=3D"noreferr=
er" target=3D"_blank">golang.org/x/sync</a> v0.0.0-20210220032951-036812b2e=
83c<br>
+# [1] git ls-remote <a href=3D"https://go.googlesource.com/sync" rel=3D"no=
referrer" target=3D"_blank">https://go.googlesource.com/sync</a> 036812b2e8=
3c0ddf193dd5a34e034151da389d09 <br>
+SRCREV_sync=3D&quot;036812b2e83c0ddf193dd5a34e034151da389d09&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.com/sync;name=
=3Dsync;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D=
/src/import/vendor.fetch/go.googlesource.com/sync" rel=3D"noreferrer" targe=
t=3D"_blank">go.googlesource.com/sync;name=3Dsync;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.googlesource.=
com/sync</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://golang.org/x/sys" rel=3D"noreferre=
r" target=3D"_blank">golang.org/x/sys</a> v0.0.0-20220412211240-33da011f77a=
d<br>
+# [1] git ls-remote <a href=3D"https://go.googlesource.com/sys" rel=3D"nor=
eferrer" target=3D"_blank">https://go.googlesource.com/sys</a> 33da011f77ad=
e50ff5b6a6fb4a9a1e6d6b285809 <br>
+SRCREV_sys=3D&quot;33da011f77ade50ff5b6a6fb4a9a1e6d6b285809&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://go.googlesource.com/sys;name=3D=
sys;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src=
/import/vendor.fetch/go.googlesource.com/sys" rel=3D"noreferrer" target=3D"=
_blank">go.googlesource.com/sys;name=3Dsys;protocol=3Dhttps;nobranch=3D1;de=
stsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.googlesource.com/sys=
</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://google.golang.org/genproto" rel=3D=
"noreferrer" target=3D"_blank">google.golang.org/genproto</a> v0.0.0-202112=
23182754-3ac035c7e7cb<br>
+# [1] git ls-remote <a href=3D"https://github.com/googleapis/go-genproto" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/googleapis/go-genpr=
oto</a> 3ac035c7e7cbd86eb6d8b95be888cf83d73dedd3 <br>
+SRCREV_genproto=3D&quot;3ac035c7e7cbd86eb6d8b95be888cf83d73dedd3&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/googleapis/go-genpro=
to;name=3Dgenproto;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7=
D/$%7BBP%7D/src/import/vendor.fetch/google.golang.org/genproto" rel=3D"nore=
ferrer" target=3D"_blank">github.com/googleapis/go-genproto;name=3Dgenproto=
;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/ven=
dor.fetch/google.golang.org/genproto</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://google.golang.org/grpc" rel=3D"nor=
eferrer" target=3D"_blank">google.golang.org/grpc</a> v1.43.0<br>
+# [1] git ls-remote <a href=3D"https://github.com/grpc/grpc-go" rel=3D"nor=
eferrer" target=3D"_blank">https://github.com/grpc/grpc-go</a> 14c11384b76b=
67f7b1b32a5d18f865762634c0ae <br>
+SRCREV_grpc=3D&quot;14c11384b76b67f7b1b32a5d18f865762634c0ae&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/grpc/grpc-go;name=3D=
grpc;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/sr=
c/import/vendor.fetch/google.golang.org/grpc" rel=3D"noreferrer" target=3D"=
_blank">github.com/grpc/grpc-go;name=3Dgrpc;protocol=3Dhttps;nobranch=3D1;d=
estsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/google.golang.org/grpc=
</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://google.golang.org/protobuf" rel=3D=
"noreferrer" target=3D"_blank">google.golang.org/protobuf</a> v1.27.1<br>
+# [1] git ls-remote <a href=3D"https://github.com/protocolbuffers/protobuf=
-go" rel=3D"noreferrer" target=3D"_blank">https://github.com/protocolbuffer=
s/protobuf-go</a> b92717ecb630d4a4824b372bf98c729d87311a4d <br>
+SRCREV_protobuf12=3D&quot;b92717ecb630d4a4824b372bf98c729d87311a4d&quot;<b=
r>
+SRC_URI +=3D &quot;git://<a href=3D"http://github.com/protocolbuffers/prot=
obuf-go;name=3Dprotobuf12;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWO=
RKDIR%7D/$%7BBP%7D/src/import/vendor.fetch/google.golang.org/protobuf" rel=
=3D"noreferrer" target=3D"_blank">github.com/protocolbuffers/protobuf-go;na=
me=3Dprotobuf12;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}=
/src/import/vendor.fetch/google.golang.org/protobuf</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://gopkg.in/ini.v1" rel=3D"noreferrer=
" target=3D"_blank">gopkg.in/ini.v1</a> v1.66.3<br>
+# [1] git ls-remote <a href=3D"https://gopkg.in/ini.v1" rel=3D"noreferrer"=
 target=3D"_blank">https://gopkg.in/ini.v1</a> fcd6cc399e588727c1231f4ea187=
d1b963536bcc <br>
+SRCREV_ini.v1=3D&quot;fcd6cc399e588727c1231f4ea187d1b963536bcc&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://gopkg.in/ini.v1;name=3Dini.v1;p=
rotocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/impo=
rt/vendor.fetch/gopkg.in/ini.v1" rel=3D"noreferrer" target=3D"_blank">gopkg=
.in/ini.v1;name=3Dini.v1;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKD=
IR}/${BP}/src/import/vendor.fetch/gopkg.in/ini.v1</a>&quot;<br>
+<br>
+#=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://gopkg.in/yaml.v3" rel=3D"noreferre=
r" target=3D"_blank">gopkg.in/yaml.v3</a> v3.0.1<br>
+# [1] git ls-remote <a href=3D"https://gopkg.in/yaml.v3" rel=3D"noreferrer=
" target=3D"_blank">https://gopkg.in/yaml.v3</a> f6f7691b1fdeb513f56608cd2c=
32c51f8194bf51 <br>
+SRCREV_yaml.v3=3D&quot;f6f7691b1fdeb513f56608cd2c32c51f8194bf51&quot;<br>
+SRC_URI +=3D &quot;git://<a href=3D"http://gopkg.in/yaml.v3;name=3Dyaml.v3=
;protocol=3Dhttps;nobranch=3D1;destsuffix=3D$%7BWORKDIR%7D/$%7BBP%7D/src/im=
port/vendor.fetch/gopkg.in/yaml.v3" rel=3D"noreferrer" target=3D"_blank">go=
pkg.in/yaml.v3;name=3Dyaml.v3;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${=
WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/yaml.v3</a>&quot;<br>
-- <br>
2.33.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#99423): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/99423" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/99423</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94744076/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/94744076/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000b35af905fcbd8e4c--

