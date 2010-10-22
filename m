Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P9FaZ-00012X-7L
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 13:15:13 +0200
Received: by gxk22 with SMTP id 22so522883gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 04:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=oE6jtUTfTmJVKoBTBEzIWk6HgLXvkCyztgWEJJiG8jk=;
	b=HUlRBEqReA7xV+BhptPA1aLn/IqT7YgyToHh92BnrNdZ6qIUKmwenLsw8CCi88Zvve
	7FwyOzrqWe5eiDJBFKq1bAOoOXtaozRa1DBpPvAuLANRTy3JhdtVPkyGzz0enUJGMxr0
	iAm8Db/oQ6VDRR/QKzZCbrWZwmfwzyHKhV/iU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Xa+8kRFYwXqX8ISDYMmez0WvjpTQ9ZEUgpHcSnM/2gFtFNe8+EAAEpNaa98D5080lm
	GTn43TeUQJ98hZF0DTKQZytM0ifh7WXzTytSqoih1B1KYO26tZJko3cBrOrQl2GKl1xf
	SoaLlkV/8cGmXw4zJMQN0kWE9AKHjh9n3WhQs=
MIME-Version: 1.0
Received: by 10.42.103.3 with SMTP id k3mr2108971ico.213.1287746069008; Fri,
	22 Oct 2010 04:14:29 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Fri, 22 Oct 2010 04:14:28 -0700 (PDT)
In-Reply-To: <AANLkTi=H5ho=K4mvN6yVcwDxp+dsK8pg6RyMsi8BJ_Wv@mail.gmail.com>
References: <AANLkTi=H5ho=K4mvN6yVcwDxp+dsK8pg6RyMsi8BJ_Wv@mail.gmail.com>
Date: Fri, 22 Oct 2010 13:14:28 +0200
Message-ID: <AANLkTimygMiDNe00Mqtx2uYrUsjD=AZ25KU5V03HZ_v3@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org, bitbake-dev@lists.berlios.de
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	WEIRD_PORT autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: SRCREV error
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
X-List-Received-Date: Fri, 22 Oct 2010 11:15:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/22 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> Not sure if this is an OE or bitbake error, so sending to both.
>
> Triggered by the empty string discussion, I played a little bit with -e.

As asked by Martin on irc: this was with -e and -b

Also he told me SRCREV =3D "1" comes from conf/bitbake.conf
We might add a check for this value and not generate the ERROR.

Frans
>
> Target recipe was aircrack/aircrack_2.1.bb which reads:
>
> SECTION =3D "console/network"
> DESCRIPTION =3D "Aircrack is a set of tools for wep key statistical crack=
ing"
> HOMEPAGE =3D "http://www.cr0.net:8040/code/network/aircrack/"
> LICENSE =3D "GPLv2"
> DEPENDS =3D ""
> PV=3D"2.1"
> PR =3D"r0"
>
> SRC_URI =3D "http://archive.aircrack-ng.org/aircrack-old/${P}.tgz \
> file://silent_patch.diff;striplevel=3D0"
>
> SRC_URI[md5sum] =3D "694c6180f620b0534e5925a71b960bd1"
> SRC_URI[sha256sum] =3D
> "9b749d98278450b80153c1f82b7e253548a3f03603062dc98cc1320803d791da"
>
> inherit autotools
>
> do_install() {
> =A0 =A0 =A0 =A0install -d ${D}/${sbindir}
> =A0 =A0 =A0 =A0install -d ${D}/${libdir}/${PN}
> =A0 =A0 =A0 =A0install -m 0755 802ether =A0 =A0 =A0 =A0 =A0${D}/${sbindir=
}
> =A0 =A0 =A0 =A0install -m 0755 airodump =A0 =A0 =A0 =A0 =A0${D}/${sbindir=
}
> =A0 =A0 =A0 =A0install -m 0755 aircrack =A0 =A0 =A0 =A0 =A0${D}/${sbindir=
}
> =A0 =A0 =A0 =A0install -m 0755 aireplay =A0 =A0 =A0 =A0 =A0${D}/${sbindir=
}
> =A0 =A0 =A0 =A0install -m 0755 hopper.sh =A0 =A0 =A0 =A0 =A0${D}/${sbindi=
r}
> }
>
> if I run bitbake -e on this recipe I get:
>
> ERROR: SRCREV was used yet no valid SCM was found in SRC_URI
> ERROR: SRCREV was used yet no valid SCM was found in SRC_URI
> ERROR: SRCREV was used yet no valid SCM was found in SRC_URI
> NOTE: <class 'bb.fetch.ParameterError'>: while evaluating:
> ${@bb.fetch.get_srcrev(d)}
> ERROR: SRCREV was used yet no valid SCM was found in SRC_URI
> NOTE: <class 'bb.fetch.ParameterError'>: while evaluating:
> ${@bb.fetch.get_srcrev(d)}
> NOTE: <class 'bb.fetch.ParameterError'>: while evaluating:
> ${SRCPV}
> # =3D/home/frans/workspace/bitbake-1.10.0/bin/bitbake
> =3D"/home/frans/workspace/bitbake-1.10.0/bin/bitbake"
> ...
> # SRCREV=3D1
> SRCREV=3D"1"
> ...
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if "minrev" in parm:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0srcrev =3D bb.data.getVar(=
'SRCREV', d, 1)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if srcrev and srcrev < par=
m["minrev"]:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bb.note("P=
atch '%s' applies to later
> revisions" % pname)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0continue
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if "maxrev" in parm:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0srcrev =3D bb.data.getVar(=
'SRCREV', d, 1)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if srcrev and srcrev > par=
m["maxrev"]:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bb.note("P=
atch '%s' applies to earlier
> revisions" % pname)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0continue
> ...
>
> I feel the ERROR message is not too appropriate, and I am not sure
> where it comes from.
>
> No one is defining it:
>
> frans@frans-desktop:~/workspace/openembedded/recipes$ grep aircrack ../co=
nf -r
> ../conf/distro/include/insane-srcrevs.inc:SRCREV_pn-aircrack-ng ?=3D "${A=
UTOREV}"
>
> (note that that definition is for aircrack-ng, not aircrack_2.1 which
> I am building)
>
> And classes do not generate the code either as far as I can see:
>
> frans@frans-desktop:~/workspace/openembedded/recipes$ grep aircrack
> ../classes -r
> frans@frans-desktop:~/workspace/openembedded/recipes$ grep SRCREV ../clas=
ses -r
> ../classes/patch.bbclass: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 src=
rev =3D bb.data.getVar('SRCREV', d, 1)
> ../classes/patch.bbclass: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 src=
rev =3D bb.data.getVar('SRCREV', d, 1)
> ../classes/gitpkgv.bbclass:# NN equals the total number of revs up to SRC=
REV
> ../classes/gitpkgv.bbclass:# GITHASH is SRCREV's (full) hash
> ../classes/gitpkgv.bbclass:# SRCREV. So ${GITPKGV} should never be
> used in PV, only in PKGV.
> ../classes/gitpkgv.bbclass:# It can handle SRCREV =3D ${AUTOREV}, as
> well as SRCREV =3D "<some fixed git hash>"
> ../classes/opie.bbclass:OPIE_SRCREV ?=3D
> "8c3beef263bc9c34443eacfc821e99813e17554f"
> ../classes/opie.bbclass:OPIE_GIT_PV ?=3D "1.2.4+gitr${OPIE_SRCREV}"
> ../classes/lockdown.bbclass: =A0 =A0if "SRCREV" in bb.data.getVar("PV", d=
, False):
> ../classes/lockdown.bbclass: =A0 =A0 =A0 =A0 =A0 =A0print >> src_revs, 'S=
RCREV_pn-%(pn)s ?=3D
> "%(rev)s"' % { 'pn' : pn, 'rev' : bb.data.getVar("SRCREV", d, True) }
>
> The assingment is not from lib but I cannot find it in the bitbake dir
> either (but maybe I am overlooking things there, I'm by no means a
> python wiz).
>
> frans@frans-desktop:~/workspace/openembedded/recipes$ grep SRCREV ../lib =
-r
> frans@frans-desktop:~/workspace/openembedded/recipes$ grep SRCREV
> ../../bitbake -r
> Binary file ../../bitbake/.git/objects/pack/pack-5ce6751d5a9a9ce8cd2fa963=
c5316fccd15eab89.pack
> matches
> ../../bitbake/ChangeLog: =A0 =A0 =A0 =A0- Add SRCREV support for svn fetc=
her
> ../../bitbake/ChangeLog: =A0 =A0 =A0 =A0- Add BB_SRCREV_POLICY variable (=
clear or
> cache) to control SRCREV cache
> ../../bitbake/ChangeLog: =A0 =A0 =A0 =A0- Add SRCREV_FORMAT support
> ../../bitbake/ChangeLog: =A0 =A0 =A0 =A0- SRCREV handling updates, improv=
ements and
> fixes from Poky
> ../../bitbake/ChangeLog: =A0 =A0 =A0 =A0- Raise an exception if SRCREV =
=3D=3D 'INVALID'
> ../../bitbake/ChangeLog: =A0 =A0 =A0 =A0- When SRCREV autorevisioning for=
 a recipe is
> in use, don't cache the recipe
> Binary file ../../bitbake/lib/bb/fetch/__init__.pyc matches
> ../../bitbake/lib/bb/fetch/svn.py: =A0 =A0 =A0 =A0 =A0 =A0# Should warn p=
eople to
> switch to SRCREV here
> ../../bitbake/lib/bb/fetch/git.py: =A0 =A0 =A0 =A0if
> bb.data.getVar("BB_GIT_CLONE_FOR_SRCREV", d, True):
> Binary file ../../bitbake/lib/bb/fetch/git.pyc matches
> ../../bitbake/lib/bb/fetch/__init__.py:class InvalidSRCREV(Exception):
> ../../bitbake/lib/bb/fetch/__init__.py: =A0 =A0"""Exception raised when a=
n
> invalid SRCREV is encountered"""
> ../../bitbake/lib/bb/fetch/__init__.py: =A0 =A0srcrev_policy =3D
> bb.data.getVar('BB_SRCREV_POLICY', d, 1) or "clear"
> ../../bitbake/lib/bb/fetch/__init__.py: =A0 =A0 =A0 =A0logger.debug(1,
> "Keeping SRCREV cache due to cache policy of: %s", srcrev_policy)
> ../../bitbake/lib/bb/fetch/__init__.py: =A0 =A0 =A0 =A0logger.debug(1,
> "Clearing SRCREV cache due to cache policy of: %s", srcrev_policy)
> ../../bitbake/lib/bb/fetch/__init__.py: =A0 =A0 =A0 =A0raise
> FetchError("Invalid SRCREV cache policy of: %s" % srcrev_policy)
> ../../bitbake/lib/bb/fetch/__init__.py: =A0 =A0In the multi SCM case, we
> build a value based on SRCREV_FORMAT which must
> ../../bitbake/lib/bb/fetch/__init__.py: =A0 =A0# Ugly code alert.
> localpath in the fetchers will try to evaluate SRCREV which
> ../../bitbake/lib/bb/fetch/__init__.py: =A0 =A0# "SRCREVINACTION" return =
value.
> ../../bitbake/lib/bb/fetch/__init__.py: =A0 =A0 =A0 =A0return "SRCREVINAC=
TION"
> ../../bitbake/lib/bb/fetch/__init__.py: =A0 =A0 =A0 =A0logger.error("SRCR=
EV
> was used yet no valid SCM was found in SRC_URI")
> ../../bitbake/lib/bb/fetch/__init__.py: =A0 =A0if
> bb.data.getVar('BB_SRCREV_POLICY', d, True) !=3D "cache":
> ../../bitbake/lib/bb/fetch/__init__.py: =A0 =A0# Mutiple SCMs are in
> SRC_URI so we resort to SRCREV_FORMAT
> ../../bitbake/lib/bb/fetch/__init__.py: =A0 =A0format =3D
> bb.data.getVar('SRCREV_FORMAT', d, 1)
> ../../bitbake/lib/bb/fetch/__init__.py: =A0 =A0 =A0 =A0logger.error("The
> SRCREV_FORMAT variable must be set when multiple SCMs are used.")
> ../../bitbake/lib/bb/fetch/__init__.py: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0# =
We have to
> clear data's internal caches since the cached value of SRCREV is now
> wrong.
> ../../bitbake/lib/bb/fetch/__init__.py: =A0 =A0 =A0 =A0The fetcher suppor=
ts
> auto source revisions (SRCREV)
> ../../bitbake/lib/bb/fetch/__init__.py: =A0 =A0 =A0 =A0 =A0 =A0rev =3D
> data.getVar("SRCREV_pn-" + pn + "_" + ud.parm['name'], d, 1)
> ../../bitbake/lib/bb/fetch/__init__.py: =A0 =A0 =A0 =A0 =A0 =A0rev =3D
> data.getVar("SRCREV", d, 1)
> ../../bitbake/lib/bb/fetch/__init__.py: =A0 =A0 =A0 =A0 =A0 =A0raise
> InvalidSRCREV("Please set SRCREV to a valid value")
> ../../bitbake/lib/bb/fetch/__init__.py: =A0 =A0 =A0 =A0if rev is "SRCREVI=
NACTION":
> Binary file ../../bitbake/lib/bb/cache.pyc matches
> ../../bitbake/lib/bb/cache.py: =A0 =A0 =A0 =A0 =A0 =A0elif 'PV' in
> self.depends_cache[fn] and 'SRCREVINACTION' in
> self.depends_cache[fn]['PV']:
> ../../bitbake/lib/bb/cache.py: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0logger.erro=
r("Not
> caching %s as it had SRCREVINACTION in PV. Please report this bug",
> fn)
> ../../bitbake/lib/bb/cache.py: =A0 =A0 =A0 =A0if 'SRCREVINACTION' in pv:
> ../../bitbake/lib/bb/cache.py: =A0 =A0 =A0 =A0 =A0 =A0logger.info("Found
> SRCREVINACTION in PV (%s) or %s. Please report this bug.", pv,
> file_name)
>
>
> Kinda lost here, but I would expect bitbake not to generate the SRCREV
> =3D "1" if there is no SCM in the url (or not barf on it when it has
> generated the SRCREV assignment).
>
> Hope someone with better knowledge than me can solve or explain things
> (or, even better, both! )
>
> Frans
>


