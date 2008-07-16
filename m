Received: from [209.85.146.180] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1KJ8vd-0000pX-Mq
	for openembedded-devel@openembedded.org; Wed, 16 Jul 2008 17:28:30 +0200
Received: by wa-out-1112.google.com with SMTP id j5so4746994wah.4
	for <openembedded-devel@openembedded.org>;
	Wed, 16 Jul 2008 08:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:cc:subject:references:in-reply-to
	:x-enigmail-version:openpgp:content-type:content-transfer-encoding;
	bh=65gAg1EUY2XSuncfVD/s6a0A242g9VNiE9r/B/Z+MZc=;
	b=rpEI6Un7tQu9gkwtq6+OImCINLPtl8F+rYSoAULUuL8YE9uDPrscHOqY+pA0bXGq3F
	x8LYWXoOITLJ95ktuJQ607h/+KfbYgTaqDSP77iTm3YeDzM2J8mP8L7+RkuTyZ5RdwzO
	IHOAxWadZvAV0I1vEVki0YyLlpDsXCKQYUbrE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:openpgp:content-type
	:content-transfer-encoding;
	b=GlccTjRGdoJHoCBgpcyBCBoWPHcVu+x98y/vudBvA7I7LuqLVeQhLJEh/sezXYjLDy
	ALHYO6Pl2dVpVqPtWlF5S2Q5TKXVIUTFTwMBUal0RwNvjUxioMqAZ9SjYQMD+oM07gxh
	wdtnkxTEt7/cX+gHwx2XBmpw0xgNCXujqPgGw=
Received: by 10.114.132.5 with SMTP id f5mr220913wad.201.1216222068524;
	Wed, 16 Jul 2008 08:27:48 -0700 (PDT)
Received: from ?192.168.1.71? ( [71.146.10.255])
	by mx.google.com with ESMTPS id m26sm13464856pof.1.2008.07.16.08.27.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 16 Jul 2008 08:27:48 -0700 (PDT)
Message-ID: <487E136D.5040308@gmail.com>
Date: Wed, 16 Jul 2008 08:27:41 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Thunderbird 2.0.0.14 (X11/20080505)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1216087105.10214.7.camel@isis> <487DACFF.5010504@gmail.com>
	<g5kch2$egl$1@ger.gmane.org>
In-Reply-To: <g5kch2$egl$1@ger.gmane.org>
X-Enigmail-Version: 0.95.0
OpenPGP: id=A57A7A6E;
	url=pool.sks-keyservers.net
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC]: Toolchain build sequence alteration.
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
X-List-Received-Date: Wed, 16 Jul 2008 15:28:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

> --- conf/distro/angstrom-2008.1.conf 
> f64ebcf55e85b504d3be169befac3c7981aa74d9
> +++ conf/distro/angstrom-2008.1.conf 
> 8703f595671685f632e51c96d1be75cdceddfe83
> @@ -70,9 +70,8 @@ PREFERRED_VERSION_linux-libc-headers 	=
>   PREFERRED_VERSION_linux-libc-headers 	= "2.6.23"
> 
>   #Prefer glibc 2.6 and uclibc 0.9.29, these have had the most testing.
> -PREFERRED_VERSION_glibc 		?= "2.6.1"
> -PREFERRED_VERSION_glibc-intermediate 	?= "2.6.1"
> -PREFERRED_VERSION_glibc-initial 	?= "2.6.1"
> +PREFERRED_VERSION_glibc 		?= "2.3.6"
> +PREFERRED_VERSION_glibc-initial 	?= "2.3.6"
> 
>   #Everybody else can just use this:
> -ANGSTROM_GCC_VERSION 			?= "4.2.4"
> +ANGSTROM_GCC_VERSION 			?= "3.4.4"
> 
> @@ -123,6 +122,7 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREF
>   # Virtuals:
>   PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils = "binutils-cross"
>   PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial = 
> "gcc-cross-initial"
> +PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate = 
> "gcc-cross-intermediate"
>   PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "gcc-cross"
>   PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "gcc-cross"
> 
> 
> You probably only want the PREFERRED_PROVIDER bit, not changing angstrom 
> back to the dark ages :)

yes thats true. I have been testing different compiler versions so this change remained in the patch. It wont be committed.

> 
> You also change handling of ctr*.o, but that was intended, right?

Thats intended. They are needed to build GCC with shared lib support

> 
> I see no obvious errors besides the above, but as I said, I haven't 
> tested it.

Thanks for your review.

> 
> regards,
> 
> Koen
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFIfhNtHnJKy6V6em4RAuNMAJ4ubEC77wxEbrHlLI/g4kZ0Ud6ECgCgjqbw
ZF0uKt8rhh/Sq4Qb6hCmP0U=
=dsS6
-----END PGP SIGNATURE-----


