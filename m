Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6EABC71B1E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Nov 2016 15:20:53 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id y68so5152711pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Nov 2016 08:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=UOdf5ZPlqa3kcT9zQeDr2VqtB08b3jdeeatkriN44xc=;
	b=fXR13N8hr3I6PUHvY9HQV4Z64ZwLRM1yri7LzC1Kw+Nneyj7eeK9AVvwHfm3+xccDC
	+52pBrrt2SjWdLtaki5CfyNisYUKUCah8clVkLEyQBb1XwE8RUCPCvCOQfvyOUt23KdJ
	izQPK8wc1tSnn/U8Z7k/ipYqbbeWd+qdopHPpDoQ6opk70F44XUzWkSe266X4tz/uac5
	0AmJQiLePUwF9nAAn3xzqSFyCeYet2rOGtuLEWOn9xDS/2KWYTWMOFVGeljkgujzDBCP
	2uoh2fZlir6x3PmOAUfRGmwYnPnK2D0UbTkTbeAPCvOqS6EBvvBm6iZ1oSIOwymwdb5P
	t32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=UOdf5ZPlqa3kcT9zQeDr2VqtB08b3jdeeatkriN44xc=;
	b=kpbBCEjb1hWJoc0ff5kLq1rL4A5wrSw17lnMwhC8PmGwHZCUTJLDbQFDkh1Ro6WDar
	fcNlfNa9zXEGv+4uwGwbTQpN9BzpmLIqz9pFSjq2HCcVVblrZnX96AkqS+Urw9PgDEbn
	nz+KM+o8j9+wIeSZvdwsO8xTdNKS9+uqEjQDo/+9oJZH18nFUYj16LU/cAbd/VuZfKZZ
	VB/FSABY22a4lOnRCj2jRdtZfl3bFD1qDS8aiGn4cG6nol/VzyQfyeB/yaYG+5MDEgmg
	VRLfiecYqJjKuP8S0KnhaEt/iYJtrEdR4aDEgA5+8+LzpuES9uYakOvc4fwY3zpv9262
	15og==
X-Gm-Message-State: ABUngve/e5EQkD+F5opK/M/YQcGBaPUgwx+4MBJpgMy/7OENTyVurb6ySJ98+l6Vs+rMig==
X-Received: by 10.98.9.67 with SMTP id e64mr17971142pfd.74.1478186455286;
	Thu, 03 Nov 2016 08:20:55 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:614c:a5d9:489d:9d27?
	([2601:202:4001:9ea0:614c:a5d9:489d:9d27])
	by smtp.googlemail.com with ESMTPSA id
	j192sm13545052pfc.60.2016.11.03.08.20.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Nov 2016 08:20:54 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <1477587755-24666-1-git-send-email-denis@denix.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <271f87f6-ac90-2389-3499-9c3bb8d80fa6@gmail.com>
Date: Thu, 3 Nov 2016 08:20:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1477587755-24666-1-git-send-email-denis@denix.org>
Cc: Ian Ray <ian.ray@ge.com>, Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-oe][krogoth][PATCH] syslog-ng: expand service file @variables@ earlier
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
X-List-Received-Date: Thu, 03 Nov 2016 15:20:54 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 10/27/2016 10:02 AM, Denys Dmytriyenko wrote:
> From: Ian Ray <ian.ray@ge.com>
> 
> Move variable expansion of @SBINDIR@, @LOCALSTATEDIR@, and @BASEBINDIR@
> earlier during install, to before the systemd service file is installed
> by an automake rule.
> 
> Signed-off-by: Ian Ray <ian.ray@ge.com>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

merged to staging.
-armin
> ---
>  meta-oe/recipes-support/syslog-ng/syslog-ng.inc | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> index 4e0f697..898e9c2 100644
> --- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> +++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> @@ -60,6 +60,12 @@ do_configure_prepend() {
>      eval "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '', 'sed -i -e "s/-D_LARGEFILE_SOURCE//" -e "s/-D_FILE_OFFSET_BITS=64//" ${S}/configure.in', d)}"
>  }
>  
> +do_install_prepend() {
> +    sed -i -e 's,@SBINDIR@,${sbindir},g' ${S}/contrib/systemd/*.service
> +    sed -i -e 's,@LOCALSTATEDIR@,${localstatedir},g' ${S}/contrib/systemd/*.service
> +    sed -i -e 's,@BASEBINDIR@,${base_bindir},g' ${S}/contrib/systemd/*.service
> +}
> +
>  do_install_append() {
>      install -d ${D}/${sysconfdir}/${BPN}
>      install ${WORKDIR}/syslog-ng.conf ${D}${sysconfdir}/${BPN}/${BPN}.conf
> @@ -70,9 +76,6 @@ do_install_append() {
>      install -d ${D}/${localstatedir}/lib/${BPN}
>      # Remove /var/run as it is created on startup
>      rm -rf ${D}${localstatedir}/run
> -    sed -i -e 's,@SBINDIR@,${sbindir},g' ${S}/contrib/systemd/*.service
> -    sed -i -e 's,@LOCALSTATEDIR@,${localstatedir},g' ${S}/contrib/systemd/*.service
> -    sed -i -e 's,@BASEBINDIR@,${base_bindir},g' ${S}/contrib/systemd/*.service
>  }
>  
>  FILES_${PN} += "${datadir}/include/scl/ ${datadir}/xsd ${datadir}/tools"
> 

