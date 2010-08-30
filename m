Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Oq843-0007GA-NW
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Aug 2010 19:22:41 +0200
Received: by pxi11 with SMTP id 11so2264951pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Aug 2010 10:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=/sAhlBCMs3a2tD1ghIU7iY54aCMVjHCwd8S9dhr9uhE=;
	b=SYWQmB1AxqtlfQLXPW7G7aXLtr11hQn1fpU9SzZByluJwWfQg46xjhw9XsrBCca1SK
	nwlkeEfRN7wcnlqvWLj8ru7S8P4tVDJXspWrbx719v1bBp0r4PRRH9+1UdBJ2KREsBu7
	jYu1kEX5S4/74UIyy/8i2w+SteqBH8rPSCn8U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=XMsUsIgFDiahZx3MWUramexdKxUc4Y+OuenGEC7vzHxpWA5RA16WM4h0EbnXj2G0/D
	uo29rpuow310L28m5whsL8/h+btxXdk6guWdPNyz6WmBwcqzBsv7fxjp69g5BXMjUuW+
	AP/28NMRIPmNTC9K9jJbKXGnqFsOY+1ayIihE=
Received: by 10.143.1.12 with SMTP id d12mr4824190wfi.327.1283188922497; Mon,
	30 Aug 2010 10:22:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.207.8 with HTTP; Mon, 30 Aug 2010 10:21:42 -0700 (PDT)
In-Reply-To: <AANLkTi=_WQfCcTZ4JmHOOTagBiN+4EtAi3J=5XpoRopt@mail.gmail.com>
References: <AANLkTinvhMiZhHC4GrR8Muf-7oPa-j3zBeDWCZrkTd-z@mail.gmail.com>
	<AANLkTimH2YnW3CnLFxa6NyNCeC0-jNqy0dhDXS_ddWX_@mail.gmail.com>
	<AANLkTinJ7rUj8jq=PYeVXk7yZiLB6AtxQm9JKDcXZswR@mail.gmail.com>
	<AANLkTikONxUinXtW0V6nxzt11MWE0Qt3HUxsZ9N+0_48@mail.gmail.com>
	<AANLkTi=_WQfCcTZ4JmHOOTagBiN+4EtAi3J=5XpoRopt@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Aug 2010 10:21:42 -0700
Message-ID: <AANLkTi=znNpSvhjp7n8j-2Ht-Dk3XnSyaXJYjOXb21ZR@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Simple srctree example seems not depend on toolchain
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
X-List-Received-Date: Mon, 30 Aug 2010 17:22:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Aug 30, 2010 at 9:09 AM, Cliff Brake <cliff.brake@gmail.com> wrote:
> On Sun, Aug 29, 2010 at 2:24 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Sun, Aug 29, 2010 at 7:30 AM, Leon Woestenberg
>> <leon.woestenberg@gmail.com> wrote:
>>> Hello,
>>>
>>> On Sun, Aug 29, 2010 at 12:27 AM, Leon Woestenberg
>>> <leon.woestenberg@gmail.com> wrote:
>>>> On Sat, Aug 28, 2010 at 10:46 PM, Leon Woestenberg
>>>> <leon.woestenberg@gmail.com> wrote:
>>>>> in an attempt to learn how to use srctree I am hitting either 1) an
>>>>> oversight on my behalf or 2) a bug in srctree.bbclass 3) something
>>>>> else
>>>>>
>>>> After further debugging I am more sure I'm seeing wrong behaviour from
>>>> srctree.bbclass.
>>>>
>>>
>>> This was a bogus report. I thought I was working against latest OE
>>> GIT, but in fact, it seems the GIT service is unreliable currently and
>>> I have probably hit an aborted pull.
>>> Download speed from GIT is ~20 kB/s.
>>>
>>> I'm interested in adding this helloworld2 as helloworld-srctree as an
>>> srctree example.
>>
>> Yes please go ahead that will be a good template to have.
>
> I have two other srctree examples -- I wonder if we should think of a
> consistent way to organize examples so its a little more obvious where
> to find them?

may we could have something like recipes/templates or a separate
overlay which has examples


>
> http://cgit.bec-systems.com/cgit.cgi/autotools-demo/
> http://cgit.bec-systems.com/cgit.cgi/qt-overo-palo-gpio/
>
> example-helloworld
> example-srctree-helloworld
> example-srctree-autotools
> example-srctree-qt-overo-palo-gpio
>
> Thanks,
> Cliff
>
> --
> =================
> http://bec-systems.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


