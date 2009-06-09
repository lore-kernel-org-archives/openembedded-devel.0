Received: from [64.22.125.45] (helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1MDy06-00082u-Jz
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Jun 2009 11:52:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 040FC2C81A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jun 2009 09:41:14 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GYKZErLg0V1b
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jun 2009 09:41:12 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTP id 287412C814
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jun 2009 09:41:11 +0000 (UTC)
Message-ID: <4A2E2E93.1090005@gmail.com>
Date: Tue, 09 Jun 2009 11:42:43 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A185B31.8050003@gremlin.it>	<1243111410.4226.109.camel@lenovo.internal.reciva.com>
	<4A18F6B7.8060708@gremlin.it>
In-Reply-To: <4A18F6B7.8060708@gremlin.it>
Subject: Re: trouble with ext2 filesystem
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
X-List-Received-Date: Tue, 09 Jun 2009 09:52:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Alessandro GARDICH ha scritto:
> Phil Blundell wrote:
>> On Sat, 2009-05-23 at 22:23 +0200, Alessandro GARDICH wrote:
>>> At now I modify qemux86.conf cause usually EXTRA_IMAGECMD is in the
>>> machine config file, but to add hardware specific parameters (flash
>>> size   and erase size). I'm not sure if is the right place. Probably
>>> in the distro configuration could be better.
>>
>> The distro config probably is the right place for this.  After all, the
>> number of inodes you need depends primarily on the number of files that
>> you're going to ship in the rootfs, and that in turn is primarily
>> influenced by the DISTRO's policies rather than by any inherent aspect
>> of the MACHINE.
>>
>> The other uses of EXTRA_IMAGECMD that I guess you're thinking of are
>> mostly to do with jffs2 parameters, which are rather different in that
>> they're determined by the specifics of the hardware in use and hence do
>> go with the MACHINE rather than the DISTRO.
>>
>> p.
>>
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> true, reform the patch for kaeilos.conf
> 
> 
> 
> 

Thank you for the patch.

Acked-by: Marco Cavallini  <m.cavallini@koansoftware.com>


