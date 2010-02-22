Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NjrMi-0001f7-5O
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 10:47:43 +0100
Received: from tamarin.localnet (siminn-int-gw.on-waves.com [157.157.59.158])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 3D9A11B10C79
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2010 09:46:19 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2010 23:53:33 +0100
User-Agent: KMail/1.13.0 (Linux/2.6.33-rc8; KDE/4.4.0; i686; ; )
References: <72281.30342.qm@web110216.mail.gq1.yahoo.com>
In-Reply-To: <72281.30342.qm@web110216.mail.gq1.yahoo.com>
MIME-Version: 1.0
Message-Id: <201002222353.33619.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: bitbake failed in base-image and other images
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
X-List-Received-Date: Tue, 23 Feb 2010 09:47:43 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 22 February 2010 16:25:06 Kaijun Tang wrote:
> Hi, I always failed to bitbake images like

If you want to have others help you, you need to supply enough context. It 
should include some of the following stuff:
	- Explain the config you have (e.g. MACHINE, DISTRO...)
	- Explain which version of the OE metadata you have
	- Explain what you are trying to build...
	- Explain how it fails and how you expect it should do stuff

> 
> /home/tang/Project/OE/build/tmp/cross/armv7a/arm-angstrom-linux-gnueabi
> /bin/as:unrecognized option '-Qy'

This normally indicates a host (x86) and target mismatch. E.g. you are trying 
to compile for x86 with your ARM compiler...

z.


