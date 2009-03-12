Received: from [74.125.44.156] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Lhou5-0005rf-G5
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Mar 2009 18:41:09 +0100
Received: by yx-out-1718.google.com with SMTP id 36so703586yxh.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2009 10:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=j17AiW6UylE2NyalfstSy3sQxKpHq9YsOfZ0CbyNCd8=;
	b=U6H7UkiLEkdQJAq6+ixUgYbwyQUfhsdrwyLfcr30TQfkweNU9iw9ucKOf9kdWzS3iF
	f+KVOw1HB6QQF/HqMMIpyThjIJoPTul7HeKNQdkrEnyz9C6PBmZHNQhARwBjmrE9Dew6
	6FqlkccRTl0MAVqc2AerP2wNWkfNyLTMkzNu4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Ckfnkg82t89w0+dFt9CrKoNQYC/scqFecHWxnaTdt7B6LIWqv8W57SxIygworgZRiT
	dnyHjadZg6ioLErGquzaGY8vIrpEXvA+4n01HNVxEJ/aVuSOFqsqng4GgczM1ds+aGNW
	zu6pWV5ZdF47aVf/95FVbog/AajpKwb3cVJ1M=
MIME-Version: 1.0
Received: by 10.142.14.18 with SMTP id 18mr53734wfn.35.1236879654915; Thu, 12 
	Mar 2009 10:40:54 -0700 (PDT)
In-Reply-To: <EC5EE493B6046F45A2DDEC4A828DE52E03B6B838@EXCHSRVR.syntech.org>
References: <EC5EE493B6046F45A2DDEC4A828DE52E03B6B838@EXCHSRVR.syntech.org>
Date: Thu, 12 Mar 2009 10:40:54 -0700
Message-ID: <19c1b8a90903121040g61964eaau82f4a08c3770d681@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: minimo: task do_configure failed
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
X-List-Received-Date: Thu, 12 Mar 2009 17:41:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Thu, Mar 12, 2009 at 8:02 AM, Mark Butsch
<mbutsch@syntech-fuelmaster.com> wrote:
> Hello,
>
>
>
> I am starting to work with OE again and am having trouble building
> minimo. I had had this working a year ago, but now it fails in
> do_configure:
>
>
>
>
>
> ...
>
> checking whether the host c compiler (gcc
> -isystem/home/ad/mbutsch/4G/tmp/4g/sta
>
> ging/i686-linux/usr/include -fexpensive-optimizations
> -fomit-frame-pointer -fren
>
> ame-registers -O2 -march=i486
> -L/home/ad/mbutsch/4G/tmp/4g/staging/i686-linux/us
>
> r/lib
> -Wl,-rpath-link,/home/ad/mbutsch/4G/tmp/4g/staging/i686-linux/usr/lib
> -Wl,
>
> -O1 ) works... configure: error: installation or configuration problem:
> host com
>
> piler gcc cannot create executables.
>
> ...
>
>
>
> I can build other recipes so it must be a problem in how the compiler is
> being specified to the minimo recipe.
>
>
>
> Not sure where to go from here.
>

post your config.log stuff somewhere may be a link to your build on tinderbox

>
>
> Mark
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


