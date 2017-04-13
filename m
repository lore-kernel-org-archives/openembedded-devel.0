Return-Path: <benjamin.gaignard@linaro.org>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 25D5677D90
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 12:31:27 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id p68so46470143qke.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 05:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Yn2NDUhMyIyoF4LgmXJDsPDhX8NbRWsSDrQTc5uqlJk=;
	b=TUSbJm6J+jVqRqrDh41Sc3i44xApLahpcuVfwE4rG9zSQ/L0gRiahwbqdoIVl/rOOR
	CRoLJQT8m/bc3OcZyN067ykKI3SycdeyfYTowRDqq1cyrBWVA6y8TCeA3HDaDoW86g+4
	TkNJl37MFgv1uuhyXgGbnEWqonsRMcj9jYVyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Yn2NDUhMyIyoF4LgmXJDsPDhX8NbRWsSDrQTc5uqlJk=;
	b=mnQOjiw6aUhLpHvZjmeW6Vw2kwNl6rQq5qjGVgU8gpge6DAsMBTMxz4XTaIGEjqv2E
	dMyap8QgdmSB4B9agofC2obOgnrfSPUzSccNUDgp8CvDx/pCGE1eVfPwiG0oqWTz2OFQ
	Ff0f6LOttbTOmC75nJBIa+i4KHSVn+cvkj+fHCfijJFh4O5bBo+IwQhJmPSFT7dIbcaO
	D46tdFcMtObFrz1dK/5mLqCkE6CNooi04IjTlgDJbTjjeLEba++wTclKjLATfKbh/aBp
	LBVHB3j0YXOlYXZZSY9ZdmYqPkifgy6uUdOBeSyalo0BjaAEODjK3eZ9vLGBcwBv6Jp+
	danA==
X-Gm-Message-State: AN3rC/7uCwLD7h6Y1tf8e52oXL7MlPBKXIySB0xcrYzZjWXJqYX8jHjn
	ZoCfiINACkTbZAr0kc2Sx3zdmoP2BsCK
X-Received: by 10.55.93.193 with SMTP id r184mr2093649qkb.221.1492086688482;
	Thu, 13 Apr 2017 05:31:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.83.178 with HTTP; Thu, 13 Apr 2017 05:31:28 -0700 (PDT)
In-Reply-To: <CAJ86T=WH=meYS5TPOTv8uq4B2D-ytBC4QVenwLaB1Yw377cMUw@mail.gmail.com>
References: <1491486145-30397-1-git-send-email-benjamin.gaignard@linaro.org>
	<CA+chaQfVWLdyBnf8ewW3OFV=tmFT6D-5YZDJnrvihSEpAdGmiQ@mail.gmail.com>
	<CA+M3ks7GBnLNO4BXHGPwdr9wL29_-B-v6=Vk5h0=1JeQaJ2hpw@mail.gmail.com>
	<CA+chaQes5kzcF8X8U=E_n_Yc=cOX0jPUr26ospPT01MzBpG0bQ@mail.gmail.com>
	<CAJ86T=WH=meYS5TPOTv8uq4B2D-ytBC4QVenwLaB1Yw377cMUw@mail.gmail.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Thu, 13 Apr 2017 14:31:28 +0200
Message-ID: <CA+M3ks4katWfA0-SPYSi=YJRUL3cMhek_oyw=X0jOY0apZa_KQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [[meta-networking][PATCH v2] tinyproxy: Add recipe
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
X-List-Received-Date: Thu, 13 Apr 2017 12:31:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2017-04-12 21:53 GMT+02:00 Andre McCurdy <armccurdy@gmail.com>:
> On Wed, Apr 12, 2017 at 12:04 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
>> If you're testing it with master, then the xmllint from host cannot be u=
sed
>> because of HOSTPATH filtering recently merged.
>>
>> For other configuration you can see:
>> http://www.openembedded.org/wiki/Bitbake_World_Status_Setup
>>
>> On Wed, Apr 12, 2017 at 8:46 PM, Benjamin Gaignard <
>> benjamin.gaignard@linaro.org> wrote:
>>
>>> 2017-04-12 14:45 GMT+02:00 Martin Jansa <martin.jansa@gmail.com>:
>>> > Still fails to build:
>>> > http://errors.yoctoproject.org/Errors/Details/140323/
>>>
>>> That is an error I never had in my setup.
>>> I guess that libxml2 native is missing but I have way to reproduce the
>>> problem.
>>> How is it possible to perform the same build then you ?
>
> You need to make the configure tests for xsltproc, asciidoc and
> xmllint deterministic. e.g. to remove dependencies on all three, add:
>
>   ac_cv_path_XSLTPROC=3Dno
>   ac_cv_path_A2X=3Dno
>   ac_cv_path_XMLLINT=3Dno

I don't know what that could break in tinyproxy so I prefer to add the
dependencies.

>
> to EXTRA_OECONF (which would allow you to remove asciidoc-native from DEP=
ENDS).
>
>>> >
>>> > On Thu, Apr 6, 2017 at 3:42 PM, Benjamin Gaignard
>>> > <benjamin.gaignard@linaro.org> wrote:
>>> >>
>>> >> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>
>>> >> ---
>>> >> version 2:
>>> >> - create user and group for tinyproxy
>>> >> - only install the service if systemd is present in DISTRO_FEATURE
>>> >> - add dependency on asciidoc-native
>>> >>  .../tinyproxy/tinyproxy/tinyproxy.service          | 14 ++++++++
>>> >>  .../recipes-support/tinyproxy/tinyproxy_1.8.4.bb   | 41
>>> >> ++++++++++++++++++++++
>>> >>  2 files changed, 55 insertions(+)
>>> >>  create mode 100644
>>> >> meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.servic=
e
>>> >>  create mode 100644
>>> >> meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb
>>> >>
>>> >> diff --git
>>> >> a/meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.serv=
ice
>>> >> b/meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.serv=
ice
>>> >> new file mode 100644
>>> >> index 0000000..ea079f9
>>> >> --- /dev/null
>>> >> +++
>>> >> b/meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.serv=
ice
>>> >> @@ -0,0 +1,14 @@
>>> >> +[Unit]
>>> >> +Description=3DTinyproxy, Lightweight http(s) proxy daemon
>>> >> +RequiresMountsFor=3D/var
>>> >> +
>>> >> +[Service]
>>> >> +Group=3Dtinyproxy
>>> >> +ExecStartPre=3D/bin/mkdir -p /var/log/tinyproxy
>>> >> +ExecStartPre=3D/bin/chown -R nobody.tinyproxy /var/log/tinyproxy
>>> >> +ExecStartPre=3D/bin/mkdir -p /var/run/tinyproxy
>>> >> +ExecStartPre=3D/bin/chown -R nobody.tinyproxy /var/run/tinyproxy
>>> >> +ExecStart=3D/usr/sbin/tinyproxy -d
>>> >> +
>>> >> +[Install]
>>> >> +WantedBy=3Dmulti-user.target
>>> >> diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.
>>> 8.4.bb
>>> >> b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb
>>> >> new file mode 100644
>>> >> index 0000000..ef2a2d8
>>> >> --- /dev/null
>>> >> +++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb
>>> >> @@ -0,0 +1,41 @@
>>> >> +SUMMARY =3D "Lightweight http(s) proxy daemon"
>>> >> +HOMEPAGE =3D "https://tinyproxy.github.io/"
>>> >> +LICENSE =3D "GPLv2"
>>> >> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaab=
aa882b
>>> be"
>>> >> +
>>> >> +SRC_URI =3D
>>> >> "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.=
gz
>>> \
>>> >> +                  file://tinyproxy.service"
>>> >> +
>>> >> +SRC_URI[md5sum] =3D "3b60f7d08e0821ed1a3e2cf1e5778cac"
>>> >> +SRC_URI[sha256sum] =3D
>>> >> "8234c879a129feee61efa98bac14a1a3e46e5cf08f01696a216940872aa70faf"
>>> >> +
>>> >> +DEPENDS =3D "asciidoc-native"
>>> >> +
>>> >> +EXTRA_OECONF +=3D " \
>>> >> +       --enable-filter \
>>> >> +       --enable-transparent \
>>> >> +       --disable-regexcheck \
>>> >> +       --enable-reverse \
>>> >> +       --enable-upstream \
>>> >> +       --enable-xtinyproxy \
>>> >> +       "
>>> >> +
>>> >> +inherit autotools systemd useradd
>>> >> +
>>> >> +#User specific
>>> >> +USERADD_PACKAGES =3D "${PN}"
>>> >> +USERADD_PARAM_${PN} =3D "nobody"
>>> >> +GROUPADD_PARAM_${PN} =3D "--system tinyproxy"
>>> >> +
>>> >> +SYSTEMD_PACKAGES +=3D "${BPN}"
>>> >> +SYSTEMD_SERVICE_${PN} =3D "tinyproxy.service"
>>> >> +SYSTEMD_AUTO_ENABLE_${PN} =3D "enable"
>>> >> +
>>> >> +do_install_append() {
>>> >> +       if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true'=
,
>>> >> 'false', d)}; then
>>> >> +               install -d ${D}${systemd_system_unitdir}
>>> >> +               install -m 0644 ${WORKDIR}/tinyproxy.service
>>> >> ${D}${systemd_system_unitdir}
>>> >> +       fi
>>> >> +}
>>> >> +
>>> >> +FILES_${PN} =3D+ "${systemd_system_unitdir}/tinyproxy.service"
>
> This shouldn't be required if SYSTEMD_SERVICE_${PN} includes
> "tinyproxy.service".

Yes I will remove it.

>>> >> --
>>> >> 1.9.1
>>> >>
>>> >
>>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



--=20
Benjamin Gaignard

Graphic Study Group

Linaro.org =E2=94=82 Open source software for ARM SoCs

Follow Linaro: Facebook | Twitter | Blog

