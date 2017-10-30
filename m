Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id B378D605BF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Oct 2017 23:14:55 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id i5so12239638pfe.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Oct 2017 16:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=u9D9PI8+8clyi5+EwsWy48+RR0F7Vj/eYTT+bUGVZLU=;
	b=I91ThedDgaztlPDKJ+Y1mzWXnraE3YgY0JYm8NtIJl7qNEqNK7Hqcb5a8hde4sEODz
	S/bGZcRr2nIjKV2rd0gPOiSpAt03NvkO2mYOSK/AWR8EU3vKio1mk8Ci9oczMbWufnRC
	ZJ3ir6O7pqtnT2RFME5fqT8Pvw0gvBcMazUOhVVk1HYHXyQtADwzMW8ycRvIkDkK8VJQ
	GvAO+8chUFB1oBBlQABcaRazoQqbhwV+Pp69k+Pb/gMSRR+qn/RbegG92K9D5wd6PeWg
	FnwWTTUTBGg0u4XJMwC4l68Jwmx27MMThqQhkXKU+5j/xcTkcDaVXVOGczsaugNw8r6B
	lsSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=u9D9PI8+8clyi5+EwsWy48+RR0F7Vj/eYTT+bUGVZLU=;
	b=YlXGNUDhCK0V6PyvdzhGfYYPXawrHcBPRE9uM8I9KVaF99Wt4453MsVunwdczGN2HT
	luLlZ69W7BM5WxVLCBymBa4y7NhH7nlEwslPC5QGf5ku/2pMYEw+tj+xiCnTyoLXPALN
	FVG9vOPa1w+3bWAiB33cqNJdlCWIMw7nqJtTDg7yeCbped/f+LFQuuLqSx7L2LcG/8RZ
	7GPVmZe7+j+FKK81WJJ1K4mWYDBFdNUJvUXBr515jlg/JEiPAyUGMKJNEp+/Jya7+Sid
	/ja8Bs0pRqULGQnjP8U7icw9tZnqqgacOYWFRGPgFW1nz215TmrqBWpi14mZAtCePHxr
	QL2A==
X-Gm-Message-State: AMCzsaXfLxBCwba0qMNJghVlf0udY0iW7I+0V8V8mALdgZYf3Rb/N8a2
	8c/asuC/Y2Hu8KKnLyi0n9cm2rxN1ECsfJaQRns=
X-Google-Smtp-Source: ABhQp+QgQ7bewe/9K+G/QYmvMiMCR2UUB5FwgYuZ94W/au0wXXPZliZ8Bha4qxTvpuRV1fpehra13hswvvRKUHhUbx0=
X-Received: by 10.98.148.9 with SMTP id m9mr10116416pfe.111.1509405296439;
	Mon, 30 Oct 2017 16:14:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Mon, 30 Oct 2017 16:14:26 -0700 (PDT)
In-Reply-To: <1509387073-21934-2-git-send-email-joe_macdonald@mentor.com>
References: <1509387073-21934-1-git-send-email-joe_macdonald@mentor.com>
	<1509387073-21934-2-git-send-email-joe_macdonald@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Oct 2017 16:14:26 -0700
Message-ID: <CAMKF1spKpcdiGpxLcFhUniOULxWeiST-d20r85pkOepo_7awNw@mail.gmail.com>
To: Joe MacDonald <joe_macdonald@mentor.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 1/6] ddclient: new package
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
X-List-Received-Date: Mon, 30 Oct 2017 23:14:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 30, 2017 at 11:11 AM, Joe MacDonald
<joe_macdonald@mentor.com> wrote:
> From: "Kinsella, Ray" <ray.kinsella@intel.com>
>
> Adding the package ddclient. DDClient updates Dynamic DNS servers with an IP address.
> Recipe is based on the original OE recipe found here.
>
> http://cgit.openembedded.org/openembedded/tree/recipes/ddclient/ddclient_3.6.3.bb
>
> with modifications based on the recipe at:
>
> https://github.com/cshoredaniel/meta-cshored/blob/master/recipes-connectivity/ddclient/ddclient_3.8.3.bb
>
> DDClient version has been updated to 3.8.3.
>
> Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> ---
>  .../recipes-daemons/ddclient/ddclient_3.8.3.bb     | 44 ++++++++++++++++++++++
>  .../recipes-daemons/ddclient/files/ip-up           |  4 ++
>  .../recipes-daemons/ddclient/files/persistent      |  1 +
>  3 files changed, 49 insertions(+)
>  create mode 100644 meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb
>  create mode 100644 meta-networking/recipes-daemons/ddclient/files/ip-up
>  create mode 100644 meta-networking/recipes-daemons/ddclient/files/persistent
>
> diff --git a/meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb b/meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb
> new file mode 100644
> index 0000000..d83a4d4
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb
> @@ -0,0 +1,44 @@
> +SECTION = "net/misc"
> +DESCRIPTION = "Ddclient is a Perl client used to update dynamic DNS entries for accounts on Dynamic DNS Network Services"
> +HOMEPAGE = "http://ddclient.sourceforge.net/"
> +LICENSE = "GPLv2"
> +
> +SRC_URI = "\
> +    ${SOURCEFORGE_MIRROR}/ddclient/ddclient-${PV}.tar.bz2 \
> +    file://ip-up"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
> +
> +RDEPENDS_${PN} = "\
> +    perl-module-getopt-long \
> +    perl-module-sys-hostname \
> +    perl-module-io-socket \
> +    perl-module-vars \
> +    perl-module-overload \
> +    perl-module-overloading \
> +    perl-module-config \
> +    perl-module-integer \
> +    perl-module-exporter-heavy \
> +    perl-module-symbol \
> +    perl-module-selectsaver \
> +    bash \
> +    perl \
> +    libio-socket-ssl-perl"
> +
> +do_install() {
> +    install -d ${D}${sbindir} ${D}${sysconfdir}/ddclient ${D}${sysconfdir}/init.d
> +    install -d ${D}${sysconfdir}/ppp/ip-up.d/ install -d ${D}${docdir}/ddclient
> +    install -m 755 ${S}/ddclient ${D}${sbindir}
> +    install ${S}/sample-etc_ddclient.conf ${D}${sysconfdir}/ddclient/ddclient.conf
> +    install -m 755 ${WORKDIR}/ip-up ${D}${sysconfdir}/ppp/ip-up.d/ddclient
> +    sed -e 's|/etc/ddclient.conf|/etc/ddclient/ddclient.conf|g' ${S}/sample-etc_rc.d_init.d_ddclient > ${S}/rc_init
> +    install -m 755 ${S}/rc_init ${D}${sysconfdir}/init.d/ddclient
> +    install ${S}/README* ${D}${docdir}/ddclient
> +    install ${S}/COPY* ${D}${docdir}/ddclient
> +    install ${S}/sample* ${D}${docdir}/ddclient
> +}
> +
> +CONFFILES_${PN} = "${sysconfdir}/ddclient/ddclient.conf"
> +
> +SRC_URI[md5sum] = "3b426ae52d509e463b42eeb08fb89e0b"
> +SRC_URI[sha256sum] = "d40e2f1fd3f4bff386d27bbdf4b8645199b1995d27605a886b8c71e44d819591"
> diff --git a/meta-networking/recipes-daemons/ddclient/files/ip-up b/meta-networking/recipes-daemons/ddclient/files/ip-up
> new file mode 100644
> index 0000000..4411db9
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/ddclient/files/ip-up
> @@ -0,0 +1,4 @@
> +#!/bin/sh
> +
> +logger -t ddclient $PPP_IFACE $PPP_LOCAL
> +ddclient -daemon=0 -syslog -use=if -if=$PPP_IFACE >/dev/null 2>&1
> diff --git a/meta-networking/recipes-daemons/ddclient/files/persistent b/meta-networking/recipes-daemons/ddclient/files/persistent
> new file mode 100644
> index 0000000..b721272
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/ddclient/files/persistent
> @@ -0,0 +1 @@
> +l root root 0644 /etc/ddclient.conf /var/persistent/etc/ddclient.conf

this file seems to be unused. Can we delete it if no needed.

