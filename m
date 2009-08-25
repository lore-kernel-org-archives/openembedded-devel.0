Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Mfptd-0007gG-NA
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Aug 2009 08:52:45 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 9AD1A1B10C0A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2009 06:39:14 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Aug 2009 08:34:45 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <4A936CC0.70409@4d-electronics.co.nz>
	<200908250709.57101.holger+oe@freyther.de>
	<4A937532.1070503@4d-electronics.co.nz>
In-Reply-To: <4A937532.1070503@4d-electronics.co.nz>
MIME-Version: 1.0
Message-Id: <200908250834.45415.holger+oe@freyther.de>
Subject: Re: CMake and Qt4
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
X-List-Received-Date: Tue, 25 Aug 2009 06:52:46 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 25 August 2009 07:22:58 Matthew Dombroski wrote:
> > This will not work when both qt4x11 and qt4e is built and staged. I have
> > no specific knowledge of the current FindQt4 cmake module but there
> > should be a way to tell it that we want the QtE, QtX11 or QtMac built...
> >
> > Do you have any idea?
>
> Do you know the naming convention of qt4x11?
> qt4e names libs with a big E like this: libQtCoreE.so.4.5

There is no convention. In Qt2 times an 'e' was appended to libqt. For Qt4 we 
(in OpenEmbedded) are using the library infix to append the E as we are 
supporting both QtX11 and QtEmbedded.

>
> It shouldnt be hard to add another variable in FindQt4.cmake that
> controls what names we search for.


Qt4x11 should be already in that list. So the basic problem with "appending" 
'E' to the list is that it will not be used when Qt4X11 was already staged.

To summarize. I'm not aware of any other distro that allows to install Qt4/X11 
and Qt4/Embedded Linux. We are doing something that the KDE/CMake developers 
have not seen as it doesn't exist on the desktop.

The fix should include externally forcing FindQt4 to use X11 or EmbeddedLinux 
depending on the config.


z.


