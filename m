Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JdNy9-0006OM-K0
	for openembedded-devel@openembedded.org; Sun, 23 Mar 2008 12:02:34 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JdNy4-0007ln-Ik
	for openembedded-devel@openembedded.org; Sun, 23 Mar 2008 11:02:24 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 23 Mar 2008 11:02:24 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 23 Mar 2008 11:02:24 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Sun, 23 Mar 2008 12:02:13 +0100
Message-ID: <fs5dbl$n1g$1@ger.gmane.org>
References: <BDAD3E9D-ACB9-433B-81C7-F727545ACCFE@student.utwente.nl>	<200803180849.21108.geoffrey@pager.net>	<frojpb$m6j$1@ger.gmane.org>	<1205858910.7500.39.camel@dax.rpnet.com>	<frosov$c0b$1@ger.gmane.org>	<47E5A67B.5030809@dls.net>
	<47E5E7DD.4030304@dls.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <47E5E7DD.4030304@dls.net>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] move to opkg
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 23 Mar 2008 11:02:34 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Mike (mwester) schreef:
| Here's what I've found out: There is no such thing as a
| "PREFERRED_VERSION" or "PREFERRED_PROVIDER" solution for this ipkg/opkg
| problem.  A simple grep tells us why (some random lines I picked out of
| the output from grep):
|
| classes/image.bbclass:          echo "src/gz local-$arch
| ${FEED_DEPLOYDIR_BASE_URI}/$arch" >>
| ${IMAGE_ROOTFS}/etc/opkg/local-$arch-feed.conf
| classes/rootfs_ipk.bbclass:                     opkg-cl ${IPKG_ARGS}
| flag unpacked `basename $i .postinst`
|
| etc, etc -- it's pretty clear that opkg is hardcoded all over the place.

And that used to be ipkg hardcoded all over the place.

| So it seems that everyone *MUST* comply, and migrate to opkg -- unless
| you want to just freeze your distro on an old version of OE.

Or use the stable branch? The stable branch seems to fit your needs:
It's available, it's maintained and changes can only go in through a
public and open review process.

| Now after several hours trying to figure out what to do with this opkg
| stuff, it seems that there's something that is supposed to make
| compatability possible, although there are no documents anywhere on this
| .  So I added opkg-ipkg-compat to task-slugos.bb, and bumped the PR.

opkg-ipkg-compat is to make opkg work on an ipkg system, not the other
way around. What you are after is something that symlinks /usr/lib/opkg
- -> /usr/lib/ipkg, /etc/opkg -> /etc/ipkg, adds opkg to PACKAGE_REMOVE
(like in liveramdisk-image.bb) etc

| A) Where are the docs on opkg?

Mickeyl sent a mail to this list about that over a month ago.

| B) How does one modify distros to live in the new world order that's
| been decreed?

Dunno, that's up to the distro maintainer. I can only say "look at poky"
or "look at angstrom"

| And in the long term:
| How do we go about setting up fixing all this opkg stuff so that we
| properly abstract it, allowing a distro to select ipkg, opkg, upkg, and
| sometimes-ypkg that they desire?

You mean something like ANGSTROM_PKG_FORMAT angstrom has?

I believe these sorts of problems stem from the fact that you don't have
the time to keep up with the pace of .dev, so I really think distros
like unslung are better of using the stable branch, instead of wasting
energy trying to keep up with .dev.
That being said, I don't think OE developers sit at their desks trying
to thinks how to make life difficult for distro maintainer.

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH5ji1MkyGM64RGpERAleXAKCG6zs+uvNe2GoQ4yA6bSxsqkBFPgCgjbiV
TTQcY/o1f7WLjd276t2S+Lo=
=PsdH
-----END PGP SIGNATURE-----



