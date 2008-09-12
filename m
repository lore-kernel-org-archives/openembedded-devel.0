Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <thommycheck@gmx.de>) id 1Ke6E4-0007RM-3e
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Sep 2008 12:50:08 +0200
Received: (qmail invoked by alias); 12 Sep 2008 10:47:21 -0000
Received: from BAA3c82.baa.pppool.de (EHLO [192.168.178.38]) [77.128.60.130]
	by mail.gmx.net (mp054) with SMTP; 12 Sep 2008 12:47:21 +0200
X-Authenticated: #2218979
X-Provags-ID: V01U2FsdGVkX1/GlfYFrG7GrXlDI66kIUt+veVS4fdZ2rWJhJaDol
	pNp2EFdX5xDoWl
Message-ID: <48CA48B8.4060708@gmx.de>
Date: Fri, 12 Sep 2008 12:47:20 +0200
From: Thomas Kunze <thommycheck@gmx.de>
User-Agent: Mozilla-Thunderbird 2.0.0.16 (X11/20080724)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <69E6C70090A0A14498CC98FAE5E06B6E2B3B01@hiob.intern.dresearch.de>
In-Reply-To: <69E6C70090A0A14498CC98FAE5E06B6E2B3B01@hiob.intern.dresearch.de>
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.6
Subject: Re: Some beginners problems
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
X-List-Received-Date: Fri, 12 Sep 2008 10:50:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Sledz, Steffen wrote:
> I'm new to the OpenEmbedded system so please forgive me if my questions are FAQ or this is the wrong list.
>
> OE ist set up and I'm able to build images running on the target machines. But I'm looking for some guidance for the following problems.
>
> -------------------------------------------------
> 1. Problem
>
> I wan't to make an image (e.g. minimal-image) for atngw100 but with different linux kernel configuration (e.g. CONFIG_EXT2_FS=y). What's th right way to do this?
>
> * Just edit packages/linux/linux-2.6.24/atngw100/defconfig?
>   
Yes. But don't forget to increase the PR. Otherwise bitbake doesn't know 
that the recipe was changed and doesn't rebuild it.
> * Create an additional patch and a new bbfile (or modify existing one)?
> * Change something in local.conf?
> * Something else ... ?
>
> -------------------------------------------------
> 2. Problem
>
> I want't make a special patched dbus (in addition to the standard installation). What's the best way here?
>
> * Create an own package just using the same source archives?
> * Add a patch file to the existing package and modify the bbfile?
> * Something else ... ?
>   
Depends if you need the original dbus package too or not. If you need it 
create a new package and if not just add a patch to the old one
(and don't forget to increase PR).
> -------------------------------------------------
>
> It would be nice to separate the changes not mentioned to become upstreamed from the org.openembedded.dev git tree.
>   
The most effective way is to open a bug report for your patches. (and 
poke people on irc if nobody reacts)

Regards,
Thomas



