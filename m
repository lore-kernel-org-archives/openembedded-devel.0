Received: from [209.85.217.215] (helo=mail-gx0-f215.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1N8HqI-0007r0-3L
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 19:22:57 +0100
Received: by gxk7 with SMTP id 7so1912634gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2009 10:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=6801ke18rHg7OXMRjVvx1iDqz82OCcGgTzZgf0Eh34I=;
	b=F3Fo8PPivw17qbG1MUUg4I6xionjnRBsvYnaRkm1VQWIS91agEefZ6TzLq+VAuPM6g
	nWB7ewqUVOpSQ94rKAYfoVehuFB2nJ2zIRhpFZc5UcSYY2ogr8eC6CcIq/FH1QyoS8YJ
	AVR6mQzkx0jLR2aD+MvZCWtJZwPmuYNe4hthM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=HSsaGbpmlTICFEfVaMUkLYSm6POPVrxHCffxfMFvoiD6lu2zUP3J8Ja5R9XynkV9UM
	sLvKio4Slqh1OZu4zbkb0sJ8+Vo6NJPiUClK7yaYOt+KNyVwXsO9sYnuB33X+9R3VgeA
	v9mWxNlHRLF2wwK2bQ6xPzVBRcPryOj5ZuyUY=
MIME-Version: 1.0
Received: by 10.239.140.66 with SMTP id w2mr168023hbw.208.1257961708932; Wed, 
	11 Nov 2009 09:48:28 -0800 (PST)
In-Reply-To: <1257931062.25369.292.camel@lenovo.internal.reciva.com>
References: <1257872140.1484.335.camel@mill.internal.reciva.com>
	<200911110206.20901.holger+oe@freyther.de>
	<1257927850.25369.283.camel@lenovo.internal.reciva.com>
	<200911110944.10399.holger+oe@freyther.de>
	<1257931062.25369.292.camel@lenovo.internal.reciva.com>
Date: Wed, 11 Nov 2009 18:48:28 +0100
Message-ID: <d2b9ea600911110948n47be4971le5145f3939fbee19@mail.gmail.com>
From: Esben Haabendal <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.215
X-SA-Exim-Mail-From: esbenhaabendal@gmail.com
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
X-List-Received-Date: Wed, 11 Nov 2009 18:22:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2009 at 10:17 AM, Phil Blundell <philb@gnu.org> wrote:
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

That seems to depend on how must weigth you put on clean vs. "messy"
solutions.

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

Which part of the current checksums.ini problems does the former not resolv=
e?

Isn't the main issue with checksums.ini is the merge nightmare it poses?
I don't see how this will be a big problem with per recipe checksums
files.

A per recipe checksums file is also the one solution I have seen
that would reduce manual work needed for OE developers to
actually maintain checksums.  And face it, we are for the most part lazy :-=
D

As I also made clear on OEDEM, I think it is important to make things
simpler and easier to work with.  Not cause more mess and come
up with additional hurdless for OE developers.

/Esben


