Received: from [209.85.220.167] (helo=mail-fx0-f167.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1LhrcJ-0002Cr-L7
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Mar 2009 21:34:59 +0100
Received: by fxm11 with SMTP id 11so2277698fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2009 13:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=sURMbVAgOQ0SGwoMA1dCIuxa48FEe5J0dh51J609FvE=;
	b=aSq88LKH7K37PE2pwIacvxR/WEJw199O1BCoYhAyHQyzPVdQLJb2L8A0aVHR5MBO5p
	YBnQZw5ruSjSCQUUsoEKxoIbbGvN3jkWae2X6rBLESPue7sPMv6g4ilgjCe96fDDLJY0
	Uo4CxwYviv7MbsUPdlP/K97V70HtjnEW3NdZk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=rcXixwsEIMuKn3YkxZZiv/ArdCpegcHqYFPDWY4yPIPlpN4v0GC7uqjmyu2BF+IKNc
	eBS9NBVp/vKEdCvRoRkT8ENhk28//ut+EZCJtX508pQAOW8ZiDQ4R5q1JuCdiQ7vUidv
	lL02MJnSEpWoJSUwE18c5KRH8qMcJ3bKWvZng=
MIME-Version: 1.0
Received: by 10.223.103.207 with SMTP id l15mr242834fao.2.1236890082985; Thu, 
	12 Mar 2009 13:34:42 -0700 (PDT)
In-Reply-To: <19c1b8a90903121037g5726bf99qadca1e5d95dcae7@mail.gmail.com>
References: <ac9c93b10903120252x292ff544gca18ac8684ce0f2f@mail.gmail.com>
	<19c1b8a90903121037g5726bf99qadca1e5d95dcae7@mail.gmail.com>
Date: Thu, 12 Mar 2009 21:34:42 +0100
Message-ID: <ac9c93b10903121334j3a6cfad8u8e4591ddecf80394@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: g++ lib problem
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
X-List-Received-Date: Thu, 12 Mar 2009 20:34:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

2009/3/12 Khem Raj <raj.khem@gmail.com>:
> On Thu, Mar 12, 2009 at 2:52 AM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> Hi,
>>
>> I was trying to port a program that used asinl etc. but apparently
>> asinl is not in our env.
>
> Did you link with -lm ?
>
It didn't get that far. the compiler already complains about asinl not found.
On opensuse this compiles ok. Apparently when generating the c++ lib
or header it is decided that the function is not there, although the
header file links asin to __builtin__asinl or something like that).

Frans.


