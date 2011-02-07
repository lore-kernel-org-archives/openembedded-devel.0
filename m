Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PmXaR-0000ZP-Na
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Feb 2011 21:21:27 +0100
Received: by gwaa12 with SMTP id a12so1908640gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Feb 2011 12:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=wL7vvBEon31q/8r6Z3CoHZWyR/Zpc4D8IVFJEK2AdLM=;
	b=tLU5b+6hdxSL6dwUEyItPuLjfrO7I8ieixugiVX4vwuEYH3X0/8/JLOh1BZz7bBCJD
	hYHTOsj+FQmmWVq5DbIOmNVD8vX6GVqItSox0QTdtao7iM5sKT9AGl8GqSlQsbrcL3AJ
	fX3nU/CVpDqfbnqz/r3hec4jWQPIWKjhrWgBE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=poaEAfa8vYYOsvrCL8ZEDkCGlHUoezkVVLOoNT0n9sXCLBBRyUtrmHe+M5KyM2Ne9M
	6Fbf+ilUIGimHb1JzlX4lsaQDdHSgQIFMUUzAhUp+Vl5jdWWOteFfWqiXmD2+rBlCYBW
	2BjzjK6obBfEOGJ8gvBEPgZBtDRvYtnycknjw=
Received: by 10.91.160.30 with SMTP id m30mr19880026ago.61.1297110021711; Mon,
	07 Feb 2011 12:20:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.32.12 with HTTP; Mon, 7 Feb 2011 12:19:59 -0800 (PST)
In-Reply-To: <4D504A7E.4030809@windriver.com>
References: <1297093986-24331-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<AANLkTinsSoak9h=B+TQEzoUvWSP+MVELZQkTFRu3PTOQ@mail.gmail.com>
	<4D504A7E.4030809@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Feb 2011 12:19:59 -0800
Message-ID: <AANLkTikT+xiXg5W39LzE4dHyLjGnO1oQF3=x_k0mXAjN@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] cortex-m3: adjusted target cflags
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
X-List-Received-Date: Mon, 07 Feb 2011 20:21:28 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 7, 2011 at 11:39 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 2/7/11 1:33 PM, Khem Raj wrote:
>> On Mon, Feb 7, 2011 at 7:53 AM, Enrico Scholz
>> <enrico.scholz@sigma-chemnitz.de> wrote:
>>> Explicit '-mthumb' is required because Cortex-M3 does not support ARM
>>> instructions and actual flags cause gcc to fail with 'error: target CPU
>>> does not support ARM mode'.
>>>
>>> The '-mcpu=cortex-m3' is shorter than '-march=armv7-m -mtune=cortex-m3'
>>> and enables workarounds like '-mfix-cortex-m3-ldrd'.
>>
>> Does -mcpu=cortex-m3 also cause gcc to tune for cortex-m3 ?
>
> -mcpu=cortex-m3 is equivalent to -march=cortex-m3 -mtune=cortex-m3

is -march=cortex-m3 valid even ? my question was if we select armv7-m
using -march
then gcc knows stuff like oh this arch has a hardware div instruction
but now if we
use -mcpu will it still do it.


