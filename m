Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 351BC65CBF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 23:02:06 +0000 (UTC)
Received: by wmww144 with SMTP id w144so21812651wmw.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 15:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=7AjaK/sxZnYUNV80D0jbgCzCWbWqszXTxbRXrgPsPsM=;
	b=e9JB3ZmcwcnjtTs1+QPlk1pa7L+43TGkH6UbG7clhJjG+d8pgi8fGMyvvHIeBz8t8V
	tUGaS8SfWbVkQmGl4B0sMkFFjY6Y41qolWemH6h7K9xqeoYL2657KDriwSppP+nc9kql
	VyZL3fzM6cnFfF9Vld0e7Tn5sICPgzOQfq75eJzwknEA76756MgCrD5Yd4ON+ZMx58No
	nEJHCSCGI5hpPXtxD4y4cBSW2pQsqHjThw+OrIljX5hWYwzHC3CCIVKXtWpxnzA2PLSf
	XeLiXkEVs3t5WZl0XV8PURGfETbbiBz2rQQeb6HDpGiCdLbVQPl48dAp2wdj3qpTrvw6
	2TGw==
MIME-Version: 1.0
X-Received: by 10.194.249.137 with SMTP id yu9mr6588447wjc.108.1447196526072; 
	Tue, 10 Nov 2015 15:02:06 -0800 (PST)
Received: by 10.194.154.232 with HTTP; Tue, 10 Nov 2015 15:02:06 -0800 (PST)
In-Reply-To: <1447192164-9399-16-git-send-email-adrian.freihofer@gmail.com>
References: <1447192164-9399-1-git-send-email-adrian.freihofer@gmail.com>
	<1447192164-9399-16-git-send-email-adrian.freihofer@gmail.com>
Date: Wed, 11 Nov 2015 00:02:06 +0100
Message-ID: <CA+chaQdQD72qq1OYfSWL1wgaa50rr8yAg6rRnOdKxAUNCdBdWQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 15/17] networkmanager: PACKAGECONFIG for adsl
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Nov 2015 23:02:09 -0000
Content-Type: text/plain; charset=UTF-8

Why don't you package adsl plugin in separate package? Seems cleaner than
deleting already built file.

On Tue, Nov 10, 2015 at 10:49 PM, Adrian Freihofer <
adrian.freihofer@gmail.com> wrote:

> Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
> ---
>  .../recipes-connectivity/networkmanager/networkmanager_1.0.6.bb   | 8
> +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-connectivity/networkmanager/
> networkmanager_1.0.6.bb b/meta-oe/recipes-connectivity/networkmanager/
> networkmanager_1.0.6.bb
> index 590ce3b..383aae9 100644
> --- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
> +++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
> @@ -50,7 +50,7 @@ EXTRA_OECONF = " \
>  # the following examples to your local.conf or distro config
>  # PACKAGECONFIG_pn-networkmanager = "systemd gnutls wifi"
>  # PACKAGECONFIG_append_pn-networkmanager = " modemmanager ppp"
> -PACKAGECONFIG ??= "nss ifupdown netconfig dhclient dnsmasq \
> +PACKAGECONFIG ??= "nss ifupdown netconfig dhclient dnsmasq adsl \
>
>  ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','consolekit',d)}
> \
>      ${@bb.utils.contains('DISTRO_FEATURES','wifi','wifi','',d)} \
>  "
> @@ -71,6 +71,7 @@ PACKAGECONFIG[dnsmasq] =
> "--with-dnsmasq=${bindir}/dnsmasq"
>  PACKAGECONFIG[nss] = "--with-crypto=nss,,nss"
>  PACKAGECONFIG[gnutls] = "--with-crypto=gnutls,,gnutls libgcrypt,gnutls
> libgcrypt"
>  PACKAGECONFIG[wifi] =
> "--enable-wifi=yes,--enable-wifi=no,wireless-tools,wpa-supplicant
> wireless-tools"
> +PACKAGECONFIG[adsl] = ""
>  PACKAGECONFIG[ifupdown] = "--enable-ifupdown,--disable-ifupdown"
>  PACKAGECONFIG[netconfig] = "--with-netconfig=yes,--with-netconfig=no"
>
> @@ -131,4 +132,9 @@ SYSTEMD_SERVICE_${PN} = "NetworkManager.service
> NetworkManager-dispatcher.servic
>
>  do_install_append() {
>      rm -rf ${D}/run ${D}${localstatedir}/run
> +
> +    # Delete adsl plugin if adsl is not in config flags
> +    if ${@bb.utils.contains('PACKAGECONFIG','adsl','false','true',d)};
> then
> +        rm ${D}/${libdir}/NetworkManager/libnm-device-plugin-adsl.so
> +    fi
>  }
> --
> 2.4.3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

