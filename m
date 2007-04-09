Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1HanGp-0005G9-Ny
	for openembedded-devel@openembedded.org; Mon, 09 Apr 2007 08:22:31 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HanGf-0000b4-Ed
	for openembedded-devel@openembedded.org; Mon, 09 Apr 2007 08:22:21 +0200
Received: from p3160-ipbf1007marunouchi.tokyo.ocn.ne.jp ([210.232.248.160])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 09 Apr 2007 08:22:21 +0200
Received: from no2spam by p3160-ipbf1007marunouchi.tokyo.ocn.ne.jp with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 09 Apr 2007 08:22:21 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Mon, 09 Apr 2007 15:22:04 +0900
Message-ID: <evcm2e$15q$1@sea.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@sea.gmane.org
X-Gmane-NNTP-Posting-Host: p3160-ipbf1007marunouchi.tokyo.ocn.ne.jp
User-Agent: Thunderbird 1.5.0.10 (X11/20070306)
Sender: news <news@sea.gmane.org>
Subject: OE a deterministic build system?
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
X-List-Received-Date: Mon, 09 Apr 2007 06:22:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I am pulling my hair out and losing faith in OE being a deterministic 
build system.  As documented in bug 1568, I have not been able to build 
nunome for about half a year now.  When I asked hrw for help in fixing 
it , I was quite surprised for him to come back and say "Built fine for 
me". This success was later repeated by psokolovsky.  Alas, I can't.

In my futile attempts on finding where I screwed this up, I further and 
further "virginized" my OE installation until I reinstalled, but even 
that did not help (going by GettingStarted here).

   1. openembedded-essential has long since been installed
   2. rm -Rf ~/oe && mkdir -p ~/oe/build/conf && cd ~/oe
   3. svn co
      http://svn.berlios.de/svnroot/repos/bitbake/branches/bitbake-1.8/
      bitbake
   4. wget http://www.openembedded.org/snapshots/OE.mtn.bz2
   5. bunzip2 <OE.mtn.bz2 >oe.mtn
   6. mtn --db=./OE.mtn checkout --branch=org.openembedded.dev
   7. My local.conf is absolutely bare and unspectucular

      DL_DIR = "${HOME}/oe/sources"
      BBFILES = "${HOME}/oe/org.openembedded.dev/packages/*/*.bb"
      BBMASK = ""
      MACHINE ?= "spitz"
      DISTRO = "angstrom-2007.1-oabi"
      ENABLE_BINARY_LOCALE_GENERATION = "0"
      ASSUME_PROVIDED += "qemu-native"
      GLIBC_GENERATE_LOCALES = "en_GB.UTF-8 de_DE.UTF-8"
      IMAGE_FSTYPES = "jffs2 tar"
      PARALLEL_MAKE = "-j 3"
      BBINCLUDELOGS = "yes"
      PALMTOP_USE_MULTITHREADED_QT = "yes"

   8. set up the environment with

      export PATH=/home/rolf/oe/bitbake/bin/:$PATH && export
      BBPATH=/home/rolf/oe/build/:/home/rolf/oe/org.openembedded.dev/

   9. "bitbake qte-mt && bitbake nunome" then fails with the same old
      error of "undefined reference to `main'" as always ->
      http://bugs.openembedded.org/attachment.cgi?id=1335

Now, I really wonder what causes this virgin build to fail for me when 
it seems everybody else can happily build it?  Is OE not deterministic?  
Hints and discussion welcome.

Regards

Rolf



