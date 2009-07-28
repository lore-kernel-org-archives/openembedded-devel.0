Received: from [209.85.198.244] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MVs2n-0003bL-6I
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Jul 2009 21:09:01 +0200
Received: by rv-out-0708.google.com with SMTP id l33so879281rvb.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jul 2009 11:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=fwr5Ct1xSktBwl1TkUXTPRBd2tMVZue7oX/sX8yfN2M=;
	b=p4pFLai0Q5DW4A8Q3KO3C5Dk4WTCZnBsjQAZSiRPCLHPbzwIhos7YhiZEzspFPN+Ma
	a7QZxqnPqXN+vPp+Y3qYsTAVm0fWGzBCJcIYoEXtjXpmyZGjXO9OCzHOFQKTL2XOyktl
	L7Gv20WmmXhJ58rNxkfuBa/yJ43k/p3DoLwrg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=lFZ0WHytJP+hBIepekfE6opeFrj8+6VAQ2Hu5segBAlTfWpk3xXVUcf6OTCv4TsUdC
	hsPcjKYh2BHvH52upZe922uJfH/VFQHF4T+SMpqgAtUZAzkV6/s7MhHQWa/mn/9QVuWr
	UazBTEg2ekp8NMbk4B4isZkhRFF9F31FeAGq4=
Received: by 10.141.27.7 with SMTP id e7mr5220332rvj.257.1248807251793;
	Tue, 28 Jul 2009 11:54:11 -0700 (PDT)
Received: from gmail.com (adsl-71-146-0-187.dsl.pltn13.sbcglobal.net
	[71.146.0.187])
	by mx.google.com with ESMTPS id g14sm756587rvb.40.2009.07.28.11.54.10
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 28 Jul 2009 11:54:10 -0700 (PDT)
Date: Tue, 28 Jul 2009 11:54:05 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090728185405.GA25883@gmail.com>
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
X-List-Received-Date: Tue, 28 Jul 2009 19:09:01 -0000
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


FWIW patch looks ok. Can you send it with recipe changes ?
so it can be applied 
Thx

-Khem



