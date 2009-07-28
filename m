Received: from [209.85.216.171] (helo=mail-px0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MVrzp-0003U6-Fj
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Jul 2009 21:05:57 +0200
Received: by pxi1 with SMTP id 1so167535pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jul 2009 11:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=3cPJ0bTsDivbVApVDbrim+REYOdLAJfPEJDXqYHbBok=;
	b=C+ebAOt8V/fl4o7c1naPMtpum3ryb6aeE8wd2eYjWr4xAiIbTQGEAoTp88dUoqkDeS
	VU8G6k/1V5KMdvUp+HTNWrqScDrRNcvYxXhrk+BzrSFfaV34phElPdaskB6+u6QG+uGp
	4pu4s1cVbWFaK2PjThSAJsyD+iKcDFDOz6aUs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=ah69CG3ogGFfQPMWEfCV1oM/n508ZohxSSALFrE3Ymvo0n+RcADcIRZDizrENrbgJX
	e9fSX88azM0dRd/l5YdRL2jOoKje5RfkZHsobhQeuMTbYmh73jT7PUSn1Q8a6TcUqdGG
	0a0xX7eDrkuGVqF43SRFehfgd3mAD7JBBs2Fc=
Received: by 10.140.134.10 with SMTP id h10mr5317237rvd.7.1248807066013;
	Tue, 28 Jul 2009 11:51:06 -0700 (PDT)
Received: from gmail.com (adsl-71-146-0-187.dsl.pltn13.sbcglobal.net
	[71.146.0.187])
	by mx.google.com with ESMTPS id g14sm737128rvb.50.2009.07.28.11.51.04
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 28 Jul 2009 11:51:04 -0700 (PDT)
Date: Tue, 28 Jul 2009 11:50:57 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090728185057.GA25791@gmail.com>
References: <64d5b90a0907280737i72902f27s65aa0c9a4e351a97@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <64d5b90a0907280737i72902f27s65aa0c9a4e351a97@mail.gmail.com>
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
Subject: Re: Patch to get wvstreams recipe functional
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
X-List-Received-Date: Tue, 28 Jul 2009 19:05:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (28/07/09 20:07), Kirtika Ruchandani wrote:
> Greetings,
> Please find attached the quilt patches for the wvstreams 4.4.1 recipe.
> The one in the OE tree currently doesn't build correctly.
> It would be great if someone could test the above patches and check if the
> build goes fine.
> Regards,
> 
> -- 
> Kirtika Ruchandani
> Maemo Google Summer of Code  student
> Sophomore, CS&E @ IIT-Madras
> IRC: rkirti / oespirit
> http://rkirti.wordpress.com

> Index: wvstreams-4.4.1/include/wvserialize.h
> ===================================================================
> --- wvstreams-4.4.1.orig/include/wvserialize.h	2009-07-28 17:46:50.000000000 +0530
> +++ wvstreams-4.4.1/include/wvserialize.h	2009-07-28 17:48:30.000000000 +0530
> @@ -348,8 +348,9 @@
>   * (zero) character.  Serialized WvStrings are guaranteed not to contain nul
>   * except as the last character.
>   */
> +/*No storage class allowed here as per gcc 4.3 specs*/
>  template <>
> -extern WvString _wv_deserialize<WvString>(WvBuf &buf);
> +WvString _wv_deserialize<WvString>(WvBuf &buf);
>  
>  
>  /** Deserialize a WvBuf. */

> Index: wvstreams-4.4.1/include/uniconfkey.h
> ===================================================================
> --- wvstreams-4.4.1.orig/include/uniconfkey.h	2009-07-28 17:42:39.000000000 +0530
> +++ wvstreams-4.4.1/include/uniconfkey.h	2009-07-28 17:42:55.000000000 +0530
> @@ -9,7 +9,7 @@
>  
>  #include "wvstring.h"
>  #include "wvlinklist.h"
> -
> +#include <limits.h>
>  
>  // The Python headers try to #define ANY as void.  If we're building Python
>  // wrappers, get rid of that.


FWIW patch looks ok. Can you send it with rest of recipe changes ?

Thx

-Khem


