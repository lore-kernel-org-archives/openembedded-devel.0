Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QIcei-0007gQ-Vu
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 May 2011 10:14:29 +0200
Received: by ewy5 with SMTP id 5so1168307ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 May 2011 01:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=uus1oM5SbwhdzgWy4oDtxEH06W5v/Ggrofa4lZeP8nE=;
	b=ahlBOX1+x/fy2a5+lzxqAk0dsmpdI1zNtJlH4cij3LfJ/V5VJUKZAA95qnuJvG4a9Y
	XyMNt/FIxtngPnEsuBaN/4GLXuWFAfAn5t02d9Aqv71KvUcU9a4FOBTLQiLeHqJsH+98
	SYsAJoYK1ux6SnXbMPvHXY5Nh+KTAnCstdPmo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=hX8PLQft31nzIUPXYBUlT8jvCOUAECetbVCOXMKKdljr4QtulPeD3ahtY1rlMz4B1y
	TKcJ52a8RRkq+M051gJnYsT1MSbgFimBmlC52HQ6jdmNbcix46WY+hV7WzaBwUUSNQVj
	seujuA+nDGeeDo4d9CPjxV8whBWku6RvIWDZQ=
Received: by 10.14.8.210 with SMTP id 58mr2309522eer.112.1304755906170; Sat,
	07 May 2011 01:11:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.5 with HTTP; Sat, 7 May 2011 01:11:16 -0700 (PDT)
In-Reply-To: <iq2q26$1qg$1@dough.gmane.org>
References: <1304653677-2982-1-git-send-email-raj.khem@gmail.com>
	<1304666954.3162.3.camel@lenovo.internal.reciva.com>
	<BANLkTinMP8C0WQ5yEpckn7rM5yMap6QkZg@mail.gmail.com>
	<iq1p0t$q68$1@dough.gmane.org>
	<BANLkTikfVwAR=LEXbe9JXevu3oVze2i2Wg@mail.gmail.com>
	<iq2q26$1qg$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 7 May 2011 01:11:16 -0700
Message-ID: <BANLkTin6ejn=3nO4i2sz1uwCGXNB_WTNoQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] conf/layer.conf: Use .= for BBPATH and += for BBFILES
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
X-List-Received-Date: Sat, 07 May 2011 08:14:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, May 6, 2011 at 11:49 PM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 07-05-11 01:09, Khem Raj wrote:
>> On Fri, May 6, 2011 at 2:25 PM, Koen Kooi <koen@dominion.thruhere.net> w=
rote:
>> On 06-05-11 21:59, Khem Raj wrote:
>>>>> On Fri, May 6, 2011 at 12:29 AM, Phil Blundell <philb@gnu.org> wrote:
>>>>>> On Thu, 2011-05-05 at 20:47 -0700, raj.khem@gmail.com wrote:
>>>>>>> =C2=A0# We have a conf and classes directory, prepend to BBPATH to =
prefer our versions
>>>>>>> -BBPATH :=3D "${LAYERDIR}:${BBPATH}"
>>>>>>> +BBPATH .=3D ":${LAYERDIR}"
>>>>>>
>>>>>> This patch seems to cause the code to do the opposite of what the
>>>>>> comment says. =C2=A0If changing it to be an append rather than a pre=
pend is
>>>>>> deliberate, please adjust the comment to match. =C2=A0(It would also=
 be nice
>>>>>> to have some commentary in the commit message explaining why this is
>>>>>> being done, since it isn't obvious to me why append would be better.=
)
>>>>>>
>>>>> That comment should be fixed. Since previously I has prepend and then
>>>>> changed it to append but forgot
>>>>> to correct the comment.
>>>>> It needed to follow some order for consistency and I chose append. No=
w
>>>>> it depends on the order of
>>>>> layers specified in BBLAYERS from bblayer.conf. Which means 1st entry
>>>>> gets priority
>>>>> over second entry when bitbake searches BBPATH. Right now there are
>>>>> two criteria's
>>>>> BBFILES are selected per priority set by BBFILES_PRIORITY for the
>>>>> layer but BBPATHs dont have this
>>>>> capability they get searched as they appear in the list. =C2=A0Ideall=
y I
>>>>> would think it would be simpler to have just one order for BBFILES an=
d
>>>>> BBPATH
>>>>> so if BBPATHS followed the BBFILES priority too would make it easier
>>>>> to comprehend.
>>
>> For meta-oe we need 2 different things:
>>
>> 1) prepend to BBPATH to get our classes in first (e.g. kernel.bbclass,
>> gnome.bbclass)
>> 2) append to BBFILES to use our version of recipes (.bbs) and overrides
>> (.bbappends)
>>
>> It seems that using layer priorities won't work the way we need it.
>>
>>> we can change the order in BBLAYERS define in oebb.sh to achieve that
>>> so higest priority layer in terms of BBPATH appears first and so on
>
> That only fixes BBPATH, but not BBFILES :(

BBFILES order does not matter its the BBFILES_PRIORITY that matters
when it comes to bitbake preferring recipes in contention
but some classes like metadata_scm.bbclass expects oe-core's entries
to appear first in the BBFILES list we can make that in oe-core
such that it prepends using =3D+ or even manually.

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD4DBQFNxOuGMkyGM64RGpERArpFAJ9HNwWB8IfyttZh46IZCo37unkcwACXQnZi
> SCM+PoZfIwKgplELJyZD/A=3D=3D
> =3D2TIM
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


