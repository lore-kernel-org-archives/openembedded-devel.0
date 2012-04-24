Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SMgLQ-0004Q9-0t
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Apr 2012 16:03:52 +0200
Received: by wera1 with SMTP id a1so505343wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Apr 2012 06:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=6/jcUb7qzcJebUnoQsGfcAUz6N3YHPD5DZrrEwodD+c=;
	b=eCj3syknsDGWo/rMmnODXA6NidTZHQe5MHC3akoqm2JVCjQz+xhdGcpMhrTCIIpWFL
	TA3mqQYWMJr+Jd0hzYtRSEHEzI6zyaTGqaalCzVAMlQMk9Z4JJcfUY5y3sH5bK0BoIFe
	+Rhae7Kq99lbjwJ1Iifx4aZi79oH7su2RCw4yumvSbswn/BMepmSGS0mQNfXo4fxKl6n
	yBotTjE/Rw//15m7LI4i261mzGh1Nuc84iALdiM0idD90jNmiDqefy49yoEnuu7sF4q9
	o7U3110MSsQsbkPrGfcb3xZZjqZbjbjKLTdB6xdVUqe14z5BDOlCORPp2x5l2blBe7q/
	Ie/g==
MIME-Version: 1.0
Received: by 10.180.88.169 with SMTP id bh9mr6453604wib.5.1335275657596; Tue,
	24 Apr 2012 06:54:17 -0700 (PDT)
Received: by 10.223.159.15 with HTTP; Tue, 24 Apr 2012 06:54:17 -0700 (PDT)
In-Reply-To: <2075617.XNr0ya9tIT@helios>
References: <1335191135-6762-1-git-send-email-koen@dominion.thruhere.net>
	<2199708.NNXS638hI1@helios> <jn4b5o$gfi$1@dough.gmane.org>
	<2075617.XNr0ya9tIT@helios>
Date: Tue, 24 Apr 2012 15:54:17 +0200
Message-ID: <CAGiJk9d5oeXCULH2c4xh47yLpa6TRB6upVYzz233+z+6fdrNog@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-kde][PATCH] qt4-x11-free 4.8.0 bbappend: fix GLES configure switch and turn it on for AM335x SoCs as well
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
X-List-Received-Date: Tue, 24 Apr 2012 14:03:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2012/4/23 Paul Eggleton <paul.eggleton@linux.intel.com>:
> On Monday 23 April 2012 21:39:36 Koen Kooi wrote:
>> Op 23-04-12 17:46, Paul Eggleton schreef:
>> > On Monday 23 April 2012 16:25:35 Koen Kooi wrote:
>> >> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net> ---
>> >> recipes-misc-support/qt4-x11-free_4.8.0.bbappend | =C2=A0 =C2=A05 +++=
-- 1 files
>> >> changed, 3 insertions(+), 2 deletions(-)
>> >>
>> >> diff --git a/recipes-misc-support/qt4-x11-free_4.8.0.bbappend
>> >> b/recipes-misc-support/qt4-x11-free_4.8.0.bbappend index
>> >> b5a3c16..4895893 100644 ---
>> >> a/recipes-misc-support/qt4-x11-free_4.8.0.bbappend +++
>> >> b/recipes-misc-support/qt4-x11-free_4.8.0.bbappend @@ -1,7 +1,8 @@
>> >> -QT_GLFLAGS_omap3 =3D "-egl" +QT_GLFLAGS_omap3 =3D "-opengl es2 "
>> >> DEPENDS_append_omap3 =3D " libgles-omap3" +DEPENDS_append_ti33x =3D "
>> >> libgles-omap3"
>> >>
>> >> # Needed by kdelibs QT_DISTRO_FLAGS =3D "-accessibility -sm"
>> >>
>> >> -PRINC :=3D "${@int(PRINC) + 1}" \ No newline at end of file +PRINC :=
=3D
>> >> "${@int(PRINC) + 2}"
>> >
>> > Can we avoid this machine-specific stuff creeping into software layers=
?
>> > At least in this case we're appending something in OE-Core so there
>> > should be no problem with this appearing in an append in the BSP(s).
>>
>> Have a look at what was discussed in the "[meta-kde] Test images (was: R=
e:
>> [OE-core] RFC: Porting KDE Plasma Active (WIP))" thread
>
> Yes, I understand why it was added, but (as I'm sure you're aware) one of=
 the
> reasons why we did the layer split was to avoid having numbers of machine=
-
> specific overrides appearing in generic recipes.
>
> Cheers,
> Paul

For this .bbappend it is no problem, over time the machine specific
stuff will disappear (it is only there for testing).

But I see a problem with kde-workspace [1].
If it should build kwin_gles then it depends on libgles, but not every
machine has libgles.
It would be no problem if virtual/libgl is used but that don't work
for machines that use virtual/egl.

Or is there a way to build time recommend something instead of depending on=
 it?


[1] https://gitorious.org/openembedded-core-layers/meta-kde/blobs/master/re=
cipes-kde-base/kde-workspace_git.bb#line8
--=20
Regards
Samuel


