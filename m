Return-Path: <benjamin.gaignard@linaro.org>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 061B072F18
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Apr 2017 12:29:06 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id f133so44534849qke.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Apr 2017 05:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BS9QagG6kc0G/4x40bxlsTunb82duqm+1C2qa+PmqQo=;
	b=eXwhvF5JMBP193IO+/3zWdEADNfQvyC1fVXyADFuvRQaxu6EXjpgvTVF84mZQ77EnI
	0+ISu10KskL7owIHRHlMp5AfTWzTp1NbWuF8seGqTyQc38HSHJ+JWVJiEhXT5/J5tYJU
	EEzX0WwQYkTLZawATXouUxPJ/V4yCoyIpOsLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BS9QagG6kc0G/4x40bxlsTunb82duqm+1C2qa+PmqQo=;
	b=mGHN4jl27Yj6Ud/6fz8ETXQaPsbzzOCmrynNf2YmIpRjGRDF+GoALHoSKqWOpiOO++
	7sBEC1frDO8U7E/TpVoQeq1rCVZtShTUynjnuuFqcDSM+e/AfmwtSfDVie32i+Ip0PGE
	I4pQBxTunAaMDkNGNO2q4RR50Z5V9mPNFMueX5mn80RS010c2R+V5YwhyV0xz7HSBaP2
	S5guDIytUNG8aMiuR+AjOsXRGQgwfCOWn5348c6WEPI82rD/6+66YpCPsnVuT4vOH9Ds
	qKId2Ef2cBwmJqJcaYQUIAtRuu9s+OllGo4PtwIR+2c3YWdAzZGPgaLOtDZsRx1obTo+
	if8A==
X-Gm-Message-State: AN3rC/7lCBNItloJR5JgI5eDmr4zQeqImZeG09RKkziK4e+LBHfKUUIM
	ZH5W7sqzncp3XA9P8RuqSX6u4wDWlu+Y
X-Received: by 10.55.42.220 with SMTP id q89mr1389553qkq.211.1492691348006;
	Thu, 20 Apr 2017 05:29:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.81.16 with HTTP; Thu, 20 Apr 2017 05:29:07 -0700 (PDT)
In-Reply-To: <20170420070908.GB3059@jama>
References: <1492086867-15041-1-git-send-email-benjamin.gaignard@linaro.org>
	<20170420070908.GB3059@jama>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Thu, 20 Apr 2017 14:29:07 +0200
Message-ID: <CA+M3ks54Y=XNxR5aR80=GdWOFzYj+mrztHBuR=-qTyUOeMjYnA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH v3] tinyproxy: Add recipe
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
X-List-Received-Date: Thu, 20 Apr 2017 12:29:07 -0000
Content-Type: text/plain; charset=UTF-8

2017-04-20 9:09 GMT+02:00 Martin Jansa <martin.jansa@gmail.com>:
> On Thu, Apr 13, 2017 at 02:34:27PM +0200, Benjamin Gaignard wrote:
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@linaro.org>
>> ---
>>  .../tinyproxy/tinyproxy/tinyproxy.service          | 14 ++++++++
>>  .../recipes-support/tinyproxy/tinyproxy_1.8.4.bb   | 39 ++++++++++++++++++++++
>>  2 files changed, 53 insertions(+)
>>  create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.service
>>  create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb
>
> Still fails:
> http://errors.yoctoproject.org/Errors/Details/140513/

ok, v4 will be more simple with just a patch to remove documentation generation.

Thanks for your time

Benjamin
>
>>
>> diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.service b/meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.service
>> new file mode 100644
>> index 0000000..ea079f9
>> --- /dev/null
>> +++ b/meta-networking/recipes-support/tinyproxy/tinyproxy/tinyproxy.service
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
>> diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb
>> new file mode 100644
>> index 0000000..f0374b8
>> --- /dev/null
>> +++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.8.4.bb
>> @@ -0,0 +1,39 @@
>> +SUMMARY = "Lightweight http(s) proxy daemon"
>> +HOMEPAGE = "https://tinyproxy.github.io/"
>> +LICENSE = "GPLv2"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>> +
>> +SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz \
>> +                file://tinyproxy.service"
>> +
>> +SRC_URI[md5sum] = "3b60f7d08e0821ed1a3e2cf1e5778cac"
>> +SRC_URI[sha256sum] = "8234c879a129feee61efa98bac14a1a3e46e5cf08f01696a216940872aa70faf"
>> +
>> +DEPENDS = "asciidoc-native libxml2-native libxslt-native"
>> +
>> +EXTRA_OECONF += " \
>> +     --enable-filter \
>> +     --enable-transparent \
>> +     --disable-regexcheck \
>> +     --enable-reverse \
>> +     --enable-upstream \
>> +     --enable-xtinyproxy \
>> +     "
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
>> +     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
>> +             install -d ${D}${systemd_system_unitdir}
>> +             install -m 0644 ${WORKDIR}/tinyproxy.service ${D}${systemd_system_unitdir}
>> +     fi
>> +}
>> --
>> 1.9.1
>>
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

