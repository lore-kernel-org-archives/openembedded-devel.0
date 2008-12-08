Received: from [195.65.72.27] (helo=bagnes.atmel.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1L9jxr-0004uk-NJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Dec 2008 18:32:12 +0100
Received: from fribh01.corp.atmel.com (FRIBH01 [10.175.30.10])
	by bagnes.atmel.com (8.13.8+Sun/8.13.8) with ESMTP id mB8HNfDp002492
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 8 Dec 2008 09:23:41 -0800 (PST)
Received: from frimb01.corp.atmel.com ([10.175.30.12]) by
	fribh01.corp.atmel.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 8 Dec 2008 18:28:17 +0100
Received: from aeglos ([172.24.49.32]) by frimb01.corp.atmel.com with
	Microsoft SMTPSVC(6.0.3790.3959); Mon, 8 Dec 2008 18:28:15 +0100
Message-ID: <2D19713B4BB14FF185C39CFF714A6C9F@aeglos>
From: "Ulf Samuelsson" <ulf.samuelsson@atmel.com>
To: <openembedded-devel@lists.openembedded.org>
References: <C41AF57F04424526AD798F542197E674@aeglos><493D1A83.1070500@balister.org><48239d390812080508p7585f22bo529c8a5ebf2f438e@mail.gmail.com><8162086526F74198823FA0003D5FA08D@aeglos>	<48239d390812080709l2051390en9ec07e495eff560e@mail.gmail.com><4B4AD5DB834948B0A7AC3D8B722645A6@aeglos>
	<ghjkl4$gc1$1@ger.gmane.org>
Date: Mon, 8 Dec 2008 18:26:42 +0100
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2900.5512
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.5579
X-OriginalArrivalTime: 08 Dec 2008 17:28:16.0351 (UTC)
	FILETIME=[5AE2C6F0:01C9595A]
Subject: Re: Request for a personal git tree for AT91/AVR32
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
X-List-Received-Date: Mon, 08 Dec 2008 17:32:12 -0000
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=response
Content-Transfer-Encoding: 7bit



> On 08-12-08 17:26, Ulf Samuelsson wrote:
>>> On Mon, Dec 8, 2008 at 4:44 PM, Ulf Samuelsson
>>> <ulf.samuelsson@atmel.com> wrote:
>>>> I ran into a problem that linux would not build because if you
>>>> use linux and request UIMAGE, then you fail because
>>>> u-boot-mkimage is not available.
>>> Well, u-boot native tools are built perfectly now, and uImages
>>> work. Try to build for afeb9260 machine, and see for yourself.
>>> I tried that yesterday, it works perfectly.
>>>
>>
>> If you can't download the source you can't build the tools.
> 
> Sourcemirrors and tarballstashes in OE provide tarballs, not 1:1 mirrors 
> of the scms. Had you actually read the error message you would have 
> noticed that it did something like:
> 

I don't have it in front of me, but IIRC the recipy for u-boot.git 
tries to do *git* access to the *source mirror*.
It was not trying to download a tarball.
That must simply be wrong.

> 1) try source mirror for tarball -> FAIL
> 2) try upstream repo -> FAIL
> 3) error out
> 
> if 1) fails it means the autobuilder hasn't build and mirror that rev 
> yet. 2) means an error on your end, be it corporate firewall or the 
> infamous --tags bug in bitbake 1.8.10.
> 
> Note that the angstrom sourcemirror has been real good at hiding the 
> bitbake 1.8.10 bug.
> 
> regards,
> 
> Koen
> 


Best Regards
Ulf Samuelsson




