Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P9EtD-0002hT-IB
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 12:30:26 +0200
Received: by iwn6 with SMTP id 6so92205iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 03:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=Snzd3DJ1TCqrfRK28VYiliGojdZhx47Av71r6VrZzAQ=;
	b=IR7IOSC6fhngdh2lCUoObL/4MbRsrFT9OKXTzXzEYm9pz7roBM/eiS2MEO527964sT
	1BpsjP1iMzvbCgeKhWj8UioGU5noCfV2lsxbvBTr+PsG/Epwk/tSjJvSj6YuqsZsY78V
	VoqiWfLXSrQwQOrX5D/tQ5FTrvbxEGG68axog=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=k5pYAhFgfMellaL6DnTiEh6otfkTisQcIkjQ0PikDBFA2WPXS2Y/ucmRNoA2BykyOU
	YACh2x0Mc88ZmzH0m3Q03mPvtIS4aeTX6iSjOBIYotPlx2/VaF7J+qnOy+u8Md5UKuuQ
	u/fzTzaI1OWTLTyXV2j02AtuQoTnoomGw0I1k=
MIME-Version: 1.0
Received: by 10.231.161.16 with SMTP id p16mr2313384ibx.61.1287743385499; Fri,
	22 Oct 2010 03:29:45 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Fri, 22 Oct 2010 03:29:45 -0700 (PDT)
Date: Fri, 22 Oct 2010 12:29:45 +0200
Message-ID: <AANLkTi=H5ho=K4mvN6yVcwDxp+dsK8pg6RyMsi8BJ_Wv@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org, bitbake-dev@lists.berlios.de
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	WEIRD_PORT autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: SRCREV error
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
X-List-Received-Date: Fri, 22 Oct 2010 10:30:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

Not sure if this is an OE or bitbake error, so sending to both.

Triggered by the empty string discussion, I played a little bit with -e.

Target recipe was aircrack/aircrack_2.1.bb which reads:

SECTION = "console/network"
DESCRIPTION = "Aircrack is a set of tools for wep key statistical cracking"
HOMEPAGE = "http://www.cr0.net:8040/code/network/aircrack/"
LICENSE = "GPLv2"
DEPENDS = ""
PV="2.1"
PR ="r0"

SRC_URI = "http://archive.aircrack-ng.org/aircrack-old/${P}.tgz \
file://silent_patch.diff;striplevel=0"

SRC_URI[md5sum] = "694c6180f620b0534e5925a71b960bd1"
SRC_URI[sha256sum] =
"9b749d98278450b80153c1f82b7e253548a3f03603062dc98cc1320803d791da"

inherit autotools

do_install() {
        install -d ${D}/${sbindir}
        install -d ${D}/${libdir}/${PN}
        install -m 0755 802ether          ${D}/${sbindir}
        install -m 0755 airodump          ${D}/${sbindir}
        install -m 0755 aircrack          ${D}/${sbindir}
        install -m 0755 aireplay          ${D}/${sbindir}
        install -m 0755 hopper.sh          ${D}/${sbindir}
}

if I run bitbake -e on this recipe I get:

ERROR: SRCREV was used yet no valid SCM was found in SRC_URI
ERROR: SRCREV was used yet no valid SCM was found in SRC_URI
ERROR: SRCREV was used yet no valid SCM was found in SRC_URI
NOTE: <class 'bb.fetch.ParameterError'>: while evaluating:
${@bb.fetch.get_srcrev(d)}
ERROR: SRCREV was used yet no valid SCM was found in SRC_URI
NOTE: <class 'bb.fetch.ParameterError'>: while evaluating:
${@bb.fetch.get_srcrev(d)}
NOTE: <class 'bb.fetch.ParameterError'>: while evaluating:
${SRCPV}
# =/home/frans/workspace/bitbake-1.10.0/bin/bitbake
="/home/frans/workspace/bitbake-1.10.0/bin/bitbake"
...
# SRCREV=1
SRCREV="1"
...
                if "minrev" in parm:
                        srcrev = bb.data.getVar('SRCREV', d, 1)
                        if srcrev and srcrev < parm["minrev"]:
                                bb.note("Patch '%s' applies to later
revisions" % pname)
                                continue

                if "maxrev" in parm:
                        srcrev = bb.data.getVar('SRCREV', d, 1)
                        if srcrev and srcrev > parm["maxrev"]:
                                bb.note("Patch '%s' applies to earlier
revisions" % pname)
                                continue
...

I feel the ERROR message is not too appropriate, and I am not sure
where it comes from.

No one is defining it:

frans@frans-desktop:~/workspace/openembedded/recipes$ grep aircrack ../conf -r
../conf/distro/include/insane-srcrevs.inc:SRCREV_pn-aircrack-ng ?= "${AUTOREV}"

(note that that definition is for aircrack-ng, not aircrack_2.1 which
I am building)

And classes do not generate the code either as far as I can see:

frans@frans-desktop:~/workspace/openembedded/recipes$ grep aircrack
../classes -r
frans@frans-desktop:~/workspace/openembedded/recipes$ grep SRCREV ../classes -r
../classes/patch.bbclass:			srcrev = bb.data.getVar('SRCREV', d, 1)
../classes/patch.bbclass:			srcrev = bb.data.getVar('SRCREV', d, 1)		
../classes/gitpkgv.bbclass:# NN equals the total number of revs up to SRCREV
../classes/gitpkgv.bbclass:# GITHASH is SRCREV's (full) hash
../classes/gitpkgv.bbclass:# SRCREV. So ${GITPKGV} should never be
used in PV, only in PKGV.
../classes/gitpkgv.bbclass:# It can handle SRCREV = ${AUTOREV}, as
well as SRCREV = "<some fixed git hash>"
../classes/opie.bbclass:OPIE_SRCREV ?=
"8c3beef263bc9c34443eacfc821e99813e17554f"
../classes/opie.bbclass:OPIE_GIT_PV ?= "1.2.4+gitr${OPIE_SRCREV}"
../classes/lockdown.bbclass:	if "SRCREV" in bb.data.getVar("PV", d, False):
../classes/lockdown.bbclass:		print >> src_revs, 'SRCREV_pn-%(pn)s ?=
"%(rev)s"' % { 'pn' : pn, 'rev' : bb.data.getVar("SRCREV", d, True) }

The assingment is not from lib but I cannot find it in the bitbake dir
either (but maybe I am overlooking things there, I'm by no means a
python wiz).

frans@frans-desktop:~/workspace/openembedded/recipes$ grep SRCREV ../lib -r
frans@frans-desktop:~/workspace/openembedded/recipes$ grep SRCREV
../../bitbake -r
Binary file ../../bitbake/.git/objects/pack/pack-5ce6751d5a9a9ce8cd2fa963c5316fccd15eab89.pack
matches
../../bitbake/ChangeLog:	- Add SRCREV support for svn fetcher
../../bitbake/ChangeLog:	- Add BB_SRCREV_POLICY variable (clear or
cache) to control SRCREV cache
../../bitbake/ChangeLog:	- Add SRCREV_FORMAT support
../../bitbake/ChangeLog:	- SRCREV handling updates, improvements and
fixes from Poky
../../bitbake/ChangeLog:	- Raise an exception if SRCREV == 'INVALID'
../../bitbake/ChangeLog:	- When SRCREV autorevisioning for a recipe is
in use, don't cache the recipe
Binary file ../../bitbake/lib/bb/fetch/__init__.pyc matches
../../bitbake/lib/bb/fetch/svn.py:            # Should warn people to
switch to SRCREV here
../../bitbake/lib/bb/fetch/git.py:        if
bb.data.getVar("BB_GIT_CLONE_FOR_SRCREV", d, True):
Binary file ../../bitbake/lib/bb/fetch/git.pyc matches
../../bitbake/lib/bb/fetch/__init__.py:class InvalidSRCREV(Exception):
../../bitbake/lib/bb/fetch/__init__.py:    """Exception raised when an
invalid SRCREV is encountered"""
../../bitbake/lib/bb/fetch/__init__.py:    srcrev_policy =
bb.data.getVar('BB_SRCREV_POLICY', d, 1) or "clear"
../../bitbake/lib/bb/fetch/__init__.py:        logger.debug(1,
"Keeping SRCREV cache due to cache policy of: %s", srcrev_policy)
../../bitbake/lib/bb/fetch/__init__.py:        logger.debug(1,
"Clearing SRCREV cache due to cache policy of: %s", srcrev_policy)
../../bitbake/lib/bb/fetch/__init__.py:        raise
FetchError("Invalid SRCREV cache policy of: %s" % srcrev_policy)
../../bitbake/lib/bb/fetch/__init__.py:    In the multi SCM case, we
build a value based on SRCREV_FORMAT which must
../../bitbake/lib/bb/fetch/__init__.py:    # Ugly code alert.
localpath in the fetchers will try to evaluate SRCREV which
../../bitbake/lib/bb/fetch/__init__.py:    # "SRCREVINACTION" return value.
../../bitbake/lib/bb/fetch/__init__.py:        return "SRCREVINACTION"
../../bitbake/lib/bb/fetch/__init__.py:        logger.error("SRCREV
was used yet no valid SCM was found in SRC_URI")
../../bitbake/lib/bb/fetch/__init__.py:    if
bb.data.getVar('BB_SRCREV_POLICY', d, True) != "cache":
../../bitbake/lib/bb/fetch/__init__.py:    # Mutiple SCMs are in
SRC_URI so we resort to SRCREV_FORMAT
../../bitbake/lib/bb/fetch/__init__.py:    format =
bb.data.getVar('SRCREV_FORMAT', d, 1)
../../bitbake/lib/bb/fetch/__init__.py:        logger.error("The
SRCREV_FORMAT variable must be set when multiple SCMs are used.")
../../bitbake/lib/bb/fetch/__init__.py:                # We have to
clear data's internal caches since the cached value of SRCREV is now
wrong.
../../bitbake/lib/bb/fetch/__init__.py:        The fetcher supports
auto source revisions (SRCREV)
../../bitbake/lib/bb/fetch/__init__.py:            rev =
data.getVar("SRCREV_pn-" + pn + "_" + ud.parm['name'], d, 1)
../../bitbake/lib/bb/fetch/__init__.py:            rev =
data.getVar("SRCREV", d, 1)
../../bitbake/lib/bb/fetch/__init__.py:            raise
InvalidSRCREV("Please set SRCREV to a valid value")
../../bitbake/lib/bb/fetch/__init__.py:        if rev is "SRCREVINACTION":
Binary file ../../bitbake/lib/bb/cache.pyc matches
../../bitbake/lib/bb/cache.py:            elif 'PV' in
self.depends_cache[fn] and 'SRCREVINACTION' in
self.depends_cache[fn]['PV']:
../../bitbake/lib/bb/cache.py:                logger.error("Not
caching %s as it had SRCREVINACTION in PV. Please report this bug",
fn)
../../bitbake/lib/bb/cache.py:        if 'SRCREVINACTION' in pv:
../../bitbake/lib/bb/cache.py:            logger.info("Found
SRCREVINACTION in PV (%s) or %s. Please report this bug.", pv,
file_name)


Kinda lost here, but I would expect bitbake not to generate the SRCREV
= "1" if there is no SCM in the url (or not barf on it when it has
generated the SRCREV assignment).

Hope someone with better knowledge than me can solve or explain things
(or, even better, both! )

Frans


