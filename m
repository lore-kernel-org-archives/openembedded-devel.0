Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KxJsM-00088W-Aa
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Nov 2008 12:15:10 +0100
Received: from imp050244.vpn.mi.fu-berlin.de ([130.133.50.244]
	helo=tamarin.localnet) by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1KxJr1-0004V1-Q3
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Nov 2008 12:13:47 +0100
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 4 Nov 2008 12:13:24 +0100
User-Agent: KMail/1.10.1 (Linux/2.6.27-7-generic; KDE/4.1.2; i686; ; )
References: <20081104005512.GA12988@denix.org>
In-Reply-To: <20081104005512.GA12988@denix.org>
MIME-Version: 1.0
Message-Id: <200811041213.25205.zecke@selfish.org>
Subject: Re: hal-0.5.11 fails with external toolchain/SDK
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
X-List-Received-Date: Tue, 04 Nov 2008 11:15:10 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tuesday 04 November 2008 01:55:12 Denys Dmytriyenko wrote:
> Hi,
>
> New hal-0.5.11 from OpenMoko breaks builds with external-toolchain/SDK, as
> it hardcodes linux/input.h like this:

It is Openmoko, and I did add it.

what about something among the lines of?

echo "#include <linux/input.h>" | cpp | less | grep "linux\/input.h"


z.


