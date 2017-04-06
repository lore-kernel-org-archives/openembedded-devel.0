Return-Path: <benjamin.gaignard@linaro.org>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 2682472F3B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Apr 2017 04:44:27 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id p68so3085511qke.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Apr 2017 21:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=amJja41Sh5G6gkMRhqSjYxt4LlKp9XwgXEs/jY6LMA0=;
	b=AzDTD2p+D8owsAeAia9q9bquTzytQ6XpvsvRU7ceT0pQgGDayMK4r+swgLGmBzS+4p
	cZgkzM/WQK7Zjw4H9tyTgpRadbhX8ZdXz060ZWfqEul0LgwQy8BWtcetRw9oyEnxJx1l
	e3+8qHGCEEB4UMusjIHvfajKuPwGZciKx/4v0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=amJja41Sh5G6gkMRhqSjYxt4LlKp9XwgXEs/jY6LMA0=;
	b=rMMsy8F5pqvv2v9ruKtSoauZWQXtXQBdzd219RzTQpPpXdTFzc05ONxYkYxyjW8x6G
	qDjkYbJzgv+A0ebwJVfF4TJXiD8lMUG9T+yzcqavlnfX3Jni3qHBDuMYqqbrZdauNU50
	rNCkzF0cwdxWFzzmqAU8o9Qr676ypj7KW4sJU1KUZH9VOZKNvZ+lQaipOogpfAqQ/zJK
	wMm9yF/telhAw17ck1ebflLuJzA42Yh8dS1JWXUodGfPXrM441hSp9mXmTCojPHRQ+4L
	GM7FS6pkwmy0dCBgo7B+m+uNQ/ARQYa7HvMc0KfDMQ8ekqEIfR9TwGFKDr4T0joN/QUj
	4dOw==
X-Gm-Message-State: AFeK/H10kf0IsnikzhwpQlHzzKxlBk/6ILTITv5fpIoi7vdpjsGN7XSHOVF3MtWuYX9EF65n4mgj7zpatx/xDYxJ
X-Received: by 10.55.78.80 with SMTP id c77mr15859503qkb.221.1491453868537;
	Wed, 05 Apr 2017 21:44:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.83.178 with HTTP; Wed, 5 Apr 2017 21:44:28 -0700 (PDT)
In-Reply-To: <CAMKF1sqmN=uUotOH7sKF4LfYVoEkBzhggT+17GjQqH9-MLb8+g@mail.gmail.com>
References: <1491396806-3521-1-git-send-email-benjamin.gaignard@linaro.org>
	<CAMKF1sqmN=uUotOH7sKF4LfYVoEkBzhggT+17GjQqH9-MLb8+g@mail.gmail.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Thu, 6 Apr 2017 06:44:28 +0200
Message-ID: <CA+M3ks6MnVzi2mPi1BSrwxMa-aNn8Ac5eKqsbn68cTOWbgfaKg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Thu, 06 Apr 2017 04:44:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2017-04-05 19:29 GMT+02:00 Khem Raj <raj.khem@gmail.com>:
> On Wed, Apr 5, 2017 at 5:53 AM, Benjamin Gaignard
> <benjamin.gaignard@linaro.org> wrote:
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
>
> There could be a problem if this user/group does not exist

I will add extra user in recipe and change to "nobody.tinyproxy" to avoid "=
adm"

>
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
>> +SRC_URI +=3D "file://tinyproxy.service"
>> +
>> +SRC_URI[md5sum] =3D "3b60f7d08e0821ed1a3e2cf1e5778cac"
>> +SRC_URI[sha256sum] =3D "8234c879a129feee61efa98bac14a1a3e46e5cf08f01696=
a216940872aa70faf"
>> +
>> +EXTRA_OECONF +=3D " \
>> +       --enable-filter \
>> +       --enable-transparent \
>> +       --disable-regexcheck \
>> +       --enable-reverse \
>> +       --enable-upstream \
>> +       --enable-xtinyproxy \
>> +       "
>> +
>> +inherit autotools systemd
>> +
>> +SYSTEMD_PACKAGES +=3D "${PN}"
>> +SYSTEMD_SERVICE_${PN} =3D "tinyproxy.service"
>> +SYSTEMD_AUTO_ENABLE_${PN} =3D "enable"
>> +
>> +do_install_append() {
>> +       install -d ${D}${systemd_system_unitdir}
>> +       install -m 0644 ${WORKDIR}/tinyproxy.service ${D}${systemd_syste=
m_unitdir}
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



--=20
Benjamin Gaignard

Graphic Study Group

Linaro.org =E2=94=82 Open source software for ARM SoCs

Follow Linaro: Facebook | Twitter | Blog

