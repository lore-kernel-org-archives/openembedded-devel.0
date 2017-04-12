Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id BC4F777C73
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 19:53:44 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id l44so5783911wrc.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 12:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=l6NV6a0cf3Em4RqiWOWeR+g5OtMJm4SJqQsRt1kKut4=;
	b=FUMI1IZ0gGUzj1x6uSdipFLOhaa50cGkBI0LyurBhMVxFJJ34+TR2x+Fk7NgkyTOy3
	J1hq6o31tlg9g4w1pgNg89kJ8BtshAbwLb5MkZ+jD+fN/+RoXsgASCTKIEMtyE9E90n8
	bAAW5B8tMM6ZYUv/tq3ctgJ5jtMYn53HobC+qAlNiADxu7FlpduVFhNH4Q4MKHWEVirN
	gZAh5sp6vi2D+4iTfmH9uIV9KADZIBaptm7xD9cKNP07QXOHjT50M/mlWqonSnSaf57l
	hm+/4RauJWgxGMJfdbXJWcQ9iNurMUcD63xx7x9u71JY6G3+27bri943DI9RBcMAfplA
	OElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=l6NV6a0cf3Em4RqiWOWeR+g5OtMJm4SJqQsRt1kKut4=;
	b=ZE9psjQu3iT0z1MV+Zv8gHZPSRkpYrsiPi9bQXPiUxFlu01ZYTcqLmm3N4A3wtrH0W
	lRHIezGjaKK2QQrOojBMkeOnqP/l6C8Msc5JW9ue2T6kxhxpcr7j0Bc8WFg1DATC31Eo
	4/4eLJhrULPV3bkuTCk9Slav2tQAVHDjjn9zsYvui+232InF4ooVnCBwZXdPAepiQ9PI
	r8/k2d1CmC18OMR43rkb+qruXKW/YsHEMeGRG99gEqxpquGVAUhIYG85d77jb3HjsEFC
	8YWF2Tsvak5ElEMUq88PUMHz3ec7ny7YukxlI1ioHukQ4H2UCvNbAzy9L+er7D56Nq8o
	tZ6g==
X-Gm-Message-State: AN3rC/5XP6Pxw6j+uvRdoo5WZK7jbUXbGryv25F6FMrTzRfo7bexl7thAZDNe+5ry2X+UxNGTLHrjlNR+jRT1g==
X-Received: by 10.223.181.135 with SMTP id c7mr4964756wre.19.1492026825452;
	Wed, 12 Apr 2017 12:53:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.153.248 with HTTP; Wed, 12 Apr 2017 12:53:44 -0700 (PDT)
In-Reply-To: <CA+chaQes5kzcF8X8U=E_n_Yc=cOX0jPUr26ospPT01MzBpG0bQ@mail.gmail.com>
References: <1491486145-30397-1-git-send-email-benjamin.gaignard@linaro.org>
	<CA+chaQfVWLdyBnf8ewW3OFV=tmFT6D-5YZDJnrvihSEpAdGmiQ@mail.gmail.com>
	<CA+M3ks7GBnLNO4BXHGPwdr9wL29_-B-v6=Vk5h0=1JeQaJ2hpw@mail.gmail.com>
	<CA+chaQes5kzcF8X8U=E_n_Yc=cOX0jPUr26ospPT01MzBpG0bQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 12 Apr 2017 12:53:44 -0700
Message-ID: <CAJ86T=WH=meYS5TPOTv8uq4B2D-ytBC4QVenwLaB1Yw377cMUw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Benjamin Gaignard <benjamin.gaignard@linaro.org>
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
X-List-Received-Date: Wed, 12 Apr 2017 19:53:45 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 12, 2017 at 12:04 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> If you're testing it with master, then the xmllint from host cannot be used
> because of HOSTPATH filtering recently merged.
>
> For other configuration you can see:
> http://www.openembedded.org/wiki/Bitbake_World_Status_Setup
>
> On Wed, Apr 12, 2017 at 8:46 PM, Benjamin Gaignard <
> benjamin.gaignard@linaro.org> wrote:
>
>> 2017-04-12 14:45 GMT+02:00 Martin Jansa <martin.jansa@gmail.com>:
>> > Still fails to build:
>> > http://errors.yoctoproject.org/Errors/Details/140323/
>>
>> That is an error I never had in my setup.
>> I guess that libxml2 native is missing but I have way to reproduce the
>> problem.
>> How is it possible to perform the same build then you ?

You need to make the configure tests for xsltproc, asciidoc and
xmllint deterministic. e.g. to remove dependencies on all three, add:

  ac_cv_path_XSLTPROC=no
  ac_cv_path_A2X=no
  ac_cv_path_XMLLINT=no

to EXTRA_OECONF (which would allow you to remove asciidoc-native from DEPENDS).

>> >
>> > On Thu, Apr 6, 2017 at 3:42 PM, Benjamin Gaignard
>> > <benjamin.gaignard@linaro.org> wrote:
>> >>
>> >> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>
>> >> ---
>> >> version 2:
>> >> - create user and group for tinyproxy
>> >> - only install the service if systemd is present in DISTRO_FEATURE
>> >> - add dependency on asciidoc-native
>> >>  .../tinyproxy/tinyproxy/tinyproxy.service          | 14 ++++++++
>> >>  .../recipes-support/tinyproxy/tinyproxy_1.8.4.bb   | 41
>> >> ++++++++++++++++++++++
>> >>  2 files changed, 55 insertions(+)
>> >>  create mode 100644
>> >> meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.service
>> >>  create mode 100644
>> >> meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb
>> >>
>> >> diff --git
>> >> a/meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.service
>> >> b/meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.service
>> >> new file mode 100644
>> >> index 0000000..ea079f9
>> >> --- /dev/null
>> >> +++
>> >> b/meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.service
>> >> @@ -0,0 +1,14 @@
>> >> +[Unit]
>> >> +Description=Tinyproxy, Lightweight http(s) proxy daemon
>> >> +RequiresMountsFor=/var
>> >> +
>> >> +[Service]
>> >> +Group=tinyproxy
>> >> +ExecStartPre=/bin/mkdir -p /var/log/tinyproxy
>> >> +ExecStartPre=/bin/chown -R nobody.tinyproxy /var/log/tinyproxy
>> >> +ExecStartPre=/bin/mkdir -p /var/run/tinyproxy
>> >> +ExecStartPre=/bin/chown -R nobody.tinyproxy /var/run/tinyproxy
>> >> +ExecStart=/usr/sbin/tinyproxy -d
>> >> +
>> >> +[Install]
>> >> +WantedBy=multi-user.target
>> >> diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.
>> 8.4.bb
>> >> b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb
>> >> new file mode 100644
>> >> index 0000000..ef2a2d8
>> >> --- /dev/null
>> >> +++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb
>> >> @@ -0,0 +1,41 @@
>> >> +SUMMARY = "Lightweight http(s) proxy daemon"
>> >> +HOMEPAGE = "https://tinyproxy.github.io/"
>> >> +LICENSE = "GPLv2"
>> >> +LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882b
>> be"
>> >> +
>> >> +SRC_URI =
>> >> "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz
>> \
>> >> +                  file://tinyproxy.service"
>> >> +
>> >> +SRC_URI[md5sum] = "3b60f7d08e0821ed1a3e2cf1e5778cac"
>> >> +SRC_URI[sha256sum] =
>> >> "8234c879a129feee61efa98bac14a1a3e46e5cf08f01696a216940872aa70faf"
>> >> +
>> >> +DEPENDS = "asciidoc-native"
>> >> +
>> >> +EXTRA_OECONF += " \
>> >> +       --enable-filter \
>> >> +       --enable-transparent \
>> >> +       --disable-regexcheck \
>> >> +       --enable-reverse \
>> >> +       --enable-upstream \
>> >> +       --enable-xtinyproxy \
>> >> +       "
>> >> +
>> >> +inherit autotools systemd useradd
>> >> +
>> >> +#User specific
>> >> +USERADD_PACKAGES = "${PN}"
>> >> +USERADD_PARAM_${PN} = "nobody"
>> >> +GROUPADD_PARAM_${PN} = "--system tinyproxy"
>> >> +
>> >> +SYSTEMD_PACKAGES += "${BPN}"
>> >> +SYSTEMD_SERVICE_${PN} = "tinyproxy.service"
>> >> +SYSTEMD_AUTO_ENABLE_${PN} = "enable"
>> >> +
>> >> +do_install_append() {
>> >> +       if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true',
>> >> 'false', d)}; then
>> >> +               install -d ${D}${systemd_system_unitdir}
>> >> +               install -m 0644 ${WORKDIR}/tinyproxy.service
>> >> ${D}${systemd_system_unitdir}
>> >> +       fi
>> >> +}
>> >> +
>> >> +FILES_${PN} =+ "${systemd_system_unitdir}/tinyproxy.service"

This shouldn't be required if SYSTEMD_SERVICE_${PN} includes
"tinyproxy.service".

>> >> --
>> >> 1.9.1
>> >>
>> >
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

