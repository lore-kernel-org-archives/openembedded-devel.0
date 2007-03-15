Received: from [66.111.4.29] (helo=out5.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rod@whitby.id.au>) id 1HRtH4-0004Ch-P1
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Mar 2007 17:58:00 +0100
Received: from out1.internal (unknown [10.202.2.149])
	by out1.messagingengine.com (Postfix) with ESMTP id F3ECF1F8D52
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Mar 2007 12:57:57 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by out1.internal (MEProxy); Thu, 15 Mar 2007 12:57:58 -0400
X-Sasl-enc: vD9iN3lRg4V7Ak/zRRYhFEtaEo7jgR4mtCRGC5IbU97W 1173977878
Received: from [127.0.0.1] (CPE-58-160-130-105.sa.bigpond.net.au
	[58.160.130.105])
	by mail.messagingengine.com (Postfix) with ESMTP id CBB4121EE7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Mar 2007 12:57:57 -0400 (EDT)
Message-ID: <45F97AE9.8060705@whitby.id.au>
Date: Fri, 16 Mar 2007 03:27:13 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.10 (Windows/20070221)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <45F92746.2020608@whitby.id.au>
	<1173959533.45f9336d50790@dominion.kabel.utwente.nl>
In-Reply-To: <1173959533.45f9336d50790@dominion.kabel.utwente.nl>
X-Enigmail-Version: 0.94.0.0
Subject: Re: Bad gcc packaging (libgcc-s1 instead of libgcc1)
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
X-List-Received-Date: Thu, 15 Mar 2007 16:58:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> I think putting a construction like
> gcc-package-cross.inc has:
> 
> python do_package() {
>         if bb.data.getVar('DEBIAN_NAMES', d, 1):
>                 bb.data.setVar('PKG_libgcc', 'libgcc1', d)
>         bb.build.exec_func('package_do_package', d)
> }
> 
> in gcc-package.inc should work. Could you test that?

That works here.

> Sorry for breaking everyones packages.

Apology accepted.

-- Rod


