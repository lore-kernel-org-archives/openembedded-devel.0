Return-Path: <vz@mleia.com>
Received: from mail.mleia.com (mleia.com [178.79.152.223])
	by mail.openembedded.org (Postfix) with ESMTP id 277FF601A5
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Dec 2015 04:51:00 +0000 (UTC)
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 702D639D;
	Wed,  2 Dec 2015 04:52:48 +0000 (GMT)
Message-ID: <565E78B3.8040605@mleia.com>
Date: Wed, 02 Dec 2015 06:50:59 +0200
From: Vladimir Zapolskiy <vz@mleia.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Icedove/31.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1449031273-13292-1-git-send-email-vz@mleia.com>
In-Reply-To: <1449031273-13292-1-git-send-email-vz@mleia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20151202_045248_480702_4515E664 
X-CRM114-Status: GOOD (  19.63  )
Subject: Re: [PATCH] package_ipk: allow to specify OPKG_ARGS in local.conf
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
X-List-Received-Date: Wed, 02 Dec 2015 04:51:00 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

I think this is a wrong list, resent the change for review to
openembedded-core.

With best wishes,
Vladimir

On 02.12.2015 06:41, Vladimir Zapolskiy wrote:
> If user specific parameters to opkg are set in local.conf, they are
> rewritten in package_ipk.bbclass and ignored, instead append
> package_ipk specific arguments to the user defined ones.
> 
> The change is needed, if a user has to pass an alternative path to a
> temporary directory for opkg, e.g.
> 
>   OPKG_ARGS = "--tmp-dir=${TOPDIR}/tmp-opkg"
> 
> The default /tmp directory may be unusable for do_rootfs task, for
> example if there is no enough space or /tmp is mounted with noexec
> mount option, then an alternative path allows to complete do_rootfs
> and fix the problems like this:
> 
>   ERROR: Unable to install packages.
>   ...
>   sh: /tmp/opkg-5jPLag/run-postinsts-UsUtaI/preinst: /bin/sh: bad interpreter: Permission denied
>   sh: /tmp/opkg-5jPLag/base-files-4hFwQS/preinst: /bin/sh: bad interpreter: Permission denied
>   sh: /tmp/opkg-5jPLag/run-postinsts-UsUtaI/preinst: /bin/sh: bad interpreter: Permission denied
>   sh: /tmp/opkg-5jPLag/busybox-syslog-sJmfbw/preinst: /bin/sh: bad interpreter: Permission denied
>   ...
> 
> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
> ---
>  meta/classes/package_ipk.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
> index 4dd7a7e..51bee28 100644
> --- a/meta/classes/package_ipk.bbclass
> +++ b/meta/classes/package_ipk.bbclass
> @@ -10,7 +10,7 @@ PKGWRITEDIRIPK = "${WORKDIR}/deploy-ipks"
>  # Program to be used to build opkg packages
>  OPKGBUILDCMD ??= "opkg-build"
>  
> -OPKG_ARGS = "--force_postinstall --prefer-arch-to-version"
> +OPKG_ARGS += "--force_postinstall --prefer-arch-to-version"
>  OPKG_ARGS += "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDATIONS", True) == "1"]}"
>  OPKG_ARGS += "${@['', '--add-exclude ' + ' --add-exclude '.join((d.getVar('PACKAGE_EXCLUDE', True) or "").split())][(d.getVar("PACKAGE_EXCLUDE", True) or "") != ""]}"
>  
> 

