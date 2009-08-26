Received: from [128.178.224.219] (helo=smtp0.epfl.ch)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <valentin.longchamp@epfl.ch>) id 1MgCZo-0001tz-2s
	for openembedded-devel@openembedded.org; Wed, 26 Aug 2009 09:05:52 +0200
Received: (qmail 26067 invoked by uid 107); 26 Aug 2009 06:47:50 -0000
X-Virus-Scanned: ClamAV
Received: from unknown (85.4.79.108) (authenticated)
	by smtp0.epfl.ch (AngelmatoPhylax SMTP proxy);
	Wed, 26 Aug 2009 08:47:50 +0200
Message-ID: <4A94DA90.8090306@epfl.ch>
Date: Wed, 26 Aug 2009 08:47:44 +0200
From: Valentin Longchamp <valentin.longchamp@epfl.ch>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A937831.2000304@4d-electronics.co.nz> <4A93A9E3.7090605@epfl.ch>
	<4A9461C3.2000406@4d-electronics.co.nz>
In-Reply-To: <4A9461C3.2000406@4d-electronics.co.nz>
Subject: Re: [PATCH] Add toolchain file generation to cmake bbclass
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
X-List-Received-Date: Wed, 26 Aug 2009 07:06:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Matthew Dombroski wrote:
>> I have had no problem with boost and with Qt4, I have been able to
>> achieve similar results without the toolchain file, only by using a
>> qt.conf file as Zecke had suggested to me.
> I'm using boost-1.39 and found i needed to set Boost_COMPILER or it 
> wouldn't find libraries. (Oh how I hate bjam, but thats another story...)

Ok, I think I had 1.36.

> 
> Setting Qt environment data in cmake.bbclass may seem a bit out of 
> place.  When you consider that cmake is distributed with scripts for 
> configuring/detecting Qt it doesn't seem too bad.
> It is definitly tidier than generating a qt.conf in every recipe. Adding 
> all the Qt info in EXTRA_OECMAKE is doing the same work twice.

Well that's a point of view. From my point of view, not all cmake based 
programs need that qt info, that's why I find it's cleaner to enable it 
in the recipes that need these libraries.

About adding the EXTRA_OECMAKE, I have to check, but I think I needed to 
define some so that the right qmake is found. I will try without or by 
adding only the needed definitions.

> 
>> Although the toolchain file is the preferred value according to the
>> cmake documentation, it has not been necessary to me.
> 
> The effect of a toolchain file is the same as that of defining lots of 
> options in EXTRA_OECMAKE.
> personally, I think it is cleaner. The ability to use it outside of 
> openembedded is really useful to me also.

I agree that it is the same. It's just that it was done until now like 
that in OE, so I chose that way. However one advantage that I see of 
defining things directly in the recipes and not in a toolchain file, is 
that you can easily add definitions using EXTRA_OECMAKE in every recipe. 
Is cmake able to take two toolchain files (one from cmake.bbclass and 
one from the recipes with the needed libraries) without having to 
rewrite the do_configure in the recipe ?

This comes back to the point above: do we need to define all the 
libraries that could come with cmake-based programs in cmake.bbclass ? 
 From my point of view, this is definitely something related to the recipes.

Val



