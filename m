Received: from [209.85.218.210] (helo=mail-bw0-f210.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1MjYSe-0004Sh-Pu
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Sep 2009 15:04:18 +0200
Received: by bwz6 with SMTP id 6so595535bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Sep 2009 05:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=GFk/9wbBCqwgrdU+6hsenGLk37K68e7cQrmt2ItNUZI=;
	b=rgqajlmGr7+z2gl9GVEkFUuoic39Ly5b849XeS4HqzChnYjfVESY9wQPPd26IK+q5v
	K5c2f+cvWjsBvI3GHnzNsBtcoaOz6dZeI0+HPddtfukUAc6/Kqri8oDHJSnOfPXSKH1+
	NtuQoYk2n43WeICMlNSMv98jQm2aKk2Qm73+I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=lxmHYHgaAwWhYroEVVF/4P+46cHao/xiJh6CBihftJEcn4bKnqiAYcFQwy6IgwaqF+
	+V26ScGHYgIyP+0hheeamkOYlTf4+VJxMTrFoDtsoPN542HEWPM4xu2j/pNd2IMKili5
	0C5Bwe9qU/DDek8rn3Hzp7uGAbD9yXe/IrCnc=
MIME-Version: 1.0
Received: by 10.239.143.214 with SMTP id l22mr1007866hba.167.1252068316718; 
	Fri, 04 Sep 2009 05:45:16 -0700 (PDT)
In-Reply-To: <1252061507.27780.507.camel@mill.internal.reciva.com>
References: <1251620948.4215.673.camel@lenovo.internal.reciva.com>
	<20090901153102.GA12420@gmail.com> <20090901230722.GA25864@gmail.com>
	<20090902192044.GA18621@gmail.com>
	<1251923389.4490.20.camel@lenovo.internal.reciva.com>
	<19c1b8a90909021407k5610f615q41c7d13bc3b38ff0@mail.gmail.com>
	<20090903043630.GQ23034@smtp.west.cox.net>
	<1251970342.27780.192.camel@mill.internal.reciva.com>
	<19c1b8a90909030811k7f6932e0r93c94fccc43e9b1c@mail.gmail.com>
	<1252061507.27780.507.camel@mill.internal.reciva.com>
Date: Fri, 4 Sep 2009 14:45:16 +0200
Message-ID: <c384c5ea0909040545l6c259438gd6f903a950165e14@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
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
X-List-Received-Date: Fri, 04 Sep 2009 13:04:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Sep 4, 2009 at 12:51 PM, Phil Blundell<philb@gnu.org> wrote:
> On Thu, 2009-09-03 at 08:11 -0700, Khem Raj wrote:
>> On Thu, Sep 3, 2009 at 2:32 AM, Phil Blundell<philb@gnu.org> wrote:
>> >
>> > I think Khem's patch does update most/all of the overrides in question=
,
>> > but if this requires an OELAYOUT_ABI change then it seems like a lot o=
f
>> > disruption to fix what is (if I understand correctly) only a cosmetic
>> > problem in the first place.
>>
>> The documentation around OELAYOUT_ABI says that it should be bumped
>> whenever there is a change in tmp layout structure and this change will =
do
>> rename few directories and binaries in the tmp folder thats why the
>> bump
>>
>
> Yes, I know what OELAYOUT_ABI is for. =A0The point I was making is that,
> if changing the TARGET_OS strings is disruptive enough to require an
> OELAYOUT_ABI bump (and hence, effectively, force everybody to delete
> their working trees and rebuild from scratch), that seems like a lot of
> hassle for very little actual gain.
>
IMHO, it's disruptive enough as per the documentation.

And building from scratch isn't necessarily bad; I've seen people not
been affected by bugs for weeks after an OE upstream regression,
simply because they were doing incremental builds and thus didn't
really test any lower level changes that crept into the framework.

Regards,
--=20
Leon


