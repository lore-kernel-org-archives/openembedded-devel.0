Received: from [209.85.198.247] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1L9RQR-0000y9-JU
	for openembedded-devel@openembedded.org; Sun, 07 Dec 2008 22:44:27 +0100
Received: by rv-out-0708.google.com with SMTP id k29so1013612rvb.0
	for <openembedded-devel@openembedded.org>;
	Sun, 07 Dec 2008 13:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:cc:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=n/LnfurezWjRGUxhig5m0+ZoBtF9fZ/A3SvK6KfAjHs=;
	b=LxVsTr0J7NZFoBDyHGM1tUGYm/M6iETjIrYFywOQNJN8tbsTUGKtUqPyJ0kLQ7YR9o
	zzO63iTJ7Sk8QNEZIoAzNptRwc4BdAX6I/bQmVdrPdAHkj+GZzfBrVUFSddJRBBLgNAo
	voOMRxtp2fSWz5UtsW24U6Lcd8ushnHil/LAk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=aCzeJoXn4voX/fuTTnALs7NxSC1tAvCdLi/9AJNXSd09SnidtYsFBv5b+BZuJjh9VJ
	lU8YOf/6wcWa2VEyNIrMiRZu7LgBfSNMyOoOYVrzmKZt5AN8SX1ziCzYveeEeCEW1D9N
	gtcr2kl1r/bOoCD5GL6lZceIn9artX+jjruDw=
Received: by 10.141.18.12 with SMTP id v12mr1286631rvi.187.1228686038068;
	Sun, 07 Dec 2008 13:40:38 -0800 (PST)
Received: by 10.141.171.13 with HTTP; Sun, 7 Dec 2008 13:40:37 -0800 (PST)
Message-ID: <19c1b8a90812071340o57e4542cv8452e324445c64e@mail.gmail.com>
Date: Sun, 7 Dec 2008 13:40:37 -0800
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ghhe2j$b5p$1@ger.gmane.org>
MIME-Version: 1.0
References: <1223383906-4111-1-git-send-email-eha@doredevelopment.dk>
	<d2b9ea600810211323y1dd1fc11i585f26f044696de9@mail.gmail.com>
	<20081202174141.GB16628@smtp.west.cox.net>
	<1228250322.5456.70.camel@dax.rpnet.com>
	<20081202212155.GG16628@smtp.west.cox.net>
	<20081206214525.GJ16628@smtp.west.cox.net>
	<20081207193340.GC15204@smtp.west.cox.net>
	<ghha1f$ugd$1@ger.gmane.org>
	<20081207201118.GD15204@smtp.west.cox.net>
	<ghhe2j$b5p$1@ger.gmane.org>
Cc: openembedded-devel@openembedded.org
Subject: Re: Canadian SDK support
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
X-List-Received-Date: Sun, 07 Dec 2008 21:44:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sun, Dec 7, 2008 at 1:09 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> On 07-12-08 21:11, Tom Rini wrote:
>>
>> On Sun, Dec 07, 2008 at 09:00:47PM +0100, Koen Kooi wrote:
>>>
>>> On 07-12-08 20:33, Tom Rini wrote:
>>>
>>>> As an aside, gcc-cross-sdk on arm(v6 only?) is blowing up in fortran,
>>>> but I've got a git bisect narrowing that down now (30 revs left).
>>>
>>> gcc-cross-sdk picks the wrong patch (from files/gfortran.patch) instead
>>> of the correct one from gcc-4.2.4/gfortran.patch. gcc-cross *does* pick
>>> the right patch.
>>
>> For gcc-4.2.4.inc would it be OK to rename gfortran.patch to
>> gfortran-4.2.4.patch and fix this problem?
>
> If 4.2.4 is the only using it (which I doubt), that would be the way to go.
> IIRC all gcc 4.2 variants (so also the dreaded csl 2007qX ones) need the one
> with '64', the 4.3.x ones (including csl 2008qX) need the one with '65'.

Why do we need these two. 65 one sounds worng to me from first look.

> Yes, that means the current situation is broken for csl 2007qX and 4.2.!4.
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


