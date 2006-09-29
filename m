Received: from [64.233.162.203] (helo=nz-out-0102.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <pmiscml@gmail.com>) id 1GTOh4-0004fo-Cj
	for openembedded-devel@openembedded.org; Fri, 29 Sep 2006 22:10:46 +0200
Received: by nz-out-0102.google.com with SMTP id v1so504657nzb
	for <openembedded-devel@openembedded.org>;
	Fri, 29 Sep 2006 13:05:38 -0700 (PDT)
Received: by 10.64.149.15 with SMTP id w15mr4296734qbd;
	Fri, 29 Sep 2006 13:05:38 -0700 (PDT)
Received: from CUBE ( [85.202.124.203])
	by mx.gmail.com with ESMTP id 37sm2721651nzf.2006.09.29.13.05.37;
	Fri, 29 Sep 2006 13:05:38 -0700 (PDT)
Date: Fri, 29 Sep 2006 23:05:41 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <11437084.20060929230541@gmail.com>
To: Koen Kooi <koen@dominion.kabel.utwente.nl>
In-Reply-To: <451D6EA3.5000609@dominion.kabel.utwente.nl>
References: <451D6EA3.5000609@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Cc: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
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
X-List-Received-Date: Fri, 29 Sep 2006 20:10:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Koen,

Friday, September 29, 2006, 10:06:11 PM, you wrote:


> OE Build Configuration:
> BB_VERSION     = "1.7.0"
> OE_REVISION    = "<unknown>"
> TARGET_ARCH    = "i686"
> TARGET_OS      = "linux"
> MACHINE        = "guinness"
> DISTRO         = "angstrom"
> DISTRO_VERSION = "test-20060929"
> TARGET_FPU     = ""

> NOTE: Resolving missing task queue dependencies
> NOTE: Removing failed runtime build target xserver-kdrive-fbdev
> ERROR: No providers of runtime build target xserver-kdrive after filtering (for
> ['/home/koen/OE/monotone/org.openembedded.dev/packages/xorg-xserver/xserver-kdrive_X11R7.1-1.1.0.bb'])
> NOTE: Removing failed runtime build target xserver-kdrive
> NOTE: Removing failed runtime build target virtual/xserver
> NOTE: Removing failed runtime build target angstrom-x11-base-depends
> NOTE: Removing failed runtime build target angstrom-gpe-task-pim
> NOTE: Removing failed runtime build target angstrom-gpe-task-settings
> NOTE: Removing failed runtime build target angstrom-gpe-task-base
> NOTE: multiple providers are available (xserver-xorg, xserver-kdrive-omap);
> NOTE: consider defining PREFERRED_PROVIDER_virtual/xserver
> NOTE: Removing failed runtime build target ipaq-sleep
> NOTE: Removing failed runtime build target suspend-desktop
> NOTE: Removing failed runtime build target gpe-conf
> NOTE: Preparing Runqueue
> NOTE: Executing runqueue
> NOTE: build 200609292052: completed
> Build statistics:
>   Attempted builds: 0

    Well, it's not easy to grasp anything form these messages. While I
hacked xserver-kdrive_X11R7.1-1.1.0.bb (rather, it's patches)
yesterday, that was to make it build (do_configure) for angstrom arm.

   What about suspecting --enable-w100 switch Michael Lauer had to
disable in xserver-kdrive_git.bb to make it build for x86?



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



