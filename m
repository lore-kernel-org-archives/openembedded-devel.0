Received: from mail-ea0-f169.google.com ([209.85.215.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1URObH-0005SO-0B
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Apr 2013 17:12:15 +0200
Received: by mail-ea0-f169.google.com with SMTP id n15so1894660ead.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Apr 2013 07:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VvCEsJgQvD3TP9xEYTH+DinkvEZnWV2Tzc0Zfk326Gk=;
	b=ZqYcZYYb4JjI3892P/k6RLG6Y75Hh3bzcp6u6K+W34ftotTqgnvrJjXwCbm1T31y84
	rkvo4n5cgNZ7ejvzp92F/HShThvnG6T2nkGkK1AfjWQbnCpQyWZdqAvpyUZSJMeYWs8M
	1OknbQ4hHTxkPIlqTsKJCt4Yi3M4fow+9VOWvvK+jXa5/jE1plINmDlCfVZP2iLcSxO0
	lM+LHU9IpiRVOIMZqikHRceQfT5wxiC16BZc0I61RriXI57hFpLl8FMWVk9v7BbDMjAw
	uJLJ0Dqd2DwRM8kNs0s9b7/08//6oTMmuzvB08yNys/dSI0dkSRQL1LGZaIdefAaxpAn
	6AFQ==
X-Received: by 10.14.201.67 with SMTP id a43mr33948281eeo.33.1365951287794;
	Sun, 14 Apr 2013 07:54:47 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id u44sm21904273eel.7.2013.04.14.07.54.46
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 14 Apr 2013 07:54:47 -0700 (PDT)
Date: Sun, 14 Apr 2013 16:54:52 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130414145452.GD2475@jama>
References: <20130412225236.GZ2477@jama>
	<CADkTA4NKtqepA-XRRN9QyVw6eaDoW0_ikFzvGDHYkAvNk_3rOw@mail.gmail.com>
	<20130413010436.GB2477@jama>
	<CADkTA4NKXrnCWHxd3fvNOxy2Zd29=xwuDQvyVDaQ=BY6mD1TOQ@mail.gmail.com>
	<CADkTA4OenBfydWeEEj6AaEOJMt7GEHbx8+FCSzs2mYRFx-MJxQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4OenBfydWeEEj6AaEOJMt7GEHbx8+FCSzs2mYRFx-MJxQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-handheld] linux-yocto-3.8 failing
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
X-List-Received-Date: Sun, 14 Apr 2013 15:12:24 -0000
X-List-Received-Date: Sun, 14 Apr 2013 15:12:24 -0000
X-Groupsio-MsgNum: 44163
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zbGR4y+acU1DwHSi"
Content-Disposition: inline

--zbGR4y+acU1DwHSi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2013 at 11:59:35PM -0400, Bruce Ashfield wrote:
> On Fri, Apr 12, 2013 at 11:00 PM, Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
> > On Fri, Apr 12, 2013 at 9:04 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
> >> On Fri, Apr 12, 2013 at 08:44:53PM -0400, Bruce Ashfield wrote:
> >>> On Fri, Apr 12, 2013 at 6:52 PM, Martin Jansa <martin.jansa@gmail.com=
> wrote:
> >>> > Hi Andrea,
> >>> >
> >>> > patches from
> >>> > http://git.openembedded.org/meta-handheld/commit/?id=3D54c01286d738=
e6a6dc2971853644b9ed0e0a9a2e
> >>> >
> >>> > don't apply after linux-yocto upgrade in oe-core from today
> >>> > http://git.openembedded.org/openembedded-core/commit/?id=3D0271dec6=
4591c4d91933b3a8db875a374a63640b
> >>>
> >>> Hmm. Andrea and I debugged another problem with these BSPs just yeste=
rday,
> >>> I sent a fix to RP that is slightly newer than the commit you are ref=
erencing
> >>> above.
> >>>
> >>> If it still doesn't work with the very tip of oe-core, then I'll help
> >>> Andrea debug more ... unless
> >>> the patches really do need a refresh :)
> >>
> >> Maybe it was caused by some other linux-yocto/kern-tools-native change
> >> instead, because I've built linux-yocto-3.8 for spitz earlier today
> >> (with oe-core revision from yesterday). Then I upgraded oe-core again
> >> and it started to fail.
> >
> > There were some changes just this morning, to fix NFS root issues
> > picked up on the
> > h/w reference BSPS. Before that, some patches were being missed and not=
 throwing
> > a hard error. They are likely found now .. and could be what is
> > causing the problem.
> >
> > The easiest way for me is to just clone and configure my own spitz
> > build and I'll
> > let everyone know how it goes.
>=20
> Just a follow up. I tested the build, and it is just a straight up
> patch refresh issue,
> everything is being properly queued. If it ever worked on the 3.8
> kernel, that was
> the anomaly not the current patch failure.

OK, thanks for looking into it. It seems that failing patch wasn't applied
at all before, reverting this commit

commit ddce9f375c626ef2c86f48612b3d7a24e3111b0b
Author: Bruce Ashfield <bruce.ashfield@windriver.com>
Date:   Fri Apr 12 02:16:33 2013 +0000

    kern-tools: fix non-local patch/config location

allows to build it with spitz again, but I belive you it's just some
patch which is now applied but needs to be refreshed first.

Cheers,

> The first example of spitz_pm.patch failing is because the following main=
line
> commit has already done the job:
>=20
> > git show 510fcb0d331f314cd20d0067d56f29302846f47b
> commit 510fcb0d331f314cd20d0067d56f29302846f47b
> Author: Marko Katic <dromede@gmail.com>
> Date:   Thu Oct 25 18:51:38 2012 +0200
>=20
>     ARM: pxa/spitz_pm: Fix hang when resuming from STR
>=20
>     Devices that use spitz_pm.c will fail to resume
>     from STR (Suspend To Ram) when the charger plug is inserted
>     or removed when a device is in STR mode. The culprit is
>     a misconfigured gpio line - GPIO18. GPIO18 should be configured as a
>     regular GPIO input but it gets configured as an alternate function
>     GPIO18_RDY. And then later in postsuspend() it gets configured as
>     a regular GPIO18 input line.
>=20
>     Fix this by removing the GPIO18_RDY configuration so that GPIO18
>     only gets configured as a regular gpio input.
>=20
>     Signed-off-by: Marko Katic <dromede@gmail.com>
>     Signed-off-by: Haojian Zhuang <haojian.zhuang@gmail.com>
>=20
> diff --git a/arch/arm/mach-pxa/spitz_pm.c b/arch/arm/mach-pxa/spitz_pm.c
>=20
> ... etc.
>=20
> So just the standard matter of refreshing and dropping some patches.
> Unless Andrea
> finds out that I'm just missing something in my config or test.
>=20
> Cheers,
>=20
> Bruce
>=20
> >
> > Cheers,
> >
> > Bruce
> >
> >>
> >> https://github.com/shr-distribution/buildhistory/commit/0e3324cd91d06a=
362661b4151a298fa2f3f6566e
> >> is my last successful spitz image build and it shows
> >> kernel_3.8.4+git0+27b63fdbd25ad1a37bacc05f49a205c150d21779_11998bd1f44=
b21cd0b8c0ca11cbd36865f14bfdc-r4.0.0_spitz.ipk
> >> (same SRCREVs as now failing build)
> >>
> >> Cheers,
> >>
> >>> > ERROR: Function failed: do_patch (see /OE/shr-core/tmp-eglibc/work/=
spitz-oe-linux-gnueabi/linux-yocto/3.8.4+gitAUTOINC+27b63fdbd25ad1a37bacc05=
f49a205c150d21779_11998bd1f44b21cd0b8c0ca11cbd36865f14bfdc-r4.1/temp/log.do=
_patch.18051 for further information)
> >>> > ERROR: Logfile of failure stored in: /OE/shr-core/tmp-eglibc/work/s=
pitz-oe-linux-gnueabi/linux-yocto/3.8.4+gitAUTOINC+27b63fdbd25ad1a37bacc05f=
49a205c150d21779_11998bd1f44b21cd0b8c0ca11cbd36865f14bfdc-r4.1/temp/log.do_=
patch.18051
> >>> > Log data follows:
> >>> > | DEBUG: Executing shell function do_patch
> >>> > | Deleted branch meta-temp (was 37fdb0c).
> >>> > | [INFO] validating against known patches  (spitz-standard-meta)
> >>> > error: patch failed: arch/arm/mach-pxa/spitz_pm.c:86##] (\)(102 %)
> >>> > | error: arch/arm/mach-pxa/spitz_pm.c: patch does not apply
> >>> > | To force apply this patch, use 'guilt push -f'
> >>> > | [ERROR] unable to complete push
> >>> > | pending patches are:
> >>> > | links/linux-yocto-3.8/spitz_pm.patch
> >>> > | links/linux-yocto-3.8/pxa27x-sa1100-rtc.patch
> >>> > | links/linux-yocto-3.8/spi-pxa2xx-fix-mem.patch
> >>> > | ERROR. could not update git tree
> >>> > | ERROR. Could not apply patches for spitz.
> >>> > |        Patch failures can be resolved in the devshell (bitbake -c=
 devshell linux-yocto)
> >>> > | ERROR: Function failed: do_patch (see /OE/shr-core/tmp-eglibc/wor=
k/spitz-oe-linux-gnueabi/linux-yocto/3.8.4+gitAUTOINC+27b63fdbd25ad1a37bacc=
05f49a205c150d21779_11998bd1f44b21cd0b8c0ca11cbd36865f14bfdc-r4.1/temp/log.=
do_patch.18051 for further information)
> >>> > ERROR: Task 3 (/OE/shr-core/openembedded-core/meta/recipes-kernel/l=
inux/linux-yocto_3.8.bb, do_patch) failed with exit code '1'
> >>> > NOTE: Tasks Summary: Attempted 26 tasks of which 21 didn't need to =
be rerun and 1 failed.
> >>> >
> >>> > --
> >>> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >>> >
> >>> > _______________________________________________
> >>> > Openembedded-devel mailing list
> >>> > Openembedded-devel@lists.openembedded.org
> >>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-de=
vel
> >>> >
> >>>
> >>>
> >>>
> >>> --
> >>> "Thou shalt not follow the NULL pointer, for chaos and madness await
> >>> thee at its end"
> >>>
> >>> _______________________________________________
> >>> Openembedded-devel mailing list
> >>> Openembedded-devel@lists.openembedded.org
> >>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >>
> >> --
> >> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >>
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >>
> >
> >
> >
> > --
> > "Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end"
>=20
>=20
>=20
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zbGR4y+acU1DwHSi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFqwzwACgkQN1Ujt2V2gBx0vwCfQ2SYJbz3nrVW/cOH//0lKXkd
VCAAn1riyggI/Yg9lDFQgI67HknsGhJP
=flTi
-----END PGP SIGNATURE-----

--zbGR4y+acU1DwHSi--
