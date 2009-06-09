Received: from [64.22.125.45] (helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1MDxAu-0000xI-On
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Jun 2009 10:59:20 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 88F3A2C81A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jun 2009 08:48:20 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AtlSbfDsgjGq
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jun 2009 08:48:19 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTP id BFED42C814
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jun 2009 08:48:18 +0000 (UTC)
Message-ID: <4A2E2230.30700@gmail.com>
Date: Tue, 09 Jun 2009 10:49:52 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A185B31.8050003@gremlin.it>
In-Reply-To: <4A185B31.8050003@gremlin.it>
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
X-List-Received-Date: Tue, 09 Jun 2009 08:59:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Alessandro GARDICH ha scritto:
> Hi all
> 
> I notice a problem of the generated filesystem
> 
> MACHINE = "qemux86"
> DISTRO = "kaeilos"
> IMAGE_FSTYPES = "ext2"
> IMAGE_ROOTFS_SIZE = "102400"
> 
> 
> building console-image I obtain a .ext2 filesystem with
> Free blocks:              89357
> Free inodes:              87
> 
> notice ... only 87 free inodes !!!
> 
> after my small and trial patch this is the result
> Free blocks:              86302
> Free inodes:              24527
> 
> maybe 4096 could be too small ... maybe 10k could be good, your choice.
> 
> At now I modify qemux86.conf cause usually EXTRA_IMAGECMD is in the
> machine config file, but to add hardware specific parameters (flash size
>  and erase size). I'm not sure if is the right place. Probably in the
> distro configuration could be better.
> 
> thanks in advance
> 
> 

Thank you for the patch.

Acked-by: Marco Cavallini  <m.cavallini@koansoftware.com>




