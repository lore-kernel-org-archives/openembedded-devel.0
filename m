Received: from [209.85.218.165] (helo=mail-bw0-f165.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ld700-0005K2-0F
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Feb 2009 18:59:48 +0100
Received: by bwz9 with SMTP id 9so1187772bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2009 09:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Zg+FoN9V8WJ3/rhUKm+3Z+zm1JAUOuFZvrzumM89Fq0=;
	b=QXrY4uhipz4+7xsRa8af3fiCnXMwcy6znKzra0gW6aYsyCJW3gaWfkpD/XoVKZCAzN
	8HFny5RR3y+uGQGH1u37hmmCXsP4OQi9bvnsySxVbZtbNJEe73DLUDXTVjKZS4FG1gqS
	4O3enjWMaUz9F3tm3Dlnmrc0Nw0elrre73hh8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=tSwNF+dTWBkuhNeSIkR29uZN2Oig0WEewjY+h/NDLNDsUOcyNifSyVtBZfeqnD3RxQ
	VWxOVWDbwrCIUHdPHRRpvLixWxSI2sUC+gFCVBtIIvZoZfkBg0WlVcpG6dzVEzMhKNcW
	CjZwqBuldlth/7ymnafL/gFP4dAPgoqx7SlIc=
MIME-Version: 1.0
Received: by 10.223.107.135 with SMTP id b7mr3526127fap.30.1235757376334; Fri, 
	27 Feb 2009 09:56:16 -0800 (PST)
In-Reply-To: <20090227162633.GD5420@smtp.west.cox.net>
References: <ac9c93b10902260920s24a8c5we592cbb4d0d63221@mail.gmail.com>
	<c384c5ea0902270806n70ce6bbfg45d19b5ebaf64050@mail.gmail.com>
	<20090227162633.GD5420@smtp.west.cox.net>
Date: Fri, 27 Feb 2009 18:56:16 +0100
Message-ID: <ac9c93b10902270956k501e0316y7820f047b4755f0c@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: OE breakages, was: Re: fakeroot fails to build
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
X-List-Received-Date: Fri, 27 Feb 2009 17:59:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

2009/2/27 Tom Rini <trini@kernel.crashing.org>:
> On Fri, Feb 27, 2009 at 05:06:25PM +0100, Leon Woestenberg wrote:
>> Hello,
>>
>> On Thu, Feb 26, 2009 at 6:20 PM, Frans Meulenbroeks
>> <fransmeulenbroeks@gmail.com> wrote:
>> >> On 25-02-09 16:14, Mike (mwester) wrote:
>> >
>> > The problem I am facing is somewhat different.
>> > I've added packages which build and test fine in my environment but
>> > for some reason they do not build properly on tinderbox.
>> >
>> That often indicates a leak to the host and/or missing DEPENDS.
>>
>> The build machines that run test builds, should do so with the minimal
>> amount of host requirements.
>>
>> Easily testable using virtual machines with freshly installed Linux,
>> as most machines grow their installed package base during their
>> lifecycle.
>
> Also, chroots work for this.
>

True but that is not what we have at the moment. E.g the mpd problem I
mentioned earlier in this thread is probably caused by some docbook
residue.

(and I agree that it is easy to miss a DEPENDS because of accumulated
installed packages).

FM


