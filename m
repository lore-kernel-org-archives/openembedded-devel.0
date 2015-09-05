Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4DBE37706B
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Sep 2015 06:49:39 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so36291333wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Sep 2015 23:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=F+XPya38IkFYWC2WkQ895/Wyozs3kJm7mwuRS76FG5Y=;
	b=Oiwa5RTpma/4mo1jdceAAdrPKSet1IRHUNGtPtIgbsNbLr4I22I2I3C0Q0NC2IGdD0
	2h62R83c/uhAYdJqaLsuqehr9+yvPJqEOaJHI97TGLPhgeIKNRRVG1Tx9Gr8yBxFx6nx
	7bFqUlCG88R3YmvgV+lfqU+NDAGZjSX6qeEwISkU+JRYfULw1eeAm7aYu8A1CdV1x2tM
	qSjcOMWcBdYA/47tyRi2XupE9HjnkB9vnTWQGcL3CpuRu0lc6x45j1IlawwMXGEkCsBi
	QSaQpjgtDVLapS1U6NohhIKFWAUSHQ13Cciuf0j3AC/K5ddkZMJdJqjrS2HTYJKyr2XM
	hbGQ==
X-Gm-Message-State: ALoCoQle3cwKZ3UoLs+v419vbsXSNCWwoYB/cI9M84miT8AyYL42zKBn5ziQMnZBg30DIt/CxRGW
X-Received: by 10.180.39.145 with SMTP id p17mr14983862wik.70.1441435779732;
	Fri, 04 Sep 2015 23:49:39 -0700 (PDT)
Received: from ?IPv6:2001:bf0:c080:401::2? (wiki.deck1.zone42.org.
	[2001:bf0:c080:401::2]) by smtp.gmail.com with ESMTPSA id
	cj1sm8525391wib.14.2015.09.04.23.49.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Sep 2015 23:49:39 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <55E9C13C.9070308@zone42.org> <20150904174301.GD2457@jama>
From: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <55EA9081.2040608@dresearch-fe.de>
Date: Sat, 5 Sep 2015 08:49:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <20150904174301.GD2457@jama>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-qt5] install problem for qtbase
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 05 Sep 2015 06:49:40 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Am 04.09.2015 um 19:43 schrieb Martin Jansa:
> On Fri, Sep 04, 2015 at 06:05:16PM +0200, Steffen Sledz wrote: We've a big problem building qtbase (from fido branch) for two machines with the same SoC in one workspace.
> 
> It seems that the do_install of the run for the second machine (which fails) destroys the image subdirectory totally. :(
> 
>> the image subdirectory is only temporary and removed before do_install starts
> 
>> permanent files are always installed in MACHINE sysroot (or as packages in deploy directory)

That's clear but why does the image subdir contains the

 ??? home
 ?   ??? sledz
 ?       ??? work

subtree after the second run? And why are the font files (and may be other) in a wrong location?

>> use bitbake-diffsigs to find out why do_install is re-executed for your secondmachine after it was finished for firstmachine.

OK, i wil try this. Can you give a brief instruction how to do this in detail?

> Here's what we see after a clean build:
> 
> ------------------------------------------------------------------------------------- MACHINE=firstmachine bitbake qtbase
> 
> # tree -d -L 3 tmp-glibc/work/cortexa9t2hf-vfp-neon-mx6qdl-angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-r0/image/ tmp-glibc/work/cortexa9t2hf-vfp-neon-mx6qdl-angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-r0/image/ ??? usr ??? bin ?   ??? qt5 ??? include ?   ??? qt5 ??? lib ?   ??? cmake ?   ??? fonts ?   ??? pkgconfig ?   ??? qt5 ??? share ??? doc ??? qt5
> 
> 13 directories # tree -d -L 3 tmp-glibc/work/x86_64-linux/qtbase-native/5.4.2+gitAUTOINC+2cb17c1fb9-r0/image/ tmp-glibc/work/x86_64-linux/qtbase-native/5.4.2+gitAUTOINC+2cb17c1fb9-r0/image/ ??? home ??? sledz ??? work
> 
> 3 directories
> 
> ------------------------------------------------------------------------------------- MACHINE=secondmachine bitbake qtbase
> 
> # tree -d -L 3 tmp-glibc/work/cortexa9t2hf-vfp-neon-mx6qdl-angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-r0/image/ tmp-glibc/work/cortexa9t2hf-vfp-neon-mx6qdl-angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-r0/image/ ??? home ?   ??? sledz ?       ??? work ??? usr ??? bin ?   ??? qt5 ??? lib
> 
> 7 directories # tree -d -L 3 tmp-glibc/work/x86_64-linux/qtbase-native/5.4.2+gitAUTOINC+2cb17c1fb9-r0/image/ tmp-glibc/work/x86_64-linux/qtbase-native/5.4.2+gitAUTOINC+2cb17c1fb9-r0/image/ ??? home ??? sledz ??? work
> 
> 3 directories
> 
> -------------------------------------------------------------------------------------
> 
> Additionally after the second run some files are in the wrong subdirectories, e.g. the font files are located in image/usr/lib/ instead of image/usr/lib/fonts.

- -- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJV6pCBAAoJEIz5slJ1krPhBEQQAL86xHoNH63omdOPI/03x8nt
wLhwKoZVI3mnrvsrOmQD7n4TDMHNh8FNDehFgJC9yO5BgphcFPrrnoVFvqYHSsu4
+8Z16UMoWd/hvvyntl1Ua4qaJo8SBtu/Dzr3+bIBF8Fh70UVu562LCGZGusopR0T
AMLDipZ9RDYeV3hgsufk3x2NCz55vc8/vobzdgGj5jp0rPEVw+dWq2jrc4PT7xxV
F80/XNykVD+nZ8L5X/J9Iwfb1oARInbyqa9ENugncmqkcAQrLpBhueIxCJwYtYLz
9vMR2zpvGlYw8kswWdom74FVDGyQz7xSQj02cbeLHSzRFIcaSgE6xypo0sJ47prm
S1PRQGvdd0LP1aP9BZdGToirTFM3QkMDAXzNPnPwjliM/de9vpC/Pen3kt75hwHn
jt3kfW+wpjE31yrViIOGXwbohw6iMEUepfUojK8XjM7+OpEKNmbwDrE1ZuKJDoqq
gjotuf+rRb89338O9FqzHioM9798Ihg0nVLEnmEXblGqkBCQSf6T391Q1PBdayoP
+hMqk3yb4Bee0UClj0HP/uy3oHTO8rtdmcw1eHLQen/zJbuTbvcYmPLqxI8oOcdt
eaQzMqBMMX+f0jhVTg4TXKZNatR0eQpToZeALcRo3qNuDTfN4M3p68gxlThd0dzs
ujlqdS9/2vGQ7Q7U2cvE
=88HE
-----END PGP SIGNATURE-----

