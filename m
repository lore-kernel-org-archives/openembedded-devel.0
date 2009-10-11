Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MwztV-0005M6-1K
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Oct 2009 16:59:36 +0200
Received: from tamarin.localnet (123-192-145-111.dynamic.kbronet.com.tw
	[123.192.145.111])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id DCACD1B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Oct 2009 15:06:54 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Oct 2009 16:58:23 +0200
User-Agent: KMail/1.12.2 (Linux/2.6.32-rc3; KDE/4.3.2; i686; ; )
References: <fd72b8f50910110737u5cf0c64dv2e352feaa2c46e1@mail.gmail.com>
In-Reply-To: <fd72b8f50910110737u5cf0c64dv2e352feaa2c46e1@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200910111658.23873.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: imagemagick-native-6.3.5 compile problems
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
X-List-Received-Date: Sun, 11 Oct 2009 14:59:36 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Sunday 11 October 2009 16:37:19 mail mail wrote:
> Hi, all
> I'm compiling x11-sato-image. I chose mini2440 as my machine and angstrom
>  as distro.

Ni Hao,

sorry this is not how it is working. Ask on IRC or google/baidu first.


You are using a fortify enabled compiler and the open call lacks a third 
argument. Just create a patch to change the open call to have the access mode 
in it as well, send a patch, we will be happy to apply it.


z.


