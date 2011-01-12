Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PcvQ3-0006IH-Kd
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 08:46:59 +0100
Received: by pvd12 with SMTP id 12so48891pvd.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jan 2011 23:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=Zj1aNnW5bAmYGEONhPLMuCIOaRzjzXylscA2K3FuxMY=;
	b=ZNs9rZCxd28+z+YWbw7q5zAI/F/z6GnzLI2jhZRwV4wWGslAeTVYEk4IDCFeo8Pv5M
	sgNlYkl+G/Jjqg8QoOZ5rqUCfujdj23UJt53gbBORkgdTEVEWdaW/nJZOZF2x0iT+p2c
	aPBWx+vXEFEagxLeN0m+pRsk41LwviFiXWc3w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=q9J6erSy7djFtkVRnxpeCDjsBuuGLozq+z4+cx7F9ELTkTLO2SToMUdPxukTgCQDjJ
	DbUKSNj/naCp4oM2ckm3AYj1MOs4V1u2lheQbSdJhZVC1fCpzrpOx6ld9LTW2yXTZnRI
	jYGXVHZzoPXBhIk+zjUzXBsVq2CzQJ1hJOUOw=
Received: by 10.142.114.11 with SMTP id m11mr641908wfc.143.1294818386470;
	Tue, 11 Jan 2011 23:46:26 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id b11sm469493wff.9.2011.01.11.23.46.24
	(version=SSLv3 cipher=RC4-MD5); Tue, 11 Jan 2011 23:46:25 -0800 (PST)
Message-ID: <4D2D5C4D.6010204@gmail.com>
Date: Tue, 11 Jan 2011 23:46:21 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <ighiieMAN_POSIXLY_CORRECT=1@dough.gmane.org>
	<1294774001-29322-1-git-send-email-sledz@dresearch.de>
In-Reply-To: <1294774001-29322-1-git-send-email-sledz@dresearch.de>
Subject: Re: [PATCH v2] alsa-lib: fix packaging error
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
X-List-Received-Date: Wed, 12 Jan 2011 07:46:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 1/11/2011 11:26 AM, Steffen Sledz wrote:
> * symlink libasound.so ->  libasound.so.2.0.0 in /usr/lib was missing in
>    dev package
>
> Signed-off-by: Steffen Sledz<sledz@dresearch.de>

Acked-by: Khem Raj <raj.khem@gmail.com>


> ---
>   recipes/alsa/alsa-lib_1.0.20.bb |    2 +-
>   recipes/alsa/alsa-lib_1.0.23.bb |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/alsa/alsa-lib_1.0.20.bb b/recipes/alsa/alsa-lib_1.0.20.bb
> index de522c7..fc508ec 100644
> --- a/recipes/alsa/alsa-lib_1.0.20.bb
> +++ b/recipes/alsa/alsa-lib_1.0.20.bb
> @@ -34,7 +34,7 @@ FILES_${PN}-dbg += "${libdir}/alsa-lib/*/.debu*"
>   FILES_libasound = "${libdir}/libasound.so.*"
>   FILES_alsa-server = "${bindir}/*"
>   FILES_alsa-conf = "${datadir}/alsa/"
> -FILES_alsa-dev += "${libdir}/pkgconfig/ /usr/include/ ${datadir}/aclocal/*"
> +FILES_alsa-dev += "${libdir}/libasound.so ${libdir}/pkgconfig/ /usr/include/ ${datadir}/aclocal/*"
>   FILES_alsa-conf-base = "\
>   ${datadir}/alsa/alsa.conf \
>   ${datadir}/alsa/cards/aliases.conf \
> diff --git a/recipes/alsa/alsa-lib_1.0.23.bb b/recipes/alsa/alsa-lib_1.0.23.bb
> index 0f9b14c..0085047 100644
> --- a/recipes/alsa/alsa-lib_1.0.23.bb
> +++ b/recipes/alsa/alsa-lib_1.0.23.bb
> @@ -36,7 +36,7 @@ FILES_${PN}-dbg += "${libdir}/alsa-lib/*/.debu*"
>   FILES_libasound = "${libdir}/libasound.so.*"
>   FILES_alsa-server = "${bindir}/*"
>   FILES_alsa-conf = "${datadir}/alsa/"
> -FILES_alsa-dev += "${libdir}/pkgconfig/ /usr/include/ ${datadir}/aclocal/*"
> +FILES_alsa-dev += "${libdir}/libasound.so ${libdir}/pkgconfig/ /usr/include/ ${datadir}/aclocal/*"
>   FILES_alsa-conf-base = "\
>   ${datadir}/alsa/alsa.conf \
>   ${datadir}/alsa/cards/aliases.conf \



