Return-Path: <eric@eukrea.com>
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
	by mail.openembedded.org (Postfix) with ESMTP id 30A326101C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Sep 2013 19:44:27 +0000 (UTC)
Received: from e6520eb (unknown [82.233.81.124]) (Authenticated sender: eukrea)
	by smtp5-g21.free.fr (Postfix) with ESMTPSA id A9506D481B9;
	Mon, 30 Sep 2013 21:44:18 +0200 (CEST)
Date: Mon, 30 Sep 2013 21:44:16 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: Riku Voipio <riku.voipio@linaro.org>
Message-ID: <20130930214416.4922028a@e6520eb>
In-Reply-To: <CAAqcGHnxp2nk2YfkBahTGkawurdj-sZ=SJVRopPL=qZO5PW9hw@mail.gmail.com>
References: <1380548771-13812-1-git-send-email-riku.voipio@linaro.org>
	<1380548771-13812-3-git-send-email-riku.voipio@linaro.org>
	<20130930155838.08e5f9d4@e6520eb>
	<CAAqcGHnxp2nk2YfkBahTGkawurdj-sZ=SJVRopPL=qZO5PW9hw@mail.gmail.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.9.2 (GTK+ 2.24.19; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	Patch Tracking <patches@linaro.org>
Subject: Re: [meta-java][PATCH 3/3] jamvm/java: allow spaces in arguments
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Sep 2013 19:44:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Le Mon, 30 Sep 2013 22:22:32 +0300,
Riku Voipio <riku.voipio@linaro.org> a =E9crit :

> On 30 September 2013 16:58, Eric B=E9nard <eric@eukrea.com> wrote:
> > Hi Riku,
> >
> > Le Mon, 30 Sep 2013 16:46:11 +0300,
> > Riku Voipio <riku.voipio@linaro.org> a =E9crit :
> >
> >> Current IFS mangling blows up on the face:
> >>
> >>     | configure:2341: javac  -classpath .: Test.java
> >>     | Invalid maximum heap size: -Xmx1024m-cp/srv/oe/b
> >>
> >> Simpler command line expansion works just as easy.
> >> ---
> >>  recipes-core/jamvm/files/java | 7 +++----
> >>  1 file changed, 3 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/recipes-core/jamvm/files/java b/recipes-core/jamvm/files/=
java
> >> index 27cf094..9a396a7 100755
> >> --- a/recipes-core/jamvm/files/java
> >> +++ b/recipes-core/jamvm/files/java
> >> @@ -1,6 +1,5 @@
> >>  #!/bin/sh
> >>
> >> -IFS=3D""
> >> -export LD_LIBRARY_PATH=3D"$LD_LIBRARY_PATH:STAGING_LIBDIR_NATIVE/clas=
spath:STAGING_LIBDIR_NATIVE/jamvm"
> >> -export BOOTCLASSPATH=3D"STAGING_DATADIR_NATIVE/jamvm/classes.zip:STAG=
ING_DATADIR_NATIVE/classpath/glibj.zip"
> >> -exec jamvm ${1+"$@"}
> >> +export LD_LIBRARY_PATH=3D"$LD_LIBRARY_PATH:/srv/oe/build/tmp-eglibc/s=
ysroots/x86_64-linux/usr/lib/classpath:/srv/oe/build/tmp-eglibc/sysroots/x8=
6_64-linux/usr/lib/jamvm"
> >> +export BOOTCLASSPATH=3D"/srv/oe/build/tmp-eglibc/sysroots/x86_64-linu=
x/usr/share/jamvm/classes.zip:/srv/oe/build/tmp-eglibc/sysroots/x86_64-linu=
x/usr/share/classpath/glibj.zip"
> >> +exec jamvm "$@"
>=20
> > so now we have your path "/srv/oe/build/tmp-eglibc/" hardcoded in the
> > recipe ;-)
>=20
> That is indeed not intended.. I was a bit uncertain with this patch,
> as it was not clear to me why the IFS setting was needed.
>=20
sorry can't help you on this point but I've added in copy Henning which
is the original author of this file and the maintainer of meta-java so
he must be the best placed to answer your question.

Eric



Eric

