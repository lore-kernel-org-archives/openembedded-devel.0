Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rod@whitby.id.au>) id 1IugSB-0004Zn-LG
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Nov 2007 04:40:43 +0100
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by out1.messagingengine.com (Postfix) with ESMTP id DEF8C4882A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2007 22:38:29 -0500 (EST)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute2.internal (MEProxy); Tue, 20 Nov 2007 22:38:29 -0500
X-Sasl-enc: RZjWUmGdfBd1pKq/O2K6BSrRy68qS9K+px8LlvRmR2cv 1195616309
Received: from [192.168.76.11] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTP id 389252060E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2007 22:38:28 -0500 (EST)
Message-ID: <4743A821.2090508@whitby.id.au>
Date: Wed, 21 Nov 2007 14:08:09 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20071119120819.GA17788@lenovo>	<47419EA0.4030308@student.utwente.nl>	<4742217C.9060506@whitby.id.au>	<74d0deb30711200112x17ad31fej4b25840a74e05abb@mail.gmail.com>	<4743201F.8000202@am.sony.com>
	<47436CEE.9020407@kernelconcepts.de>
In-Reply-To: <47436CEE.9020407@kernelconcepts.de>
Subject: Re: Getting Started -Makefile
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
X-List-Received-Date: Wed, 21 Nov 2007 03:40:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Florian Boor wrote:
> Tim Bird schrieb:
>> This is nice.  Can someone tell me why this isn't
>> the default behavior of bitbake now?  (I'm honestly
>> not trolling :-)   There must be some good reason
>> to allow bitbake to be used outside of a build
>> directory.  Make (which bitbake resembles
>> in some aspects), is sensitive to it's starting
>> directory.  Why not bitbake?
> 
> that's a pretty good point. In my opinion the fact that you need to set
> environment variables in addition to your configuration files is a pain anyway.
> I would expect bitbake to search for all configuration information in
> $PWD/conf/*.conf and that's it. That would reduce the initial overhead and makes
> it _much_ easier for new users to get along with OE.

If that was enacted, then the need for any Makefile support for building
individual packages would be removed (literally - I would remove those
targets from the Makefiles I maintain).

-- Rod


