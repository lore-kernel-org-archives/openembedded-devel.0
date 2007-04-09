Received: from [64.233.184.234] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <papercrane@gmail.com>) id 1Hax6h-0007ZV-UW
	for openembedded-devel@openembedded.org; Mon, 09 Apr 2007 18:52:44 +0200
Received: by wr-out-0506.google.com with SMTP id 37so974544wra
	for <openembedded-devel@openembedded.org>;
	Mon, 09 Apr 2007 09:52:43 -0700 (PDT)
Received: by 10.114.205.1 with SMTP id c1mr2420001wag.1176137562571;
	Mon, 09 Apr 2007 09:52:42 -0700 (PDT)
Received: by 10.115.91.8 with HTTP; Mon, 9 Apr 2007 09:52:42 -0700 (PDT)
Message-ID: <432beae0704090952u55847886o5eca96007a2d22be@mail.gmail.com>
Date: Mon, 9 Apr 2007 09:52:42 -0700
From: "Justin Patrin" <papercrane@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <evcm2e$15q$1@sea.gmane.org>
MIME-Version: 1.0
References: <evcm2e$15q$1@sea.gmane.org>
Cc: openembedded-devel@openembedded.org
Subject: Re: OE a deterministic build system?
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
X-List-Received-Date: Mon, 09 Apr 2007 16:52:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 4/8/07, Rolf Leggewie <no2spam@nospam.arcornews.de> wrote:
> Hi,
>
> I am pulling my hair out and losing faith in OE being a deterministic
> build system.  As documented in bug 1568, I have not been able to build
> nunome for about half a year now.  When I asked hrw for help in fixing
> it , I was quite surprised for him to come back and say "Built fine for
> me". This success was later repeated by psokolovsky.  Alas, I can't.
>
> In my futile attempts on finding where I screwed this up, I further and
> further "virginized" my OE installation until I reinstalled, but even
> that did not help (going by GettingStarted here).
>
>    1. openembedded-essential has long since been installed
>    2. rm -Rf ~/oe && mkdir -p ~/oe/build/conf && cd ~/oe
>    3. svn co
>       http://svn.berlios.de/svnroot/repos/bitbake/branches/bitbake-1.8/
>       bitbake
>    4. wget http://www.openembedded.org/snapshots/OE.mtn.bz2
>    5. bunzip2 <OE.mtn.bz2 >oe.mtn

Do you do an "mtn --db=./OE.mtn pull openembedded.org
org.openembedded.dev" here?

>    6. mtn --db=./OE.mtn checkout --branch=org.openembedded.dev
>    7. My local.conf is absolutely bare and unspectucular
>
>       DL_DIR = "${HOME}/oe/sources"
>       BBFILES = "${HOME}/oe/org.openembedded.dev/packages/*/*.bb"
>       BBMASK = ""
>       MACHINE ?= "spitz"
>       DISTRO = "angstrom-2007.1-oabi"
>       ENABLE_BINARY_LOCALE_GENERATION = "0"
>       ASSUME_PROVIDED += "qemu-native"
>       GLIBC_GENERATE_LOCALES = "en_GB.UTF-8 de_DE.UTF-8"
>       IMAGE_FSTYPES = "jffs2 tar"
>       PARALLEL_MAKE = "-j 3"
>       BBINCLUDELOGS = "yes"
>       PALMTOP_USE_MULTITHREADED_QT = "yes"
>
>    8. set up the environment with
>
>       export PATH=/home/rolf/oe/bitbake/bin/:$PATH && export
>       BBPATH=/home/rolf/oe/build/:/home/rolf/oe/org.openembedded.dev/
>
>    9. "bitbake qte-mt && bitbake nunome" then fails with the same old
>       error of "undefined reference to `main'" as always ->
>       http://bugs.openembedded.org/attachment.cgi?id=1335
>
> Now, I really wonder what causes this virgin build to fail for me when
> it seems everybody else can happily build it?  Is OE not deterministic?
> Hints and discussion welcome.
>

Of course it's deterministic....you do get the same error every time,
don't you? Sounds like it's a difference between your system and
everyone else's. I'll try a build myself with almost your exact
local.conf and a fully up to date .dev as well.

-- 
Justin Patrin


