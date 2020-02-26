Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 64B9A60741
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2020 11:43:11 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1j6v5q-00066E-A4; Wed, 26 Feb 2020 12:43:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IaKe3fSoI79ttZjw/THSxEVlcaZ96fpLOubBSqRwWcU=;
	b=L1xrP8S0PrUy+q3f2j5og4dtr3
	QRwqXWwvGAy7T/LrcDX8h36jTW1fbC6yqd+acHnB0wqK1bWizqaLw/6P7adGH3rtiN9nKWWPV4SbF
	qYg5JCwO+hBpH1ctnK+LPNHDXV21dkIg6HZPrCtdDZOoV1VlX4E9hTF6TZUWkI264bp48eHzTvbcA
	jhL3OLf4hq5O06CY8VRSEjMqMVECdFBk/sgTioJzU+Yg2/KvywNBQAOL170+bBWO22Nr2P9UmYbw5
	NIOTaBVDTAAYxRP7QaCkuktbXRhoY495XdaVShwLu8DEwCRj0eI9M1R9aTaNPCzwvOOR4ewNSvEFS
	XZQ6BxpQ==;
Received: from host-87-242-33-197.prtelecom.hu ([87.242.33.197]
	helo=[192.168.1.2])
	by mail.pr.hu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <zboszor@pr.hu>)
	id 1j6v5l-0006dW-VY; Wed, 26 Feb 2020 12:43:08 +0100
To: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
References: <55B8D485.7080207@pr.hu>
	<27501214-4FE0-4D4B-8E0F-797B153B9988@gmail.com>
	<9e16757b-6678-8be6-9a2c-6d05eb54a500@pr.hu>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Message-ID: <7edd1d26-96de-537a-ef17-a1a36670fdb8@pr.hu>
Date: Wed, 26 Feb 2020 12:43:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <9e16757b-6678-8be6-9a2c-6d05eb54a500@pr.hu>
X-Spam-Score: -1.9 (-)
X-Scan-Signature: fc814016fbf334f6643f2a7843ee50ce
X-Spam-Tracer: backend.mail.pr.hu -1.9 20200226114308Z
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
X-List-Received-Date: Wed, 26 Feb 2020 11:43:12 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

2020. 02. 26. 9:49 keltezéssel, Böszörményi Zoltán via Openembedded-devel írta:
> Hi,
> 
> I am reviving this old idea with Zeus.
> 
> I have implemented the idea in an ALMOST satisfactory way, tested with
> Mesa 20.0.0.
> 
> Side note: Mesa 19.3 and 20.0 needs TOOLCHAIN="gcc" in Zeus,
> otherwise linker errors occur. See:
> https://gitlab.freedesktop.org/mesa/mesa/issues/2533
> 
> Mesa doesn't link to libva even with meson -Dgallium-va=true. It only
> needs the libva.pc pkgconfig file and the headers from libva to build
> its VA state tracker so the circular dependency is not that hard to solve.
> 
> I have this new recipe called libva-headers now that is a fork of the
> libva recipe and just deletes the libraries in do_install_append.
> 
> My Mesa recipe addendum has this line plus PACKAGECONFIG has "va":
> 
> PACKAGECONFIG[va] = "-Dgallium-va=true,-Dgallium-va=false,libva-headers"
> 
> Now, building libva is happy without the warning about libva.so is
> shipped by libva-headers (or libva-noglx in the previous incarnation)
> but now marked as shipped by libva because it was built later.
> 
> There is another problem now: anything that uses libva as dependency,
> like intel-vaapi-driver, implicitly pulls in mesa and then libva-headers
> so there is a clash in prepare-sysroot between libva and libva-headers
> because they still ship identical headers and pkgconfig files.
> 
> My current solution to the problem is to patch staging.bbclass to
> handle a new variable called EXCLUDE_DEPS but a line like this below
> needs to be added to all recipes that depends on libva, so it is
> quite intrusive for now.
> 
> EXCLUDE_DEPS = "libva-headers"
> 
> I am looking into storing data in "sstate", so libva-headers would add
> itself into a new class of packages that are not added to recipe-sysroot
> unless it is in DEPENDS explicitly.
> 
> My question is: is there a generic framework to do this already?

Talking to myself... YES THERE IS.
I just had to name the extra package as "libva-initial" and it works
the way I expected with no extra fuss.

> 
> This would allow me to not modify other recipes and may alsoserve other
> recipes with circular dependencies.
> 
> The end goal is to allow Chromium to be built with use_vaapi=true now that
> meta-browser has version 79 that includes the VAAPI patches. The current
> solution with setting EXCLUDE_DEPS already does this but as I said, it's
> not clean enough.
> 
> Best regards,
> Zoltán Böszörményi
> 
> 2015. 08. 09. 0:14 keltezéssel, Khem Raj írta:
>>
>>> On Jul 29, 2015, at 6:26 AM, Boszormenyi Zoltan <zboszor@pr.hu> wrote:
>>>
>>> Hi,
>>>
>>> I have a customized Mesa 10.6.3 package recipe which depends on libva
>>> to be able to build its mesa-va-driver subpackage, but libva also depends
>>> on Mesa to support GLX.
>>>
>>> Previously, I simply created a libva-noglx package that builds libva
>>> with --disable-glx that Mesa depend on and the "real" libva package can
>>> depend on Mesa.
>>>
>>> But since I also have to produce an SDK image with all the *-dev packages,
>>> creating such an initial image with bitbake fails because of a conflict
>>> in the dependency chain: libva-dev -> mesa-dev -> libva-noglx-dev.
>>>
>>
>> since libva-noglx is sort of a bootstrap package, you could empty/delete out the content
>> its puts into -dev packages and conflict will be gone. Other option is that you share
>> the content of -dev package in exclusive manner between libva and libva-noglx such
>> that they don’t package duplicate files
>>
>>> I have come up with the attached bbclass (based on Yocto 1.6) that
>>> now Mesa can inherit and that patches the RDEPENDS / RRECOMMENDS
>>> variables according to externally set variables. The comment at
>>> the beginning of the file explains how to use it.
>>>
>>> This pushes the cyclic dependency to opkg which happily breaks it and
>>> installs both libva* and *mesa* packages properly. Creating the initial
>>> image via bitbake works now.
>>>
>>> Comments?
>>>
>>> Best regards,
>>> Zoltán Böszörményi
>>>
>>> <cyclic-deps.bbclass>--
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>>
> 


