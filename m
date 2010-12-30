Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PYNGJ-000718-4D
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Dec 2010 19:30:07 +0100
Received: by iyj18 with SMTP id 18so10441203iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Dec 2010 10:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=4dK7i+GGJ/xdJuv1dw43ijW2f+3qKYoh546VXSBcTFM=;
	b=OdjbnRHxm8hv7RF76lvaE6+8TGR9HA5vkvVDJ1SB8KzrvRMF5e16jRQBtJi6eGEp15
	LbqG2YDF61JQA7TT1kdvSztzhUJYZD+089KDbWaAiWcsgOQRCVkb39AFeLGinWTDpYcB
	fDyr041b0cyiFv8RLyuY9MBAyQx99Ehz2ABTc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=AGEusa7Kn7CXLJvZWTfdszebNdtAhbJBILUUVRVeB05zQvvIhXcYuDhbSVbUJCfQ0+
	K4nJYNiyvKTZAyog9VNGFI8YZb7S9nE4lClFMqx4cTJEjDh5PB+iBCw2d8k5Vj/jQJoS
	CKbmFumsH1RVqndoa4cd3wn32YPLs5GtZldoM=
MIME-Version: 1.0
Received: by 10.231.182.13 with SMTP id ca13mr166950ibb.57.1293733789070; Thu,
	30 Dec 2010 10:29:49 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Thu, 30 Dec 2010 10:29:49 -0800 (PST)
Date: Thu, 30 Dec 2010 19:29:49 +0100
Message-ID: <AANLkTikxUP2WpUeaX19vu8wMecM4MHDQHh0wKArdQ_o+@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org, Bitbake-de@lists.berlios.de
Subject: bitbake oddity, wong kernel
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
X-List-Received-Date: Thu, 30 Dec 2010 18:30:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

Got this today with OE git head of today and bitbake git head of today.
Note that I am building for haowkboard, still somehow it wants to
remove the linux-nios2 recipe.
However virtual kernel is not using the nios2 kernel.
from the conf/machine/include/davinci.inc  file:
PREFERRED_PROVIDER_virtual/kernel = "linux-davinci"

removing $TMPDIR/cache did not help.
host is opensuse 11.3 (i686)

Puzzled, Frans


frans@linux-suse:~/oe> bitbake -cclean virtual/kernel
Loading cache: 100%
|##############################################################################|
ETA:  00:00:00
Loaded 7218 entries from dependency cache.
Parsing recipes: 100%
|############################################################################|
Time: 00:00:24
Parsing of 7273 .bb files complete (6526 cached, 747 parsed). 7977
targets, 317 skipped, 0 masked, 0 errors.

Build Configuration:
BB_VERSION        = "1.11.0"
METADATA_BRANCH   = "org.openembedded.dev"
METADATA_REVISION = "b04d637"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "hawkboard"
DISTRO            = "minimal"
DISTRO_VERSION    = "dev-snapshot-20101230"
TARGET_FPU        = "soft"

NOTE: Resolving any missing task queue dependencies
ERROR: Nothing PROVIDES 'virtual/arm-oe-linux-gnueabi-depmod-None'
ERROR: Nothing RPROVIDES 'virtual/arm-oe-linux-gnueabi-depmod-None'
NOTE: Runtime target 'virtual/arm-oe-linux-gnueabi-depmod-None' is
unbuildable, removing...
Missing or unbuildable dependency chain was:
['virtual/arm-oe-linux-gnueabi-depmod-None']
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 1 of 1 (ID: 0,
/home/frans/oe/openembedded/recipes/linux/linux-nios2_2.6.34.bb,
do_clean)
NOTE: package linux-nios2-2.6.34-r50: task do_clean: Started
NOTE: removing tmp_minimal/work/hawkboard-oe-linux-gnueabi/linux-nios2-2.6.34-r50
NOTE: removing tmp_minimal/stamps/hawkboard-oe-linux-gnueabi/linux-nios2-2.6.34-r50.*
NOTE: package linux-nios2-2.6.34-r50: task do_clean: Succeeded
NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be
rerun and 0 failed.
frans@linux-suse:~/oe> cd openembedded/


