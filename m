Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MfoZV-0007rZ-K5
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Aug 2009 07:27:53 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 049571B10C09
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2009 05:14:23 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Aug 2009 07:09:57 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <4A936CC0.70409@4d-electronics.co.nz>
In-Reply-To: <4A936CC0.70409@4d-electronics.co.nz>
MIME-Version: 1.0
Message-Id: <200908250709.57101.holger+oe@freyther.de>
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
X-List-Received-Date: Tue, 25 Aug 2009 05:27:54 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 25 August 2009 06:46:56 Matthew Dombroski wrote:
> Hi,
>
> The FindQt4.cmake distributed with cmake (for some time now) is unable
> to find the libs installed by qt4e (I haven't tried qt4x11).
> This is because the libs installed by openembedded use an unusual naming
> convention that isnt known in FindQt4.cmake.
>
> The below patch fixes the problem.

This will not work when both qt4x11 and qt4e is built and staged. I have no 
specific knowledge of the current FindQt4 cmake module but there should be a 
way to tell it that we want the QtE, QtX11 or QtMac built...

Do you have any idea?

	z.


