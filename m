Received: from [209.85.221.196] (helo=mail-qy0-f196.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MhRh7-0004qv-8a
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Aug 2009 19:26:29 +0200
Received: by qyk34 with SMTP id 34so1735178qyk.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Aug 2009 10:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=Nnymy9TcGJrB/E/8CYsfwi1iAMQTLF89GR7sH6vc9bg=;
	b=W5iYOo+pGduiWxinaLjo+Lzh7/vL1++huUCSr17ZM7vBpByDNVs62ZVgJlLmq98HTr
	FtagIg/M8pyezFJbSLkGHg7icQbAbJ/VzlEQIYb55wVUxMy4f79aHsgbBwQBe1QQhz87
	NReWlPn+FZyDnTUbkPpzvpSXGqwaJO8yC7dPM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=n7k1rObwxug4OWZTxrPAwWFXwvsfNmLe02BSwFOGvgIBiQKelJOZKau/a/qJiDO5ba
	eaYSSIHK1kpbCGbdqqdz7SONFyhIyx+I0r2FFfii1m1TnmX12Ep5RtHiiXv3pwMhmJl0
	YIN7N57ZH2B+t5VQCm5Faj/7uV6zfS8LF6zto=
MIME-Version: 1.0
Received: by 10.229.18.140 with SMTP id w12mr1096653qca.77.1251565689137; Sat, 
	29 Aug 2009 10:08:09 -0700 (PDT)
In-Reply-To: <h7be1m$kuh$1@ger.gmane.org>
References: <1251504044-2315-1-git-send-email-raj.khem@gmail.com>
	<1251533696.4215.623.camel@lenovo.internal.reciva.com>
	<19c1b8a90908290133l36f791b2lfe8db1a1c6f333b2@mail.gmail.com>
	<1251536004.27780.75.camel@mill.internal.reciva.com>
	<h7be1m$kuh$1@ger.gmane.org>
Date: Sat, 29 Aug 2009 10:08:09 -0700
Message-ID: <19c1b8a90908291008v2a8d8e8bte87d7be1a25a23d6@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] sane-toolchain-eglibc.inc: Set TARGET_OS = linux-gnuspe for e500
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
X-List-Received-Date: Sat, 29 Aug 2009 17:26:29 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Aug 29, 2009 at 7:30 AM, Koen Kooi<k.kooi@student.utwente.nl> wrote:
> On 29-08-09 10:53, Phil Blundell wrote:
>>
>> The current
>> EABI logic that resides in sane-toolchain-xxx.inc seems like it is
>> really a misplaced piece of Angstrom policy.
>
> Angstrom does not use the sane-toolchain stuff. The sane-toolchain thing is
> a misguided unilateral attempt to 'unify' OE distros. As you point out, it
> forces way too much policy onto it's users.

in general its hard to put a toolchain together rightly. So in a way
it will help the users I think.
distros are free to use these. They may decide not to use it. Its
fine. I think distros should
be able to build upon sanetoolchains it will be simpler for them
instead of pulling bits together
themselves.



>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


