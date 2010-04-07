Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Nzbn6-0007z1-UG
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Apr 2010 22:24:01 +0200
Received: from tamarin.localnet (static.233.147.46.78.clients.your-server.de
	[78.46.147.233])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id E221D1B10C79
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Apr 2010 20:25:35 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 7 Apr 2010 22:20:23 +0200
User-Agent: KMail/1.13.2 (Linux/2.6.34-rc3-00001-g17459ed; KDE/4.4.2; i686; ; )
References: <p2y46a47f951004071306meb244b2ge55fbff26849ccf@mail.gmail.com>
In-Reply-To: <p2y46a47f951004071306meb244b2ge55fbff26849ccf@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201004072220.23343.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Problem with creating an SDK and host libraries
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
X-List-Received-Date: Wed, 07 Apr 2010 20:24:01 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 07 April 2010 22:06:17 Ryan Phillips wrote:
> Hi All,
> 
> I'm creating a powerpc 405 based meta-toolchain-sdk and the resulting
> opkg-cl for x86_64 is linking to OpenSSL within my
> $BUILD/tmp/staging/x86_64-linux/usr/lib/lib{ssl,crypto}...

Oh, i recently upgraded opkg-sdk/curl-sdk and might have broken that. Your 
quick hack could be to go back to an older version (revert my commit) or help 
me to find out what is going on.

One easy option would be to disable SSL. Could you help me to see who needs 
the SSL library? Is that curl?


