Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id D420F771D6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Aug 2016 20:01:45 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id q128so11665964wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Aug 2016 13:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=yfJqo31k83Hi0Ld39LDcF6556zx4beTaDwveu+xXOlM=;
	b=I1xlDx6d+ujIeEDxcpTQGZbWk42611l3XsD8RqgkafZZrdE1VKoEu6MXN05Nk9pb1B
	xNaIfQn13dOD//rQA/C+TIhvq9zpudVd1NZ9um7+Q+cPYIzq13wND2IV7V3noezob09P
	xIpKjKJvW/BKsVIJrHWH1oTMV+ywhodqdG5M2spU9Ma10zlPUrpln9+/Y1UKSatDUnFG
	x+jRxr5xPY3whoSg27DDBMP7QHvd0DveuqX4Dux/ZuoZbrH88uvG1UhN2ArCizo5JdBE
	jBbqik9v1j8OMwfvlhv490kzmzCwG/lxyO1YgAA/Qnqvr5+S6socVypdkobVYSeiiyOY
	UVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=yfJqo31k83Hi0Ld39LDcF6556zx4beTaDwveu+xXOlM=;
	b=DRbFWIEHJ7yMRlDDghTlTN2x/GpG6BG2NxM5U7Z5SWo85CaYlTt6XQ6iYPVxQsJXlY
	+xuyHBmX6Aniwz6mNmISO4VSA1cPqOFfAD/8LWEJd2kEGQnumeYjhvs9EXNncEhlLLoh
	Hc9/F2xNCBv5j6XTg8keF5ZjjqCtvcVqUxJ0x+f+j8NsLzIRg6RJWr+r0e1vgP8KTrKz
	wPAxDylxjPHBL/puO6GvBH2XcMMGHDlAtnbiYeV3mCo+pO2ev6Wy1q3m0F6SbCQsVL3C
	I3skLQO2n2bI/g4aMb5fTuVdS+XVR+UQortaf5byKJF3a8FjM4zkNyee+5+ALlzUZ0vx
	4jww==
X-Gm-Message-State: AEkoouvGiD71Fhmr6BF6i9z38ghxcop/N5fIjP5qDK7LE8PXxxq/pfrbgfhv0g3nKN2kXQiQn/LE2OOHCa21Eg==
X-Received: by 10.25.19.32 with SMTP id j32mr969498lfi.204.1470859306070; Wed,
	10 Aug 2016 13:01:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.87.12 with HTTP; Wed, 10 Aug 2016 13:01:45 -0700 (PDT)
In-Reply-To: <1470857496-24658-1-git-send-email-michael.davis@essvote.com>
References: <1470857496-24658-1-git-send-email-michael.davis@essvote.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 10 Aug 2016 22:01:45 +0200
Message-ID: <CA+chaQfqQSneA4+5U4XKBfbYH0ROoirPiyExn+zhpr_nGG7u0Q@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] pcsc-lite: Seperate GPLV3 portions from BSD
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
X-List-Received-Date: Wed, 10 Aug 2016 20:01:49 -0000
Content-Type: text/plain; charset=UTF-8

Recent changes in oe-core require LICENSE variable to be union of all
package-specific LICENSEs, so you'll need to leave LICENSE as is and just
add LICENSE_${PN}.

See the discussion on oe-core ML.

On Wed, Aug 10, 2016 at 9:32 PM, Davis, Michael <michael.davis@essvote.com>
wrote:

> GPLV3 and BSD portions were originally placed in the same package.
> The GPLv3 portion has been seperated into pcsc-lite-spy so the package can
> be used with GPLv3 blacklisted.
>
> Signed-off-by: Michael Davis <michael.davis@essvote.com>
> ---
>  meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
> b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
> index cc72549..e1d405b 100644
> --- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
> +++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.13.bb
> @@ -1,6 +1,7 @@
>  SUMMARY = "PC/SC Lite smart card framework and applications"
>  HOMEPAGE = "http://pcsclite.alioth.debian.org/"
> -LICENSE = "BSD & GPLv3+"
> +LICENSE = "BSD"
> +LICENSE_${PN}-spy = "GPLv3+"
>  LICENSE_${PN}-dev = "GPLv3+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=bcfbd85230ac3c586fb294c8b627cf32"
>  DEPENDS = "udev"
> @@ -20,14 +21,16 @@ EXTRA_OECONF = " \
>
>  S = "${WORKDIR}/pcsc-lite-${PV}"
>
> -PACKAGES =+ "${PN}-lib"
> +PACKAGES =+ "${PN}-lib ${PN}-spy"
>
>  RRECOMMENDS_${PN} = "ccid"
>
> -FILES_${PN}-lib = "${libdir}/lib*${SOLIBS}"
> +FILES_${PN}-spy += "${bindir}/pcsc-spy \
> +                    ${libdir}/libpcscspy*${SOLIBS}"
> +FILES_${PN}-lib = "${libdir}/libpcsclite*${SOLIBS}"
>
>  RPROVIDES_${PN} += "${PN}-systemd"
>  RREPLACES_${PN} += "${PN}-systemd"
>  RCONFLICTS_${PN} += "${PN}-systemd"
>  SYSTEMD_SERVICE_${PN} = "pcscd.socket"
> -RDEPENDS_${PN} +="python"
> +RDEPENDS_${PN}-spy +="python"
> --
> 2.5.5
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

