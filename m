Received: from hermes.mlbassoc.com ([76.76.67.137] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1NSXw6-0000OM-JN
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jan 2010 16:36:41 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 53DB11660362; Wed,  6 Jan 2010 08:34:35 -0700 (MST)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id 2BAEF166026D;
	Wed,  6 Jan 2010 08:34:35 -0700 (MST)
Message-ID: <4B44AD8B.7060902@mlbassoc.com>
Date: Wed, 06 Jan 2010 08:34:35 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.3a1pre) Gecko/20091228 Shredder/3.1a1pre
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <BAY127-W279A13B86B227AAF2D8080D8720@phx.gbl>
In-Reply-To: <BAY127-W279A13B86B227AAF2D8080D8720@phx.gbl>
X-SA-Exim-Connect-IP: 76.76.67.137
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: saleh usman <salehusman@hotmail.com>
Subject: Re: Problem using output of console-image
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
X-List-Received-Date: Wed, 06 Jan 2010 15:36:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/06/2010 08:25 AM, saleh usman wrote:
>
> Hi
> I've built console-image for omap5912osk machine but I am facing problem in using output.There are four folders named all, armv5te, i686, omap5912osk in /temp/deploy/glibc/ipk.and so many ipk files in these folders.
> Which files exactly I should use to run the output on my target platform and how to run these files.
> Wheather to install these files, any other package  or directly run them just by typing their names.
> Since
> linux is running on ARM9 GPP of machine ,should I take care of u-boot, kernel version or
> anything else to run generated output on my target platform
>

Start with the files in tmp/deploy/glibc/images/<platform>
There you should find the kernel (uImage) and file system.  Depending
on your configuration, there may be multiple choices for the file
system ranging from a raw tar file to JFFS2 or UBI images.  Which
you choose and how you deploy them are up to you (and are target
platform dependent)

For example, when running an image on the BeagleBoard (OMAP3530),
I put the kernel (uImage) and unpack the tar.bz2 file system to
an SD card and boot from that.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


