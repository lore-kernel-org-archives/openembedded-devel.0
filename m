Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f44.google.com (mail-pg0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 3678765D35
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Nov 2017 17:55:00 +0000 (UTC)
Received: by mail-pg0-f44.google.com with SMTP id u3so19019550pgn.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Nov 2017 09:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=YELxhGEPJvfYhoAZClO9jdUwP3NCyKxpL1Dhg1XPEqc=;
	b=GpQzJwv0kjbNOO4zV6oQJH2bgUQ+XtSDrLT9w5FQ/dqLpxuw4vw7ayKHpNqbYboavu
	xtcloaIdCnbmcqX6moa0A48oIO25tjEsByqMlP2Mls9ePxu22r48jPg90Ho+OhetgFxl
	XBrz1BWaf+P6bmTP4cZcR2LP5iXv8tE5KqTMPNW2sTWB37sgHLqx8zxhTHRLSXJaMu3Z
	IrKZ+xKtJiWFbnuv5Mq+TdHLduLpPjAF2A71vvk+5TW8uTbTlv9OlPPwG0ErDq2u5Pqi
	tyWzEEXgG40CgkZkewh/UNmpoNxLORyHcNczGu7qNbuiWOXjMdaPYQpjdYEgq1Tu3oMZ
	/1kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=YELxhGEPJvfYhoAZClO9jdUwP3NCyKxpL1Dhg1XPEqc=;
	b=Rpdqy2Fdp4u8a7zyyPxoNYi+o/bn+8L3NiI13pdsBQTbX4jIqpso1aIYaQuArSJime
	yoW7EpoJvNshYoyahaX7FOAHUV3eU3YjH/MOOmKqZkkhrozogmnBZSrTOkR+II6di8I5
	cFffa2z8mfZZqSckbxU2z69Zf7h2JQ+rYJ6myADfzTdUBAlRPbgKQnDz6cWYeHrmTtUd
	OjkAP0P4U/aAyOBqiL/fj67+QCbYcPbnXIWfMGpyJ7GzIbTaT8QcPUtQdI94Yi8OET5A
	hg+EvibNjJF3asfMb5s/cZYaWpVZe+6JEL+8WUeUV1vYDidziZzqHbv+jbdhxUpdtQyH
	Q+rg==
X-Gm-Message-State: AJaThX5FApR5Q4xADB0KwBGzjDYML4nPzlWjXrL8YNOFo1InDSdcAyJX
	6FtPP0MYTdxt5PSleLTRkV7C5HK2
X-Google-Smtp-Source: AGs4zMaA5NSJ/uvNqyp8zwUI03Bvp84pvE5LahB6U1e+MnI/W7V+dvfckWvZ4FMiAWTB5NoQNSuLNA==
X-Received: by 10.99.98.67 with SMTP id w64mr38390579pgb.213.1511805301646;
	Mon, 27 Nov 2017 09:55:01 -0800 (PST)
Received: from hermes.local ([2601:646:8880:466c:f197:f068:b85:adc4])
	by smtp.gmail.com with ESMTPSA id
	d6sm51017185pfc.29.2017.11.27.09.55.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Nov 2017 09:55:01 -0800 (PST)
To: Joe MacDonald <joe_macdonald@mentor.com>,
	openembedded-devel@lists.openembedded.org
References: <1509542622-20015-1-git-send-email-joe_macdonald@mentor.com>
	<1509542622-20015-2-git-send-email-joe_macdonald@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <4e620f76-636e-6a3a-0b0d-157c5f47867f@gmail.com>
Date: Mon, 27 Nov 2017 09:54:59 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:56.0)
	Gecko/20100101 Thunderbird/56.0
MIME-Version: 1.0
In-Reply-To: <1509542622-20015-2-git-send-email-joe_macdonald@mentor.com>
Subject: Re: [meta-networking][PATCH v2 1/6] ddclient: new package
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
X-List-Received-Date: Mon, 27 Nov 2017 17:55:01 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 11/1/17 6:23 AM, Joe MacDonald wrote:
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

I am seeing errors like below

| install: cannot stat 
'/mnt/a/oe/build/tmp/work/cortexa7t2hf-neon-vfpv4-bec-linux-gnueabi/ddclient/3.8.3-r0/persistent': 
No such file or directory
| WARNING: 
/mnt/a/oe/build/tmp/work/cortexa7t2hf-neon-vfpv4-bec-linux-gnueabi/ddclient/3.8.3-r0/temp/run.do_install.40000:1 
exit 1 from 'install -m 0644 
/mnt/a/oe/build/tmp/work/cortexa7t2hf-neon-vfpv4-bec-linux-gnueabi/ddclient/3.8.3-r0/persistent 
/mnt/a/oe/build/tmp/work/cortexa7t2hf-neon-vfpv4-bec-linux-gnueabi/ddclient/3.8.3-r0/image//etc/default/persistent/50_ddclient'



> Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
> Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
> ---
>   .../recipes-daemons/ddclient/ddclient_3.8.3.bb     | 45 ++++++++++++++++++++++
>   .../recipes-daemons/ddclient/files/ip-up           |  4 ++
>   .../recipes-daemons/ddclient/files/persistent      |  1 +
>   3 files changed, 50 insertions(+)
>   create mode 100644 meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb
>   create mode 100644 meta-networking/recipes-daemons/ddclient/files/ip-up
>   create mode 100644 meta-networking/recipes-daemons/ddclient/files/persistent
> 
> diff --git a/meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb b/meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb
> new file mode 100644
> index 0000000..f4ef536
> --- /dev/null
> +++ b/meta-networking/recipes-daemons/ddclient/ddclient_3.8.3.bb
> @@ -0,0 +1,45 @@
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
> +    install -d ${D}${sbindir} ${D}${sysconfdir}/ddclient ${D}${sysconfdir}/init.d ${D}${sysconfdir}/default/persistent
> +    install -d ${D}${sysconfdir}/ppp/ip-up.d/ install -d ${D}${docdir}/ddclient
> +    install -m 755 ${S}/ddclient ${D}${sbindir}
> +    install ${S}/sample-etc_ddclient.conf ${D}${sysconfdir}/ddclient/ddclient.conf
> +    install -m 755 ${WORKDIR}/ip-up ${D}${sysconfdir}/ppp/ip-up.d/ddclient
> +    install -m 0644 ${WORKDIR}/persistent ${D}/${sysconfdir}/default/persistent/50_ddclient
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
> 

