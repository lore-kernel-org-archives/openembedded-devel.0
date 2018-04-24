Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id BF4D271C0F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Apr 2018 16:46:58 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id b5so11275534pgv.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Apr 2018 09:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=yFcN0RAfYkdVYz/yvXVsAe41GxPDtTSXcj66GTmwr4I=;
	b=UK7Fr6QMeDb8KA1fMXyO7Yzsc4QhOxAziNcxJltVV2S3y76z6gwXJNqqdEt1r9WFRZ
	2p3xcXLNLK7lcqBNYHjoAm7JO0sIRqYiqk/qRxP8k5ojjeWvohS6OE9abMg7cKurn1hJ
	K0bByh1K7A+eMS40e0aWyc5YFGInSyFGQkOwJ0YEdvOG9MKgIfkGka7M5IoRqdkkrJ3w
	LqNvLHcccW3IWdlYYDGC/wMpvoVW9avu7q5r9j/an4akms8j5z6JRY8jhVyVmy1y+GYm
	xP8GRra46HiCI6m/DaMvnDy8wnNBpMNaHA3ctzbfsA0XcxmC0L6wJ/+xMSNKuuJdiGB4
	H0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=yFcN0RAfYkdVYz/yvXVsAe41GxPDtTSXcj66GTmwr4I=;
	b=r67C700XHwnfhTECPmHpAib5K1EgXiocjwsI3r+VGZVohkBgjwTiVGOZNnVjA63Eop
	GbT2/TF9oYoUq8v3Ut6A8Nvfajj4YnwyrOApj8sUgf6uSfdbAEHh4xYm05UsoLlAHQe0
	V59hhAJjVqC6PPLmRs5QMu6gx+KR0hRmVLuwLOzcsITOb1Ez5bNHFRJyMQtnm73UdyfO
	h4gL6HotXfX3u5K+HwpwKJ1kjxFGlWQg61o/JkdRcSUo+cfXWfrdIu0YAsb0hbkaKvlQ
	Tb/+i8UxxbwBO0x4e/vXwcwlla+rVs3ieWLTZ9ON5ND+JmgNu5md8a2dchXrPSD7RvEs
	Upyg==
X-Gm-Message-State: ALQs6tDI435/awFFZW+t+Vu2hTnKS0UMpmbVJZLk6J7fWFhT76OW+/ZU
	Cn5KNDrwkK79b7e0AJ3VaBJOR/X2difXqEYi8OY=
X-Google-Smtp-Source: AIpwx4+MzYqdTSyOg6Wy0/G3LHMEoYW6wTTeq+y5piLBa3nIxp6jsiEOJJt69rlf/IlJEi3GoJO5mbfe2ekySUAbNkU=
X-Received: by 2002:a17:902:10c:: with SMTP id
	12-v6mr25824603plb.252.1524588419571; 
	Tue, 24 Apr 2018 09:46:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.145.72 with HTTP; Tue, 24 Apr 2018 09:46:29 -0700 (PDT)
In-Reply-To: <20180424091305.44842-1-wguay@graphcore.ai>
References: <20180424091305.44842-1-wguay@graphcore.ai>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 Apr 2018 09:46:29 -0700
Message-ID: <CAMKF1spJiPWuct+eX2iq+PC=EUmjaPRiH1YFhwgQgC7omSDCZA@mail.gmail.com>
To: Wei Lin Guay <wguay@graphcore.ai>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] rdma-core: add new recipe
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
X-List-Received-Date: Tue, 24 Apr 2018 16:46:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 24, 2018 at 2:13 AM, Wei Lin Guay <wguay@graphcore.ai> wrote:
> RDMA core is the userspace components for the Linux Kernel's
> InfiniBand/RoCE subsystem. This component contains the userspace
> libraries for libibverbs (and its associated providers libraries),
> librdmacm and libibumad. Besides, it also provides additional service
> daemons such as ibacm and srp_daemon.
>
> Signed-off-by: Wei Lin Guay <wguay@graphcore.ai>
> Reviewed-by: Harald H=C3=B8eg <hhoeg@graphcore.ai>
> ---
>  .../recipes-support/rdma-core/rdma-core_17.bb      | 22 ++++++++++++++++=
++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta-networking/recipes-support/rdma-core/rdma-core_1=
7.bb
>
> diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_17.bb b/=
meta-networking/recipes-support/rdma-core/rdma-core_17.bb
> new file mode 100644
> index 0000000..e45262a
> --- /dev/null
> +++ b/meta-networking/recipes-support/rdma-core/rdma-core_17.bb
> @@ -0,0 +1,22 @@
> +SUMMARY =3D "Userspace support for InfiniBand/RDMA verbs"
> +DESCRIPTION =3D "This is the userspace components for the Linux Kernel's=
 drivers Infiniband/RDMA subsystem."
> +SECTION =3D "libs"
> +
> +DEPENDS =3D "libnl eudev"

is eudev a must ?

> +RDEPENDS_${PN} =3D "bash perl"
> +
> +SRC_URI =3D "git://github.com/linux-rdma/rdma-core.git;protocol=3Dhttp;r=
ev=3Dv${PV}"

Drop rev pointing to a tag. We need a hardcoded SHA

> +
> +S =3D "${WORKDIR}/git"
> +
> +LICENSE =3D "BSD"

it seems there are GPL-2.0 and MIT in play as well also this seems
more like BSD-2-Clause so
please make it specific.

> +LIC_FILES_CHKSUM =3D "file://COPYING.BSD_MIT;md5=3D4cef3f976a07850eb6d2e=
5d1ef945e6b"
> +
> +
> +FILES_SOLIBSDEV =3D ""
> +FILES_${PN} +=3D "${libdir}/*"
> +INSANE_SKIP_${PN} +=3D "dev-so"
> +
> +inherit cmake
> +
> +OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM =3D "BOTH"
> --
> 2.9.3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

