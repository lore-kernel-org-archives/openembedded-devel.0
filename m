Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 04E7E719B9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Nov 2016 06:00:49 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 3so7290536pgd.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2016 22:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:mime-version:subject:date:references:to:in-reply-to:message-id; 
	bh=CVZGGkdfyQVGgP2NZQNOyhUlxIp7PqCaUcuYCZaUNJ0=;
	b=Dc6LNQWqSC8HSvU86mEeDSBpdt8Sgi1NUtYDaJqIMWQXOMqlV5+zJpa8SX8cTmQDGh
	ijOvqVRGaXrCkEZ4OtISH5zdYnxd3d3gDGAUkYHn/Eru6JUhyqTVG1t2864nkhopKAuF
	mUq0fXak8Y/5dE7wPG1Cw7svpgouM7WhuyZALK/wIoe64xRt6vEd/6j7VQsCcpDuD58L
	NQo2U3TyILIS7s0Ydk499pZdIB3YJjd4GQfDACRin8tP80ZwR9tpuxmMU/DmaeT4AR6B
	DeThTD8tQz1St2dvrDRnpw0JcUNDkYNZZpaW6PoFmHS69wgSenYrAbOpqhtpZprIOtJc
	VcLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:subject:date:references:to
	:in-reply-to:message-id;
	bh=CVZGGkdfyQVGgP2NZQNOyhUlxIp7PqCaUcuYCZaUNJ0=;
	b=IuZ0uBchTI5euGik6WgqsQHEmoVRCYrwxRL0e1N1UaBH95KxcuqZ03uNhdUcNibHvj
	9nt5ZJGUB4xSMEz34/AzUJRn1jNRVnZQ9YGwvyfxj5+0MyvdxMDW0XC3xDEx5Xu3YoNc
	naxZmzQviHXobtLdmRp09Kx6q6rtJJ2KxS6kH7A9ezVKITdDQ+CHDc/gvSZrhmG8Woll
	4BYUpYzipIdOWkq8NUsUBDpxfDLeAIOQtDjR9YwCEqNVb/taS33314t8jFenqBWKsOmR
	oN419y+1OMft8YJNE1xzHNbCG7AEm2mK+BTGm8p1g7lvf7azXWbjdFIDtsu7wn4t2b8V
	GbsQ==
X-Gm-Message-State: AKaTC00ML5XT1vQvp/Ruv0tg3/x/5miB1WJMQov3cJQ/Y9c0h7FbPn5TYiV7y8z/BynTBQ==
X-Received: by 10.99.143.1 with SMTP id n1mr20856347pgd.88.1480140051031;
	Fri, 25 Nov 2016 22:00:51 -0800 (PST)
Received: from ?IPv6:2601:646:8882:b8c:e574:db7a:d1a9:c4a6?
	([2601:646:8882:b8c:e574:db7a:d1a9:c4a6])
	by smtp.gmail.com with ESMTPSA id
	t21sm71675956pfa.1.2016.11.25.22.00.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Nov 2016 22:00:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
Date: Fri, 25 Nov 2016 22:00:49 -0800
References: <20161123092209.23699-1-raj.khem@gmail.com>
	<20161123092209.23699-23-raj.khem@gmail.com>
	<20161126001644.GD8369@jama>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20161126001644.GD8369@jama>
Message-Id: <DFDC01A5-7EFF-4BEB-89F0-C5F66C19870B@gmail.com>
X-Mailer: Apple Mail (2.3251)
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-multimedia][PATCH 23/49] miniupnpd: Add recipe
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
X-List-Received-Date: Sat, 26 Nov 2016 06:00:52 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Nov 25, 2016, at 4:16 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>=20
> On Wed, Nov 23, 2016 at 01:21:43AM -0800, Khem Raj wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> .../miniupnpd/miniupnpd_2.0.bb                     | 38 =
++++++++++++++++++++++
>> 1 file changed, 38 insertions(+)
>> create mode 100644 =
meta-multimedia/recipes-connectivity/miniupnpd/miniupnpd_2.0.bb
>>=20
>> diff --git =
a/meta-multimedia/recipes-connectivity/miniupnpd/miniupnpd_2.0.bb =
b/meta-multimedia/recipes-connectivity/miniupnpd/miniupnpd_2.0.bb
>> new file mode 100644
>> index 0000000..dfa3fed
>> --- /dev/null
>> +++ b/meta-multimedia/recipes-connectivity/miniupnpd/miniupnpd_2.0.bb
>> @@ -0,0 +1,38 @@
>> +SUMMARY =3D "Lightweight UPnP IGD daemon"
>> +DESCRIPTION =3D "The miniUPnP daemon is an UPnP IGD (internet =
gateway device) \
>> +which provide NAT traversal services to any UPnP enabled client on \
>> +the network."
>> +
>> +SECTION =3D "networking"
>> +LICENSE =3D "BSD-3-Clause"
>> +LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3Daa71c78c373ccfe0ff207af0cd966d91"
>> +
>> +inherit autotools gettext pkgconfig
>> +
>> +DEPENDS +=3D "iptables net-tools util-linux"
>=20
> Autodetects bunch of dependencies:
> =
http://lists.openembedded.org/pipermail/openembedded-devel/2016-November/1=
10050.html =
<http://lists.openembedded.org/pipermail/openembedded-devel/2016-November/=
110050.html>

will send a v2

>=20
>> +
>> +SRC_URI =3D =
"http://miniupnp.tuxfamily.org/files/download.php?file=3D${P}.tar.gz \
>> +"
>> +SRC_URI[md5sum] =3D "1c07a215dd9b362e75a9efc05e2fb3b4"
>> +SRC_URI[sha256sum] =3D =
"d96aa3a00e0f5490826bba3cb97e68cd27479e5839adac4b9bcb66eae786bfb7"
>> +
>> +IPV6 =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '--ipv6', =
'', d)}"
>> +
>> +do_compile() {
>> +    cd ${S}
>> +    CONFIG_OPTIONS=3D"${IPV6} --leasefile" ./genconfig.sh
>> +    oe_runmake -f Makefile.linux
>> +}
>> +
>> +do_install() {
>> +    install -d ${D}/${sbindir}
>> +    install ${S}/miniupnpd ${D}/${sbindir}
>> +    install -d ${D}/${sysconfdir}/${BPN}
>> +    install ${S}/netfilter/iptables_init.sh =
${D}/${sysconfdir}/${BPN}
>> +    install ${S}/netfilter/iptables_removeall.sh =
${D}/${sysconfdir}/${BPN}
>> +    install ${S}/netfilter/ip6tables_init.sh =
${D}/${sysconfdir}/${BPN}
>> +    install ${S}/netfilter/ip6tables_removeall.sh =
${D}/${sysconfdir}/${BPN}
>> +    install -m 0644 -b ${S}/miniupnpd.conf ${D}/${sysconfdir}/${BPN}
>> +    install -d ${D}/${sysconfdir}/init.d
>> +    install ${S}/linux/miniupnpd.init.d.script =
${D}/${sysconfdir}/init.d/miniupnpd
>> +}
>> --=20
>> 2.10.2
>>=20
>> --=20
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org =
<mailto:Openembedded-devel@lists.openembedded.org>
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel =
<http://lists.openembedded.org/mailman/listinfo/openembedded-devel>
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com =
<mailto:Martin.Jansa@gmail.com>
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org =
<mailto:Openembedded-devel@lists.openembedded.org>
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel =
<http://lists.openembedded.org/mailman/listinfo/openembedded-devel>

