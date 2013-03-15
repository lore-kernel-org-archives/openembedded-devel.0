Received: from mail-qa0-f41.google.com ([209.85.216.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eu@felipetonello.com>) id 1UGIV8-0006na-G9
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Mar 2013 01:28:03 +0100
Received: by mail-qa0-f41.google.com with SMTP id bs12so16757qab.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Mar 2013 17:11:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:subject
	:references:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=DPCsiInZRzBU7fMVYrwpsBHsqSnKZJMaqKhd/kO1Kqk=;
	b=FPdNCbLAmjBdbp+76gHVTcmS1txM5WXs7sZEmAOOpQoph6Ch3RBJX7JjeK7X4ucvpE
	6YI1VDD1NEhrvdbTiA5ApxRSuxK9mSt1krMDSzh4UeyrSZOH4TFogScytndqrOcgU1CB
	Xb8INKW7OJRuV289/niJ6ACJgG+Zd0xFxmd+sRiPvR3dePqcGwHPjoAhSafnYDp6k0P9
	2omDAZM+EDw8hgRTFTJw2Ij8CKM9Xs7nATLa92yDJjXyW4MhQJbpiRwjbg2aTmQwy9+C
	rtcDCNxY5mxQKjZkXetf0H1uxBq4bxqYNM5l9gDiv/O0EeMP/VFdLjSqb+/HOBG9YSUC
	kEsw==
X-Received: by 10.224.216.8 with SMTP id hg8mr4067723qab.74.1363306279126;
	Thu, 14 Mar 2013 17:11:19 -0700 (PDT)
Received: from [192.168.48.44] (wsip-70-183-20-162.oc.oc.cox.net.
	[70.183.20.162])
	by mx.google.com with ESMTPS id j6sm837434qek.8.2013.03.14.17.11.17
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 14 Mar 2013 17:11:18 -0700 (PDT)
Message-ID: <51426724.4050607@felipetonello.com>
Date: Thu, 14 Mar 2013 17:11:16 -0700
From: Felipe Ferreri Tonello <eu@felipetonello.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1363192654-5856-1-git-send-email-ftonello@cercacor.com>
	<khsn7t$31g$1@ger.gmane.org>
In-Reply-To: <khsn7t$31g$1@ger.gmane.org>
X-Gm-Message-State: ALoCoQmLU2WhOmlXlmNtbwfxsbbvmgN/WKSKSZu80JavLlTKIM5LEYpiwGZwh5T0FuULIe02LuMT
Subject: Re: [meta-oe][PATCH v3] fingerterm: Added 1.0.2 recipe
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
X-List-Received-Date: Fri, 15 Mar 2013 00:28:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Koen,

On 03/14/2013 07:35 AM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 13-03-13 17:37, eu@felipetonello.com schreef:
>> From: "Felipe F. Tonello" <ftonello@cercacor.com>
>>
>> Fingerterm is a terminal emulator for Nokia Harmattan, but it works in
>> any Qt4 environment.
>>
>> This recipe can be extended by a .bbappend to add .desktop, icon and
>> others to the target device.
>
> Why not include a default .desktop in the recipe so it actually works out of
> the box?

The binary is been installed. So it will work out of the box.

Regarding the .desktop file, it is not installed by default because  it 
was done for MeeGo only. It needs some hack to work for generic desktops 
that follow desktop-entry spec[1].

[1] http://standards.freedesktop.org/desktop-entry-spec/latest/

Felipe

>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFRQeBGMkyGM64RGpERAgyPAJ0USSaBvvUFaBFIJe2TU5g809CDhgCffXxy
> p6KfZb9GJ6BgF049Lhzs8bI=
> =7rVm
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



