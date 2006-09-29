Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GTOuK-00013Y-4y
	for openembedded-devel@openembedded.org; Fri, 29 Sep 2006 22:24:28 +0200
Received: from [130.89.7.61] (vpn007061.vpn.utwente.nl [130.89.7.61])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	k8TKJFfd027183 for <openembedded-devel@openembedded.org>;
	Fri, 29 Sep 2006 22:19:16 +0200
Message-ID: <451D7FC2.8070600@dominion.kabel.utwente.nl>
Date: Fri, 29 Sep 2006 22:19:14 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.7 (Macintosh/20060909)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
References: <451D6EA3.5000609@dominion.kabel.utwente.nl>
	<11437084.20060929230541@gmail.com>
In-Reply-To: <11437084.20060929230541@gmail.com>
X-Enigmail-Version: 0.94.1.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: Did someone break X ?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Sep 2006 20:24:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Paul Sokolovsky schreef:
> Hello Koen,
> 
> Friday, September 29, 2006, 10:06:11 PM, you wrote:
> 
> 
>> OE Build Configuration:
>> BB_VERSION     = "1.7.0"
>> OE_REVISION    = "<unknown>"
>> TARGET_ARCH    = "i686"
>> TARGET_OS      = "linux"
>> MACHINE        = "guinness"
>> DISTRO         = "angstrom"
>> DISTRO_VERSION = "test-20060929"
>> TARGET_FPU     = ""
> 
>> NOTE: Resolving missing task queue dependencies
>> NOTE: Removing failed runtime build target xserver-kdrive-fbdev
>> ERROR: No providers of runtime build target xserver-kdrive after filtering (for
>> ['/home/koen/OE/monotone/org.openembedded.dev/packages/xorg-xserver/xserver-kdrive_X11R7.1-1.1.0.bb'])
>> NOTE: Removing failed runtime build target xserver-kdrive
>> NOTE: Removing failed runtime build target virtual/xserver
>> NOTE: Removing failed runtime build target angstrom-x11-base-depends
>> NOTE: Removing failed runtime build target angstrom-gpe-task-pim
>> NOTE: Removing failed runtime build target angstrom-gpe-task-settings
>> NOTE: Removing failed runtime build target angstrom-gpe-task-base
>> NOTE: multiple providers are available (xserver-xorg, xserver-kdrive-omap);
>> NOTE: consider defining PREFERRED_PROVIDER_virtual/xserver
>> NOTE: Removing failed runtime build target ipaq-sleep
>> NOTE: Removing failed runtime build target suspend-desktop
>> NOTE: Removing failed runtime build target gpe-conf
>> NOTE: Preparing Runqueue
>> NOTE: Executing runqueue
>> NOTE: build 200609292052: completed
>> Build statistics:
>>   Attempted builds: 0
> 
>     Well, it's not easy to grasp anything form these messages. While I
> hacked xserver-kdrive_X11R7.1-1.1.0.bb (rather, it's patches)
> yesterday, that was to make it build (do_configure) for angstrom arm.
> 
>    What about suspecting --enable-w100 switch Michael Lauer had to
> disable in xserver-kdrive_git.bb to make it build for x86?

Mickeyl had a problem *during* build, OE isn't letting me *start* a build right now, while
it did do that yesterday. I looks like something changed with (R)DEPENDS.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD8DBQFFHX+PMkyGM64RGpERAhCKAKC4IVkByqNkxeMp5c1Oh2KkjdsYSgCgkNLs
QF8wJjTNgtfnm6ahi1edPq8=
=6iw2
-----END PGP SIGNATURE-----


