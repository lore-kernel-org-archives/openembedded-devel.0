Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3EC4E78E44
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Aug 2018 16:28:04 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id t79-v6so4431832qke.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Aug 2018 09:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eJPHye6i9VkDUvXXiDqo9qccR9Jmi0JfSEq3wzSAjIM=;
	b=FYsqbPLxri+R231zEKI62XCo5By+mSpePjtuOQZoJJiQOnxUoV0IJW3MPNsRAZ9npw
	yGH5+ua0P59Mr/35XWFjyhyuz7bHcEJezMvKuLld9PONtuVj6jVWdR7knWOMonqwe2bH
	mARSCLYh0gIy2olem6WbhyGJFEzti/6/Fd7u2TS/sneZsIGkdFUCL2pDzas6BYqq2Yb1
	YLWbQB4Sr7iQKeYdGI4eeceLe5yUKgfSlbBlGNV3+/13DVlhN+Mnnwyv+tOcUiYL1aOH
	6LgeduhiLHvefSHx9iHw4PVuVANLa7EWgLanqO7cliMbyFnOSfLnPRH8a5qdm5t6WVvj
	KzXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eJPHye6i9VkDUvXXiDqo9qccR9Jmi0JfSEq3wzSAjIM=;
	b=mJQdGaVmPk7zPBrk1g1ZYB9kUN3tkXWasYYnYlKKnyGh5LU3P3aUAzoBJgEhSIOja4
	hWIUvxas0Sug2sBpnkMdozvn4LnF4Ogp4Pm781JrzHaVzLxqC/+D6VldI5MCNdL1YHVG
	MiajqNwhRplHduc5KLt77exI9Pb8sX+6a0UYkYEcyml00xW/7Gki93uVzEtrYYD7xuw/
	N0P+3zbHx+BbN0GdpBnPpY6qc2BYzKJmxDbCYVAuGyd3MEteOJ7C4IKgTrQ/KsDRULst
	8JaY9KlEIlrILUqNyu7uiMuKb2UHxrE7+HqSy/2Xe/aCmYANOK7xqcQoVClFMJ5GE4XC
	1LMw==
X-Gm-Message-State: AOUpUlH+VR9qNldh2F5KM5MOeCZSgY8unIku25z+pEPDCxCSzNWx7UVD
	h7yjg0xF/QQLk15c2SNkQwKvlSVQPSilbDZWzN4=
X-Google-Smtp-Source: AAOMgpdAlCWNBBDBc7dudrUIXzfv8qoGIWEQRGMOnF3VLpTAyPjPhmhDCgfNEsxcBZfQneuoIeaN5TKPyEA5vZ8mwwo=
X-Received: by 2002:ae9:c00d:: with SMTP id
	u13-v6mr4228142qkk.290.1533313684860; 
	Fri, 03 Aug 2018 09:28:04 -0700 (PDT)
MIME-Version: 1.0
References: <1533290805-13421-1-git-send-email-Qi.Chen@windriver.com>
	<1533290805-13421-2-git-send-email-Qi.Chen@windriver.com>
In-Reply-To: <1533290805-13421-2-git-send-email-Qi.Chen@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 Aug 2018 09:27:38 -0700
Message-ID: <CAMKF1sotDb82cMwYO5xEyHu38-3zA0RBRTVOcyi+yMy4WSKcZA@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] rsyslog: add PACKAGECONFIG for imjournal
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
X-List-Received-Date: Fri, 03 Aug 2018 16:28:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 3, 2018 at 3:03 AM <Qi.Chen@windriver.com> wrote:
>
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Add PACKAGECONFIG for imjournal, and add corresponding configuration
> to /etc/rsyslog.conf when it's enabled. Default to disable it.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb
> index d90695a..1bcbde1 100644
> --- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb
> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb
> @@ -67,6 +67,7 @@ PACKAGECONFIG[imfile] = "--enable-imfile,--disable-imfile,,"
>  PACKAGECONFIG[snmp] = "--enable-snmp,--disable-snmp,net-snmp,"
>  PACKAGECONFIG[gnutls] = "--enable-gnutls,--disable-gnutls,gnutls,"
>  PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--without-systemdsystemunitdir,systemd,"
> +PACKAGECONFIG[imjournal] = "--enable-imjournal,--disable-imjournal,"
>  PACKAGECONFIG[mysql] = "--enable-mysql,--disable-mysql,mysql5,"
>  PACKAGECONFIG[postgresql] = "--enable-pgsql,--disable-pgsql,postgresql,"
>  PACKAGECONFIG[libdbi] = "--enable-libdbi,--disable-libdbi,libdbi,"
> @@ -126,6 +127,10 @@ do_install_append() {
>      install -m 644 ${WORKDIR}/rsyslog.conf ${D}${sysconfdir}/rsyslog.conf
>      install -m 644 ${WORKDIR}/rsyslog.logrotate ${D}${sysconfdir}/logrotate.d/logrotate.rsyslog
>      sed -i -e "s#@BINDIR@#${bindir}#g" ${D}${sysconfdir}/logrotate.d/logrotate.rsyslog
> +
> +    if ${@bb.utils.contains('PACKAGECONFIG', 'imjournal', 'true', 'false', d)}; then
> +        echo '$ModLoad imjournal' >> ${D}${sysconfdir}/rsyslog.conf
> +    fi

perhaps its time to add something like

$IncludeConfig /etc/rsyslog.d/*.conf

in main etc/rsyslog.conf and then such fragments can be places as
individual config
files inside that directory
>  }
>
>  FILES_${PN} += "${bindir}"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

