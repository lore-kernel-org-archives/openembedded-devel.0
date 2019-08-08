Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 412747D279
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Aug 2019 04:29:15 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id u17so43328006pgi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Aug 2019 21:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=UZtILiW1/BTdAHPCwefmNV8O8HxO4hB49w5V5HR8mEI=;
	b=kaV/qNHsR84X7cB6B9iaNGtc1z1TWm7nF83tLqCBJAm9Kf5aPBpn96IY5SwrE1j/ya
	bwkfuqH1PcQF7MYdw7wLZNN7/Pz4gO/AK/MrXA9+mfbAyzGR7f0GM2vkx30fdg18Y9Z/
	IDilzzJUFLpL8iTbbHQrqnu404c4VDVkWiQ6x7xLW/7dk/IITqcpUDwbPMqWjFtmVbhk
	2HcOxS4ak0mgFy6mynGTMkoldYMmyzSG1S2j01fpqCgQKLnYzpNXW7l+mSGD4kB6nh1g
	VAzAS/3WJOrG8K8Va1C8NqM65CgsRxidRnXS3ihvYQEEOZR/XrKd+Kb9q0dajZYvGGeU
	zC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=UZtILiW1/BTdAHPCwefmNV8O8HxO4hB49w5V5HR8mEI=;
	b=SlUAOK1M3QzYzygPKjz19ehzAzoipc3tz09aVjprZpEBCaA2GIjVBYQBucJFcqhN4G
	abetduPXcfod8rJekN29YLDjXCU7XqWBri5SbUmgUFMrq6XqEi5vlrc/n153mhHHWMmE
	OOuiZpxTTGqP3HthzYBnEv8B9imSnZqdIdTS21rMCTdkytEeVe49WMx71RmVxVf8sKm6
	qrDakjfDhdAE3rm8j1hfJLU054Ad21xtQx4qQiZ3Bw8+wb8q6A4MB46fPx4o05/0+JKe
	ri53u1FNy7Lyx+kEgt/k6BZ9ndlZJCg0xPbc0fBcLyUO+DA3hoY+Ly3NlPBGHYFS6x7r
	M8Mg==
X-Gm-Message-State: APjAAAXVp0xlNqm7IFWL5JRGurV22wLRvpDoxbos7ME7j1b2oFVWw5Th
	sx7KAQ4qtABOZR/Y9yYoEv2A3kJ1Bxo=
X-Google-Smtp-Source: APXvYqwz4/SjZ98vgp9TBnN3kiK86U3jdozzegOnPXZEYGKfjpl21ZFCQdrZ+0uv7VxMdC6dkQoEfw==
X-Received: by 2002:aa7:93a5:: with SMTP id x5mr12959337pff.87.1565238555784; 
	Wed, 07 Aug 2019 21:29:15 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:6bc6::baaf? ([2601:646:8500:6bc6::baaf])
	by smtp.gmail.com with ESMTPSA id
	v12sm81195150pgr.86.2019.08.07.21.29.14
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Aug 2019 21:29:15 -0700 (PDT)
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>,
	openembedded-devel@lists.openembedded.org
References: <1565263453-52779-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <134762b5-0997-950d-e47b-3fda6e6c885e@gmail.com>
Date: Wed, 7 Aug 2019 21:29:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565263453-52779-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
Subject: Re: [meta-oe][patch v5] dnf-plugin-tui: new recipe
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
X-List-Received-Date: Thu, 08 Aug 2019 04:29:15 -0000
X-Groupsio-MsgNum: 78978
Content-Type: multipart/mixed; boundary="------------81F5DD04ECBA0E24D1A8B7FC"
Content-Language: en-US

--------------81F5DD04ECBA0E24D1A8B7FC
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thanks for resending. I have some comments below.

On 8/8/19 4:24 AM, Zheng Ruoqin wrote:
> This dnf plugin aims to supply a tui interface for user to manage
> packages. It has features as following:
>   1. Add new command dnf tui --init to make dnf work on host.
>   2. Text-based user interface for dnf.
>   3. Manage SPDX files.
>   4. Manage SRPM files.
>   5. Add installation samples for dnf.
>=20
> More details please refer to https://github.com/ubinux/dnf-plugin-tui.
>=20
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../dnf-plugin-tui/dnf-plugin-tui_git.bb      | 38 +++++++++++++++++++=

>  .../files/oe-remote.repo.sample               |  5 +++
>  2 files changed, 43 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-=
tui_git.bb
>  create mode 100644 meta-oe/recipes-devtools/dnf-plugin-tui/files/oe-re=
mote.repo.sample
>=20
> diff --git a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git=
=2Ebb b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
> new file mode 100644
> index 000000000..e891868cd
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
> @@ -0,0 +1,38 @@
> +SUMMARY =3D "A text-based user interface plugin of dnf for user to man=
age packages. "
> +LICENSE =3D "GPLv2"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4=
a4263"
> +
> +SRC_URI =3D "git://github.com/ubinux/dnf-plugin-tui.git;branch=3Dmaste=
r "

master is default so lets drop setting branch here

> +SRCREV =3D "31d6866d5eda02be9a6bfb1fca9e9095b12eecd1"
> +PV =3D "1.0"

Drop PV

> +
> +SRC_URI_append_class-target =3D "file://oe-remote.repo.sample"
                                  ^^
missing space

> +
> +inherit distutils3-base
> +
> +S =3D "${WORKDIR}/git"
> +
> +do_install_append() {
> +        install -d ${D}${datadir}/dnf
> +        install -m 0755 ${S}/samples/* ${D}${datadir}/dnf
> +        install -d ${D}${PYTHON_SITEPACKAGES_DIR}/dnf-plugins/mkimg
> +        install -m 0755 ${S}/dnf-plugins/mkimg/* ${D}${PYTHON_SITEPACK=
AGES_DIR}/dnf-plugins/mkimg
> +        for file in $(ls ${S}/dnf-plugins/ | grep -v mkimg); do
> +            install -m 0755 ${S}/dnf-plugins/$file ${D}${PYTHON_SITEPA=
CKAGES_DIR}/dnf-plugins
> +        done
> +}
> +
> +do_install_append_class-target() {
> +        install -d ${D}${sysconfdir}/yum.repos.d
> +        install -m 0644 ${WORKDIR}/oe-remote.repo.sample ${D}${sysconf=
dir}/yum.repos.d
> +}
> +
> +FILES_${PN} +=3D "${datadir}/dnf"
> +
> +RDEPENDS_${PN} +=3D " \
> +  dnf \
> +  libnewt-python \
> +  "
> +
> +BBCLASSEXTEND =3D "nativesdk"
> diff --git a/meta-oe/recipes-devtools/dnf-plugin-tui/files/oe-remote.re=
po.sample b/meta-oe/recipes-devtools/dnf-plugin-tui/files/oe-remote.repo.=
sample
> new file mode 100644
> index 000000000..6c4502e17
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/dnf-plugin-tui/files/oe-remote.repo.samp=
le
> @@ -0,0 +1,5 @@
> +[base]
> +name=3Dmyrepo
> +baseurl=3Dhttp://127.0.0.1/oe_repo/
> +enabled=3D1
> +gpgcheck=3D0
>=20

--------------81F5DD04ECBA0E24D1A8B7FC
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=3Dsj8j
-----END PGP PUBLIC KEY BLOCK-----

--------------81F5DD04ECBA0E24D1A8B7FC--
