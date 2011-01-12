Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pcu5j-0003P9-Ty
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 07:21:56 +0100
Received: by pxi17 with SMTP id 17so29251pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jan 2011 22:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=h8vdXUo4wtTaETfXsSxOBLJnNaiKsXsxyiH++iMszuE=;
	b=wMmv1CuQ2Ql54oauezDdXy2x5LRD++6vVHXVLz/mRNCRMKd0PmsaDzocxLxBYwkzle
	YZVQBstVOFC6Ek++kSzRtVrvFlxCgRxQT5RQMqqrCUvN4Dpwgu9wBjis/gunEgVmdK3q
	i5PHfkcQ87EoPihiSrlMTyk3r/gjBJQNvwpAU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=SrHWFDAyh0KnurLM9i8uChC13oIilJ44xJdfFNr3QsBBSdrCWMERLvi0q5jB5ZwqBw
	+naaeYqdgHN6GtPABLf1gcCcGQnsRlGzY9uuL6yL/+WgTbJqlumh+J/eqGktb9qI2XO9
	qh15TP6mCjug0ZaaVoBbWobRb2zolGDv8smis=
Received: by 10.142.171.11 with SMTP id t11mr544313wfe.448.1294813278065;
	Tue, 11 Jan 2011 22:21:18 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id x18sm373614wfa.23.2011.01.11.22.21.16
	(version=SSLv3 cipher=RC4-MD5); Tue, 11 Jan 2011 22:21:17 -0800 (PST)
Message-ID: <4D2D4859.3080109@gmail.com>
Date: Tue, 11 Jan 2011 22:21:13 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1294768042-30115-1-git-send-email-sledz@dresearch.de>
In-Reply-To: <1294768042-30115-1-git-send-email-sledz@dresearch.de>
Subject: Re: [PATCH] alsa-lib: fix packaging error
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
X-List-Received-Date: Wed, 12 Jan 2011 06:21:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 1/11/2011 9:47 AM, Steffen Sledz wrote:
> * symlink libasound.so ->  libasound.so.2.0.0 was missing
>
> Signed-off-by: Steffen Sledz<sledz@dresearch.de>

can you put ${libdir}/libasound.so into libasound-dev



> ---
>   recipes/alsa/alsa-lib_1.0.20.bb |    2 +-
>   recipes/alsa/alsa-lib_1.0.23.bb |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/alsa/alsa-lib_1.0.20.bb b/recipes/alsa/alsa-lib_1.0.20.bb
> index de522c7..04e0239 100644
> --- a/recipes/alsa/alsa-lib_1.0.20.bb
> +++ b/recipes/alsa/alsa-lib_1.0.20.bb
> @@ -31,7 +31,7 @@ EXTRA_OECONF += "${@get_alsa_versym_setting(bb, d)} "
>
>   PACKAGES =+ "alsa-server libasound alsa-conf-base alsa-conf alsa-doc alsa-dev"
>   FILES_${PN}-dbg += "${libdir}/alsa-lib/*/.debu*"
> -FILES_libasound = "${libdir}/libasound.so.*"
> +FILES_libasound = "${libdir}/libasound.so*"
>   FILES_alsa-server = "${bindir}/*"
>   FILES_alsa-conf = "${datadir}/alsa/"
>   FILES_alsa-dev += "${libdir}/pkgconfig/ /usr/include/ ${datadir}/aclocal/*"
> diff --git a/recipes/alsa/alsa-lib_1.0.23.bb b/recipes/alsa/alsa-lib_1.0.23.bb
> index 0f9b14c..ec9015b 100644
> --- a/recipes/alsa/alsa-lib_1.0.23.bb
> +++ b/recipes/alsa/alsa-lib_1.0.23.bb
> @@ -33,7 +33,7 @@ EXTRA_OECONF += "${@get_alsa_versym_setting(bb, d)} "
>
>   PACKAGES =+ "alsa-server libasound alsa-conf-base alsa-conf alsa-doc alsa-dev"
>   FILES_${PN}-dbg += "${libdir}/alsa-lib/*/.debu*"
> -FILES_libasound = "${libdir}/libasound.so.*"
> +FILES_libasound = "${libdir}/libasound.so*"
>   FILES_alsa-server = "${bindir}/*"
>   FILES_alsa-conf = "${datadir}/alsa/"
>   FILES_alsa-dev += "${libdir}/pkgconfig/ /usr/include/ ${datadir}/aclocal/*"



