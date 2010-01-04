Received: from mail-yx0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NRtLy-0008Gb-0B
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jan 2010 21:16:41 +0100
Received: by yxe1 with SMTP id 1so14353375yxe.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2010 12:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=fCSlO+SD0cHhKyPEZZRzxKBM6AGWwFmPc4AsVF1k9xE=;
	b=RBMpD139lhSyq1sDHu03svfVxTxZCbKuz5F3ig1bAL1wJe40YfwMOKI5uuWiYFWr6A
	N8yOkyVBUat4ycZ769Og4fs15Z+3wqPaFijyGcpjRQJ3dZap7IQB/NKYW1qwypenRZcW
	51+797T7nsF5ZCCH2MBAKZ8TTB2ATf7tERyMU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=HBuufZQuywQFMB6Axlxp1rjv5UHQPQN1fptHrXahaWzts8jp9XexcSHSI0xQShAGI4
	+BXnBt5VW/CVyi3apc6QjjmsKA2bxE6ucavKqU2F+wBGS7+xcrKjDL/Eg4nOB+/JgVxy
	LbHNRE9wV1RZA5Sv2ZO5TWyw1mNrkQfy7UNW8=
MIME-Version: 1.0
Received: by 10.101.18.3 with SMTP id v3mr25883859ani.141.1262636074636; Mon, 
	04 Jan 2010 12:14:34 -0800 (PST)
In-Reply-To: <1262620565.8748.246.camel@dax.rpnet.com>
References: <ac9c93b11001030833v6236cb2ew11627fb47a6d7fa8@mail.gmail.com>
	<1262552980.2553.104.camel@lenovo.internal.reciva.com>
	<ac9c93b11001032331g641d1015hb7191696fdf5bb65@mail.gmail.com>
	<1262620565.8748.246.camel@dax.rpnet.com>
Date: Mon, 4 Jan 2010 21:14:34 +0100
Message-ID: <ac9c93b11001041214w71476fedrcfa5a9cfb7137ebc@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.171
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: qmake issue
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
X-List-Received-Date: Mon, 04 Jan 2010 20:16:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/1/4 Richard Purdie <rpurdie@rpsys.net>:
> On Mon, 2010-01-04 at 08:31 +0100, Frans Meulenbroeks wrote:
>> Yeah figured out after a brief discussion on #oe that they probably
>> didn't need to be staged.
>>
>> Actually the recipe does not contain any staging, so this is a side
>> effect of the new automated staging.
>> It could well be that other, =A0non qmake recipes also suffer from this.
>>
>> The fix for mythtv is probably to have an empty do_stage()
>>
>> However as a general rule the -L and -I flags to staging should be
>> last, not first.
>> And, ideally, when building a recipe the old contents from that
>> package in staging should be removed first.
>> By removing that we avoid the problem that if rX adds a file A to
>> staging and rY does not do so any more, the file A still remains in
>> staging (although perhaps incompatible with what rY made.
>
> If packaged staging is enabled this should happen already...
>
> Cheers,
>
> Richard
>
Ehm, I use angstrom unstable head on the beagleboard.I've been told on
#oe that angstrom used pacakged staging.
I've removed my tmp dir and rebuild from scratch on dec 30, 2009,
including mythtv.
Yesterday I rebuild the latest version of mythtv, and it linked
against the myth lib in staging (produced by the same recipe).
As the lib was changed between those versions it gave a linking error.
After removing the lib from staging manually and rebuilding mythtv
builds properly.
To me this seems there is still a problem.

Frans.


