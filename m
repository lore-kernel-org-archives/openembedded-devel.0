Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
	[209.85.208.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8F6D86150B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 21:26:07 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id c7so1129476edu.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 13:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=ptP21Jk1HsbWQW6zqJ4839cvtmq8AtwSYgxBxdyq2kE=;
	b=OZPnGRZgu1JK9Arbv8qVFJ27cp6ZPDS/IftPdnCPjOFA6JhQAvYbMFuqBsYXgOpJfi
	bw5Eubp/qMp8hnEMObFR/3i2WlyHUWyI1F11V+9xZkMrZkrnkrVE5kesvUnQ7Z1xhmSl
	pjNSI3JXekuLfx7FXq9DwIm+bHoLOSJc01FlHty//+v5drpEnsz1MeRQRgzRK9HjDkSQ
	JLwcwfc/KtirPTjAWZ0uKfw5hETqYxSuSACMBdx9Ww63VZsnfETIRaQjDywMui/F0EEr
	rrjXVx57n9ssXkmaDiF3m0swhT1ejhIlRL7tFL7LyDmiCZE1PzlnEo73ukgmMvK/kuv+
	yClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=ptP21Jk1HsbWQW6zqJ4839cvtmq8AtwSYgxBxdyq2kE=;
	b=r5PY4n3qgHg1U78fDbiotVjwaX9ORpdQEltRznej8oyoGe/sdw3bQF3r/JGDbQrBcQ
	6zTmhHnImB6H/ZQ0Sdz9JdS8V1iR2Kktt7shRSJKtcf/dbBM0QOOHnyEWiwscZsPHmcp
	P1RPYEx/aqhdfYf7udD09yIMjoiiPtKq3pE/9IZDSVJJZuV53bk2Un2rGSqXZaUEdLtX
	CUcYTpYJmIyqYQoeWl1QMvLHAEXFU7eeFGRV5qRBehzxqX+3C9z4zj3YeHmxq5H08+WB
	Kfs8/B5FwWMBt2AJjW9CvHlq62Lol05xnt7+TbfFxEL5/btfYwt5Ab1B3L+Nyx2HBqQT
	RPAw==
X-Gm-Message-State: APjAAAWfX4l0/n4synly5PRo7Id6oYcbsaYgncudGp+lc8NtroHP9I6M
	QwIvh2q1ClulkNGjCzls/oTTpfls/xMIbK5C4wwQyjpD
X-Google-Smtp-Source: APXvYqymQh37HbEU05oXTQdGn0+6KnTtdpDI1FYDTtkE32SrGQlBg0VlQB9VHPKzerjZ90hhdi0idBi1gBOxM4GXPHg=
X-Received: by 2002:a17:906:7d53:: with SMTP id
	l19mr1066571ejp.55.1582665967768; 
	Tue, 25 Feb 2020 13:26:07 -0800 (PST)
MIME-Version: 1.0
References: <158266574202.15681.9378221674340872770@git.openembedded.org>
	<20200225212222.A6EF3232AA5@git.openembedded.org>
In-Reply-To: <20200225212222.A6EF3232AA5@git.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 25 Feb 2020 22:25:56 +0100
Message-ID: <CA+chaQci68OmMJZZddXkUSJXmTkxMGdQZ_87i3rOtfD7t38PGg@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [oe-commits] [meta-openembedded] 09/10: c-ares: move from meta-networking to meta-oe
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
X-List-Received-Date: Tue, 25 Feb 2020 21:26:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

With this one included, you can drop "07/10: nodejs: don't enable ares
support by default"

On Tue, Feb 25, 2020 at 10:22 PM <git@git.openembedded.org> wrote:

> This is an automated email from the git hooks/post-receive script.
>
> khem pushed a commit to branch master-next
> in repository meta-openembedded.
>
> commit d15fd2cfb6bcd2472a8b346cc6fe4bc070675d13
> Author: Martin Jansa <martin.jansa@gmail.com>
> AuthorDate: Tue Feb 25 20:36:15 2020 +0100
>
>     c-ares: move from meta-networking to meta-oe
>
>     * nodejs from meta-oe depends on this since:
>       commit 76dd3dac1f1e67a5c44ad732b8e827cc36ded641
>       Author: Andr=C3=A9 Draszik <git@andred.net>
>       Date:   Tue Oct 29 16:42:24 2019 +0000
>
>         nodejs: allow use of system c-ares (and make default)
>
>         Use system c-ares via PACKAGECONFIG by default. So far,
>         nodejs had been built using its embedded copy of c-ares,
>         which we generally try to avoid, for the known reasons
>         (independent updates, cve & license checks, etc).
>
>         Notes:
>         * otherwise nodejs uses its bundled version of c-ares
>         * the PACKAGECONFIG variable is 'ares' so as to be in
>           line with other uses of this (wget & curl recipes in
>           OE core)
>
>         Signed-off-by: Andr=C3=A9 Draszik <git@andred.net>
>         Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
>     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>     Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../recipes-core/packagegroups/packagegroup-meta-networking.bb
> | 2 +-
>  meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> | 2 +-
>  .../recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch       =
|
> 0
>  {meta-networking =3D> meta-oe}/recipes-support/c-ares/c-ares_1.15.0.bb
> | 0
>  4 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-networking/recipes-core/packagegroups/
> packagegroup-meta-networking.bb
> b/meta-networking/recipes-core/packagegroups/
> packagegroup-meta-networking.bb
> index fa9bf2d..103c99b 100644
> --- a/meta-networking/recipes-core/packagegroups/
> packagegroup-meta-networking.bb
> +++ b/meta-networking/recipes-core/packagegroups/
> packagegroup-meta-networking.bb
> @@ -107,7 +107,7 @@ RDEPENDS_packagegroup-meta-networking-support =3D "\
>      tunctl dovecot ipvsadm stunnel chrony spice-protocol \
>      usbredir ntop wireshark tnftp lksctp-tools \
>      cim-schema-docs cim-schema-final cim-schema-exper \
> -    libmemcached smcroute libtevent ipcalc c-ares uftp \
> +    libmemcached smcroute libtevent ipcalc uftp \
>      ntimed linux-atm ssmtp openvpn rdma-core \
>      iftop aoetools tcpslice tcpdump libtalloc memcached nuttcp netcat \
>      netcat-openbsd fetchmail yp-tools ypbind-mt yp-tools \
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index 0bda946..d096539 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -238,7 +238,7 @@ NE10_armv7a =3D "ne10"
>  NE10_armv7ve =3D "ne10"
>
>  RDEPENDS_packagegroup-meta-oe-support =3D"\
> -    anthy asio atop augeas avro-c bdwgc frame grail \
> +    anthy asio atop augeas avro-c bdwgc frame grail c-ares \
>      ccid ceres-solver ckermit cpprest ctapi-common daemonize \
>      daemontools debsums devmem2 dfu-util dfu-util-native digitemp \
>      dstat eject enca epeg espeak fbset fbset-modes \
> diff --git
> a/meta-networking/recipes-support/c-ares/c-ares/cmake-install-libcares.pc=
.patch
> b/meta-oe/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch
> similarity index 100%
> rename from
> meta-networking/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.p=
atch
> rename to
> meta-oe/recipes-support/c-ares/c-ares/cmake-install-libcares.pc.patch
> diff --git a/meta-networking/recipes-support/c-ares/c-ares_1.15.0.bb
> b/meta-oe/recipes-support/c-ares/c-ares_1.15.0.bb
> similarity index 100%
> rename from meta-networking/recipes-support/c-ares/c-ares_1.15.0.bb
> rename to meta-oe/recipes-support/c-ares/c-ares_1.15.0.bb
>
> --
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>

