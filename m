Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MUBWu-0006cY-FC
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Jul 2009 05:33:08 +0200
Received: from tamarin.localnet (123-192-186-20.dynamic.kbronet.com.tw
	[123.192.186.20])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 9C9241B10C0D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jul 2009 03:20:27 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Jul 2009 05:17:58 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc2; KDE/4.2.96; i686; ; )
References: <200907231733.14601.holger+oe@freyther.de>
	<h4a435$9sd$1@ger.gmane.org>
In-Reply-To: <h4a435$9sd$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200907240517.58524.holger+oe@freyther.de>
Subject: Re: [PATCH] Fix qt4-embedded compilation
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
X-List-Received-Date: Fri, 24 Jul 2009 03:33:08 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 23 July 2009 18:45:24 Koen Kooi wrote:
> On 23-07-09 17:33, Holger Hans Peter Freyther wrote:
> > Hey,
> >
> > I need the below patch to be able to compile qt4-embedded without trying
> > to download a PowerVR sdk for the OMAP when building on x86...
>
> Can't you just bbmask it out?

I would prefer if qt4-embedded is buildable out of the box. The problem is the 
following. qt4-embedded.inc is setting QT_BASE_NAME to qt4-embedded. This 
means that the various -dbg packages start to depend on qt4-embedded-gles.

Is this wanted? maybe we should set QT_BASE_NAME to ${PN} in qt4-embedded?

what do you think?

	holger


