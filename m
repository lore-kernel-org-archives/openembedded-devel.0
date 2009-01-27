Received: from [195.65.72.27] (helo=bagnes.atmel.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1LRsHT-0000kR-8a
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jan 2009 19:03:23 +0100
Received: from fribh01.corp.atmel.com (FRIBH01 [10.175.30.10])
	by bagnes.atmel.com (8.13.8+Sun/8.13.8) with ESMTP id n0RHosKX012943
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jan 2009 09:50:54 -0800 (PST)
Received: from frimb01.corp.atmel.com ([10.175.30.12]) by
	fribh01.corp.atmel.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 27 Jan 2009 18:55:48 +0100
Received: from aeglos ([172.24.48.104]) by frimb01.corp.atmel.com with
	Microsoft SMTPSVC(6.0.3790.3959); Tue, 27 Jan 2009 18:55:47 +0100
Message-ID: <EFA2297CD3F446D3AD6F7CD164A47CEF@aeglos>
From: "Ulf Samuelsson" <ulf.samuelsson@atmel.com>
To: <openembedded-devel@lists.openembedded.org>
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF5FB@hiob.intern.dresearch.de><497ECDCA.3000302@gmail.com>
	<1233047621.4890.119.camel@lenovo.internal.reciva.com>
Date: Tue, 27 Jan 2009 18:27:34 +0100
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2900.5512
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.5579
X-OriginalArrivalTime: 27 Jan 2009 17:55:47.0623 (UTC)
	FILETIME=[7BC66370:01C980A8]
X-MIME-Autoconverted: from 8bit to quoted-printable by bagnes.atmel.com id
	n0RHosKX012943
Subject: Re: AVR XMEGA?
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
X-List-Received-Date: Tue, 27 Jan 2009 18:03:23 -0000
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: quoted-printable

> On Tue, 2009-01-27 at 10:03 +0100, Marco Cavallini wrote:
>> Sledz, Steffen ha scritto:
>> > Just a short question: Is somebody working on support for Atmel AVR=20
>> > XMEGA (8-bit AVR) architecture in OE?
>> >
>>
>> http://wiki.openembedded.net/index.php/Main_Page
>> Openembedded, your best-in class cross-compile environment. Openembedd=
ed
>> allows developers to create a complete Linux Distribution for embedded
>> systems
>>
>> Linux doesn't run on 8 bit CPUs
>
> There's nothing about OpenEmbedded itself that is inherently specific t=
o
> Linux; it just so happens that all the currently supported targets are
> Linux-based.  There's certainly no reason that one couldn't build an OE
> target system around, say, the Hurd or the BSD kernel.
>

> Likewise, it would be perfectly feasible to use OE to generate binaries
> for a 8-bit device, although the nature of those small deeply-embedded
> systems tends to be that they use single monolithic application binarie=
s
> rather than a filesystem or "distribution" in the sense that larger,
> general-purpose machines do.  That being the case I suspect some of the
> advantages of OE would probably be negated in such an environment.
>
> As far as I know nobody is working on XMEGA support, anyway.

The AVR could in theory run linux since it supports
an 8 MB linear address space.

In practice there are no standard chips which bond out the program bus
so you are limited to 256 kB of flash, that's it.

The AVR also has a Harvard Architecture which is not hidden,
so you would have a problem compiling most applications.

The AVR32 is much better suited to the job.

Best Regards
Ulf Samuelsson                ulf@atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv=E4gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57




