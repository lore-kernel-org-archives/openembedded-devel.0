Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1Q234k-0002lD-P9
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 16:00:50 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id C4880314F310;
	Tue, 22 Mar 2011 15:59:01 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id wYmYfIi6RyVj; Tue, 22 Mar 2011 15:58:52 +0100 (CET)
Received: from [172.22.22.61] (ip-109-90-23-193.unitymediagroup.de
	[109.90.23.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 32E04314F313;
	Tue, 22 Mar 2011 15:58:52 +0100 (CET)
Message-ID: <4D88B92B.3090703@opendreambox.org>
Date: Tue, 22 Mar 2011 15:58:51 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.15) Gecko/20110307 Lightning/1.0b2 Thunderbird/3.1.9
MIME-Version: 1.0
To: Paul Menzel <paulepanter@users.sourceforge.net>
References: <1300790542.3827.19.camel@mattotaupa>
In-Reply-To: <1300790542.3827.19.camel@mattotaupa>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/3] ipkg: remove legacy staging and install `libipkg.pc` properly
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Mar 2011 15:00:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello Paul,

On 03/22/2011 11:42 AM, Paul Menzel wrote:
> --- a/recipes/ipkg/ipkg_0.99.163.bb
> +++ b/recipes/ipkg/ipkg_0.99.163.bb
> @@ -1,5 +1,5 @@
>  include ipkg.inc
> -PR = "r8"
> +PR = "r9"
>  
>  S = "${WORKDIR}/ipkg-${PV}"
>  
> @@ -12,15 +12,10 @@ SRC_URI = "http://www.handhelds.org/pub/packages/ipkg/ipkg-${PV}.tar.gz \
>  	file://lonk-link-name.patch \
>  	"
>  
> -do_stage() {
> -	oe_libinstall -so libipkg ${STAGING_LIBDIR}
> -	install -d ${STAGING_INCDIR}/libipkg/
> -	for f in *.h
> -	do
> -		install -m 0644 $f ${STAGING_INCDIR}/libipkg/
> -	done
> +do_install () {
> +	install -d ${D}${libdir}/pkgconfig
> +	install -m 0644 ${WORKDIR}/libipkg.pc ${D}${libdir}/pkgconfig/libipkg.pc
>  }

how do the library and headers get installed? Is there a do_install()
inside ipkg.inc? In that case, you should use do_install_append()
instead or move the two new lines to ipkg.inc.

Despite this, I'd prefer moving it to obsolete, too.

Regards,
Andreas


