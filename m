Received: from fg-out-1718.google.com ([72.14.220.157])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1NV4jt-0000M1-Td
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 16:02:32 +0100
Received: by fg-out-1718.google.com with SMTP id e12so402483fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2010 07:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=7rBp0ElEaRqcunu4Wfr7m/8KjpvXA1KLHP9pzqYq63U=;
	b=mcY7w+yao6Oa7/3tnzEyaHgib2nea9DibloJUGgIic7efjYenAzYylTgDTkiIyXeCz
	x4e0FwRGrj/pDus3jDh9IjNllU/SPEdV9Unaczpf2uQC67IdoKkYmHWVsv+tRbZm1CFH
	QpcDxvT6SOIATQLkaXJ7SwM1ZBk4s0nmitkfU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=rsvJYFXYGHzTGlbmdw+ZPT9OheIEGTubm7E/O7Xf1O4xNw5ssj+P+Vcn+Wu6rHKtA0
	d/xVEcNfLRHTK/ma6re+/8Aprq7TXs7ItAEjsdRruOJVSYeJWlso472WlgjTG2MJOgrE
	1454O3gQEqRWBjG69gqBZbcE1RznpRC2eby30=
MIME-Version: 1.0
Received: by 10.216.89.141 with SMTP id c13mr374999wef.66.1263394821580; Wed, 
	13 Jan 2010 07:00:21 -0800 (PST)
In-Reply-To: <4B33FFC4.2060803@balister.org>
References: <1261629237-15118-1-git-send-email-raj.khem@gmail.com>
	<hgvcnd$9gv$1@ger.gmane.org>
	<19c1b8a90912240928p40d3c391ybb4289c6a987a5a4@mail.gmail.com>
	<4B33FFC4.2060803@balister.org>
Date: Wed, 13 Jan 2010 10:00:21 -0500
Message-ID: <f96d234e1001130700h10b931i479ebd1dd216ca77@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 72.14.220.157
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 1/2] u-boot_git.bb: Change SRC_URI to a valid location for beagleboard.
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
X-List-Received-Date: Wed, 13 Jan 2010 15:02:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 24, 2009 at 6:56 PM, Philip Balister <philip@balister.org> wrot=
e:
> On 12/24/2009 12:28 PM, Khem Raj wrote:
>>
>> On Thu, Dec 24, 2009 at 1:36 AM, Koen Kooi<k.kooi@student.utwente.nl>
>> =A0wrote:
>>>
>>> -----BEGIN PGP SIGNED MESSAGE-----
>>> Hash: SHA1
>>>
>>> NAK, uboot_git.bb should fetch from git.
>>
>> It was intermediate solution measure because I could not track this
>> commit-id which is in SRCREV for beagle anywhere in git trees. If
>> anyone knows where this commit exist or where this got rebased to then
>> we can add that
>> secondly at present even for angstrom its fetching snapshot so
>> essentially its is not what a git recipe should do either.
>
> We understand your reasoning, but the correct fix is to move from the rep=
o
> that "lost" the commit to a more stable repo. I'm told the HEAD of the
> u-boot repo might work. When I am back from the holidays, I can help reso=
lve
> this issue.

So what is the path forward on this issue?

NOTE: Running task 850 of 868 (ID: 2,
/build/oe/oe-testing/openembedded/recipes/u-boot/u-boot_git.bb,
do_fetch)
Initialized empty Git repository in
/build/oe/oe-testing/downloads/git/git.denx.de.u-boot-ti.git/.git/
From git://git.denx.de/u-boot-ti
 * branch            master     -> FETCH_HEAD
NOTE: Creating tarball of git repository
fatal: failed to unpack tree object a5cf522a91ba479d459f8221135bdb3e9ae9747=
9
NOTE: Task failed: Fetch failed: Fetch command export
HOME=3D/home/cbrake; export
SSH_AUTH_SOCK=3D/tmp/keyring-f5gZsP/socket.ssh; export
PATH=3D/build/oe/oe-testing/build/angstrom-2008.1/tmp/staging/x86_64-linux/=
usr/bin/beagleboard-angstrom-linux-gnueabi:/build/oe/oe-testing/build/angst=
rom-2008.1/tmp/staging/x86_64-linux/usr/bin/armv7a-angstrom-linux-gnueabi:/=
build/oe/oe-testing/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/sbin=
:/build/oe/oe-testing/build/angstrom-2008.1/tmp/staging/x86_64-linux/usr/bi=
n:/build/oe/oe-testing/build/angstrom-2008.1/tmp/cross/armv7a//bin:/build/o=
e/oe-testing/build/angstrom-2008.1/tmp/staging/x86_64-linux/sbin:/build/oe/=
oe-testing/build/angstrom-2008.1/tmp/staging/x86_64-linux/bin:/build/oe/oe-=
testing/bitbake/bin:/build/oe/oe-testing/bitbake/bin:/home/cbrake/bin:/usr/=
local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games;
git read-tree a5cf522a91ba479d459f8221135bdb3e9ae97479 failed with
signal 128, output:
fatal: failed to unpack tree object a5cf522a91ba479d459f8221135bdb3e9ae9747=
9

ERROR: TaskFailed event exception, aborting
ERROR: Build of
/build/oe/oe-testing/openembedded/recipes/u-boot/u-boot_git.bb
do_fetch failed
ERROR: Task 2 (/build/oe/oe-testing/openembedded/recipes/u-boot/u-boot_git.=
bb,
do_fetch) failed
NOTE: Tasks Summary: Attempted 849 tasks of which 849 didn't need to
be rerun and 1 failed.
ERROR: '/build/oe/oe-testing/openembedded/recipes/u-boot/u-boot_git.bb' fai=
led

Even though I'm building Angstrom, it does not seem to be fetching
from the mirror.  From bitbake -e, it seems the angstrom mirrors are
enabled (see below).

Thanks,
Cliff

MIRRORS() {
ftp://ftp.debian.org/debian/pool/main	http://snapshot.debian.net/archive/po=
ol
ftp://ftp.debian.org/debian/pool	ftp://ftp.de.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.au.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.cl.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.hr.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.fi.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.hk.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.hu.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.ie.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.it.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.jp.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.no.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.pl.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.ro.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.si.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.es.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.se.debian.org/debian/pool
ftp://ftp.debian.org/debian/pool	ftp://ftp.tr.debian.org/debian/pool
ftp://ftp.gnu.org/gnu	ftp://mirrors.kernel.org/gnu
ftp://ftp.gnu.org/gnu	ftp://ftp.cs.ubc.ca/mirror2/gnu
ftp://ftp.gnu.org/gnu	ftp://sunsite.ust.hk/pub/gnu
ftp://ftp.gnu.org/gnu	ftp://ftp.ayamura.org/pub/gnu
http://kernel.org	http://www.kernel.org/pub
http://kernel.org	ftp://ftp.us.kernel.org/pub
http://kernel.org	ftp://ftp.uk.kernel.org/pub
http://kernel.org	ftp://ftp.hk.kernel.org/pub
http://kernel.org	ftp://ftp.au.kernel.org/pub
http://kernel.org	ftp://ftp.jp.kernel.org/pub
ftp://ftp.gnupg.org/gcrypt/
ftp://ftp.franken.de/pub/crypt/mirror/ftp.gnupg.org/gcrypt/
ftp://ftp.gnupg.org/gcrypt/     ftp://ftp.surfnet.nl/pub/security/gnupg/
ftp://ftp.gnupg.org/gcrypt/     http://gulus.USherbrooke.ca/pub/appl/GnuPG/
ftp://dante.ctan.org/tex-archive ftp://ftp.fu-berlin.de/tex/CTAN
ftp://dante.ctan.org/tex-archive http://sunsite.sut.ac.jp/pub/archives/ctan=
/
ftp://dante.ctan.org/tex-archive http://ctan.unsw.edu.au/
ftp://ftp.gnutls.org/pub/gnutls ftp://ftp.gnutls.org/pub/gnutls/
ftp://ftp.gnutls.org/pub/gnutls ftp://ftp.gnupg.org/gcrypt/gnutls/
ftp://ftp.gnutls.org/pub/gnutls
http://www.mirrors.wiretapped.net/security/network-security/gnutls/
ftp://ftp.gnutls.org/pub/gnutls
ftp://ftp.mirrors.wiretapped.net/pub/security/network-security/gnutls/
ftp://ftp.gnutls.org/pub/gnutls http://josefsson.org/gnutls/releases/
http://ftp.info-zip.org/pub/infozip/src/
http://mirror.switch.ch/ftp/mirror/infozip/src/
http://ftp.info-zip.org/pub/infozip/src/
ftp://sunsite.icm.edu.pl/pub/unix/archiving/info-zip/src/
ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/
ftp://ftp.cerias.purdue.edu/pub/tools/unix/sysutils/lsof/
ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/
ftp://ftp.tau.ac.il/pub/unix/admin/
ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/
ftp://ftp.cert.dfn.de/pub/tools/admin/lsof/
ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/
ftp://ftp.fu-berlin.de/pub/unix/tools/lsof/
ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://ftp.kaizo.org/pub/ls=
of/
ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/
ftp://ftp.tu-darmstadt.de/pub/sysadmin/lsof/
ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/
ftp://ftp.tux.org/pub/sites/vic.cc.purdue.edu/tools/unix/lsof/
ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/
ftp://gd.tuwien.ac.at/utils/admin-tools/lsof/
ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/
ftp://sunsite.ualberta.ca/pub/Mirror/lsof/
ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/
ftp://the.wiretapped.net/pub/security/host-security/lsof/
http://www.apache.org/dist  http://archive.apache.org/dist
ftp://.*/.*     http://mirrors.openembedded.org/
https?$://.*/.* http://mirrors.openembedded.org/
ftp://.*/.*     http://sources.openembedded.org/
https?$://.*/.* http://sources.openembedded.org/

ftp://.*/.*	http://www.angstrom-distribution.org/unstable/sources/
https?$://.*/.*	http://www.angstrom-distribution.org/unstable/sources/

}


