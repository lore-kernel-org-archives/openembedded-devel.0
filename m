Received: from [66.111.4.29] (helo=out5.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rod@whitby.id.au>) id 1HJedF-00061y-MS
	for openembedded-devel@openembedded.org; Wed, 21 Feb 2007 00:42:49 +0100
Received: from out1.internal (unknown [10.202.2.149])
	by out1.messagingengine.com (Postfix) with ESMTP id 8069B1BBD8C;
	Tue, 20 Feb 2007 18:43:56 -0500 (EST)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by out1.internal (MEProxy); Tue, 20 Feb 2007 18:43:56 -0500
X-Sasl-enc: YeCFobTu/gzldCUScIK+w+EMNBfdBKF071ZuF2b/NXHd 1172015035
Received: from [127.0.0.1] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTP id 1C415CA09;
	Tue, 20 Feb 2007 18:43:54 -0500 (EST)
Message-ID: <45DB876E.4090806@whitby.id.au>
Date: Wed, 21 Feb 2007 10:12:38 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.9 (Windows/20061207)
MIME-Version: 1.0
To: Richard Purdie <rpurdie@rpsys.net>
References: <1172010661.5884.113.camel@localhost.localdomain>
In-Reply-To: <1172010661.5884.113.camel@localhost.localdomain>
Cc: openembedded-devel <openembedded-devel@openembedded.org>
Subject: Re: Impending Kexec interface change
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
X-List-Received-Date: Tue, 20 Feb 2007 23:42:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> Anyone watching mainline kernels will note that ARM kexec support got
> merged and will be in 2.6.21 which is good. The issue is that the
> syscall number had to change since the one its using at the moment is a
> big hack.
> 
> This means we will have to change kexec-tools and at that point it
> becomes incompatible with older kernels.
> 
> We can wait a bit and change when 2.6.21 is released, or update all our
> patches now to use the new proper syscall number and update OE now.
> 
> I know the NSLU2 people are users of this and would value their input.

I say we change ASAP.  We'll upgrade the ixp4xx kernel in sync with your
changes.

-- Rdo


