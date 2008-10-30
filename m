Received: from [76.96.30.48] (helo=QMTA05.emeryville.ca.mail.comcast.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tmtalpey@rcn.com>) id 1KvYkt-0007ru-Dg
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Oct 2008 15:44:11 +0100
Received: from OMTA11.emeryville.ca.mail.comcast.net ([76.96.30.36])
	by QMTA05.emeryville.ca.mail.comcast.net with comcast
	id Yzp31a0030mlR8UA52j7o4; Thu, 30 Oct 2008 14:43:07 +0000
Received: from tmt.rcn.com ([98.229.118.72])
	by OMTA11.emeryville.ca.mail.comcast.net with comcast
	id Z2j01a00H1ZoUlN8X2j1Qr; Thu, 30 Oct 2008 14:43:02 +0000
X-Authority-Analysis: v=1.0 c=1 a=stP8gzvyWslHBaKyk-kA:9
	a=K2BBTLQjXTqpiYZc1pDXxcXLrPAA:4 a=h9s5Ru71U4oA:10
X-Mailer: QUALCOMM Windows Eudora Version 7.1.0.9
Date: Thu, 30 Oct 2008 10:40:14 -0400
To: openembedded-devel@lists.openembedded.org
From: Tom Talpey <tmtalpey@rcn.com>
In-Reply-To: <1225294016.3822.81.camel@mill.internal.reciva.com>
References: <1225294016.3822.81.camel@mill.internal.reciva.com>
Mime-Version: 1.0
Subject: Re: arm kernel configurations
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
X-List-Received-Date: Thu, 30 Oct 2008 14:44:12 -0000
Message-ID: <MADEUP.15FE1A15E67263D7.14572@groups.io>
Content-Type: text/plain; charset="us-ascii"

At 11:26 AM 10/29/2008, Phil Blundell wrote:
>- if your userspace is pure EABI, make sure that you have
>CONFIG_OABI_COMPAT turned off.

My kernel(s) have all hung during exec of init when trying this.
Are you able to turn this off with non-thumb userspace?

One side effect of turning off OABI_COMPAT is that the floating
point emulation also vanishes. I get the same behavior if I leave
OABI_COMPAT on and play with fp settings.

This is mostly with 2.6.27 on my iPAQ h1940 (s3c2410). Same
as GTA01, right?

Tom.



