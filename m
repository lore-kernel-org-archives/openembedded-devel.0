Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OdTjV-0006bZ-Qa
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jul 2010 21:53:07 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OdTjE-0007N3-3D from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jul 2010 12:52:48 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 26 Jul 2010 12:52:47 -0700
Received: from [172.30.80.16] ([172.30.80.16]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 26 Jul 2010 13:52:46 -0600
Message-ID: <4C4DE788.3050204@mentor.com>
Date: Mon, 26 Jul 2010 12:52:40 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTim5aAnNi5VFs7=-gg1XaM=+KBeUs-G494SEbR+V@mail.gmail.com>	<4C4AE42C.5000306@welchs.me.uk>	<AANLkTimG_U4Gsc9LuK6oKDJO2rE=xB7cDQzGf6dsh2GM@mail.gmail.com>	<4C4B0125.1040304@vollmann.ch>
	<i2f05l$pne$1@dough.gmane.org>
In-Reply-To: <i2f05l$pne$1@dough.gmane.org>
X-OriginalArrivalTime: 26 Jul 2010 19:52:46.0893 (UTC)
	FILETIME=[1EB7BDD0:01CB2CFC]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] get rid of legacy staging
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
X-List-Received-Date: Mon, 26 Jul 2010 19:53:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 24-07-10 17:05, Detlef Vollmann wrote:
>> On 07/24/10 16:35, Frans Meulenbroeks wrote:
>>> 2010/7/24 Martyn Welch <martyn@welchs.me.uk>
>>>
>>>> Can anyone point me to any documentation that describes what legacy
>>>> staging
>>>> is and roughly what needs to be done to remove it?
>>> There was a post half a year or so ago from Koen, but I can't find it.
>>> Basically it boils down to removing do_stage from a recipe in which case
>>> do_install is used to install things in staging
>>> in some cases do_install need to be modified to deal with
>>> peculiarities that
>>> were done in do_stage
>>>
>>> For native recipes NATIVE_INSTALL_WORKS = "1" may need to be added.
>> That's not really much of an explanation.
>> Let's take an example.  I have two out of tree kernel modules A and B.
>> B depends on A.
>> With "legacy" staging, in A_1.0.bb I have a do_install, that copies
>> the kernel object, and a do_stage, that copies the header file at
>> a place where B_1.0.bb can find it.
>>
>> How do I do that with non-"legacy" staging?
> 
> You copy the header in do_install to ${D}${includedir} or a subdir of
> that depending on the header.
> 
> Cheat sheet:
> 
> STAGING_BINDIR -> ${D}${bindir}
> STAGING_INCDIR -> ${D}${includedir}
> STAGING_LIBDIR -> ${D}${libdir}
> STAGING_DATADIR -> ${D}${datadir}
> 
> And if your recipe uses BBCLASS_EXTEND = native *and* 'make install'
> doesn't do the job (e.g. using do_install_append), use
> NATIVE_INSTALL_WORKS = "1"
> 
> If you use packaged-staging it's easy to do dpkg-deb -c on the staging
> packages before and after the changes.

http://wiki.openembedded.org/index.php/Legacy_staging
and is linked from 
http://wiki.openembedded.org/index.php/OpenEmbeddedJanitors

-- 
Tom Rini
Mentor Graphics Corporation


