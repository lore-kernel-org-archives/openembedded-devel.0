Received: from [64.233.166.180] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1K42NT-000799-12
	for openembedded-devel@openembedded.org; Thu, 05 Jun 2008 01:26:47 +0200
Received: by py-out-1112.google.com with SMTP id a73so444237pye.2
	for <openembedded-devel@openembedded.org>;
	Wed, 04 Jun 2008 16:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:cc:subject:references:in-reply-to
	:x-enigmail-version:openpgp:content-type:content-transfer-encoding;
	bh=wt6TBX8O5t3bWK1MMxbzx04uajXcsMKRHGVujkZVC6g=;
	b=eIePlmhfGRucLSJGeZ7cBp23vSXRSJiXJAao/rkQzj32zQC2iZlwXWT1wStVsQC+Wt
	qVuDWrmuB5WmeucX83GX+PwHCln3I8O4Z6Sr8nfPkI4pKAK7Wg1pXL+OR82q5wscjDQX
	VA09xQJ8ic1wqjYCqJQ8aTJ1lWR8xzTJCzuYY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:openpgp:content-type
	:content-transfer-encoding;
	b=ArcrVXIIRXdiljxFF86Uf4/6POZUBjcibel8iK0pnS/39vIeaLE40JFXGgb9Le3OEt
	Yi/ldr2S6QWLS+XFsRkBZtRn4MuGf8iN6sCJ3eXiiOY7G/JRMXUi0cZr3HJtpL6MWkZG
	PvWfz0uDae0w2ODQYyErVgJEje2uI5nSdAcr0=
Received: by 10.143.18.21 with SMTP id v21mr209311wfi.185.1212621729294;
	Wed, 04 Jun 2008 16:22:09 -0700 (PDT)
Received: from ?192.168.1.71? ( [71.146.30.173])
	by mx.google.com with ESMTPS id 20sm4208920wfi.11.2008.06.04.16.22.07
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 04 Jun 2008 16:22:08 -0700 (PDT)
Message-ID: <4847239E.90404@gmail.com>
Date: Wed, 04 Jun 2008 16:22:06 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Thunderbird 2.0.0.14 (X11/20080505)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <70c9a9110805220710x6663f582lc5d6b75744960d08@mail.gmail.com>	<70c9a9110805220711i33fd397k518855a05773edf0@mail.gmail.com>	<1211958108.27777.15.camel@isis>	<35a670560805280252o3fc348d1x7b7cf51b01f209e9@mail.gmail.com>	<g1jf9e$ltq$1@ger.gmane.org>	<35a670560806030016y4fab1071pd7843d2736b32943@mail.gmail.com>
	<g25tes$bdb$1@ger.gmane.org>
In-Reply-To: <g25tes$bdb$1@ger.gmane.org>
X-Enigmail-Version: 0.95.0
OpenPGP: id=A57A7A6E;
	url=pool.sks-keyservers.net
Cc: openembedded-devel@openembedded.org
Subject: Re: GCC 4.3 fails to build glibc(-intermediate)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Wed, 04 Jun 2008 23:26:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> Matthijs van de Water wrote:
>> Did anyone working with GCC 4.3 have any problems with the C++
>> compiler in the SDK?
>>
>> With the current setup, my include path search order is such that for
>> instance the<cstdlib>  header is trying to #include_next<stdlib.h>,
>> which fails because the normal include paths precede the C++ include
>> paths.
>> If I change the #include_next to #include the headers work fine, but
>> that is obviously no solution. It looks like this is broken for all
>> sysroot builds, because the compiler will put the sysroot include
>> before the C++ ones and get rid of any duplicates.
>>
>> Did anyone see this before?
> 
> I did see that before as well.

I was seeing this too while compiling libusb. However when I did not use --with-gxx-headers option
and did not move the headers manually to STAGING_DIR this worked even with c_global scope.


> 
>> Any suggestions? I think I can solve this
>> by changing back to --enable-cheaders=c_std instead of c_global (which
>> was the default previously and which is why pre-4.3 toolchains work
>> fine for me), but I'm not sure of the implications of that.
> 
> Maybe we try something like this:
> 
> --- packages/gcc/gcc-4.3.0.inc  7dac0d4ea94fbc3071cf13542d7afc9c97598920
> +++ packages/gcc/gcc-4.3.0.inc  d4ceae7672f475a16184235ac603437f86c3079e
> @@ -68,5 +68,5 @@ JAVA = ""
>  FORTRAN = ""
>  JAVA = ""
> 
> -EXTRA_OECONF_BASE = " --enable-libssp --disable-bootstrap
> --disable-libgomp --disable-libmudflap"
> +EXTRA_OECONF_BASE = "  --enable-cheaders=c_std --enable-libssp
> --disable-bootstrap --disable-libgomp --disable-libmudflap"
> 
> ============================================================
> --- packages/gcc/gcc-cross_4.3.0.bb
> 1ed2f60e65e1b09e4a5637ab29c85ad02338061f
> +++ packages/gcc/gcc-cross_4.3.0.bb
> cc76abacb299b51bb7da2b6bc0a6f7bec093ebeb
> @@ -7,6 +7,12 @@ SRC_URI_append_fail-fast = " file://zeck
> 
>  SRC_URI_append_fail-fast = " file://zecke-no-host-includes.patch;patch=1 "
> 
> -EXTRA_OECONF += "--disable-libunwind-exceptions
> --with-mpfr=${STAGING_DIR_NATIVE}${layout_exec_prefix}"
> +EXTRA_OECONF += "  --enable-cheaders=c_std
> --disable-libunwind-exceptions
> --with-mpfr=${STAGING_DIR_NATIVE}${layout_exec_prefix}"

Adding this option worked for me and I could build console-image.

> 
> 
> regards,
> 
> Koen
> 
> 
>>
>> Regards,
>>
>> Matthijs
>>
>> --enable-cheaders=OPTION
>>
>>      This allows the user to define the approach taken for C header
>> compatibility with C++. Options are c, c_std, and c_global. These
>> correspond to the source directory's include/c, include/c_std, and
>> include/c_global, and may also include include/c_compatibility. The
>> default is c_global.
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 



