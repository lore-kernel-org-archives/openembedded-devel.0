Received: from smtp205.alice.it ([82.57.200.101])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1PHaKo-0004hV-Jm
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Nov 2010 12:01:22 +0100
Received: from [192.168.1.178] (95.232.144.102) by smtp205.alice.it
	(8.5.124.08) (authenticated as editempo)
	id 4C1A26450A5700CE for openembedded-devel@lists.openembedded.org;
	Sun, 14 Nov 2010 12:00:17 +0100
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1289521075-13563-1-git-send-email-angelox.123@gmail.com>
References: <angelox.123@gmail.com>
	<1289521075-13563-1-git-send-email-angelox.123@gmail.com>
Date: Sun, 14 Nov 2010 12:00:15 +0100
Message-ID: <1289732415.3037.9.camel@gnutoo-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-SA-Exim-Connect-IP: 82.57.200.101
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=AWL,BAYES_00,FS_WILL_HELP
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] metano.conf - Added on image file name the IMAGE_BASENAME * Added IMAGE_BASENAME on Metano Distro configuration file on IMAGE_NAME * This will help we to identify the names of our images :) * By: angelox_123 (from IRC #metano_linux), developer and mainteiner of Metano Distro
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
X-List-Received-Date: Sun, 14 Nov 2010 11:01:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-11-11 at 22:17 -0200, angelox_123 wrote:
>  CACHE = "${TMPDIR}/cache/${LIBC}/${MACHINE}"
>  DEPLOY_DIR ?= "${TMPDIR}/deploy/${LIBC}"
> @@ -119,12 +119,9 @@ DISTRO_EXTRA_RRECOMMENDS += " \
>      kernel-module-ext2 \
>      kernel-module-ext3 \
>      kernel-module-af-packet \
> -    mplayer \
>      alsa-lib \
>      alsa-utils \
>      nano \
> -    gpe-filemanager \
> -    gpe-mini-browser \
>      ${XSERVER} \
>      avahi-daemon \
>      avahi-autoipd \
Are you removing mplayer because of some do_rootfs issues with iwmmxt on
a1200?
If I remember well here was the issue:
do_rootfs didn't find mplayer because it didn't look in iwmmxt.

iwmmxt is a package extra arch:
PACKAGE_EXTRA_ARCHS += "iwmmxt" is in
conf/machine/include/motorola-ezx-base.inc which is required by
a1200.conf

Denis.




