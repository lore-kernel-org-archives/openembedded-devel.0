Received: from [209.85.210.175] (helo=mail-yx0-f175.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1N89VC-0000Zh-Hc
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 10:28:37 +0100
Received: by yxe5 with SMTP id 5so805939yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2009 01:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=T+aS7Q7OS7HpkADGuw+Hfog95PRP7sFohWfuaqLRCw4=;
	b=QqVT7exn1a/7kQGIX/9L9frz2XRRzv9h0SJV1E+OCQUJGo2LEvRV5fd/gyUECq5ESN
	HLpt8cGHAyFQyxQIYdaagDsVdpllws23Cg+tyk/kAfIU2MM75y3BAWDhrVqsWjvk+0hh
	SBcHnUIguwgQi/uC9NGZzuIHxqjmNxkI6RhgI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=dsNSBw1oj9eNJgGKc/lo2FLhZ8l3XjoWKkMpiEZkxIgZpU5OWdWh13l+GXNbmC4Nfi
	DCkl3/IS/ED9lZmAVDR1Vhz6mgPP8aExEHvMVlW3Jdu7T43Nv+dduW/vPF7bj8Qj1VfE
	pyVH/eCmOnEgRmNskCwOpcZdWa4h5SmOx7OSA=
MIME-Version: 1.0
Received: by 10.101.129.1 with SMTP id g1mr1128078ann.124.1257931635996; Wed, 
	11 Nov 2009 01:27:15 -0800 (PST)
In-Reply-To: <1257931062.25369.292.camel@lenovo.internal.reciva.com>
References: <1257872140.1484.335.camel@mill.internal.reciva.com>
	<200911110206.20901.holger+oe@freyther.de>
	<1257927850.25369.283.camel@lenovo.internal.reciva.com>
	<200911110944.10399.holger+oe@freyther.de>
	<1257931062.25369.292.camel@lenovo.internal.reciva.com>
Date: Wed, 11 Nov 2009 10:27:15 +0100
Message-ID: <ac9c93b10911110127v372933eje44dfb314745e3eb@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: OEDEM 2009 summary: Death to checksums.ini?
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
X-List-Received-Date: Wed, 11 Nov 2009 09:28:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2009/11/11 Phil Blundell <philb@gnu.org>:
> On Wed, 2009-11-11 at 09:44 +0100, Holger Hans Peter Freyther wrote:
>> This will create an even bigger mess. Sometimes you need to download two
>> things, this means you will end up with A_MD5SUM, B_MD5SUM, A_SHASUM,
>> B_SHASUM. The main problem with the above is that in contrast to a well =
defined
>> checksums.ini file we will end up with n-variants of the above trick.
>
> The number of recipes where multiple items need to be downloaded and
> checksummed is small: this is a tiny minority of the total. =A0So,
> although I agree that this case will become more ugly, I don't think
> this is going to be a common enough problem that it will represent a
> very big deal.
>
>> I agree that conceptually the checksum belongs to the URI, but putting i=
t into
>> the URI is just creating a horrible mess. It has issues with .inc files,=
 adding
>> a shasum will make the URI not fit in any terminal...
>>
>> The best alternatives so far where:
>> =A0 =A0 =A0 - Place the checksums into the dir of the recipe
>> =A0 =A0 =A0 - Use a MD5SUM_${URL} =3D "", SHA256SUM_${URL} =3D "" syntax
>
> I would be happy with the latter of those suggestions. =A0I don't think
> the former really addresses the problems with the current checksums.ini.

I'd like things to work with minimal effort, so I would encourage a
solution where, if you create a new recipe, the resulting checksums
are automatically added (automating the dumb and error prone cut &
paste process).
In that view having the checksums in a separate file would help
(although it will require adding a file to the commit which can be
forgotten).

Frans.


