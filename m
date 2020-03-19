Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id CA8DD60203
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Mar 2020 04:13:58 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id p6so1239944qkm.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 21:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=uEYY8gg54/XClraeiFNWSS1zQyPbOL7CiEP6w8Y1j5E=;
	b=E6YneAvwiFRnw39qRDwotSAt6ojL7aKWOKTBzRNDmSdCiXwRdFGzDi7jpuI6go2t0t
	o5Sf0thi01oXq3LyGBJqYBC+X76TpNiQFc2ibOeSGSkUkYZlEo8a4joLZU3ci1zNwcWy
	LGxTkY3sQn9jeHOQ8d5YQC2f23jBxTyP5EMPKgejXQcnPXvcYM2qbETnhGC5gNFE0nkU
	lbuaTkkjFQMEXxQqqm7UD4cKs6YyU9CfLGHOlP+aRGF95VCmWc+tC8OmTVH0kT57FfEt
	7egncIVt8NSH56bOhE42R936ruFbT9wkEehtTa3qjSfV1HIURQKT/nZyh27kOJSY7pl2
	aC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=uEYY8gg54/XClraeiFNWSS1zQyPbOL7CiEP6w8Y1j5E=;
	b=pm3F2rn5o98qoU9UN/scc15Lfg4KJ0e8VohszJvFWa+uxs619mp5Sa1TIVi1dUpGlT
	pkRVzHmKhI5UQSz5A2b7edxM4zY/MDckTblmvcWCFOov8TCWjSgnpqrBILlhKw+xwKNq
	wJkKMHz+Pq3gDD31A7zBUgileWz/qQD+U6JFepqCQR6Ap2nA56tRb/f+oZeVSLAPqLXI
	7CF66p3PUhSDo7RnTkffnmO7V108MebgLzwLHONtPO7QfuM89ywSBBL/xb+uCgzFfls6
	CEYMBaqDjtdYAN7zLJUj8bq9HAyv8WwrCdWQBuky7BULT4aA6KlbPdRQ9eQHxkiRok00
	zLFw==
X-Gm-Message-State: ANhLgQ28Shlt8+hTo3gnxGRkeTAfNNisu8MF7V02vql/rvPvsnnqSRlu
	J2zSGJ1H5ER6AIBFmMZdAMUmRs8QN+9W4gpL51Q=
X-Google-Smtp-Source: ADFU+vtVjpUSew2XGS/A6hKBubf11VTYhOkqcFq/UI7la8WsN207aDLAKq0MTyW7rceyk0dQAYWtSRY1PZxhpzGBY1o=
X-Received: by 2002:a37:e47:: with SMTP id 68mr1126017qko.17.1584591239402;
	Wed, 18 Mar 2020 21:13:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200318204411.12996-1-schnitzeltony@gmail.com>
	<20200318204411.12996-4-schnitzeltony@gmail.com>
In-Reply-To: <20200318204411.12996-4-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 Mar 2020 21:13:32 -0700
Message-ID: <CAMKF1sobKhs8spp7UY-dny3nZQtKLS3BMOTNR9q6updeaLSuLA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 4/5] networkmanager-openvpn: Make PACKAGECONFIG gnome work
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Mar 2020 04:14:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2020 at 1:45 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../networkmanager/networkmanager-openvpn_1.8.12.bb | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager-openvpn_1.8.12.bb b/meta-networking/recipes-connectivity/networkmana=
ger/networkmanager-openvpn_1.8.12.bb
> index 5e246a85b..d455a0f06 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-=
openvpn_1.8.12.bb
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-=
openvpn_1.8.12.bb
> @@ -15,7 +15,18 @@ SRC_URI[sha256sum] =3D "0efda8878aaf0e6eb5071a053aea5d=
7f9d42aac097b3ff89e7cbc9233f
>
>  S =3D "${WORKDIR}/NetworkManager-openvpn-${PV}"
>
> -PACKAGECONFIG[gnome] =3D "--with-gnome,--without-gnome"
> +# meta-gnome in layers is required using gnome:
> +PACKAGECONFIG[gnome] =3D "--with-gnome,--without-gnome,gtk+3 libnma libs=
ecret"
> +
> +do_configure_append() {
> +    # network-manager-openvpn.metainfo.xml is created in source folder b=
ut
> +    # compile expects it in build folder. As long as nobody comes up wit=
h a
> +    # better solution just support build:
> +    if [ -e ${S}/appdata/network-manager-openvpn.metainfo.xml ]; then
> +        mkdir -p ${B}/appdata
> +        cp -f ${S}/appdata/network-manager-openvpn.metainfo.xml ${B}/app=
data/

perhaps use install -Dm 0644 here

> +    fi
> +}
>
>  do_install_append () {
>      rm -rf ${D}${libdir}/NetworkManager/*.la
> --
> 2.21.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

