Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f174.google.com (mail-ua0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 082E57505B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jun 2018 18:59:24 +0000 (UTC)
Received: by mail-ua0-f174.google.com with SMTP id 59-v6so7068547uas.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jun 2018 11:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=K5Wtsh2KIpDLCiM1ENv2SZCTF1bs7HMHqD8oECDo2HE=;
	b=gbXHROF1jEQ0xF5Lei1k9c0bf69djhoyXW8qHx5FYdlILuOORV4zswmohJ5Ww0hAHu
	RzsnBoHuc25gCVltOAiyxkhpqpAlAR0uUW01Xl8HKz4E0DJcTxiOWsHqO9AvvveCbXQZ
	kLLzDxX1rhJzlLX1uqaDgiUvhlljHpiKU+MD78XaczebreNYHPX1wIrMdBaCe0dR23Tq
	SWr6DO6wj2tTWATjopHp51/n8Wwp2BfcFOFLLtnmt/0hKUWdfICgJXoLZ3AC9PZcLYdc
	orTWHQvaqaoU2GK0nfPljx2aevxzeA6T7QW2x7cY7dt452Tu8JOW4LNfPCeRk3qseEa2
	OFkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=K5Wtsh2KIpDLCiM1ENv2SZCTF1bs7HMHqD8oECDo2HE=;
	b=X9hw5RVnB+qjB1FU+MN+5o6dYBIZuLFVMl8vi1IN94PL+Gfzc/ql2w4Buycy1LC8LC
	+v4bS2YrAC4R5WcygNqDn27Gg6xgp8tSh2RYfTHrUIMOUGBgosW51T0SE0QIrAnTwgPd
	8LlkI57grVQ1wEsIY87iSCjja8WuDah9Vr8v/OuiTTDHTp0VlJthzGuhzY57zIlzdEqp
	akoDivML+Ujt1kR9HtHtwxwND9VTFSEhO+GeN1lnuDrQzZIJ787x0CeDy/ovEjQ582x9
	xZOEna+cAZcH4N65a53Q+BDabuXDpuiuRdiOvLDnv42A9Jp0Tv2I3/KTivJssqNFdiph
	sHhg==
X-Gm-Message-State: APt69E13H0JJ1188wSxnw1Qz1++IbVt7JSB8owkX+F3emabTfBgEfoGh
	rdUMaxFAuVV+F/UC2nXdYC8xzfM61nK3VxIvqps=
X-Google-Smtp-Source: ADUXVKJguNAzROmzKs2nccJAHmlFe+m6qAljctx8Nr59EWTHk/7u0h1O64ZHfK4TFYmc9GIniyuVqzsSDHcZhsO9Fd0=
X-Received: by 2002:ab0:5323:: with SMTP id
	x32-v6mr1921280uax.139.1529089165672; 
	Fri, 15 Jun 2018 11:59:25 -0700 (PDT)
MIME-Version: 1.0
References: <20180615182105.727-1-joe.slater@windriver.com>
In-Reply-To: <20180615182105.727-1-joe.slater@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Jun 2018 11:59:08 -0700
Message-ID: <CAMKF1soE7nmbinO8keT=XczC=Wv4=57KjX1q6bTfzHaNvaBZQg@mail.gmail.com>
To: "Slater, Joseph" <joe.slater@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH V2 1/1] syslog-ng: fix build without json
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
X-List-Received-Date: Fri, 15 Jun 2018 18:59:25 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Joe

For expediency can you rebase on master-next and resend.
On Fri, Jun 15, 2018 at 11:21 AM Joe Slater <joe.slater@windriver.com> wrote:
>
> Remove configurations requiring json from target.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  meta-oe/recipes-support/syslog-ng/syslog-ng.inc | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> index cb7ca31..6c5adbd 100644
> --- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> +++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> @@ -85,6 +85,13 @@ do_install_append() {
>      install -d ${D}/${localstatedir}/lib/${BPN}
>      # Remove /var/run as it is created on startup
>      rm -rf ${D}${localstatedir}/run
> +
> +    # If json is not supported, remove certain conf files.
> +    if ${@bb.utils.contains('PACKAGECONFIG','json','false','true',d)} ; then
> +        for f in loggly logmatic cim elasticsearch ; do
> +            rm -rf ${D}${datadir}/${BPN}/include/scl/$f
> +        done
> +    fi
>  }
>
>  FILES_${PN} += "${datadir}/include/scl/ ${datadir}/xsd ${datadir}/tools"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

