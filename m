Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MWQiY-0006uo-0O
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Jul 2009 10:10:26 +0200
Received: from tamarin.localnet (static.233.147.46.78.clients.your-server.de
	[78.46.147.233])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 756B91B10C10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jul 2009 07:57:37 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Jul 2009 09:22:10 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.2.98; i686; ; )
References: <91283b620907292323k97f58c8tab25fd987265d64e@mail.gmail.com>
In-Reply-To: <91283b620907292323k97f58c8tab25fd987265d64e@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200907300922.10602.holger+oe@freyther.de>
Subject: Re: Advice needed on using Bitbake to make qt project (.pro) Click to flag this post
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
X-List-Received-Date: Thu, 30 Jul 2009 08:10:26 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 30 July 2009 08:23:29 Stuart Gray wrote:
> Hi,
>
> I am new to using Bitbake and would like to ask if anyone has links to
> examples on how to get Bitbake to build Qt projects.
>
> I have successfully used Bitbake to add firmware files to my image, but I
> am about to look at building Qt projects into the image. I have already
> added the Qt Embedded package to the image.
>
> Any advice would be great as I have very tight project timescales and I am
> trying to reduce risk as far as possible. I have been through the Bitbake
> example and searched online for examples. From what I understand I should
> just be able to add the .cpp, .h and .pro files to the SRC_URI list. Now I
> know from reading up on Bitbake that if the SRC_URI contains a makefile
> that Bitbake will recognise this and use it to compile the code, but is the
> same true if it contains a .pro file. Will it call qmake and then make?


The most simple example of a qmake based Qt4 project would be qsvn. The simple 
line of inherit qt4x11 will make sure your dependencies (Qt4 X11, qmake) get 
installed.

On the SRC_URI. Normally you either fetch a tarball, or from a SCM. If you 
want to pass all source files individually with SRC_URI you need to adjust the 
S variable to make qmake, etc. find the sources. Examples for that is 
shasum/shasum.inc. (Not the S = "${WORKDIR}").

Normally I encourage people to either fetch from a SCM or to use tarballs.

kind regards
	holger


