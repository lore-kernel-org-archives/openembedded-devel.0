Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MlHgI-0002SC-7Q
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Sep 2009 09:33:33 +0200
Received: from tamarin.localnet (unknown [211.40.35.20])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id BD8C91B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Sep 2009 07:38:38 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 9 Sep 2009 09:32:52 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.1; i686; ; )
References: <4AA60682.1020309@symas.com>
In-Reply-To: <4AA60682.1020309@symas.com>
MIME-Version: 1.0
Message-Id: <200909090932.52053.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: wpa_supplicant and GnuTLS
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
X-List-Received-Date: Wed, 09 Sep 2009 07:33:33 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

On Tuesday 08 September 2009 09:23:46 Howard Chu wrote:
> On the Always Innovating TouchBook I've found that the wpa_supplicant
> always fails on WPA-EAP authentication in its default package, built with
> GnuTLS. It works fine when I rebuild it using OpenSSL. It's surprising the
> number of packages in the distro that depend on GnuTLS. I think you should
> seriously reconsider relying on such a volatile library in your builds.

Thanks, do you note that there are at least two things to consider? OpenSSL is  
considered to not be GPL compatible. So people that want to distribute 
binaries or don't want to advertize Eric Young can use GnuTLS or no SSL at 
all..

Do you have any idea why wpa_supplicant is failing with GnuTLS? Is it in 
wpa_supplicant or GNUtls?

z.


