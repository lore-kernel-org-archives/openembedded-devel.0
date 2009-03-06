Received: from [209.85.218.165] (helo=mail-bw0-f165.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1LfWdk-00032o-Tg
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Mar 2009 10:46:54 +0100
Received: by bwz9 with SMTP id 9so272454bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Mar 2009 01:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=o0P97fcaXRHVmzTdTZPYTqm6df4gmYSrWwp8epmAafo=;
	b=HDE5/OTbucE/RJXBdJJxSE1tQJWylYHIgpaj6jr/EYKD0hHEhc746jbx2s2ejmtOYV
	F/TEB0Q/82JDRxqmtBexGiLSeyxvWznli1xbcXQ79dL/vWnhhg75YU43Lhkuojh7Mew1
	f3HMBayZPFI+wkcWp2M4W9Iw7pIiw2n5GuitY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=hXtVcwAm/t9SSs/au/ELxNVL4HiTydQojXzpHg/0ilJ1D8LFVJBMLu8GvNC9tkPbV1
	XNBfoOTcQ0PnClKZK/v67LHwgsX40eQE5lDMTO1PKNfREqfOlzd8jWT3Bmh5xDxTz+o4
	lOwVOd8lqNYDC7h2h1/vVBqqgTfQNKWzz18eA=
MIME-Version: 1.0
Received: by 10.223.105.195 with SMTP id u3mr1845663fao.13.1236332538524; Fri, 
	06 Mar 2009 01:42:18 -0800 (PST)
In-Reply-To: <1236330230.4607.54.camel@lenovo.internal.reciva.com>
References: <ac9c93b10903050921y59233df1o731fb4983e22e12f@mail.gmail.com>
	<gop5fu$ec$1@ger.gmane.org>
	<ac9c93b10903051310g48c05d5eiaa6371f67383f7f1@mail.gmail.com>
	<1236330230.4607.54.camel@lenovo.internal.reciva.com>
Date: Fri, 6 Mar 2009 10:42:18 +0100
Message-ID: <ac9c93b10903060142k13d1908btcd39319477b37530@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: need help: cdrkit & bitifields
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
X-List-Received-Date: Fri, 06 Mar 2009 09:47:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2009/3/6 Phil Blundell <pb@reciva.com>:
> On Thu, 2009-03-05 at 22:10 +0100, Frans Meulenbroeks wrote:
>> main(int argc, char **argv)
>> {
>> =A0 =A0 char c =3D 0xf0;
>> =A0 =A0 bitfields *bf =3D &c;
>
> This isn't a legal thing to do. =A0Struct addresses on ARM need to be
> 32-bit aligned, whereas &c is only guaranteed aligned to an 8-bit
> boundary. =A0You can't, in general, take a pointer to an arbitrary type,
> cast it to a struct and expect to get good results.
>
> You need to use a union, or something like:
>
> struct wrapped_char {
> =A0 =A0 =A0 =A0char c;
> }
>
> struct wrapped_char wc;
> wc.c =3D 0xf0;
> bitfields &bf =3D &wc;
>
> p.
>

Hi Phil,

I understand the alignment issue.
However the problem occurs in code that I have not written and that is
not easy to modify.
I don't have the code handy but it could be that the code in cdrkit
works just the other way:
E.g. something like:
bitfields bf;
char *p =3D &bf;
*p =3D 0xf0;

I'll test that variant as well.
The stupid thing is that cdrkit words under opensuse/x68 but not under
oe/arm (LE).
So either this is a compiler issue or a nonportable construct.

Puzzled.
FM


