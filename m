Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3CE8360119;
	Mon, 11 Dec 2017 03:34:25 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b199so8128405wme.1;
	Sun, 10 Dec 2017 19:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5af12yl+Y4i/+iJd/oVH8zvtCDyDSbBpQokyL/M8YBo=;
	b=dMQLLOWW+YTIIpEy1DoBp/WTXe8yqAai3NYKb+YI6A8FiFRWgtqY86eWDnlRyDNrlW
	mLkPqaq30mIEIJESveT83RbT6iutbJO/I1l8zHq/wt2z9ODBTq6BZ9tiwzgkYXmZU1uN
	OEK6ap8PcWDAetRYEudjSvLoIrKT6GfwP/JP31/jjMHeKACEeajTSLKzpcNHU3IP5GSx
	5G7xBqsXx1gl+rHAMQxf2ErWcIAI6KyxDU7tqwOBfU01vIVy5a3JHgCLFsYpJ8T7YfHz
	vgZi7SwWY/Ky87rQjTNfFcjWSDiG02lmbUkAgDDRxxjNo+3kzT6u1JxzqJoDAq7N92rb
	DTRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5af12yl+Y4i/+iJd/oVH8zvtCDyDSbBpQokyL/M8YBo=;
	b=RCpcFoy2Mudh2yQXWCTVRLqQLjJ56IaHUnrGYvptqrxPE6Z4H5S6/KEuYdQSOORTXy
	54wX2tsG0cwUj2lEgpHc8wdGZWqMasd07bi5FaK0qWksQD7p7peuwbGecWv1X4Vt3rE6
	F5oFvbfTUQtXOQNhEHujv1AOupRToUlxEYAPzlLeMMhlocR8KPvjQbTR87jJveBBY0r8
	FNFXeSaoQ5nOQIs9PgkMH8LOvshBB3RJ2iU12TWoCeQraAQUaO2UnleQnY4W97pmHNSg
	5b5J8HLksD82u6uhNKU7L3BX8T623BZSfJP38pg24kA0Y4Oy54QZikeJCH6zt3rAnQWk
	pALg==
X-Gm-Message-State: AKGB3mJys1c5F4YSdmJULHr6qaXVQ8MBN8vVYnrycUgQfbXPVPB+FLYH
	viWc3kVZaNH/GADYvsEBxJRC4+swd/LdwCH2O5PiNw==
X-Google-Smtp-Source: AGs4zMYnxWO20Bk9xqENStvCkd2YEM86Go/tI+Xe4kd72K1L/2UpYZrpH6h1HGZ0pt+VC07P7NqrWP3YM018t/sCylA=
X-Received: by 10.28.61.135 with SMTP id k129mr8959680wma.81.1512963266917;
	Sun, 10 Dec 2017 19:34:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.122.19 with HTTP; Sun, 10 Dec 2017 19:34:26 -0800 (PST)
In-Reply-To: <20171211032744.0C7422351CE@git.openembedded.org>
References: <151296286354.8348.11088391625338619001@git.openembedded.org>
	<20171211032744.0C7422351CE@git.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 11 Dec 2017 12:34:26 +0900
Message-ID: <CA+chaQf2HFPF0t4c5QpRaQ9Cau1JpKBx87chUNj6y9uFJ=q_dA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Ray <ray.kinsella@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [meta-openembedded] 08/69: ddclient: new package
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
X-List-Received-Date: Mon, 11 Dec 2017 03:34:26 -0000
Content-Type: text/plain; charset="UTF-8"

Doesn't it still depend on meta-perl? As reported in:

http://lists.openembedded.org/pipermail/openembedded-devel/2017-February/111447.html
https://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg55906.html


On Mon, Dec 11, 2017 at 12:27 PM, <git@git.openembedded.org> wrote:

> This is an automated email from the git hooks/post-receive script.
>
> armin_kuster pushed a commit to branch master-next
> in repository meta-openembedded.
>
> commit 24bc1c00734b76838ac4e894e065982400971596
> Author: Kinsella, Ray <ray.kinsella@intel.com>
> AuthorDate: Wed Nov 1 09:23:37 2017 -0400
>
>     ddclient: new package
>
>     Adding the package ddclient. DDClient updates Dynamic DNS servers with
> an IP address.
>     Recipe is based on the original OE recipe found here.
>
>     http://cgit.openembedded.org/openembedded/tree/recipes/
> ddclient/ddclient_3.6.3.bb
>
>     with modifications based on the recipe at:
>
>     https://github.com/cshoredaniel/meta-cshored/blob/master/recipes-
> connectivity/ddclient/ddclient_3.8.3.bb
>
>     DDClient version has been updated to 3.8.3.
>
>     Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
>     Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
>     Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../recipes-daemons/ddclient/ddclient_3.8.3.bb     | 45
> ++++++++++++++++++++++
>  .../recipes-daemons/ddclient/files/ip-up           |  4 ++
>  .../recipes-daemons/ddclient/files/persistent      |  1 +
>  3 files changed, 50 insertions(+)
>
> diff --git a/meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb
> b/meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb
> new file mode 100644
> index 0000000..f4ef536
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb
> @@ -0,0 +1,45 @@
> +SECTION = "net/misc"
> +DESCRIPTION = "Ddclient is a Perl client used to update dynamic DNS
> entries for accounts on Dynamic DNS Network Services"
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
> +    install -d ${D}${sbindir} ${D}${sysconfdir}/ddclient
> ${D}${sysconfdir}/init.d ${D}${sysconfdir}/default/persistent
> +    install -d ${D}${sysconfdir}/ppp/ip-up.d/ install -d
> ${D}${docdir}/ddclient
> +    install -m 755 ${S}/ddclient ${D}${sbindir}
> +    install ${S}/sample-etc_ddclient.conf ${D}${sysconfdir}/ddclient/
> ddclient.conf
> +    install -m 755 ${WORKDIR}/ip-up ${D}${sysconfdir}/ppp/ip-up.d/
> ddclient
> +    install -m 0644 ${WORKDIR}/persistent ${D}/${sysconfdir}/default/
> persistent/50_ddclient
> +    sed -e 's|/etc/ddclient.conf|/etc/ddclient/ddclient.conf|g'
> ${S}/sample-etc_rc.d_init.d_ddclient > ${S}/rc_init
> +    install -m 755 ${S}/rc_init ${D}${sysconfdir}/init.d/ddclient
> +    install ${S}/README* ${D}${docdir}/ddclient
> +    install ${S}/COPY* ${D}${docdir}/ddclient
> +    install ${S}/sample* ${D}${docdir}/ddclient
> +}
> +
> +CONFFILES_${PN} = "${sysconfdir}/ddclient/ddclient.conf"
> +
> +SRC_URI[md5sum] = "3b426ae52d509e463b42eeb08fb89e0b"
> +SRC_URI[sha256sum] = "d40e2f1fd3f4bff386d27bbdf4b864
> 5199b1995d27605a886b8c71e44d819591"
> diff --git a/meta-networking/recipes-daemons/ddclient/files/ip-up
> b/meta-networking/recipes-daemons/ddclient/files/ip-up
> new file mode 100644
> index 0000000..4411db9
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/ddclient/files/ip-up
> @@ -0,0 +1,4 @@
> +#!/bin/sh
> +
> +logger -t ddclient $PPP_IFACE $PPP_LOCAL
> +ddclient -daemon=0 -syslog -use=if -if=$PPP_IFACE >/dev/null 2>&1
> diff --git a/meta-networking/recipes-daemons/ddclient/files/persistent
> b/meta-networking/recipes-daemons/ddclient/files/persistent
> new file mode 100644
> index 0000000..b721272
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/ddclient/files/persistent
> @@ -0,0 +1 @@
> +l root root 0644 /etc/ddclient.conf /var/persistent/etc/ddclient.conf
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

