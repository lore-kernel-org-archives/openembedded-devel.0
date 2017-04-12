Return-Path: <benjamin.gaignard@linaro.org>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id EAA1977C32
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 18:46:22 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id f133so30970558qke.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 11:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TJLmxXHZOp/NrAZfmUcpEEw5FkuX4NATqVA+m83Pwg4=;
	b=iSYaPX3eRv6grLiI9SDfrVOiC51mgwGDug3cBDLKosamRUHiPxym7lzYw+5OnynTc3
	/avWsRp3iIVThqzlBw9IPVzJRY1VfPz1pI/STgD4FknusoQeUDYJ4y3oQP2iOMuhxI/7
	SUL0KuM1I3V994RTGxpRyJG1y7cTZlWifdF3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TJLmxXHZOp/NrAZfmUcpEEw5FkuX4NATqVA+m83Pwg4=;
	b=IfuI2USTAg8WYogAut7vl1nlc8FkPCGQc6e/kRzDxrIJ5y9QV1I0LAUXVazIutRR9L
	PrcV+Xen1nHA+GjhPu4VA5Fd3fzQYjUlrQ6W0ZgT5y0BnjdmqeALnx/E9dHGz8C9mA2m
	wsHomNQsvnrPfGGu5rzGN/+aJULOnEHFFEQ4sdukGcY3o64/HO4GB8bLbYM7Is6Oy4oD
	5Hscm5sqjPf5+rzMEo+rtNH+t7jS87Qt5eBVZTVG+Ht+KALT4EM9R/rocFqEzdFLjccG
	0W+nhFhVYnnG9FMogprPQFgSEYpawaHY7ALQvvF1CMdtm8eMkVFZPpuu67hlXDSk4o1k
	11OA==
X-Gm-Message-State: AFeK/H0pyK2YlClAPwsySv9mcm2HDoNLG0S2ZmYfWNWj6MCvPcnV5lM9QJWBu1lAtEJIBPUxnFwUd+m4hwae6iHD
X-Received: by 10.55.214.71 with SMTP id t68mr51591876qki.211.1492022783751;
	Wed, 12 Apr 2017 11:46:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.83.178 with HTTP; Wed, 12 Apr 2017 11:46:23 -0700 (PDT)
In-Reply-To: <CA+chaQfVWLdyBnf8ewW3OFV=tmFT6D-5YZDJnrvihSEpAdGmiQ@mail.gmail.com>
References: <1491486145-30397-1-git-send-email-benjamin.gaignard@linaro.org>
	<CA+chaQfVWLdyBnf8ewW3OFV=tmFT6D-5YZDJnrvihSEpAdGmiQ@mail.gmail.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Wed, 12 Apr 2017 20:46:23 +0200
Message-ID: <CA+M3ks7GBnLNO4BXHGPwdr9wL29_-B-v6=Vk5h0=1JeQaJ2hpw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
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
X-List-Received-Date: Wed, 12 Apr 2017 18:46:33 -0000
Content-Type: text/plain; charset=UTF-8

2017-04-12 14:45 GMT+02:00 Martin Jansa <martin.jansa@gmail.com>:
> Still fails to build:
> http://errors.yoctoproject.org/Errors/Details/140323/

That is an error I never had in my setup.
I guess that libxml2 native is missing but I have way to reproduce the problem.
How is it possible to perform the same build then you ?

>
> On Thu, Apr 6, 2017 at 3:42 PM, Benjamin Gaignard
> <benjamin.gaignard@linaro.org> wrote:
>>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>
>> ---
>> version 2:
>> - create user and group for tinyproxy
>> - only install the service if systemd is present in DISTRO_FEATURE
>> - add dependency on asciidoc-native
>>  .../tinyproxy/tinyproxy/tinyproxy.service          | 14 ++++++++
>>  .../recipes-support/tinyproxy/tinyproxy_1.8.4.bb   | 41
>> ++++++++++++++++++++++
>>  2 files changed, 55 insertions(+)
>>  create mode 100644
>> meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.service
>>  create mode 100644
>> meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb
>>
>> diff --git
>> a/meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.service
>> b/meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.service
>> new file mode 100644
>> index 0000000..ea079f9
>> --- /dev/null
>> +++
>> b/meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.service
>> @@ -0,0 +1,14 @@
>> +[Unit]
>> +Description=Tinyproxy, Lightweight http(s) proxy daemon
>> +RequiresMountsFor=/var
>> +
>> +[Service]
>> +Group=tinyproxy
>> +ExecStartPre=/bin/mkdir -p /var/log/tinyproxy
>> +ExecStartPre=/bin/chown -R nobody.tinyproxy /var/log/tinyproxy
>> +ExecStartPre=/bin/mkdir -p /var/run/tinyproxy
>> +ExecStartPre=/bin/chown -R nobody.tinyproxy /var/run/tinyproxy
>> +ExecStart=/usr/sbin/tinyproxy -d
>> +
>> +[Install]
>> +WantedBy=multi-user.target
>> diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb
>> b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb
>> new file mode 100644
>> index 0000000..ef2a2d8
>> --- /dev/null
>> +++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb
>> @@ -0,0 +1,41 @@
>> +SUMMARY = "Lightweight http(s) proxy daemon"
>> +HOMEPAGE = "https://tinyproxy.github.io/"
>> +LICENSE = "GPLv2"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>> +
>> +SRC_URI =
>> "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz \
>> +                  file://tinyproxy.service"
>> +
>> +SRC_URI[md5sum] = "3b60f7d08e0821ed1a3e2cf1e5778cac"
>> +SRC_URI[sha256sum] =
>> "8234c879a129feee61efa98bac14a1a3e46e5cf08f01696a216940872aa70faf"
>> +
>> +DEPENDS = "asciidoc-native"
>> +
>> +EXTRA_OECONF += " \
>> +       --enable-filter \
>> +       --enable-transparent \
>> +       --disable-regexcheck \
>> +       --enable-reverse \
>> +       --enable-upstream \
>> +       --enable-xtinyproxy \
>> +       "
>> +
>> +inherit autotools systemd useradd
>> +
>> +#User specific
>> +USERADD_PACKAGES = "${PN}"
>> +USERADD_PARAM_${PN} = "nobody"
>> +GROUPADD_PARAM_${PN} = "--system tinyproxy"
>> +
>> +SYSTEMD_PACKAGES += "${BPN}"
>> +SYSTEMD_SERVICE_${PN} = "tinyproxy.service"
>> +SYSTEMD_AUTO_ENABLE_${PN} = "enable"
>> +
>> +do_install_append() {
>> +       if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true',
>> 'false', d)}; then
>> +               install -d ${D}${systemd_system_unitdir}
>> +               install -m 0644 ${WORKDIR}/tinyproxy.service
>> ${D}${systemd_system_unitdir}
>> +       fi
>> +}
>> +
>> +FILES_${PN} =+ "${systemd_system_unitdir}/tinyproxy.service"
>> --
>> 1.9.1
>>
>

