Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5923171976
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Nov 2016 00:11:37 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id m203so5455736wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Nov 2016 16:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=zPC1iPR16GAnNT5XHj7CBINCk4pAic2kSghuz4sMcS8=;
	b=WxDeqkdLal2KxcyfXfrBo6W8F2iDnAC4lhGy7UxqD4h8hGd3zcU2P7YSg7hdpq45Vt
	uHibl1rLF2q8LFG8vNU3pJdxGQObgztfpRPje0sdL0+GjyO+UDOfsw4iC1PCC7qcSEuo
	h3PE6p5FUS2tHsXOi2DMei/D0MNXpXwDxQ7tXOCDYuhzZ1nHK4MV02KaiuzXPCdR+j2X
	s8MwQJzkt6k2h4VYEsAJfOMj264gZJyeOsxIpc6CrDSlG18uq+XfcHC+jpGvuWl9+qSb
	F/tprt74XYKvWOD5zbkWE0gLVLQhRYzOlE1i/m4YBC1GZSg7DmPNHFmaGhhz26hC/MzI
	ELoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=zPC1iPR16GAnNT5XHj7CBINCk4pAic2kSghuz4sMcS8=;
	b=XRsduekzknDmETezPMvS8Se6gWv6SztNxt0vkBuo5nVI13ENTrWz4quQxefd+L+lfW
	PqfwLx8iAmSMeVpN4/lUG0Y3GP/xHMMeKGSkc/92QchtDPetLL4JmN+sEF53kaUBLFbN
	Qc8kjTTdyZnQsIrDFUs8MSXn9TBHjhcQ265i5MAHgqMVTv7Egrd+qcwpT+/XvK1oGJpX
	YA0F/TvycFnpGKbrEDolaTc2kAHNAs41anaFWa5LFveokgNGXVmM7VVkPP/yRQQ99kwW
	9O23BkZoTZmVz+2Q+5pv2yGV7Uy5zOtS2uHVIHcFrc0npKJO1emSRNlTwLxV3NHU1NVn
	r5IQ==
X-Gm-Message-State: ABUngveRXw2gv6huM0KFiNtzNwbNfNi5HtdK2mR5kvDBvkaa9sMfrw5js46XtM/YP1smJS3VLWo9/QbO0CpMVg==
X-Received: by 10.28.137.193 with SMTP id l184mr6015173wmd.88.1479255098413;
	Tue, 15 Nov 2016 16:11:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.195.9.34 with HTTP; Tue, 15 Nov 2016 16:11:17 -0800 (PST)
In-Reply-To: <20161031103434.932-2-ricardo.ribalda@gmail.com>
References: <20161031103434.932-1-ricardo.ribalda@gmail.com>
	<20161031103434.932-2-ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 16 Nov 2016 01:11:17 +0100
Message-ID: <CAPybu_0YDwmMB-1z1Mo9bhoadUFcY35vE98nDMuZzriYn1bXOg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	erkka.kaaria@intel.com, Kyle Russell <bkylerussell@gmail.com>,
	Dan McGregor <daniel.mcgregor@vecima.com>, 
	"Maxin B . John" <maxin.john@intel.com>
Subject: Re: [meta-java][PATCH 2/2] openjdk-7-release-03b147.inc: Ignore deprecation
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
X-List-Received-Date: Wed, 16 Nov 2016 00:11:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

ping?

On Mon, Oct 31, 2016 at 11:34 AM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> readdir_r has been deprecated since glibc 2.24. As openjdk uses this
> function, a warning is generated during build that gets turned into
> an error when -Werror is used.
>
> While the readdir function is suggested as an replacement, it has
> slightly different API. The warning is ignored instead to prevent any
> unexpected breakage from patching the offending functions.
>
> (Note: This is just a port of 0f127a49696 from Erkka K=C3=A4=C3=A4ri=C3=
=A4 for openjdk-7
> , all the credit for him)
>
> Credit-to: Erkka K=C3=A4=C3=A4ri=C3=A4 <erkka.kaaria@intel.com>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  recipes-core/icedtea/openjdk-7-release-03b147.inc | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/recipes-core/icedtea/openjdk-7-release-03b147.inc b/recipes-=
core/icedtea/openjdk-7-release-03b147.inc
> index 068572959fa1..1d054ffe35e8 100644
> --- a/recipes-core/icedtea/openjdk-7-release-03b147.inc
> +++ b/recipes-core/icedtea/openjdk-7-release-03b147.inc
> @@ -7,6 +7,10 @@ FILESPATH =3D. "${FILE_DIRNAME}/openjdk-7-03b147:"
>  # Force arm mode for now
>  ARM_INSTRUCTION_SET_armv4t =3D "ARM"
>
> +# readdir_r was deprecated in glibc-2.24. Ignore the error for now
> +# NOTE: When updating the recipe, please check if this is still needed
> +CFLAGS_append =3D " -Wno-error=3Ddeprecated-declarations"
> +
>  ICEDTEA_URI =3D "http://icedtea.wildebeest.org/download/source/${ICEDTEA=
}.tar.gz;name=3Diced"
>
>  ICEDTEA_PREFIX =3D "icedtea7-forest-2.1"
> --
> 2.10.1
>



--=20
Ricardo Ribalda

