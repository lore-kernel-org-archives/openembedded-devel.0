Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MbWyT-0002HM-0R
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 11:51:57 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id C1B901B10C06
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2009 09:38:46 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Aug 2009 11:34:50 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <4A83D8D4.7060206@epfl.ch>
In-Reply-To: <4A83D8D4.7060206@epfl.ch>
MIME-Version: 1.0
Message-Id: <200908131134.50432.holger+oe@freyther.de>
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
X-List-Received-Date: Thu, 13 Aug 2009 09:51:57 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 13 August 2009 11:11:48 Valentin Longchamp wrote:
> Hello,
>
> I am trying to build cmake based programs that use QT with Openembedded.
> The actual support for cmake in OE worked until now because I only had
> "simple" dependencies. Now with QT as as dependency, I use the cmake
> FindQt4 Module that strongly relies on qmake to find the different QT
> cmake variables (try to run ${STAGINGBINDIR}/qmake2 -query). The cmake
> FindQt4 Module uses the values given by qmake to determine where all the
> libraries and tools are installed (and if installed).

Let me throw in some (pseudo) facts:
	- We want to use one qmake2 for Qt/X11, Qt/Embedded Linux builds
	- qmake is reading a qt.conf from the directory of the binary. In Qt/X11
	 and Qt/E build we write a custom one.
	- the pkg-config files for Qt should be correct.


So my proposals include:
	- Consider renaming qmake2 to qmake or qmake-qt4 (and move qt3 to qmake-qt3)
	- for X11/Embedded create a separate bin dir for qmake, create a symlink and
	  place a qt.conf in it.
	- maybe convince Alexander Neuendorf to use pkg-config to find Qt too..


what do you think?
	z.


