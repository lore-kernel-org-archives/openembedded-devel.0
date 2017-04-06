Return-Path: <benjamin.gaignard@linaro.org>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8D56877ABF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Apr 2017 04:46:15 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id h67so28516223qke.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Apr 2017 21:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=eOyyrRgObh1WkWxxDRANplcANsXoCrxuLTFrBY16lVA=;
	b=GkoKFJgzygdKkm4Wy9wo2HC+mg71R4Qa6sfUWoAEaDOgtYz1t0BE1qDQyp9QVHDMDK
	TXz2iZZz8wgYtGC8QnnfbTos0qr6p9d5WK/ZUovLFsrr++ZrrfwmgZEpIZv2l85S6Htd
	IyxbzNLs5txZTimW19XpNBEGPZR63TVFZKsE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=eOyyrRgObh1WkWxxDRANplcANsXoCrxuLTFrBY16lVA=;
	b=B6F+cVqhAjEJ7cxSjsEezrmz6mZcEZUcZGxXD4rd05KH1+WFj1zND2VsDplzyZYF1V
	DdfCzCn2A/2FxaCWNpg/2EQuSBIPUxRd3VFovquKY626tUwBvlbcTamZIn9uXUDqYDEM
	yyuqPJX09DbWQk2AxntBY/iBpnPy8hNa3kWRoHs8icGPMnrqiXEb2VIx1iPcmzLKpnKw
	PYqSAK/1RrBUWkTkhO5Rrah/GrH3lgo8BTpmRxZnuRWv/qoqDgThlJjDYlC/9E6VxgLG
	jXNYMhvFXnuhFlZcLBy5HXzdpWjnNr4LH/E9IHlMdWjwNFk/ug3vAXyNlAzDz+dFpgk6
	vBQQ==
X-Gm-Message-State: AFeK/H1qp/Yz8YxJhY3o8Ao+lIfOaKxDz3FrXUxXD9h04wLJsFTk2l4pyEzEDbgpLg/EWm1Hha2Ut3iVzTocJMM3
X-Received: by 10.55.31.1 with SMTP id f1mr24125640qkf.255.1491453976573; Wed,
	05 Apr 2017 21:46:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.83.178 with HTTP; Wed, 5 Apr 2017 21:46:16 -0700 (PDT)
In-Reply-To: <20170405184114.GC3301@jama>
References: <1491396806-3521-1-git-send-email-benjamin.gaignard@linaro.org>
	<20170405184114.GC3301@jama>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Thu, 6 Apr 2017 06:46:16 +0200
Message-ID: <CA+M3ks5hiM0JU6aUaVG7vbsjZGninS6y9qQHT-ObuGXv4USUPQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] tinyproxy: Add recipe
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
X-List-Received-Date: Thu, 06 Apr 2017 04:46:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2017-04-05 20:41 GMT+02:00 Martin Jansa <martin.jansa@gmail.com>:
> On Wed, Apr 05, 2017 at 02:53:26PM +0200, Benjamin Gaignard wrote:
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>
>> ---
>>  .../tinyproxy/tinyproxy/tinyproxy.service          | 14 ++++++++++
>>  .../recipes-support/tinyproxy/tinyproxy_1.8.4.bb   | 32 +++++++++++++++=
+++++++
>>  2 files changed, 46 insertions(+)
>>  create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/=
tinyproxy.service
>>  create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy_=
1.8.4.bb
>>
>> diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/tinypro=
xy.service b/meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.=
service
>> new file mode 100644
>> index 0000000..800d2ad
>> --- /dev/null
>> +++ b/meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.serv=
ice
>> @@ -0,0 +1,14 @@
>> +[Unit]
>> +Description=3DTinyproxy, Lightweight http(s) proxy daemon
>> +RequiresMountsFor=3D/var
>> +
>> +[Service]
>> +User=3Droot
>> +ExecStartPre=3D/bin/mkdir -p /var/log/tinyproxy
>> +ExecStartPre=3D/bin/chown -R nobody.adm /var/log/tinyproxy
>> +ExecStartPre=3D/bin/mkdir -p /var/run/tinyproxy
>> +ExecStartPre=3D/bin/chown -R nobody.adm /var/run/tinyproxy
>> +ExecStart=3D/usr/sbin/tinyproxy -d
>> +
>> +[Install]
>> +WantedBy=3Dmulti-user.target
>> diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.b=
b b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb
>> new file mode 100644
>> index 0000000..76cec63
>> --- /dev/null
>> +++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb
>> @@ -0,0 +1,32 @@
>> +SUMMARY =3D "Lightweight http(s) proxy daemon"
>> +HOMEPAGE =3D "https://tinyproxy.github.io/"
>> +LICENSE =3D "GPLv2"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa88=
2bbe"
>> +
>> +SRC_URI =3D "https://github.com/tinyproxy/tinyproxy/releases/download/1=
.8.4/tinyproxy-${PV}.tar.gz"
>
> Use ${PV} for 2nd 1.8.4 as well.
>
> You can also replace "tinyproxy-${PV}" with just "${BP}" and tinyproxy
> with ${BPN}"

I will do that in version 2

>
>> +SRC_URI +=3D "file://tinyproxy.service"
>> +
>> +SRC_URI[md5sum] =3D "3b60f7d08e0821ed1a3e2cf1e5778cac"
>> +SRC_URI[sha256sum] =3D "8234c879a129feee61efa98bac14a1a3e46e5cf08f01696=
a216940872aa70faf"
>> +
>> +EXTRA_OECONF +=3D " \
>> +     --enable-filter \
>> +     --enable-transparent \
>> +     --disable-regexcheck \
>> +     --enable-reverse \
>> +     --enable-upstream \
>> +     --enable-xtinyproxy \
>> +     "
>> +
>> +inherit autotools systemd
>> +
>> +SYSTEMD_PACKAGES +=3D "${PN}"
>> +SYSTEMD_SERVICE_${PN} =3D "tinyproxy.service"
>> +SYSTEMD_AUTO_ENABLE_${PN} =3D "enable"
>> +
>> +do_install_append() {
>> +     install -d ${D}${systemd_system_unitdir}
>> +     install -m 0644 ${WORKDIR}/tinyproxy.service ${D}${systemd_system_=
unitdir}
>
> IIRC this should respect systemd in DISTRO_FEATURES.
>

I will test if systemd is in DISTRO_FEATURES before installing the file.

Thanks

>> +}
>> +
>> +FILES_${PN} =3D+ "${systemd_system_unitdir}/tinyproxy.service"
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Benjamin Gaignard

Graphic Study Group

Linaro.org =E2=94=82 Open source software for ARM SoCs

Follow Linaro: Facebook | Twitter | Blog

