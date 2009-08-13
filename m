Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MbbTR-000061-03
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 16:40:13 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 9B8D31B10C10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2009 14:27:02 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Aug 2009 16:23:07 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <4A83D8D4.7060206@epfl.ch>
	<200908131134.50432.holger+oe@freyther.de>
	<4A841382.7070909@epfl.ch>
In-Reply-To: <4A841382.7070909@epfl.ch>
MIME-Version: 1.0
Message-Id: <200908131623.07998.holger+oe@freyther.de>
Subject: Re: Cross-compiling qt based programs with cmake
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
X-List-Received-Date: Thu, 13 Aug 2009 14:40:13 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 13 August 2009 15:22:10 Valentin Longchamp wrote:
> Holger Hans Peter Freyther wrote:
> > On Thursday 13 August 2009 11:11:48 Valentin Longchamp wrote:
> >> Hello,
> >>
> >> I am trying to build cmake based programs that use QT with Openembedded.
> >> The actual support for cmake in OE worked until now because I only had
> >> "simple" dependencies. Now with QT as as dependency, I use the cmake
> >> FindQt4 Module that strongly relies on qmake to find the different QT
> >> cmake variables (try to run ${STAGINGBINDIR}/qmake2 -query). The cmake
> >> FindQt4 Module uses the values given by qmake to determine where all the
> >> libraries and tools are installed (and if installed).
>
> Thanks for your feedback zecke.
>
> > Let me throw in some (pseudo) facts:
> > 	- We want to use one qmake2 for Qt/X11, Qt/Embedded Linux builds
> > 	- qmake is reading a qt.conf from the directory of the binary. In Qt/X11
> > 	 and Qt/E build we write a custom one.
>
> What do you mean by the binary ? The qmake binary ? Is the custom file
> you mention the linux.conf file (like
> openembedded/recipes/qt4/files/linux.conf, with some parts defined in
> openembedded/classes/qt4e.bbclass) ?


binary = qmake2
path = /usr/foo/bin/qmake2
strace /usr/foo/bin/qmek2 | grep qt.conf
 lstat("/usr/foo/bin/qt.conf")

just look at qt4.inc. With a "qt.conf" you can define every value of qmake2 -
query. So when building Qt we put qmake2 into a special place and put the 
qt.conf we want (X11 or Embedded Linux next to it).

You seem to be a bit confused. qmake.conf etc. are part of the QMAKESPEC, 
qt.conf is something different for deployment...

z.



