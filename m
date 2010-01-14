Received: from fg-out-1718.google.com ([72.14.220.158])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1NVSuf-0001A1-Sy
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jan 2010 17:51:16 +0100
Received: by fg-out-1718.google.com with SMTP id 19so283090fgg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2010 08:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=2Arqm1+xzbE4x8j4lsGd+e6w5wOMeiLo/Mf15mtJVyw=;
	b=dwbNi9ObeajSNOa5xvbotK1TfsLtJbwwwSjG9UvTBh6iAVgA4x2ENiH9lPTinONO4q
	2C78+HsBbU1EUxFBlBHuggiuH8blfyEDEg3pe+Ant+DxkzQ7VePtrY57VlaglYCoO+tl
	GFZbMPO3O1D3ZXvB7e1qSOA1WwkxcuaXd0OXY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=EHkP5FtgYlbFr4QyDh0D86AKNOCZN2tZmURuMW/mBcdoSn8a9WFcsTfhOJqthj0qVt
	Jdxkv+0JGlPbvMuOx3+961wV+0mlLF3CY77h0X5XOCcEXzuMtDPbiEPjP8+yLaRrTqJI
	baXFf7VtGP+5S84fo63CDfQBJvae70r8W3t20=
MIME-Version: 1.0
Received: by 10.216.85.69 with SMTP id t47mr398386wee.107.1263487744583; Thu, 
	14 Jan 2010 08:49:04 -0800 (PST)
In-Reply-To: <4B4F1DB0.4010807@balister.org>
References: <1261629237-15118-1-git-send-email-raj.khem@gmail.com>
	<hgvcnd$9gv$1@ger.gmane.org>
	<19c1b8a90912240928p40d3c391ybb4289c6a987a5a4@mail.gmail.com>
	<4B33FFC4.2060803@balister.org>
	<f96d234e1001130700h10b931i479ebd1dd216ca77@mail.gmail.com>
	<4B4F1DB0.4010807@balister.org>
Date: Thu, 14 Jan 2010 11:49:04 -0500
Message-ID: <f96d234e1001140849n13a5e5bflfd6306a0bf2ebf72@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 72.14.220.158
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
X-List-Received-Date: Thu, 14 Jan 2010 16:51:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2010 at 8:35 AM, Philip Balister <philip@balister.org> wrot=
e:
> On 01/13/2010 10:00 AM, Cliff Brake wrote:
>> So what is the path forward on this issue?
>
> Try the top of the official u-boot repo, not the TI one. I keep meaning t=
o
> try this, but am not getting to it.

Not much better -- guess I'm simply build from the head of the repo
and go with that.  I'm still not understanding why everyone else is
able to fetch the snapshot from the angstrom mirror, and I'm not.
Before I dive into bitbake fetcher code, is anyone else having this
problem?

Thanks,
Cliff

cbrake@happy:/build/oe/oe-testing$ bitbake u-boot
NOTE: Handling BitBake files: - (7970/7970) [100 %]
NOTE: Parsing finished. 7322 cached, 346 parsed, 302 skipped, 2 masked.
NOTE: preferred version git of u-boot not available (for item u-boot)
NOTE: Resolving any missing task queue dependencies
NOTE: preferred version git of u-boot not available (for item u-boot)
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 850 of 868 (ID: 2,
/build/oe/oe-testing/openembedded/recipes/u-boot/u-boot_git.bb,
do_fetch)
Initialized empty Git repository in
/build/oe/oe-testing/downloads/git/git.denx.de.u-boot.git/.git/
From git://git.denx.de/u-boot
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
testing/bitbake/bin:/build/oe/oe-testing/bitbake/bin:/build/oe/oe-testing/b=
itbake/bin:/home/cbrake/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/b=
in:/sbin:/bin:/usr/games;
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


