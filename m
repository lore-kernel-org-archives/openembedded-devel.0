Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radoslav@kolev.info>) id 1QGrkj-00037N-Ub
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 May 2011 13:57:26 +0200
Received: by vws2 with SMTP id 2so4771181vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 May 2011 04:54:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.52.181.65 with SMTP id du1mr2066547vdc.100.1304337288483; Mon,
	02 May 2011 04:54:48 -0700 (PDT)
Received: by 10.52.166.231 with HTTP; Mon, 2 May 2011 04:54:48 -0700 (PDT)
In-Reply-To: <20110502110334.GB3275@jama.jama.net>
References: <BANLkTik1xhYidSX6QugYpYv5BmXCL78JUA@mail.gmail.com>
	<4DBE8CAA.3050500@eukrea.com> <20110502110334.GB3275@jama.jama.net>
Date: Mon, 2 May 2011 14:54:48 +0300
Message-ID: <BANLkTi=5t3dNAgOHjnYU8tRAkfxeqsKntw@mail.gmail.com>
From: Radoslav Kolev <radoslav@kolev.info>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: buildindex is always 0, using BB_GIT_CLONE_FOR_SRCREV = "1"
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
X-List-Received-Date: Mon, 02 May 2011 11:57:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, May 2, 2011 at 2:03 PM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> On Mon, May 02, 2011 at 12:51:22PM +0200, Eric B=E9nard wrote:
>> Hi Radoslav,
>>
>> On 02/05/2011 12:18, Radoslav Kolev wrote:
>> > In the recipe I have
>> >
>> > SRCREV =3D "${AUTOREV}"
>> > PV =3D "0.4+gitr-${SRCPV}"
>> >
>> replace SRCPV with SRVREV in PV and you will the the rev instead of O.
>
> and no upgradeable path at all when changing SRCREV or even using
> AUTOREV like in example.

I tried using SRCREV instead of SRCPV in PV as Eric suggested, just to
see what happens. And at least at first glance in my concrete case
there was no difference. The package generated had the counter
incremented same as with  SRCPV -
169+33203fbe6c3ab029fba3e31a12e36ef8b56bb61fl. Is there something I'm
missing that will actually cause this to not work.

I've read the "SRCPV migration" thread from around two years ago, and
what other relevant information I could find in the mailing list
archives. I can't claim to have really grasped all of it though. What
I got out of this reading was that SRCPV var was intended to be used
as part of PV and so I did to follow the best practice, but I'd be
curious to know what exactly is the difference in this case.

> And BTW there usually isn't '-' between gitr and ${SRCPV} see recipes in
> tree.

Thanks! This is just for an internal project, but I'll change it
anyway to be consistent with the accepted style.

Radoslav Kolev


