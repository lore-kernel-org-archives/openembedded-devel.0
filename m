Received: from [66.111.4.25] (helo=out1.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rod@whitby.id.au>) id 1Iuyf3-00019p-Bl
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2007 00:07:14 +0100
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by out1.messagingengine.com (Postfix) with ESMTP id 10CFB4D053
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2007 18:04:56 -0500 (EST)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute1.internal (MEProxy); Wed, 21 Nov 2007 18:04:56 -0500
X-Sasl-enc: +DMI0fshVG6rtouhKRXr7SJJhc/Wo7jV2vxY3nH68eTa 1195686295
Received: from [192.168.76.11] (secure.astc-design.com [203.122.250.137])
	by mail.messagingengine.com (Postfix) with ESMTP id 11DD11EA12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2007 18:04:54 -0500 (EST)
Message-ID: <4744B982.8080809@whitby.id.au>
Date: Thu, 22 Nov 2007 09:34:34 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20071119120819.GA17788@lenovo>	<47419EA0.4030308@student.utwente.nl>	<4742217C.9060506@whitby.id.au>	<74d0deb30711200112x17ad31fej4b25840a74e05abb@mail.gmail.com>	<1195626057.11679.7.camel@localhost>
	<1496857094.20071121195713@gmail.com>
In-Reply-To: <1496857094.20071121195713@gmail.com>
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
X-List-Received-Date: Wed, 21 Nov 2007 23:07:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Paul Sokolovsky wrote:
> Hello Esben,
> Wednesday, November 21, 2007, 8:20:57 AM, you wrote:
> []
>>> The question is how to fix this problem correctly.
>>> One possibility would be that bitbake, if BBPATH is unset, issues a
>>> warning and scans the file system (starting from the $PWD) for a
>>> certain file (local.conf) in which BBPATH would be specified.
> 
>> Something like that would be nice. When bitbake finds BBPATH unset, it
>> traverses from $PWD to / to find a .bbenv (or some other filename, but
>> local.conf is probably not a good one), which can setup BBPATH,
>> PYTHONPATH, OEDIR or whatever env virables is used in the
>> conf/local.conf file.
> 
>   LOL. So, editing .bashrc is hard, while creating and editing some
> obscure file is easy?

The difference is that .bashrc is global for the the user, where as a
file can be local to each different build area that the user wants to
keep separate.

What we are discussing is session-local configuration vs
directory-tree-local configuration.  At the moment, bitbake uses some of
each, and that's the root of the problem.  The Makefiles are designed to
turn this into directory-tree-local configuration only.

-- Rod


