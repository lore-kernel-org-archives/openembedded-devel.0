Received: from [209.85.221.172] (helo=mail-qy0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bjorn.forsman@gmail.com>) id 1MLc2q-0002CF-Bv
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Jun 2009 14:02:40 +0200
Received: by qyk2 with SMTP id 2so64263qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jun 2009 04:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=LhQEFTku05fQnrukuahGDj8oDcEFwKi2vcABAaorGlw=;
	b=V/nPWDYPNEgDv7fNlDTzp+EMXCbFb7SDXVVn5ORAOzkWWV4X2KE/4CesC2mb1iIurB
	b8QnE4lrpPrnJspACM/p14x6E2woEl5sSR7PrHWVwEtConeuwcqr+BS50qTkORoQD+6R
	R2TcA1gNfD3MfK5VtDWP+CnoE4ICUYAF0v5hU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=t3aS0SJqXu5q4aqizixmZdKmkvmQHN+W6Kv+4fr0opiNEinOxiNO09DNPhI/54CpDY
	lbkSw9D/V03OQAZRhw2kxSMztmu3zU0W0g1VUDrnz0ifI6bpcyQC0M+xOPiqsLp9WKDy
	wcmwmUYSOVtBj6cACYFSNk5RGdqxcseCpGDBs=
MIME-Version: 1.0
Received: by 10.229.110.6 with SMTP id l6mr1723689qcp.52.1246362283990; Tue, 
	30 Jun 2009 04:44:43 -0700 (PDT)
Date: Tue, 30 Jun 2009 13:44:43 +0200
Message-ID: <5f2b60906300444w31cdcf67o6b3eeab0d1fb85ab@mail.gmail.com>
From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: bitbake virtual/kernel fails for davinci
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
X-List-Received-Date: Tue, 30 Jun 2009 12:02:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I am a bit new to OpenEmbedded, but have successfully built angstrom
for davinci and qemu in the past. Today I tried to "bitbake
virtual/kernel" for a davinci (dm6446) system. The build fails during
unpack of linux-davinci kernel because git cannot find a given object
hash (see output below). Has anybody else experienced this? How come
OE references a non-existent git object?

The non-existent git object hash is specified in
"recipes/linux/linux-davinci_git.bb" and was lastly modified by commit
160616d5f2a57ba828ed5ec06e37fc1cd4713af7.

---------------------------------------------------------------
$ bitbake virtual/kernel

[snipped]

From git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-davinci
 * [new tag]         v2.6.29    -> v2.6.29
 * [new tag]         v2.6.29-davinci1 -> v2.6.29-davinci1
 * [new tag]         v2.6.29-omap1 -> v2.6.29-omap1
 * [new tag]         v2.6.29-rc5 -> v2.6.29-rc5
 * [new tag]         v2.6.29-rc6 -> v2.6.29-rc6
 * [new tag]         v2.6.29-rc7 -> v2.6.29-rc7
 * [new tag]         v2.6.29-rc8 -> v2.6.29-rc8
 * [new tag]         v2.6.30    -> v2.6.30
 * [new tag]         v2.6.30-davinci1 -> v2.6.30-davinci1
 * [new tag]         v2.6.30-rc1 -> v2.6.30-rc1
 * [new tag]         v2.6.30-rc2 -> v2.6.30-rc2
 * [new tag]         v2.6.30-rc3 -> v2.6.30-rc3
 * [new tag]         v2.6.30-rc4 -> v2.6.30-rc4
 * [new tag]         v2.6.30-rc5 -> v2.6.30-rc5
 * [new tag]         v2.6.30-rc6 -> v2.6.30-rc6
 * [new tag]         v2.6.30-rc7 -> v2.6.30-rc7
 * [new tag]         v2.6.30-rc8 -> v2.6.30-rc8
NOTE: Creating tarball of git repository
fatal: failed to unpack tree object 03022e38318bef016836dae71c70b9ea975723e=
7
NOTE: Task failed: Fetch failed: Fetch command export
HOME=3D/home/bjornfor; export
SSH_AUTH_SOCK=3D/tmp/keyring-f2gNsd/socket.ssh; export
PATH=3D/home/bjornfor/dev/oe-stuff/build/tmp/staging/i686-linux/usr/bin/dm6=
446-evm-angstrom-linux-gnueabi:/home/bjornfor/dev/oe-stuff/build/tmp/stagin=
g/i686-linux/usr/bin/armv5te-angstrom-linux-gnueabi:/home/bjornfor/dev/oe-s=
tuff/build/tmp/staging/i686-linux/usr/sbin:/home/bjornfor/dev/oe-stuff/buil=
d/tmp/staging/i686-linux/usr/bin:/home/bjornfor/dev/oe-stuff/build/tmp/cros=
s/armv5te/bin:/home/bjornfor/dev/oe-stuff/build/tmp/staging/i686-linux/sbin=
:/home/bjornfor/dev/oe-stuff/build/tmp/staging/i686-linux/bin:/home/bjornfo=
r/dev/oe-stuff/bitbake/bin:/home/bjornfor/dev/sb2/bin:/home/bjornfor/bin:/u=
sr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home=
/bjornfor/dev/arm-2008q3/bin:/opt/mv_pro_5.0/montavista/pro/devkit/arm/v5t_=
le/bin:/home/bjornfor/bin;
git read-tree 03022e38318bef016836dae71c70b9ea975723e7 failed with
signal 128, output:
fatal: failed to unpack tree object 03022e38318bef016836dae71c70b9ea975723e=
7

ERROR: TaskFailed event exception, aborting
ERROR: Build of
/home/bjornfor/dev/oe-stuff/openembedded/recipes/linux/linux-davinci_git.bb
do_fetch failed
---------------------------------------------------------------

Regards,
Bj=C3=B8rn Forsman


