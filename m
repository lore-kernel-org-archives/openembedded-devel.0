Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RM8QF-0006o7-QY
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Nov 2011 02:18:19 +0100
Received: (qmail invoked by alias); 04 Nov 2011 01:12:07 -0000
Received: from p5B0A14EB.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.20.235]
	by mail.gmx.net (mp059) with SMTP; 04 Nov 2011 02:12:07 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+GW74jMiaGqwJw1EFel7zC49j7rqDdjeySKDgSRS
	jPq6zRJpsznSMQ
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 4 Nov 2011 02:16:56 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-100.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <20111101085901.447CF1032F@opal>
	<201111032245.17175.schnitzeltony@gmx.de>
	<20111103222918.GP9949@jama.jama.net>
In-Reply-To: <20111103222918.GP9949@jama.jama.net>
MIME-Version: 1.0
Message-Id: <201111040216.57169.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [oe-commits] Martin Jansa : midori: fix build with dirty vala
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
X-List-Received-Date: Fri, 04 Nov 2011 01:18:19 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Thursday, November 03, 2011 11:29:18 PM Martin Jansa wrote:
> On Thu, Nov 03, 2011 at 10:45:16PM +0100, Andreas M=FCller wrote:
> > On Thursday, November 03, 2011 01:52:48 AM Andreas M=FCller wrote:
> > > On Thursday, November 03, 2011 12:32:54 AM Martin Jansa wrote:
> > > > > Hm - I am afraid since this update midori never finishes
> > > > > configuring here. I waited for approximately 2 hours and stopped
> > > > > the process. The log file is attached ( a fresh retry creates
> > > > > similar log ). I commented out the whole
> > > >=20
> > > > Have you tried to revert it to see that it's not caused ie by glib
> > > > changes or something? Because my vala detection change is already
> > > > finished before it writes this stuff and the tar in waf is compared
> > > > with hardcoded checksum, so it also could not change just by this
> > > > monster blob.
> > >=20
> > > When sending previous mail I had two runs with and without your patch
> > > which gave me a clear picture. Now I have had some further rebuilds -
> > > seems sometimes it builds sometimes not! It's a bit late - tomorrow I
> > > would like to check further builds to see if I get a hang too with
> > > your patch reverted.
> >=20
> > I created a simple script rebuilding midori again and again. I tested it
> > with your patch reverted -> I cannot tell when, but when I came back had
> > also hang on configure. So your patch is out of suspicion. For now my
> > strategy will be living with it.
> >=20
> > > > Could you also check if there is something interesting in ps aux or
> > > > strace when it's "hanging"? On all 3 boxes I have tried this it
> > > > always worked as expected.
> > > >=20
> > > > > | do_configure_prepend()
> > > > >=20
> > > > > function, ran
> > > > >=20
> > > > > | bitbake -ccleanall midori
> > > > >=20
> > > > > and
> > > > >=20
> > > > > | bitbake midori
> > > > >=20
> > > > > without further issues in few minutes.
> > > > >=20
> > > > > Maybe we should rethink this monster blob commit intended to fix a
> > > > > corner case...
> > > >=20
> > > > Yes pity that this corner case is our only vala-native and I was
> > > > hopping that newer midori with newer waf-1.6 will be released soon
> > > > and this won't be needed anymore..
> >=20
> > What I still do not unterstand: Since configure detetced vala correct
> > with patch reverted I ran
> >=20
> > ~/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/valac --version
> >=20
> > I got
> >=20
> > Vala 0.12.1
> >=20
> > Why am I not dirty?
>=20
> SHR buildhost with shr-chroot:
> OE @ ~ $ ~/shr-core/tmp/sysroots/x86_64-linux/usr/bin/valac --version
> Vala 0.12.1-dirty
>=20
> my buildhost with shr-chroot:
> OE @ ~ $ ~/shr-core/tmp/sysroots/x86_64-linux/usr/bin/valac --version
> Vala 0.12.1
>=20
> So right now only bad people are dirty and only sometimes.. see how they
> get dirty
:-))
>=20
> vala/build-aux/git-version-gen
> ...
> # Don't declare a version "dirty" merely because a time stamp has changed.
> git status > /dev/null 2>&1
>=20
> dirty=3D`sh -c 'git diff-index --name-only HEAD' 2>/dev/null` || dirty=3D
> case "$dirty" in
>     '') ;;
>     *) # Append the suffix only if there isn't one already.
>         case $v in
>           *-dirty) ;;
>           *) v=3D"$v-dirty" ;;
>         esac ;;
> esac
>=20
> shr buildhost:
> OE @ ~/shr-core/tmp/work/x86_64-linux $ git diff-index --name-only HEAD
> dev/.keep
> dev/null
> etc/group
> etc/hosts
> etc/localtime
> etc/passwd
> etc/resolv.conf
> proc/.keep
> sys/.keep
> var/cache/ldconfig/aux-cache
> var/run/utmp
>=20
> and my buildhost:
> OE @ ~/shr-core/tmp/work/x86_64-linux $ git diff-index --name-only HEAD
> fatal: Not a git repository (or any parent up to mount parent
> /OE/shr-core/tmp) Stopping at filesystem boundary
> (GIT_DISCOVERY_ACROSS_FILESYSTEM not set).
>=20
> The difference is that my tmp/work dir is mount -o bind outside shr-chroot
> (which is itself git checkout).
This is not a corner case - sorry
>=20
> So yes.. the detection in vala is not optimal and and causes false positi=
ve
> -dirty, but midori should be able to build even with really dirty
> vala_git.bb and newer waf is also fixing it like this.
agreed
>=20
> If someone confirms that this patch is causing some problems I'll remove
> -dirty detection from vala completely so it will also report clean on
> really dirty vala_git.bb.
After my tests it is not modified waf causing the trouble.
>=20
> Regards,
Thanks a lot for taking your time to clear up this one.

Andreas


