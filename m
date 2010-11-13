Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PHIzH-0000KT-9N
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Nov 2010 17:30:00 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id B73C5314AB2F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Nov 2010 17:28:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id rL2u594RkBy2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Nov 2010 17:28:54 +0100 (CET)
Received: from [172.22.22.60] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id F32E9314AB2C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Nov 2010 17:28:53 +0100 (CET)
Message-ID: <4CDEBCC5.7050401@opendreambox.org>
Date: Sat, 13 Nov 2010 17:28:53 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.12) Gecko/20101027 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CBEC95F.1000807@opendreambox.org>
	<1288016445-30478-1-git-send-email-obi@opendreambox.org>
In-Reply-To: <1288016445-30478-1-git-send-email-obi@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] lib_package.bbclass: fix packaging of static libs, inherit binconfig
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
X-List-Received-Date: Sat, 13 Nov 2010 16:30:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Ping

On 10/25/2010 04:20 PM, Andreas Oberritter wrote:
> * Package ${libdir}/*.a and /lib/*.a into ${PN}-static instead of ${PN}-dev
> * Although it packaged ${bindir}/*-config into FILES_${PN}-dev, it did
>   not include the required mangling applied by binconfig.bbclass.
> 
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  classes/lib_package.bbclass |   17 +++++++++--------
>  1 files changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/classes/lib_package.bbclass b/classes/lib_package.bbclass
> index 82c9370..7e72dc8 100644
> --- a/classes/lib_package.bbclass
> +++ b/classes/lib_package.bbclass
> @@ -1,10 +1,11 @@
> +inherit binconfig
> +
>  PACKAGES += "${PN}-bin"
>  
> -FILES_${PN} = "${libexecdir} ${libdir}/lib*${SOLIBS} \
> -	    ${sysconfdir} ${sharedstatedir} ${localstatedir} \
> -	    ${base_libdir}/*${SOLIBS} \
> -	    ${datadir}/${PN} ${libdir}/${PN}"
> -FILES_${PN}-dev = "${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la \
> -		${libdir}/*.a ${libdir}/pkgconfig /lib/*.a /lib/*.o \
> -		${datadir}/aclocal ${bindir}/*-config"
> -FILES_${PN}-bin = "${bindir}/* ${sbindir}/* /bin/* /sbin/*"
> +FILES_${PN} = "${libexecdir}/* ${libdir}/lib*${SOLIBS} \
> +            ${sysconfdir} ${sharedstatedir} ${localstatedir} \
> +            ${base_libdir}/*${SOLIBS} \
> +            ${datadir}/${PN} ${libdir}/${PN}/*"
> +
> +FILES_${PN}-bin = "${bindir}/* ${sbindir}/* \
> +                ${base_bindir}/* ${base_sbindir}/*"



