Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9G8q-0006qE-QV
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 15:59:40 +0200
Received: from localhost ([127.0.0.1]:37697 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9Fwr-0005g0-OQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 13:47:17 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=MTb23/FuRCNIOvxi89HBENg5XZk=; b=piCPaFTeExhfUrMq9jjZTZ77OPxa
	Czd/JGkbO5Xdz/pl2JuiO3FU2upHV1SHFahZ5xIwV+sWcOQm3VqbIG42FwjLricc
	JZ8LmUL1gbTKsN+rn4L+NnInPeKeo4tuL2Z32pS+N2ftSyBHhCEneNZ+RRuC/YwG
	6avjil2miNRfZ5A=
Received: from [195.171.99.130] (port=4259 helo=[192.168.0.33])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1T9Fwr-0005fx-Lv
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 13:47:17 +0000
Message-ID: <5047582A.4060601@communistcode.co.uk>
Date: Wed, 05 Sep 2012 14:48:26 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120828 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1346852108-16462-1-git-send-email-sander@outrightsolutions.nl>
In-Reply-To: <1346852108-16462-1-git-send-email-sander@outrightsolutions.nl>
Subject: Re: [meta-oe][PATCH 1/2] libimobiledevice: add recipe for Apple products protocol support
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
X-List-Received-Date: Wed, 05 Sep 2012 13:59:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/12 14:35, Sander van Grieken wrote:
> Signed-off-by: Sander van Grieken <sander@outrightsolutions.nl>
> ---
>   .../libimobiledevice/libimobiledevice_1.1.4.bb     |   22 ++++++++++++++++++++
>   1 file changed, 22 insertions(+)
>   create mode 100644 meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb
>
> diff --git a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb
> new file mode 100644
> index 0000000..a4ebeab
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb
> @@ -0,0 +1,22 @@
> +LICENSE = "GPLv2 & LGPLv2.1"
> +LIC_FILES_CHKSUM = "\
> +    file://COPYING;md5=ebb5c50ab7cab4baeffba14977030c07 \
> +    file://COPYING.LESSER;md5=6ab17b41640564434dda85c06b7124f7 \
> +    "
> +
> +HOMEPAGE ="http://www.libimobiledevice.org/"
> +
> +DEPENDS = "libplist usbmuxd libtasn1 gnutls libgcrypt"
> +
> +PR = "r0"
> +
> +SRC_URI = " \
> +    http://www.libimobiledevice.org/downloads/libimobiledevice-${PV}.tar.bz2 \
> +    "
> +
> +SRC_URI[md5sum] = "3f28cbc6a2e30d34685049c0abde5183"
> +SRC_URI[sha256sum] = "67499cfaa6172f566ee6b0783605acffe484fb7ddc3b09881ab7ac58667ee5b8"
> +
> +inherit autotools pkgconfig
> +
> +EXTRA_OECONF = " --without-cython "

Should these not also go in the already present 
meta-oe/recipes-extended/libimobiledevicefolder?


-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



