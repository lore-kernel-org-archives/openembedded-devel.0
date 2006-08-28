Received: from [141.2.4.18] (helo=mail.tm.informatik.uni-frankfurt.de)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <mickey@tm.informatik.uni-frankfurt.de>)
	id 1GHprN-0006Hy-5o for openembedded-devel@lists.openembedded.org;
	Tue, 29 Aug 2006 00:45:37 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id 0A55E89D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Aug 2006 00:43:37 +0200 (CEST)
Received: from mail.tm.informatik.uni-frankfurt.de ([127.0.0.1])
	by localhost (mail [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 09362-08 for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Aug 2006 00:43:31 +0200 (CEST)
Received: from [141.2.14.64] (gandalf.tm.informatik.uni-frankfurt.de
	[141.2.14.64])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id C91DB8AE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Aug 2006 00:43:28 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@tm.informatik.uni-frankfurt.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <E1GHoWL-0006ie-KS@linuxtogo.org>
References: <E1GHoWL-0006ie-KS@linuxtogo.org>
Organization: VanilleMedia
Date: Tue, 29 Aug 2006 00:43:28 +0200
Message-Id: <1156805008.16945.4.camel@gandalf.tm.informatik.uni-frankfurt.de>
Mime-Version: 1.0
X-Mailer: Evolution 2.7.2.1-3mdv2007.0 
X-Virus-Scanned: by amavisd-new at tm.informatik.uni-frankfurt.de
Subject: Re: [oe-commits] org.oe.dev New package for libesmtp 1.0.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Aug 2006 22:45:37 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

This change is a regression, because
in my last work on that package I improved order of metadata
and improved do_stage()

Please revert or merge with my changes.

> ============================================================
> --- packages/libesmtp/libesmtp_1.0.4.bb	a66c0aa742de78a2ef3f0458ad61a60381f333b4
> +++ packages/libesmtp/libesmtp_1.0.4.bb	0243fd8ce99928a9eea0b2ec18e5a9a4f83be352
> @@ -1,19 +1,22 @@
> +LICENSE = "GPL"
> +SECTION = "libs"
> +DEPENDS = "openssl"
>  DESCRIPTION = "LibESMTP is a library to manage posting \
>  (or submission of) electronic mail using SMTP to a \
> -preconfigured Mail Transport Agent (MTA) such as Exim or PostFix."
> -LICENSE = "GPL"
> -SECTION = "libs/network"
> -DEPENDS = "openssl"
> -PR = "r1"
> +preconfigured Mail Transport Agent (MTA) such as Exim."
> +FILES_libesmtp_append = " ${libdir}/esmtp-plugins"
>  
>  SRC_URI = "http://www.stafford.uklinux.net/libesmtp/libesmtp-${PV}.tar.bz2"
>  
> -inherit autotools binconfig
> +inherit autotools 
>  
>  EXTRA_OECONF = "--disable-isoc --with-openssl=${STAGING_LIBDIR}/.."
>  
> -do_stage() {
> -	autotools_stage_all
> +do_stage () {
> +	oe_libinstall -a -so libesmtp ${STAGING_LIBDIR}
> +
> +        install -d ${STAGING_INCDIR}
> +	install -m 644 auth-client.h ${STAGING_INCDIR}
> +	install -m 644 auth-plugin.h ${STAGING_INCDIR}
> +	install -m 644 libesmtp.h ${STAGING_INCDIR}
>  }
> -
> -FILES_libesmtp_append = " ${libdir}/esmtp-plugins"
> 
> 
> 
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
-- 
Regards,

Michael 'Mickey' Lauer | FreeLancer | http://www.Vanille-Media.de




