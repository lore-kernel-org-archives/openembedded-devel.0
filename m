Received: from mail-iw0-f194.google.com ([209.85.223.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NFBHG-0002Ur-1o
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Nov 2009 19:47:17 +0100
Received: by iwn32 with SMTP id 32so2254597iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Nov 2009 10:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=iR7SJqUmKnSNfgMhQUoStxsNTghWLRwwyw1PbK2DskU=;
	b=jpkqSOjvkDF6ndjVIghv2Fz/aXXw2dzDpslFB37NynHk/hKrToTTj7UBr6b5H8eAjh
	N/khc1OLg34IDiTqigHAnjhLzaSnw+M/U3LHYCmrPqu84n8MANkdL7GKaIxfD1Xgsngq
	rZFygIKiCG8NZYTCprlDKetI3lsr5/jy1x2Jk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=PVL2X+/GsuHulEe9qM1RkDAEfQ29rNkf7FYMkGQeA1+7DjQ0CESYf+VlcxeWgrQI/g
	2wcm584A8W7J0D93Jg9deL7Tlwm8DfTER+WIg7SAqRo8j7Ye3uuszPhFbcDIy8hL3ffe
	QDsrlqKeqje0nHkN3OmKSmem5FzgXHvITAWeI=
MIME-Version: 1.0
Received: by 10.231.160.130 with SMTP id n2mr1281287ibx.23.1259606739419; Mon, 
	30 Nov 2009 10:45:39 -0800 (PST)
In-Reply-To: <loom.20091130T021309-622@post.gmane.org>
References: <4A365C10.8020307@mta.it> <200906172309.40571.raj.khem@gmail.com>
	<4A3A5A84.6090602@mta.it> <200906261759.56663.raj.khem@gmail.com>
	<loom.20091130T021309-622@post.gmane.org>
Date: Mon, 30 Nov 2009 10:45:39 -0800
Message-ID: <19c1b8a90911301045i6934e415h9e2adb0f0f3ae82f@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.194
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: nof/libgcc_s.so installed instead of libgcc_s.so on powerpc
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
X-List-Received-Date: Mon, 30 Nov 2009 18:47:17 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Nov 29, 2009 at 5:15 PM, Jeremy Williams <jerm7861@yahoo.com> wrote:
> Khem Raj <raj.khem <at> gmail.com> writes:
>
>
>>
>> Thanks. It might be problem in install section of our recipes.
>> Can you post log.do_compile file
>>
>> Thx
>>
>> -Khem
>
> This is a bump. I am still seeing this issue. I'm assuming that the OP did not
> provide a do_compile log which is why this thread died. I am willing to provide
> the necessary information

thanks that will help to diagnose it further

but I have noticed that the problem does not exist in
> the image directory when the gcc-sdk package is created. Is this file perhaps
> included from some other package that gets installed to the rootfs?

could be that its from one of intermediate gcc stages.

>
> -jeremy
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


