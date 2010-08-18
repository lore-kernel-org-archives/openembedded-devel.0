Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OlbdQ-0003et-O6
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Aug 2010 07:56:27 +0200
Received: by iwn38 with SMTP id 38so260297iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Aug 2010 22:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=PXlbUvjgcFoow0ct4PUaQUlL+HDBPzJYRT/TuXv7WHA=;
	b=dKiAppP/G/iOFYN41XJSwTanyZN2ipDobxOZqC2a2EZLYD+vYB7i+z6Aj3wBf6bSPr
	4tQypqWFw55fUapjLncy7zsoc6ao8EYh9FoJtw1ZxtB2pndQdHM3rIxxtZH49Wgphrhu
	nU0MTgwX4IObtZrrr4WjRd6uMNShfryJIMmNc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=T9MyQ2tX6CsL6fFP+BXu6+sNAQl9+e2nG/Pr0/45HeotNzaMDpkl2n7RgQrQvsk1pE
	dq72ltSIPiY7CKjvhMooyMOJ06sd1zJyb/iYkeo/wcUxE86xEPARSClz7DoeNqbHCDLq
	3arHQDXrI8GFMMg8+K3vEXlXfw6XnehIvIUQs=
MIME-Version: 1.0
Received: by 10.231.85.206 with SMTP id p14mr8874325ibl.89.1282110966708; Tue,
	17 Aug 2010 22:56:06 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Tue, 17 Aug 2010 22:56:06 -0700 (PDT)
In-Reply-To: <AANLkTikFP8vUiQ4PbJ6Acv=7TeY6fyP4LAq7C9GQkX0m@mail.gmail.com>
References: <1282072782-11487-1-git-send-email-jkridner@beagleboard.org>
	<AANLkTinvpJphbWaNu_8s=oyxC_1PN=uSXRoNfuEVr=No@mail.gmail.com>
	<AANLkTikFP8vUiQ4PbJ6Acv=7TeY6fyP4LAq7C9GQkX0m@mail.gmail.com>
Date: Wed, 18 Aug 2010 07:56:06 +0200
Message-ID: <AANLkTikOOkZrsRMO2wbfu5PrcQs93tqOnH1XyQF=T3iK@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] quilt: disable packaged staging on native builds
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
X-List-Received-Date: Wed, 18 Aug 2010 05:56:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/17 Chris Larson <clarson@kergoth.com>:
> On Tue, Aug 17, 2010 at 1:03 PM, Frans Meulenbroeks <
> fransmeulenbroeks@gmail.com> wrote:
>
>> 2010/8/17 Jason Kridner <jkridner@beagleboard.org>:
>> >
>> > Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
>> > ---
>> > =A0recipes/quilt/quilt-native.inc | =A0 =A03 +++
>> > =A0recipes/quilt/quilt_0.48.bb =A0 =A0| =A0 =A02 +-
>> > =A02 files changed, 4 insertions(+), 1 deletions(-)
>> >
>> > diff --git a/recipes/quilt/quilt-native.inc
>> b/recipes/quilt/quilt-native.inc
>> > index 10d8183..f422b63 100644
>> > --- a/recipes/quilt/quilt-native.inc
>> > +++ b/recipes/quilt/quilt-native.inc
>> > @@ -6,6 +6,9 @@ RDEPENDS_${PN} =3D "diffstat-native patch-native
>> bzip2-native util-linux-native"
>> > =A0FILESPATHPKG =3D. quilt-${PV}
>> > =A0INHIBIT_AUTOTOOLS_DEPS =3D "1"
>> >
>> > +# Several packages fail to patch when using quilt from packaged stagi=
ng
>> > +PSTAGING_DISABLED_virtclass-native =3D "1"
>> > +
>> > =A0inherit autotools native
>> >
>> > =A0PATCHTOOL =3D "patch"
>> > diff --git a/recipes/quilt/quilt_0.48.bb b/recipes/quilt/quilt_0.48.bb
>> > index 0a066df..99dc2a2 100644
>> > --- a/recipes/quilt/quilt_0.48.bb
>> > +++ b/recipes/quilt/quilt_0.48.bb
>> > @@ -1,6 +1,6 @@
>> > =A0require quilt-package.inc
>> >
>> > -PR=3D"r1"
>> > +PR=3D"r2"
>> >
>> > =A0SRC_URI[md5sum] =3D "f77adda60039ffa753f3c584a286f12b"
>> > =A0SRC_URI[sha256sum] =3D
>> "73fd760d3b5cbf06417576591dc37d67380d189392db9000c21b7cbebee49ffc"
>> > --
>> > 1.5.6.4
>>
>> I have some concerns with this patch.
>> I have a quilt native in my pstage dir from aug 7. (pstage is outside
>> TMPDIR)
>> Just did a bitbake beagleboard-demo-image after removing TMPDIR, with
>> quilt-native and quite some other packages in my pstage dir.
>> I am at "Running task 7313 of 11636", lots of packages have been
>> compiled and no patch has failed.
>>
>> My proposal is to put this patch on hold until proven to be an issue
>> by someone else.
>
>
> Did you build with TMPDIR in a *different* location using prebuilts? =A0I=
f not
> you didn't prove anything at all about the relocatability of quilt. =A0If=
 a
> package isn't relocatable, it shouldn't be enabled for pstaging, as the
> package can't be used reliably.

No, this was with TMPDIR at the same place.

Outside of this (as I also read Tom's reply, so I know there is a fix,
or at least in the works):
There are two reasons to use pstaging:
1: giving them to others so they can rebuild faster
2: keeping them for yourself so you can rm TMPDIR and rebuild faster.
I belong to the second group (and I guess atm most of the pstage users).
But for group 1 relocatability is indeed important.

I guess we should be able to find this (QA step?) by doing a grep in
the package (or image dir) to see TMPDIR is in the executables (and
maybe other files in the image).

One more thing:
If there is a reported failure of pstaging, I would suggest that the
people reporting it would save the offending package so it can be
analysed and compared with the proper package.

Frans.


