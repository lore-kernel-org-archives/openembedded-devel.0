Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1N8BlH-0007NU-8y
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 12:53:22 +0100
Received: from tamarin.localnet (123-192-145-111.dynamic.kbronet.com.tw
	[123.192.145.111])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 55DEF1B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2009 12:02:49 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Nov 2009 12:51:40 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <200911110922.49285.holger+oe@freyther.de>
	<200911111106.45146.holger+oe@freyther.de>
In-Reply-To: <200911111106.45146.holger+oe@freyther.de>
MIME-Version: 1.0
Message-Id: <200911111251.40375.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: pkgconfig-sdk breakage
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
X-List-Received-Date: Wed, 11 Nov 2009 11:53:22 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 11 November 2009 11:06:45 Holger Hans Peter Freyther wrote:
> On Wednesday 11 November 2009 09:22:49 Holger Hans Peter Freyther wrote:
> > Hi,
> >
> > my current meta-toolchain builds breaks on some python code
> > executed while building pkg-config-sdk. Any ideas?

The pkgconfig-sdk_0.23.bb file is doing a do_stage_prepend which seems
to break things... due the removal of base_do_stage and the removal from 
EXPORT_FUNCTIONS...

any idea?





