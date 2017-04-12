Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id 812B677C2A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 19:04:01 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id o21so23221317wrb.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 12:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eLTAxw65/n/0YW9oNUvaas4hW4B2xO2oU+XcNSXiT7U=;
	b=oV4PV+uyM6mUBgmSHrFfMROmEed/HQM7f6VBE8LKgwLMxK8LqdtafYEb3ujVSP5Nlf
	iiN2Ec5GPbaTL83IRl9AhVUFX6qXZ2GpwQZwzoOnrf8lZH0LzO9ueeVM7rWOSrx+Ainx
	vtxSwqxVoQ0QKxugL1cdbtjxDH6CsO3Eo9BfB8cqkXyezCVAytkt7sX9yghbBteeB0f5
	gd20stIFp7chivoaOORON7YchiGNNF7NQE16G3L73q9zTHQithhMi4M4ZUrQu+Ffgf1I
	Y453WVRyqz7eMZE3Bj7PfRFgx5bvB7/AZYc6P5C7AcqQ1yLpuGAyyYOAi5M9O5SRZ9Rq
	kZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eLTAxw65/n/0YW9oNUvaas4hW4B2xO2oU+XcNSXiT7U=;
	b=d6u+5876mQdVGwy2shgBjDUMOArSIwfz+ou5+zC0i7+X/wtWYbs7RKrMU7zf/vUVH7
	bedzOESPDL/T9OO93InqYqHSxTsqaclCfEngEHVPUdeYBS8wtnitKiCEGDiYLIgadN6b
	ALnpLuRo200W4QktUPawoi+axqcK0Qh5Z709DEj/pLC2peFhLFH2X/BUTjc+p0/MDYrv
	Bh3DxuYqUuVnCTyB+wCIKuXEOX5l1RwepkkAHKlSfCkdo2A17x8mMkGPQHZJH3iqxAwl
	Qt6jk5Jx6oufXcrIhGAol/DTHJVMpZnPedSKAb3nG+H5ehlAvstT1A3Wg8TscdujN8Tt
	dDsA==
X-Gm-Message-State: AN3rC/7VqIuTlwrwh6JKWneTQgGndiMeYHUS8wPrtrXNotwkqIBzWxnPsgWAdOGs5mptDIGMFZDAuRDzBAGd8A==
X-Received: by 10.223.174.131 with SMTP id y3mr4585205wrc.196.1492023842374;
	Wed, 12 Apr 2017 12:04:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.148.54 with HTTP; Wed, 12 Apr 2017 12:04:01 -0700 (PDT)
In-Reply-To: <CA+M3ks7GBnLNO4BXHGPwdr9wL29_-B-v6=Vk5h0=1JeQaJ2hpw@mail.gmail.com>
References: <1491486145-30397-1-git-send-email-benjamin.gaignard@linaro.org>
	<CA+chaQfVWLdyBnf8ewW3OFV=tmFT6D-5YZDJnrvihSEpAdGmiQ@mail.gmail.com>
	<CA+M3ks7GBnLNO4BXHGPwdr9wL29_-B-v6=Vk5h0=1JeQaJ2hpw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 12 Apr 2017 21:04:01 +0200
Message-ID: <CA+chaQes5kzcF8X8U=E_n_Yc=cOX0jPUr26ospPT01MzBpG0bQ@mail.gmail.com>
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Wed, 12 Apr 2017 19:04:01 -0000
Content-Type: text/plain; charset=UTF-8

If you're testing it with master, then the xmllint from host cannot be used
because of HOSTPATH filtering recently merged.

For other configuration you can see:
http://www.openembedded.org/wiki/Bitbake_World_Status_Setup


On Wed, Apr 12, 2017 at 8:46 PM, Benjamin Gaignard <
benjamin.gaignard@linaro.org> wrote:

> 2017-04-12 14:45 GMT+02:00 Martin Jansa <martin.jansa@gmail.com>:
> > Still fails to build:
> > http://errors.yoctoproject.org/Errors/Details/140323/
>
> That is an error I never had in my setup.
> I guess that libxml2 native is missing but I have way to reproduce the
> problem.
> How is it possible to perform the same build then you ?
>
> >
> > On Thu, Apr 6, 2017 at 3:42 PM, Benjamin Gaignard
> > <benjamin.gaignard@linaro.org> wrote:
> >>
> >> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> >> ---
> >> version 2:
> >> - create user and group for tinyproxy
> >> - only install the service if systemd is present in DISTRO_FEATURE
> >> - add dependency on asciidoc-native
> >>  .../tinyproxy/tinyproxy/tinyproxy.service          | 14 ++++++++
> >>  .../recipes-support/tinyproxy/tinyproxy_1.8.4.bb   | 41
> >> ++++++++++++++++++++++
> >>  2 files changed, 55 insertions(+)
> >>  create mode 100644
> >> meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.service
> >>  create mode 100644
> >> meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb
> >>
> >> diff --git
> >> a/meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.service
> >> b/meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.service
> >> new file mode 100644
> >> index 0000000..ea079f9
> >> --- /dev/null
> >> +++
> >> b/meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.service
> >> @@ -0,0 +1,14 @@
> >> +[Unit]
> >> +Description=Tinyproxy, Lightweight http(s) proxy daemon
> >> +RequiresMountsFor=/var
> >> +
> >> +[Service]
> >> +Group=tinyproxy
> >> +ExecStartPre=/bin/mkdir -p /var/log/tinyproxy
> >> +ExecStartPre=/bin/chown -R nobody.tinyproxy /var/log/tinyproxy
> >> +ExecStartPre=/bin/mkdir -p /var/run/tinyproxy
> >> +ExecStartPre=/bin/chown -R nobody.tinyproxy /var/run/tinyproxy
> >> +ExecStart=/usr/sbin/tinyproxy -d
> >> +
> >> +[Install]
> >> +WantedBy=multi-user.target
> >> diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.
> 8.4.bb
> >> b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb
> >> new file mode 100644
> >> index 0000000..ef2a2d8
> >> --- /dev/null
> >> +++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb
> >> @@ -0,0 +1,41 @@
> >> +SUMMARY = "Lightweight http(s) proxy daemon"
> >> +HOMEPAGE = "https://tinyproxy.github.io/"
> >> +LICENSE = "GPLv2"
> >> +LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882b
> be"
> >> +
> >> +SRC_URI =
> >> "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz
> \
> >> +                  file://tinyproxy.service"
> >> +
> >> +SRC_URI[md5sum] = "3b60f7d08e0821ed1a3e2cf1e5778cac"
> >> +SRC_URI[sha256sum] =
> >> "8234c879a129feee61efa98bac14a1a3e46e5cf08f01696a216940872aa70faf"
> >> +
> >> +DEPENDS = "asciidoc-native"
> >> +
> >> +EXTRA_OECONF += " \
> >> +       --enable-filter \
> >> +       --enable-transparent \
> >> +       --disable-regexcheck \
> >> +       --enable-reverse \
> >> +       --enable-upstream \
> >> +       --enable-xtinyproxy \
> >> +       "
> >> +
> >> +inherit autotools systemd useradd
> >> +
> >> +#User specific
> >> +USERADD_PACKAGES = "${PN}"
> >> +USERADD_PARAM_${PN} = "nobody"
> >> +GROUPADD_PARAM_${PN} = "--system tinyproxy"
> >> +
> >> +SYSTEMD_PACKAGES += "${BPN}"
> >> +SYSTEMD_SERVICE_${PN} = "tinyproxy.service"
> >> +SYSTEMD_AUTO_ENABLE_${PN} = "enable"
> >> +
> >> +do_install_append() {
> >> +       if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true',
> >> 'false', d)}; then
> >> +               install -d ${D}${systemd_system_unitdir}
> >> +               install -m 0644 ${WORKDIR}/tinyproxy.service
> >> ${D}${systemd_system_unitdir}
> >> +       fi
> >> +}
> >> +
> >> +FILES_${PN} =+ "${systemd_system_unitdir}/tinyproxy.service"
> >> --
> >> 1.9.1
> >>
> >
>

