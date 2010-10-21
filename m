Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1P8kia-0007Lr-4x
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 04:17:29 +0200
Received: by ywl5 with SMTP id 5so2594315ywl.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 19:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=LH+u8SS5U1onPjjtaa6VL7r4luTDesjvqcZYKuJoOZU=;
	b=CzjMP9OnIb87tjVP15OVXHQMEwJBzJ4Kz4++xN77vi7lFmF1WJDTGB1NWoFeIEA8jK
	MrDRNiWUqEW+R1NrEo82gB9sA8xr6/gn3EASJw/PF9kq+CpJLj1jJw2zsWFxOM3340mm
	y+0kiDKuoaXxdkphsQiHR/VSrIXB1sSp40p5Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=pBElqA354X0Axu836lASwXmqi0dY5KJ5C1adjuzsYStLS2rL2f4Av4mBIKZiG5HtQD
	cJ6idaYeMQ2Ki3pVO8YMfnB7HOsivIa7aGkwCgxlZiruGLY4bkN7XQYgRPnPd0Dk/6Cb
	MXNJtPtivir5P5FKdWCF+uqYXqWei0mwoJTWg=
MIME-Version: 1.0
Received: by 10.42.211.13 with SMTP id gm13mr99655icb.249.1287627404162; Wed,
	20 Oct 2010 19:16:44 -0700 (PDT)
Received: by 10.231.60.6 with HTTP; Wed, 20 Oct 2010 19:16:44 -0700 (PDT)
In-Reply-To: <AANLkTin8+uFJ+ZGzxv0eCM1CF5eUL1z3h6nad2ki+jFP@mail.gmail.com>
References: <4CBF89CE.8040705@gmail.com>
	<AANLkTin8+uFJ+ZGzxv0eCM1CF5eUL1z3h6nad2ki+jFP@mail.gmail.com>
Date: Thu, 21 Oct 2010 12:46:44 +1030
Message-ID: <AANLkTinn93G4D5QkPhhaK=579mfWDGft3LCxGi-iphTC@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] site/mips{,64}-common: Add postgresql bits.
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
X-List-Received-Date: Thu, 21 Oct 2010 02:17:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 21 October 2010 12:13, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Oct 20, 2010 at 5:31 PM, Graham Gower <graham.gower@gmail.com> wr=
ote:
>>
>> Signed-off-by: Graham Gower <graham.gower@gmail.com>
>
> is it possible to move the =A0offending parts to say mips64-linux and
> mips64-linux-uclibc and friends instead of creating a new file with
> lot of common
> contents.

I think that would end up with more duplication.

E.g. if something new is added, the same stuff will be added to
mips-linux, mipsel-linux, mips-linux-uclibc, mipsel-linux-uclibc. And
then slightly changed vars for the 64 bit variants.


