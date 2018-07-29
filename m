Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id A5C40745A5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Jul 2018 21:50:25 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id y5-v6so10209657qti.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Jul 2018 14:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8tfjdD146M8bAh5+CifjzwYGbH/jt+4sdz6NLNAahfw=;
	b=YJxn1FLSb3wO5tpR+f4u72Tcf4YaggScJe1aYiXcClu878sNC9nwT4hqkEWRQip+xv
	DvKzy0BXdzNGE2Ce/sxxVAVoT4hJf8BaHMe5FXLSjX3Y6/UrTfsZYO1CpN2vTysFcs9Z
	fszGFwF7N8eXHR/o6nDC3RR+Ghep+sX4iyhY0o7Ps2V6XLVy+UU6Kmn5fc0A+4lc739u
	QZ3RaROW1e9Az850n2DpMVjWJiwlOL0RYECEU+46rBoTVxd1Pus7ilZOzMStFzroncsy
	j4wx5SBTDKnVQESuy/GN8Lr7LXiBZ8xForXpGWxSUMhFGt3VNzgy9+qicQC3Z53Kmout
	i7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8tfjdD146M8bAh5+CifjzwYGbH/jt+4sdz6NLNAahfw=;
	b=ZH4yYwnFNwv9jz6hamzZKZ+vCp0ngiNd9/Jn0tD6bioZAbRuwrzv+78gPrNv3uX26B
	D6puiMEOlxivroAxYcjIJ/adS6pAJTIdaZrJmtVH80Xnop13di1DJkEDkNNJqPldz6sz
	Nia/rsqEEZ/FUply9ABoSFPuvDxIMZcs1alyNSFnIxEWHKgIKuhkC6cv1aRUE6cap2J6
	yzHLRuYqRx2OCet6UFO7R2ZfooJ2PwZBqRRwwKVVIrIYHnt7dNt81bG5L1faqYNklEpA
	0WgGbWWpKen2tx/UzZ3qvHqL9TsTTNpixlVwPAT81SaZL1hVrc6OIUP1pQ4XwyiRqCv6
	w21A==
X-Gm-Message-State: AOUpUlFXxRAP+e2E55O5NZIGmMgPCUkOM9AOV5WVQKKWdh7Qytl5pKi5
	TaGHNmetXpO5NeT+Gvirf/upcIL0lQyUSo2Hg3U=
X-Google-Smtp-Source: AAOMgpeblisNcNU3koE4Dyl0D8n3ofqQJk2Wfor+XykK8QYtFS/RA8BCacekFnAckZgxnr2h/nePJwCgwfPaZN3qehA=
X-Received: by 2002:ac8:25f1:: with SMTP id
	f46-v6mr14799587qtf.20.1532901026307; 
	Sun, 29 Jul 2018 14:50:26 -0700 (PDT)
MIME-Version: 1.0
References: <1532882465-3210-1-git-send-email-akuster808@gmail.com>
In-Reply-To: <1532882465-3210-1-git-send-email-akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 29 Jul 2018 14:50:15 -0700
Message-ID: <CAMKF1spEi6G+gJMo1Wd-EpaY=-+KokOBcKjgjQp8ND7WOipwhg@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][v3][PATCH] wireshark: update to 2.6.2
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
X-List-Received-Date: Sun, 29 Jul 2018 21:50:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Can you also validate if it=E2=80=99s building ok on musl

On Sun, Jul 29, 2018 at 9:41 AM Armin Kuster <akuster808@gmail.com> wrote:

> [v3]
> Get  wireshark-gtk building again
> split tshark, wireshark-gtk into their own pkgs
>
> [v2]
> Fix native build, lemon is the only one needed natively
>
> [v1]
> includes security fixes:
>
> wnpa-sec-2018-34 BGP dissector large loop. Bug 13741. CVE-2018-14342.
> wnpa-sec-2018-35 ISMP dissector crash. Bug 14672. CVE-2018-14344.
> wnpa-sec-2018-36 Multiple dissectors could crash. Bug 14675.
> CVE-2018-14340.
> wnpa-sec-2018-37 ASN.1 BER dissector crash. Bug 14682. CVE-2018-14343.
> wnpa-sec-2018-38 MMSE dissector infinite loop. Bug 14738. CVE-2018-14339.
> wnpa-sec-2018-39 DICOM dissector crash. Bug 14742. CVE-2018-14341.
> wnpa-sec-2018-40 Bazaar dissector infinite loop. Bug 14841. CVE-2018-1436=
8.
> wnpa-sec-2018-41 HTTP2 dissector crash. Bug 14869. CVE-2018-14369.
> wnpa-sec-2018-42 CoAP dissector crash. Bug 14966. CVE-2018-14367.
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../{wireshark_2.6.1.bb =3D> wireshark_2.6.2.bb}     | 34
> +++++++++++++++-------
>  1 file changed, 24 insertions(+), 10 deletions(-)
>  rename meta-networking/recipes-support/wireshark/{wireshark_2.6.1.bb =3D=
>
> wireshark_2.6.2.bb} (70%)
>
> diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.6.1.bb
> b/meta-networking/recipes-support/wireshark/wireshark_2.6.2.bb
> similarity index 70%
> rename from meta-networking/recipes-support/wireshark/wireshark_2.6.1.bb
> rename to meta-networking/recipes-support/wireshark/wireshark_2.6.2.bb
> index 91c5e96..1735ae7 100644
> --- a/meta-networking/recipes-support/wireshark/wireshark_2.6.1.bb
> +++ b/meta-networking/recipes-support/wireshark/wireshark_2.6.2.bb
> @@ -14,8 +14,8 @@ SRC_URI =3D "
> https://1.as.dl.wireshark.org/src/${BP}.tar.xz \
>
>  UPSTREAM_CHECK_URI =3D "https://1.as.dl.wireshark.org/src"
>
> -SRC_URI[md5sum] =3D "b0e9e5fe22e96d9fdfad18f750fa8f55"
> -SRC_URI[sha256sum] =3D
> "ab6e5bbc3464c956347b8671ce8397950ad5daff3bf9964c967d495f4ddbcd88"
> +SRC_URI[md5sum] =3D "086d235509717190d06554b2ab870209"
> +SRC_URI[sha256sum] =3D
> "49b2895ee3ba17ef9ef0aebfdc4d32a778e0f36ccadde184516557d5f3357094"
>
>  PE =3D "1"
>
> @@ -23,8 +23,11 @@ inherit cmake pkgconfig pythonnative perlnative
> upstream-version-is-even
>
>  ARM_INSTRUCTION_SET =3D "arm"
>
> +# Options: gtk+, gtk+3 and qt5
> +GTK =3D "gtk+3"
> +
>  PACKAGECONFIG ?=3D "libpcap gnutls libnl libcap sbc"
> -PACKAGECONFIG_append_class-target =3D "
> ${@bb.utils.contains("DISTRO_FEATURES", "x11", " gtk3 graphics ", "", d)}=
"
> +PACKAGECONFIG_append_class-target =3D "
> ${@bb.utils.contains("DISTRO_FEATURES", "x11", " ${GTK}", "", d)}"
>
>  PACKAGECONFIG_class-native =3D "libpcap gnutls ssl libssh"
>
> @@ -33,10 +36,8 @@ PACKAGECONFIG[libpcap] =3D
> "-DENABLE_PCAP=3DON,-DENABLE_PCAP=3DOFF -DENABLE_PCAP_NG_DE
>  PACKAGECONFIG[libsmi] =3D "-DENABLE_SMI=3DON,-DENABLE_SMI=3DOFF,libsmi"
>  PACKAGECONFIG[libnl] =3D ",,libnl"
>  PACKAGECONFIG[portaudio] =3D "-DENABLE_PORTAUDIO=3DON,-DENABLE_PORTAUDIO=
=3DOFF,
> portaudio-v19"
> -PACKAGECONFIG[gtk2] =3D "-DENABLE_GTK=3DON,-DENABLE_GTK=3DOFF, gtk+"
> -PACKAGECONFIG[gtk3] =3D "-DENABLE_GTK3=3DON,-DENABLE_GTK3=3DOFF, gtk+3"
> -PACKAGECONFIG[qt5] =3D "-DENABLE_QT5=3DON,-DENABLE_QT5=3DOFF
> -DBUILD_wireshark=3DOFF, qtbase"
> -PACKAGECONFIG[graphics] =3D ",-DENABLE_GTK=3DOFF,"
> +PACKAGECONFIG[gtk+] =3D "-DENABLE_GTK=3DON -DBUILD_wireshark_gtk=3DON,
> -DENABLE_GTK=3DOFF, gtk+"
> +PACKAGECONFIG[gtk+3] =3D "-DENABLE_GTK3=3DON -DBUILD_wireshark_gtk=3DON,
> -DENABLE_GTK3=3DOFF, gtk+3"
>  PACKAGECONFIG[gnutls] =3D "-DENABLE_GNUTLS=3DON,-DENABLE_GNUTLS=3DOFF, g=
nutls"
>  PACKAGECONFIG[ssl] =3D ",,openssl"
>  PACKAGECONFIG[krb5] =3D "-DENABLE_KRB5=3DON,-DENABLE_KRB5=3DOFF, krb5"
> @@ -50,9 +51,9 @@ PACKAGECONFIG[lz4] =3D "-DENABLE_LZ4=3DON,-DENABLE_LZ4=
=3DOFF,
> lz4"
>
>  # these next two options require addional layers
>  PACKAGECONFIG[c-ares] =3D "-DENABLE_CARES=3DON,-DENABLE_CARES=3DOFF, c-a=
res"
> +PACKAGECONFIG[qt5] =3D "-DENABLE_QT5=3DON -DBUILD_wireshark=3DON,
> -DENABLE_QT5=3DOFF -DBUILD_wireshark=3DOFF, qtbase"
>
> -EXTRA_OECMAKE +=3D "-DBUILD_wireshark=3DON \
> -                  -DENABLE_NETLINK=3DON \
> +EXTRA_OECMAKE +=3D "-DENABLE_NETLINK=3DON \
>                    -DBUILD_mmdbresolve=3DOFF \
>                    -DBUILD_randpktdump=3DOFF \
>                    -DBUILD_androiddump=3DOFF \
> @@ -60,9 +61,11 @@ EXTRA_OECMAKE +=3D "-DBUILD_wireshark=3DON \
>                    -DM_INCLUDE_DIR=3D${includedir} \
>                    -DM_LIBRARY=3D${libdir} \
>                   "
> +CFLAGS_append =3D " -lm"
> +
>  do_install_append_class-native() {
>         install -d ${D}${bindir}
> -       for f in make-dissectors lemon make-taps
> +       for f in lemon
>         do
>                 install -m 0755 ${B}/run/$f ${D}${bindir}
>         done
> @@ -75,6 +78,17 @@ do_install_append_class-target() {
>         done
>  }
>
> +PACKAGE_BEFORE_PN +=3D "tshark"
> +PACKAGE_BEFORE_PN +=3D "${PN}-gtk"
> +
> +FILES_tshark =3D "${bindir}/tshark ${mandir}/man1/tshark.*"
> +FILES_${PN}-gtk =3D "${bindir}/wireshark-gtk ${datadir}/icons
> ${datadir}/appdata \
> +                   ${datadir}/applications ${datadir}/wireshark
> ${datadir}/mime \
> +                   ${mandir}/man1/wireshark.* "
> +
>  FILES_${PN} +=3D "${datadir}*"
>
> +RDEPENDS_tshark =3D "wireshark"
> +RDEPENDS_${PN}-gtk =3D "${@bb.utils.contains("DISTRO_FEATURES", "x11",
> "${GTK}", "", d)} wireshark"
> +
>  BBCLASSEXTEND =3D "native"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

