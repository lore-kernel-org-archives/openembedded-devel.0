Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rod@whitby.id.au>) id 1Ho8HB-0006EO-1R
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 May 2007 03:26:01 +0200
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by out1.messagingengine.com (Postfix) with ESMTP id 6F5A221F77B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2007 21:26:48 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute2.internal (MEProxy); Tue, 15 May 2007 21:25:46 -0400
X-Sasl-enc: 6xff8VJuZN/BZt6P3ZgAQDN5f4ePLGIJY2rNksiy9kOG 1179278747
Received: from [127.0.0.1] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTP id C74E523F81
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2007 21:25:46 -0400 (EDT)
Message-ID: <464A5D37.4030401@whitby.id.au>
Date: Wed, 16 May 2007 10:54:07 +0930
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.10 (Windows/20070221)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200705151322.39110.robin.farine@terminus.org>
In-Reply-To: <200705151322.39110.robin.farine@terminus.org>
X-Enigmail-Version: 0.94.0.0
Subject: Re: RFC: machine customized ixp4xx NPE firmware
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
X-List-Received-Date: Wed, 16 May 2007 01:26:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Robin Farine wrote:
> The platform I am working on is using NPE-B and NPE-C as Ethernet
> interfaces. The ixp4xx-npe package from the OE snapshot I am 
> currently
> using builds firmware for NPE-B only and the firmware type is 
> hard-coded
> in "IxNpeMicrocode.h".
> 
> The patch below proposes a means of letting the machine 
> configuration file
> decide which NPE firmware to build.

Thanks.  We'll be very happy to apply that patch.  I'll take a close
look at it tonight.

> Another but somewhat related point is the COMPATIBLE_MACHINE 
> variable. If
> my machine's name does not start with nslug or ixp4xx, I am forced 
> to
> change many package recipes (I suspect it is a FAQ but I do not seem 
> to
> able to access the mailing-list archive at the moment), perhaps a
> COMPATIBLE_ARCH variable would be help here ?

Which machine/arch are you using?  We can easily extend that
compatibility to include any other machines/archs that will use it.

-- Rod


