Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 950E560123
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Apr 2017 17:26:05 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id t20so4607368wra.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Apr 2017 10:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=M4qN4JT9cnpc1gPuAITfqns9bBJvoKpcZL23k/K8qJk=;
	b=nMz8pnxHQaqvA1bDg/R8Lw4ZIw2qNl7EGQNN4cajOUuIl2X6CSxNNxSra6F2nuu/Q7
	iHkQX3WUgqj9K/PH+DtNb3WQmxEp4HjdRKD274wamKIeWbaNnu+W5FCksDpLr89/duCk
	TVSnorYO/0TI40Xx78ptowbMEWaCGu4SWUORnwZnAA3RN6IxWEOUChQbiMXBIWh88sa1
	ygzdLzsbtCexGr8FQQ2I9Zn0c2fbx4LQgSgcGJBzQPpEgaGzOMg0pm8JsJm6NdCJjJ7t
	wqIj7kAFgji4C5r/4E6lh9+PCJxGWOkNX9UiBYth2NVt8k9Z73Z5G/TnAmk08k+pOAdW
	3fbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=M4qN4JT9cnpc1gPuAITfqns9bBJvoKpcZL23k/K8qJk=;
	b=QqHA/uZp03kbu9kjlPLAxYL7JXlWDA3TgIEcQ25aF2t8aN6EckgC0rYKa89r8YPukW
	yDBC5KhQlkWueCo9NdA9hPlY8WVMTC9jLtY/tlsk9xqOIAP3nAil8TJ9QvcrAF4Cbyu4
	1s8Lyi2WisLvPJsNdRyBt+xpfiL+fRMAsEijBBTz0Jq50BwVqAyXfNdBvJ0yxZxLh8pP
	qJJIUNleCwALfxX7zk9rFdLO0ZdcDzyEVANNXi1WSJFZDFJZEfUXX+ExaWwO3Ksx6/BJ
	81I9iE5ttwrzK+R0LVC6c2vMf+7Le1LFENyIZQgyRx3IKLY6gjZvmpLqCPx5I3XSIcwS
	Nd/w==
X-Gm-Message-State: AFeK/H3DPZsmKIZV+ldvYCUpqVEi188gTqWYMJdMd3O8TFjO2YRxsYgQ26r/qqidmhC9d4YufpKIZIBlIR+Q4w==
X-Received: by 10.223.128.194 with SMTP id 60mr19372974wrl.175.1491413166165; 
	Wed, 05 Apr 2017 10:26:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.162 with HTTP; Wed, 5 Apr 2017 10:25:35 -0700 (PDT)
In-Reply-To: <20170405134110.GA20393@graute-opti>
References: <20170405134110.GA20393@graute-opti>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Apr 2017 10:25:35 -0700
Message-ID: <CAMKF1sqQFWhuuhEQ8HJMXan9ReaxAJ00P_fwCTGUNNGa-EhqzQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Joe MacDonald <joe_macdonald@mentor.com>
Subject: Re: [meta-networking] [PATCH] libreswan: this patch adds libreswan to meta-networking
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
X-List-Received-Date: Wed, 05 Apr 2017 17:26:06 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 5, 2017 at 6:41 AM, Oliver Graute <oliver.graute@gmail.com> wrote:
> Libreswan is an IPsec implementation for Linux
>
> Signed-off-by: Oliver Graute <oliver.graute@neuhaus.de>
> ---
>  .../recipes-support/libreswan/libreswan_3.20.bb    | 48 ++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 meta-networking/recipes-support/libreswan/libreswan_3.20.bb
>
> diff --git a/meta-networking/recipes-support/libreswan/libreswan_3.20.bb b/meta-networking/recipes-support/libreswan/libreswan_3.20.bb
> new file mode 100644
> index 0000000..e291211
> --- /dev/null
> +++ b/meta-networking/recipes-support/libreswan/libreswan_3.20.bb
> @@ -0,0 +1,48 @@
> +SUMMERY = "Libreswan is an IPsec implementation for Linux."
> +DESCRIPTION = "IPsec implementation with IKEv1 and IKEv2 keying protocols"
> +HOMEPAGE = "http://www.libreswan.org"
> +SECTION = "net"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +DEPENDS = "gmp nss libcap-ng libevent iproute2 iptables unbound flex-native"
> +RRECOMMENDS_${PN} = "kernel-module-ipsec"
> +RDEPENDS_${PN} = "python curl libpam"
> +RDEPENDS_${PN}_nylon = "perl"

call it ${PN}-nylon for naming consistency

> +PR = "r0"

Drop this, its default

> +
> +SRC_URI = "http://download.libreswan.org/libreswan-${PV}.tar.gz"
> +SRC_URI[md5sum] = "72aecdf8314c0c47546d5ae2cf918191"
> +SRC_URI[sha256sum] = "2f0931c11ea0b9303ce1e4ee76ffe9db6f3bd70ceead51fe4ec11e2f40a9ae2e"
> +
> +S = "${WORKDIR}/libreswan-${PV}"
> +
> +EXTRA_OEMAKE = "DESTDIR=${D} \
> +                FINALCONFDIR=${sysconfdir}/ipsec \
> +                INC_RCDEFAULT=${sysconfdir}/init.d \
> +                INC_USRLOCAL=${prefix} \
> +                INC_MANDIR=/share/man \
> +                FINALSBINDIR=${bindir} \
> +                FINALLIBEXECDIR=${libexecdir}/ipsec \
> +                USE_XAUTH=true \
> +                USE_LIBCAP_NG=true \
> +                USE_LEAK_DETECTIVE=false \
> +                WERROR='' \
> +                "
> +
> +do_compile () {
> +    export ARCH=${TARGET_ARCH}
> +    ${S}/CROSSCOMPILE.sh
> +    make \

can we call oe_runmake here

> +    #programs
> +    oe_runmake programs
> +}
> +
> +do_install () {
> +        oe_runmake install
> +        install -d ${D}${datadir}/doc
> +}
> +
> +FILES_${PN} = "${sysconfdir} ${libdir}/ipsec/* ${sbindir}/* ${bindir}/* ${localstatedir}/* ${libexecdir}/ipsec/* /run"

/run is a generated file. You should not package it instead just
delete it if empty. If not empty find a way to generate the files in
/run at runtime.

> +FILES_${PN}-dbg += "${libdir}/ipsec/.debug ${libexecdir}/ipsec/.debug"
> +FILES_${PN}-doc += "${datadir}/libreswan/* ${mandir}/*"
> +CONFFILES_${PN} = "${sysconfdir}/ipsec/ipsec.conf"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

