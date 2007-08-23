Received: from [66.111.4.26] (helo=out2.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rod@whitby.id.au>) id 1IOAVa-00063w-9D
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Aug 2007 13:05:51 +0200
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by out1.messagingengine.com (Postfix) with ESMTP id DDA3F244C7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2007 07:04:39 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute2.internal (MEProxy); Thu, 23 Aug 2007 07:04:39 -0400
X-Sasl-enc: t3d1Ob7T8tvjRCtPf5Da9Zh5GJ5Wy2Tlf/Xd+rhdxvs8 1187867079
Received: from [192.168.18.11] (CPE-121-209-19-11.sa.bigpond.net.au
	[121.209.19.11])
	by mail.messagingengine.com (Postfix) with ESMTP id 299FF57
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Aug 2007 07:04:38 -0400 (EDT)
Message-ID: <46CD69E3.707@whitby.id.au>
Date: Thu, 23 Aug 2007 20:35:07 +0930
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.6 (Windows/20070728)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1ef816af0708221151m5c3c2b4ds9b90fdbddc56d8d1@mail.gmail.com>	<19c1b8a90708221646p6cfd0e6do6574668bbe15d775@mail.gmail.com>
	<1ef816af0708230241s62454f78oa0147b10cae53ce6@mail.gmail.com>
In-Reply-To: <1ef816af0708230241s62454f78oa0147b10cae53ce6@mail.gmail.com>
Subject: Re: binutils-cross_2.17.50.0.5.bb failed
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Aug 2007 11:05:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

yakov.zaytsev@gmail.com wrote:
> ..binutils-cross-2.17.50.0.5-r1/temp/log.do_configure.8057 contains
> 
> --
> /Volumes/OE/stuff/build/tmp/work/armv5te-angstrom-linux-gnueabi/binutils-
> cross-2.17.50.0.5-r1/temp/run.do_configure.8057: line 782: do_configure:
> command not found

You've been bitten by the "build crosses midnight GMT" bitbake bug.

Rebuild the affected package using "make rebuild-package-binutils-cross"
if this occurs.  See Mickey's other email on the subject.

-- Rod


