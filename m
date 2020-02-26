Return-Path: <zboszor@pr.hu>
X-Greylist: delayed 398 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 26 Feb 2020 08:56:01 UTC
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 99A946010E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2020 08:56:01 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1j6sNe-000700-IQ; Wed, 26 Feb 2020 09:49:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2guuJyruW/bq2wns3UnAtGamz9hk37a6AsH1phVjAJE=;
	b=eh09LoDuIV3TS9Tqqj4rVi5/Gr
	4XeNgg6lpEDr0jEukrshzF+vA5k67BvYecvu0lTC5z7+UztsHeWjEFTCrBfEX185jy9STNxp6DyAZ
	/Cv4IhDObVBzkkkNxNlKhq20nF0ZfWp6xBeCC5OhcKA2fvxjWsYS6MY9AV96wuROeJ2Ehook2NejS
	D6Tow6UysRo0yiT2YpA8FErhPll4K68aaHFiRr2Y4y8j7j4YYVEclacqrUL/cXxDtYs3xTBT23V+2
	JD1lCml+sh8aU2nTIFK+8NXwixypfnQZMgiY9GXPhxqTsdovuoOSIQxEaYnzFN4wiG8bXWyP/Ilmw
	SJpLrbwQ==;
Received: from host-87-242-33-197.prtelecom.hu ([87.242.33.197]
	helo=[192.168.1.2])
	by mail.pr.hu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <zboszor@pr.hu>)
	id 1j6sNa-0007ZH-5O; Wed, 26 Feb 2020 09:49:20 +0100
To: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
References: <55B8D485.7080207@pr.hu>
	<27501214-4FE0-4D4B-8E0F-797B153B9988@gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Message-ID: <9e16757b-6678-8be6-9a2c-6d05eb54a500@pr.hu>
Date: Wed, 26 Feb 2020 09:49:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <27501214-4FE0-4D4B-8E0F-797B153B9988@gmail.com>
X-Spam-Score: -1.9 (-)
X-Scan-Signature: d8487180e38fe565612df7e774c06e36
X-Spam-Tracer: backend.mail.pr.hu -1.9 20200226084920Z
Subject: Re: Trying to resolve build-time cyclic dependency between packages
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
X-List-Received-Date: Wed, 26 Feb 2020 08:56:01 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi,

I am reviving this old idea with Zeus.

I have implemented the idea in an ALMOST satisfactory way, tested with
Mesa 20.0.0.

Side note: Mesa 19.3 and 20.0 needs TOOLCHAIN="gcc" in Zeus,
otherwise linker errors occur. See:
https://gitlab.freedesktop.org/mesa/mesa/issues/2533

Mesa doesn't link to libva even with meson -Dgallium-va=true. It only
needs the libva.pc pkgconfig file and the headers from libva to build
its VA state tracker so the circular dependency is not that hard to solve.

I have this new recipe called libva-headers now that is a fork of the
libva recipe and just deletes the libraries in do_install_append.

My Mesa recipe addendum has this line plus PACKAGECONFIG has "va":

PACKAGECONFIG[va] = "-Dgallium-va=true,-Dgallium-va=false,libva-headers"

Now, building libva is happy without the warning about libva.so is
shipped by libva-headers (or libva-noglx in the previous incarnation)
but now marked as shipped by libva because it was built later.

There is another problem now: anything that uses libva as dependency,
like intel-vaapi-driver, implicitly pulls in mesa and then libva-headers
so there is a clash in prepare-sysroot between libva and libva-headers
because they still ship identical headers and pkgconfig files.

My current solution to the problem is to patch staging.bbclass to
handle a new variable called EXCLUDE_DEPS but a line like this below
needs to be added to all recipes that depends on libva, so it is
quite intrusive for now.

EXCLUDE_DEPS = "libva-headers"

I am looking into storing data in "sstate", so libva-headers would add
itself into a new class of packages that are not added to recipe-sysroot
unless it is in DEPENDS explicitly.

My question is: is there a generic framework to do this already?

This would allow me to not modify other recipes and may alsoserve other
recipes with circular dependencies.

The end goal is to allow Chromium to be built with use_vaapi=true now that
meta-browser has version 79 that includes the VAAPI patches. The current
solution with setting EXCLUDE_DEPS already does this but as I said, it's
not clean enough.

Best regards,
Zoltán Böszörményi

2015. 08. 09. 0:14 keltezéssel, Khem Raj írta:
> 
>> On Jul 29, 2015, at 6:26 AM, Boszormenyi Zoltan <zboszor@pr.hu> wrote:
>>
>> Hi,
>>
>> I have a customized Mesa 10.6.3 package recipe which depends on libva
>> to be able to build its mesa-va-driver subpackage, but libva also depends
>> on Mesa to support GLX.
>>
>> Previously, I simply created a libva-noglx package that builds libva
>> with --disable-glx that Mesa depend on and the "real" libva package can
>> depend on Mesa.
>>
>> But since I also have to produce an SDK image with all the *-dev packages,
>> creating such an initial image with bitbake fails because of a conflict
>> in the dependency chain: libva-dev -> mesa-dev -> libva-noglx-dev.
>>
> 
> since libva-noglx is sort of a bootstrap package, you could empty/delete out the content
> its puts into -dev packages and conflict will be gone. Other option is that you share
> the content of -dev package in exclusive manner between libva and libva-noglx such
> that they don’t package duplicate files
> 
>> I have come up with the attached bbclass (based on Yocto 1.6) that
>> now Mesa can inherit and that patches the RDEPENDS / RRECOMMENDS
>> variables according to externally set variables. The comment at
>> the beginning of the file explains how to use it.
>>
>> This pushes the cyclic dependency to opkg which happily breaks it and
>> installs both libva* and *mesa* packages properly. Creating the initial
>> image via bitbake works now.
>>
>> Comments?
>>
>> Best regards,
>> Zoltán Böszörményi
>>
>> <cyclic-deps.bbclass>--
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 
> 


