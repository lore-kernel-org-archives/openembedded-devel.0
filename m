Received: from [74.125.92.144] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Mj4xv-0002LA-PO
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Sep 2009 07:34:35 +0200
Received: by qw-out-1920.google.com with SMTP id 4so473574qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Sep 2009 22:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=mrFqpKlwv+HNzQpiSfcuSZKmwXcdbz6vpsg72A2SkVo=;
	b=wsWastUKvixZs47R9srcRR6b7Ufigwo/ntPGqhXdfk9T5rur0Q8p42i4oyZ6Jtnzex
	+Dh2g0fs7J0yD6z979TvjF0A4Fz/NCa6hZhSfys4MESeb2YN5C+4H+cpymZ02B4ju11S
	jnOJ+iVUW8MHP87A8NlCIB/PahwkkvGIsvOLY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=kgJxXdIw5iDHMdHrVzFqQ/zmUoXNTDDxg7C4fxNfEikIaLCTEHAYb9BLPCNQ+x/TNn
	ZqJ/Y66A/dpmuFMmuZKnlsIzZmfK94p5MO6xeT+8dOHFGAB6vCBnvgHHk/tf+5MYhhx0
	qGNd6XOAT7ZcQgUBmVKULlXs5ZdMaSdrOJF8A=
MIME-Version: 1.0
Received: by 10.229.53.76 with SMTP id l12mr2591355qcg.105.1251954947635; Wed, 
	02 Sep 2009 22:15:47 -0700 (PDT)
In-Reply-To: <20090903043630.GQ23034@smtp.west.cox.net>
References: <1251620948.4215.673.camel@lenovo.internal.reciva.com>
	<200908311333.20189.marcin@juszkiewicz.com.pl>
	<20090901055731.GA22534@gmail.com>
	<57768.87.139.24.177.1251793302.squirrel@home.opfer.tk>
	<20090901153102.GA12420@gmail.com> <20090901230722.GA25864@gmail.com>
	<20090902192044.GA18621@gmail.com>
	<1251923389.4490.20.camel@lenovo.internal.reciva.com>
	<19c1b8a90909021407k5610f615q41c7d13bc3b38ff0@mail.gmail.com>
	<20090903043630.GQ23034@smtp.west.cox.net>
Date: Wed, 2 Sep 2009 22:15:47 -0700
Message-ID: <19c1b8a90909022215i19d3c06bq536e87e13dfc984c@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] sane-toolchain-eglibc.inc: Set TARGET_OS?= linux-gnuspe for e500
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
X-List-Received-Date: Thu, 03 Sep 2009 05:34:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2009 at 9:36 PM, Tom Rini<trini@embeddedalley.com> wrote:
> On Wed, Sep 02, 2009 at 02:07:54PM -0700, Khem Raj wrote:
>> On Wed, Sep 2, 2009 at 1:29 PM, Phil Blundell<philb@gnu.org> wrote:
>> > On Wed, 2009-09-02 at 12:20 -0700, Khem Raj wrote:
>> >> This also changes the target triplet for linux-uclibgnueabi to
>> >> uclibc-uclibcebi. So I have also bumped up the OELAYOUT_ABI
>> >
>> > Ah, that doesn't sound so good. =C2=A0Changing OELAYOUT_ABI will be a
>> > nuisance for everyone, even if they aren't using either uclibc or the
>> > TARGET_OS auto-generator. =C2=A0Is there a way to avoid that?
>>
>> It changes from linux to linux-gnu for non uclibc systems too which I
>> forgot to mention
>
> Can we get away with that? =C2=A0'linux-gnu' over 'linux' should be fine =
I
> think but I'm worried about 'linux-uclibceabi', is that really a normal
> standard and known host? =C2=A0Also, there's some overrides that depend o=
n
> 'uclibcgnueabi' iirc, which need to be updated for libc-uclibc override
> instead.

linux-uclibcgnueabi is also madeup one. I think logically many tests
just check for uclibc* or
*eabi. There is no difference between both of them. I plan to fix any
fallout that come out of renaming
mostly it will be in toolchain parts only.

I have fixed all the overrides and also build and booted uclibc
arm/thumb images.


>
> --
> Tom Rini
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


