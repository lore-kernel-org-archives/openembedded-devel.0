Received: from [212.60.202.195] (helo=mail.kernelconcepts.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <nils.faerber@kernelconcepts.de>) id 1Gm7KM-00082W-R6
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Nov 2006 12:28:42 +0100
Received: from [212.60.202.194] (helo=[192.168.2.28])
	by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA:32) (Exim 4.50) id 1Gm7ok-0003q1-Uf
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Nov 2006 13:00:07 +0100
Message-ID: <456190CA.6000809@kernelconcepts.de>
Date: Mon, 20 Nov 2006 12:26:02 +0100
From: Nils Faerber <nils.faerber@kernelconcepts.de>
Organization: kernel concepts
User-Agent: Thunderbird 1.5.0.7 (X11/20060922)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <45566FBC.1030206@kernelconcepts.de>	<45586AF5.8060800@kernelconcepts.de>	<45589A63.9030808@kernelconcepts.de>	<200611131725.11432.openembedded@hrw.one.pl>	<4558B5D3.2090609@kernelconcepts.de>	<4558DA84.5030003@dominion.kabel.utwente.nl>
	<4559F05C.20003@kernelconcepts.de>
In-Reply-To: <4559F05C.20003@kernelconcepts.de>
X-Enigmail-Version: 0.94.0.0
Subject: Re: ARM EABI SDK build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Nov 2006 11:28:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi!
I am made one step forward but do not think that it is the right way to
do it...
The task-sdk worked to build though meta-sdk still does not. Copying the
toolchain out of tmp/cross/ and adding libs from staging seems to work.

But it seems "unclean" to me and involves manual collection of all the
bits and pieces.

Still noone knows why meta-sdk fails?

Cheers
  nils

Nils Faerber schrieb:
> Koen Kooi schrieb:
>> Nils Faerber schreef:
>>>> OK, that was indeed fixed.
>>>> But I still have the problem that gcc-cross-sdk-4.1.1 fails to compile
>>>> due to problems with sys/types.h
>>>> This is really strange since this originates from glibc.
>>>>
>>>> Koen: Didn't you build an EABI-softfloat toolchain already?
>> Riku did:
>> http://dominion.kabel.utwente.nl/koen/cms/using-openembedded-toolchains-in-scratchbox
> 
> OK... well we tried both approaches now, the simpler one you mentioned
> on the list and our own - both failed at the same gcc-sdk compile in
> libiberty (see my previous log).
> 
> I now investigated this a little further..
> 
> First of all I think that gcc4-build-sdk.inc has an error. I think that
> line 3
> 
>   SRC_URI += 'file://602-sdk-libstdc++-includes.patch;patch=1'
> 
> is not needed (anymore) and rather causes do_patch to fail.
> After fixing that I get to the old point with libiberty, etc...
> 
> Then I tried to build gcc-cross target and see: It works!
> 
> So I suspect that there is some problem with the gcc-cross-sdk target.
> But I am too new to OE to be able to fix that, I fear.
> 
> So a big please to the maintainer of that target: Could you help me
> please? I need that compiler ;)
> 
> Many thanks!
> 
> Oh ... and please have someone review the above gcc4-build-sdk.inc and
> potentially remove the SRC_URI line...
> 
>> regards,
>> Koen
> Cheers
>   nils faerber

-- 
kernel concepts GbR      Tel: +49-271-771091-12
Dreisbachstr. 24         Fax: +49-271-771091-19
D-57250 Netphen          Mob: +49-176-21024535
--


