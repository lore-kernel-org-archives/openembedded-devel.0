Received: from [209.85.146.178] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Kilvi-0001Lu-V2
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Sep 2008 10:10:32 +0200
Received: by wa-out-1112.google.com with SMTP id l24so158912waf.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Sep 2008 01:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=DMVvx0GcwsU5j22NeeZ1AoZIJu9ICvfp8cKTjM4ofmI=;
	b=ivGt68WVsi4P4myEWfBpI7uX8mERrIbxYz/jAuD1UltFhehickOUcNGveovF+7h5oK
	TK6taLpLdTWqFzvj2OSC1CBAJIluPfNSs6GGfOZOosazbx5ASw3kBCllbQ9V4aINBKkX
	Xl9OOzgGd6AlnY41PlEO5+4JsfJC07iHrW8VY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=eDHVWhli0sIseXj+jj34DnuxWdgI5WK9KKUFhE2RHCY7qrigll5KtTWmoP5RW0Z6H+
	mgKcGRyvFyqubAkT2FJlhpYFJAavaX0UzGqkBtcR1cEAeHYlVRFhFS0C4qE/Ts7gvVIx
	ZsAA1eENOf4KBRUknkj8DxosaIcBWHzk8LijY=
Received: by 10.114.201.1 with SMTP id y1mr9077344waf.216.1222330009880;
	Thu, 25 Sep 2008 01:06:49 -0700 (PDT)
Received: by 10.114.241.11 with HTTP; Thu, 25 Sep 2008 01:06:49 -0700 (PDT)
Message-ID: <19c1b8a90809250106g64cb04anc69e9dc4165d2139@mail.gmail.com>
Date: Thu, 25 Sep 2008 01:06:49 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <gbfeov$m8g$1@ger.gmane.org>
MIME-Version: 1.0
References: <gbfeov$m8g$1@ger.gmane.org>
Subject: Re: liboil softfloat fix questions
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
X-List-Received-Date: Thu, 25 Sep 2008 08:10:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Sep 25, 2008 at 12:31 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> Hi,
>
> I noticed liboil got patched:
>
> +if test x"${ENABLE_SOFTFLOAT}" = "xyes"; then
> +      VFP_CFLAGS="$VFP_CFLAGS -mfloat-abi=softfp"
> +else
> +      VFP_CFLAGS="$VFP_CFLAGS -mfpu=vfp"
>
> That looks a bit wrong to me, since for EABI you'd want '-mfloat-abi=softfp
> -mfpu=vfp' to make it use the VFP coprocessor using softfloat calling
> conventions[1] and plain '-mfloat-abi=softfp' to do softfloat, and with OABI
> you don't want to pass '-mfloat-abi=softfp'
> To make it even more complicated, on armv7a[2] you want to pass -mfpu=neon
> -mfloat-abi=softfp. If you look at the output of gcc -S you'll see that EABI
> won't use an FPU unless you pass in -mfloat-abi=softfp *and* -mfpu=<FPU>.

yes thats right

>
> AFAICT OE passes all the needed magic already in TARGET_CCFLAGS, so it seems
> that this entire construct can be removed.
>
> Robert, could you beat the cacao people with a cluebat so they get their
> stuff right?
>
> regards,
>
> Koen
>
> [1] There are more permutations, but let's focus on the one OE is currently
> using
> [2] On cortex-a8 the VFP isn't pipelined, so double precision math is twice
> as slow compared to ARM11 cores, the NEON unit is pipelined, but can only do
> single-precision. '

should get better with cortex-a9

So don't be surprised if your new omap3 nokia tablet
> performs FP math slower than your n810.

>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


