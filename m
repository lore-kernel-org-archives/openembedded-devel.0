Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <daniel.mcdougall@liftoffsoftware.com>)
	id 1ScJL1-0001jv-Rt for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jun 2012 18:44:03 +0200
Received: by wibhm14 with SMTP id hm14so4639668wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jun 2012 09:33:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:date
	:message-id:subject:from:to:content-type:x-gm-message-state;
	bh=vC6PV0kdRD/5rsUlU8mqiqGxF4kZw1y86MwyPg1R1hQ=;
	b=QUOQxZqZkVZduH0ORjdRydpC2c6vWzUK3FsU7eCCpjWiLyrK24G4ZcVR//g67AvuPF
	1v/BzsVuRSa3u4UbosjSQXAPnQdbfer4I922wxK0PcR4IoCaBXRFWon/D5hBZhx1hKFM
	AxUv4svKu2reP/oIh6pt2WSEqCQqFx1TuYQulnLl5XVN0YsU8kRPke3jN877k9gvd05w
	W4HpPKN7WxlZeRQz67C9owop/gZwARqDUSTLxxWZaUS6rxkZpy8TWC9mk42+WQyHh7cM
	ZQR+O3Sfkaued+zUu/s1l6v7UkEeOV91mYyLQyskc4P252JzzP2x6KQYiz6dnia3WRsm
	6eZQ==
MIME-Version: 1.0
Received: by 10.216.226.32 with SMTP id a32mr16604663weq.190.1339000416021;
	Wed, 06 Jun 2012 09:33:36 -0700 (PDT)
Received: by 10.223.76.200 with HTTP; Wed, 6 Jun 2012 09:33:35 -0700 (PDT)
X-Originating-IP: [69.180.64.152]
In-Reply-To: <20120606153232.GE3140@jama.jama.net>
References: <1338996004-32583-1-git-send-email-daniel.mcdougall@liftoffsoftware.com>
	<1338996004-32583-2-git-send-email-daniel.mcdougall@liftoffsoftware.com>
	<4FCF76D6.4040909@mlbassoc.com>
	<20120606153232.GE3140@jama.jama.net>
Date: Wed, 6 Jun 2012 12:33:35 -0400
Message-ID: <CAG3aBq5_5y2QTHu94HYZ-hY+J0i23tsfiRcc58NWQYLUaJ8VkQ@mail.gmail.com>
From: Daniel McDougall <daniel.mcdougall@liftoffsoftware.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQnoPQnjS4erohWSm8bC2lYX7OWIAvcFw0jkcLPyJjQPu7KMOKhASdPJ4S0GgkMyw2UQPEVV
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH v2 2/2] python-numpy : Correct difflib dependency.
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
X-List-Received-Date: Wed, 06 Jun 2012 16:44:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 6, 2012 at 11:32 AM, Martin Jansa <martin.jansa@gmail.com>wrote=
:

> On Wed, Jun 06, 2012 at 09:27:18AM -0600, Gary Thomas wrote:
> > On 2012-06-06 09:20, Dan McDougall wrote:
> > > The previous patch had python-diffutils when it should have been
> > > python-difflib.
> > >
> > > Signed-off-by: Dan McDougall<daniel.mcdougall@liftoffsoftware.com>
> > > ---
> > >   .../recipes-devtools/python/python-numpy_1.4.1.bb  |    2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bbb/m=
eta-oe/recipes-devtools/python/
> python-numpy_1.4.1.bb
> > > index bae624e..702f224 100644
> > > --- a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
> > > +++ b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
> > > @@ -26,6 +26,6 @@ SRC_URI[md5sum] =3D "5c7b5349dc3161763f7f366ceb9651=
6b"
> > >   SRC_URI[sha256sum] =3D
> "2e7bb84573e5123e07f3c919fd433bc09b78d606252b6b719e385c2a981d8e06"
> > >
> > >   RDEPENDS_${PN} =3D "python-unittest \
> > > -                  python-diffutils \
> > > +                  python-difflib \
> > >                     python-pprint \
> > >                    "
> >
> > Since these patches have not yet been accepted/merged, shouldn't
> > you squash them into one?
>
> And interestingly someone found completely different set of deps a while
> ago..
>
> http://patchwork.openembedded.org/patch/3011/
>
> Cheers,
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
Well, Koen already committed my previous patch so I submitted the difflib
fix for that.  I included it as a 2/2 for context (not sure if that's the
right thing to do).

As for that other patch's dependencies, they're not correct:  I have numpy
installed on my Beaglebone right now and it works great without
python-mmap, python-compiler, python-pydoc, or python-pkgutil.
 python-unittest is definitely required though but that's in my patch
already.

--=20
Dan McDougall - Chief Executive Officer and Developer
Liftoff Software =E2=9C=88 Your flight to the cloud is now boarding.
904-446-8323

