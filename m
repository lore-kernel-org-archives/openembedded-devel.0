Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id 6B08678D68
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2018 00:55:04 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id k81-v6so24796670oib.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2018 17:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=lwwO6blrotFwrRq8WJ5q3j3t8pUT7xhS7+oMjVO9HIc=;
	b=DDl/xJSKK/q8kVUyZ2G1q8M7lvsViHo68JEy85XiGox0FxK3OhVfJ+2mL55+nzChHf
	YvG5DlQp8Dg0aOofqjcNIlDOR/qkfCPfCXePUhpztELwl3dVyDUUzgsSqlhSjZe5mgPT
	JFBv0Kr9VNPClWuyVIj/vPLuPWekKQVRo9KgHPJrSAQtTTlUMZyxMQQ1WNqobXowInPk
	aOLhZfibKs9hzb4+zSXueajcIYufNvBJRVbgRqnDqwZE6JPJSltmlTcFANM9+cCxPJOI
	tieIwJllJV6EIshJfQFrJFXNWf6O62KopNfpAl31meBp0YsTuDfl9qgyN0OOiYQdB0zX
	4IZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=lwwO6blrotFwrRq8WJ5q3j3t8pUT7xhS7+oMjVO9HIc=;
	b=AkvcreYQfrM73M8m53ltm/7AFSHiArYXr0xVc12cztFC/LWDC2fCMTtsnfasZqaGF3
	C2bdMNw21choF8nLNNt/x1A8oA2ZlE2ilE0IPf6aTfevUcRylfKg17lUB5cYi/OPqqoq
	eI5mo8x2n5fG/m1ki7rXNw/o09mCsulZTbYqwOIugOBoi1LA7j0+kpQnxiZ+FXtFBWFc
	BbsitW3oTYNWg9NB4fZrH+pkTZUI8KtE2TG7m8x7ZMLx6OjMdpBvQHi4hInDWarawMg/
	kJ0sQPYDbPxjsN62tH5/N5VjvG5L+QgIZmQOj6ZE7hh7vkJAVl/473UiZ5iNIhU94haQ
	mIAQ==
X-Gm-Message-State: AOUpUlGJcGFr9oQ9zubzyFCP8NXuOd5bEi19QyV3yWicFFr/1LsK3MxB
	/5qBMlyFpSxF6X4okoM8KH0a8HH+
X-Google-Smtp-Source: AAOMgpdTgaE2S2bWmqHBX5RlWzCytK0FC9PB+wxTfYY2egLc55C2oi9mqLk1BbWoat/MJUOv0qY83w==
X-Received: by 2002:aca:5583:: with SMTP id
	j125-v6mr21395000oib.2.1532998505278; 
	Mon, 30 Jul 2018 17:55:05 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:f98c:c6a6:efae:e2fe?
	([2601:202:4180:c33:f98c:c6a6:efae:e2fe])
	by smtp.gmail.com with ESMTPSA id
	i204-v6sm36500544oia.41.2018.07.30.17.55.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Jul 2018 17:55:04 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>
References: <1532882465-3210-1-git-send-email-akuster808@gmail.com>
	<CAMKF1spEi6G+gJMo1Wd-EpaY=-+KokOBcKjgjQp8ND7WOipwhg@mail.gmail.com>
	<bb053f36-0099-802b-b891-9302c6e90cbe@gmail.com>
	<CAMKF1sqT5B1jia+=5+SemfM-jcRNnw9XGsJhED9QsUABjqZ6_Q@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <61ed95a4-da79-bbb3-bbbd-19b0b6bd8c5c@gmail.com>
Date: Mon, 30 Jul 2018 17:55:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqT5B1jia+=5+SemfM-jcRNnw9XGsJhED9QsUABjqZ6_Q@mail.gmail.com>
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
X-List-Received-Date: Tue, 31 Jul 2018 00:55:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 07/30/2018 11:33 AM, Khem Raj wrote:
> Arm64 or mips64 or both is just fine
Both built fine including x86 using musl.

- armin
>
> On Mon, Jul 30, 2018 at 8:08 AM akuster808 <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>
>
>     On 07/29/2018 02:50 PM, Khem Raj wrote:
>>     Can you also validate if it=E2=80=99s building ok on musl
>
>     Sure. any particular arch ? I have arm, arm64 and mips64=C2=A0 boar=
ds
>     at home plus the normal qemu ones.
>
>
>>
>>     On Sun, Jul 29, 2018 at 9:41 AM Armin Kuster
>>     <akuster808@gmail.com <mailto:akuster808@gmail.com>> wrote:
>>
>>         [v3]
>>         Get=C2=A0 wireshark-gtk building again
>>         split tshark, wireshark-gtk into their own pkgs
>>
>>         [v2]
>>         Fix native build, lemon is the only one needed natively
>>
>>         [v1]
>>         includes security fixes:
>>
>>         wnpa-sec-2018-34 BGP dissector large loop. Bug 13741.
>>         CVE-2018-14342.
>>         wnpa-sec-2018-35 ISMP dissector crash. Bug 14672. CVE-2018-143=
44.
>>         wnpa-sec-2018-36 Multiple dissectors could crash. Bug 14675.
>>         CVE-2018-14340.
>>         wnpa-sec-2018-37 ASN.1 BER dissector crash. Bug 14682.
>>         CVE-2018-14343.
>>         wnpa-sec-2018-38 MMSE dissector infinite loop. Bug 14738.
>>         CVE-2018-14339.
>>         wnpa-sec-2018-39 DICOM dissector crash. Bug 14742.
>>         CVE-2018-14341.
>>         wnpa-sec-2018-40 Bazaar dissector infinite loop. Bug 14841.
>>         CVE-2018-14368.
>>         wnpa-sec-2018-41 HTTP2 dissector crash. Bug 14869.
>>         CVE-2018-14369.
>>         wnpa-sec-2018-42 CoAP dissector crash. Bug 14966. CVE-2018-143=
67.
>>
>>         Signed-off-by: Armin Kuster <akuster808@gmail.com
>>         <mailto:akuster808@gmail.com>>
>>         ---
>>         =C2=A0.../{wireshark_2.6.1.bb <http://wireshark_2.6.1.bb> =3D>=

>>         wireshark_2.6.2.bb <http://wireshark_2.6.2.bb>}=C2=A0 =C2=A0 =C2=
=A0| 34
>>         +++++++++++++++-------
>>         =C2=A01 file changed, 24 insertions(+), 10 deletions(-)
>>         =C2=A0rename
>>         meta-networking/recipes-support/wireshark/{wireshark_2.6.1.bb
>>         <http://wireshark_2.6.1.bb> =3D> wireshark_2.6.2.bb
>>         <http://wireshark_2.6.2.bb>} (70%)
>>
>>         diff --git
>>         a/meta-networking/recipes-support/wireshark/wireshark_2.6.1.bb=

>>         <http://wireshark_2.6.1.bb>
>>         b/meta-networking/recipes-support/wireshark/wireshark_2.6.2.bb=

>>         <http://wireshark_2.6.2.bb>
>>         similarity index 70%
>>         rename from
>>         meta-networking/recipes-support/wireshark/wireshark_2.6.1.bb
>>         <http://wireshark_2.6.1.bb>
>>         rename to
>>         meta-networking/recipes-support/wireshark/wireshark_2.6.2.bb
>>         <http://wireshark_2.6.2.bb>
>>         index 91c5e96..1735ae7 100644
>>         ---
>>         a/meta-networking/recipes-support/wireshark/wireshark_2.6.1.bb=

>>         <http://wireshark_2.6.1.bb>
>>         +++
>>         b/meta-networking/recipes-support/wireshark/wireshark_2.6.2.bb=

>>         <http://wireshark_2.6.2.bb>
>>         @@ -14,8 +14,8 @@ SRC_URI =3D
>>         "https://1.as.dl.wireshark.org/src/${BP}.tar.xz
>>         <https://1.as.dl.wireshark.org/src/$%7BBP%7D.tar.xz> \
>>
>>         =C2=A0UPSTREAM_CHECK_URI =3D "https://1.as.dl.wireshark.org/sr=
c"
>>
>>         -SRC_URI[md5sum] =3D "b0e9e5fe22e96d9fdfad18f750fa8f55"
>>         -SRC_URI[sha256sum] =3D
>>         "ab6e5bbc3464c956347b8671ce8397950ad5daff3bf9964c967d495f4ddbc=
d88"
>>         +SRC_URI[md5sum] =3D "086d235509717190d06554b2ab870209"
>>         +SRC_URI[sha256sum] =3D
>>         "49b2895ee3ba17ef9ef0aebfdc4d32a778e0f36ccadde184516557d5f3357=
094"
>>
>>         =C2=A0PE =3D "1"
>>
>>         @@ -23,8 +23,11 @@ inherit cmake pkgconfig pythonnative
>>         perlnative upstream-version-is-even
>>
>>         =C2=A0ARM_INSTRUCTION_SET =3D "arm"
>>
>>         +# Options: gtk+, gtk+3 and qt5
>>         +GTK =3D "gtk+3"
>>         +
>>         =C2=A0PACKAGECONFIG ?=3D "libpcap gnutls libnl libcap sbc"
>>         -PACKAGECONFIG_append_class-target =3D "
>>         ${@bb.utils.contains("DISTRO_FEATURES", "x11", " gtk3
>>         graphics ", "", d)}"
>>         +PACKAGECONFIG_append_class-target =3D "
>>         ${@bb.utils.contains("DISTRO_FEATURES", "x11", " ${GTK}", "",
>>         d)}"
>>
>>         =C2=A0PACKAGECONFIG_class-native =3D "libpcap gnutls ssl libss=
h"
>>
>>         @@ -33,10 +36,8 @@ PACKAGECONFIG[libpcap] =3D
>>         "-DENABLE_PCAP=3DON,-DENABLE_PCAP=3DOFF -DENABLE_PCAP_NG_DE
>>         =C2=A0PACKAGECONFIG[libsmi] =3D
>>         "-DENABLE_SMI=3DON,-DENABLE_SMI=3DOFF,libsmi"
>>         =C2=A0PACKAGECONFIG[libnl] =3D ",,libnl"
>>         =C2=A0PACKAGECONFIG[portaudio] =3D
>>         "-DENABLE_PORTAUDIO=3DON,-DENABLE_PORTAUDIO=3DOFF, portaudio-v=
19"
>>         -PACKAGECONFIG[gtk2] =3D "-DENABLE_GTK=3DON,-DENABLE_GTK=3DOFF=
, gtk+"
>>         -PACKAGECONFIG[gtk3] =3D "-DENABLE_GTK3=3DON,-DENABLE_GTK3=3DO=
FF,
>>         gtk+3"
>>         -PACKAGECONFIG[qt5] =3D "-DENABLE_QT5=3DON,-DENABLE_QT5=3DOFF
>>         -DBUILD_wireshark=3DOFF, qtbase"
>>         -PACKAGECONFIG[graphics] =3D ",-DENABLE_GTK=3DOFF,"
>>         +PACKAGECONFIG[gtk+] =3D "-DENABLE_GTK=3DON
>>         -DBUILD_wireshark_gtk=3DON, -DENABLE_GTK=3DOFF, gtk+"
>>         +PACKAGECONFIG[gtk+3] =3D "-DENABLE_GTK3=3DON
>>         -DBUILD_wireshark_gtk=3DON, -DENABLE_GTK3=3DOFF, gtk+3"
>>         =C2=A0PACKAGECONFIG[gnutls] =3D
>>         "-DENABLE_GNUTLS=3DON,-DENABLE_GNUTLS=3DOFF, gnutls"
>>         =C2=A0PACKAGECONFIG[ssl] =3D ",,openssl"
>>         =C2=A0PACKAGECONFIG[krb5] =3D "-DENABLE_KRB5=3DON,-DENABLE_KRB=
5=3DOFF, krb5"
>>         @@ -50,9 +51,9 @@ PACKAGECONFIG[lz4] =3D
>>         "-DENABLE_LZ4=3DON,-DENABLE_LZ4=3DOFF, lz4"
>>
>>         =C2=A0# these next two options require addional layers
>>         =C2=A0PACKAGECONFIG[c-ares] =3D
>>         "-DENABLE_CARES=3DON,-DENABLE_CARES=3DOFF, c-ares"
>>         +PACKAGECONFIG[qt5] =3D "-DENABLE_QT5=3DON -DBUILD_wireshark=3D=
ON,
>>         -DENABLE_QT5=3DOFF -DBUILD_wireshark=3DOFF, qtbase"
>>
>>         -EXTRA_OECMAKE +=3D "-DBUILD_wireshark=3DON \
>>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 -DENABLE_NETLINK=3DON \
>>         +EXTRA_OECMAKE +=3D "-DENABLE_NETLINK=3DON \
>>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0-DBUILD_mmdbresolve=3DOFF \
>>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0-DBUILD_randpktdump=3DOFF \
>>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0-DBUILD_androiddump=3DOFF \
>>         @@ -60,9 +61,11 @@ EXTRA_OECMAKE +=3D "-DBUILD_wireshark=3DON =
\
>>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0-DM_INCLUDE_DIR=3D${includedir} \
>>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0-DM_LIBRARY=3D${libdir} \
>>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 "
>>         +CFLAGS_append =3D " -lm"
>>         +
>>         =C2=A0do_install_append_class-native() {
>>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${bindir}
>>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0for f in make-dissectors lemon mak=
e-taps
>>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0for f in lemon
>>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 do
>>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 instal=
l -m 0755 ${B}/run/$f ${D}${bindir}
>>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 done
>>         @@ -75,6 +78,17 @@ do_install_append_class-target() {
>>         =C2=A0 =C2=A0 =C2=A0 =C2=A0 done
>>         =C2=A0}
>>
>>         +PACKAGE_BEFORE_PN +=3D "tshark"
>>         +PACKAGE_BEFORE_PN +=3D "${PN}-gtk"
>>         +
>>         +FILES_tshark =3D "${bindir}/tshark ${mandir}/man1/tshark.*"
>>         +FILES_${PN}-gtk =3D "${bindir}/wireshark-gtk ${datadir}/icons=

>>         ${datadir}/appdata \
>>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0${datadir}/applications
>>         ${datadir}/wireshark ${datadir}/mime \
>>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0${mandir}/man1/wireshark.* "
>>         +
>>         =C2=A0FILES_${PN} +=3D "${datadir}*"
>>
>>         +RDEPENDS_tshark =3D "wireshark"
>>         +RDEPENDS_${PN}-gtk =3D "${@bb.utils.contains("
>>         <mailto:$%7B@bb.utils.contains%28>DISTRO_FEATURES", "x11",
>>         "${GTK}", "", d)} wireshark"
>>         +
>>         =C2=A0BBCLASSEXTEND =3D "native"
>>         --=20
>>         2.7.4
>>
>>         --=20
>>         _______________________________________________
>>         Openembedded-devel mailing list
>>         Openembedded-devel@lists.openembedded.org
>>         <mailto:Openembedded-devel@lists.openembedded.org>
>>         http://lists.openembedded.org/mailman/listinfo/openembedded-de=
vel
>>
>


