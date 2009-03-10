Received: from [74.125.44.156] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Lh6Zn-0006vs-IR
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Mar 2009 19:21:17 +0100
Received: by yx-out-1718.google.com with SMTP id 36so1121083yxh.42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Mar 2009 11:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=OFI9rXI5bgOk0u8gZqZJG7Z2VsG6gSzjw5T/G18lsas=;
	b=fS1leUVqqZnCGavVfulOqm/lgPJz33nhLHG8Iv2LqDc3R7gZu55WIo8akxWLqmdXsf
	3pJsUWA8I6Az0t2ED8U75H5O7usGCo23XgerUD7iqBRFYp0Srv2/aWRWpXIEzUY5UiS0
	Rci8de0v2HHvVV9jNAH8mrUb67fTaop+Ma3vE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=PlaPzQo5IQFta1ShxDbfZ8WEZHuH02T5k2roAKzTsx7RYMfThwVn2MgHq4CkidndT2
	lQD5qUpu+fafvjz4JH/5hSmoc+IGZYj9gcmx0wK2tJp6ek1E6QF84Jb7USJmm7j5kbcw
	Y7RM2FASClP8w4XyB3WEqnv3p/Xi2eIsnmaV4=
MIME-Version: 1.0
Received: by 10.143.3.4 with SMTP id f4mr3187072wfi.299.1236709273454; Tue, 10 
	Mar 2009 11:21:13 -0700 (PDT)
In-Reply-To: <1236695740.5349.53.camel@dax.rpnet.com>
References: <180e2c240903082331u613a091cx9e0be6649177cb2c@mail.gmail.com>
	<1236602555.8807.6.camel@port4>
	<180e2c240903091803w6fd8a472sf67997340cb54422@mail.gmail.com>
	<1236695740.5349.53.camel@dax.rpnet.com>
Date: Tue, 10 Mar 2009 11:21:13 -0700
Message-ID: <19c1b8a90903101121q3448bb5bpdaa2e873af3ac2b2@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: QA Issue: sanity test failed issue
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
X-List-Received-Date: Tue, 10 Mar 2009 18:21:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Tue, Mar 10, 2009 at 7:35 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Tue, 2009-03-10 at 09:03 +0800, yajin zhou wrote:
>> Thanks very much.
>> I check the do_stage log of ncurses and find the problem is caused by the
>> '/' in TMPDIR. It will confuse the sed. So one tip of using OE: do NOT add
>> '/' to your TMPDIR.

I posted a patch touching this area. Can you retry with this patch and
see if that helps.

>
> A check for that should be added to sanity.bbclass...
>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


