Received: from [74.125.44.154] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1M4IsT-0008Bx-La
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 20:08:26 +0200
Received: by yx-out-1718.google.com with SMTP id 36so439770yxh.42
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2009 11:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=CjPkD5FAFKs9Op1GqbgGk85qKWI+t4Jf0ffntqoZsxM=;
	b=w2MhC/Cl6i14OJ8IZbwYGO4yG3kPgtTevy/EpgjQPISa0/uCCqszuWneizxETcquHl
	/aToU6xvBdZvhs9NsUgPpNT64slpvfE8NDPUBJaDefW0T5/zZLtrxFacQDFXayRD5XOP
	bc4H/rFY1PSnX5l5fsx0+OWWgmXy/EWoGB+Hg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=wnh/aX1OpIeIsaRlpM/7VttuOUHiaN7hVqLlEpFfcYzxbz6yoSfUxZAaAYaScwhzpM
	S62Hn6tQBiDuOImYNBnhaULdKA3csc9bU/Il6GjdSSACnW6fXlvxdxPL3OxTG2Eiq40+
	7t66kRl5rDg2D2R978GUYT6pEDc/ksXQ8qDmg=
MIME-Version: 1.0
Received: by 10.90.34.11 with SMTP id h11mr987875agh.57.1242237700209; Wed, 13 
	May 2009 11:01:40 -0700 (PDT)
In-Reply-To: <gueuv0$mjh$1@ger.gmane.org>
References: <1242226019-10881-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1242226019-10881-7-git-send-email-marcin@juszkiewicz.com.pl>
	<guen3q$p5u$1@ger.gmane.org> <20090513151848.GI7973@smtp.west.cox.net>
	<gueuv0$mjh$1@ger.gmane.org>
Date: Wed, 13 May 2009 20:01:40 +0200
Message-ID: <c384c5ea0905131101k6ec8b858lbd335e51c255b5b9@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 6/6] angstrom: use GCC 4.3.3 for Geode devices
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
X-List-Received-Date: Wed, 13 May 2009 18:08:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, May 13, 2009 at 7:10 PM, Koen Kooi <k.kooi@student.utwente.nl> wrot=
e:
> On 13-05-09 17:18, Tom Rini wrote:
>> On Wed, May 13, 2009 at 04:56:58PM +0200, Koen Kooi wrote:
>>> On 13-05-09 16:46, Marcin Juszkiewicz wrote:
>>>> From: Marcin Juszkiewicz<hrw@openembedded.org>
>>>> Signed-off-by: Marcin Juszkiewicz<hrw@openembedded.org>
>>
>> wrt that patch, is there a reason you aren't bumping ppc as well? =A0As =
an
>> old PPC guy, that's always had me perplexed..
>

Being old and having PPC boards on my desktop spaces as well I
recently got the same level of perplexity, but there's only myself to
blame.

I did recently look elsewhere:
http://www.oselas.com/oselas/toolchain/index_en.html

That OSELAS toolchain shows the following in its support grid:

gcc-4.3.2
glibc-2.8
linux-2.6.27

I extracted and built that toolchain. I saw no patches needed for ppc.

It doesn't mention binutils version - I can check my build.

> When adding PPC support I had loads of troubles compiling gcc and glibc d=
ue
> to sqrt and type size problems.
>
Ah, I remember.

> My efika is too busy serving stuff to serve as a testbed and my dht-walnu=
t
> lacks a psu currently, so I'm a bit apprehensive about bumping toolchains
> without runtime testing them.
> If console-image actually builds with gcc 4.3.3 + binutils 2.18, that wou=
ld
> be a *huge* step forward.
>
Agreed. The old PPC guys should check this first. :-) It's on my todo
(which gives zero information on if it ever gets of).

I only have e300 targets to test.

I (also) blew my EFIKA.


Regards,
--=20
Leon


