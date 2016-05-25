Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9B4FF60762
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 May 2016 08:43:10 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id q62so13182148wmg.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 May 2016 01:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=y07/xDuwOOw4C8hTcwDINhdXKoavTIGOox0BuoI3aMo=;
	b=wgQkHn7+lPDOQTEh/mysaKa0Y1bdUbN8PIrZ5DUjfl7SeljdA/K0U11v2ugEBKMawx
	8D0+YganWoWoGxaHRFAcLnjFYpfvd0QziRgGJxIA7Gk85LJVkvB+9T3c/QvczPtozg3e
	HOZASmC0eu1gQnc3lCC+Vub43cbO80Ef5/W8ruSk5kElCCS89C3cM1la2TC0branO/jT
	XwwBtBy7UNKj2di8iXI5OvD/JoChinDd0YV9aeRDbcsuV2BF9G1mfA2NzJ+DEvDhVl7h
	UJwUoxDR1js9THEhDSHBKqFekldXh7VoUW+fuHFqyIfitJ/pqkI8Zip+uqcGdYOeadCx
	hlrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=y07/xDuwOOw4C8hTcwDINhdXKoavTIGOox0BuoI3aMo=;
	b=C2a26ApaVOsDtu7rvnYjvfZZP9XHBNHXmc8SBjzsXmVus6SgoCUdAacJCnu7GQhQn7
	BAnteNvmtC/7RUZ8HNPt6P7/T2/t1mtpOmZSPXpYY5mDmceDU7Er1cQzpSA6aKDiLhQw
	esPwTpKhiy0ggKpccdBOE0Ucv6YV87dtg69bD/92EkbgY9MXYlCYJdC7Es2oCUcfMg6G
	QKgIbtV3j5Hnx3vvbw5Zs1jJ3IV+xf9IWmlUei7pfd0CIzx6lSxh2HOG3TGonXpj6M+O
	z8o0ZWgBcjhV+Zgu5IwmnNTT5B2hG+EBv+TYqR9DgLE/X0haj7Kb+HbX7fiMUfnUWRSL
	1nnA==
X-Gm-Message-State: ALyK8tKZESIh0U88q5Ce1bEcxCFio8JB8tYeBxNGd18QRaklDUw+ke/8HVZbPRxAaVAjgw==
X-Received: by 10.28.105.200 with SMTP id z69mr2155799wmh.78.1464165790606;
	Wed, 25 May 2016 01:43:10 -0700 (PDT)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by smtp.gmail.com with ESMTPSA id
	124sm10808629wml.12.2016.05.25.01.43.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 May 2016 01:43:09 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <57456517.1030405@windriver.com>
Date: Wed, 25 May 2016 10:43:08 +0200
Message-Id: <94DE3B87-251D-431D-9BD2-AA3B841C130D@dominion.thruhere.net>
References: <1464159700-16254-1-git-send-email-zhenbo.gao@windriver.com>
	<D9C8A333-331C-4D27-A60D-EDB3DDC244D3@dominion.thruhere.net>
	<57456517.1030405@windriver.com>
To: zhenbo <zhenbo.gao@windriver.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] networkmanager: add alias for networkmanager
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
X-List-Received-Date: Wed, 25 May 2016 08:43:14 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> Op 25 mei 2016, om 10:40 heeft zhenbo <zhenbo.gao@windriver.com> het =
volgende geschreven:
>=20
>=20
>=20
> On 2016=E5=B9=B405=E6=9C=8825=E6=97=A5 16:11, Koen Kooi wrote:
>>> Op 25 mei 2016, om 09:01 heeft Zhenbo Gao <zhenbo.gao@windriver.com> =
het volgende geschreven:
>>>=20
>>> connman get conflicts with networkmanager when building
>>> the project.
>> What=E2=80=99s the conflict? I=E2=80=99m hesitant to add yet another =
virtual since history has shown that most OE people can=E2=80=99t deal =
with the consequences and maintenance load for keeping the virtuals =
working
> Hi Koen Kooi,
>=20
> Thanks for replying this mail.
>=20
> When my project includes xfce and self-hosted at the same time, the =
compile step will fail and the error information shows that =
networkmanager get conflict with connman:
> ---
> ...
> Computing transaction...error: Can't install =
xfce4-power-manager-1.4.4-r0.0@corei7_64: unable to install provider for =
networkmanager:
> error:     networkmanager-1.0.4-r0.0@corei7_64 conflicts with =
connman-1.30-r0.0@corei7_64
> ...
> The dependence relationship is:
> xfce4-power-manager --> networkmanager
> packagegroup-self-hosted --> connman

So fix packagegroup-self-hosted to not specify a connection manager, =
crippling the connman and nm recipes with a virtual isn=E2=80=99t the =
solution.


>=20
> Thanks,
> Zhenbo
>=20
>>> here introduce alias virtual/networkmanager for these
>>> two recipes, so setting PREFERRED_PROVIDER to the proper
>>> one can solve the conflicts.
>>>=20
>>> this patch is for networkmanager recipe.
>>>=20
>>> Signed-off-by: Zhenbo Gao <zhenbo.gao@windriver.com>
>>> ---
>>> meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb =
   | 1 +
>>> =
meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb =
| 2 +-
>>> 2 files changed, 2 insertions(+), 1 deletion(-)
>>>=20
>>> diff --git =
a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb =
b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
>>> index 831ddf0..efd4d08 100644
>>> --- =
a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
>>> +++ =
b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
>>> @@ -8,6 +8,7 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Dcbbffd568227ada506640fe950a4823b \
>>> "
>>>=20
>>> DEPENDS =3D "libnl dbus dbus-glib libgudev util-linux libndp libnewt =
polkit"
>>> +PROVIDES =3D "virtual/networkmanager"
>>>=20
>>> inherit gnomebase gettext systemd bluetooth bash-completion vala =
gobject-introspection
>>>=20
>>> diff --git =
a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb =
b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb
>>> index 2070db2..59e1d40 100644
>>> --- =
a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb
>>> +++ =
b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb
>>> @@ -34,7 +34,7 @@ FILES_xfce4-powermanager-plugin =3D " \
>>> "
>>>=20
>>> RDEPENDS_xfce4-powermanager-plugin =3D "${PN}"
>>> -RDEPENDS_${PN} =3D "networkmanager =
${@bb.utils.contains('DISTRO_FEATURES','systemd','','consolekit',d)}"
>>> +RDEPENDS_${PN} =3D "virtual/networkmanager =
${@bb.utils.contains('DISTRO_FEATURES','systemd','','consolekit',d)}"
>>>=20
>>> # xfce4-brightness-plugin was replaced by xfce4-powermanager-plugin
>>> RPROVIDES_xfce4-powermanager-plugin +=3D "xfce4-brightness-plugin"
>>> --=20
>>> 1.9.1
>>>=20
>=20


